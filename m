Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE8273B12
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 08:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44689E0E;
	Tue, 22 Sep 2020 06:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E029E89E0E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:44:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1011ABA2;
 Tue, 22 Sep 2020 06:45:29 +0000 (UTC)
Subject: Re: [PATCH 06/11] drm/vram-helper: switch over to the new pin
 interface
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, bskeggs@redhat.com,
 kraxel@redhat.com, airlied@redhat.com, sroland@vmware.com
References: <20200921144856.2797-1-christian.koenig@amd.com>
 <20200921144856.2797-7-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cb2680fc-4a9c-5ede-6c20-f950a1465d05@suse.de>
Date: Tue, 22 Sep 2020 08:44:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921144856.2797-7-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0378860791=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0378860791==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ESmj9IPqRvweqZO7IDF11ns35rdYY95XZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ESmj9IPqRvweqZO7IDF11ns35rdYY95XZ
Content-Type: multipart/mixed; boundary="e2AHQMX7OlRSJfsvXDg7pnuqnDUHJrHjs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, bskeggs@redhat.com,
 kraxel@redhat.com, airlied@redhat.com, sroland@vmware.com
Message-ID: <cb2680fc-4a9c-5ede-6c20-f950a1465d05@suse.de>
Subject: Re: [PATCH 06/11] drm/vram-helper: switch over to the new pin
 interface
References: <20200921144856.2797-1-christian.koenig@amd.com>
 <20200921144856.2797-7-christian.koenig@amd.com>
In-Reply-To: <20200921144856.2797-7-christian.koenig@amd.com>

--e2AHQMX7OlRSJfsvXDg7pnuqnDUHJrHjs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.09.20 um 16:48 schrieb Christian K=C3=B6nig:
> Stop using TTM_PL_FLAG_NO_EVICT.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 37 +++++++--------------------=

>  include/drm/drm_gem_vram_helper.h     |  3 ---
>  2 files changed, 9 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 50cad0e4a92e..bd3dd17ad81d 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -301,7 +301,7 @@ static u64 drm_gem_vram_pg_offset(struct drm_gem_vr=
am_object *gbo)
>   */
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>  {
> -	if (WARN_ON_ONCE(!gbo->pin_count))
> +	if (WARN_ON_ONCE(!gbo->bo.pin_count))
>  		return (s64)-ENODEV;
>  	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
>  }
> @@ -310,24 +310,21 @@ EXPORT_SYMBOL(drm_gem_vram_offset);
>  static int drm_gem_vram_pin_locked(struct drm_gem_vram_object *gbo,
>  				   unsigned long pl_flag)
>  {
> -	int i, ret;
>  	struct ttm_operation_ctx ctx =3D { false, false };
> +	int ret;
> =20
> -	if (gbo->pin_count)
> +	if (gbo->bo.pin_count)
>  		goto out;
> =20
>  	if (pl_flag)
>  		drm_gem_vram_placement(gbo, pl_flag);
> =20
> -	for (i =3D 0; i < gbo->placement.num_placement; ++i)
> -		gbo->placements[i].flags |=3D TTM_PL_FLAG_NO_EVICT;
> -
>  	ret =3D ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
>  	if (ret < 0)
>  		return ret;
> =20
>  out:
> -	++gbo->pin_count;
> +	ttm_bo_pin(&gbo->bo);
> =20
>  	return 0;
>  }
> @@ -369,26 +366,9 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *g=
bo, unsigned long pl_flag)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_pin);
> =20
> -static int drm_gem_vram_unpin_locked(struct drm_gem_vram_object *gbo)
> +static void drm_gem_vram_unpin_locked(struct drm_gem_vram_object *gbo)=

>  {
> -	int i, ret;
> -	struct ttm_operation_ctx ctx =3D { false, false };
> -
> -	if (WARN_ON_ONCE(!gbo->pin_count))
> -		return 0;
> -
> -	--gbo->pin_count;
> -	if (gbo->pin_count)
> -		return 0;
> -
> -	for (i =3D 0; i < gbo->placement.num_placement ; ++i)
> -		gbo->placements[i].flags &=3D ~TTM_PL_FLAG_NO_EVICT;
> -
> -	ret =3D ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	ttm_bo_unpin(&gbo->bo);
>  }
> =20
>  /**
> @@ -406,10 +386,11 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object=
 *gbo)
>  	ret =3D ttm_bo_reserve(&gbo->bo, true, false, NULL);
>  	if (ret)
>  		return ret;
> -	ret =3D drm_gem_vram_unpin_locked(gbo);
> +
> +	drm_gem_vram_unpin_locked(gbo);
>  	ttm_bo_unreserve(&gbo->bo);
> =20
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
> =20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 62cc6e6c3a4f..128f88174d32 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -35,7 +35,6 @@ struct vm_area_struct;
>   * @placement:	TTM placement information. Supported placements are \
>  	%TTM_PL_VRAM and %TTM_PL_SYSTEM
>   * @placements:	TTM placement information.
> - * @pin_count:	Pin counter
>   *
>   * The type struct drm_gem_vram_object represents a GEM object that is=

>   * backed by VRAM. It can be used for simple framebuffer devices with
> @@ -64,8 +63,6 @@ struct drm_gem_vram_object {
>  	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
>  	struct ttm_placement placement;
>  	struct ttm_place placements[2];
> -
> -	int pin_count;
>  };
> =20
>  /**
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--e2AHQMX7OlRSJfsvXDg7pnuqnDUHJrHjs--

--ESmj9IPqRvweqZO7IDF11ns35rdYY95XZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9pnWQUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOCMAf/RkmRVbDScVHBAF+CIgMu682T4SL8
ExIrtaezF5als4YWZmROoBekLwz+hmyUOtux7P4yxVxiqKg8nu3QIkLgq5D7c8sV
6nfh5Q7e9EHbGQkX/ykFdOAASFvQSzR6iYJJYAt0rZk1HA7Jl1wSn07pAKPjgs7g
fMskzFpQBJM6tHmHIJeevdIQbok29GX0HPOx/14Aka2lKuiH0BPdPVlYUWiyAA1p
b8XcqzKNyMnILi1HHCn+fvD+kuDqnsfHhX5atQf1zTQO+NIaZbfBPYH9c8V4fZJW
ENxnjXwmdPIxnhYsmc714GDog/o918LWi9WR4U6/h4R/zMdWMQyfwUUgow==
=ghv6
-----END PGP SIGNATURE-----

--ESmj9IPqRvweqZO7IDF11ns35rdYY95XZ--

--===============0378860791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0378860791==--
