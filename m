Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40514270D1D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 12:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E646E3E1;
	Sat, 19 Sep 2020 10:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443C6E3E1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 10:38:04 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n61so7809690ota.10
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qBMELpxnMWeh+ygY0m7dFfIjeObvSXUbCfgU+81OoU=;
 b=MhdAd/ZHaFK/DWpIGeCJTSrL4TspZA8urGXmqj7eu+tNyozMPj8lsNoIYGKFEkHH3i
 tz5kIr/iJffDO0Nt2pDPL1zyk3OacLo0mtMS/oIiThW5ZZklv3HS4ydmHDNHz/bb5JWz
 njvA7YA9+16uPDZnqoPhv6tTBSjVAYTx0v+gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qBMELpxnMWeh+ygY0m7dFfIjeObvSXUbCfgU+81OoU=;
 b=K+1m3OauVrxbrwTsH1T2NE72bISyumoErm89aavO21bTki5/3qrt1UsnQPLtmUeer/
 hsoezhmZjOXiZgDv9hJOrG/hpGslVqZ0GtemoqC5zmu9SAn8mJPfm73kSlT0rc3Y2R9W
 WrhaUz9XJT1K2EY+KV4Jia2UYBzksBe3EPBog/MRmGNrqVt7u24YxHX42DxPrSwuWPF2
 AldrxGXWnk2EZ5EO9lEutaO4DnDtCcK7SLbcVf+5WloWS14128E7hNJ3vmy6HTqJZ9hG
 A7qF2v5oIXVh9OpESzwUt9MCF/YM9jfjAI3pgTq/wHpYluGmBcjzroSo+7Y8JGhtCMrO
 x0Nw==
X-Gm-Message-State: AOAM530uXxfJf+Or2DKFwgCVe61VMi8JESkJDc/UlqCVLi/5ECB94nAg
 ipPOorEsi9t56SmUHFdwhwNVHjPe9wUIvpAb9xCYFg==
X-Google-Smtp-Source: ABdhPJx5xVWJo6i2zNxAj54jCqUfintQtxPDT+BaBMGgav4MX+Ax0tqlV2axmkJLRRkUUHGKVrFmThuU1Fd1j9Iveeo=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr27032226otq.188.1600511884193; 
 Sat, 19 Sep 2020 03:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 19 Sep 2020 12:37:53 +0200
Message-ID: <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Sep 19, 2020 at 11:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > First of all, sorry for the horribly big Cc list!
> >
> > Following up to the discussion in:
> >
> >   https://lore.kernel.org/r/20200914204209.256266093@linutronix.de
> >
> > this provides a preemptible variant of kmap_atomic & related
> > interfaces. This is achieved by:
> >
> >  - Consolidating all kmap atomic implementations in generic code
> >
> >  - Switching from per CPU storage of the kmap index to a per task storage
> >
> >  - Adding a pteval array to the per task storage which contains the ptevals
> >    of the currently active temporary kmaps
> >
> >  - Adding context switch code which checks whether the outgoing or the
> >    incoming task has active temporary kmaps. If so, the outgoing task's
> >    kmaps are removed and the incoming task's kmaps are restored.
> >
> >  - Adding new interfaces k[un]map_temporary*() which are not disabling
> >    preemption and can be called from any context (except NMI).
> >
> >    Contrary to kmap() which provides preemptible and "persistant" mappings,
> >    these interfaces are meant to replace the temporary mappings provided by
> >    kmap_atomic*() today.
> >
> > This allows to get rid of conditional mapping choices and allows to have
> > preemptible short term mappings on 64bit which are today enforced to be
> > non-preemptible due to the highmem constraints. It clearly puts overhead on
> > the highmem users, but highmem is slow anyway.
> >
> > This is not a wholesale conversion which makes kmap_atomic magically
> > preemptible because there might be usage sites which rely on the implicit
> > preempt disable. So this needs to be done on a case by case basis and the
> > call sites converted to kmap_temporary.
> >
> > Note, that this is only lightly tested on X86 and completely untested on
> > all other architectures.
> >
> > The lot is also available from
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem
>
> I think it should be the case, but I want to double check: Will
> copy_*_user be allowed within a kmap_temporary section? This would
> allow us to ditch an absolute pile of slowpaths.

(coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
page fault you get a short read/write. This looks like it would remove
the need to handle these in a slowpath, since page faults can now be
served in this new kmap_temporary sections. But this sounds too good
to be true, so I'm wondering what I'm missing.
-Daniel
>
> >
> > Thanks,
> >
> >         tglx
> > ---
> >  a/arch/arm/mm/highmem.c               |  121 ---------------------
> >  a/arch/microblaze/mm/highmem.c        |   78 -------------
> >  a/arch/nds32/mm/highmem.c             |   48 --------
> >  a/arch/powerpc/mm/highmem.c           |   67 -----------
> >  a/arch/sparc/mm/highmem.c             |  115 --------------------
> >  arch/arc/Kconfig                      |    1
> >  arch/arc/include/asm/highmem.h        |    8 +
> >  arch/arc/mm/highmem.c                 |   44 -------
> >  arch/arm/Kconfig                      |    1
> >  arch/arm/include/asm/highmem.h        |   30 +++--
> >  arch/arm/mm/Makefile                  |    1
> >  arch/csky/Kconfig                     |    1
> >  arch/csky/include/asm/highmem.h       |    4
> >  arch/csky/mm/highmem.c                |   75 -------------
> >  arch/microblaze/Kconfig               |    1
> >  arch/microblaze/include/asm/highmem.h |    6 -
> >  arch/microblaze/mm/Makefile           |    1
> >  arch/microblaze/mm/init.c             |    6 -
> >  arch/mips/Kconfig                     |    1
> >  arch/mips/include/asm/highmem.h       |    4
> >  arch/mips/mm/highmem.c                |   77 -------------
> >  arch/mips/mm/init.c                   |    3
> >  arch/nds32/Kconfig.cpu                |    1
> >  arch/nds32/include/asm/highmem.h      |   21 ++-
> >  arch/nds32/mm/Makefile                |    1
> >  arch/powerpc/Kconfig                  |    1
> >  arch/powerpc/include/asm/highmem.h    |    6 -
> >  arch/powerpc/mm/Makefile              |    1
> >  arch/powerpc/mm/mem.c                 |    7 -
> >  arch/sparc/Kconfig                    |    1
> >  arch/sparc/include/asm/highmem.h      |    7 -
> >  arch/sparc/mm/Makefile                |    3
> >  arch/sparc/mm/srmmu.c                 |    2
> >  arch/x86/include/asm/fixmap.h         |    1
> >  arch/x86/include/asm/highmem.h        |   12 +-
> >  arch/x86/include/asm/iomap.h          |   29 +++--
> >  arch/x86/mm/highmem_32.c              |   59 ----------
> >  arch/x86/mm/init_32.c                 |   15 --
> >  arch/x86/mm/iomap_32.c                |   57 ----------
> >  arch/xtensa/Kconfig                   |    1
> >  arch/xtensa/include/asm/highmem.h     |    9 +
> >  arch/xtensa/mm/highmem.c              |   44 -------
> >  b/arch/x86/Kconfig                    |    3
> >  include/linux/highmem.h               |  141 +++++++++++++++---------
> >  include/linux/io-mapping.h            |    2
> >  include/linux/sched.h                 |    9 +
> >  kernel/sched/core.c                   |   10 +
> >  mm/Kconfig                            |    3
> >  mm/highmem.c                          |  192 ++++++++++++++++++++++++++++++++--
> >  49 files changed, 422 insertions(+), 909 deletions(-)
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
