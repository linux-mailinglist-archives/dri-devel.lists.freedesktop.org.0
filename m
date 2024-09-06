Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDD96EE33
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DB610E9B8;
	Fri,  6 Sep 2024 08:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="tT17MRcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30DD10E9B8;
 Fri,  6 Sep 2024 08:34:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240906083404euoutp01a22a875915c485dbf74fbdfe12683a09~ymqXIXMu11816218162euoutp01m;
 Fri,  6 Sep 2024 08:34:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240906083404euoutp01a22a875915c485dbf74fbdfe12683a09~ymqXIXMu11816218162euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725611644;
 bh=NjES/4ZiqHQr92+NSnWRP6QiIitEC/EQXVoeY7dsf+U=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=tT17MRcFXqrpXrVF7K/eWAixeOvMMLw/TXO/VvtHCtrG/A/Egcn3cVnT8ipsDduA8
 9SLtLwfO4lmQvXo2E/umm5OIFrRRTFCWJOuF6XZJShvaPDQ1T/1PU7gR1k/uhd3KUa
 KRvPfifnfvYylHZnRruG+FmIkMNaYHe//Goe6lRE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240906083403eucas1p11d187fb0737af321c1e6806f5e23d83e~ymqW4rgi42040120401eucas1p1x;
 Fri,  6 Sep 2024 08:34:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 67.FA.09875.B7EBAD66; Fri,  6
 Sep 2024 09:34:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240906083403eucas1p28e440e34cd7fa3298040bdff8334b759~ymqWSIclt2066620666eucas1p25;
 Fri,  6 Sep 2024 08:34:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240906083403eusmtrp21c1911ef518b743ee00bec16de0cd088~ymqWQwhhn1377313773eusmtrp2U;
 Fri,  6 Sep 2024 08:34:03 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-22-66dabe7b0778
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C8.64.14621.A7EBAD66; Fri,  6
 Sep 2024 09:34:03 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240906083402eusmtip2b63b58cd6ba5145cd470d1448d01cfc3~ymqWAX5AT0964809648eusmtip2I;
 Fri,  6 Sep 2024 08:34:02 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 6 Sep 2024 09:34:01 +0100
