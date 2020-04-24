Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D81B6E9A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43EB6EA72;
	Fri, 24 Apr 2020 07:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483AB6EA72
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 07:03:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 428ACAC6E;
 Fri, 24 Apr 2020 07:03:26 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <c592baa1-7e0f-688e-1e31-bb7c8c28d8fa@amd.com>
 <abd885fb-39e3-35e6-9104-2298ad73c2c6@suse.de>
 <d5c457e6-6808-2a00-fa21-65601abc00cf@amd.com>
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
Message-ID: <4ead5cfc-2915-dabd-e820-6e380e442175@suse.de>
Date: Fri, 24 Apr 2020 09:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d5c457e6-6808-2a00-fa21-65601abc00cf@amd.com>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0204961306=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0204961306==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AEcoPC5qmJqxbNp73zdUNY4xcfvZIgYAD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AEcoPC5qmJqxbNp73zdUNY4xcfvZIgYAD
Content-Type: multipart/mixed; boundary="O5c3t6V9jxt1dobLMCD62BqGFl02YdtN9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <4ead5cfc-2915-dabd-e820-6e380e442175@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <c592baa1-7e0f-688e-1e31-bb7c8c28d8fa@amd.com>
 <abd885fb-39e3-35e6-9104-2298ad73c2c6@suse.de>
 <d5c457e6-6808-2a00-fa21-65601abc00cf@amd.com>
In-Reply-To: <d5c457e6-6808-2a00-fa21-65601abc00cf@amd.com>

--O5c3t6V9jxt1dobLMCD62BqGFl02YdtN9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.04.20 um 08:56 schrieb Christian K=C3=B6nig:
> Am 24.04.20 um 08:27 schrieb Thomas Zimmermann:
>> Hi Christian
>>
>> Am 23.04.20 um 17:04 schrieb Christian K=C3=B6nig:
>>> Hi guys,
>>>
>>> one thing you don't seem to have considered yet is that not setting t=
he
>>> top-down flag also won't get you the bottom-up approach, but rather t=
he
>>> best fit.
>> Kind of unrelated: Would it pick the smallest free area that can hold =
a
>> BO? IOW, would a small cursor BO fill up a small free area even if
>> there's a much larger free area somewhere?
>=20
> Yes, exactly that.

I see.

>=20
> The bottom-up method searches for the lowest hole which can fit the
> requirements.

But there's no way to explictely select bottom-up? What is
TTM_PL_FLAG_CONTIGUOUS doing?

Best regards
Thomas


>=20
> The top-down method searches for the highest hole which can fit the
> requirements.
>=20
> Both of those walk the holes by the address index tree, but there is
> also the best method which looks at the holes by their size and tries t=
o
> find the best fit.
>=20
> The best method usually only needs a single tree walk instead of a
> linear search.
>=20
>>> Am 23.04.20 um 15:57 schrieb Gerd Hoffmann:
>>>>> But cursor BOs are small, so they don't make much of a difference.
>>>>> What
>>>>> is needed is space for 2 primary framebuffers during pageflips,
>>>>> with one
>>>>> of them pinned. The other framebuffer can be located anywhere.
>>>> The problem isn't the size.=C2=A0 The problem is dynamically allocat=
ed
>>>> cursor
>>>> BOs can also fragment vram, especially if top-bottom allocation is a=
lso
>>>> used for large framebuffers so cursor BOs can end up somewhere in th=
e
>>>> middle of vram.
>>> Well maybe instead of a ping/pong approach between top and bottom use=
 a
>>> size based approach to place small BOs at the top and only the larger=

>>> ones at the bottom (or the other way around).
>> That's what the current code does and it results in the OOM. Basically=
,
>> there's a large BO in the middle of vram and the pageflip's destinatio=
n
>> BO does not fit before or after the large one.
>=20
> Tough problem. No idea how to otherwise fix this without making the
> large BO moveable somehow.
>=20
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>> Cheers,
>>> Christian.
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--O5c3t6V9jxt1dobLMCD62BqGFl02YdtN9--

--AEcoPC5qmJqxbNp73zdUNY4xcfvZIgYAD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6ijz0ACgkQaA3BHVML
eiMe0Qf/b7Vi9jFTIx6ecNhyobC5P+QsYQaZ1RD7puf5dgR5j1WveFp/ZTkQGe3O
g/tSxdo2cw5xYjBTdR4RVtoWL+O7WzzQ2WT0/iMwWhsg7Ha/qBTWhNpiOYw1GwTf
H3H9bdpf2ssRBuueEYejXHiCGxOBIHURXNayeHLxIXqObMlLHVHWJfAhYjDHjfkr
bXf2GUPE/Ti/pkzQ7zxg/91wO3kZAIjVQMBjmMUAKRfBSbqCwWh49gExs+eKndR+
LaIfA7siCnljUDLIKxOmPmvGLLDs0eBLZ6UDFRoDfwG34/w2NbaQjYPopY9YjSVa
Ntfv3Gx+W3iCKuEES6tJ2YBxvM7aXw==
=DnlE
-----END PGP SIGNATURE-----

--AEcoPC5qmJqxbNp73zdUNY4xcfvZIgYAD--

--===============0204961306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0204961306==--
