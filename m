Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0042A5F63
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D57989BF0;
	Wed,  4 Nov 2020 08:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCE06EC72;
 Tue,  3 Nov 2020 10:33:53 +0000 (UTC)
Message-Id: <20201103095858.625310005@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=u8HY47nQ1rEETIi4/9zdfAjblKurxchJCqLvsv7KpOQ=;
 b=UIhQ3Idxk6DjqiC6Zp5rc4N6iIwQmApwpEz7EKu7hqb91V0vjErMVftYE/lIlYUApLaISa
 3ccLnmNasdVRHOr19A+0USX+WAAkZZIjUMJdOqwtST6bwLR8FfbnRoR8LKumRrrftbirYG
 0l6PZFPBhGEyltNl2guOKD+Y7j8W02bAqqHBZavnWH3Paom7PdVcbI5qxqWz6ddv36DWCP
 zm4P6Knv2IQI5zIUHr2mvjLgLvmtINMaZyEWkyzXbaMNAnE91CmwDx3Mp24quHVVlblvyj
 fuGwVAaCvcmIe9Q95benYVD1y+pfol/PFOUqRXxGybqy2IC6v/D7p/hCR6+Rig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=u8HY47nQ1rEETIi4/9zdfAjblKurxchJCqLvsv7KpOQ=;
 b=Wh1ctmmSJLQbhvGkIjkjFlpjReRcEPXXdhQjfh9QkvigubCQPDmw4DWcX/N5g5dqM9hpPg
 QWU4PaI/uom22gDQ==
Date: Tue, 03 Nov 2020 10:27:32 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 20/37] io-mapping: Cleanup atomic iomap 
References: <20201103092712.714480842@linutronix.de>
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

Switch the atomic iomap implementation over to kmap_local and stick the
preempt/pagefault mechanics into the generic code similar to the
kmap_atomic variants.

Rename the x86 map function in preparation for a non-atomic variant.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch to make review easier
---
 arch/x86/include/asm/iomap.h |    9 +--------
 arch/x86/mm/iomap_32.c       |    6 ++----
 include/linux/io-mapping.h   |    8 ++++++--
 3 files changed, 9 insertions(+), 14 deletions(-)

--- a/arch/x86/include/asm/iomap.h
+++ b/arch/x86/include/asm/iomap.h
@@ -13,14 +13,7 @@
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 
-void __iomem *iomap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
-
-static inline void iounmap_atomic(void __iomem *vaddr)
-{
-	kunmap_local_indexed((void __force *)vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
+void __iomem *__iomap_local_pfn_prot(unsigned long pfn, pgprot_t prot);
 
 int iomap_create_wc(resource_size_t base, unsigned long size, pgprot_t *prot);
 
--- a/arch/x86/mm/iomap_32.c
+++ b/arch/x86/mm/iomap_32.c
@@ -44,7 +44,7 @@ void iomap_free(resource_size_t base, un
 }
 EXPORT_SYMBOL_GPL(iomap_free);
 
-void __iomem *iomap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+void __iomem *__iomap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 {
 	/*
 	 * For non-PAT systems, translate non-WB request to UC- just in
@@ -60,8 +60,6 @@ void __iomem *iomap_atomic_pfn_prot(unsi
 	/* Filter out unsupported __PAGE_KERNEL* bits: */
 	pgprot_val(prot) &= __default_kernel_pte_mask;
 
-	preempt_disable();
-	pagefault_disable();
 	return (void __force __iomem *)__kmap_local_pfn_prot(pfn, prot);
 }
-EXPORT_SYMBOL_GPL(iomap_atomic_pfn_prot);
+EXPORT_SYMBOL_GPL(__iomap_local_pfn_prot);
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -69,13 +69,17 @@ io_mapping_map_atomic_wc(struct io_mappi
 
 	BUG_ON(offset >= mapping->size);
 	phys_addr = mapping->base + offset;
-	return iomap_atomic_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
+	preempt_disable();
+	pagefault_disable();
+	return __iomap_local_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
 }
 
 static inline void
 io_mapping_unmap_atomic(void __iomem *vaddr)
 {
-	iounmap_atomic(vaddr);
+	kunmap_local_indexed((void __force *)vaddr);
+	pagefault_enable();
+	preempt_enable();
 }
 
 static inline void __iomem *

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
