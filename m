Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70242FED4E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 15:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFF66E0B9;
	Thu, 21 Jan 2021 14:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD46E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 14:48:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D52DEABD6;
 Thu, 21 Jan 2021 14:48:00 +0000 (UTC)
To: Chuck Lever <chuck.lever@oracle.com>
References: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: possible IO map leak in drm/gem
Message-ID: <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
Date: Thu, 21 Jan 2021 15:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============1808306975=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1808306975==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XS019a1nfOAK9mZ3frGlW6J37uOvZg3YY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XS019a1nfOAK9mZ3frGlW6J37uOvZg3YY
Content-Type: multipart/mixed; boundary="L7M6HbTIbLUXlWH1YkOVVlscSIR3NxxVf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
Subject: Re: possible IO map leak in drm/gem
References: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
In-Reply-To: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>

--L7M6HbTIbLUXlWH1YkOVVlscSIR3NxxVf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc'ing dri-devel)

Hi,

thanks for reporting the bug.

Am 21.01.21 um 15:35 schrieb Chuck Lever:
> Hi Thomas-
>=20
> I was not able to find an appropriate mailing list entry in MAINTAINERS=
,

That would be dri-devel@lists.freedesktop.org

> so I'm mailing you directly as committer of record for:
>=20
> 43676605f890 ("drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers")
>=20
> I've noticed that since putting v5.11-rc on my test systems, overnight
> on an otherwise idle system the load average seems to grow as the resul=
t
> of a kernel worker thread.

Earlier this week I fixed a couple of leaks in that code. Could you=20
please apply the patch at [1] and report back if it fixes the issue.

If it's a separate problem, I'll take a closer look.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210118144639.27307-1-tzimmermann@suse=
=2Ede/

>=20
> I used "perf top" to see what it had gotten up to, and it appears that
> it was spending lots of time walking an interval tree on behalf of
> memtype_reserve().
>=20
> The most frequently-observed stack trace seems to be:
>=20
>       kworker/3:1-2355  [003] 60950.150928: function:             memty=
pe_reserve
>       kworker/3:1-2355  [003] 60950.150942: kernel_stack:         <stac=
k trace>
> =3D> ffffffffc0c66083
> =3D> memtype_reserve (ffffffffa005f9d5)
> =3D> __ioremap_caller (ffffffffa005aac1)
> =3D> ttm_bo_vmap (ffffffffc040f266)
> =3D> drm_gem_vram_vmap (ffffffffc042c5cd)
> =3D> drm_gem_vmap (ffffffffc0506a7f)
> =3D> drm_client_buffer_vmap (ffffffffc0523741)
> =3D> drm_fb_helper_damage_work (ffffffffc049a34a)
> =3D> process_one_work (ffffffffa00dd92e)
> =3D> worker_thread (ffffffffa00dde46)
> =3D> kthread (ffffffffa00e22c4)
> =3D> ret_from_fork (ffffffffa0004192)
>=20
> I see a regular call to memtype_reserve(), but never a matching call to=

> memtype_free(), thus I suspect a leak of I/O maps in this code.
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


--L7M6HbTIbLUXlWH1YkOVVlscSIR3NxxVf--

--XS019a1nfOAK9mZ3frGlW6J37uOvZg3YY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAJlB8FAwAAAAAACgkQlh/E3EQov+Ch
kw/+PUAtFGYfW696HXY7UYmZtUsyL1yRR9mfa1Hc1uCLNIf5lzBJgDKr89RTs5hC+/h2Sgkp7VkY
EaR8RXK5tvuNxBUYEcqZ3adFiAseTYbXzcEeVnjKZLv3TY1EIURFexSBkZljP4uJFrEWjkmrInob
jdo8TCMSDHYEXEEEF2cf26E6M3tzBG+8AiyH2QRDWZ0jKEoLDvkzIsq9I49Kzh8NGHySqGCwmZ7W
JXL4ng0KkjVLJ74hzYt/ljeVwZFryyc0+p7HEQjZx3yLGdN5FQa+2vOaXgkbpw4FwTmE5PQ65YBG
et6qGWlQ3+c+IvEj+7X1gbtNXUdLVPi38r5ZtpJaBLkF0Vk2WKxG3mLayyuu7gA5sCd95oUlymk4
F9H7twe+hfct+3oOHM89H09xsoZMR4yQ7OB8/CjonK/11h/8ck61lYLabtk/GXg/e995n6TwWhe2
RjYRdz/8IT6aTxhON/nb1SNrxxpOD55jg5q6O40cWBHVWRt7J25Mom6/x8KyL4m9b9JQ+2k2DC3Z
8e0EV2dc6sY2e6c/yLT2TkSWgLj+a90+6m047MTypBqYNqCnPBnks8pag6OUkO/SS3leG5IjSG7y
oe9AqzlvzGGixMbexF/eoNcE2YSqYKjPoLDBzP2SKJ+XlTaoWfpepfsyVqQxQZCsVXQwVP5Dxmz1
KKc=
=UrhZ
-----END PGP SIGNATURE-----

--XS019a1nfOAK9mZ3frGlW6J37uOvZg3YY--

--===============1808306975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1808306975==--
