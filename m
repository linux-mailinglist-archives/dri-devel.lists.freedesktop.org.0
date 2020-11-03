Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FA2A5F4C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68411891BF;
	Wed,  4 Nov 2020 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102E6EC41;
 Tue,  3 Nov 2020 10:33:36 +0000 (UTC)
Message-Id: <20201103095857.472289952@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=B0hFoCMbd1BTTJA4iomuHwwbKwpHOM25a6SSJ6sGjas=;
 b=Da+xDlV6KKffjn87YKI1w17KiAxAeIwWeQXSeWKC0+BzZgA/gqhzIh0qkDbs5ynMS6tGaO
 I8gHmEb35BY82N8vhI97HVBvnAj55thowV9wgbIh3Jq3p63khMhgHQ4eq2qttbXse7CCph
 uIdVwPXAtNbLoPzXMD0fYpkKihvozEBm9/mhdN9HeJsuptVOho9HcZgMt5aBipbQzD32j0
 n8uwlpoGAeQE1AfGOa25U2RbcXloELidSAwyNrGWvl5+J16S5YpCbXHODVye950pME+SVH
 /3ATFCqI1kOabZgkLc1vcBDW9PIVmKxSuqkyhuUa0/xRqCZQCIo4wyfRwpb6Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=B0hFoCMbd1BTTJA4iomuHwwbKwpHOM25a6SSJ6sGjas=;
 b=f+EMpg4dOklmbcFvEtDPybxH7tM1dD0ExZ/edleu8OU1SH6t6ksrWSj8ZZKeC1sXeVE20y
 HTqugv1TVnCd4ECw==
Date: Tue, 03 Nov 2020 10:27:21 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 09/37] arc/mm/highmem: Use generic kmap atomic
 implementation
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

Adopt the map ordering to match the other architectures and the generic
code. Also make the maximum entries limited and not dependend on the number
of CPUs. With the original implementation did the following calculation:

   nr_slots = mapsize >> PAGE_SHIFT;

The results in either 512 or 1024 total slots depending on
configuration. The total slots have to be divided by the number of CPUs to
get the number of slots per CPU (former KM_TYPE_NR). ARC supports up to 4k
CPUs, so this just falls apart in random ways depending on the number of
CPUs and the actual kmap (atomic) nesting. The comment in highmem.c:

 * - fixmap anyhow needs a limited number of mappings. So 2M kvaddr == 256 PTE
 *   slots across NR_CPUS would be more than sufficient (generic code defines
 *   KM_TYPE_NR as 20).

is just wrong. KM_TYPE_NR (now KM_MAX_IDX) is the number of slots per CPU
because kmap_local/atomic() needs to support nested mappings (thread,
softirq, interrupt). While KM_MAX_IDX might be overestimated, the above
reasoning is just wrong and clearly the highmem code was never tested with
any system with more than a few CPUs.

Use the default number of slots and fail the build when it does not
fit. Randomly failing at runtime is not a really good option.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
V3: Make it actually more correct.
---
 arch/arc/Kconfig                  |    1 
 arch/arc/include/asm/highmem.h    |   26 ++++++++++++++----
 arch/arc/include/asm/kmap_types.h |   14 ---------
 arch/arc/mm/highmem.c             |   54 +++-----------------------------------
 4 files changed, 26 insertions(+), 69 deletions(-)

--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -507,6 +507,7 @@ config LINUX_RAM_BASE
 config HIGHMEM
 	bool "High Memory Support"
 	select ARCH_DISCONTIGMEM_ENABLE
+	select KMAP_LOCAL
 	help
 	  With ARC 2G:2G address split, only upper 2G is directly addressable by
 	  kernel. Enable this to potentially allow access to rest of 2G and PAE
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -9,17 +9,29 @@
 #ifdef CONFIG_HIGHMEM
 
 #include <uapi/asm/page.h>
-#include <asm/kmap_types.h>
+#include <asm/kmap_size.h>
+
+#define FIXMAP_SIZE		PGDIR_SIZE
+#define PKMAP_SIZE		PGDIR_SIZE
 
 /* start after vmalloc area */
 #define FIXMAP_BASE		(PAGE_OFFSET - FIXMAP_SIZE - PKMAP_SIZE)
