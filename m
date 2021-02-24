Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C70323943
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 10:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A046E8AA;
	Wed, 24 Feb 2021 09:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D686EA6A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 09:15:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE1DFAFE2;
 Wed, 24 Feb 2021 09:15:52 +0000 (UTC)
To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Simon Ser <contact@emersion.fr>, Sumera Priyadarsini
 <sylphrenadin@gmail.com>, David Airlie <airlied@linux.ie>
References: <20210220143749.omaoooquudaqiawf@smtp.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC PATCH 0/3] drm/vkms: add overlay plane support
Message-ID: <d7e71518-91af-5f9c-1337-66cd1c8c4cc5@suse.de>
Date: Wed, 24 Feb 2021 10:15:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220143749.omaoooquudaqiawf@smtp.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1969371851=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1969371851==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hNOf2VStOiy4QRJsXFiAcXYrQIxt8ideF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hNOf2VStOiy4QRJsXFiAcXYrQIxt8ideF
Content-Type: multipart/mixed; boundary="DziHSmDbKabno9MRcBRBgFHFFDl8Cg4G4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Simon Ser <contact@emersion.fr>, Sumera Priyadarsini
 <sylphrenadin@gmail.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d7e71518-91af-5f9c-1337-66cd1c8c4cc5@suse.de>
Subject: Re: [RFC PATCH 0/3] drm/vkms: add overlay plane support
References: <20210220143749.omaoooquudaqiawf@smtp.gmail.com>
In-Reply-To: <20210220143749.omaoooquudaqiawf@smtp.gmail.com>

--DziHSmDbKabno9MRcBRBgFHFFDl8Cg4G4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.02.21 um 15:37 schrieb Melissa Wen:
> Adding support to overlay type in addition to primary and cursor plane.=

> The planes composition relies on the z order of the active planes and
> only occurs if there is a primary plane (as in the current behavior).
>=20
> The first patch decouples cursor from crtc_init. It initializes the CRT=
C
> only with primary plane, and setup the cursor plane externally. This is=

> a preparation to allow to initialize the overlay plane between primary
> and cursor.
>=20
> The second patch generalize variables and functions names to refer to
> any kind of plane, not only cursor. The goal is to reuse them for
> blending overlay and cursor planes to primary.

It's not directly relevant to the patchset here, but sort-of related.

Vkms is effectively shadow buffered. I'd like to promote the new helpers =

for shadow-buffered planes in drm_gem_atomic_helper.h.

There's plane state and helper functions available that automatically=20
vmap and vunmap framebuffer BOs. You can safe the rsp code in vkms. It=20
would also help with testing the shadow-plane helpers.

Best regards
Thomas

>=20
> The third patch creates a module option to enable overlay, and includes=

> overlay to supported types of plane. When the overlay option is enabled=
,
> one overlay plane is initialized (plus primary and cursor) and it is
> included in the planes composition.
>=20
> This work preserves the current results of IGT tests: kms_cursor_crc;
> kms_flip and kms_writeback. In addition, subtests related to overlay in=

> kms_atomic and kms_plane_cursor start to pass (pointed out in the commi=
t
> message).
>=20
> Melissa Wen (3):
>    drm/vkms: decouple cursor plane setup from crtc_init
>    drm/vkms: rename cursor to plane on ops of planes composition
>    drm/vkms: add overlay support
>=20
>   drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++-----------=
-
>   drivers/gpu/drm/vkms/vkms_crtc.c     |  4 +--
>   drivers/gpu/drm/vkms/vkms_drv.c      |  5 +++
>   drivers/gpu/drm/vkms/vkms_drv.h      |  3 +-
>   drivers/gpu/drm/vkms/vkms_output.c   | 31 ++++++++++++++----
>   drivers/gpu/drm/vkms/vkms_plane.c    | 20 +++++++++---
>   6 files changed, 76 insertions(+), 36 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DziHSmDbKabno9MRcBRBgFHFFDl8Cg4G4--

--hNOf2VStOiy4QRJsXFiAcXYrQIxt8ideF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA2GUcFAwAAAAAACgkQlh/E3EQov+CM
kg/9H4L6p79TpN303A0kCfndbMD+p3qiZpCIUkVs7ERJ6jizzqrAveVy4U+VOarh52Qrab1426Id
TzZPPDIPKz2Y6r1Mtencuqofgvc5EW03kWMdDF7nvcHK8BWOa+p2LM5BzOYB4pwqNWAhwQCGdKY9
BsWCqfN/J0/hp5kAp4N6BApx+EUSGGv5MVKuK9MNvKx7CTTbz6IuJTPkj9eoNmhPsd7oPl2YxMVp
zPUUlFnlMueMKea/y+lshqyq11mT1ohAu5Qap5+ld/TQ+TdBGgPFa35tlHGHRhJfREk3LTMTFyBF
K2WUzXVuFvlKiEk88RhuJMQGn6AfQOp9Odc1TluFrtZQYN6qT29LxqChcxYDCHJsaHjrmFuiXKNT
IxRQc9xSlghH3Q2Hwj/M6eG431HTu8t6iMBcjMxMk5zEWdYYCxIyTk3/q4XuBpgleGJFlaUQbh1x
uCu2XdXtt09sZjoPfYimkCaVQ2v6MF5imTmVZJUlG+pvstCOtFvfyx5vdWDSTp69WVozZZoABoCS
yANw23hJ0Un/0ohnbPgx2Lu19Do54P7LznbWez4j3niw2QX/k+4oZSn5RsZUmaO7baBLJ4CLbJkU
YEFjOGbEruBschhQczYk9iL7HE9l2Cwdg/PVOS3nmenS4OnP2M5d3sY9OuNWPXJ7nXFXGufSUONt
wQk=
=Xh/v
-----END PGP SIGNATURE-----

--hNOf2VStOiy4QRJsXFiAcXYrQIxt8ideF--

--===============1969371851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1969371851==--
