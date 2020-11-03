Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE82A5F4A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C695D89369;
	Wed,  4 Nov 2020 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEFD6EC32;
 Tue,  3 Nov 2020 10:33:26 +0000 (UTC)
Message-Id: <20201103092712.714480842@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o0Hcy+w+YfdhRzI7mxi56wApHLzMvMt3eijNSMso0PA=;
 b=G8VVQuzSAG/V3pki7i+aDmE0pr8JhWsV0h1Xg4lWsQluQ7DQ15Ya/IgR0Zw/NMpisVqD/W
 J/QXEkNEe7NbJqy5Bpmqb8HIJU2Y0O9Bf3CxSUTWS6PBz1JGzlayb0IYq+e5effS3/x5UD
 MIe/Xe/FG1i/b9FZAe9aHhyyyddX9t7dKFQEPgsOg2KREqovaLBnC0b+0gXF8QmMVtRTpz
 P8qKTXJkFfaFevqgVNzuSzGRJDl/f8Ri4mxz/TFPyTFN4RhGaqVC7XfpgwRxpGndKVfLoD
 i26gQR4JX8Q2WWAJMzSewtdQIauZvSoL5odzs7HswoiORYaM8qGtPEpIoF7usw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o0Hcy+w+YfdhRzI7mxi56wApHLzMvMt3eijNSMso0PA=;
 b=alxfeweVuLzYm2Bj4Ox9pc6F2AVmJk6jrW4CNT45uolk8+Mr53KYB3lrXulO39NFAKfxk9
 Xl6j5YSOg+Mrc1BA==
Date: Tue, 03 Nov 2020 10:27:12 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 00/37] mm/highmem: Preemptible variant of kmap_atomic &
 friends
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following up to the discussion in:

  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de

and the second version of this:

  https://lore.kernel.org/r/20201029221806.189523375@linutronix.de

this series provides a preemptible variant of kmap_atomic & related
interfaces.

This is achieved by:

 - Removing the RT dependency from migrate_disable/enable()

 - Consolidating all kmap atomic implementations in generic code including
   a useful version of the CONFIG_DEBUG_HIGHMEM which provides guard pages
   between the individual maps instead of just increasing the map size.

 - Switching from per CPU storage of the kmap index to a per task storage

 - Adding a pteval array to the per task storage which contains the ptevals
   of the currently active temporary kmaps

 - Adding context switch code which checks whether the outgoing or the
   incoming task has active temporary kmaps. If so, the outgoing task's
   kmaps are removed and the incoming task's kmaps are restored.

 - Adding new interfaces k[un]map_local*() which are not disabling
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
call sites converted to kmap_local().

Note, that this is only tested on X86 and completely untested on all other
architectures (at least it compiles except on csky which does not compile
with the newest cross tools from kernel.org independent of this change).

The lot is available from

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem

It is based on Peter Zijlstras migrate disable branch which is close to be
merged into the tip tree, but still not finalized:

   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/migrate-disable

The series has the following parts:

    Patches  1 - 22: Consolidation work which is independent of the scheduler
    	       	     changes

		     79 files changed, 595 insertions(+), 1296 deletions(-)

    Patch   23:      Needs to be folded back into the sched/migrate-disable

    Patches 24 - 26: The preemptible kmap_local() implementation

    	       	     9 files changed, 283 insertions(+), 57 deletions(-)

    Patches 27 - 37: Cleanup of the less common kmap/io_map_atomic users

    	       	     19 files changed, 114 insertions(+), 256 deletions(-)

Vs. merging this pile:

If everyone agrees, I'd like to take the first part (1-22) through tip so
that the preemptible implementation can be sorted in tip once the scheduler
prerequisites are there. The initial cleanups (27-37) might have to wait if
there are conflicts vs. the drm/gpu tree. We'll see.

>From what I can tell kmap_atomic() can be removed all together and
completly replaced by kmap_local(). Most of the usage sites are trivial and
just doing memcpy(), memset() or trivial operations on the temporarily
mapped page. The interesting ones are those which do either conditional
stuff or have copy_.*_user_inatomic() inside. As shown with the crash and
drm/gpu cleanups this allows to simplify the code quite a bit.

Changes vs. V2:

  - Remove the migrate disable from kmap_local and only issue that when the
    there is an actual highmem mapping. (Linus)
  - Reordered the series so the consolidation is upfront
  - Get rid of kmap_types.h and the associated cruft
  - Fixup documentation and add function documentation for kmap_*
  - Splitout the internal implementation into a seperate header
  - More cleanups - removal of unused functions
  - Replace a few of the less frequently used kmap_atomic and
    io_mapping_map_atomic variants and remove those interfaces.

Thanks,

	tglx
