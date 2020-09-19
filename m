Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F7271C12
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28F96E219;
	Mon, 21 Sep 2020 07:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154C16E20A;
 Sat, 19 Sep 2020 09:50:18 +0000 (UTC)
Message-Id: <20200919092617.183860899@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=T76OE0hi3eXJr7P+BXpYE0pYDTNZ2r9R3SGulCeyUuU=;
 b=2FnY2CgYWeCTW79kyvYexk7YWJ5xeg5RXZtJ9x9zc2OPN3Abm6p3LWSqAACGBBqDpxCXEK
 AmJNM9ROty5cv5zC8ZMPGQFlgo5ozfsX3aCrBpUMsRRmNlSxk2Nb7ibaVsStTHAV+q1xhw
 tyuUzA8HGEbMNGj37Qb4z+s6kZ5dVfT/fSBG8UTTSfIo/dViyeIUoDNoqWM41jUb1uRe8y
 TNuoicaGFBrepBDOjFrsE5pU2M0/QYOnyyCI8Na1YuZRUl8nzPl97OPAYFEckcN1cPy7c7
 tnTLXhL0lRIQLAXZHDTRcAsRcj8SYlsXc5v1Qks/4q2bDcL1VWyRREvxbaGmYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=T76OE0hi3eXJr7P+BXpYE0pYDTNZ2r9R3SGulCeyUuU=;
 b=fMUgmEzq+EZqCAGQZdywecGad01pST+RaIL5AkSyisvyVygac32pLGfvQZhYYgbpit1xXp
 4d6YjSdh1O9XNzCw==
Date: Sat, 19 Sep 2020 11:18:04 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 13/15] mm/highmem: Remove the old kmap_atomic cruft
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
---
 include/linux/highmem.h |   65 ++----------------------------------------------
 mm/highmem.c            |   28 +++++++++++++++++---
 2 files changed, 28 insertions(+), 65 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -94,27 +94,6 @@ static inline void kunmap(struct page *p
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
-
-#ifndef CONFIG_KMAP_ATOMIC_GENERIC
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-void kunmap_atomic_high(void *kvaddr);
-
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_atomic_high_prot(page, prot);
-}
-
-static inline void __kunmap_atomic(void *vaddr)
-{
-	kunmap_atomic_high(vaddr);
-	pagefault_enable();
-}
-#else /* !CONFIG_KMAP_ATOMIC_GENERIC */
-
 static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
@@ -127,17 +106,14 @@ static inline void *kmap_atomic_pfn(unsi
 	return kmap_atomic_pfn_prot(pfn, kmap_prot);
 }
 
-static inline void __kunmap_atomic(void *addr)
+static inline void *kmap_atomic(struct page *page)
 {
-	kumap_atomic_indexed(addr);
+	return kmap_atomic_prot(page, kmap_prot);
 }
 
-
-#endif /* CONFIG_KMAP_ATOMIC_GENERIC */
-
-static inline void *kmap_atomic(struct page *page)
+static inline void __kunmap_atomic(void *addr)
 {
-	return kmap_atomic_prot(page, kmap_prot);
+	kumap_atomic_indexed(addr);
 }
 
 /* declarations for linux/mm/highmem.c */
@@ -233,39 +209,6 @@ static inline void __kunmap_atomic(void
 
 #endif /* CONFIG_HIGHMEM */
 
-#if defined(CONFIG_HIGHMEM) || defined(CONFIG_X86_32)
-
-DECLARE_PER_CPU(int, __kmap_atomic_idx);
-
-static inline int kmap_atomic_idx_push(void)
-{
-	int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	WARN_ON_ONCE(in_irq() && !irqs_disabled());
-	BUG_ON(idx >= KM_TYPE_NR);
-#endif
-	return idx;
-}
-
-static inline int kmap_atomic_idx(void)
-{
-	return __this_cpu_read(__kmap_atomic_idx) - 1;
-}
-
-static inline void kmap_atomic_idx_pop(void)
-{
-#ifdef CONFIG_DEBUG_HIGHMEM
-	int idx = __this_cpu_dec_return(__kmap_atomic_idx);
-
-	BUG_ON(idx < 0);
-#else
-	__this_cpu_dec(__kmap_atomic_idx);
-#endif
-}
-
-#endif
-
 /*
  * Prevent people trying to call kunmap_atomic() as if it were kunmap()
  * kunmap_atomic() should get the return value of kmap_atomic, not the page.
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -31,10 +31,6 @@
 #include <asm/tlbflush.h>
 #include <linux/vmalloc.h>
 
-#if defined(CONFIG_HIGHMEM) || defined(CONFIG_X86_32)
-DEFINE_PER_CPU(int, __kmap_atomic_idx);
-#endif
-
 /*
  * Virtual_count is not a pure "count".
  *  0 means that it is not mapped, and has not been mapped
@@ -380,6 +376,30 @@ static inline void kmap_high_unmap_tempo
 #endif /* CONFIG_HIGHMEM */
 
 #ifdef CONFIG_KMAP_ATOMIC_GENERIC
+
+static DEFINE_PER_CPU(int, __kmap_atomic_idx);
+
+static inline int kmap_atomic_idx_push(void)
+{
+	int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
+
+	WARN_ON_ONCE(in_irq() && !irqs_disabled());
+	BUG_ON(idx >= KM_TYPE_NR);
+	return idx;
+}
+
+static inline int kmap_atomic_idx(void)
+{
+	return __this_cpu_read(__kmap_atomic_idx) - 1;
+}
+
+static inline void kmap_atomic_idx_pop(void)
+{
+	int idx = __this_cpu_dec_return(__kmap_atomic_idx);
+
+	BUG_ON(idx < 0);
+}
+
 #ifndef arch_kmap_temp_post_map
 # define arch_kmap_temp_post_map(vaddr, pteval)	do { } while (0)
 #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
