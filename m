Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E537271C18
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFF6E223;
	Mon, 21 Sep 2020 07:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0456E200;
 Sat, 19 Sep 2020 09:50:08 +0000 (UTC)
Message-Id: <20200919092616.319114547@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=fvOeqhBIZfTzz9IjwJGkrIPXB/ESaUeosaYZN/1PpYs=;
 b=0gJqxzWfxYCTqq728ADiT6UHDajgQ+AoV6qm8i5pQ3aIhx2mY1Q98kuJkfQFkywvseawzf
 GTbT16UixiEeYonVTh96BDNJqzIr1iCWvogiiqXORNpSnlGtp7AoM2w4tqLMkQtdU8z6Kj
 1DUuLjhbmA8qP4u+dhglzdtT1L9vSNy1iS6kmXQKiIBgH4ck9mCAOgcSi6LjVB73Y3/sSS
 UJWZdnK4gx8dHdKmgDigvVlqXySY+UdKFtEfSShBZgIrWNELl2TIXbn78mFaQoQAa2DZB3
 rfEoMLEev7o9ZIp+MIo8EAwetbWuDJDVyc6rrqITlfEtHebWCfiJ4n8DUh9kKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=fvOeqhBIZfTzz9IjwJGkrIPXB/ESaUeosaYZN/1PpYs=;
 b=VWslGr2TXEeybLV3O9VbTGnToYo4xC1R0oFHQawehxUFrdnZRoN214jTSAKbq7YZ6Vf+br
 RjvRsoKSEX9rD1DQ==
Date: Sat, 19 Sep 2020 11:17:56 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 05/15] ARM: highmem: Switch to generic kmap atomic
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:46 +0000
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

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
---
Note: Completely untested
---
 arch/arm/Kconfig               |    1 
 arch/arm/include/asm/highmem.h |   30 +++++++---
 arch/arm/mm/Makefile           |    1 
 arch/arm/mm/highmem.c          |  121 -----------------------------------------
 4 files changed, 23 insertions(+), 130 deletions(-)

--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1499,6 +1499,7 @@ config HAVE_ARCH_PFN_VALID
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
+	select KMAP_ATOMIC_GENERIC
 	help
 	  The address space of ARM processors is only 4 Gigabytes large
 	  and it has to accommodate user address space, kernel address
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -46,19 +46,33 @@ extern pte_t *pkmap_page_table;
 
 #ifdef ARCH_NEEDS_KMAP_HIGH_GET
 extern void *kmap_high_get(struct page *page);
+
+#ifdef CONFIG_DEBUG_HIGHMEM
+extern void *arch_kmap_temporary_high_get(struct page *page);
 #else
+static inline void *arch_kmap_temporary_high_get(struct page *page)
+{
+	return kmap_high_get(page);
+}
+#endif /* !CONFIG_DEBUG_HIGHMEM */
+
+#else /* ARCH_NEEDS_KMAP_HIGH_GET */
 static inline void *kmap_high_get(struct page *page)
 {
 	return NULL;
 }
-#endif
+#endif /* !ARCH_NEEDS_KMAP_HIGH_GET */
 
-/*
- * The following functions are already defined by <linux/highmem.h>
- * when CONFIG_HIGHMEM is not set.
- */
-#ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic_pfn(unsigned long pfn);
-#endif
+#define arch_kmap_temp_post_map(vaddr, pteval)				\
+	local_flush_tlb_kernel_page(vaddr)
+
+#define arch_kmap_temp_pre_unmap(vaddr)					\
+do {									\
+	if (cache_is_vivt())						\
+		__cpuc_flush_dcache_area((void *)vaddr, PAGE_SIZE);	\
+} while (0)
+
+#define arch_kmap_temp_post_unmap(vaddr)				\
+	local_flush_tlb_kernel_page(vaddr)
 
 #endif
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_MODULES)		+= proc-syms.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 
 obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.o
-obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_ARM_PV_FIXUP)	+= pv-fixup-asm.o
 
--- a/arch/arm/mm/highmem.c
+++ /dev/null
@@ -1,121 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mm/highmem.c -- ARM highmem support
- *
- * Author:	Nicolas Pitre
- * Created:	september 8, 2008
- * Copyright:	Marvell Semiconductors Inc.
- */
-
-#include <linux/module.h>
-#include <linux/highmem.h>
-#include <linux/interrupt.h>
-#include <asm/fixmap.h>
-#include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
-#include "mm.h"
-
-static inline void set_fixmap_pte(int idx, pte_t pte)
-{
-	unsigned long vaddr = __fix_to_virt(idx);
-	pte_t *ptep = virt_to_kpte(vaddr);
-
-	set_pte_ext(ptep, pte, 0);
-	local_flush_tlb_kernel_page(vaddr);
-}
-
-static inline pte_t get_fixmap_pte(unsigned long vaddr)
-{
-	pte_t *ptep = virt_to_kpte(vaddr);
-
-	return *ptep;
-}
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned int idx;
-	unsigned long vaddr;
-	void *kmap;
-	int type;
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	/*
-	 * There is no cache coherency issue when non VIVT, so force the
-	 * dedicated kmap usage for better debugging purposes in that case.
-	 */
-	if (!cache_is_vivt())
-		kmap = NULL;
-	else
-#endif
-		kmap = kmap_high_get(page);
-	if (kmap)
-		return kmap;
-
-	type = kmap_atomic_idx_push();
-
-	idx = FIX_KMAP_BEGIN + type + KM_TYPE_NR * smp_processor_id();
-	vaddr = __fix_to_virt(idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	/*
-	 * With debugging enabled, kunmap_atomic forces that entry to 0.
-	 * Make sure it was indeed properly unmapped.
-	 */
-	BUG_ON(!pte_none(get_fixmap_pte(vaddr)));
-#endif
-	/*
-	 * When debugging is off, kunmap_atomic leaves the previous mapping
-	 * in place, so the contained TLB flush ensures the TLB is updated
-	 * with the new mapping.
-	 */
-	set_fixmap_pte(idx, mk_pte(page, prot));
-
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int idx, type;
-
-	if (kvaddr >= (void *)FIXADDR_START) {
-		type = kmap_atomic_idx();
-		idx = FIX_KMAP_BEGIN + type + KM_TYPE_NR * smp_processor_id();
-
-		if (cache_is_vivt())
-			__cpuc_flush_dcache_area((void *)vaddr, PAGE_SIZE);
-#ifdef CONFIG_DEBUG_HIGHMEM
-		BUG_ON(vaddr != __fix_to_virt(idx));
-		set_fixmap_pte(idx, __pte(0));
-#else
-		(void) idx;  /* to kill a warning */
-#endif
-		kmap_atomic_idx_pop();
-	} else if (vaddr >= PKMAP_ADDR(0) && vaddr < PKMAP_ADDR(LAST_PKMAP)) {
-		/* this address was obtained through kmap_high_get() */
-		kunmap_high(pte_page(pkmap_page_table[PKMAP_NR(vaddr)]));
-	}
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
-
-void *kmap_atomic_pfn(unsigned long pfn)
-{
-	unsigned long vaddr;
-	int idx, type;
-	struct page *page = pfn_to_page(pfn);
-
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-	type = kmap_atomic_idx_push();
-	idx = FIX_KMAP_BEGIN + type + KM_TYPE_NR * smp_processor_id();
-	vaddr = __fix_to_virt(idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(get_fixmap_pte(vaddr)));
-#endif
-	set_fixmap_pte(idx, pfn_pte(pfn, kmap_prot));
-
-	return (void *)vaddr;
-}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
