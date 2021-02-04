Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DC30FB06
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A4B6EE1C;
	Thu,  4 Feb 2021 18:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5186EE1C;
 Thu,  4 Feb 2021 18:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FFB2AF19;
 Thu,  4 Feb 2021 18:17:50 +0000 (UTC)
Subject: Re: [PATCH v6 05/10] drm/qxl: release shadow on shutdown
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-6-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bcb00728-5798-aa19-0bf2-b52829916353@suse.de>
Date: Thu, 4 Feb 2021 19:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204145712.1531203-6-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1466110282=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1466110282==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7IZlZjBb9k90ggGG1jTaJcJnFpkLl9eRf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7IZlZjBb9k90ggGG1jTaJcJnFpkLl9eRf
Content-Type: multipart/mixed; boundary="Pt9hD2fxGYr4bNM5i7RjcBEacqKwJegvC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <bcb00728-5798-aa19-0bf2-b52829916353@suse.de>
Subject: Re: [PATCH v6 05/10] drm/qxl: release shadow on shutdown
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-6-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-6-kraxel@redhat.com>

--Pt9hD2fxGYr4bNM5i7RjcBEacqKwJegvC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.02.21 um 15:57 schrieb Gerd Hoffmann:
> In case we have a shadow surface on shutdown release
> it so it doesn't leak.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index 38d6b596094d..60331e31861a 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1229,5 +1229,9 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  =20
>   void qxl_modeset_fini(struct qxl_device *qdev)
>   {
> +	if (qdev->dumb_shadow_bo) {
> +		drm_gem_object_put(&qdev->dumb_shadow_bo->tbo.base);
> +		qdev->dumb_shadow_bo =3D NULL;
> +	}
>   	qxl_destroy_monitors_object(qdev);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Pt9hD2fxGYr4bNM5i7RjcBEacqKwJegvC--

--7IZlZjBb9k90ggGG1jTaJcJnFpkLl9eRf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAcOk0FAwAAAAAACgkQlh/E3EQov+Bf
pxAAzhS9yhz/7odXPF65ASlBgs72y2q/jr9c8XrWtKuF+dnkmjfzmTs57Mb1tt2uLEJezZliNmhd
Tk6Pz22ASPfstmuLFw3gRbwT1gjjwMIzZJzH5FqSFNHFGMhwtMWY8kNbDNGPTkjc/4ON+DTQ4Hj1
AM6TLilIZVzM/uNZ04oOnpllo1Zpe7mntkS0/hL20vK5HXb0IuEiRLCowCGTu+4zqZJtGxcqaa0/
IckeSfvu9BDGKI3MNZvxRMZGkjZpPZX7r/yN7qy6TbsNraGX22jNAPgEx3E0eIJR9NGwC+qxm3J3
CAcd6IGMHhNPtkb/28Vg6+UsBYb5wL0d3PdXUjsAgZ94R/dc21bBb7+9cF+NqkovM/M44ieISjJr
aqUJj5M3mtw02bXdTZUtSfdbdWAtpGnCQFTQgQtzOn8G19hc2rHDmcUSbqCYuipmyhLIQQAN43Jt
XBJ9c9LvgLCQUYeGsROLUpTBS8YcCO/pYd0jSLrpNpGzokrXuiJC+Z24+QMWNULtUSukAASKMgnH
mi3QEIkULGM8A447WcSYG+IiK0AEaLyhal9xaI1nR1Ie5dH10sOZmdUYKhZZqKuiQvy3wCg+b78U
b6Ll7UXhqLSbi4en9av9ZABOWSXdSWZ4npX3HbYiAhDXsx4/rDCTq0u9ZQqkdVxTSlVZl7QMo1kn
nFw=
=qOcx
-----END PGP SIGNATURE-----

--7IZlZjBb9k90ggGG1jTaJcJnFpkLl9eRf--

--===============1466110282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1466110282==--
