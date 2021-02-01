Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E030AA15
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241056E7D9;
	Mon,  1 Feb 2021 14:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A149F6E7D9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:43:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34765ABD5;
 Mon,  1 Feb 2021 14:43:30 +0000 (UTC)
Subject: Re: [PATCH 5/6] drm/gma500: psb_spank() doesn't need it's own file
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-5-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3b30a938-0dbc-3a8d-07e7-73a803c52b2a@suse.de>
Date: Mon, 1 Feb 2021 15:43:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201132617.1233-5-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie
Content-Type: multipart/mixed; boundary="===============0219473778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0219473778==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3NKWZOHWkDl9sKec0ET7GtGBXmmrmCOfI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3NKWZOHWkDl9sKec0ET7GtGBXmmrmCOfI
Content-Type: multipart/mixed; boundary="PtEGwllq8WXffivyTtGDw0OYj4Pfwm43B";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, airlied@linux.ie
Message-ID: <3b30a938-0dbc-3a8d-07e7-73a803c52b2a@suse.de>
Subject: Re: [PATCH 5/6] drm/gma500: psb_spank() doesn't need it's own file
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-5-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20210201132617.1233-5-patrik.r.jakobsson@gmail.com>

--PtEGwllq8WXffivyTtGDw0OYj4Pfwm43B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.02.21 um 14:26 schrieb Patrik Jakobsson:
> Since everything else in accel_2d.c got removed we can move psb_spank()=

> into psb_drv.c where it is used.

Nit: I think one says 'it is being used'.