Date: Fri, 6 Sep 2024 10:34:01 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
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
Message-ID: <20240906083401.gfckf7q3yanxqzis@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASt2eP6q46YP0hCN=f5frt5r5qmwj25tiYrxjwOmGOwEg@mail.gmail.com>
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTVxjGc27vvS042JXiOBEVJUgU+Von8yQY44Ib1xHYYMk2TTbXyAWZ
 fK21TDQjqAgCykDRjg4qUGi1ENHyYYt8TMSWIqQiDpDKQIGJKCCjCgy0o7ZO//u973mec57n
 j8NhOb0kV3Ji4g8wgnh+rDtpj9dp5w0+h5v6o/yf6z1RW28phqbkJwHSKsdY6Jp5gIXMdXks
 dPf5FImOyapINFc9hqHBJgWGJotWoXMVMhJJu/Q4Gq+5gSPVcA+BFuvVGOquLyRRh+wUG43k
 N5NodFhOopLpWhw9GOojkKZQT6DGqm4SqbpnCJSeKSdQxsVREj3LNWPo78Y2Ap2df0qiidyb
 bGQ8LcZRs6SHjS7MiQEy6LRsVKfuBOiR4QxABUYjQE/US5fWPM0jUGn6FpR2PwDdK7/M3u5F
 V0orAd2g7STpxhfFOF3fUk3SGskAmy5Wiei01gmCljU8xmiVMpOkpZlSjDafGiLoVnMpmy5J
 Pcuipfpwurmokk0PZuuwL+Fu+62RTGxMEiPw2/aD/b4MqYJM7Nlw0DRdhKeCvLVZwI4Dqc1Q
 +SwLzwL2HCfqAoDZl6+T1sEE4ITuCGEdZgBsKDRjbyxddwZtFgWAfbkL4H9VTte/Nr8KQK1p
 hrRYcMoDKluMr5mkNsImvYptYWfKC94vP0FYmEUp34c5GX4W5lIB8LHExLKwAxUCxZcGbLwc
 6gtGlp7mLOk3wqp6Pyu6QsUrjvUWN3is9vfXajsqHBaYOoE19Dr4W95F3Mq/wPaafswSE1IV
 y+Bx9V820Q74sHTUJuLCcV0N28qroFlz3tY+GpZdktg0ibDBKCEsGSAVCHM6Yq3rT2BPyTWW
 de0I+yaWW6M5wtN1YtvaAZ5Id8oFHpJ3akne1pK8rSV5p1YxwJXAhREJ46IZIS+e+dlXyI8T
 iuKjffcmxKnA0g+59UpnUgPF+LRvC8A4oAVADsvd2WF0Z3+Uk0MkP/kQI0jYIxDFMsIW4MrB
 3V0c1ke6MU5UNP8As59hEhnBm1OMY7cyFRMXbuK24VcibvpsCapIiPAfC3Hb5flPWfloUK9i
 xxcaHaHXePIKhhoG57IDz7S7Oz/YlexIrNB6z0b0bpYFBx3uyc/Jn92e96lmmeSnD1IPZrMW
 ZAWOK67s1GXuvS7nTO/mfSP/eO3tcW7QnuNe0rusOF7Smrlx9dffZ7vdipHzts3+6se9E+Yx
 4kqej/EuSb6a035yv3HSvzW8Q8SbV3ANLz4Kq05Zk+8btfjS8Yb3udu6jNXffWaoFZbVhX67
 NSUqLbgj+JForY9b0tHV74U97HTB/hhOuZof2j4QEZu46dCfAYbFrnvBk3zxE7+gwu4or6kf
 j+rXf/V5YKhuQ79PyBHeQog7LtzH/9CLJRDy/wOyNhqnkAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0yTZxSH9363ftxiV3C+AnHQOKMkKxQovMwLZnHb58g2iJhlc5vr4OMS
 C9WWOthiRiIDgTWCooxOyr3USiwUy0rlsnUM6CYSxmCDglwEhoqDRkTc0K7QLPrfc3LO78nJ
 yaFxXj3lS6emZ7CydLGET7kTvz7tufXqlx2jSSF2Ber9oxpDi5pvAOrWzePoumMcR46WYhz9
 /nCRQqdr9BRabZ7H0ERHPYb+LvdHF6/UUEg9YCXQ3Ws/Echwe5hEa2YThgbNlyh0o0bJQTMl
 nRSava2hUJXdSKCpyT9J1HrJSqJ2/SCFDIMPSJSbryFR3uVZCi0VOTA0195LoguPFyh0v+hn
 DrKdKyVQp2qYg7SrpQD193RzUIupD6C/+s8DVGazAXTP5JReWygmUXVuJMoZE6GRukbO/iCm
 Qd0AmLbuPoppX6kkGLOlmWJaVeMcptKgYHK67pNMTdsdjDHo8ilGna/GGIdykmS6HNUcpir7
 As6orXFMZ3kDh5ko7MFi4YeCPTKpIoMNSJHKM/byjwhRqEAYhQSh4VECYVjkx6+FivjB+/Yk
 spLUk6wseN+ngpQ8dT11fHhn5rK9nMgGxQEFwI2G3HA48NsEUQDcaR63DkB7rR5zNfxh0/IQ
 6WJvuDZcQLmG7ABeLezEXIUBQJVOu5EguNuhzmKj1pni7oIdVgNnnX24QXCs7syGCefqNsHZ
 pa/W2ZsrgndUy/g6e3FjYOnVcdwlHSGgMb8duBovQmvZjHM/2hneBfXmYBf6wfqntEv5Mjxt
 /G5D48aNg2XLfcC1dCD8tvgy4eJT8MGTOVAEfFTPSVXPpKpnUtVz0kpA6IAPq5CnJafJhQK5
 OE2uSE8WJEjTDMD5sS3dj5tNQH3XLrAAjAYWAGmc7+M1e3A0ieeVKM76gpVJj8oUElZuASLn
 gYpx380JUufLp2ccFUaEiIThEVEhoqiIMP4WrzcH+5N43GRxBnuMZY+zsv9zGO3mm41Rn+22
 3POIObmwRmjikudf0a+YHv5CMytNbgqPI2OLX6fUVu/wzDwwrdwRpnwUM51oNra+K/EruFhq
 nn7LOHSzJD5TI/N9W1KUtUZN9X1EKc+sHmzIL2+sioxuy8qdIIPsh9H3GqPFnLfEhN7kbbGP
 6t1fio/OCT703rat9bYSt70HsBatpKCJd2iCn9MLvGv6h8GPH5wXn/ond1X6uZIzMBkbGs07
 EdhaoY59vyKZ3dx47BOP1x/trn1Hm9V11vOF1JgSz3jiirbwhvGE98jC6g8B25V80j+hL/BW
 XngXvfPwG5u2VfBMVedSt05FeJ6d65X964DLQ0szItL6xG//dT4hTxELg3CZXPwfuGyD+zoE
 AAA=
X-CMS-MailID: 20240906083403eucas1p28e440e34cd7fa3298040bdff8334b759
X-Msg-Generator: CA
X-RootMTR: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
References: <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh>
 <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh>
 <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
 <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
 <ZtIjNBhqdxmMBxfM@fjasle.eu>
 <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
 <20240905085626.ehhc5p7qwi57dagm@AALNPWDAGOMEZ1.aal.scsc.local>
 <CAK7LNASt2eP6q46YP0hCN=f5frt5r5qmwj25tiYrxjwOmGOwEg@mail.gmail.com>
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

