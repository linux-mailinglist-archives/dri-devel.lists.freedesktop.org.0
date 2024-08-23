Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52995D95D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 00:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626410E136;
	Fri, 23 Aug 2024 22:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Ux/qa2If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EEB10E136;
 Fri, 23 Aug 2024 22:54:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240823225453euoutp026a4c1e9d554dbce0fba5d82bb33e8c10~ufX940N8x0994209942euoutp02M;
 Fri, 23 Aug 2024 22:54:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240823225453euoutp026a4c1e9d554dbce0fba5d82bb33e8c10~ufX940N8x0994209942euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724453693;
 bh=WZywpxZk213zxxUl31497eHvW1dsZ+KqGEl5j8Wx7YI=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=Ux/qa2IftSlmEfjUkiRYodMEceK94MePWDuHOrGKbBtBLxgI5Xzqk77nhgNloL46K
 4+sUO+BwP8os6IGpz/lpGM5WxluxoZ9UYHpSgPe7uiHOcxDJMH1i5OtWRbrto9ahX5
 NpOlMgQBAsUcxMoKWU8vqIQWCN6/r/YH03F77MtE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240823225453eucas1p1eb9974f802f13dbd765f97f84c89c7e5~ufX9WRNYf1031110311eucas1p1k;
 Fri, 23 Aug 2024 22:54:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AC.99.09875.C3319C66; Fri, 23
 Aug 2024 23:54:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240823225452eucas1p16c2a886d94d236a72889bbaccef65274~ufX8PS9uX1030710307eucas1p1U;
 Fri, 23 Aug 2024 22:54:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240823225451eusmtrp140cbc81b3a594842dbec333e3f0c13be~ufX8LeoJo2368423684eusmtrp1g;
 Fri, 23 Aug 2024 22:54:51 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-21-66c9133c0156
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CA.86.08810.B3319C66; Fri, 23
 Aug 2024 23:54:51 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240823225451eusmtip13ade4e62403833e6c850d99cd91c7f36~ufX77yOEz1404214042eusmtip1L;
 Fri, 23 Aug 2024 22:54:51 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 23 Aug 2024 23:54:51 +0100
