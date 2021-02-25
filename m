Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BEF324D2C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723556EC77;
	Thu, 25 Feb 2021 09:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFA06EC76
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:52:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 990E5AAAE;
 Thu, 25 Feb 2021 09:52:15 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
 <CAKMK7uH06XqRUWOuyZCG+6X9zVs6FGYWOFE0RggfY7Jx91AQjw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <42d082fc-128e-9c98-1570-ffeb9e71f143@suse.de>
Date: Thu, 25 Feb 2021 10:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH06XqRUWOuyZCG+6X9zVs6FGYWOFE0RggfY7Jx91AQjw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1105860602=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1105860602==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rVyDtPztPlqMclODdYDsXVPggcPZWQDHw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rVyDtPztPlqMclODdYDsXVPggcPZWQDHw
Content-Type: multipart/mixed; boundary="zaGemMVpmOdo8HCSwPYNvacQ7ZIUrYVqC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <42d082fc-128e-9c98-1570-ffeb9e71f143@suse.de>
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
 <CAKMK7uH06XqRUWOuyZCG+6X9zVs6FGYWOFE0RggfY7Jx91AQjw@mail.gmail.com>
In-Reply-To: <CAKMK7uH06XqRUWOuyZCG+6X9zVs6FGYWOFE0RggfY7Jx91AQjw@mail.gmail.com>

--zaGemMVpmOdo8HCSwPYNvacQ7ZIUrYVqC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.21 um 10:43 schrieb Daniel Vetter:
> On Wed, Feb 24, 2021 at 6:14 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org=
> wrote:
>>
>>
>>
>> Den 19.02.2021 14.54, skrev Thomas Zimmermann:
>>> Hi
>>>
>>> Am 19.02.21 um 13:22 schrieb Noralf Tr=C3=B8nnes:
>>>> dma-buf importing was reworked in commit 7d2cd72a9aa3
>>>> ("drm/shmem-helpers: Simplify dma-buf importing"). Before that commi=
t
>>>> drm_gem_shmem_prime_import_sg_table() did set ->pages_use_count=3D1 =
and
>>>> drm_gem_shmem_vunmap_locked() could call drm_gem_shmem_put_pages()
>>>> unconditionally. Now without the use count set, put pages is called =
also
>>>> on dma-bufs. Fix this by only putting pages if it's not imported.
>>>>
>>>> Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing"=
)
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>
>>> Just when I saw the error. Nice. :)
>>>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>
>> Should I apply this to drm-misc-fixes?
>=20
> drm-misc-next-fixes because we're in the merge window.

Too late. Can/should I cherry-pick the patch from drm-misc-next?

Best regards
Thomas

> -Daniel
>=20
>>
>> Noralf.
>>
>>> For testing the GUD driver, you may also want to keep an eye at [1]
>>>
>>> Best regards
>>> Thomas
>>>
>>> [1]
>>> https://lore.kernel.org/dri-devel/02a45c11-fc73-1e5a-3839-30b080950af=
8@amd.com/T/#t
>>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> index 9825c378dfa6..c8a6547a1757 100644
>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> @@ -357,13 +357,14 @@ static void drm_gem_shmem_vunmap_locked(struct=

>>>> drm_gem_shmem_object *shmem,
>>>>        if (--shmem->vmap_use_count > 0)
>>>>            return;
>>>>    -    if (obj->import_attach)
>>>> +    if (obj->import_attach) {
>>>>            dma_buf_vunmap(obj->import_attach->dmabuf, map);
>>>> -    else
>>>> +    } else {
>>>>            vunmap(shmem->vaddr);
>>>> +        drm_gem_shmem_put_pages(shmem);
>>>> +    }
>>>>          shmem->vaddr =3D NULL;
>>>> -    drm_gem_shmem_put_pages(shmem);
>>>>    }
>>>>      /*
>>>>
>>>
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zaGemMVpmOdo8HCSwPYNvacQ7ZIUrYVqC--

--rVyDtPztPlqMclODdYDsXVPggcPZWQDHw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA3c04FAwAAAAAACgkQlh/E3EQov+Cp
cQ//dz5RcJSOSq0VFAZ86Sj+PqKVDSsivvH9qC/U7xuQS/k3lmCoZmwxOIv9jdhfasnSv/0ylxG7
JNwtM3aNekPgQk/d8esUvrzcidWi1p6o3hGR2eEgYx0yJzvPLLz3DGgCE8WKKC5XVAyoN5MlGgSw
EIFtgo34atVpfhBqFHCi7i3zThlC1VnW1znorCWjUkNnuagviL4TTZ10f3Y/y+2uAM2Y9cxpRxNW
AE73OmSQ3G1lYszDYppIIr6sRYEYxP3iz4mDdYmKtRXGm4FT0VlX/yFVb+tacff9hIk4b8GAiVmw
7704KOwZinrsg0s0q3KXF4HVKWh1HGf33veJ4cL6b2Qv7n2R1KbQIW6I83AHmIs/vaLFFG3Y7wtm
5YefLGdQ2VgDp0kYqCho2FvgD7t4Mcm0GzefIrVr1Br0YeJHxrJsDFkjiM0Zc/Nxyyg1Ld8tSTaX
eweCzf8HPkUJqqcueglVbwbLBUZ2xGiRbSNnZCZNRH3cl1s0LuC6bpWsQzqjD2fJjBmVyZcY8F/9
ZXKHdA/l7G1kWHI413Lp6unbg3GcfVxE8HZj4R96feQr0pqbo5ctlkQbz63NziTD7QowY7xqrAGt
krN1BX/QEEBTAsvreNiibLMQF5nYEPvBPUF7qpEY/e9CJP63lKtkx/rAcyn7FMM3fv5/yLkeZPPy
4cE=
=eS8q
-----END PGP SIGNATURE-----

--rVyDtPztPlqMclODdYDsXVPggcPZWQDHw--

--===============1105860602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1105860602==--
