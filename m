Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E705222341
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 15:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73496E262;
	Thu, 16 Jul 2020 13:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E66B6E262
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 13:01:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81DE3AEB6;
 Thu, 16 Jul 2020 13:01:40 +0000 (UTC)
Subject: Re: [PATCH 7/8] drm/vram-helper: stop using TTM_MEMTYPE_FLAG_MAPPABLE
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200716125037.67437-1-christian.koenig@amd.com>
 <20200716125037.67437-7-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2bb199ba-56fe-ea94-6bc4-35ddbb999c0a@suse.de>
Date: Thu, 16 Jul 2020 15:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716125037.67437-7-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: multipart/mixed; boundary="===============0230590168=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0230590168==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zJAyMyHtL7inqCEWLcYr0LXON24OlYzhh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zJAyMyHtL7inqCEWLcYr0LXON24OlYzhh
Content-Type: multipart/mixed; boundary="fzumEkAxdoDxM8jSaO8H3oPYdHTKdoT0d";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: Madhav.Chauhan@amd.com
Message-ID: <2bb199ba-56fe-ea94-6bc4-35ddbb999c0a@suse.de>
Subject: Re: [PATCH 7/8] drm/vram-helper: stop using TTM_MEMTYPE_FLAG_MAPPABLE
References: <20200716125037.67437-1-christian.koenig@amd.com>
 <20200716125037.67437-7-christian.koenig@amd.com>
In-Reply-To: <20200716125037.67437-7-christian.koenig@amd.com>

--fzumEkAxdoDxM8jSaO8H3oPYdHTKdoT0d
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 16.07.20 um 14:50 schrieb Christian K=C3=B6nig:
> The helper doesn't expose any not-mapable memory resources.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index e62a2b68fe3a..b6e4e49027aa 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1017,14 +1017,13 @@ static int bo_driver_init_mem_type(struct ttm_b=
o_device *bdev, uint32_t type,
>  {
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
> -			     TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> @@ -1067,12 +1066,8 @@ static void bo_driver_move_notify(struct ttm_buf=
fer_object *bo,
>  static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
>  				    struct ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D bdev->man + mem->mem_type;
>  	struct drm_vram_mm *vmm =3D drm_vram_mm_of_bdev(bdev);
> =20
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;
> -
>  	mem->bus.addr =3D NULL;
>  	mem->bus.size =3D mem->num_pages << PAGE_SHIFT;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--fzumEkAxdoDxM8jSaO8H3oPYdHTKdoT0d--

--zJAyMyHtL7inqCEWLcYr0LXON24OlYzhh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8QT6cUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPgYggArKs5XUKgnxRKkWEW7jgq+thGucMg
vUVKkYHWycGy9A+AAodanbvXxIceDQCCfXDwBpj07LVDR7nh58NX+FLLIk0zKEVg
HzW9z8GeBD90E/rE+CJ5BhUeF8LqUlHrzSc5sZP7oPB6P94FJQHvX9v3w/UFw1bM
RyHkxkCvarzNl0HyDNyNu4WZlJj4jQnqVKQC/d8PhW416wovbXKGEntys663KfRK
nJXFYb5+33xA1xJQXVwNm+173DApWyvCfFgKolscgFxWgVSwiMUMK+4lvQZW2vC5
u4L2NVBjL7ACG84+oQpPQcvJT0wI6qgniPcd0ZeK4+bjYBYtnIan1Aulew==
=Mcro
-----END PGP SIGNATURE-----

--zJAyMyHtL7inqCEWLcYr0LXON24OlYzhh--

--===============0230590168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0230590168==--
