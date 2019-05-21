Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A824D5C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FA7892EE;
	Tue, 21 May 2019 10:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC23892EE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:57:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E85C0AD11;
 Tue, 21 May 2019 10:57:08 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
 convert mgag200
To: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190516162746.11636-1-tzimmermann@suse.de>
 <20190516162746.11636-2-tzimmermann@suse.de>
 <20190520161900.GB21222@phenom.ffwll.local>
 <20190521103546.ehrrboraeoe2e6fh@sirius.home.kraxel.org>
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
Message-ID: <e9841344-ea79-0904-4ca7-638687cdb66d@suse.de>
Date: Tue, 21 May 2019 12:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521103546.ehrrboraeoe2e6fh@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0347042500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0347042500==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LOVgZkxeRXm1NywhZnbn1v1ODCOH08eP6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LOVgZkxeRXm1NywhZnbn1v1ODCOH08eP6
Content-Type: multipart/mixed; boundary="TwDUteRU3iGUYjdEukaAwY6zTh9zjwGc6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, ray.huang@amd.com, zourongrong@gmail.com,
 sam@ravnborg.org, christian.koenig@amd.com
Message-ID: <e9841344-ea79-0904-4ca7-638687cdb66d@suse.de>
Subject: Re: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
 convert mgag200
References: <20190516162746.11636-1-tzimmermann@suse.de>
 <20190516162746.11636-2-tzimmermann@suse.de>
 <20190520161900.GB21222@phenom.ffwll.local>
 <20190521103546.ehrrboraeoe2e6fh@sirius.home.kraxel.org>
In-Reply-To: <20190521103546.ehrrboraeoe2e6fh@sirius.home.kraxel.org>

--TwDUteRU3iGUYjdEukaAwY6zTh9zjwGc6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.05.19 um 12:35 schrieb Gerd Hoffmann:
>   Hi,
>=20
>> I think would be good to have a lockdep_assert_held here for the ww_mu=
tex.
>>
>> Also general thing: _reserved is kinda ttm lingo, for dma-buf reservat=
ions
>> we call the structure tracking the fences+lock the "reservation", but =
the
>> naming scheme used is _lock/_unlock.
>>
>> I think would be good to be consistent with that, and use _locked here=
=2E
>> Especially for a very simplified vram helper like this one I expect th=
at's
>> going to lead to less wtf moments by driver writers :-)
>>
>> Maybe we should also do a large-scale s/reserve/lock/ within ttm, to a=
lign
>> more with what we now have in dma-buf.
>=20
> Given that mgag200 is the only user I think the best way forward is to
> improve the mgag200 cursor handling so we can just drop the _reserved
> variants ...
>=20
> When looking at mga_crtc_cursor_set() I suspect the easierst way to do
> that would be to simply pin the cursor bo's at driver_load time, then w=
e
> don't have to bother with pinning in mga_crtc_cursor_set() at all.
>=20
> Thomas, as you have test hardware, can you look into this?

Sure, that's the plan. May take a few days, though.

I'd like to see all of the locking/reservation gone from the helper API.
By using bochs' PRIME helpers, the generic console could probably be
used in mgag200 and ast. That would remove the remaining calls from
mgag200 and ast.

Best regards
Thomas


> thanks,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--TwDUteRU3iGUYjdEukaAwY6zTh9zjwGc6--

--LOVgZkxeRXm1NywhZnbn1v1ODCOH08eP6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzj2YMACgkQaA3BHVML
eiMqDAf+P2T7mSIcjVDpy3js0U41mhx7KjNP2XifM+KfQIHfuXVMsGtqJ6JSdrGz
G+LGf5UepbCT790PpUhJXuqD3JlTEWFTYBKH5C+0jAxUkvaoK2liXfbuCZzU00aN
1yrwqVZjdVs7gS5+8FkLCCDCfAtzcwSQ8Py0uuyHrbTHu/M+nogvZw+sYWxG1Vmm
yTcG9e+dYHkBz5aA7D+naX91fq9+sHxzOuDGFTCqmcQsztwPoFbt/racQgKg7Kuk
D9LzOcSPZ09mVA+N2VM+2O8ykflV1ojvARmZ5wL3x0MzrbTFKE05hRSX3s2QK/9o
pbj3qalt5qFXEm/2ujqSYvKgtzrAqQ==
=s8r4
-----END PGP SIGNATURE-----

--LOVgZkxeRXm1NywhZnbn1v1ODCOH08eP6--

--===============0347042500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0347042500==--
