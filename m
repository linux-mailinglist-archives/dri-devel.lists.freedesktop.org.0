Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5A135762
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 11:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D05F6E8FF;
	Thu,  9 Jan 2020 10:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5959B6E8FA;
 Thu,  9 Jan 2020 10:49:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 56BB86A22E;
 Thu,  9 Jan 2020 10:49:21 +0000 (UTC)
Subject: Re: [PATCH 0/2] drm/radeon: have the callers of set_memory_*() check
 the return value
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Kees Cook <keescook@chromium.org>
References: <20200107192555.20606-1-tli@digitalocean.com>
 <b5984995-7276-97d3-a604-ddacfb89bd89@amd.com>
 <202001080936.A36005F1@keescook>
 <CADnq5_NLS=CuHD39utCTnTVsY_izuTPXFfsew6TpMjovgFoT5g@mail.gmail.com>
 <a2919283-f5aa-43b2-9186-6c41315458c4@amd.com>
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
Message-ID: <505a76a9-6110-3ddb-0f15-059b60922482@suse.de>
Date: Thu, 9 Jan 2020 11:49:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a2919283-f5aa-43b2-9186-6c41315458c4@amd.com>
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
Cc: kernel-hardening@lists.openwall.com, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tianlin Li <tli@digitalocean.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1322336996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1322336996==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IppRMugkDgM0YtzTmj4mcEpPGelB3TZan"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IppRMugkDgM0YtzTmj4mcEpPGelB3TZan
Content-Type: multipart/mixed; boundary="SyVA97ST4kKzNtTdQqyExsM2QMCcVlz06";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: kernel-hardening@lists.openwall.com, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tianlin Li <tli@digitalocean.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Message-ID: <505a76a9-6110-3ddb-0f15-059b60922482@suse.de>
Subject: Re: [PATCH 0/2] drm/radeon: have the callers of set_memory_*() check
 the return value
References: <20200107192555.20606-1-tli@digitalocean.com>
 <b5984995-7276-97d3-a604-ddacfb89bd89@amd.com>
 <202001080936.A36005F1@keescook>
 <CADnq5_NLS=CuHD39utCTnTVsY_izuTPXFfsew6TpMjovgFoT5g@mail.gmail.com>
 <a2919283-f5aa-43b2-9186-6c41315458c4@amd.com>
In-Reply-To: <a2919283-f5aa-43b2-9186-6c41315458c4@amd.com>

--SyVA97ST4kKzNtTdQqyExsM2QMCcVlz06
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.01.20 um 11:15 schrieb Christian K=C3=B6nig:
> Am 08.01.20 um 18:51 schrieb Alex Deucher:
>> On Wed, Jan 8, 2020 at 12:39 PM Kees Cook <keescook@chromium.org> wrot=
e:
>>> On Wed, Jan 08, 2020 at 01:56:47PM +0100, Christian K=C3=B6nig wrote:=

>>>> Am 07.01.20 um 20:25 schrieb Tianlin Li:
>>>>> Right now several architectures allow their set_memory_*() family o=
f
>>>>> functions to fail, but callers may not be checking the return value=
s.
>>>>> If set_memory_*() returns with an error, call-site assumptions may =
be
>>>>> infact wrong to assume that it would either succeed or not succeed =
at
>>>>> all. Ideally, the failure of set_memory_*() should be passed up the=

>>>>> call stack, and callers should examine the failure and deal with it=
=2E
>>>>>
>>>>> Need to fix the callers and add the __must_check attribute. They al=
so
>>>>> may not provide any level of atomicity, in the sense that the memor=
y
>>>>> protections may be left incomplete on failure. This issue likely ha=
s a
>>>>> few steps on effects architectures:
>>>>> 1)Have all callers of set_memory_*() helpers check the return value=
=2E
>>>>> 2)Add __must_check to all set_memory_*() helpers so that new uses d=
o
>>>>> not ignore the return value.
>>>>> 3)Add atomicity to the calls so that the memory protections aren't
>>>>> left
>>>>> in a partial state.
>>>>>
>>>>> This series is part of step 1. Make drm/radeon check the return
>>>>> value of
>>>>> set_memory_*().
>>>> I'm a little hesitate merge that. This hardware is >15 years old and=

>>>> nobody
>>>> of the developers have any system left to test this change on.
>>> If that's true it should be removed from the tree. We need to be able=
 to
>>> correctly make these kinds of changes in the kernel.
>> This driver supports about 15 years of hardware generations.=C2=A0 New=
er
>> cards are still prevalent, but the older stuff is less so.=C2=A0 It st=
ill
>> works and people use it based on feedback I've seen, but the older
>> stuff has no active development at this point.=C2=A0 This change just
>> happens to target those older chips.
>=20
> Just a few weeks back we've got a mail from somebody using an integrate=
d
> R128 in a laptop.
>=20
> After a few mails back and force we figured out that his nearly 20 year=
s
> old hardware was finally failing.
>=20
> Up till that he was still successfully updating his kernel from time to=

> time and the driver still worked. I find that pretty impressive.
>=20
>>
>> Alex
>>
>>>> Would it be to much of a problem to just add something like: r =3D
>>>> set_memory_*(); (void)r; /* Intentionally ignored */.
>>> This seems like a bad idea -- we shouldn't be papering over failures
>>> like this when there is logic available to deal with it.
>=20
> Well I certainly agree to that, but we are talking about a call which
> happens only once during driver load/unload. If necessary we could also=

> print an error when something goes wrong, but please no larger
> refactoring of return values and call paths.
>=20

IMHO radeon should be marked as orphaned or obsolete then.

Best regards
Thomas

> It is perfectly possible that this call actually failed on somebodies
> hardware, but we never noticed because the driver still works fine. If
> we now handle the error it is possible that the module never loads and
> the user gets a black screen instead.
>=20
> Regards,
> Christian.
>=20
>>>
>>>> Apart from that certainly a good idea to add __must_check to the
>>>> functions.
>>> Agreed!
>>>
>>> -Kees
>>>
>>> --=20
>>> Kees Cook
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%=
7Cchristian.koenig%40amd.com%7Ca542d384d54040b5b0b708d794636df1%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637141027080080147&amp;sdata=3DEHFl6Y=
OHmNp7gOqWsVmfoeD0jNirBTOGHcCP4efC%2FvE%3D&amp;reserved=3D0
>>>
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


--SyVA97ST4kKzNtTdQqyExsM2QMCcVlz06--

--IppRMugkDgM0YtzTmj4mcEpPGelB3TZan
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4XBS0ACgkQaA3BHVML
eiNM2gf/Sfu1dwm1aY7feHkacaNb7qnj6u7bUB7cJrMtMrSNJUI4H+odvLBjolcc
RL+3SMVjl+ptolVncpdGaeHWqgaLgflCrPCus6AR3VqanCYa2jX6uhkrXNrSjsm5
vRVHkVGwyab1HxhYMdszB5ztg3Rj+jpOdlEgzVJatr8VadNWAVLomQ2z8WKAGtpa
F3s1vA4xr1XQLlPrgb7LY8QknA5bOPeU5ahxo304/IN1JEJUvzUEUydzZfonvkMz
SRNyIu/kNcCLfqvgUkUD37seh+4+ckaYLd7jo0mkAct5hY2YSEm5tVhp181PqF2s
FZcZJTcMeHpZZHzXCajknXP0cBOYUA==
=o8T/
-----END PGP SIGNATURE-----

--IppRMugkDgM0YtzTmj4mcEpPGelB3TZan--

--===============1322336996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1322336996==--
