Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B422BE42
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 08:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B556E911;
	Fri, 24 Jul 2020 06:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7666E90D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 06:51:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A25B6AC20;
 Fri, 24 Jul 2020 06:51:30 +0000 (UTC)
Subject: Re: [PATCH 8/9] drm/vram-helper: stop implementing init_mem_type
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-9-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a9d4e73b-d4bd-1bbe-0538-1ac21cfac1a5@suse.de>
Date: Fri, 24 Jul 2020 08:51:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723151710.3591-9-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1124644735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1124644735==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VO6AOLXQ2CvzIZNw1AQ2F0SvI7EDOPOW0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VO6AOLXQ2CvzIZNw1AQ2F0SvI7EDOPOW0
Content-Type: multipart/mixed; boundary="lnCfpMnE8A2DRgujLLyTOCgrU4Gjhly8e";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <a9d4e73b-d4bd-1bbe-0538-1ac21cfac1a5@suse.de>
Subject: Re: [PATCH 8/9] drm/vram-helper: stop implementing init_mem_type
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-9-christian.koenig@amd.com>
In-Reply-To: <20200723151710.3591-9-christian.koenig@amd.com>

--lnCfpMnE8A2DRgujLLyTOCgrU4Gjhly8e
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 23.07.20 um 17:17 schrieb Christian K=C3=B6nig:
> Instead just initialize the memory type parameters
> before calling ttm_bo_init_mm.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 801a14c6e9e0..f7f93a49cd7f 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1007,18 +1007,6 @@ static struct ttm_tt *bo_driver_ttm_tt_create(st=
ruct ttm_buffer_object *bo,
>  static int bo_driver_init_mem_type(struct ttm_bo_device *bdev, uint32_=
t type,
>  				   struct ttm_mem_type_manager *man)
>  {
> -	switch (type) {
> -	case TTM_PL_SYSTEM:
> -		break;
> -	case TTM_PL_VRAM:
> -		man->func =3D &ttm_bo_manager_func;
> -		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
> -					 TTM_PL_FLAG_WC;
> -		man->default_caching =3D TTM_PL_FLAG_WC;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
>  	return 0;
>  }
> =20
> @@ -1126,6 +1114,7 @@ EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
>  static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device=
 *dev,
>  			    uint64_t vram_base, size_t vram_size)
>  {
> +	struct ttm_mem_type_manager *man =3D &vmm->bdev.man[TTM_PL_VRAM];
>  	int ret;
> =20
>  	vmm->vram_base =3D vram_base;
> @@ -1138,6 +1127,9 @@ static int drm_vram_mm_init(struct drm_vram_mm *v=
mm, struct drm_device *dev,
>  	if (ret)
>  		return ret;
> =20
> +	man->func =3D &ttm_bo_manager_func;
> +	man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> +	man->default_caching =3D TTM_PL_FLAG_WC;
>  	ret =3D ttm_bo_init_mm(&vmm->bdev, TTM_PL_VRAM, vram_size >> PAGE_SHI=
FT);
>  	if (ret)
>  		return ret;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lnCfpMnE8A2DRgujLLyTOCgrU4Gjhly8e--

--VO6AOLXQ2CvzIZNw1AQ2F0SvI7EDOPOW0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ahOkUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM64wgAk2D7S2hBEMVDDfHpTWGNV7Pg+Aww
Y7L2oTBte6G4xo5H8icUo6CAvzVRttXK1tcnmv6V3whVEEsoTjnrDaRHrVjqTjvs
99sn9/l2EP1bWrYb9D3dTkVh88XkYYPM1K/Vh/3w0/GZviHs6+G7ZDaj/ez61xFC
CJ02vPL1J7WAUaCy/ZEOjzycms4X2rSbrIf7RkJ9BlIJzswPT3mZrnNjIvUWBFPx
B9BMHSXBnTkJfHtVNY6tmSrKzSHOXDREuX0ztaeDm83MFu4kjJjkt/4OKBFCfEvh
vxYNstQo0Anx7uJ9QB9rKIDbX03653AKYHP2xdBm8FIFR/IXjcT2dGpjdA==
=uf1Z
-----END PGP SIGNATURE-----

--VO6AOLXQ2CvzIZNw1AQ2F0SvI7EDOPOW0--

--===============1124644735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1124644735==--
