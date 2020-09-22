Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231AB273B17
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 08:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66789F49;
	Tue, 22 Sep 2020 06:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BB889F49
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3385AB071;
 Tue, 22 Sep 2020 06:46:25 +0000 (UTC)
Subject: Re: [PATCH 04/11] drm/vmwgfx: stop using ttm_bo_create
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, bskeggs@redhat.com,
 kraxel@redhat.com, airlied@redhat.com, sroland@vmware.com
References: <20200921144856.2797-1-christian.koenig@amd.com>
 <20200921144856.2797-5-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cb5b1af9-c027-bd2a-c0c8-174a57f951d7@suse.de>
Date: Tue, 22 Sep 2020 08:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921144856.2797-5-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0683230381=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0683230381==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1QraqnOSFAzHt6LiKaY6asoTlDGJKqCFW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1QraqnOSFAzHt6LiKaY6asoTlDGJKqCFW
Content-Type: multipart/mixed; boundary="mTJobVqhAFXPREy18b4OkFw978KtKvt1d";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, bskeggs@redhat.com,
 kraxel@redhat.com, airlied@redhat.com, sroland@vmware.com
Message-ID: <cb5b1af9-c027-bd2a-c0c8-174a57f951d7@suse.de>
Subject: Re: [PATCH 04/11] drm/vmwgfx: stop using ttm_bo_create
References: <20200921144856.2797-1-christian.koenig@amd.com>
 <20200921144856.2797-5-christian.koenig@amd.com>
In-Reply-To: <20200921144856.2797-5-christian.koenig@amd.com>

--mTJobVqhAFXPREy18b4OkFw978KtKvt1d
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.09.20 um 16:48 schrieb Christian K=C3=B6nig:
> Implement in the driver instead since it is the only user of that funct=
ion.

Maybe merge this patch with patch 10.

Best regards
Thomas

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 42 ++++++++++++++++++++++=

>  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c     |  6 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 +++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  8 ++---
>  4 files changed, 52 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_bo.c
> index 813f1b148094..30d19b45b602 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -487,6 +487,48 @@ static void vmw_user_bo_destroy(struct ttm_buffer_=
object *bo)
>  	ttm_prime_object_kfree(vmw_user_bo, prime);
>  }
> =20
> +/**
> + * vmw_bo_create_kernel - Create a pinned BO for internal kernel use.
> + *
> + * @dev_priv: Pointer to the device private struct
> + * @size: size of the BO we need
> + * @placement: where to put it
> + * @p_bo: resulting BO
> + *
> + * Creates and pin a simple BO for in kernel use.
> + */
> +int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long s=
ize,
> +			 struct ttm_placement *placement,
> +			 struct ttm_buffer_object **p_bo)
> +{
> +	unsigned npages =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	struct ttm_buffer_object *bo;
> +	size_t acc_size;
> +	int ret;
> +
> +	bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
> +	if (unlikely(!bo))
> +		return -ENOMEM;
> +
> +	acc_size =3D ttm_round_pot(sizeof(*bo));
> +	acc_size +=3D ttm_round_pot(npages * sizeof(void *));
> +	acc_size +=3D ttm_round_pot(sizeof(struct ttm_tt));
> +	ret =3D ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
> +				   ttm_bo_type_device, placement, 0,
> +				   false, acc_size, NULL, NULL, NULL);
> +	if (unlikely(ret))
> +		goto error_free;
> +
> +	ttm_bo_pin(bo);
> +	ttm_bo_unreserve(bo);
> +	*p_bo =3D bo;
> +
> +	return 0;
> +
> +error_free:
> +	kfree(bo);
> +	return ret;
> +}
> =20
>  /**
>   * vmw_bo_init - Initialize a vmw buffer object
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_cmdbuf.c
> index 3b41cf63110a..9a9fe10d829b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> @@ -1245,9 +1245,9 @@ int vmw_cmdbuf_set_pool_size(struct vmw_cmdbuf_ma=
n *man,
>  		    !dev_priv->has_mob)
>  			return -ENOMEM;
> =20
> -		ret =3D ttm_bo_create(&dev_priv->bdev, size, ttm_bo_type_device,
> -				    &vmw_mob_ne_placement, 0, false,
> -				    &man->cmd_space);
> +		ret =3D vmw_bo_create_kernel(dev_priv, size,
> +					   &vmw_mob_placement,
> +					   &man->cmd_space);
>  		if (ret)
>  			return ret;
> =20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.h
> index 9ceee4eb0b13..5d07de5183e1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -845,6 +845,10 @@ extern void vmw_bo_get_guest_ptr(const struct ttm_=
buffer_object *buf,
>  				 SVGAGuestPtr *ptr);
>  extern void vmw_bo_pin_reserved(struct vmw_buffer_object *bo, bool pin=
);
>  extern void vmw_bo_bo_free(struct ttm_buffer_object *bo);
> +extern int vmw_bo_create_kernel(struct vmw_private *dev_priv,
> +				unsigned long size,
> +				struct ttm_placement *placement,
> +				struct ttm_buffer_object **p_bo);
>  extern int vmw_bo_init(struct vmw_private *dev_priv,
>  		       struct vmw_buffer_object *vmw_bo,
>  		       size_t size, struct ttm_placement *placement,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> index d7ea658e9910..39a2f720f4ed 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -793,11 +793,9 @@ int vmw_bo_create_and_populate(struct vmw_private =
*dev_priv,
>  	struct ttm_buffer_object *bo;
>  	int ret;
> =20
> -	ret =3D ttm_bo_create(&dev_priv->bdev, bo_size,
> -			    ttm_bo_type_device,
> -			    &vmw_sys_ne_placement,
> -			    0, false, &bo);
> -
> +	ret =3D vmw_bo_create_kernel(dev_priv, bo_size,
> +				   &vmw_sys_placement,
> +				   &bo);
>  	if (unlikely(ret !=3D 0))
>  		return ret;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mTJobVqhAFXPREy18b4OkFw978KtKvt1d--

--1QraqnOSFAzHt6LiKaY6asoTlDGJKqCFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9pnZwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMO5wf9EfwHWrOJcLqOogHlvDrIQLs4T4M2
0jhOEVTWqjDEd/9rwYA8HpnnqznyW2znb40xzvYgnK5GYi6DqfTOoK9IuKtDDQDf
CQcSKChW7sicE31ZGUMxdAnxPSBNp/3+xFr2z8oFMGlbPIZwM40EZ4mdrvjYiNk0
6d6fABj9/GwRw1IVK/9+R5S6ETc3vhC8YRSlvOLOyWR957AGdbfN3U3xpmoXvWxb
c/XhH5XdcGfyMTV29bYRx9manK2wejvIzrETDk+Z1FN96USusfWjk3HrKN/+3qBy
LrIZ5V7I3AWMPnG5SCYYJlINVZpB0Hsgc2n6AuFkJ2yoo/p44HZgMUBXiQ==
=ZUDn
-----END PGP SIGNATURE-----

--1QraqnOSFAzHt6LiKaY6asoTlDGJKqCFW--

--===============0683230381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0683230381==--
