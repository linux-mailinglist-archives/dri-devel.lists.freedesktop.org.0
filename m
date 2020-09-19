Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5E271C06
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ED66E19B;
	Mon, 21 Sep 2020 07:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B254F6E1F9;
 Sat, 19 Sep 2020 09:50:10 +0000 (UTC)
Message-Id: <20200919092616.532034197@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=OkH79zSn8o38fzD7JzvNsCURJbh/0cL2cB7YR+jiu7g=;
 b=1dEadAMfikKVkX+JheXl/3yHO/KxRbc6sn18yWMUb6TQXwRIoVBomWYzHRSoVhdAWhXbok
 mxb2+MwCupT5RciB56zMSEFujTDWfuWtxN2TLHqi/V7n/oGQXp9Yx+Qox2eb9C2kfn20TU
 AOskpP2PPzcwlEkjjwy+yn9a9ZgtzD7mHEJ3E3tUD97Dl6s24qaMCks1mgUi8svknwNZ8u
 Oq2+LN6x/tBklYneOjj3NkQ5sYclM6KneHZsudegrlxj4RQWZx7Jqonves55u7mv7SzGhW
 WSpgLWZX8kzlHN5WWK4gOwyRrBzOQ3gV9DNRptWmgwpYIpsE/eLGjRKi7ercBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=OkH79zSn8o38fzD7JzvNsCURJbh/0cL2cB7YR+jiu7g=;
 b=HHsYin3hEtSgx7A+Jn4tyCStHWKrW3Mjp52FqGcUD/TY/pd+2VXb0zJ6Gi490o0Kta+x78
 fV20ltW77ve09ODg==
Date: Sat, 19 Sep 2020 11:17:58 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 07/15] microblaze/mm/highmem: Switch to generic kmap atomic
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
Cc: Michal Simek <monstr@monstr.eu>
---
Note: Completely untested
---
 arch/microblaze/Kconfig               |    1 
 arch/microblaze/include/asm/highmem.h |    6 ++
 arch/microblaze/mm/Makefile           |    1 
 arch/microblaze/mm/highmem.c          |   78 ----------------------------------
 arch/microblaze/mm/init.c             |    6 --
 5 files changed, 6 insertions(+), 86 deletions(-)

--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -170,6 +170,7 @@ config XILINX_UNCACHED_SHADOW
 config HIGHMEM
 	bool "High memory support"
 	depends on MMU
+	select KMAP_ATOMIC_GENERIC
 	help
 	  The address space of Microblaze processors is only 4 Gigabytes large
 	  and it has to accommodate user address space, kernel address
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -25,7 +25,6 @@
 #include <linux/uaccess.h>
 #include <asm/fixmap.h>
 
-extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
 /*
@@ -52,6 +51,11 @@ extern pte_t *pkmap_page_table;
 
 #define flush_cache_kmaps()	{ flush_icache(); flush_dcache(); }
 
+#define arch_kmap_temp_post_map(vaddr, pteval)	\
+	local_flush_tlb_page(NULL, vaddr);
+#define arch_kmap_temp_post_unmap(vaddr)	\
+	local_flush_tlb_page(NULL, vaddr);
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_HIGHMEM_H */
--- a/arch/microblaze/mm/Makefile
+++ b/arch/microblaze/mm/Makefile
@@ -6,4 +6,3 @@
 obj-y := consistent.o init.o
 
 obj-$(CONFIG_MMU) += pgtable.o mmu_context.o fault.o
-obj-$(CONFIG_HIGHMEM) += highmem.o
--- a/arch/microblaze/mm/highmem.c
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * highmem.c: virtual kernel memory mappings for high memory
- *
- * PowerPC version, stolen from the i386 version.
- *
- * Used in CONFIG_HIGHMEM systems for memory pages which
- * are not addressable by direct kernel virtual addresses.
- *
- * Copyright (C) 1999 Gerhard Wichert, Siemens AG
- *		      Gerhard.Wichert@pdb.siemens.de
- *
- *
- * Redesigned the x86 32-bit VM architecture to deal with
- * up to 16 Terrabyte physical memory. With current x86 CPUs
- * we now support up to 64 Gigabytes physical RAM.
- *
- * Copyright (C) 1999 Ingo Molnar <mingo@redhat.com>
- *
- * Reworked for PowerPC by various contributors. Moved from
- * highmem.h by Benjamin Herrenschmidt (c) 2009 IBM Corp.
- */
-
-#include <linux/export.h>
-#include <linux/highmem.h>
-
-/*
- * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
- * gives a more generic (and caching) interface. But kmap_atomic can
- * be used in IRQ contexts, so in some (very limited) cases we need
- * it.
- */
-#include <asm/tlbflush.h>
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-
-	unsigned long vaddr;
-	int idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte-idx)));
-#endif
-	set_pte_at(&init_mm, vaddr, kmap_pte-idx, mk_pte(page, prot));
-	local_flush_tlb_page(NULL, vaddr);
-
-	return (void *) vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int type;
-	unsigned int idx;
-
-	if (vaddr < __fix_to_virt(FIX_KMAP_END))
-		return;
-
-	type = kmap_atomic_idx();
-
-	idx = type + KM_TYPE_NR * smp_processor_id();
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
-#endif
-	/*
-	 * force other mappings to Oops if they'll try to access
-	 * this pte without first remap it
-	 */
-	pte_clear(&init_mm, vaddr, kmap_pte-idx);
-	local_flush_tlb_page(NULL, vaddr);
-
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -49,17 +49,11 @@ unsigned long lowmem_size;
 EXPORT_SYMBOL(min_low_pfn);
 EXPORT_SYMBOL(max_low_pfn);
 
-#ifdef CONFIG_HIGHMEM
-pte_t *kmap_pte;
-EXPORT_SYMBOL(kmap_pte);
-
 static void __init highmem_init(void)
 {
 	pr_debug("%x\n", (u32)PKMAP_BASE);
 	map_page(PKMAP_BASE, 0, 0);	/* XXX gross */
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
-
-	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
 }
 
 static void highmem_setup(void)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
