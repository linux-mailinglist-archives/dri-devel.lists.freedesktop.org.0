Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE194B126
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DE710E5BA;
	Wed,  7 Aug 2024 20:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MOSbhYoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A1A10E534;
 Wed,  7 Aug 2024 14:14:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240807141400euoutp01cd1c4bad1586ae81de4118e754f88435~pd8mS23ie2296422964euoutp01S;
 Wed,  7 Aug 2024 14:14:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240807141400euoutp01cd1c4bad1586ae81de4118e754f88435~pd8mS23ie2296422964euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723040040;
 bh=faAY5+pwQOX2l8/iVIHLwz0WYOtMMXWn6lu1UB+tpaU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=MOSbhYoZABvgtH55ykf1+xwecfQ6Hr3K49FiCYjv6M4cx2VG4DR2Xcx02LGg37t4/
 aHtKSqBEtSS871chB7ZcUOnQqvlYgdt0vMTiFnKZ4vbJKjlEHSwGDm4c4KebLErUf0
 4kiaGu6qBusMwWGpB4pD8XU67lZShMEztnRQNAZU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240807141359eucas1p1b74b6e89b491c49e0b9a5dd05694dfea~pd8l7a3mv2160121601eucas1p1I;
 Wed,  7 Aug 2024 14:13:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 62.D2.09620.72183B66; Wed,  7
 Aug 2024 15:13:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240807141359eucas1p2c07121390ff2ca9877113eb10d8d5454~pd8lWW04i2189021890eucas1p2C;
 Wed,  7 Aug 2024 14:13:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240807141358eusmtrp1c84d84dc6bca38050a03a3a2e2a54c0a~pd8lM8GRX0561705617eusmtrp1_;
 Wed,  7 Aug 2024 14:13:58 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-f8-66b38127c431
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 05.D1.09010.62183B66; Wed,  7
 Aug 2024 15:13:58 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240807141358eusmtip1044ec5848df956a10e250dfb9fa77c19~pd8k15j1l1402214022eusmtip15;
 Wed,  7 Aug 2024 14:13:58 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 7 Aug 2024 15:13:58 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
 ([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Wed, 7 Aug
 2024 15:13:57 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, William Hubbs
 <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser
 <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul
 Moore <paul@paul-moore.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James
 Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "speakup@linux-speakup.org"
 <speakup@linux-speakup.org>, "selinux@vger.kernel.org"
 <selinux@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
 <kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
 (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com"
 <gost.dev@samsung.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
Thread-Topic: [PATCH 08/12] include: add elf.h support
Thread-Index: AQHa6FXbwJqdyqi0MEugpUJUhAmSv7IbkbaAgAA07gA=
Date: Wed, 7 Aug 2024 14:13:57 +0000
Message-ID: <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
In-Reply-To: <2024080717-cross-retiree-862e@gregkh>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [106.110.32.67]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A8302F3D0EFD6A4A8B5DE787ED2EDA0D@scsc.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1CUZRTGe7/rQkEf4MQbl5pWHSagDQeNVytTJuubiKRpJqcczE0+wOEi
 7UKiwzS7YSSEggYJC6wsOy7XBJdLXBcC3GWjbSvksiCh3FIuLoKAMsbGsujw3++85znPc84f
 Lw93zqDdeMdj4zlRrDCaT9kTddpHxte8pNXhfqNad9TVX4QhsyodIG3ZHRw1WYZxZKm7gKMb
 i2YKJSsrKfSw+g6GRjTFGLpX4IF+KldSSP6XnkBTNR0EUo/1kehxYz2GehrzKfS78hyNxrNa
 KTQxpqKQ4n4tgW7fGiBRQ76eRC2VPRRS9yyQKCVVRaLvSycoNJdpwdBkSxeJsh/NUGg28zqN
 hi5eIlCrrI9GJQ8vAWTUaWlUV28A6F/jjwDlDg0BNF2/Zlozc4FERSkB6MzNXch0pYre581W
 yCsA26w1UGzLUiHBNrZXU2yDbJhmC9UJ7JnOWZJVNt/FWHVZKsXKU+UYazl3i2Q7LUU0q5Bk
 46xc/zHbWlBBsyM/6LAQ+Ln9W2Fc9PGvOdHre4/aR+p6ysi4pa2Jq3I5LgEmjzRgx4PMTpg1
 l06lAXueM1MC4NQ9HW4rHgD4q2QVsxULAHZXaPAnIyPJOcDWKAawIyeTeqqS5FzdKLoBtEh1
 xFNnY1susM5TzKtQo1fTVt7C+MMMg4y2inBG8TycN/633nBhdsG7sge4TfQGNJt715i3xntg
 lSnS+kww26BJriCs7MAEQ3NFJWaV2K15js8esj4DxhOOlq6sO+KMKxwcv4zZTnCCRXnNG+e8
 AFcbb1M29oWG/nFgYz9Ye0VD2PgVeFZromw+AjiQnbXBu+HSnxnAxj5QpZjGbes4QX3u+Prt
 kEl7Dt6qbSatu0HmXTjd52nzdIFTuho6E/jKNq0n2xQh2xQh2xQh2xRRCMgy4MoliGMiOLF/
 LHdSIBbGiBNiIwTHTsSowdqf6V7VLdaDkqn7gnaA8UA7gDycv8Uh+ZA63NkhTHjqNCc68YUo
 IZoTtwN3HsF3ddge9jLnzEQI47kojovjRE+6GM/OTYJxjLArJ1B6UpweYCBvyt5rOvKzVBH0
 pYS3NVTjpw7usXsm8bwm7Pr7fvu/mvIyL4TscZmn/xZqAhbjEso9j2RfG4g9rDLkO5qKPfIW
 /tmt7zIQb5N1ScM+jr7ly4+z31lWnYLFUZ8GVeesyNz79j/bFtiQN7AanSrA9/psc4r55Y8B
 f5PXZW9fF8GHSna+tzZ8LmmypS1K4jQfGJLudTXRcTtM/m1hLOXFfZ2jWWX9obK0oMnasyXl
 hE56bNDSQ39W4M3nn764I5d/baW8qWOxNHhnYX79N5ZBI+/GS6HLb54vNbtNVPUqk/UfiMfk
 Uo+DizWHvztanPTtzCcH4w985KDgE+JI4Q5vXCQW/g/JtsWJogQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHd+69vS11nXeVxwnBbJbFCJuV8vJgkJG4sbuYEeYySeYWLHrL
 Q6CspW5sk+BgDBDCYwKzk473ayhYoCCDoh2vytOAPCWwAQqiFMQxcQhrKUv473PO+X6/v9/v
 JD8Ozs9m23JCIqIYWYQ4TEByia6NjomD+y/WSJyqSw6izuECDBlKUgBqr5jD0e+bEzja1GTg
 aPBvA4niCqtI9LxmDkOT2lIMLebaoezfCkmkuqsn0KPaPwiknh5iofXGBgwNNF4lUXdhKhvN
 XG4h0ex0CYnyl+sI9OfUCAvdvKpnoeaqARKpB1ZYKCGphIV+LJ8l0VL6JoYeNHeyUNbaYxI9
 SW9jo/HMHAK1KIfYqOx5DkB9He1spGnoAehh308AXRkfB2ihwRha+ziDhQoSDqP4+25otLia
 7e1IV6oqAd3U3kPSzat5BN2oqyHpm8oJNp2nVtDxrU9YdGHTPEarK5JIWpWkwujN1CkW3bpZ
 wKbzY7NwWqX/mG7JrWTTk5c6MD/4mdBTJlVEMW8GS+VRRwWnRMhZKPJAQmdXD6HI5fAXR5zd
 BIe8PM8yYSHnGdkhr9PC4I6BClbkqv3XGyoVHgtG7ZKBBQdSrnAy7meQDLgcPlUMYP2teNz8
 YAdvPLvHMvMeuD6UTJqYTy0DqKqnzIYuAH+4ns42H8oA7B7tBCYVSTlArV7NNrEl5QLTepRb
 IpzK3w3Lequ3YvdQbnBe+Qw3i9yhwXDPyBwjH4HVo8Gma4J6C46q8gkT86iPoKGyCjN3EY/B
 xLtHTXILY/7ME3/TNaD2wr/KX2yVxSkbODbzK2YegIJFTX3bg1nB+emN7cHegT3DM8DMTrCu
 WEuYeR9MbB8lzTlCOJJ1eZs94Gp/GjDz27AkfwE3t/Y61F+ZIdKBnXJHaeUOu3KHXbnDrtxh
 zwOsCmDJKOThQeFyZ6FcHC5XRAQJz0jD1cC4IJr2tdoGUP5oWagDGAfoAOTgAktenL9awued
 FUd/w8ikATJFGCPXATfj12XgtlZnpMYNi4gKELk7uYlc3T2c3DzcXQQ2vA8jE8V8KkgcxZxj
 mEhG9r8P41jYxmKZ3p5oscNlLNS67gEeZneNey3HSwHrn/peLFray43+fMJi1S5Q4VXqEKPO
 ya4PeMnMnTtJpI3dzhi0cXG8Pn2s0PDGv6qB0Ohbuvd81ta5X7W9uJMZmblS0xWY0j9vfyGh
 1xOvsd316g1bTU/CqTsjeqFj7LTWR3vpdpve19dw/wT2UHpac6zDn/du2u5wOqS3Fufkvi/8
 ZVwgSZG4no+dO3EhJ3DRPrNvNnGZyVvqWtn33Vi56JXSegm32zpoUMfpj2n93tpHMqjpfnnc
 G518zapYO3Bggf+U6Pl2ZV3Gn/L75LjDAYvB/aHpMV8OlykCeX6+TqlrUvCPp6xo16cfOAoI
 ebBY5IjL5OL/AOmSXZ2pBAAA
X-CMS-MailID: 20240807141359eucas1p2c07121390ff2ca9877113eb10d8d5454
X-Msg-Generator: CA
X-RootMTR: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh>
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 07, 2024 at 01:04:29PM GMT, Greg Kroah-Hartman wrote:
> On Wed, Aug 07, 2024 at 01:09:22AM +0200, Daniel Gomez via B4 Relay wrote=
:
> > From: Daniel Gomez <da.gomez@samsung.com>
> >=20
> > Add a copy of elf/elf.h header from the GNU C Library (glibc), version
> > glibc-2.40 into include/elf. Update Makefiles where elf.h header is use=
d
> > to ensure the compiler can find all necessary headers, for macOS host
> > where these headers are not provided by the system.
> >=20
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  arch/arm64/kernel/pi/Makefile     |    1 +
> >  arch/arm64/kernel/vdso32/Makefile |    1 +
> >  arch/arm64/kvm/hyp/nvhe/Makefile  |    2 +-
> >  include/elf/elf.h                 | 4491 +++++++++++++++++++++++++++++=
++++++++
> >  scripts/Makefile                  |    3 +-
> >  scripts/mod/Makefile              |    6 +
> >  6 files changed, 4502 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makef=
ile
> > index 4d11a8c29181..eb782aaa6585 100644
> > --- a/arch/arm64/kernel/pi/Makefile
> > +++ b/arch/arm64/kernel/pi/Makefile
> > @@ -20,6 +20,7 @@ KBUILD_CFLAGS	:=3D $(filter-out $(CC_FLAGS_SCS), $(KB=
UILD_CFLAGS))
> >  KBUILD_CFLAGS	:=3D $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> > =20
> >  hostprogs	:=3D relacheck
> > +HOSTCFLAGS_relacheck.o =3D -I$(srctree)/include/elf
> > =20
> >  quiet_cmd_piobjcopy =3D $(quiet_cmd_objcopy)
> >        cmd_piobjcopy =3D $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
> > diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso=
32/Makefile
> > index 25a2cb6317f3..e1ac384e6332 100644
> > --- a/arch/arm64/kernel/vdso32/Makefile
> > +++ b/arch/arm64/kernel/vdso32/Makefile
> > @@ -107,6 +107,7 @@ VDSO_LDFLAGS +=3D --orphan-handling=3D$(CONFIG_LD_O=
RPHAN_WARN_LEVEL)
> >  # $(hostprogs) with $(obj)
> >  munge :=3D ../../../arm/vdso/vdsomunge
> >  hostprogs :=3D $(munge)
> > +HOSTCFLAGS_$(munge).o =3D -I$(objtree)/include/elf
> > =20
> >  c-obj-vdso :=3D note.o
> >  c-obj-vdso-gettimeofday :=3D vgettimeofday.o
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe=
/Makefile
> > index 782b34b004be..40541c0812bf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -15,7 +15,7 @@ ccflags-y +=3D -fno-stack-protector	\
> >  	     $(DISABLE_STACKLEAK_PLUGIN)
> > =20
> >  hostprogs :=3D gen-hyprel
> > -HOST_EXTRACFLAGS +=3D -I$(objtree)/include
> > +HOST_EXTRACFLAGS +=3D -I$(objtree)/include -I$(srctree)/include/elf
> > =20
> >  lib-objs :=3D clear_page.o copy_page.o memcpy.o memset.o
> >  lib-objs :=3D $(addprefix ../../../lib/, $(lib-objs))
> > diff --git a/include/elf/elf.h b/include/elf/elf.h
> > new file mode 100644
> > index 000000000000..33aea7f743b8
> > --- /dev/null
> > +++ b/include/elf/elf.h
> > @@ -0,0 +1,4491 @@
> > +/* This file defines standard ELF types, structures, and macros.
> > +   Copyright (C) 1995-2024 Free Software Foundation, Inc.
> > +   This file is part of the GNU C Library.
> > +
> > +   The GNU C Library is free software; you can redistribute it and/or
> > +   modify it under the terms of the GNU Lesser General Public
> > +   License as published by the Free Software Foundation; either
> > +   version 2.1 of the License, or (at your option) any later version.
> > +
> > +   The GNU C Library is distributed in the hope that it will be useful=
,
> > +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > +   Lesser General Public License for more details.
> > +
> > +   You should have received a copy of the GNU Lesser General Public
> > +   License along with the GNU C Library; if not, see
> > +   <https://www.gnu.org/licenses/>.  */
>=20
> I understand your want/need for this, but new files need a SPDX license
> header instead of this type of license boilerplate.  Didn't glibc
> already convert to SPDX?

I don't think they've done the conversion. But I can add the SPDX header if=
 we
move forward with the patch series, and ask them if they have any plan to a=
dopt
the SPDX standard.

>=20
> Also, as this is not internal for the kernel, but rather for userspace
> builds, shouldn't the include/ path be different?

Can you suggest an alternative path or provide documentation that could hel=
p
identify the correct location? Perhaps usr/include?

>=20
> thanks,
>=20
> greg k-h=
