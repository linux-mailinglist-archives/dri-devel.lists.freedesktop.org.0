Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A893B95D94C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 00:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7C910E12C;
	Fri, 23 Aug 2024 22:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="euEpsW/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9697A10E0D2;
 Fri, 23 Aug 2024 22:37:42 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240823223740euoutp02f94f307961b576faf3625d7f885e0bef~ufI7mAKbF2371223712euoutp02a;
 Fri, 23 Aug 2024 22:37:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240823223740euoutp02f94f307961b576faf3625d7f885e0bef~ufI7mAKbF2371223712euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724452660;
 bh=la+dmPvqL+EWy5obzmiWKZwg6xJbELHXa4/+KgHJQwI=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=euEpsW/Rvuc6d+ZRYsoU9kpXOZqIO++KiBbHwjcWs7/27Epw182ChL8xMtFKb95fM
 TQHtpAcTSWP2lKpO4EGch0IhOeIey6GRhieK5D8Sg0YzyRPcbkwQs7IbGBtdSyoIw9
 vuLKEyuiOhE1azL29fu+Is0jX1o9WBP/kZSc662U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240823223739eucas1p1d2e2fdb71acba6555e61a19e652330fd~ufI6vhsU00738507385eucas1p1H;
 Fri, 23 Aug 2024 22:37:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E1.39.09875.33F09C66; Fri, 23
 Aug 2024 23:37:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240823223738eucas1p267239cadb138dd98aca9726a2730f898~ufI51jkkR2704127041eucas1p2c;
 Fri, 23 Aug 2024 22:37:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240823223738eusmtrp19f8d1b50dbf15807756173e179310203~ufI50aIvc0353703537eusmtrp1W;
 Fri, 23 Aug 2024 22:37:38 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-5f-66c90f334884
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C3.02.09010.23F09C66; Fri, 23
 Aug 2024 23:37:38 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240823223738eusmtip2280dc31c1420e8cf3bd6b408a3157d73~ufI5guU1S2640326403eusmtip2Q;
 Fri, 23 Aug 2024 22:37:38 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 23 Aug 2024 23:37:38 +0100
Date: Sat, 24 Aug 2024 00:37:36 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
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
 <gost.dev@samsung.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
