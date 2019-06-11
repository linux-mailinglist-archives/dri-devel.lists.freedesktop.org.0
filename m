Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7A3CBA3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 14:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C419B890BE;
	Tue, 11 Jun 2019 12:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903BF891DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 12:32:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0643BAEB7;
 Tue, 11 Jun 2019 12:32:04 +0000 (UTC)
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
 <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
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
Message-ID: <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
Date: Tue, 11 Jun 2019 14:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============2126297936=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2126297936==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tluQswj7F3ajOplnbLr0Ys4nj1XtL1Kea"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tluQswj7F3ajOplnbLr0Ys4nj1XtL1Kea
Content-Type: multipart/mixed; boundary="tHYDbfqI5XEPiAxS21ZByPi5K9vZLR2ay";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Message-ID: <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
 <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
In-Reply-To: <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>

--tHYDbfqI5XEPiAxS21ZByPi5K9vZLR2ay
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.06.19 um 11:58 schrieb Gerd Hoffmann:
> On Tue, Jun 04, 2019 at 05:41:59PM +0200, Thomas Zimmermann wrote:
>> The cursor handling in mgag200 is complicated to understand. It touche=
s a
>> number of different BOs, but doesn't really use all of them.
>>
>> Rewriting the cursor update reduces the amount of cursor state. There =
are
>> two BOs for double-buffered HW updates. The source BO updates the one =
that
>> is currently not displayed and then switches buffers. Explicit BO lock=
ing
>> has been removed from the code. BOs are simply pinned and unpinned in =
video
>> RAM.
>=20
> Cursors are not that big after all, so maybe pin the two BOs for
> double-buffering permanently in vram to simplify things further?
>=20
> Also factoring out the code which updates the two BOs to a separate
> function should help making the code more readable.

The cursor handling in the ast driver is similar, but uses one single BO
to hold both cursor buffers. I'm thinking about how to turn both
implementations into a generic helper for legacy cursors (i.e., low
number of colors or palette). This would also be helpful for my work on
fbdev porting.

One idea is to adapt deferred I/O. DRM would expose an ARGB shadow
buffer to userspace and let the mmap implementation update the HW
buffers (including dithering, palette setup, etc.).

Best regards
Thomas

> But even as-is the patch is a step into the right direction.
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--tHYDbfqI5XEPiAxS21ZByPi5K9vZLR2ay--

--tluQswj7F3ajOplnbLr0Ys4nj1XtL1Kea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/nz8ACgkQaA3BHVML
eiNa9gf/SNOFobhCi+7O8JDpgcmKuRJJH11j+sTKXzoeVqVPNqnVzE/UEsm2JN6O
Qpnxvl8DK+IHkerlMY7vvfdd63DZpNThwqA/YkpIqDs3MM9V8FXgutQCOd4TVtTI
+Gj5VO7noI6aGvEdon2AEigTeIihtDmOgg4ZgtiUpmlijUjpb8Eo8Hl0RWD/uRtj
DCPgLXPUdlwrDHJi3SHtKrDBKygWsBMCtLV7zOZ5U1V2Txt0lk6tYQW4JKosyL+2
hz+3RL8TWNTO801CvnrHRyJw0C5HU+Vh//uwLi8jfnOYK8z9wMtgZgz+aqCzRG6V
7RAswk3oVI79Qu4ERZpjr4vf2KHfEg==
=R0Mi
-----END PGP SIGNATURE-----

--tluQswj7F3ajOplnbLr0Ys4nj1XtL1Kea--

--===============2126297936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2126297936==--
