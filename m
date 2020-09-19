Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DA5271C20
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240F46E22E;
	Mon, 21 Sep 2020 07:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABCE6E1EC;
 Sat, 19 Sep 2020 09:50:02 +0000 (UTC)
Message-Id: <20200919091751.011116649@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wXMSkZdDTGr2cnZMoKDSJw7MNirhJVzX4vOCHJbvoN0=;
 b=ul0AzmKXYj0qCi93y+r/rwwgxSXPin2sTe3PYhi7zjaY3NKa41EvWRmaZkAKju2f4qLfIs
 i1aVPwNRkUKTlsYfZfyyB/zi5KZf7ZY7OD58PCvZV59UcRuCOhEQsNPck5r1VuTJtHi72C
 +LNe+RY18cKtN3h7SPt+666fUzU5ch+DkMG/6qPFHiUag3Vd24Fa5TJBueGpK9wLzW3bo0
 IscYJhM/dQECgU1ilCEI7V6IMnuxdAonST0geBGtFlUWgd5xXJJx546wfo5abrk+4cO8Sx
 euhWyLJDvleHSJCh+QF6n/GwOhvNr9+hHKu+6tM3Z9VRQSgIOxJikgFGusnWsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wXMSkZdDTGr2cnZMoKDSJw7MNirhJVzX4vOCHJbvoN0=;
 b=KbJ6GiNRGpCyvVdElEw4H+4LtrSHxOXy5YeKjcqGSrhkBp5nKWiHepRirVJ50oI9WjzN2D
 1DCAFhaD9E835KBw==
Date: Sat, 19 Sep 2020 11:17:51 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:43 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First of all, sorry for the horribly big Cc list!

Following up to the discussion in:

  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de

this provides a preemptible variant of kmap_atomic & related
interfaces. This is achieved by:

 - Consolidating all kmap atomic implementations in generic code

 - Switching from per CPU storage of the kmap index to a per task storage

 - Adding a pteval array to the per task storage which contains the ptevals
   of the currently active temporary kmaps

 - Adding context switch code which checks whether the outgoing or the
   incoming task has active temporary kmaps. If so, the outgoing task's
   kmaps are removed and the incoming task's kmaps are restored.

 - Adding new interfaces k[un]map_temporary*() which are not disabling
   preemption and can be called from any context (except NMI).

   Contrary to kmap() which provides preemptible and "persistant" mappings,
   these interfaces are meant to replace the temporary mappings provided by
   kmap_atomic*() today.

This allows to get rid of conditional mapping choices and allows to have
preemptible short term mappings on 64bit which are today enforced to be
non-preemptible due to the highmem constraints. It clearly puts overhead on
the highmem users, but highmem is slow anyway.

This is not a wholesale conversion which makes kmap_atomic magically
preemptible because there might be usage sites which rely on the implicit
preempt disable. So this needs to be done on a case by case basis and the
call sites converted to kmap_temporary.

Note, that this is only lightly tested on X86 and completely untested on
all other architectures.

The lot is also available from

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem

Thanks,

	tglx
---
 a/arch/arm/mm/highmem.c               |  121 ---------------------
 a/arch/microblaze/mm/highmem.c        |   78 -------------
 a/arch/nds32/mm/highmem.c             |   48 --------
 a/arch/powerpc/mm/highmem.c           |   67 -----------
 a/arch/sparc/mm/highmem.c             |  115 --------------------
 arch/arc/Kconfig                      |    1 
 arch/arc/include/asm/highmem.h        |    8 +
 arch/arc/mm/highmem.c                 |   44 -------
 arch/arm/Kconfig                      |    1 
 arch/arm/include/asm/highmem.h        |   30 +++--
 arch/arm/mm/Makefile                  |    1 
 arch/csky/Kconfig                     |    1 
 arch/csky/include/asm/highmem.h       |    4 
 arch/csky/mm/highmem.c                |   75 -------------
 arch/microblaze/Kconfig               |    1 
 arch/microblaze/include/asm/highmem.h |    6 -
 arch/microblaze/mm/Makefile           |    1 
 arch/microblaze/mm/init.c             |    6 -
 arch/mips/Kconfig                     |    1 
 arch/mips/include/asm/highmem.h       |    4 
 arch/mips/mm/highmem.c                |   77 -------------
 arch/mips/mm/init.c                   |    3 
 arch/nds32/Kconfig.cpu                |    1 
 arch/nds32/include/asm/highmem.h      |   21 ++-
 arch/nds32/mm/Makefile                |    1 
 arch/powerpc/Kconfig                  |    1 
 arch/powerpc/include/asm/highmem.h    |    6 -
 arch/powerpc/mm/Makefile              |    1 
 arch/powerpc/mm/mem.c                 |    7 -
 arch/sparc/Kconfig                    |    1 
 arch/sparc/include/asm/highmem.h      |    7 -
 arch/sparc/mm/Makefile                |    3 
 arch/sparc/mm/srmmu.c                 |    2 
 arch/x86/include/asm/fixmap.h         |    1 
 arch/x86/include/asm/highmem.h        |   12 +-
 arch/x86/include/asm/iomap.h          |   29 +++--
 arch/x86/mm/highmem_32.c              |   59 ----------
 arch/x86/mm/init_32.c                 |   15 --
 arch/x86/mm/iomap_32.c                |   57 ----------
 arch/xtensa/Kconfig                   |    1 
 arch/xtensa/include/asm/highmem.h     |    9 +
 arch/xtensa/mm/highmem.c              |   44 -------
 b/arch/x86/Kconfig                    |    3 
 include/linux/highmem.h               |  141 +++++++++++++++---------
 include/linux/io-mapping.h            |    2 
 include/linux/sched.h                 |    9 +
 kernel/sched/core.c                   |   10 +
 mm/Kconfig                            |    3 
 mm/highmem.c                          |  192 ++++++++++++++++++++++++++++++++--
 49 files changed, 422 insertions(+), 909 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
