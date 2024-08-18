Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14439955EB0
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 21:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AE110E11D;
	Sun, 18 Aug 2024 19:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="PkHxwJ44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Sun, 18 Aug 2024 17:02:01 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBBA10E034;
 Sun, 18 Aug 2024 17:02:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240818165551euoutp0258140a37ef73bcc4656173befe53d6b1~s4QD8OiMy2193121931euoutp02x;
 Sun, 18 Aug 2024 16:55:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240818165551euoutp0258140a37ef73bcc4656173befe53d6b1~s4QD8OiMy2193121931euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724000151;
 bh=pgk63OzM4MV5B1YZ1Q6RhX/k/tQPgbLegYhXhPxJ50g=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=PkHxwJ44aZhmcYMdzJKAGZXelphodr77bbg9/BPcudcGnFtavaJMJ9p2nd51Tj6yl
 EaF87ID3nxhu/IEgZzyY2TPZYcEWqlo0jRREP2U3hZ6UDipar0KJoHoGGOhd9+mR8o
 njp4oTr7P/w9+o/j0eFte/CLOGU+aG0zzrs/aqcg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240818165551eucas1p2cfad7c58437449945b2cf154473a035d~s4QDrLzpK2264222642eucas1p2-;
 Sun, 18 Aug 2024 16:55:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 50.EF.09620.79722C66; Sun, 18
 Aug 2024 17:55:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240818165550eucas1p29e0c2db56a8031d550147a0305929f47~s4QC3qo8m2264222642eucas1p2_;
 Sun, 18 Aug 2024 16:55:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240818165550eusmtrp1f22f7444782d04f43e5ceb6ffa5e8082~s4QC2rdl71394913949eusmtrp1b;
 Sun, 18 Aug 2024 16:55:50 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-c8-66c227976f5c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 98.94.09010.69722C66; Sun, 18
 Aug 2024 17:55:50 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240818165550eusmtip2d54ec6aadacf9035b826ccd01848f656~s4QChYpRJ2514925149eusmtip2C;
 Sun, 18 Aug 2024 16:55:50 +0000 (GMT)
Received: from localhost (106.210.248.197) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 18 Aug 2024 17:55:45 +0100
Date: Sun, 18 Aug 2024 18:55:45 +0200
From: Klaus Jensen <k.jensen@samsung.com>
To: Barry Song <21cnbao@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, "Lucas
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
 <gost.dev@samsung.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
