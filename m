Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97142416C5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 09:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6956E4D4;
	Tue, 11 Aug 2020 06:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC516E153
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 06:59:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7EBBB05D;
 Tue, 11 Aug 2020 06:59:38 +0000 (UTC)
Subject: Re: [PATCH] drm/mgag200: fix build on alpha arch
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20200807180547.GA923146@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bc77eba7-a49b-15cf-f72f-6c78af015813@suse.de>
Date: Tue, 11 Aug 2020 08:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807180547.GA923146@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1925722700=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1925722700==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AhkEshkqLnteA9Bo5mg6fgAG6YefeLIDq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AhkEshkqLnteA9Bo5mg6fgAG6YefeLIDq
Content-Type: multipart/mixed; boundary="pi3h9TzS377Rw3uGyafp2ges9ivDudkK5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Message-ID: <bc77eba7-a49b-15cf-f72f-6c78af015813@suse.de>
Subject: Re: [PATCH] drm/mgag200: fix build on alpha arch
References: <20200807180547.GA923146@ravnborg.org>
In-Reply-To: <20200807180547.GA923146@ravnborg.org>

--pi3h9TzS377Rw3uGyafp2ges9ivDudkK5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

thanks for taken care of this issue. Alpha is a rare architecture these
days. How do you build and test for it?

Am 07.08.20 um 20:05 schrieb Sam Ravnborg:
> When building imgag200 for the alpha architecture it fails like this:
> mgag200_drv.c:233:9: error: implicit declaration of function =E2=80=98v=
malloc=E2=80=99
>   233 |  bios =3D vmalloc(size);
>       |         ^~~~~~~
>       |         kmalloc
>=20
> When building for other architectures vmalloc.h is pulled in via some
> other header file - for example asm-generic/io.h.
> Use an explicit include of vmalloc.h to fix the build.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Sorry for being (too) late, but still:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> Fixes: e20dfd27f7aa ("drm/mgag200: Add support for G200 desktop cards")=

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Egbert Eich <eich@suse.com>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> ---
> I have lost track if the offending commit is on the way to upstream or
> it is just in drm-misc-next. But I think it is the latter so we can
> apply this to drm-misc-next.
>=20
> 	Sam
>=20
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mg=
ag200/mgag200_drv.c
> index 09170d46aa53..b282b0e42c2d 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -9,6 +9,7 @@
>  #include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/vmalloc.h>
> =20
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--pi3h9TzS377Rw3uGyafp2ges9ivDudkK5--

--AhkEshkqLnteA9Bo5mg6fgAG6YefeLIDq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8yQcQUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOy8wf/ZS2fm3uUj6hK8/2LhHo+IfdXkDIG
y9cnOVvIsRacZqAT43GdYoEfiNw7A4iU7RQP4tEFHdkZwwX2WGTm2x6ZUB+HksTV
mZtOYhPM9PbR+SpWpNEfvhS0N/336l+BTALvyhMqIjVh6BSHK/MbMtjyzuwz0jim
7DN+ZwD+ECCbt3IdDkybBIYXiXyIJDeXxjJsR0/H1whqgHjpUTKLpQhqp6QKdG+n
yYCBOsF6NIhECBCAB+HonBUBc6lrnJ1BV9epTz5XpPyGptwNvVUR89V8QXyfU/ex
2JbdthODKK7HHTi8NEzN+JDn5kV/QzBqAqYdz/ynaVuvntl+OrZk6M58nQ==
=+cb8
-----END PGP SIGNATURE-----

--AhkEshkqLnteA9Bo5mg6fgAG6YefeLIDq--

--===============1925722700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1925722700==--
