Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D9218A0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011496E1A8;
	Wed,  8 Jul 2020 14:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AC26E1A8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:22:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53532AC40;
 Wed,  8 Jul 2020 14:22:48 +0000 (UTC)
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
Date: Wed, 8 Jul 2020 16:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0539028131=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0539028131==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="G1EXzPBh3ucQm1Elpa5bVWSy8K9VswbVv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G1EXzPBh3ucQm1Elpa5bVWSy8K9VswbVv
Content-Type: multipart/mixed; boundary="6GMExq5x08fbguz4hZV69QJ6GqXXAmuod";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
In-Reply-To: <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>

--6GMExq5x08fbguz4hZV69QJ6GqXXAmuod
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.20 um 15:46 schrieb Ilpo J=E4rvinen:
> On Wed, 8 Jul 2020, Thomas Zimmermann wrote:
>=20
>> Hi
>>
>> Am 08.07.20 um 12:05 schrieb Ilpo J=E4rvinen:
>>> Hi,
>>>
>>> After upgrading kernel from 5.3 series to 5.6.16 something seems to=20
>>> prevent me from achieving high resolutions with the ast driver.
>>
>> Thanks for reporting. It's not a bug, but a side effect of atomic
>> modesetting.
>>
>> During pageflips, the old code used to kick out the currently displaye=
d
>> framebuffer and then load in the new one. If that failed, the display
>> went garbage.
>>
>> In v5.6-rc1, we merged atomic modesetting for ast. This means that
>> screen updates are more reliable, but we have to over-commit resources=
=2E
>> Specifically, we have to reserve space for two buffers in video memory=

>> while a pageflip happens. 1920x1200@32 are ~9MiB of framebuffer memory=
=2E
>> If your device has 16 MiB of VRAM, there's no space left for the secon=
d
>> framebuffer. Hence, the resolution is no longer supported.
>>
>> On the positive side, you can now use Wayland compositors with ast.
>> Atomic modesetting adds the necessary interfaces.
>=20
> Ok, thanks for the info although it's quite disappointing (not the firs=
t=20
> time to lose features with kms, migrating to it made me to lose dpms) ;=
-).
>=20
> As it's quite annoying to lose a high resolution mode (or be stuck in=20
> some old kernel), would it be technically feasible to make the framebuf=
fer=20
> allocation asymmetrical? That is, the switch to high-res mode would get=

> rejected when it would be into the smaller of the two buffers but not w=
hen=20
> the arrangement is the other way around?

I'm not sure what you mean here, but generally, there's no way of fixing
this without performance penalty.

The screen resolution is only programmed once. Later updates only
require pageflips. For each pageflip, atomic modesetting requires the
new and the old framebuffer in video memory at the same time. These two
framebuffers are typically allocated once by Gnome/KDE/etc compositors,
and compositors go back and forth between them. It's basically double
buffering.

Best regards
Thomas

>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--6GMExq5x08fbguz4hZV69QJ6GqXXAmuod--

--G1EXzPBh3ucQm1Elpa5bVWSy8K9VswbVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8F1rQUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPWfgf+IzVz44AEIAgiXKbIoIMO7tnV4ywu
85qTtv/c1IT3PxWXadlGmTOGbZQadbQA1J4xcwp9m/0WFR9o6+nmqN3AysZwjGB3
YVWocioi7iKDGhI20EX200NA+WzXUQou9DE5spgzD1nUIRymPkSTY3rhiln0cfOW
yvS9IkZyrNq/zzAweVdDulxBn74ZmyH7zTETMvMyxWI/7Oo2wcrAs/vMuYnsJPg5
9EVLRuywHvUFVrV86jfqxpEJAwNY1VyXqgAx7Va03VVHfEErzW3b8ksPEbruiBu2
qRCS/mIAkxA119X10DLUI5gZS/FjFyn6iaU91FYQO15hX6jT4IGuS5zxCg==
=vhX3
-----END PGP SIGNATURE-----

--G1EXzPBh3ucQm1Elpa5bVWSy8K9VswbVv--

--===============0539028131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0539028131==--
