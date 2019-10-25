Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B41E4F99
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 16:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8F46EA73;
	Fri, 25 Oct 2019 14:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61A46EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 14:53:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0CD4ABFF1;
 Fri, 25 Oct 2019 14:53:38 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(), 
 and vunmap()
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
 <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
 <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>
 <487893a0-1fe8-cc08-d301-d30f34c21ab6@suse.de>
 <9c977a45-8e70-8771-0fdf-8bef85a97021@tronnes.org>
 <58881840-459d-7c04-31fa-383d40a5eb67@suse.de>
 <20191025133240.54ignkzxb3qpf76u@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <83a10a33-2fe8-35f4-48f7-d43d7432b520@suse.de>
Date: Fri, 25 Oct 2019 16:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025133240.54ignkzxb3qpf76u@sirius.home.kraxel.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2039136588=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2039136588==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="guyUgZUIY2y7ZX0TvrcNWL5ZXREmWPQgS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--guyUgZUIY2y7ZX0TvrcNWL5ZXREmWPQgS
Content-Type: multipart/mixed; boundary="IHbhMjRiqhuxDBJviww4kYurqdtXFhR3o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <83a10a33-2fe8-35f4-48f7-d43d7432b520@suse.de>
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(),
 and vunmap()
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
 <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
 <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>
 <487893a0-1fe8-cc08-d301-d30f34c21ab6@suse.de>
 <9c977a45-8e70-8771-0fdf-8bef85a97021@tronnes.org>
 <58881840-459d-7c04-31fa-383d40a5eb67@suse.de>
 <20191025133240.54ignkzxb3qpf76u@sirius.home.kraxel.org>
In-Reply-To: <20191025133240.54ignkzxb3qpf76u@sirius.home.kraxel.org>

--IHbhMjRiqhuxDBJviww4kYurqdtXFhR3o
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.10.19 um 15:32 schrieb Gerd Hoffmann:
>   Hi,
>=20
>>> I had a flag to set this in the initial version of the shmem helper
>>> modeled after udl, but Thomas Hellstrom brought up a question and it =
was
>>> dropped. The issue was beyond my understanding:
>>>
>>> [PATCH v3 0/2] drm: Add shmem GEM library
>>> https://lists.freedesktop.org/archives/dri-devel/2018-September/19000=
1.html
>>
>> If I understand that discussion correctly, the concern was that write
>> combining and shared memory would not work well together. So you went
>> with always-cached?
>>
>> Just recently, Gerd added unconditional write combining in rev 0be8958=
936.
>=20
> Well, it's not really added.  It's the same thing drm_gem_mmap_obj()
> does for you when you don't have a drm_gem_object_funcs.mmap callback.
>=20
> But, yes, the reason this is done in the driver's mmap() callback with
> the new mmap code path is to give drivers the option to override this
> by supplying their own mmap() handler.  So going with shmem helpers +
> custom mmap callback is a reasonable approach.
>=20
> HTH,

Absolutely.

Thanks everyone for the feedback.

Best regards
Thomas

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
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IHbhMjRiqhuxDBJviww4kYurqdtXFhR3o--

--guyUgZUIY2y7ZX0TvrcNWL5ZXREmWPQgS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2zDG4ACgkQaA3BHVML
eiNIEwgAmOSr2lkgVC0+cdXEVM4oOtJ2QYl5YUhdgGV7xB8ju2dGtsBFZvyGHf1R
++ze7HM+gi2oiYPE4vTJiLcMWVMpSbbRBRKFPe9uhh7MeRSOZZdhyT+Gf12hSBXy
j4lrlCKQmc+gWSBLXgZeXPBAxRgtYUsm/XFDILerCpEXd4PjpsPq78sAwmCypTku
HrP4dT2dDW3J0uITxTYmm3XF3fBr9ysKEwFFEjPn6RicrvXqaoK7GpT684I+5JbX
nzUktEeJ8qi8Ib4HeK3Q8+WW8MUuVouABJc3gjiA0ssCmPmGzvSR1a/IVquCdeIq
k16HWhk8OW/BCFs5VOjc9PutCdE0uA==
=rTtq
-----END PGP SIGNATURE-----

--guyUgZUIY2y7ZX0TvrcNWL5ZXREmWPQgS--

--===============2039136588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2039136588==--
