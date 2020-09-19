Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE0271C16
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F056E21E;
	Mon, 21 Sep 2020 07:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A26E20A;
 Sat, 19 Sep 2020 09:50:16 +0000 (UTC)
Message-Id: <20200919092617.067494770@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=p42YpEs102zdkHi6IlAnR/QRadkLzykF1FXKDbrjYxU=;
 b=SZys8l8YhCmQxDDymvS1n7Oqu5I65LO+lGgZ541jfa4VNROJOkmKbUKNHtZrOzKYOWUwfN
 25qH2SWeZGyQ66Dixv+rBtythKLtIB8T8C945ihdJMKQxX9YkjaOk8QUjpPW3TMDw1TJOk
 UfoKS1d3u+tsE7tDIV8e5EYJbOui78C3Qfw/GcPjB4A2dxvwuJBdlTdgt1T0XTEty/YuAO
 P25B5bLL4jjY8J3AYbsvzU7c/On9Obf01Flaupd+cmwyeJvDG06hHJi7VefqHoq5sEmzlh
 28vNvCYvrlDxF7+5pM5K7e3ZGP95mbb9n6dPTM2WItH7CTHK+a4TRWfvO4JGqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=p42YpEs102zdkHi6IlAnR/QRadkLzykF1FXKDbrjYxU=;
 b=kGS/q/SkMOAvdHaEHvWz/Wp8eD3l+FyAcs0YzY6S816o9XccAA19n2UHSwrNt073lt3c5u
 ms/QxYysVK8FM0Cg==
Date: Sat, 19 Sep 2020 11:18:03 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 12/15] xtensa/mm/highmem: Switch to generic kmap atomic
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
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
---
Note: Completely untested
---
 arch/xtensa/Kconfig               |    1 
 arch/xtensa/include/asm/highmem.h |    9 +++++++
 arch/xtensa/mm/highmem.c          |   44 +++-----------------------------------
 3 files changed, 14 insertions(+), 40 deletions(-)

--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -679,6 +679,7 @@ endchoice
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
+        select KMAP_ATOMIC_GENERIC
 	help
 	  Linux can use the full amount of RAM in the system by
 	  default. However, the default MMUv2 setup only maps the
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -68,6 +68,15 @@ static inline void flush_cache_kmaps(voi
 	flush_cache_all();
 }
 
+enum fixed_addresses kmap_temp_map_idx(int type, unsigned long pfn);
+#define arch_kmap_temp_map_idx		kmap_temp_map_idx
+
+enum fixed_addresses kmap_temp_unmap_idx(int type, unsigned long addr);
+#define arch_kmap_temp_unmap_idx	kmap_temp_unmap_idx
+
+#define arch_kmap_temp_post_unmap(vaddr)	\
+	local_flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE)
+
 void kmap_init(void);
 
 #endif
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -12,8 +12,6 @@
 #include <linux/highmem.h>
 #include <asm/tlbflush.h>
 
-static pte_t *kmap_pte;
-
 #if DCACHE_WAY_SIZE > PAGE_SIZE
 unsigned int last_pkmap_nr_arr[DCACHE_N_COLORS];
 wait_queue_head_t pkmap_map_wait_arr[DCACHE_N_COLORS];
@@ -37,55 +35,21 @@ static inline enum fixed_addresses kmap_
 		color;
 }
 
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
+enum fixed_addresses kmap_temp_map_idx(int type, unsigned long pfn)
 {
-	enum fixed_addresses idx;
-	unsigned long vaddr;
-
-	idx = kmap_idx(kmap_atomic_idx_push(),
-		       DCACHE_ALIAS(page_to_phys(page)));
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte + idx)));
-#endif
-	set_pte(kmap_pte + idx, mk_pte(page, prot));
-
-	return (void *)vaddr;
+	return kmap_idx(type, DCACHE_ALIAS(pfn << PAGE_SHIFT);
 }
-EXPORT_SYMBOL(kmap_atomic_high_prot);
 
-void kunmap_atomic_high(void *kvaddr)
+enum fixed_addresses kmap_temp_unmap_idx(int type, unsigned long addr)
 {
-	if (kvaddr >= (void *)FIXADDR_START &&
-	    kvaddr < (void *)FIXADDR_TOP) {
-		int idx = kmap_idx(kmap_atomic_idx(),
-				   DCACHE_ALIAS((unsigned long)kvaddr));
-
-		/*
-		 * Force other mappings to Oops if they'll try to access this
-		 * pte without first remap it.  Keeping stale mappings around
-		 * is a bad idea also, in case the page changes cacheability
-		 * attributes or becomes a protected page in a hypervisor.
-		 */
-		pte_clear(&init_mm, kvaddr, kmap_pte + idx);
-		local_flush_tlb_kernel_range((unsigned long)kvaddr,
-					     (unsigned long)kvaddr + PAGE_SIZE);
-
-		kmap_atomic_idx_pop();
-	}
+	return kmap_idx(type, DCACHE_ALIAS(addr));
 }
-EXPORT_SYMBOL(kunmap_atomic_high);
 
 void __init kmap_init(void)
 {
-	unsigned long kmap_vstart;
-
 	/* Check if this memory layout is broken because PKMAP overlaps
 	 * page table.
 	 */
 	BUILD_BUG_ON(PKMAP_BASE < TLBTEMP_BASE_1 + TLBTEMP_SIZE);
-	/* cache the first kmap pte */
-	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
-	kmap_pte = virt_to_kpte(kmap_vstart);
 	kmap_waitqueues_init();
 }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
