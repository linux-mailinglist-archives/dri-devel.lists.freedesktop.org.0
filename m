Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB8381D07
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 07:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995906E428;
	Sun, 16 May 2021 05:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870096E428
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 05:30:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 544ABAE4B;
 Sun, 16 May 2021 05:30:36 +0000 (UTC)
Subject: Re: [PATCH] drm/rockchip: remove early framebuffers before
 registering the fbdev
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20210515221447.429779-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fe3285b7-3bc3-8292-bdc2-b8e823c1772d@suse.de>
Date: Sun, 16 May 2021 07:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515221447.429779-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4wYW5pFUCvynnI7pjPzXACDDuKFD86ukM"
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4wYW5pFUCvynnI7pjPzXACDDuKFD86ukM
Content-Type: multipart/mixed; boundary="V1L3adRszmeBQmTFtJJuUaL5zxYtiK8Gm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <fe3285b7-3bc3-8292-bdc2-b8e823c1772d@suse.de>
Subject: Re: [PATCH] drm/rockchip: remove early framebuffers before
 registering the fbdev
References: <20210515221447.429779-1-javierm@redhat.com>
In-Reply-To: <20210515221447.429779-1-javierm@redhat.com>

--V1L3adRszmeBQmTFtJJuUaL5zxYtiK8Gm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.05.21 um 00:14 schrieb Javier Martinez Canillas:
> There are drivers that register framebuffer devices very early in the b=
oot
> process and make use of the existing framebuffer as setup by the firmwa=
re.
>=20
> If one of those drivers has registered a fbdev, then the fbdev register=
ed
> by a DRM driver won't be bound to the framebuffer console. To avoid tha=
t,
> remove any early framebuffer before registering a DRM framebuffer devic=
e.
>=20
> By doing that, the fb mapped to the console is switched correctly from =
the
> early fbdev to the one registered by the rockchip DRM driver:
>=20
>      [   40.752420] fb0: switching to rockchip-drm-fb from EFI VGA
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>   drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gp=
u/drm/rockchip/rockchip_drm_fbdev.c
> index 2fdc455c4ad..e3e5b63fdcc 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> @@ -4,6 +4,7 @@
>    * Author:Mark Yao <mark.yao@rock-chips.com>
>    */
>  =20
> +#include <drm/drm_aperture.h>
>   #include <drm/drm.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> @@ -124,6 +125,15 @@ int rockchip_drm_fbdev_init(struct drm_device *dev=
)
>  =20
>   	drm_fb_helper_prepare(dev, helper, &rockchip_drm_fb_helper_funcs);
>  =20
> +	/* Remove early framebuffers (e.g: simplefb or efifb) */
> +	ret =3D drm_aperture_remove_framebuffers(false, "rockchip-drm-fb");
> +	if (ret) {
> +		DRM_DEV_ERROR(dev->dev,
> +			      "Failed to remove early framebuffers - %d.\n",
> +			      ret);
> +		return ret;
> +	}
> +

Such code used to be part of the fbdev helpers, but it's not really=20
related to fbdev functonality. Rather it controls ownership of the I/O=20
ranges.

This code block should be done at the very beginning; before the driver=20
tries to reserve the device's I/O ranges. Probably at [1]

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/rockchi=
p/rockchip_drm_drv.c#L116


>   	ret =3D drm_fb_helper_init(dev, helper);
>   	if (ret < 0) {
>   		DRM_DEV_ERROR(dev->dev,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--V1L3adRszmeBQmTFtJJuUaL5zxYtiK8Gm--

--4wYW5pFUCvynnI7pjPzXACDDuKFD86ukM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCgrfsFAwAAAAAACgkQlh/E3EQov+A7
YQ/+PMhnLpkCMiK7e9qCZhznG2wyBSy+jIuI3+S473yvFhP0O9MrXz7JxNdlvVtSjQe4y2Zn3nr0
xdkH5qWk+DBUgDqKBzmirF+9dY9lIZD0L/80D+fMLpbiLCN1vzAgKlihffh9kvRPiVL+c7Iga8Jb
Sw89mj/tqKQk+8hXu85kceathNdseXNuCIZ9KW/0dLFmG3pegf9otuf6Lv617JHbxm0vLP3x79/7
FX73cKsG6PV7dqpJU19WTbKzakpLuGvhsWHy620WbBr9tD6gsZjbxDBpBB0/dJ/5XjjlduJA2vFl
hHPONYASxLO6FWBr1xhJyxhj3GgsZqRkCewJ6StbcFuxEiq5iNkHR1A6vgP90gOioGjh6arjKJUr
Xyq31y+uKv+mGlNnlYR9o3jGdGfcihLB2MXyEqupUowdc9orbPC8oTyj/j12Zq2QBQHaskE0N06H
F7DRty2aOESa8779e7iEOqZh/0kmQKyVynNqszsKpAeEFGvBTFI7T/uKrDZOfr7keZN/GA7AfuIT
w6Op56eU1FYatlnK0uqMgXm113iHIXVFBpz2slahSMfyzd86G2PL9mRWOKngLLk/Zh5iEYpCMP2b
isyBigCiGRZh9hMtE/4eJ3RWkPnN0Ji0wfvgrdtlVAYZXvW5BODsjNaA1aT3FXlk4uFn1y2m5BR+
PQw=
=Vwle
-----END PGP SIGNATURE-----

--4wYW5pFUCvynnI7pjPzXACDDuKFD86ukM--
