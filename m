Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0041DB6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732658932A;
	Wed, 12 Jun 2019 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553158932A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:27:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4B0AAF22;
 Wed, 12 Jun 2019 07:27:27 +0000 (UTC)
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
 <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
 <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
 <CAKMK7uEwoCFWxtD-ktZSxjhS2TyOEoRovBX18gk3doGyCCrS2Q@mail.gmail.com>
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
Message-ID: <87d444a2-f897-8989-5453-ebacaaa15964@suse.de>
Date: Wed, 12 Jun 2019 09:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEwoCFWxtD-ktZSxjhS2TyOEoRovBX18gk3doGyCCrS2Q@mail.gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1455406402=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1455406402==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9LRM2JVeLFnvRK3TvxTd21MH7nx4gZWby"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9LRM2JVeLFnvRK3TvxTd21MH7nx4gZWby
Content-Type: multipart/mixed; boundary="llavWl5OMI0NLCz0JoeGaLM6jfONF0vh6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <87d444a2-f897-8989-5453-ebacaaa15964@suse.de>
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
 <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
 <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
 <CAKMK7uEwoCFWxtD-ktZSxjhS2TyOEoRovBX18gk3doGyCCrS2Q@mail.gmail.com>
In-Reply-To: <CAKMK7uEwoCFWxtD-ktZSxjhS2TyOEoRovBX18gk3doGyCCrS2Q@mail.gmail.com>

--llavWl5OMI0NLCz0JoeGaLM6jfONF0vh6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.06.19 um 17:33 schrieb Daniel Vetter:
> On Tue, Jun 11, 2019 at 2:32 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 05.06.19 um 11:58 schrieb Gerd Hoffmann:
>>> On Tue, Jun 04, 2019 at 05:41:59PM +0200, Thomas Zimmermann wrote:
>>>> The cursor handling in mgag200 is complicated to understand. It touc=
hes a
>>>> number of different BOs, but doesn't really use all of them.
>>>>
>>>> Rewriting the cursor update reduces the amount of cursor state. Ther=
e are
>>>> two BOs for double-buffered HW updates. The source BO updates the on=
e that
>>>> is currently not displayed and then switches buffers. Explicit BO lo=
cking
>>>> has been removed from the code. BOs are simply pinned and unpinned i=
n video
>>>> RAM.
>>>
>>> Cursors are not that big after all, so maybe pin the two BOs for
>>> double-buffering permanently in vram to simplify things further?
>>>
>>> Also factoring out the code which updates the two BOs to a separate
>>> function should help making the code more readable.
>>
>> The cursor handling in the ast driver is similar, but uses one single =
BO
>> to hold both cursor buffers. I'm thinking about how to turn both
>> implementations into a generic helper for legacy cursors (i.e., low
>> number of colors or palette). This would also be helpful for my work o=
n
>> fbdev porting.
>>
>> One idea is to adapt deferred I/O. DRM would expose an ARGB shadow
>> buffer to userspace and let the mmap implementation update the HW
>> buffers (including dithering, palette setup, etc.).
>=20
> No mmap games needed with kms, we expect userspace to give us an ioctl
> call in all cases. fbdev is the legacy horrors that works differently.

Thanks for clarifying this. Conversion should be much easier this way. I
saw the dirty callback and the DIRTYFB ioctl, but I don't saw anything
in Weston that calls it. So I assumed that it's obsolete or optional.

Best regards
Thomas

> So for cursors, assuming you have universal cursors, you just need to
> update the shadowed copy in the prepare_fb plane hook. For
> non-universal plane drivers you need to do that somewhere in your
> set/move_cursor hooks (I think both of them). Aside: For non-cursors
> there's also the dirtyfb ioctl, which serves the same purpose.
>=20
> Cheers, Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> But even as-is the patch is a step into the right direction.
>>>
>>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>>>
>>> cheers,
>>>   Gerd
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>> HRB 21284 (AG N=C3=BCrnberg)
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--llavWl5OMI0NLCz0JoeGaLM6jfONF0vh6--

--9LRM2JVeLFnvRK3TvxTd21MH7nx4gZWby
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0AqV0ACgkQaA3BHVML
eiNqpgf7BK1D+zaJQc8vwvAo+1qXPLNbiHmqvJekPC1dF1a19ZmDIIYj2fYnjd4G
Vhi0n5CaWhoygHedrX0J5eGzmTRfloO+wyM8mBPsGhXtXyFIncr40ibE6mZytUtB
I1FKmE+hCrBxLScbWAryPnjkNrjUZNHtyAuds4Kab00bjRzCBLvJPKUxPkllPrh/
NFHKDSD9EuUcM+1acZAe1buBNONI5STrmSL8bp62tlhGCE4bpXYKcOM+NuCK6Fny
3edS3DORBMynw68KF57XJNoMhDafXvhe8GJdRR9g9kHrb7YsEe1AZlU1dJsq3bJu
7pJ/WfideDKS0LXvec1QQk5TRHzQcg==
=bSz6
-----END PGP SIGNATURE-----

--9LRM2JVeLFnvRK3TvxTd21MH7nx4gZWby--

--===============1455406402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1455406402==--
