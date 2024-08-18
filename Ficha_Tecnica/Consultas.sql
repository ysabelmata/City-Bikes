-------------Consultas Proyecto---------------------

-----duplicados----
#Query para excluir la variable sex de user_info
SELECT
  bikeid,
  COUNT(*) AS cantidad
FROM
  `Dataset.view_citi_bike_trips`
GROUP BY
  bikeid
HAVING
  COUNT(*) >1;

------metricas_uso_diario------
SELECT
MIN(tripduration_minutos) AS MIN_DURACION_VIAJE,
MAX(tripduration_minutos) AS MAX_DURACION_VIAJE,
AVG(tripduration_minutos) AS AVG_DURACION_VIAJE,
STDDEV(tripduration_minutos) AS DESV_ESTANDAR_DURACION_VIAJE,
FROM `Dataset.view_citi_bike_trips`

----nulos----
select 
countif(bikeid is null) as null_bikeid,
countif(birth_year is null) as null_birth_year,
countif(tripduration is null) as null_tripduration,
countif(start_station_id is null) as null_start_statio_id,
countif(end_station_id is null) as null_end_station_id
from `Dataset.city_bike_trips`

------nulos edad >80 --------
SELECT 
  *
FROM 
  `Dataset.view_citi_bike_trips`
WHERE 
  birth_year IS NULL 
  OR (EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year) > 80;


-----promedio_viajes---
  ---query para numero promedio de viajes por dia 
SELECT 
  stopdate AS trip_date,
  COUNT(*) AS total_trips,
  ROUND(AVG(COUNT(*)) OVER(),1) AS average_daily_trips
FROM 
  `Dataset.view_citi_bike_trips`
GROUP BY 
  trip_date
ORDER BY 
  trip_date;


--total_viajes-----
---query total de viajes Según el Género -----
SELECT 
  gender,
  COUNT(*) AS total_viajes
FROM 
  `Dataset.view_citi_bike_trips`
GROUP BY 
  gender;

----Edad-----
SELECT 
  CASE 
    WHEN birth_year IS NOT NULL THEN
      FLOOR((EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year) / 10) * 10
    ELSE NULL
  END AS rango_edad,
  COUNT(*) AS total_viajes
FROM 
  `Dataset.view_citi_bike_trips`
GROUP BY 
  rango_edad
ORDER BY 
  rango_edad;

-----Tipo de Suscripción de los Usuarios----
SELECT 
 usertype,
  COUNT(*) AS total_viajes
FROM 
    `Dataset.view_citi_bike_trips`
GROUP BY 
  usertype;


---varias----

 SELECT 
  bikeid,
  COUNT(*) AS count_per_bike_id
FROM 
  `Dataset.view_consolidado_sin_nulos`
GROUP BY 
  bikeid
HAVING 
  COUNT(*) > 1;



