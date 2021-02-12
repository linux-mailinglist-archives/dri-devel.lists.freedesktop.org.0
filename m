Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE80319B26
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202046E53C;
	Fri, 12 Feb 2021 08:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95C6E53C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:26:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08B1BB95F;
 Fri, 12 Feb 2021 08:26:48 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20210211131659.276275-1-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e354a681-8ba5-4c8c-216c-399e257f8eb1@suse.de>
Date: Fri, 12 Feb 2021 09:26:46 +0100
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
Content-Type: multipart/mixed; boundary="===============1558946799=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1558946799==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6PiFtFxCmJ5OPHqBhMwXjZgJFqWSvKXB0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6PiFtFxCmJ5OPHqBhMwXjZgJFqWSvKXB0
Content-Type: multipart/mixed; boundary="KwPXPDhevUrRytDoDSkRrxLbV6BY1wCeh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
Message-ID: <e354a681-8ba5-4c8c-216c-399e257f8eb1@suse.de>
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
References: <20210211131659.276275-1-christian.koenig@amd.com>
In-Reply-To: <20210211131659.276275-1-christian.koenig@amd.com>

--KwPXPDhevUrRytDoDSkRrxLbV6BY1wCeh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.02.21 um 14:16 schrieb Christian K=C3=B6nig:
> Swapping bo->mem was completely unecessary. Cleanup the function which
> is just a leftover from a TTM cleanup.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Appears to work.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

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


--KwPXPDhevUrRytDoDSkRrxLbV6BY1wCeh--

--6PiFtFxCmJ5OPHqBhMwXjZgJFqWSvKXB0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAmO8YFAwAAAAAACgkQlh/E3EQov+Bj
aBAAjoMW42z+t5B89M2zvYXUPUBh0H0hG2oVu2TssdwhtPHGtE68vRufVXCA/X0dyOralSDFSvAY
6uun0Ps+hyvlkNLhTe5sNd4T7h28KFfEJKGqzJqyEbziL/L7BnPb/xD1DIjV+6wb/PLfWwrujq2y
IFfJttqqtW8iUHxO8+KBaRXZktHT7ETLXYctdYu7ms2VC8n2Rl1S+iSAr+4BRn6v+Sv9eBJc6xX0
i+zNVLscYKkn0TjE2drxiCxCAFarYor5zCK3VSq0+VFGdsmoOYJHWbaQiA/AjQBS3Ao5HQ9JfIp4
JlixlfSI1t4ofa/yxlayAJCcbnwXAfd+SUWirzDjeSS9J9IBxV1CBzS1GTw5TeuKPaEdEPYQcSkq
U+NCnKKCrkejLI8AG5QiV/kzTQl55lAWbtrUV2O/j+yZ6wSGy5bg4vu94o2qHFftO/06NCd3btx5
qp64C1WKKqwW4MFf9jjiPR0B3OjEI+2ldAXZrwiuMrZAfn7wZkWOPCcBgZH64xTT14gMaAVUfBNX
mkhGLTJ5rbk8KTEQvqResoalsAkAA3YooJENLTf+huYsdPR1YhLwru/rGj4vNN4nB+Ut80PoMfZL
X7Rey7bMyYFxk9MHboPqpvuzVt45d/mcfZsQ5Xoa0h3NW92vV5dWNpJYh9p5ZFAbj8hQXDNzEuh6
8UQ=
=SUYT
-----END PGP SIGNATURE-----

--6PiFtFxCmJ5OPHqBhMwXjZgJFqWSvKXB0--

--===============1558946799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1558946799==--
