Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91495324BC9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 09:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B203A6EC5E;
	Thu, 25 Feb 2021 08:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7840F6EC5E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:12:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CE6BAD29;
 Thu, 25 Feb 2021 08:12:43 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6754ac45-b433-65cf-02a7-a785f616b8a8@suse.de>
Date: Thu, 25 Feb 2021 09:12:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0625366592=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0625366592==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q3Y8pq1gmGDqeAQLrtYeD1RTJy8NOnfKN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q3Y8pq1gmGDqeAQLrtYeD1RTJy8NOnfKN
Content-Type: multipart/mixed; boundary="xbKP5U2HLdckZH79P44g6kdw7vY16HwvJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <6754ac45-b433-65cf-02a7-a785f616b8a8@suse.de>
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
In-Reply-To: <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>

--xbKP5U2HLdckZH79P44g6kdw7vY16HwvJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.02.21 um 18:14 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 19.02.2021 14.54, skrev Thomas Zimmermann:
>> Hi
>>
>> Am 19.02.21 um 13:22 schrieb Noralf Tr=C3=B8nnes:
>>> dma-buf importing was reworked in commit 7d2cd72a9aa3
>>> ("drm/shmem-helpers: Simplify dma-buf importing"). Before that commit=

>>> drm_gem_shmem_prime_import_sg_table() did set ->pages_use_count=3D1 a=
nd
>>> drm_gem_shmem_vunmap_locked() could call drm_gem_shmem_put_pages()
>>> unconditionally. Now without the use count set, put pages is called a=
lso
>>> on dma-bufs. Fix this by only putting pages if it's not imported.
>>>
>>> Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing")=

>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>
>> Just when I saw the error. Nice. :)
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>=20
> Should I apply this to drm-misc-fixes?

I think so. Ping me if you want me to add it.

Best regards
Thomas

>=20
> Noralf.
>=20
>> For testing the GUD driver, you may also want to keep an eye at [1]
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://lore.kernel.org/dri-devel/02a45c11-fc73-1e5a-3839-30b080950af8=
@amd.com/T/#t
>>
>>
>>> ---
>>>  =C2=A0 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
>>>  =C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index 9825c378dfa6..c8a6547a1757 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -357,13 +357,14 @@ static void drm_gem_shmem_vunmap_locked(struct
>>> drm_gem_shmem_object *shmem,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (--shmem->vmap_use_count > 0)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 if (obj->import_attach)
>>> +=C2=A0=C2=A0=C2=A0 if (obj->import_attach) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_vunma=
p(obj->import_attach->dmabuf, map);
>>> -=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vunmap(shmem-=
>vaddr);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_shmem_put_pages(s=
hmem);
>>> +=C2=A0=C2=A0=C2=A0 }
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shmem->vaddr =3D NULL;
>>> -=C2=A0=C2=A0=C2=A0 drm_gem_shmem_put_pages(shmem);
>>>  =C2=A0 }
>>>  =C2=A0 =C2=A0 /*
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--xbKP5U2HLdckZH79P44g6kdw7vY16HwvJ--

--Q3Y8pq1gmGDqeAQLrtYeD1RTJy8NOnfKN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA3W/oFAwAAAAAACgkQlh/E3EQov+B3
vQ/9GFgfTvied8TKOvb8wfeKWR2hrGhy1Xsg3zgcypda5+Ku1ShT/TuqnYZ2tmGuSZg2grXLi9ks
0fAzWITgeoPQr97qyYle9iSNJyuAHSP3XkHCyS37HIdtRryYSDCQZq3/5as7DCzws+Nxk50vzifx
xFeC06/Na+KppKxyW92M1QjrU+gJw7/1m3Dq+nlfC9+Sjsyrtx9cJ4TW+pIC0uYyNkxufn9mmH4e
3gWlXAZ7UckIqIG/w2W6XWtByWU52gr0igA9r0MI9oxLGM+0O6M2EwvTvtTDK+Fr46s5ZpGV4RBe
kNL3yFrW1AWgjRu4lXPjdLuRrkTwa2cpQBmThGIwHwibeOcYxiAcC7stncIUJFado1+cQnsD9TvT
EsPEUlU5chSPK88ugAjWCUVCQ44YIyfi204LEJRBUL7zYFXo2J/6GfKtxFRnLiAZTxBpYH7FmjQM
ze5UIqVe0HqDCsvuFOUa/oGhA0FO/crL846LDjE+deHHtOmIk25fk4qmhWbBcr9ojvXEnrZHRDYg
+DoRvXqi5DUCb7Sf8IRUXyhTianWKE1VM9OXpL9Fa9nvRTM3GxIGal0DVlsR/LJHd3RAKPJUfzUr
zdVItJf5JiRY9g2IkJTrsKR2Ws/0IYuYgk9+bPecglL1HZHUOkhCGVeX2sf62j1Y5s9UxR6/6/ho
Rdc=
=F9F3
-----END PGP SIGNATURE-----

--Q3Y8pq1gmGDqeAQLrtYeD1RTJy8NOnfKN--

--===============0625366592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0625366592==--