>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/Makefile   |  1 -
>   drivers/gpu/drm/gma500/accel_2d.c | 60 ------------------------------=
-
>   drivers/gpu/drm/gma500/psb_drv.c  | 31 ++++++++++++++++
>   3 files changed, 31 insertions(+), 61 deletions(-)
>   delete mode 100644 drivers/gpu/drm/gma500/accel_2d.c
>=20
> diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/M=
akefile
> index 884ab1f9063e..6ee1ef389979 100644
> --- a/drivers/gpu/drm/gma500/Makefile
> +++ b/drivers/gpu/drm/gma500/Makefile
> @@ -4,7 +4,6 @@
>   #
>  =20
>   gma500_gfx-y +=3D \
> -	  accel_2d.o \
>   	  backlight.o \
>   	  blitter.o \
>   	  cdv_device.o \
> diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500=
/accel_2d.c
> deleted file mode 100644
> index 437bbb6af9e6..000000000000
> --- a/drivers/gpu/drm/gma500/accel_2d.c
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*********************************************************************=
*****
> - * Copyright (c) 2007-2011, Intel Corporation.
> - * All Rights Reserved.
> - *
> - * Intel funded Tungsten Graphics (http://www.tungstengraphics.com) to=

> - * develop this driver.
> - *
> - *********************************************************************=
*****/
> -
> -#include <linux/console.h>
> -#include <linux/delay.h>
> -#include <linux/errno.h>
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/module.h>
> -#include <linux/slab.h>
> -#include <linux/string.h>
> -#include <linux/tty.h>
> -
> -#include <drm/drm.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_fb_helper.h>
> -#include <drm/drm_fourcc.h>
> -
> -#include "psb_drv.h"
> -#include "psb_reg.h"
> -
> -/**
> - *	psb_spank		-	reset the 2D engine
> - *	@dev_priv: our PSB DRM device
> - *
> - *	Soft reset the graphics engine and then reload the necessary regist=
ers.
> - *	We use this at initialisation time but it will become relevant for
> - *	accelerated X later
> - */
> -void psb_spank(struct drm_psb_private *dev_priv)
> -{
> -	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
> -		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
> -		_PSB_CS_RESET_ISP_RESET | _PSB_CS_RESET_TSP_RESET |
> -		_PSB_CS_RESET_TWOD_RESET, PSB_CR_SOFT_RESET);
> -	PSB_RSGX32(PSB_CR_SOFT_RESET);
> -
> -	msleep(1);
> -
> -	PSB_WSGX32(0, PSB_CR_SOFT_RESET);
> -	wmb();
> -	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) | _PSB_CB_CTRL_CLEAR_FAULT,
> -		   PSB_CR_BIF_CTRL);
> -	wmb();
> -	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
> -
> -	msleep(1);
> -	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) & ~_PSB_CB_CTRL_CLEAR_FAULT,
> -		   PSB_CR_BIF_CTRL);
> -	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
> -	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
> -}
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/=
psb_drv.c
> index 0bcab065242c..bd55b0c4f4b3 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -12,6 +12,7 @@
>   #include <linux/notifier.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/spinlock.h>
> +#include <linux/delay.h>
>  =20
>   #include <asm/set_memory.h>
>  =20
> @@ -92,6 +93,36 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>   static const struct drm_ioctl_desc psb_ioctls[] =3D {
>   };
>  =20
> +/**
> + *	psb_spank		-	reset the 2D engine
> + *	@dev_priv: our PSB DRM device
> + *
> + *	Soft reset the graphics engine and then reload the necessary regist=
ers.
> + */
> +void psb_spank(struct drm_psb_private *dev_priv)
> +{
> +	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
> +		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
> +		_PSB_CS_RESET_ISP_RESET | _PSB_CS_RESET_TSP_RESET |
> +		_PSB_CS_RESET_TWOD_RESET, PSB_CR_SOFT_RESET);
> +	PSB_RSGX32(PSB_CR_SOFT_RESET);
> +
> +	msleep(1);
> +
> +	PSB_WSGX32(0, PSB_CR_SOFT_RESET);
> +	wmb();
> +	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) | _PSB_CB_CTRL_CLEAR_FAULT,
> +		   PSB_CR_BIF_CTRL);
> +	wmb();
> +	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
> +
> +	msleep(1);
> +	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) & ~_PSB_CB_CTRL_CLEAR_FAULT,
> +		   PSB_CR_BIF_CTRL);
> +	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
> +	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
> +}
> +
>   static int psb_do_init(struct drm_device *dev)
>   {
>   	struct drm_psb_private *dev_priv =3D dev->dev_private;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PtEGwllq8WXffivyTtGDw0OYj4Pfwm43B--

--3NKWZOHWkDl9sKec0ET7GtGBXmmrmCOfI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAYE5EFAwAAAAAACgkQlh/E3EQov+Co
lxAAn2oQ8bb3o+uRjEKuqfdQ/GLYuxv2XS855THAs5o10HFSe08iJfNswW38dQg+41JJOwTm2ZUs
jIGrjy66m3VRI3QhB6lEuNI1pJzscdjEQ1ho3fEMAngR4/zSp+U7XIYcDQK4Q48BRTaHpkwytxGh
6VAeUJcNkG2uRozHijFp+SYT4Mprml0Bx3cpqqGRMzrKEQVOOEwWrt1tp7Z+IlD7lKnnK3P85gdh
3mjpw4XzlH4mtQVKk6eklVTwXMEEp4LkTZdsSLHPJcK5B4KGyh5DBLPuS95DhDE+Wb7IJiJmEi6e
sZa9WlRrRHPPEzau9Vjxmz0aB2ykj/q6Oha6RFaci3wwrsK3tOLECOknTIwWTwS8/yggGS2RqXhH
Wu1xqoYS+ylQEdOAJBYd0k3RP7z3hrn8Hi+LotWYRza7CIsTALKdgYFyoNqX7iwnJnc6qGXvsFGs
oaBGieTqB0jchzOmVyJ8H7s3ivjtchwm3rhfs0klglJmnefONbH5KpzxurAbZJQH4ccbt2OHGYIa
+DLJQzq32MHgyrM3pvttY0+F2GqhUZHQTVDTn6bhJQsUYR7yQzKfM/Zvm9FEFgI/NxUFLHeG0Tw+
b8lmKMis2ckH2J6CNdNTXjM4NoPKoT9t2tZ3W+hRGLmDcXgoNn5h5H7qM1qAjzWVu5BdV2wZNi+0
BB4=
=/Mop
-----END PGP SIGNATURE-----

--3NKWZOHWkDl9sKec0ET7GtGBXmmrmCOfI--

--===============0219473778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0219473778==--