-#define FIXMAP_SIZE		PGDIR_SIZE	/* only 1 PGD worth */
-#define KM_TYPE_NR		((FIXMAP_SIZE >> PAGE_SHIFT)/NR_CPUS)
-#define FIXMAP_ADDR(nr)		(FIXMAP_BASE + ((nr) << PAGE_SHIFT))
+
+#define FIX_KMAP_SLOTS		(KM_MAX_IDX * NR_CPUS)
+#define FIX_KMAP_BEGIN		(0UL)
+#define FIX_KMAP_END		((FIX_KMAP_BEGIN + FIX_KMAP_SLOTS) - 1)
+
+#define FIXADDR_TOP		(FIXMAP_BASE + (FIX_KMAP_END << PAGE_SHIFT))
+
+/*
+ * This should be converted to the asm-generic version, but of course this
+ * is needlessly different from all other architectures. Sigh - tglx
+ */
+#define __fix_to_virt(x)	(FIXADDR_TOP - ((x) << PAGE_SHIFT))
+#define __virt_to_fix(x)	(((FIXADDR_TOP - ((x) & PAGE_MASK))) >> PAGE_SHIFT)
 
 /* start after fixmap area */
 #define PKMAP_BASE		(FIXMAP_BASE + FIXMAP_SIZE)
-#define PKMAP_SIZE		PGDIR_SIZE
 #define LAST_PKMAP		(PKMAP_SIZE >> PAGE_SHIFT)
 #define LAST_PKMAP_MASK		(LAST_PKMAP - 1)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
@@ -29,11 +41,13 @@
 
 extern void kmap_init(void);
 
+#define arch_kmap_local_post_unmap(vaddr)			\
+	local_flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE)
+
 static inline void flush_cache_kmaps(void)
 {
 	flush_cache_all();
 }
-
 #endif
 
 #endif
--- a/arch/arc/include/asm/kmap_types.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2015 Synopsys, Inc. (www.synopsys.com)
- */
-
-#ifndef _ASM_KMAP_TYPES_H
-#define _ASM_KMAP_TYPES_H
-
-/*
- * We primarily need to define KM_TYPE_NR here but that in turn
- * is a function of PGDIR_SIZE etc.
- * To avoid circular deps issue, put everything in asm/highmem.h
- */
-#endif
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -36,9 +36,8 @@
  *   This means each only has 1 PGDIR_SIZE worth of kvaddr mappings, which means
  *   2M of kvaddr space for typical config (8K page and 11:8:13 traversal split)
  *
- * - fixmap anyhow needs a limited number of mappings. So 2M kvaddr == 256 PTE
- *   slots across NR_CPUS would be more than sufficient (generic code defines
- *   KM_TYPE_NR as 20).
+ * - The fixed KMAP slots for kmap_local/atomic() require KM_MAX_IDX slots per
+ *   CPU. So the number of CPUs sharing a single PTE page is limited.
  *
  * - pkmap being preemptible, in theory could do with more than 256 concurrent
  *   mappings. However, generic pkmap code: map_new_virtual(), doesn't traverse
@@ -47,48 +46,6 @@
  */
 
 extern pte_t * pkmap_page_table;
-static pte_t * fixmap_page_table;
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	int idx, cpu_idx;
-	unsigned long vaddr;
-
-	cpu_idx = kmap_atomic_idx_push();
-	idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
-	vaddr = FIXMAP_ADDR(idx);
-
-	set_pte_at(&init_mm, vaddr, fixmap_page_table + idx,
-		   mk_pte(page, prot));
-
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kv)
-{
-	unsigned long kvaddr = (unsigned long)kv;
-
-	if (kvaddr >= FIXMAP_BASE && kvaddr < (FIXMAP_BASE + FIXMAP_SIZE)) {
-
-		/*
-		 * Because preemption is disabled, this vaddr can be associated
-		 * with the current allocated index.
-		 * But in case of multiple live kmap_atomic(), it still relies on
-		 * callers to unmap in right order.
-		 */
-		int cpu_idx = kmap_atomic_idx();
-		int idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
-
-		WARN_ON(kvaddr != FIXMAP_ADDR(idx));
-
-		pte_clear(&init_mm, kvaddr, fixmap_page_table + idx);
-		local_flush_tlb_kernel_range(kvaddr, kvaddr + PAGE_SIZE);
-
-		kmap_atomic_idx_pop();
-	}
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
 
 static noinline pte_t * __init alloc_kmap_pgtable(unsigned long kvaddr)
 {
@@ -108,10 +65,9 @@ void __init kmap_init(void)
 {
 	/* Due to recursive include hell, we can't do this in processor.h */
 	BUILD_BUG_ON(PAGE_OFFSET < (VMALLOC_END + FIXMAP_SIZE + PKMAP_SIZE));
+	BUILD_BUG_ON(LAST_PKMAP > PTRS_PER_PTE);
+	BUILD_BUG_ON(FIX_KMAP_SLOTS > PTRS_PER_PTE);
 
-	BUILD_BUG_ON(KM_TYPE_NR > PTRS_PER_PTE);
 	pkmap_page_table = alloc_kmap_pgtable(PKMAP_BASE);
-
-	BUILD_BUG_ON(LAST_PKMAP > PTRS_PER_PTE);
-	fixmap_page_table = alloc_kmap_pgtable(FIXMAP_BASE);
+	alloc_kmap_pgtable(FIXMAP_BASE);
 }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
