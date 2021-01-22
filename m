Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57153005D7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 15:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1636E9F6;
	Fri, 22 Jan 2021 14:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EE06E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 14:46:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C975AD17;
 Fri, 22 Jan 2021 14:46:51 +0000 (UTC)
Subject: Re: possible IO map leak in drm/gem
To: Chuck Lever <chuck.lever@oracle.com>
References: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
 <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
 <357F7DBD-B7E3-4AEF-ABD4-7E7234F7DF1E@oracle.com>
 <49ED0F3F-FC66-4751-AC6F-5AD396AD1849@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4862d392-e997-a772-e81e-dca004038c7e@suse.de>
Date: Fri, 22 Jan 2021 15:46:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <49ED0F3F-FC66-4751-AC6F-5AD396AD1849@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============0826719364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0826719364==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PzDpKT8Fe0VmHTJ3eDhtsoQDmgV13JccD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PzDpKT8Fe0VmHTJ3eDhtsoQDmgV13JccD
Content-Type: multipart/mixed; boundary="WeArPT6po2QzxSSLvKS7JAIY2uH43ekkM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <4862d392-e997-a772-e81e-dca004038c7e@suse.de>
Subject: Re: possible IO map leak in drm/gem
References: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
 <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
 <357F7DBD-B7E3-4AEF-ABD4-7E7234F7DF1E@oracle.com>
 <49ED0F3F-FC66-4751-AC6F-5AD396AD1849@oracle.com>
In-Reply-To: <49ED0F3F-FC66-4751-AC6F-5AD396AD1849@oracle.com>

--WeArPT6po2QzxSSLvKS7JAIY2uH43ekkM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.21 um 15:27 schrieb Chuck Lever:
>=20
>=20
>> On Jan 21, 2021, at 10:05 AM, Chuck Lever <chuck.lever@oracle.com> wro=
te:
>>
>>
>>
>>> On Jan 21, 2021, at 9:47 AM, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>>
>>> (cc'ing dri-devel)
>>>
>>> Hi,
>>>
>>> thanks for reporting the bug.
>>>
>>> Am 21.01.21 um 15:35 schrieb Chuck Lever:
>>>> Hi Thomas-
>>>> I was not able to find an appropriate mailing list entry in MAINTAIN=
ERS,
>>>
>>> That would be dri-devel@lists.freedesktop.org
>>>
>>>> so I'm mailing you directly as committer of record for:
>>>> 43676605f890 ("drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers")=

>>>> I've noticed that since putting v5.11-rc on my test systems, overnig=
ht
>>>> on an otherwise idle system the load average seems to grow as the re=
sult
>>>> of a kernel worker thread.
>>>
>>> Earlier this week I fixed a couple of leaks in that code. Could you p=
lease apply the patch at [1] and report back if it fixes the issue.
>>>
>>> If it's a separate problem, I'll take a closer look.
>>
>> Thomas, thank you for your quick response. I've installed your patch
>> on one system and it looks promising already. I'll let it soak overnig=
ht.
>=20
> All symptoms appear to be gone. Fwiw,
>=20
> Tested-by: Chuck Lever <chuck.lever@oracle.com>

Great. Thanks a lot for testing.

Best regards
Thomas

>=20
>=20
>>> Best regards
>>> Thomas
>>>
>>> [1] https://lore.kernel.org/dri-devel/20210118144639.27307-1-tzimmerm=
ann@suse.de/
>>>
>>>> I used "perf top" to see what it had gotten up to, and it appears th=
at
>>>> it was spending lots of time walking an interval tree on behalf of
>>>> memtype_reserve().
>>>> The most frequently-observed stack trace seems to be:
>>>>      kworker/3:1-2355  [003] 60950.150928: function:             mem=
type_reserve
>>>>      kworker/3:1-2355  [003] 60950.150942: kernel_stack:         <st=
ack trace>
>>>> =3D> ffffffffc0c66083
>>>> =3D> memtype_reserve (ffffffffa005f9d5)
>>>> =3D> __ioremap_caller (ffffffffa005aac1)
>>>> =3D> ttm_bo_vmap (ffffffffc040f266)
>>>> =3D> drm_gem_vram_vmap (ffffffffc042c5cd)
>>>> =3D> drm_gem_vmap (ffffffffc0506a7f)
>>>> =3D> drm_client_buffer_vmap (ffffffffc0523741)
>>>> =3D> drm_fb_helper_damage_work (ffffffffc049a34a)
>>>> =3D> process_one_work (ffffffffa00dd92e)
>>>> =3D> worker_thread (ffffffffa00dde46)
>>>> =3D> kthread (ffffffffa00e22c4)
>>>> =3D> ret_from_fork (ffffffffa0004192)
>>>> I see a regular call to memtype_reserve(), but never a matching call=
 to
>>>> memtype_free(), thus I suspect a leak of I/O maps in this code.
>>>> --
>>>> Chuck Lever
>>>
>>> --=20
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>> (HRB 36809, AG N=C3=BCrnberg)
>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>> --
>> Chuck Lever
>=20
> --
> Chuck Lever
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


--WeArPT6po2QzxSSLvKS7JAIY2uH43ekkM--

--PzDpKT8Fe0VmHTJ3eDhtsoQDmgV13JccD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAK5VoFAwAAAAAACgkQlh/E3EQov+Bt
BQ//ZinRtLvJ//G20siD7SaEWj5MqExiUGKbc5tMnPlR1GROzFyy/GlbRsY+GVQ4DlmgGRF0es71
A6QQk4Pje2U1KVwg4Q0WURgiqGPmx43WQIU9YUug4RtH/saFi249RzttQTkbO4OWHvvFGhlqfODg
yrFlPfeySK9J/bkfjYlw6f+w7F/HWDyoOWw/N6SUejdvbaCGEOdSeo3BCOOHMnp5nqDmCkMYVLiN
6wa48JDhs7tfdYkhbVXAsXJZcxOt95pS2itMlLoqLNRczsX4Y99+t/VB5AY3ITuFBkKKCgP08TbV
Tw5sd361keJdh8FgAf8dYxbLPwhIf92KtHkaGYrKCI2MEtlSsOHqc3jEXMTZw0V58hseRKFsE6tj
uMz9kKk2NVv6iEldW9l3/T3Hy9GARU3jXkbIIQivks+tjFjiXKuqe6gzB2uB75F05moKKA+Avxfw
A1W1hTpQaVL5hiA8lChdSyGPilQCLWuvAH5mjpD6eeSAeehmTuAR13Fsw4GINn8ITQwQeF1KuAP+
H8P523aeXn0oFSdhTCo/xM04gyXeV62DZaw1Qxe61GDTE7ZQmTnRqAQOazabGrn//fkP44eb6tk9
iNs6ZgcgWtWXX1IifUCO9+dk4Anso4e1OGO4dB7n8Zz/4v8smDz08YlSVTF0d667t5aA4vqsfWEY
Cbs=
=mYeQ
-----END PGP SIGNATURE-----

--PzDpKT8Fe0VmHTJ3eDhtsoQDmgV13JccD--

--===============0826719364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0826719364==--