Message-ID: <ZsInkfDqwzd2ojHz@AALNPWKJENSEN.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zA6=ajoOgAm9kweeiBFKz4TJxxjYFGHHd3HQY8dxHpWA@mail.gmail.com>
X-Originating-IP: [106.210.248.197]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUZRiH5zvn7Dm7y6weFxo+wYlplaE1wryg30gaZOEpGmutqHHGcpXD
 JW62CyqVI+aKgGIgIcMGC7LTchEC14VwBQnU5bIyGwOzaLiIAYEIKIEERbuxHEz/e+Z7f887
 7++Pj4+LT1Ee/Ki4BFYRJ4+RkEKi1jRneTXXpzn8NdPgcjRlE6PWnmIMPdKdAchUPoKjqw4b
 jhy1WTjqfvKIRCe0VSSavTyCoXvXSjA0UbAKnb+oJZGms41Ao4brBNIPWHlo3liHoS5jPolu
 aTMoNPh9I4mGBnQkujBZQ6D7/bd56Ep+Gw81VHWRSN81xUMpaToeOlU2RKLHmQ4MGRvnCPRH
 QysP5cyNkWg88yaFes/lEqhRbaVQ6WwuQJYWE4Vq6zoAGrZkA5TX2wvQw7qFzYaxLB4qTtmC
 VHf90Z0fq6lAX6ZCUwGYelMHyTTMFBGMsfkyyVxR2yimSJ/IqG6M8xht/QOM0ZenkYwmTYMx
 jox+HnPDUUwxF5JzcEbTJmMaCyoo5t7pFuwDuEf4ehgbE3WIVazbvk8Y+e/JSnDQ5nLEmnwJ
 TwZ5gnQg4EN6E0y3GnAni+lSAOdngzmeBrC9iU4HwgWeAvB66d/gqZA610hygxIAL2rU2P+p
 saHCpUkNgFOTasKpELQ3bMtQk04maSn8ed6x+O5GS2B2zgzhFHC6nIYlQzk858CV3gZHSuoX
 BREdADuGb2Ecr4BteYMLAn9BkMIq4zoOPWGJne9M4LQXPFHzw2IdAS2DOrMe465eDS/1WAiO
 j8J2w2+LR0P6qgssmzmLOfdA+i3YmhrIZVzhaIuB4ngVNGefIbj8NQCnC3uoJRnAm7/ocC4V
 AFXdg0tGEBwr1lPc0mXw9vgK7rhl8FxtLs49i2BqijgTrFE/V0z9rJj6WTH1c8WKAFEO3NlE
 ZWwEq9wYxx72U8pjlYlxEX4H4mP1YOGvmO0tT+pA6eikXzPA+KAZQD4ucROdftAULhaFyZO+
 YhXxnysSY1hlM/DkExJ3kXeYFyumI+QJbDTLHmQVT6cYX+CRjL0ZYvLj/SW7v1Vmtg2FiAdC
 g9ZumPDK9JxcLUkCazK0BhdbpVTkio0GhmyulAaogo/oNrxj/FZ4nGzYvtmu2nf07V3xc2mf
 YJbsTdKv31/5cHdEzP5dd8XS/r1/Tpz9Yrr9fExZeOl8mS099pW6mm1s6GhCL7XTN9Kc5R+d
 K6yIdmO6h5f3bWQKP6tw73r5pTCw8hgxINjZae/67vcX9xzzlX8c7GFNMh6qjq//8Mt3/wn9
 SeCdaffx3Jtd9M3ERNMOmV/fbOtxcpkqSGXU+t/pjN0Rr0uv9nkhQ/T4gD0n6o3Ivizb/qBe
 8+H3in8NsKyPtH4q21qQgBEfddQMSLeczN8dKCGUkfL1a3GFUv4fl9bBPJoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjGdy49bYEuZxXZGZpp6uaFSKHl9pYiYYtLzr64kRlxuoV19ABG
 oKyXKVvmiFwUHQYGSKil4xKugwDlYulg5eKABpGMCtIgogMEuQwJDiUButZu0W+//N/n+eWf
 Ny8H4zcQ3pwzSWpGmSRLEBBu+OB2/wPf6wd6Yv0HR71gbZIPA/fKUFip/AmBvtp5DH6zT2Jg
 b8vF4O4/KwSklTcQ8KJ5HoWp36tQ+Lt4N1z/tZwA/Z8WHBZaenEwTI+xYNNkRMFq0hFwuzyb
 DTP5ZgJmpysJKF1txeHRw3EWtOssLOhssBJgsK6xIDOrkgWXamYJeJpjR8Fk3sDhcecACwo2
 lghYzvmDDRM/F+Jg1o6xofpFIQLD/X1saDMOITA3nIdA0cQEAotGh7llKZcFZZkhkH4/CGwV
 jeyIw3Sdvg6hO/qGCLpzvQSnTT3NBN2unWTTJQYNnX5rmUWXdzxBaUNtFkHrs/Qobc9+yKJv
 2cvYdGlqAUbrLZG0ubiOTU9d7Uc/pU4Jw5QKjZrZG69QqY8ITotALBRJQCgOlAhFASFfhoqD
 BH7hYXIm4cy3jNIv/Cth/FZGPZI86X5+LLUJS0WKuFcQLociA6nLG2bCyXyyAqG6GuSu991U
 07NRlot3UJtjV/7LrCJUmy3Sxa0IVTnKOBkn36cs2dqXGYI8RN3ctONO9iQFVF7BuoPdOBhZ
 S1JL1VWoc7CDPELNV3W8LPBIKTU0dxt1hvjkJkrNL5eyXIO3KEvRjKPNcbQPUQ0mPxfuoqq2
 Oc4ERu6h0lpvYE7mkpFU5aABdf15H9V0bxh38Q/U2tZjJAfx1L4m1b6Sal9Jta9JSxC8FvFk
 NKrEuESVWKiSJao0SXHCGEWiAXFcblvfRosRqVlYFfYgKAfpQSgOJvDkXX3SHcvnyWUp3zFK
 RbRSk8CoepAgx4ZyMe+dMQrH6Sepo0XB/kGiwGCJf5AkOEDwNu/j5MsyPhknUzNnGSaZUf7f
 Qzlc71TUQyeJOmk0HfilscueyI8w88TpsdrjvaUlx2Y/y+IWP7rTEf7jex5sbY0043D0CU7E
 1ORzjy9O8o6GVbhZqq9B2xtevrlHM3W9kgsf+WY8bb8/5R5l0JQGGnVWQq7+hPzeR34tlCsx
 7bVlfpjXOLsn5lzKxW2fVL5nre3zNOsHophTN985t7gkjyx6tn8t/2DgyGKe7k699EHoN50J
 zTWCr+sDukXP94csuh8MPd3Ypbq7s+Li9Oq7dZsl56t3hU/TwXkXcuKkM8k+xVLbgu14ing9
 aqYmaUN69s2Rlb8WV/ZFWW/EbG2ZDc0DhSvj9dsnGK9Ls+P6sO1j+R6t3SMKRcGcAFfFy0Q+
 mFIl+xfttvvaQgQAAA==
X-CMS-MailID: 20240818165550eucas1p29e0c2db56a8031d550147a0305929f47
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
 <CAGsJ_4zA6=ajoOgAm9kweeiBFKz4TJxxjYFGHHd3HQY8dxHpWA@mail.gmail.com>
X-Mailman-Approved-At: Sun, 18 Aug 2024 19:24:13 +0000
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

On Aug 17 13:11, Barry Song wrote:
> On Thu, Aug 8, 2024 at 2:20 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Aug 07, 2024 at 01:56:38PM +0000, Daniel Gomez wrote:
> > > On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> > > > On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay wrote:
> > > > > This patch set allows for building the Linux kernel for arm64 in macOS with
> > > > > LLVM.
> > > >
> > > > Is this a requirement somewhere that this must work?  It seems like an
> > > > odd request, what workflows require cross-operating-system builds like
> > > > this?
> > >
> > > This isn't a requirement, but it would, for example, support workflows for QEMU
> > > users and developers on macOS. They could build/compile the kernel natively and
> > > use it to launch QEMU instances, simplifying their process.
> >
> > But that's not a real workload of anyone?  How often does this ever come
> > up?  Who is going to maintain this cross-build functionality over time?
> 
> it is a real workload of me,  i was running qemu-system-aarch64 on x86
> and it was
> pretty slow. so got a M3 pro to accelerate my development. frequently changing
> kernel's source code, i am using qemu-system-aarch64 to do quick verification.
> 

Allow me to chime in as well. Working with qemu-system-aarch64 on an Mx
are a daily thing for me as well. Working with custom built kernels have
been a pain, and this really helps.
