Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804466577DC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 15:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D8010E1B0;
	Wed, 28 Dec 2022 14:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4000010E1B0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iptCw7uYULsfzr0zvc8R1eicmlCBmbSGFclRDIlK2J8=; b=rV3c6Bnbk//BG7zpsX9A0wUELI
 T49xO1IuGkZTe23PjsPtHNTnMgWtH178X0yHZ+7Be9Dgx4qmogQqV9W9L+zBgq3d8o7Yc1AZkz4KH
 g2q4h5oHcXv4yPe8JFWD4M2aagc+QkGp3uxUT5Mps9RDRashb4m+aiEtKZidIDpWzF0GUEQHF5s8P
 0DMGErqDbkC1o+/aMF6gdPv8MgISCGBq1S4TXbYB12SI/rjeoYIP7Op8IdQLfMZ+619VlzNj20yux
 UrXUF4TKlt5Ij2Ej5oob3m6DKEu1B2Piy+byv6r3bQMgr2TNTUWSHFhIcgkZPyzQ0H+bInl/YRhxR
 F4+41FjQ==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pAXWX-00BhBN-Ct; Wed, 28 Dec 2022 15:35:17 +0100
Date: Wed, 28 Dec 2022 13:35:09 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/v3d: replace open-coded implementation of
 drm_gem_object_lookup
Message-ID: <20221228143509.dsxjhstx54olxaek@mail.igalia.com>
References: <20221227200010.191351-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ocnoqdzfv4t6xfq"
Content-Disposition: inline
In-Reply-To: <20221227200010.191351-1-mcanal@igalia.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4ocnoqdzfv4t6xfq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/27, Ma=EDra Canal wrote:
> As v3d_submit_tfu_ioctl() performs the same steps as drm_gem_object_looku=
p(),
> replace the open-code implementation in v3d with its DRM core equivalent.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 6e152ef26358..5da1806f3969 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -861,7 +861,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
> =20
>  	job->args =3D *args;
> =20
> -	spin_lock(&file_priv->table_lock);
>  	for (job->base.bo_count =3D 0;
>  	     job->base.bo_count < ARRAY_SIZE(args->bo_handles);
>  	     job->base.bo_count++) {
> @@ -870,20 +869,16 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *=
data,
>  		if (!args->bo_handles[job->base.bo_count])
>  			break;
> =20
> -		bo =3D idr_find(&file_priv->object_idr,
> -			      args->bo_handles[job->base.bo_count]);
> +		bo =3D drm_gem_object_lookup(file_priv, args->bo_handles[job->base.bo_=
count]);
>  		if (!bo) {
>  			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
>  				  job->base.bo_count,
>  				  args->bo_handles[job->base.bo_count]);
>  			ret =3D -ENOENT;
> -			spin_unlock(&file_priv->table_lock);
>  			goto fail;
>  		}
> -		drm_gem_object_get(bo);
>  		job->base.bo[job->base.bo_count] =3D bo;
>  	}
> -	spin_unlock(&file_priv->table_lock);

Hi Ma=EDra,

Thanks for you patch.

LGTM

Reviewed-by: Melissa Wen <mwen@igalia.com>

> =20
>  	ret =3D v3d_lock_bo_reservations(&job->base, &acquire_ctx);
>  	if (ret)
> --=20
> 2.38.1
>=20

--4ocnoqdzfv4t6xfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOsVBcACgkQwqF3j0dL
ehzAxg/7BXHh50qfr4ydYNx+G7hl7xQMGFB3ZIQWHJi+QaxyxzXOwS2ApLHptoK3
ICWSKr2ptv0bQmfB3/aWUvsqdPxGMzs5uippUszShE2qBHZb0UBWejCG5XZA7ine
68Jc8g5qaw7yuV13vk0wB1E+4T17EbweX6IHyelYcIGQhAkmWoVuGIOd26vuJ7pk
MfD/shsg4OQodHKzYGZyjT+2fDtCQq5LkOD3W7I5G1pvoC5Ir5hPIZZUTe7qHYcv
PdNDIOOfvzQ0GX1m1nx+JcU4+0q2fHvjTeTj/4DdyVIaS2g33KimzmbbPmfC2QoJ
4SNWI9kEJkOt/8lhroPaaByNv6WRUAtV8EV6mP+8QuI78LVkbvn9pRbXjtKKhQgP
wllpI9lBopxGO9zrHHW5pVwfn30wls/U5+amMzqwPNruWIrpm52voxUuCM/b72bc
Tn1cr+VvBwBMfNtyOyPekAbx1Vt/G/cWYdLs+RS9kbswe5MZuPolVQzv+TtaAqvB
/V09taCs97QHjCnQM0YVqPTN3wvI+JbEKJc2QpF4xUMQcQXuXJCPdX4yMelxI36U
WVFFPYyJ8KSUUtaPPVuwzqS8GBWXQbcdv3oWM9Gay/2VfPl24vuPpG+CCy1YWvJ3
NppJUF2InYBssVzxwgtEM7LUHsVcUcWHLUG6/06zJfOl2LOQrGc=
=rRZn
-----END PGP SIGNATURE-----

--4ocnoqdzfv4t6xfq--
