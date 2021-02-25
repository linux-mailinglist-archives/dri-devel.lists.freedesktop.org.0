Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA4D324D0C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EE489C96;
	Thu, 25 Feb 2021 09:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA92389C96
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:39:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BA62AC1D;
 Thu, 25 Feb 2021 09:39:09 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
 <6754ac45-b433-65cf-02a7-a785f616b8a8@suse.de>
 <980dd782-f921-c4af-5507-b23f3cca4f79@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e1bb65e6-9b23-1438-fa18-81fbe6d4d61e@suse.de>
Date: Thu, 25 Feb 2021 10:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <980dd782-f921-c4af-5507-b23f3cca4f79@tronnes.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============1154826318=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1154826318==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RFENdaxrIr1iuSQ66slzwREtD73ZHIDA5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RFENdaxrIr1iuSQ66slzwREtD73ZHIDA5
Content-Type: multipart/mixed; boundary="G2k4vHSMT0utwQ1lOg7B8Mw3FYC2Q773f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <e1bb65e6-9b23-1438-fa18-81fbe6d4d61e@suse.de>
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
 <6754ac45-b433-65cf-02a7-a785f616b8a8@suse.de>
 <980dd782-f921-c4af-5507-b23f3cca4f79@tronnes.org>
In-Reply-To: <980dd782-f921-c4af-5507-b23f3cca4f79@tronnes.org>

--G2k4vHSMT0utwQ1lOg7B8Mw3FYC2Q773f
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 25.02.21 um 10:25 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 25.02.2021 09.12, skrev Thomas Zimmermann:
>> Hi
>>
>> Am 24.02.21 um 18:14 schrieb Noralf Tr=C3=B8nnes:
>>>
>>>
>>> Den 19.02.2021 14.54, skrev Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 19.02.21 um 13:22 schrieb Noralf Tr=C3=B8nnes:
>>>>> dma-buf importing was reworked in commit 7d2cd72a9aa3
>>>>> ("drm/shmem-helpers: Simplify dma-buf importing"). Before that comm=
it
>>>>> drm_gem_shmem_prime_import_sg_table() did set ->pages_use_count=3D1=
 and
>>>>> drm_gem_shmem_vunmap_locked() could call drm_gem_shmem_put_pages()
>>>>> unconditionally. Now without the use count set, put pages is called=

>>>>> also
>>>>> on dma-bufs. Fix this by only putting pages if it's not imported.
>>>>>
>>>>> Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing=
")
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>>
>>>> Just when I saw the error. Nice. :)
>>>>
>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>
>>>
>>> Should I apply this to drm-misc-fixes?
>>
>> I think so. Ping me if you want me to add it.
>>
>=20
> I'd appreciate if you could do it. I haven't applied a patch in almost =
a
> year now and need to dig out my notes on how I do it. -fixes stuff is
> for me a "hold my breath and hope I don't screw up anything" exercise.
> Stressful :/

Applied now to drm-misc-next. If it breaks, I'll also take the blame. :) =

I took the liberty of moving your S-o-b line to the top of the tag. IIRC =

this is the preferred style. Thanks again for the fix.

Best regards
Thomas

>=20
> One day in the future I hope there's a green button I can push that
> says: Merge patch to -fixes and make sure everything is OK. That would
> be nice :)
>=20
> Thanks,
> Noralf.
>=20
>> Best regards
>> Thomas
>>
>>>
>>> Noralf.
>>>
>>>> For testing the GUD driver, you may also want to keep an eye at [1]
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1]
>>>> https://lore.kernel.org/dri-devel/02a45c11-fc73-1e5a-3839-30b080950a=
f8@amd.com/T/#t
>>>>
>>>>
>>>>
>>>>> ---
>>>>>  =C2=A0=C2=A0 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
>>>>>  =C2=A0=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> index 9825c378dfa6..c8a6547a1757 100644
>>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> @@ -357,13 +357,14 @@ static void drm_gem_shmem_vunmap_locked(struc=
t
>>>>> drm_gem_shmem_object *shmem,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (--shmem->vmap_use_count >=
 0)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n;
>>>>>  =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 if (obj->import_attach)
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->import_attach) {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_b=
uf_vunmap(obj->import_attach->dmabuf, map);
>>>>> -=C2=A0=C2=A0=C2=A0 else
>>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vunma=
p(shmem->vaddr);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_shmem_put_pages=
(shmem);
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shmem->vaddr =3D NULL;=

>>>>> -=C2=A0=C2=A0=C2=A0 drm_gem_shmem_put_pages(shmem);
>>>>>  =C2=A0=C2=A0 }
>>>>>  =C2=A0=C2=A0 =C2=A0 /*
>>>>>
>>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--G2k4vHSMT0utwQ1lOg7B8Mw3FYC2Q773f--

--RFENdaxrIr1iuSQ66slzwREtD73ZHIDA5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA3cDwFAwAAAAAACgkQlh/E3EQov+BG
LxAAnAyr4ix+bTPhge09mxCSQxvFR4cr/1g42Ut+aQmtaZI2oq5jZP5hpfqYMib0LOJcs79DGnqz
GKJPBiird6SnAdqIfQphcQakb3JQRBJbc7IJhXBICJFiTfm/9uZfOGz4fXvz3VA4QKSeENtrQHgl
rHJKYetL64mjawG0G0iFoTfS5Fndas/R2r1tcJ9p0I1K3qLtK9KX6i9m8qsJk+C14T1ZxgSj6nT4
QWMQfS6CCYLKoxOASs4p+/1d0sU7vdknKhnsLMFhV8Jtpgd+3Rvjhk7eG1l5CQPv6zLt5PS3SCGD
mkZNCr9r86JZmGEo7Mp+RGHKsC/iwCQFEPvBmzsMHOv+nnyy9IVR7jrTgo/3gOohF0iXjpo1eUjX
wJuSDzJzw4WzZBNQUITvGF62BcDUazT1rVQXOCiPlWz2sgOWgftP4DAP0vhv2I10cuzwropnixuy
AZ/KhVIoiBc+NY7cBqCXG4rxeLP6zvfBmf5yxhyqKZ6DzsLiQJY6wrndgSl990XJB4vFopgMvpGq
41SO2sN3snpo5ygdyR1KwmY4VxXjT2SpHnmInDQphKaGPTGvCAVvtrFVFscfEAGL3h4P+rDRE9eh
84AZ+ezhcswc2xgeVylfXpXJgZcrAQbr4NWynqkT79qKllXPoQYlcMqJdrpxEZxWMvdPwa8lpwnR
owg=
=BJEW
-----END PGP SIGNATURE-----

--RFENdaxrIr1iuSQ66slzwREtD73ZHIDA5--

--===============1154826318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1154826318==--