Message-ID: <20240823223736.mosqrdcwqanvdpmd@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2024080758-dedicator-smoky-44be@gregkh>
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0ybZRTG9363FkbZRyHjDQwd6DCTjbkB+i4iilv0S6bgosaoiVrHR0e4
 NS0IU4lMkNtg497RjVKKtFyHKwVLudQh0FXGiMFsMCybGbchdxgXR1YpZbr/fuc5zzk5z5u8
 XJy/QrlxI2LiWHGMIMqLsieae9b7D/rtMoW/tHoOouu3lRiaU2UD1FMziaNWixlHluY8HP3x
 cI5CKRUNFFprnMTQ3Q41hmZL96Di2goKyX83EWhK+yuBNPdvkWhDr8PQgP4yhW5U5HDQaKGB
 QmP3VRQqX2gi0F/3BknUctlEovaGAQppBpZIlJapIlF69RiF5nMtGNIb1gk03n6dREXr0xSa
 ye3moOF8KYEMslscVLUmBajf2MNBzbo+gCb6CwAqGR4G6G/d5mbtdB6JlGmvoNQ/A9BQ5U+c
 N3yYOnkdYNp6+iimfUVBMPrORoppkZk5jEITz6R2zZBMRdsDjNHUZFKMPFOOMZaceyTTZVFy
 mPLkIpyRm04yhtI6DnP3nBF7D35iHxjGRkV8xYoPBX1hf7rYLBKtOiQOjv2AJ4Nq+yzA5ULa
 HyoLhVnAjsunqwBs1T2TBew3eRnA9DtNmK1YAvDqL3LM6rIOlFy4BGwNNYANRaOc/1zm6lLS
 VjQC2GvoJ60jBL0Pds1Lt5ii98MOk4ZjZRfaD17ok21N4/TNXVAlndsyOdOvwUl1G2VlHn0C
 muVl2+wETSWjhJVx+gBUtC5S1hA47Q7Vj7lW2Y4OgBlT2YTtVE94Ma96m5Pgb9o7W3kgXbsT
 PjQ1k7bGcajQDnFs7AynjNpt3gN7C54sEsIfr8i2WQTbhmWk7fFehedvRNnkYDittOayyo5w
 cMbJdqUjzG+W4jaZBzPS+Da3N6wdmSZywXOyp3LJnsol+z+XAuA1wJWNl0QLWcmRGDbBVyKI
 lsTHCH1PxUZrwObX6H1sXNYB9dSCbyfAuKATQC7u5cL7cqQ7nM8LE5z5mhXHfi6Oj2IlncCd
 S3i58vaFPcvyaaEgjo1kWRErftLFuHZuyVjG2XEdC/K/l8jU1MTk1fp5mX71Y8ek4haqcsRf
 4Hl0h2Xc4+VDq94NL7ydcD4lOCMgZKn+/Y7ZgLqI7H8+Gkq4krT4YdCRWvNgXBlv7gOfadeg
 R/z67zx2pKhCVHuzNhZ3xpXnOCRqXPTjmXo/V/9jvsszIcVVUZ8tB35z8Xb7NZfG4LV3Z5YX
 HaoHnfannyp4/dHs2QCT4Zq7QrI7sm7kuE/Z4pnynyVpR59X8ss7tSsHdn8L8Xfy2rGmhZS2
 roORiVme3VWfJiHlVKv3xoTfA4XnpVDpzbHKbudYcXxKodBdYtmbXSwykr6TxsOpG6GNHoEb
 4aYTuW+edAvNZ3vXat/yIiSnBYdfxMUSwb8QAe+siQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTG8957e29hdNwVFl8+lkCNW0QtFCi8bAjO6XYJy7It2bLgDFa4
 ghEoa6mbc1vqVEYRQnETRoWKMMAyEC0fKQgSO2hphBFF0AX5GtQB5UOEoTCka8Vl/vdLnvM8
 5+Tk4eL8AtKbezgtg5WlSVIEpCtxc908vCPY3XIoaHnZC3XdLcPQfGUOQKbqSRxdsw/hyN6U
 j6M7f8+T6GR5HYme1E9iaOR6FYbmSnxRwa/lJNLeshBouuE3AunHBzhorcWAob6WYhJ1l+dS
 aOKndhJZxytJdHGhkUBjo/c4qLnYwkFtdX0k0vctclCmqpKDftBZSfRQbcdQS/sKgR60dXHQ
 uZUZEs2qOyk0eLaQQO2aAQpdelIIUK/ZRKEmQw9Af/X+CFDR4CBANoMjuWEmn4PKMsPRqfti
 9EfFFWrXNqZGWwOYVlMPybQtlxJMi7GeZJo1QxRTqlcwpzpmOUx56xTG6KtVJKNVaTHGnjvK
 YTrsZRRzUXkOZ7SWj5j2khqKGTljxj6EccJImVSRwfolS+UZOwX7RChYKIpAwuDQCKEoJHz/
 m8FiQWBUZCKbcvgoKwuMOiBMLhhKT3/s9tU962lcCXSu2cCFC+lQWJR3HmQDVy6frgDw+74b
 YEPwhVeX+jkb7AHXBrLJjaEFANutq5hT4NP1ABad5DqZoLfAjoeFzwwkvRVet+gpJ3vSITCv
 R0M5zTj9uzssWe3HnYIHvRNOVrWSTubRsXBIe+H5hkYM3skaABvCK9BSNEE4Gae3w9JrjxxD
 XAf7wKr1Z4tdaDHMms4hNi71hz/n657zt3Dx6QOgBh6aF5I0LyRp/k8qBXg18GQV8tSkVHmw
 UC5JlSvSkoQJ0lQ9cBS0ybTSYAC66QWhEWBcYASQiws8eQeHOw/xeYmSY1+zMmm8TJHCyo1A
 7PhFPu79aoLU0fC0jHhRWJBYFBoWESSOCAsRbOLFpGdJ+HSSJIM9wrLprOw/H8Z18VZiKYb3
 x6h3s+bss9rFHM8xYmq04gOf1yv9extd8+QJzae73jprEH53w91avv1qa0fivi+83Ibf89nN
 +PIeKXcdBwdG1v+piP445LMTl+t180dVNrPSVhKUu5moxZsUMdLxy8baz93QiCRaGRXuV2OP
 nou/sPU19Z7GhaR3bq8YOKvdZ9jdzXsks0vjv2BeR3h8lfmTgxSjjvx0aXSLyG43ztxsi/Gb
 zTPF3SquIsbd9sCqx6rN5223bZENWlOdJDt2Ymr/peU4c+2oba//1HDA2v2XYt7I1xUdf0pu
 utKssL58TG8Q9Qb9mf2ldEdgf+zdbQSZ0s2P6DwxrM58+5vlALGAkCdLRAG4TC75F3l4CCUp
 BAAA
X-CMS-MailID: 20240823223738eucas1p267239cadb138dd98aca9726a2730f898
X-Msg-Generator: CA
X-RootMTR: 20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <CGME20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4@eucas1p2.samsung.com>
 <2024080753-debug-roulette-8cb1@gregkh>
 <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>
 <2024080758-dedicator-smoky-44be@gregkh>
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

On Wed, Aug 07, 2024 at 04:19:42PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 07, 2024 at 01:56:38PM +0000, Daniel Gomez wrote:
> > On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay wrote:
> > > > This patch set allows for building the Linux kernel for arm64 in macOS with
> > > > LLVM.
> > > 
> > > Is this a requirement somewhere that this must work?  It seems like an
> > > odd request, what workflows require cross-operating-system builds like
> > > this?
> > 
> > This isn't a requirement, but it would, for example, support workflows for QEMU
> > users and developers on macOS. They could build/compile the kernel natively and
> > use it to launch QEMU instances, simplifying their process.
> 
> But that's not a real workload of anyone?  How often does this ever come
> up?  Who is going to maintain this cross-build functionality over time?

The delta is becoming very small thanks to the latest patches from Masahiro.
Earlier this week (next-20240820) [1] I rebased the work with all the feedback
and the patch series has been reduced to 7.

For the maintenance part, I suggest keeping a CI to build and boot the lastest
linux-next tag available. I can set this up here [2] and take the responsability
for maintaining that. But I would be convenient to add documentation for it in
the LLVM section and mark this as 'experimental'. If that's okay, I will prepare
a v2 with this.

[1] https://github.com/SamsungDS/linux/commits/b4/macos-build-support/
[2] https://github.com/SamsungDS/linux

> 
> thanks,
> 
> greg k-h
