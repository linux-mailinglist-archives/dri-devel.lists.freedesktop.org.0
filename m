Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7071276A1D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7F989341;
	Thu, 24 Sep 2020 07:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DD789341
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 07:10:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DC49AA55;
 Thu, 24 Sep 2020 07:11:29 +0000 (UTC)
Subject: Re: [PATCH 35/45] drm/vram-helper: move to invalidate callback.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-36-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e6e66c4f-2f76-504b-b054-b72fd0253895@suse.de>
Date: Thu, 24 Sep 2020 09:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924051845.397177-36-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1688480953=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1688480953==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Kh7xKd4CHWwx3rOsdeY1Nckh6ESraZimi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Kh7xKd4CHWwx3rOsdeY1Nckh6ESraZimi
Content-Type: multipart/mixed; boundary="bOH1lNVYu3OSu0hkLkdOS1HhCbpe9phX4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Message-ID: <e6e66c4f-2f76-504b-b054-b72fd0253895@suse.de>
Subject: Re: [PATCH 35/45] drm/vram-helper: move to invalidate callback.
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-36-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-36-airlied@gmail.com>

--bOH1lNVYu3OSu0hkLkdOS1HhCbpe9phX4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.09.20 um 07:18 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 5d4182f5c22f..9d4100071e1d 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -433,7 +433,7 @@ static void drm_gem_vram_kunmap_locked(struct drm_g=
em_vram_object *gbo)
>  	 * Permanently mapping and unmapping buffers adds overhead from
>  	 * updating the page tables and creates debugging output. Therefore,
>  	 * we delay the actual unmap operation until the BO gets evicted
> -	 * from memory. See drm_gem_vram_bo_driver_move_notify().
> +	 * from memory. See drm_gem_vram_bo_driver_invalidate_notify().
>  	 */
>  }
> =20
> @@ -585,9 +585,7 @@ static void drm_gem_vram_bo_driver_evict_flags(stru=
ct drm_gem_vram_object *gbo,
>  	*pl =3D gbo->placement;
>  }
> =20
> -static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_obj=
ect *gbo,
> -					       bool evict,
> -					       struct ttm_resource *new_mem)
> +static void drm_gem_vram_bo_driver_invalidate_notify(struct drm_gem_vr=
am_object *gbo)
>  {
>  	struct ttm_bo_kmap_obj *kmap =3D &gbo->kmap;
> =20
> @@ -605,7 +603,7 @@ static int drm_gem_vram_bo_driver_move(struct drm_g=
em_vram_object *gbo,
>  				       struct ttm_operation_ctx *ctx,
>  				       struct ttm_resource *new_mem)
>  {
> -	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
> +	drm_gem_vram_bo_driver_invalidate_notify(gbo);
>  	return ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
>  }

I don't fully understand TTM's order of operation, so this might be a
dumb question: why is invalidate_notify() called from within the move()
callback? I'd expect that the invalidate_notify() callback is called by
TTM before moving the BO?

> =20
> @@ -956,9 +954,7 @@ static void bo_driver_evict_flags(struct ttm_buffer=
_object *bo,
>  	drm_gem_vram_bo_driver_evict_flags(gbo, placement);
>  }
> =20
> -static void bo_driver_move_notify(struct ttm_buffer_object *bo,
> -				  bool evict,
> -				  struct ttm_resource *new_mem)
> +static void bo_driver_invalidate_notify(struct ttm_buffer_object *bo)
>  {
>  	struct drm_gem_vram_object *gbo;
> =20
> @@ -968,7 +964,7 @@ static void bo_driver_move_notify(struct ttm_buffer=
_object *bo,
> =20
>  	gbo =3D drm_gem_vram_of_bo(bo);
> =20
> -	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
> +	drm_gem_vram_bo_driver_invalidate_notify(gbo);
>  }
> =20
>  static int bo_driver_move(struct ttm_buffer_object *bo,
> @@ -1008,7 +1004,7 @@ static struct ttm_bo_driver bo_driver =3D {
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D bo_driver_evict_flags,
>  	.move =3D bo_driver_move,
> -	.move_notify =3D bo_driver_move_notify,
> +	.invalidate_notify =3D bo_driver_invalidate_notify,
>  	.io_mem_reserve =3D bo_driver_io_mem_reserve,
>  };
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--bOH1lNVYu3OSu0hkLkdOS1HhCbpe9phX4--

--Kh7xKd4CHWwx3rOsdeY1Nckh6ESraZimi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9sRnoUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOtLQf/aNguTOTVuBEj/l5Qj2WeVX7FWMkm
oJglrX/Pikr2nPPqPmeR3o+Iy2JSIZ+Zoen1CVptI+g0G2sCOrUrdYa9XBVR+pGO
sxhdyBmLW2u+mOF+hk5qED7Pgo1STpJuLSzDtfTiJ+gs3KuaSfmwa3psD6a4jddP
5xiCyQlVjo8S73jH1QPvhIYXFRL5bj8eZ6DM2CCtySIi+0Q4QJAEGHZMfAQWnGhK
PVhJTRR29bhL0fszXi2o2ZjVScH3rm2igMarfK7FLF3xUzpYXCtF2jd9w7cQDqSQ
6XMDrkKV2IwCp0gaPRdoMEG0YVxMrYxrZmOvGMasHrqpEA6Wyi8DEqTXaw==
=mFi8
-----END PGP SIGNATURE-----

--Kh7xKd4CHWwx3rOsdeY1Nckh6ESraZimi--

--===============1688480953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1688480953==--
