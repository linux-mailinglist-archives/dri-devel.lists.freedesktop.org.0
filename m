Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CCE271C1C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612946E22B;
	Mon, 21 Sep 2020 07:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14D36E201;
 Sat, 19 Sep 2020 09:50:20 +0000 (UTC)
Message-Id: <20200919092617.375720378@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dJhau0LaFILj/IFm3JpK00/lnAjoDukMJ8R0j3dPchU=;
 b=uxskJelrTfz/GKc9edsAEs0gb3DWYfCu7n8APYzVlc7bJQzv04iZOzHcmFq6t5qDrrVBZ/
 4C4PAFGkzsFp6nGQcpt5niy6S+9ydBCpiObiah/IVCCwDxhhHC5cgkAu/6V3V08Eh1r96m
 xmw3OVtejQT5gDr4T78MAAWwkDh33eqo6q17Wt0/k4vyjdndUorQf1g9379L4qm8930rmO
 GEKPqud78gf29AiUWocLXzxJzWSo2OEEBj/yrvwUOT1wKbOVlZ0FliAB+Yqg7cNrXdk79+
 OO7sMlURN+BROu5//5m0JNoAo/MusM0EcFq1MWiz2xN8WqM4qDKFQ5QTwdF32g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dJhau0LaFILj/IFm3JpK00/lnAjoDukMJ8R0j3dPchU=;
 b=PrQO9NIUtOX/0/EHlhtg0Juh5C5GtlSLp2/PPAA/aAaFXiFrlKNN8Eayg02fcVDZ14HDVH
 br4tlK6E4ZYXVrAg==
Date: Sat, 19 Sep 2020 11:18:06 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 15/15] mm/highmem: Provide kmap_temporary*
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:44 +0000
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

Now that the kmap atomic index is stored in task struct provide a
preemptible variant. On context switch the maps of an outgoing task are
removed and the map of the incoming task are restored. That's obviously
slow, but highmem is slow anyway.

The kmap_temporary and iomap_temporary interfaces can be invoked from both
preemptible and atomic context.

A wholesale conversion of kmap_atomic to be fully preemptible is not
possible because some of the usage sites might rely on the preemption
disable for serialization or per CPUness. Needs to be done on a case by
case basis.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/iomap.h |   16 ++++++++-
 arch/x86/mm/iomap_32.c       |    7 +---
 include/linux/highmem.h      |   70 +++++++++++++++++++++++++++++++++----------
 mm/highmem.c                 |   18 +++++------
 4 files changed, 80 insertions(+), 31 deletions(-)

--- a/arch/x86/include/asm/iomap.h
+++ b/arch/x86/include/asm/iomap.h
@@ -13,11 +13,23 @@
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 
-void __iomem *iomap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
+void __iomem *iomap_temporary_pfn_prot(unsigned long pfn, pgprot_t prot);
+
+static inline void __iomem *iomap_atomic_pfn_prot(unsigned long pfn,
+						  pgprot_t prot)
+{
+	preempt_disable();
+	return iomap_temporary_pfn_prot(pfn, prot);
+}
+
+static inline void iounmap_temporary(void __iomem *vaddr)
+{
+	kunmap_temporary_indexed((void __force *)vaddr);
+}
 
 static inline void iounmap_atomic(void __iomem *vaddr)
 {
-	kunmap_atomic_indexed((void __force *)vaddr);
+	iounmap_temporary(vaddr);
 	preempt_enable();
 }
 
--- a/arch/x86/mm/iomap_32.c
+++ b/arch/x86/mm/iomap_32.c
@@ -44,7 +44,7 @@ void iomap_free(resource_size_t base, un
 }
 EXPORT_SYMBOL_GPL(iomap_free);
 
-void __iomem *iomap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+void __iomem *iomap_temporary_pfn_prot(unsigned long pfn, pgprot_t prot)
 {
 	/*
 	 * For non-PAT systems, translate non-WB request to UC- just in
@@ -60,7 +60,6 @@ void __iomem *iomap_atomic_pfn_prot(unsi
 	/* Filter out unsupported __PAGE_KERNEL* bits: */
 	pgprot_val(prot) &= __default_kernel_pte_mask;
 
-	preempt_disable();
-	return (void __force __iomem *)kmap_atomic_pfn_prot(pfn, prot);
+	return (void __force __iomem *)__kmap_temporary_pfn_prot(pfn, prot);
 }
-EXPORT_SYMBOL_GPL(iomap_atomic_pfn_prot);
+EXPORT_SYMBOL_GPL(iomap_temporary_pfn_prot);
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -35,9 +35,9 @@ static inline void invalidate_kernel_vma
  * Outside of CONFIG_HIGHMEM to support X86 32bit iomap_atomic() cruft.
  */
 #ifdef CONFIG_KMAP_ATOMIC_GENERIC
-void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
-void *kmap_atomic_page_prot(struct page *page, pgprot_t prot);
-void kunmap_atomic_indexed(void *vaddr);
+void *__kmap_temporary_pfn_prot(unsigned long pfn, pgprot_t prot);
+void *__kmap_temporary_page_prot(struct page *page, pgprot_t prot);
+void kunmap_temporary_indexed(void *vaddr);
 void kmap_switch_temporary(struct task_struct *prev, struct task_struct *next);
 # ifndef ARCH_NEEDS_KMAP_HIGH_GET
 static inline void *arch_kmap_temporary_high_get(struct page *page)