Date: Sat, 24 Aug 2024 00:54:50 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Nicolas Schier <nicolas@fjasle.eu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
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
Message-ID: <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0yTZxTG837XAhY/ignvxM2JkWxkIC66vcsYg2RkX6IZ3maWbZnr5AMc
 BbEFRI2GiFRA2nERKh0ybnIpFbRgB5RLVuRSLmFbJ/ciE/CCIHKRgDA6auvmf7/znOd5zzl/
 vDxcsEBt5h2PiOLEEUKRG2VPaFuXezw/cTYEe99+AVB7XwGGZopTAGpVPcKRzmzCkVmbhqO/
 ns9QKL6wkkJLVY8wdK+xBENPr21BWeWFFMr9w0CgyepmAmnGekm0WleDIWNdDoW6CmU0Gr/S
 RKGJsWIK5c/eJtDfo/0kqs0xkKih0kghjXGeRNKkYhJdKpug0LNUM4YeNLSTKHN5ikLTqS00
 GkpXEKhJ2Uuj0iUFQD1trTTS1nQD9LAnA6DsoSGAntSsP1o9lUaiAumH6OLwHjRw/Sbt58Gq
 c9WArW/tptiGxTyCrdNXUWyt0kSzeZpo9uKdaZItrH+MsRpVEsXmJuVirFk2SrJ3zAU0mx+X
 ibO5hgNs0zU1zd673Ibth1/b+wRxouMxnHin7/f2oYvlpVjkCD+2tVSLxYEV+2Rgx4PMbjgg
 f4AnA3uegCkFUP4wg7AWCwCONv9DWot5ABflg9irSGbWE8zaKAGwsrCI/s+VV7RgK6oAXGt8
 RlkiBLMDJijjgYUp5l3YaNDQFt7EuMPV2QuUJYAzFRthf1cnYWk4M3vgY+UCbmE+sxcW9UlJ
 KztBQ/b4Sw/OvAfzdHPrYd46u8KSNZ5FtmM+hsN6GW1ddRu8mlZGWPkc7KgefLk2ZHIcYLui
 xGb6DC5l5dhMznCyrdqmb4GdGSk2PQQWVShtHAnrh5SkZS5cHybvElllf9ibr8OtsiPsn3ay
 bukI07UKm8yHiVKB1e0Oy0emiFSwXfnaXcrX7lL+f1cewFXAhYuWhIdwkvcjuFNeEmG4JDoi
 xOvYiXANWP8YnWttCzWgZHLWSw8wHtADyMPdNvF/GGkJFvCDhKfPcOITR8XRIk6iB648ws2F
 vyNoKydgQoRRXBjHRXLiV12MZ7c5DjsZpMzfu73btzTA87Br2NjyhMktpezHwJ8H7C50TF76
 RnLw+daBDcx5Vh6zWzp8bGXbV/ohodOg9yp5P8aobk58Q3M98wU2HyhqWJMtKcdUkSrPU4RJ
 w5IDrmnGihtnw9w/8JkJn9vodaNGXUz4pHn+OaLfL1d8JBt0+emAuvvsaYerX4Sa0rS/ZHso
 vL5NqdqnG5Gedwp4+ptOlvpOYuwE74pDER18JOzNy9/5OXsfHp+eCcgMePsW76R/26HyL+Od
 98X63YrqdUxf6TDWklUbRE2mt7T07y1HDqqjBH1B2Z86+d49Yz50LmExPlDkEb0rzD+Z0h11
 vy/69fObc3cTduar3AhJqHCXBy6WCP8FA997SIcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0yTVxiHc76v/VowZJ8F5gm4BLooG7JKgcLLRWKyf75lYU6zxWzOQQcV
 yICSXggumTKtIGjlsgFaSoOtIJdGthZIRS6ultZGmTEIuHGRBXDIRexwChnYFbpl/vec9/ze
 5z05ebkkr4oK4mbnKSSyPHEOn/Jl3XnlmHgv0d95LLJ7Sgi3R/UELDedR2BvnSPhhnuCBHdX
 JQkP/lqm4LShnYJV8xwBj/quEvC0fifUtBko0N13smC+4xYLTNMjbFjvthAw1K2l4K5BzYGZ
 H/opmJ1uouCyq5MFv089ZMN1rZMNve1DFJiGVthQXNrEhpKWWQqeVbgJeNx7mw3Va4sULFUM
 cGCsqpYF/ZoRDjSv1iK457BzoMsyiOCPe98juDQ2hmDB4pF2LFayQV8cB6pxEfza+CNnfzhj
 1BkR02MfpJjeFw0spttqppjrmgkO02BSMirbEpsx9DwhGFNrKcXoSnUE41ZPsRmbW89hLhdV
 k4zOeZDprzdymEfnHMTH+HNBkkyqVEhCsqRyxT7+ESFECYTxIIiKiRcIo+OOJkSJ+HuTkzIk
 OdkFEtne5DRB1ou2ZiJ/0q/Q3txFFKG/fcuQDxfTMbi6ZoEoQ75cHt2IsGXUwPFe7MQ/PR9m
 e9kfr4+UUd6QyxOabSe9BzPC03OTxGaKRe/CZzSn0SZT9Lu4z2naMgXQu/G669RWN0lfewMv
 v3RsNfjTIvxE85zcZD/6Q3xltHhrHI9uIrFW/aa3vh07L82wNpmkI3DDjT89Iq6Hg/HVV9zN
 sg+diMet6n9fHYovVrawvPwtXtl4jCqQv+Y1k+Y1k+Z/UwMiW1GARCnPzcyVCwVyca5cmZcp
 SJfmmpBnObvsa2YL0s27BFZEcJEVYS7JD/D7anLgGM8vQ3z8G4lMmipT5kjkViTyfEUlGRSY
 LvVsd54iVRgbKRLGxMZHiuJjo/k7/D7IPyvm0ZliheRriSRfIvuvj+D6BBURZ5rf/iXhztS6
 tjbMOLa/92LcDD4VuLJds0+xO0Qv4C+d8LE8XaspmB12RRruBxmhx1aWkpQqj7KnZ4x/VOib
 G279Leydmp8zSpyUg/8gvDUtNGGgfs9wnn+danDbAelw2+HvDqX2ZlMBY89CN1hpI+dDVK6w
 sBJl7EKBWRWREnlwOSexPDT41qGoVbY29OZw8MPglpvdnx1NUd/F8yMqfVCpyl41flbeeWS6
 1PJpXN2OL/Y4qPKkTmOXbVeWLeLLjsHy91NOXNPXFWmZ6WjbckHdW2q18JMLJwXurI11+0lq
 sXEJoXP9yZxt87yXdRd8nLLj5FwyKq4vhFpzYB+fJc8SC8NJmVz8D+zmgCYlBAAA
X-CMS-MailID: 20240823225452eucas1p16c2a886d94d236a72889bbaccef65274
X-Msg-Generator: CA
X-RootMTR: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh>
 <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh>
 <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
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

On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > Also, as this is not internal for the kernel, but rather for userspace
> > > > builds, shouldn't the include/ path be different?
> > > 
> > > Can you suggest an alternative path or provide documentation that could help
> > > identify the correct location? Perhaps usr/include?
> > 
> > That is better than the generic include path as you are attempting to
> > mix userspace and kernel headers in the same directory :(
> 
> Please keep in mind, that usr/include/ currently does not hold a single
> header file but is used for dynamically composing the UAPI header tree.
> 
> In general, I do not like the idea of keeping a elf.h file here that
> possibly is out-of-sync with the actual system's version (even though
> elf.h should not see that much changes).  Might it be more helpful to
> provide a "development kit" for Linux devs that need to build on MacOS
> that provides necessary missing system header files, instead of merging
> those into upstream?

I took this suggestion and tried pushing a Homebrew formula/package here [1].
I think I chose a wrong name and maybe something like "development kit" would
have been better. However, would it be possible instead to include the *.rb file
in the scripts/ directory? So users of this can generate the development kit in
their environments. I would maintain the script to keep it in sync with the
required glibc version for the latest kernel version.

[1] https://github.com/Homebrew/homebrew-core/pull/181885

> 
> Kind regards,
> Nicolas
> 
> -- 
> Nicolas
