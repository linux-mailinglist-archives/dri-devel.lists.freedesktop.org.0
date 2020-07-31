Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C6233F7E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6592E6E9E3;
	Fri, 31 Jul 2020 06:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38B96E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:57:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E966ACA2;
 Fri, 31 Jul 2020 06:58:01 +0000 (UTC)
Subject: Re: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic
 mm manager.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-5-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
Date: Fri, 31 Jul 2020 08:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731040520.3701599-5-airlied@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1873569697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1873569697==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="njM5fS4chicj9DzKd7ss8qREk5i9AJ2cN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--njM5fS4chicj9DzKd7ss8qREk5i9AJ2cN
Content-Type: multipart/mixed; boundary="y635mWXkXFRnfeeIa0gCWFm4dr0GnHCXY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Message-ID: <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
Subject: Re: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic
 mm manager.
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-5-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-5-airlied@gmail.com>

--y635mWXkXFRnfeeIa0gCWFm4dr0GnHCXY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> This lets the generic mm manager be initialised by the driver.
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_manager.c | 23 ++++++++++++++++++++---
>  include/drm/ttm/ttm_bo_driver.h      |  3 +++
>  2 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm=
/ttm_bo_manager.c
> index facd3049c3aa..64234e5caee3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> @@ -104,8 +104,8 @@ static void ttm_bo_man_put_node(struct ttm_mem_type=
_manager *man,
>  	}
>  }
> =20
> -static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
> -			   unsigned long p_size)
> +static int ttm_bo_man_init_private(struct ttm_mem_type_manager *man,
> +		    unsigned long p_size)
>  {
>  	struct ttm_range_manager *rman;
> =20
> @@ -119,6 +119,23 @@ static int ttm_bo_man_init(struct ttm_mem_type_man=
ager *man,
>  	return 0;
>  }
> =20
> +int ttm_bo_man_init(struct ttm_bo_device *bdev,
> +		    struct ttm_mem_type_manager *man,
> +		    unsigned long p_size)
> +{
> +	int ret;
> +
> +	man->func =3D &ttm_bo_manager_func;

Overriding man->func is the only reason for drivers to call
ttm_bo_man_init_mm_base and ttm_bo_use_mm directly (e.g., as in nouveau)?=


If so, Wouldn't it be better to do

  if (!man->func)
      man->func =3D &ttm_bo_manager_func;

in ttm_bo_man_init and forget about the other fucntions?

Best regards
Thomas

> +
> +	ttm_bo_init_mm_base(bdev, man, p_size);
> +	ret =3D ttm_bo_man_init_private(man, p_size);
> +	if (ret)
> +		return ret;
> +	ttm_bo_use_mm(man);
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_man_init);
> +
>  static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
>  {
>  	struct ttm_range_manager *rman =3D (struct ttm_range_manager *) man->=
priv;
> @@ -147,7 +164,7 @@ static void ttm_bo_man_debug(struct ttm_mem_type_ma=
nager *man,
>  }
> =20
>  const struct ttm_mem_type_manager_func ttm_bo_manager_func =3D {
> -	.init =3D ttm_bo_man_init,
> +	.init =3D ttm_bo_man_init_private,
>  	.takedown =3D ttm_bo_man_takedown,
>  	.get_node =3D ttm_bo_man_get_node,
>  	.put_node =3D ttm_bo_man_put_node,
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> index 68e75c3b8c7a..5c4ccefd5393 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -799,6 +799,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_objec=
t *bo);
>   */
>  pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
> =20
> +int ttm_bo_man_init(struct ttm_bo_device *bdev,
> +		    struct ttm_mem_type_manager *man,
> +		    unsigned long p_size);
>  extern const struct ttm_mem_type_manager_func ttm_bo_manager_func;
> =20
>  #endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--y635mWXkXFRnfeeIa0gCWFm4dr0GnHCXY--

--njM5fS4chicj9DzKd7ss8qREk5i9AJ2cN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8jwOgUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPiiQf9Ggfb0OYWYb9dZFSXhQbN9HGkRALG
oyApXzbwOYxdXBZ1ZxNvA9DzoddwTZ+vAuY+Jou8NWpoXZtZRlIqC8+mypUfZc4T
7ofnFK5i/rar5HHKIrJ7zeFQX+p3zF2uUJ1F9Zwp4ggZczkFWW7hOCST7SPA7+qe
E/dVoJgiKp7OdHg4dbKzNyREcV5OjpoR2O3mRKdjT1ReZ7v+XqExiBe0ZzkNKi1P
qcv4Y6zsJRE26vrp7M0Rin/c+0JTr7fKlbgynkBg73EYVx12v7FsjspA7j9OG+oa
ebw5HdLueDToTIKLSHZ4/7fwsEDSSZ1l0eijBLlgObdk9o264fY4WHpGlg==
=b/uW
-----END PGP SIGNATURE-----

--njM5fS4chicj9DzKd7ss8qREk5i9AJ2cN--

--===============1873569697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1873569697==--
