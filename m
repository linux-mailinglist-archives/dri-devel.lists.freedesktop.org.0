Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BDD1CFDCC
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92BB6E1A2;
	Tue, 12 May 2020 18:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651836E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 18:52:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D79FABE6;
 Tue, 12 May 2020 18:52:26 +0000 (UTC)
Subject: Re: [PATCH v2 15/15] drm/mgag200: Replace VRAM helpers with SHMEM
 helpers
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-16-tzimmermann@suse.de>
 <CACvgo50wj8WGC2H4bb1mMsUDMS2MFXvS23FSvSba-swB5SHyXA@mail.gmail.com>
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
Message-ID: <a5c30f05-08e0-9bfe-56bb-d6c92af4c476@suse.de>
Date: Tue, 12 May 2020 20:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo50wj8WGC2H4bb1mMsUDMS2MFXvS23FSvSba-swB5SHyXA@mail.gmail.com>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0001315442=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0001315442==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h01cF2b1xTCWW40vJWMPnlFzyG5BMRiXg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h01cF2b1xTCWW40vJWMPnlFzyG5BMRiXg
Content-Type: multipart/mixed; boundary="IFGQeld9ZbGALGlwwIARYEoqPf1vxrAJv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>, john.p.donnelly@oracle.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <a5c30f05-08e0-9bfe-56bb-d6c92af4c476@suse.de>
Subject: Re: [PATCH v2 15/15] drm/mgag200: Replace VRAM helpers with SHMEM
 helpers
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-16-tzimmermann@suse.de>
 <CACvgo50wj8WGC2H4bb1mMsUDMS2MFXvS23FSvSba-swB5SHyXA@mail.gmail.com>
In-Reply-To: <CACvgo50wj8WGC2H4bb1mMsUDMS2MFXvS23FSvSba-swB5SHyXA@mail.gmail.com>

--IFGQeld9ZbGALGlwwIARYEoqPf1vxrAJv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.05.20 um 12:30 schrieb Emil Velikov:
> On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> The VRAM helpers managed the framebuffer memory for mgag200. This came=

>> with several problems, as some MGA device require the scanout address
>> to be located at VRAM offset 0. It's incompatible with the page-flip
>> semantics of DRM's atomic modesettting. With atomic modesetting, old a=
nd
>> new framebuffers have to be located in VRAM at the same time. So at le=
ast
>> one of them has to reside at a non-0 offset.
>>
>> This patch replaces VRAM helpers with SHMEM helpers. GEM SHMEM buffers=

>> reside in system memory, and are shadow-copied into VRAM during page
>> flips. The shadow copy always starts at VRAM offset 0.
>>
> I suspect MGAG200_FLAG_HW_BUG_NO_STARTADD is left around for
> documentation purposes?

Yes. For now, that flag seems to be the best documentation of the HW issu=
e.

Besides, there's another known bug in several MGAs: scanlines may not
cross the 4 MiB boundary. If we ever have to work around that problem,
NO_STARTADD might become useful again. One can either scanout from 0, or
align FB scanlines around the 4 MiB boundary; but not both.

>=20
> I've made a few small comments, but regardless the series is:
> Acked-by: Emil Velikov <emil.velikov@collabora.com>

Thanks!

Best regards
Thomas

>=20
> -Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IFGQeld9ZbGALGlwwIARYEoqPf1vxrAJv--

--h01cF2b1xTCWW40vJWMPnlFzyG5BMRiXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl668GYACgkQaA3BHVML
eiMLMwgAw++9pDoFiiodCnESqlPAOdI11nLUAFEuTRzRwDws7UiVS9RHPYzUOw4F
ytDeBCjIh2admItdD5m2qsNv8EFs1r2jt4Y5O0Q+Ms8lwm2N0ZLFR44WDvh+1Cw5
KGsv70sOHF2AxYZDagUW2yNxcvAijfqoXzIK87sMDo5q7N1qZxftLiUEAuvimCgI
Vk0eHS9oabOrFCamTXXGTgOj6GYQCAwhuzgVtdd7hDt44NGcUADbcd3/Qj74WE36
dkE2qbVw1xB89T23Gl7E9kFdjw+A68jRCDVNQlqyjN7bSpqLx4qtZ32Uzj9sCuUZ
KoXLVk81OCQ1kJbR5xHahmypbwf+bQ==
=zuup
-----END PGP SIGNATURE-----

--h01cF2b1xTCWW40vJWMPnlFzyG5BMRiXg--

--===============0001315442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0001315442==--