@@ -95,16 +95,35 @@ static inline void kunmap(struct page *p
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_temporary_page_prot(struct page *page, pgprot_t prot)
 {
-	preempt_disable();
-	return kmap_atomic_page_prot(page, prot);
+	return __kmap_temporary_page_prot(page, prot);
 }
 
-static inline void *kmap_atomic_pfn(unsigned long pfn)
+static inline void *kmap_temporary_page(struct page *page)
+{
+	return kmap_temporary_page_prot(page, kmap_prot);
+}
+
+static inline void *kmap_temporary_pfn_prot(unsigned long pfn, pgprot_t prot)
+{
+	return __kmap_temporary_pfn_prot(pfn, prot);
+}
+
+static inline void *kmap_temporary_pfn(unsigned long pfn)
+{
+	return kmap_temporary_pfn_prot(pfn, kmap_prot);
+}
+
+static inline void __kunmap_temporary(void *vaddr)
+{
+	kunmap_temporary_indexed(vaddr);
+}
+
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
-	return kmap_atomic_pfn_prot(pfn, kmap_prot);
+	return kmap_temporary_page_prot(page, prot);
 }
 
 static inline void *kmap_atomic(struct page *page)
@@ -112,9 +131,10 @@ static inline void *kmap_atomic(struct p
 	return kmap_atomic_prot(page, kmap_prot);
 }
 
-static inline void __kunmap_atomic(void *addr)
+static inline void *kmap_atomic_pfn(unsigned long pfn)
 {
-	kumap_atomic_indexed(addr);
+	preempt_disable();
+	return kmap_temporary_pfn_prot(pfn, kmap_prot);
 }
 
 /* declarations for linux/mm/highmem.c */
@@ -177,6 +197,22 @@ static inline void kunmap(struct page *p
 #endif
 }
 
+static inline void *kmap_temporary_page(struct page *page)
+{
+	pagefault_disable();
+	return page_address(page);
+}
+
+static inline void *kmap_temporary_page_prot(struct page *page, pgprot_t prot)
+{
+	return kmap_temporary_page(page);
+}
+
+static inline void *kmap_temporary_pfn(unsigned long pfn)
+{
+	return kmap_temporary_page(pfn_to_page(pfn));
+}
+
 static inline void *kmap_atomic(struct page *page)
 {
 	preempt_disable();
@@ -194,12 +230,8 @@ static inline void *kmap_atomic_pfn(unsi
 	return kmap_atomic(pfn_to_page(pfn));
 }
 
-static inline void __kunmap_atomic(void *addr)
+static inline void __kunmap_temporary(void *addr)
 {
-	/*
-	 * Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
-	 * handles preemption
-	 */
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(addr);
 #endif
@@ -217,10 +249,16 @@ static inline void __kunmap_atomic(void
 #define kunmap_atomic(addr)						\
 	do {								\
 		BUILD_BUG_ON(__same_type((addr), struct page *));	\
-		__kunmap_atomic(addr);					\
+		__kunmap_temporary(addr);				\
 		preempt_enable();					\
 	} while (0)
 
+#define kunmap_temporary(addr)						\
+	do {								\
+		BUILD_BUG_ON(__same_type((addr), struct page *));	\
+		__kunmap_temporary(addr);				\
+	} while (0)
+
 /* when CONFIG_HIGHMEM is not set these will be plain clear/copy_page */
 #ifndef clear_user_highpage
 static inline void clear_user_highpage(struct page *page, unsigned long vaddr)
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -432,7 +432,7 @@ static pte_t *kmap_get_pte(void)
 	return __kmap_pte;
 }
 
-static void *__kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+static void *do_kmap_temporary_pfn_prot(unsigned long pfn, pgprot_t prot)
 {
 	pte_t pteval, *kmap_pte = kmap_get_pte();
 	unsigned long vaddr;
@@ -451,14 +451,14 @@ static void *__kmap_atomic_pfn_prot(unsi
 	return (void *)vaddr;
 }
 
-void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+void *__kmap_temporary_pfn_prot(unsigned long pfn, pgprot_t prot)
 {
 	pagefault_disable();
-	return __kmap_atomic_pfn_prot(pfn, prot);
+	return do_kmap_temporary_pfn_prot(pfn, prot);
 }
-EXPORT_SYMBOL(kmap_atomic_pfn_prot);
+EXPORT_SYMBOL(__kmap_temporary_pfn_prot);
 
-void *kmap_atomic_page_prot(struct page *page, pgprot_t prot)
+void *__kmap_temporary_page_prot(struct page *page, pgprot_t prot)
 {
 	void *kmap;
 
@@ -471,11 +471,11 @@ void *kmap_atomic_page_prot(struct page
 	if (kmap)
 		return kmap;
 
-	return __kmap_atomic_pfn_prot(page_to_pfn(page), prot);
+	return do_kmap_temporary_pfn_prot(page_to_pfn(page), prot);
 }
-EXPORT_SYMBOL(kmap_atomic_page_prot);
+EXPORT_SYMBOL(__kmap_temporary_page_prot);
 
-void kunmap_atomic_indexed(void *vaddr)
+void kunmap_temporary_indexed(void *vaddr)
 {
 	unsigned long addr = (unsigned long) vaddr & PAGE_MASK;
 	pte_t *kmap_pte = kmap_get_pte();
@@ -503,7 +503,7 @@ void kunmap_atomic_indexed(void *vaddr)
 	preempt_enable();
 	pagefault_enable();
 }
-EXPORT_SYMBOL(kunmap_atomic_indexed);
+EXPORT_SYMBOL(kunmap_temporary_indexed);
 
 void kmap_switch_temporary(struct task_struct *prev, struct task_struct *next)
 {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