---
 arch/alpha/include/asm/kmap_types.h                   |   15 
 arch/arc/include/asm/kmap_types.h                     |   14 
 arch/arm/include/asm/kmap_types.h                     |   10 
 arch/arm/mm/highmem.c                                 |  121 -------
 arch/ia64/include/asm/kmap_types.h                    |   13 
 arch/microblaze/mm/highmem.c                          |   78 ----
 arch/mips/include/asm/kmap_types.h                    |   13 
 arch/nds32/mm/highmem.c                               |   48 --
 arch/parisc/include/asm/kmap_types.h                  |   13 
 arch/powerpc/include/asm/kmap_types.h                 |   13 
 arch/powerpc/mm/highmem.c                             |   67 ----
 arch/sh/include/asm/kmap_types.h                      |   15 
 arch/sparc/include/asm/kmap_types.h                   |   11 
 arch/sparc/mm/highmem.c                               |  115 -------
 arch/um/include/asm/kmap_types.h                      |   13 
 arch/x86/include/asm/kmap_types.h                     |   13 
 b/Documentation/driver-api/io-mapping.rst             |   92 ++---
 b/arch/arc/Kconfig                                    |    1 
 b/arch/arc/include/asm/highmem.h                      |   26 +
 b/arch/arc/mm/highmem.c                               |   54 ---
 b/arch/arm/Kconfig                                    |    1 
 b/arch/arm/include/asm/fixmap.h                       |    4 
 b/arch/arm/include/asm/highmem.h                      |   33 +-
 b/arch/arm/mm/Makefile                                |    1 
 b/arch/arm/mm/cache-feroceon-l2.c                     |    6 
 b/arch/arm/mm/cache-xsc3l2.c                          |    4 
 b/arch/csky/Kconfig                                   |    1 
 b/arch/csky/include/asm/fixmap.h                      |    4 
 b/arch/csky/include/asm/highmem.h                     |    6 
 b/arch/csky/mm/highmem.c                              |   75 ----
 b/arch/microblaze/Kconfig                             |    1 
 b/arch/microblaze/include/asm/fixmap.h                |    4 
 b/arch/microblaze/include/asm/highmem.h               |    6 
 b/arch/microblaze/mm/Makefile                         |    1 
 b/arch/microblaze/mm/init.c                           |    6 
 b/arch/mips/Kconfig                                   |    1 
 b/arch/mips/include/asm/fixmap.h                      |    4 
 b/arch/mips/include/asm/highmem.h                     |    6 
 b/arch/mips/kernel/crash_dump.c                       |   42 --
 b/arch/mips/mm/highmem.c                              |   77 ----
 b/arch/mips/mm/init.c                                 |    4 
 b/arch/nds32/Kconfig.cpu                              |    1 
 b/arch/nds32/include/asm/fixmap.h                     |    4 
 b/arch/nds32/include/asm/highmem.h                    |   22 -
 b/arch/nds32/mm/Makefile                              |    1 
 b/arch/openrisc/mm/init.c                             |    1 
 b/arch/openrisc/mm/ioremap.c                          |    1 
 b/arch/powerpc/Kconfig                                |    1 
 b/arch/powerpc/include/asm/fixmap.h                   |    4 
 b/arch/powerpc/include/asm/highmem.h                  |    7 
 b/arch/powerpc/mm/Makefile                            |    1 
 b/arch/powerpc/mm/mem.c                               |    7 
 b/arch/sh/include/asm/fixmap.h                        |    8 
 b/arch/sh/mm/init.c                                   |    8 
 b/arch/sparc/Kconfig                                  |    1 
 b/arch/sparc/include/asm/highmem.h                    |    8 
 b/arch/sparc/include/asm/vaddrs.h                     |    4 
 b/arch/sparc/mm/Makefile                              |    3 
 b/arch/sparc/mm/srmmu.c                               |    2 
 b/arch/um/include/asm/fixmap.h                        |    1 
 b/arch/x86/Kconfig                                    |    3 
 b/arch/x86/include/asm/fixmap.h                       |    5 
 b/arch/x86/include/asm/highmem.h                      |   13 
 b/arch/x86/include/asm/iomap.h                        |   13 
 b/arch/x86/include/asm/paravirt_types.h               |    1 
 b/arch/x86/kernel/crash_dump_32.c                     |   48 --
 b/arch/x86/mm/highmem_32.c                            |   59 ---
 b/arch/x86/mm/init_32.c                               |   15 
 b/arch/x86/mm/iomap_32.c                              |   57 ---
 b/arch/xtensa/Kconfig                                 |    1 
 b/arch/xtensa/include/asm/fixmap.h                    |    4 
 b/arch/xtensa/include/asm/highmem.h                   |   12 
 b/arch/xtensa/mm/highmem.c                            |   46 --
 b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c      |    7 
 b/drivers/gpu/drm/i915/i915_gem.c                     |   40 --
 b/drivers/gpu/drm/i915/selftests/i915_gem.c           |    4 
 b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c       |    8 
 b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h |    8 
 b/drivers/gpu/drm/qxl/qxl_image.c                     |   18 -
 b/drivers/gpu/drm/qxl/qxl_ioctl.c                     |   27 -
 b/drivers/gpu/drm/qxl/qxl_object.c                    |   12 
 b/drivers/gpu/drm/qxl/qxl_object.h                    |    4 
 b/drivers/gpu/drm/qxl/qxl_release.c                   |    4 
 b/drivers/gpu/drm/ttm/ttm_bo_util.c                   |   20 -
 b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c                |   30 -
 b/fs/aio.c                                            |    1 
 b/fs/btrfs/ctree.h                                    |    1 
 b/include/asm-generic/Kbuild                          |    2 
 b/include/asm-generic/kmap_size.h                     |   12 
 b/include/linux/highmem-internal.h                    |  210 ++++++++++++
 b/include/linux/highmem.h                             |  294 ++++++------------
 b/include/linux/io-mapping.h                          |   28 -
 b/include/linux/kernel.h                              |   21 -
 b/include/linux/preempt.h                             |   38 --
 b/include/linux/sched.h                               |   11 
 b/kernel/entry/common.c                               |    2 
 b/kernel/fork.c                                       |    1 
 b/kernel/sched/core.c                                 |   63 +++
 b/kernel/sched/sched.h                                |    4 
 b/lib/smp_processor_id.c                              |    2 
 b/mm/Kconfig                                          |    3 
 b/mm/highmem.c                                        |  255 ++++++++++++++-
 include/asm-generic/kmap_types.h                      |   11 
 103 files changed, 959 insertions(+), 1576 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
