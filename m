Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8B30FB18
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EBA6EE24;
	Thu,  4 Feb 2021 18:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148086EE24;
 Thu,  4 Feb 2021 18:18:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DC79AC45;
 Thu,  4 Feb 2021 18:18:49 +0000 (UTC)
Subject: Re: [PATCH v6 06/10] drm/qxl: properly pin/unpin shadow
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-7-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <26e46352-9804-f7bd-416e-9304de839e22@suse.de>
Date: Thu, 4 Feb 2021 19:18:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204145712.1531203-7-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1214407006=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1214407006==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="puhXiUl0yb9wyvcqleNQ0FC5PygyaUJjl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--puhXiUl0yb9wyvcqleNQ0FC5PygyaUJjl
Content-Type: multipart/mixed; boundary="bVdDgZUP1a5PNggIVo8wmhttgCyoTsyiI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <26e46352-9804-f7bd-416e-9304de839e22@suse.de>
Subject: Re: [PATCH v6 06/10] drm/qxl: properly pin/unpin shadow
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-7-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-7-kraxel@redhat.com>

--bVdDgZUP1a5PNggIVo8wmhttgCyoTsyiI
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.02.21 um 15:57 schrieb Gerd Hoffmann:
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks for this.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>


> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index 60331e31861a..d25fd3acc891 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -802,12 +802,14 @@ static int qxl_plane_prepare_fb(struct drm_plane =
*plane,
>   		}
>   		if (user_bo->shadow !=3D qdev->dumb_shadow_bo) {
>   			if (user_bo->shadow) {
> +				qxl_bo_unpin(user_bo->shadow);
>   				drm_gem_object_put
>   					(&user_bo->shadow->tbo.base);
>   				user_bo->shadow =3D NULL;
>   			}
>   			drm_gem_object_get(&qdev->dumb_shadow_bo->tbo.base);
>   			user_bo->shadow =3D qdev->dumb_shadow_bo;
> +			qxl_bo_pin(user_bo->shadow);
>   		}
>   	}
>  =20
> @@ -833,6 +835,7 @@ static void qxl_plane_cleanup_fb(struct drm_plane *=
plane,
>   	qxl_bo_unpin(user_bo);
>  =20
>   	if (old_state->fb !=3D plane->state->fb && user_bo->shadow) {
> +		qxl_bo_unpin(user_bo->shadow);
>   		drm_gem_object_put(&user_bo->shadow->tbo.base);
>   		user_bo->shadow =3D NULL;
>   	}
> @@ -1230,6 +1233,7 @@ int qxl_modeset_init(struct qxl_device *qdev)
>   void qxl_modeset_fini(struct qxl_device *qdev)
>   {
>   	if (qdev->dumb_shadow_bo) {
> +		qxl_bo_unpin(qdev->dumb_shadow_bo);
>   		drm_gem_object_put(&qdev->dumb_shadow_bo->tbo.base);
>   		qdev->dumb_shadow_bo =3D NULL;
>   	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--bVdDgZUP1a5PNggIVo8wmhttgCyoTsyiI--

--puhXiUl0yb9wyvcqleNQ0FC5PygyaUJjl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAcOogFAwAAAAAACgkQlh/E3EQov+Dg
Vg/+MUInIKH8GpLCOyMWjazU0ZyjdPK+V/ovGgU1m6paa5rIQo2By75Mk2CBWYoEX5C3jVg8BAq7
CuULKTn6Qzy58+h5vJhK8qdQfzCRPN6a3OBycUHiuwaZWLBbr39QbJYIMYl2gz2GAR7wdx051ZnP
h+3PwY6fMUQbklPO34p7IneF19eOspTehL6wmirOv7njTu74VJpkDIpaJEC2VTOJl6L13uYYlFg+
p6ukjInHCkR/+4Uc0SnSR64+Ts71FrNtKoWcE4Vu1KQprd7OUVOGbn/BYl3qQP9auhGXW9NhXpmS
b/vueXUfzHk0VuPjMPcp7/LJvA9wG1DBn1Cddm+FMoiGYoH7vPOOY/yH4A+NnGjiyFH+Jo4Ug2yU
eGwQyXdnmzQyj6OXMrD6FaxyCx0Y7HdefvmM/5/dSX/qWoy2YqjVb9bFfRMRHIPGc6nEaEKo7s1o
ESwZCkHBsn+aPCatdhrLbySrZjtI0pdTdBUBsHOFCtgh523GP24jtn7KZe0h5vbhPUPtT5zq0yNc
Ix367RqSVvS2J9r0C0eg748FyufuQEKib37D+qIcW68u8xWe2xx1gpeDIv5VfHq1Z5eSEVuuv5mA
osWrF0qYo4TVnIOX2bTqtTW8V2/5orsYkXp5jNgAxz/NbdCSyt/8JASh9aXdFsweHe+CL1yXGQxo
+FA=
=ReK/
-----END PGP SIGNATURE-----

--puhXiUl0yb9wyvcqleNQ0FC5PygyaUJjl--

--===============1214407006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1214407006==--
