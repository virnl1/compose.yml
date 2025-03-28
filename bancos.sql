CREATE TABLE turma (
    id SERIAL PRIMARY KEY,
    anos_semestre VARCHAR(7) NOT NULL,  -- Supondo que seja um formato tipo '2025-1'
    capacidade INTEGER NOT NULL,
    sigla VARCHAR(35) NOT NULL  -- Usando VARCHAR para sigla
);
CREATE TABLE sala (
    cod_sala INT PRIMARY KEY,
    capacidade INTEGER NOT NULL
);
CREATE TABLE predio (
    cod_predio INT PRIMARY KEY,
    endereco VARCHAR(35)
);

CREATE TABLE disciplina (
    nome VARCHAR(25),
    cod_disci INT NOT NULL PRIMARY KEY
);
CREATE TABLE curriculo (
    cod_curri INT PRIMARY KEY,
    graduacao VARCHAR(264),
    faculdade VARCHAR(264),
    ano_graduacao DATE
);

CREATE TABLE curso(
    cod_curso int unique ,
    nome varchar(10) ,
)
ALTER TABLE sala 
ADD COLUMN id_predio INT, 
ADD CONSTRAINT fk_sala_predio FOREIGN KEY (id_predio) REFERENCES predio (cod_predio);
ALTER TABLE turma 
ADD COLUMN id_sala INT, 
ADD CONSTRAINT fk_turma_sala FOREIGN KEY (id_sala) REFERENCES sala (id_sala);
ALTER TABLE disciplina 
ADD COLUMN id_turma INT, 
ADD CONSTRAINT fk_disciplina_turma FOREIGN KEY (id_turma) REFERENCES sala (id_sala);
ALTER TABLE curriculo 
ADD COLUMN id_disci INT, 
ADD CONSTRAINT fk_curriculo_disciplina FOREIGN KEY (id_disci) REFERENCES disciplina (cod_disci);