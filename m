Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3DAFC44
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 14:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3286EACF;
	Wed, 11 Sep 2019 12:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5006EACF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 12:10:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4CFFADEC;
 Wed, 11 Sep 2019 12:10:40 +0000 (UTC)
Subject: Re: [PATCH 0/3] drm/vram: Provide GEM VRAM vmap()/vunmap/()
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190911120352.20084-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <b30bab7e-9a88-dbbc-9f8b-d926677aab74@suse.de>
Date: Wed, 11 Sep 2019 14:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911120352.20084-1-tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1535525294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1535525294==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FqJpXJLZyc7fpbB4xeFHmjH1chnuIBDVV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FqJpXJLZyc7fpbB4xeFHmjH1chnuIBDVV
Content-Type: multipart/mixed; boundary="Ecq8rCIexOChN6pWd4T0WViuznnyv2QOV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b30bab7e-9a88-dbbc-9f8b-d926677aab74@suse.de>
Subject: Re: [PATCH 0/3] drm/vram: Provide GEM VRAM vmap()/vunmap/()
References: <20190911120352.20084-1-tzimmermann@suse.de>
In-Reply-To: <20190911120352.20084-1-tzimmermann@suse.de>

--Ecq8rCIexOChN6pWd4T0WViuznnyv2QOV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

FYI this is actually version 3 of the patch set posted at
[1] and [2]

[1] https://lists.freedesktop.org/archives/dri-devel/2019-July/227823.htm=
l
[2] https://lists.freedesktop.org/archives/dri-devel/2019-July/228074.htm=
l

Am 11.09.19 um 14:03 schrieb Thomas Zimmermann:
> The ast and mgag200 drivers pin() and kmap() cursor buffers; essentiall=
y
> reimplementing vmap(). We can share some code by using the respective
> functionality from GEM VRAM buffer objects.
>=20
> Thomas Zimmermann (3):
>   drm/vram: Provide vmap and vunmap operations for GEM VRAM objects
>   drm/ast: Use drm_gem_vram_{vmap,vunmap}() to map cursor source BO
>   drm/mgag200: Use drm_gem_vram_{vmap,vunmap}() to map cursor source BO=

>=20
>  drivers/gpu/drm/ast/ast_mode.c           |  21 ++---
>  drivers/gpu/drm/drm_gem_vram_helper.c    | 106 ++++++++++++++++-------=

>  drivers/gpu/drm/mgag200/mgag200_cursor.c |  22 ++---
>  include/drm/drm_gem_vram_helper.h        |   5 +-
>  4 files changed, 93 insertions(+), 61 deletions(-)
>=20
> --
> 2.23.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--Ecq8rCIexOChN6pWd4T0WViuznnyv2QOV--

--FqJpXJLZyc7fpbB4xeFHmjH1chnuIBDVV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl145DoACgkQaA3BHVML
eiPHhQf8Dj7NzBlqzm+4gVSLvcego7ELMITdRmgpgfIP+zKlMJ+bOvHDNBtSaKmB
ZlewOBrpuacvykQ+Pc8WIqJ/J5ci+Kb17XWfTfIViufnE7hqzFz/0QKum9t1iRiq
ESfYMopO8TYC8jNh7dlyMfKX1V5oTPn4/4swdJQVcrhaf8TUhwi6ZqDFb/Xq1mn+
olR8v5K9Igx709ba5JhZDHpbgQ4WusLpUDchZuKA0eBrM2xMlmdKVcqSwH+3roEO
eVY8IfjBsp5FUNlA7ErLenUWQThv6fyzAFV7lO/mFqv8PCuzx73YHlsvNWqF1TOB
xaK7bsNH+HQ7ob9ny55ouei06Dl8lw==
=Msav
-----END PGP SIGNATURE-----

--FqJpXJLZyc7fpbB4xeFHmjH1chnuIBDVV--

--===============1535525294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1535525294==--
