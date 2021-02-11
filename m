Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779F318DA5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 15:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528516EE3E;
	Thu, 11 Feb 2021 14:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4A6EE3D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 14:53:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0519AC69;
 Thu, 11 Feb 2021 14:53:00 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20210211131659.276275-1-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
Message-ID: <365e99a6-24c4-33b5-ae9c-15904b056b89@suse.de>
Date: Thu, 11 Feb 2021 15:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211131659.276275-1-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1980456541=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1980456541==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bxRNTWa33kp87W9DmvSN6Z4Zs4KB9kGwf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bxRNTWa33kp87W9DmvSN6Z4Zs4KB9kGwf
Content-Type: multipart/mixed; boundary="TzASDz8ukRldPzltfMFE91NTxfUCslulf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
Message-ID: <365e99a6-24c4-33b5-ae9c-15904b056b89@suse.de>
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
References: <20210211131659.276275-1-christian.koenig@amd.com>
In-Reply-To: <20210211131659.276275-1-christian.koenig@amd.com>

--TzASDz8ukRldPzltfMFE91NTxfUCslulf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.02.21 um 14:16 schrieb Christian K=C3=B6nig:
> Swapping bo->mem was completely unecessary. Cleanup the function which
> is just a leftover from a TTM cleanup.

Yes this was introduced in a recent cleanup effort. Can you explain what =

the code intends to do? It seems as if it tries to "re-unmap the BO" if=20
the move_memcpy fails.

If the move_memcpy fails now, it seems like we can live without=20
reverting that call to drm_gem_vram_bo_driver_move_notify(). (?)

Best regards
Thomas

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index a0992f0b8afd..0c2233ee6029 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -564,9 +564,7 @@ static void drm_gem_vram_bo_driver_evict_flags(stru=
ct drm_gem_vram_object *gbo,
>   	*pl =3D gbo->placement;
>   }
>  =20
> -static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_obj=
ect *gbo,
> -					       bool evict,
> -					       struct ttm_resource *new_mem)
> +static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_obj=
ect *gbo)
>   {
>   	struct ttm_buffer_object *bo =3D &gbo->bo;
>   	struct drm_device *dev =3D bo->base.dev;
> @@ -582,16 +580,8 @@ static int drm_gem_vram_bo_driver_move(struct drm_=
gem_vram_object *gbo,
>   				       struct ttm_operation_ctx *ctx,
>   				       struct ttm_resource *new_mem)
>   {
> -	int ret;
> -
> -	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
> -	ret =3D ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
> -	if (ret) {
> -		swap(*new_mem, gbo->bo.mem);
> -		drm_gem_vram_bo_driver_move_notify(gbo, false, new_mem);
> -		swap(*new_mem, gbo->bo.mem);
> -	}
> -	return ret;
> +	drm_gem_vram_bo_driver_move_notify(gbo);
> +	return ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
>   }
>  =20
>   /*
> @@ -947,7 +937,7 @@ static void bo_driver_delete_mem_notify(struct ttm_=
buffer_object *bo)
>  =20
>   	gbo =3D drm_gem_vram_of_bo(bo);
>  =20
> -	drm_gem_vram_bo_driver_move_notify(gbo, false, NULL);
> +	drm_gem_vram_bo_driver_move_notify(gbo);
>   }
>  =20
>   static int bo_driver_move(struct ttm_buffer_object *bo,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TzASDz8ukRldPzltfMFE91NTxfUCslulf--

--bxRNTWa33kp87W9DmvSN6Z4Zs4KB9kGwf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAlRMsFAwAAAAAACgkQlh/E3EQov+AM
6Q//aCEUO/U7AC4VRCIpHK1rqCZJcr1F1JrQ/lmAOBazJb2ZTQhPCF1lCNSHxNpRCFfckkKBgJDd
BAzJbh0PkUaz9mIj7hjh6uN1zuJN1+Fyh7GVML5d+jYmN5/DDX/nYwwI8IWOFk2F5yEXnfLt+OcO
pF7/7pZZr7jjiNYVL6itE1/eJ7sxsD6yB8bRDgoii73bujOnBKkvRx1LvzK55A5s6/WXYxJz1+Js
Vz2vqukqf7nrFvYFmNmlz5FkDdgSvT1mUL/S04c8iPcV+d1lmDWic/LOO8KCjdO5+hWCU86tENM2
HT+TejjD/9/GkGCUEAMP1ZdXS4RIw074pm9IdJ56CVT27WNdD1V4PzCIb530/aiws2wE15res6wh
h43nOwgBaWAx4Zq2wInSWaBo/O7Kta31H5Omh8wfX775ONYfO4Oc6u0ihRJ4giawutiFfFUeLnEa
Rax/T44YWMxsEmEqsftnEJABz3GY/FFZRKzbX9Ru4Dgux767CMT16Z06eqr+NJMiYpAebDLAEnFp
TYbl5LzhezzkxP3g6L60y3Uw3rHYJWZh0KWf3VRR7dgVCIuE4VhIhokrBRTGB4xlgTH35dyWSybw
VjdbVFlPQXjKru77PEY8Xqz6Orn6467I1BHXDk796PNM6RJivBmu9jgsB8piZEbvWlZ0juV+scme
pHE=
=5FBT
-----END PGP SIGNATURE-----

--bxRNTWa33kp87W9DmvSN6Z4Zs4KB9kGwf--

--===============1980456541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1980456541==--
