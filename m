Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9622237F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 15:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E96EC5D;
	Thu, 16 Jul 2020 13:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231D66EC5D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 13:06:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EE93B711;
 Thu, 16 Jul 2020 13:06:04 +0000 (UTC)
Subject: Re: [PATCH 1/8] drm/ttm: remove TTM_MEMTYPE_FLAG_CMA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200716125037.67437-1-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c8d3bdb8-c07c-7a30-dd5b-42f2717b6151@suse.de>
Date: Thu, 16 Jul 2020 15:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0953309660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0953309660==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FmhlZCjrzDKghKe4pCERbW4RdJ79yHRWx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FmhlZCjrzDKghKe4pCERbW4RdJ79yHRWx
Content-Type: multipart/mixed; boundary="DERmTwSTypZuMRoMVd7zDhTB5ubMWRdFn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: Madhav.Chauhan@amd.com
Message-ID: <c8d3bdb8-c07c-7a30-dd5b-42f2717b6151@suse.de>
Subject: Re: [PATCH 1/8] drm/ttm: remove TTM_MEMTYPE_FLAG_CMA
References: <20200716125037.67437-1-christian.koenig@amd.com>
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>

--DERmTwSTypZuMRoMVd7zDhTB5ubMWRdFn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

this patchset could have benefited from a cover letter.

Am 16.07.20 um 14:50 schrieb Christian K=C3=B6nig:
> The original intention was to avoid CPU page table unmaps
> when BOs move between the GTT and SYSTEM domain.
>=20
> The problem is that this never correctly handled changes
> in the caching attributes or backing pages.
>=20
> Just drop this for now and simply unmap the CPU page
> tables in all cases.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_bo.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c        |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c               | 34 ++++------------------=

>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>  include/drm/ttm/ttm_bo_driver.h            |  1 -
>  6 files changed, 11 insertions(+), 35 deletions(-)

Why's CMA cleaned up in one patch and MAPPABLE in the other 7?

Wouldn't it have been better to kill both the flags from ttm in 2
patches, then have one patch per driver and finally remove both flags
from the ttm header?

Best regards
Thomas

>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> index 9c0f12f74af9..44fa8bc49d18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -93,7 +93,7 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  		man->func =3D &amdgpu_gtt_mgr_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
> +		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
> @@ -108,7 +108,7 @@ static int amdgpu_init_mem_type(struct ttm_bo_devic=
e *bdev, uint32_t type,
>  	case AMDGPU_PL_OA:
>  		/* On-chip GDS memory*/
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_CMA;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED;
>  		man->default_caching =3D TTM_PL_FLAG_UNCACHED;
>  		break;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> index a1037478fa3f..7883341f8c83 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -695,8 +695,7 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  				TTM_PL_FLAG_WC;
>  			man->default_caching =3D TTM_PL_FLAG_WC;
>  		} else {
> -			man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE |
> -				     TTM_MEMTYPE_FLAG_CMA;
> +			man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  			man->available_caching =3D TTM_PL_MASK_CACHING;
>  			man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		}
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> index 73085523fad7..54af06df865b 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -84,7 +84,7 @@ static int radeon_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  		man->func =3D &ttm_bo_manager_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
> +		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  #if IS_ENABLED(CONFIG_AGP)
>  		if (rdev->flags & RADEON_IS_AGP) {
>  			if (!rdev->ddev->agp) {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> index 8b9e7f62bea7..0768a054a916 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -272,20 +272,15 @@ static int ttm_bo_handle_move_mem(struct ttm_buff=
er_object *bo,
>  				  struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	bool old_is_pci =3D ttm_mem_reg_is_pci(bdev, &bo->mem);
> -	bool new_is_pci =3D ttm_mem_reg_is_pci(bdev, mem);
>  	struct ttm_mem_type_manager *old_man =3D &bdev->man[bo->mem.mem_type]=
;
>  	struct ttm_mem_type_manager *new_man =3D &bdev->man[mem->mem_type];
> -	int ret =3D 0;
> +	int ret;
> =20
> -	if (old_is_pci || new_is_pci ||
> -	    ((mem->placement & bo->mem.placement & TTM_PL_MASK_CACHING) =3D=3D=
 0)) {
> -		ret =3D ttm_mem_io_lock(old_man, true);
> -		if (unlikely(ret !=3D 0))
> -			goto out_err;
> -		ttm_bo_unmap_virtual_locked(bo);
> -		ttm_mem_io_unlock(old_man);
> -	}
> +	ret =3D ttm_mem_io_lock(old_man, true);
> +	if (unlikely(ret !=3D 0))
> +		goto out_err;
> +	ttm_bo_unmap_virtual_locked(bo);
> +	ttm_mem_io_unlock(old_man);
> =20
>  	/*
>  	 * Create and bind a ttm if required.
> @@ -1698,23 +1693,6 @@ EXPORT_SYMBOL(ttm_bo_device_init);
>   * buffer object vm functions.
>   */
> =20
> -bool ttm_mem_reg_is_pci(struct ttm_bo_device *bdev, struct ttm_mem_reg=
 *mem)
> -{
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> -
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED)) {
> -		if (mem->mem_type =3D=3D TTM_PL_SYSTEM)
> -			return false;
> -
> -		if (man->flags & TTM_MEMTYPE_FLAG_CMA)
> -			return false;
> -
> -		if (mem->placement & TTM_PL_FLAG_CACHED)
> -			return false;
> -	}
> -	return true;
> -}
> -
>  void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> index bfd0c54ec30a..6bea7548aee0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -762,7 +762,7 @@ static int vmw_init_mem_type(struct ttm_bo_device *=
bdev, uint32_t type,
>  		 *  slots as well as the bo size.
>  		 */
>  		man->func =3D &vmw_gmrid_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_CMA | TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> index 45522e4fbd6b..71b195e78c7c 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -47,7 +47,6 @@
> =20
>  #define TTM_MEMTYPE_FLAG_FIXED         (1 << 0)	/* Fixed (on-card) PCI=
 memory */
>  #define TTM_MEMTYPE_FLAG_MAPPABLE      (1 << 1)	/* Memory mappable */
> -#define TTM_MEMTYPE_FLAG_CMA           (1 << 3)	/* Can't map aperture =
*/
> =20
>  struct ttm_mem_type_manager;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DERmTwSTypZuMRoMVd7zDhTB5ubMWRdFn--

--FmhlZCjrzDKghKe4pCERbW4RdJ79yHRWx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8QULcUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNJ6Af+LFdlDQJAAithaN4MBT6A+5wOQHaL
Dm+z+3IceDIF+DfcJCkMQPK66YUHH4UCg5xicmzPuphsW1dlzVMag1M1OSdUy9H3
s4pEVBcaWj9DzE9ZO2uZJo5zbhtQfCu31ka+XBQ65LvJFUbydvooIWy1yF6ZBp/C
0k5ltSEndYedq7HnR/CGxTjTLplbbk1sCjqQvAk//FtTFAw5C5kO8QgNfQqqKml5
+DfyzzQ1w4SyVc5JfzCnuVcr56baLwnRlOmnM4fKcK22y7m+FMfFBn16mWPqVy2C
2rzE1AhDf/J4LPNC4cvcEYWyIu0eAqElTSIsQo5o80zC5oGvs04Tz2Veqw==
=sGJ8
-----END PGP SIGNATURE-----

--FmhlZCjrzDKghKe4pCERbW4RdJ79yHRWx--

--===============0953309660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0953309660==--
