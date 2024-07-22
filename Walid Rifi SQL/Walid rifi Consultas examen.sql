
-- crear base de datos
CREATE DATABASE EXAMEN;

-- usar base de datos
USE EXAMEN;

-- crear tabla libros

CREATE TABLE Libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    autor VARCHAR(50) NOT NULL,
    año_de_publicacion INT NOT NULL
);

-- crear tabla clientes

CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- enlazar muchos libros un cliente

ALTER TABLE Libros ADD COLUMN cliente_id INT;


ALTER TABLE Libros ADD CONSTRAINT fk_cliente
FOREIGN KEY (cliente_id) REFERENCES Clientes(id);

-- Rellenar autores y libros

INSERT INTO Libros (titulo, autor, año_de_publicacion, cliente_id) VALUES
('The Joy Luck Club', 'Amy Tan', 1990, NULL),
('The Da Vinci Code', 'Dan Brown', 2003, NULL),
('Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', 1999, NULL),
('The Road', 'Cormac McCarthy', 2006, NULL),
('The Kite Runner', 'Khaled Hosseini', 2003, NULL),
('Life of Pi', 'Yann Martel', 2001, NULL),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 2005, NULL);

-- Rellenar Clientes

INSERT INTO Clientes (nombre, email) VALUES
('John Doe', 'john.doe@gmail.com'),
('Jane Smith', 'jane.smith@yahoo.com'),
('Robert Brown', 'robert.brown@outlook.com'),
('Emily Johnson', 'emily.johnson@company.com');

-- Consultas ejercicio 5



-- 5.1- Obtener los libros publicados después de 2005

SELECT * FROM Libros
WHERE año_de_publicacion > 2005;

-- 5.2- Obtener los clientes cuyo nombre contiene la letra “e”

SELECT * FROM Clientes
WHERE nombre LIKE '%e%';

-- 5.3- Contar el número total de libros

SELECT COUNT(*) AS total_libros
FROM Libros;

-- 5.4- ¿Cuál es el título del libro con el ID 3?

SELECT titulo
FROM Libros
WHERE id = 3;

-- 5.5- ¿Cuántos clientes tienen una dirección de correo electrónico que termina en “@gmail.com”?

SELECT COUNT(*) AS total_gmail
FROM Clientes
WHERE email LIKE '%@gmail.com';

-- 5.6- ¿Cuál es el título del libro más antiguo?

SELECT titulo
FROM Libros
ORDER BY año_de_publicacion ASC
LIMIT 1;


-- 5.7- JOIN: Obtener los libros junto con los nombres de los clientes que los poseen


SELECT Libros.titulo, Libros.autor, Libros.año_de_publicacion, Clientes.nombre
FROM Libros
JOIN Clientes ON Libros.cliente_id = Clientes.id;



-- Añadir cliente
INSERT INTO Clientes (nombre, email) VALUES
('Walid Rifi', 'wilson_rifi@gmail.com');

-- 5.8- JOIN: Obtener los clientes que no tienen libros

SELECT Clientes.id, Clientes.nombre, Clientes.email
FROM Clientes
LEFT JOIN Libros ON Clientes.id = Libros.cliente_id
WHERE Libros.id IS NULL;