On Fri, Sep 06, 2024 at 08:58:15AM +0900, Masahiro Yamada wrote:
> On Thu, Sep 5, 2024 at 5:56 PM Daniel Gomez <da.gomez@samsung.com> wrote:
> >
> > On Mon, Sep 02, 2024 at 01:15:01AM +0900, Masahiro Yamada wrote:
> > > On Sat, Aug 31, 2024 at 4:54 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> > > >
> > > > On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> > > > > On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > > > > > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> > > > > > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > > > > > Also, as this is not internal for the kernel, but rather for userspace
> > > > > > > > > builds, shouldn't the include/ path be different?
> > > > > > > >
> > > > > > > > Can you suggest an alternative path or provide documentation that could help
> > > > > > > > identify the correct location? Perhaps usr/include?
> > > > > > >
> > > > > > > That is better than the generic include path as you are attempting to
> > > > > > > mix userspace and kernel headers in the same directory :(
> > > > > >
> > > > > > Please keep in mind, that usr/include/ currently does not hold a single
> > > > > > header file but is used for dynamically composing the UAPI header tree.
> > > > > >
> > > > > > In general, I do not like the idea of keeping a elf.h file here that
> > > > > > possibly is out-of-sync with the actual system's version (even though
> > > > > > elf.h should not see that much changes).  Might it be more helpful to
> > > > > > provide a "development kit" for Linux devs that need to build on MacOS
> > > > > > that provides necessary missing system header files, instead of merging
> > > > > > those into upstream?
> > > > >
> > > > > I took this suggestion and tried pushing a Homebrew formula/package here [1].
> > > > > I think I chose a wrong name and maybe something like "development kit" would
> > > > > have been better. However, would it be possible instead to include the *.rb file
> > > > > in the scripts/ directory? So users of this can generate the development kit in
> > > > > their environments. I would maintain the script to keep it in sync with the
> > > > > required glibc version for the latest kernel version.
> > > > >
> > > > > [1] https://protect2.fireeye.com/v1/url?k=96027706-f7896236-9603fc49-000babffaa23-452f645d7a72e234&q=1&e=343dd31c-5e5b-4b09-8ee5-6c59a1ff826e&u=https%3A%2F%2Fgithub.com%2FHomebrew%2Fhomebrew-core%2Fpull%2F181885
> > > >
> > > > I think it sounds sensible to hold that formula file in the upstream tree.  But
> > > > I am not sure if scripts/ is the best location.
> > > >
> > > > Masahiro, what do you think?
> > >
> > >
> > > I do not know much about the homebrew, but why does the upstream
> > > kernel need to merge such masOS stuff?
> >
> > The missing headers (in macOS) need to be provided somehow. One way can be
> > having the formula (*.rb file) in-tree, so users of this can install them in
> > their systems. This would also require to have a tarball with the missing
> > headers either in-tree or somewhere accessible so it can be fetched.
> >
> > To avoid having the formula and a tarball in-tree, I've created a Homebrew Tap
> > (3rd-Party Repository) called 'Bee Headers Project' [1][2][3] that can provision
> > the missing headers. The project provides a bee-headers package and formula
> > that will install byteswap.h, elf.h and endian.h in the user's system Hombrew
> > directory. It also provides a *.pc file so pkg-config can be used to find the
> > location of these headers. I have a v2 with this solution ready, perhaps is
> > easier to discuss this with the code.
> 
> 
> It is up to you what project you start in Github.
> 
> Then, what do you need to submit v2 for this?

I'll just include a reference in the documentation.

And will send the v2 later today.

> 
> 
> 
> 
> 
> >
> > I think we can extend the same package and include extra headers if we need
> > more in the future. I see for x86_64 asm/types.h and others might be required.
> > The bee-headers package can then be the repository to place and distribute them.
> >
> > Please, let me know if you think of an alternative solution, I can give a try
> > and explore.
> >
> > [1] Project:
> > https://protect2.fireeye.com/v1/url?k=8f1b9871-ee908d54-8f1a133e-74fe485cbff6-b9b8f875df8b37c5&q=1&e=860f3982-d1e4-4fcb-ab79-f181bb7fcda3&u=https%3A%2F%2Fgithub.com%2Fbee-headers
> > [2] Headers repository:
> > https://protect2.fireeye.com/v1/url?k=7c995f7b-1d124a5e-7c98d434-74fe485cbff6-a20d4e643f5978f8&q=1&e=860f3982-d1e4-4fcb-ab79-f181bb7fcda3&u=https%3A%2F%2Fgithub.com%2Fbee-headers%2Fheaders.git
> > [3] Homebrew Tap formula:
> > https://protect2.fireeye.com/v1/url?k=148f40fc-750455d9-148ecbb3-74fe485cbff6-5d795246adb22931&q=1&e=860f3982-d1e4-4fcb-ab79-f181bb7fcda3&u=https%3A%2F%2Fgithub.com%2Fbee-headers%2Fhomebrew-bee-headers.git
> >
> >
> > >
> > >
> > >
> > > >
> > > > Kind regards,
> > > > Nicolas
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
