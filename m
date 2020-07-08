Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FF218653
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 13:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBB889C1B;
	Wed,  8 Jul 2020 11:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314F989C1B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 11:41:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5055EAC2E;
 Wed,  8 Jul 2020 11:41:31 +0000 (UTC)
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel@lists.freedesktop.org
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
Date: Wed, 8 Jul 2020 13:41:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
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
Content-Type: multipart/mixed; boundary="===============0289160127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0289160127==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JjrFXqaTmF5ULefGRQwL5aibJkijC7CrB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JjrFXqaTmF5ULefGRQwL5aibJkijC7CrB
Content-Type: multipart/mixed; boundary="2clqFjKjvZqkQSVGKJCVhEHDobXbHNWKZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel@lists.freedesktop.org
Message-ID: <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
In-Reply-To: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>

--2clqFjKjvZqkQSVGKJCVhEHDobXbHNWKZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.20 um 12:05 schrieb Ilpo J=C3=A4rvinen:
> Hi,
>=20
> After upgrading kernel from 5.3 series to 5.6.16 something seems to=20
> prevent me from achieving high resolutions with the ast driver.

Thanks for reporting. It's not a bug, but a side effect of atomic
modesetting.

During pageflips, the old code used to kick out the currently displayed
framebuffer and then load in the new one. If that failed, the display
went garbage.

In v5.6-rc1, we merged atomic modesetting for ast. This means that
screen updates are more reliable, but we have to over-commit resources.
Specifically, we have to reserve space for two buffers in video memory
while a pageflip happens. 1920x1200@32 are ~9MiB of framebuffer memory.
If your device has 16 MiB of VRAM, there's no space left for the second
framebuffer. Hence, the resolution is no longer supported.

On the positive side, you can now use Wayland compositors with ast.
Atomic modesetting adds the necessary interfaces.

Best regards
Thomas

>=20
> With 5.6.16:
>=20
> $ xrandr
> Screen 0: minimum 320 x 200, current 1600 x 1200, maximum 1920 x 2048
> VGA-1 connected primary 1600x1200+0+0 (normal left inverted right x axi=
s y axis) 519mm x 324mm
>    1600x1200     60.00*=20
>    1680x1050     59.95 =20
>    1280x1024     75.02    60.02 =20
>    1440x900      59.89 =20
>    1280x800      59.81 =20
>    1024x768      75.03    60.00 =20
>    800x600       75.00    60.32 =20
>    640x480       75.00    59.94 =20
>    1920x1200_60.0  59.95 =20
>=20
> If I try to change to that manually added high-res mode, I get:
> xrandr: Configure crtc 0 failed
>=20
> With 5.3 series I've this:
>=20
> Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 1920 x 2048
> VGA-1 connected primary 1920x1200+0+0 (normal left inverted right x axi=
s y axis) 519mm x 324mm
>    1920x1200     59.95*+
>    1600x1200     60.00 =20
>    1680x1050     59.95 =20
>    1280x1024     75.02    60.02 =20
>    1440x900      59.89 =20
>    1280x800      59.81 =20
>    1024x768      75.03    60.00 =20
>    800x600       75.00    60.32 =20
>    640x480       75.00    59.94 =20
>    1920x1200_60.0  59.95 =20
>=20
> As I've had issues in getting EDID reliably from the monitor, I provide=
 it=20
> on kernel command-line (the one dumped from the monitor I use). In=20
> addition, I've another workaround for past issues related to EDID which=
=20
> always adds that 1920x1200_60.0 mode but now I cannot use even it to
> enter a high-res mode.
>=20
> If you need some additional info or want me to test a patch, just let m=
e=20
> know (but some delay is expected in testing patches). Thanks.
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--2clqFjKjvZqkQSVGKJCVhEHDobXbHNWKZ--

--JjrFXqaTmF5ULefGRQwL5aibJkijC7CrB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8FsOkUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPEAAf/Xg61+pvpM0LX7AsKzQX5mHzZYQAs
fruW73nzjP7R6e+8VCpQPuNYArP5x3ZQvZ/Nyijo1XSFt7oGsyLEDPJ7FoWo/zfP
nTEYfT/g7BAD5a5BoXJJ3kYRlSoHTYoXQK5Fzdi4Xsi+8XBrN3lLrz+nRlcqC4I6
gMjb7wR9ygc0WPLEAb2d/5u8YYBE7p+xZyHlGu2N8yuNnnOaIV0fGlDHK5tXA41L
m/ZT1E0hF8nQq4b5vpXcK9Egzl34l2d6TZoWGm0pjJ98BpZFLcjBUMjmAn+4tqCP
y0lMW1vnN2U61izlDhYBOkMJNbTAYA17fNsjDFSJLnVUYazl32bchX6zUA==
=HRoZ
-----END PGP SIGNATURE-----

--JjrFXqaTmF5ULefGRQwL5aibJkijC7CrB--

--===============0289160127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0289160127==--
