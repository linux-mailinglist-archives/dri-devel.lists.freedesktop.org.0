Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF1271C0F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8D46E1E0;
	Mon, 21 Sep 2020 07:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140C6E20A;
 Sat, 19 Sep 2020 09:50:15 +0000 (UTC)
Message-Id: <20200919092616.953880686@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=91ZYfK1yNkXL5oEhap+R83auW0J97tOTwLccIhJa80I=;
 b=gWDWCaSV7nGYtLWP7j6L6tL3rnjIdnfrdxT7w9D+BYKL20WSYQOzwLxibpeKJR47yPplPK
 +HIO9MfUJabHslDlYLlPrafiwKprPt6QsqRB+0JLa+pViRLF/l/EMugASpCBHkX59NReES
 OJ3Rnmi19bOskYXGwHv/GDMUZteRCIYzrgX3KlWoZMpWMSx7XlgeUdDzJNoJjQykPerY3n
 nH0S5FY3P1dOtySyCTJ7TLvqH5i2T1aqfCRC5hxKS4VG+inj7IPua+41sMsQ/XuCilXzJ6
 e9Exnjh43Z6g6LelSVkHLKnq7hG94WFhPyRXwlrJ2m88F7e6frj0ACAeRTCYqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=91ZYfK1yNkXL5oEhap+R83auW0J97tOTwLccIhJa80I=;
 b=rrCSErPoaifMm9+4d7+KOGKMye40S+sbZmvSbDPE3KEwCn0LdzrTvFEi7f/XgkjGwdF0yg
 fjDd0tPBN3sg9DAg==
Date: Sat, 19 Sep 2020 11:18:02 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 11/15] sparc/mm/highmem: Switch to generic kmap atomic
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:45 +0000
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
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
---
Note: Completely untested
---
 arch/sparc/Kconfig               |    1 
 arch/sparc/include/asm/highmem.h |    7 +-
 arch/sparc/mm/Makefile           |    3 -
 arch/sparc/mm/highmem.c          |  115 ---------------------------------------
 arch/sparc/mm/srmmu.c            |    2 
 5 files changed, 6 insertions(+), 122 deletions(-)

--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -137,6 +137,7 @@ config MMU
 config HIGHMEM
 	bool
 	default y if SPARC32
+        select KMAP_ATOMIC_GENERIC
 
 config ZONE_DMA
 	bool
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -33,8 +33,6 @@ extern unsigned long highstart_pfn, high
 #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE)
 extern pte_t *pkmap_page_table;
 
-void kmap_init(void) __init;
-
 /*
  * Right now we initialize only a single pte table. It can be extended
  * easily, subsequent pte tables have to be allocated in one physical
@@ -53,6 +51,11 @@ void kmap_init(void) __init;
 
 #define flush_cache_kmaps()	flush_cache_all()
 
+/* FIXME: Use __flush_tlb_one(vaddr) instead of flush_cache_all() -- Anton */
+#define arch_kmap_temp_post_map(vaddr, pteval)	flush_cache_all()
+#define arch_kmap_temp_post_unmap(vaddr)	flush_cache_all()
+
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_HIGHMEM_H */
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -15,6 +15,3 @@ obj-$(CONFIG_SPARC32)   += leon_mm.o
 
 # Only used by sparc64
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
-
-# Only used by sparc32
-obj-$(CONFIG_HIGHMEM)   += highmem.o
--- a/arch/sparc/mm/highmem.c
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  highmem.c: virtual kernel memory mappings for high memory
- *
- *  Provides kernel-static versions of atomic kmap functions originally
- *  found as inlines in include/asm-sparc/highmem.h.  These became
- *  needed as kmap_atomic() and kunmap_atomic() started getting
- *  called from within modules.
- *  -- Tomas Szepe <szepe@pinerecords.com>, September 2002
- *
- *  But kmap_atomic() and kunmap_atomic() cannot be inlined in
- *  modules because they are loaded with btfixup-ped functions.
- */
-
-/*
- * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
- * gives a more generic (and caching) interface. But kmap_atomic can
- * be used in IRQ contexts, so in some (very limited) cases we need it.
- *
- * XXX This is an old text. Actually, it's good to use atomic kmaps,
- * provided you remember that they are atomic and not try to sleep
- * with a kmap taken, much like a spinlock. Non-atomic kmaps are
- * shared by CPUs, and so precious, and establishing them requires IPI.
- * Atomic kmaps are lightweight and we may have NCPUS more of them.
- */
-#include <linux/highmem.h>
-#include <linux/export.h>
-#include <linux/mm.h>
-
-#include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
-#include <asm/vaddrs.h>
-
-static pte_t *kmap_pte;
-
-void __init kmap_init(void)
-{
-	unsigned long address = __fix_to_virt(FIX_KMAP_BEGIN);
-
-        /* cache the first kmap pte */
-        kmap_pte = virt_to_kpte(address);
-}
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned long vaddr;
-	long idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-
-/* XXX Fix - Anton */
-#if 0
-	__flush_cache_one(vaddr);
-#else
-	flush_cache_all();
-#endif
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte-idx)));
-#endif
-	set_pte(kmap_pte-idx, mk_pte(page, prot));
-/* XXX Fix - Anton */
-#if 0
-	__flush_tlb_one(vaddr);
-#else
-	flush_tlb_all();
-#endif
-
-	return (void*) vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int type;
-
-	if (vaddr < FIXADDR_START)
-		return;
-
-	type = kmap_atomic_idx();
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	{
-		unsigned long idx;
-
-		idx = type + KM_TYPE_NR * smp_processor_id();
-		BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN+idx));
-
-		/* XXX Fix - Anton */
-#if 0
-		__flush_cache_one(vaddr);
-#else
-		flush_cache_all();
-#endif
-
-		/*
-		 * force other mappings to Oops if they'll try to access
-		 * this pte without first remap it
-		 */
-		pte_clear(&init_mm, vaddr, kmap_pte-idx);
-		/* XXX Fix - Anton */
-#if 0
-		__flush_tlb_one(vaddr);
-#else
-		flush_tlb_all();
-#endif
-	}
-#endif
-
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -971,8 +971,6 @@ void __init srmmu_paging_init(void)
 
 	sparc_context_init(num_contexts);
 
-	kmap_init();
-
 	{
 		unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
