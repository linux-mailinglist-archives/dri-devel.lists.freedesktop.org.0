Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1F1C92EF
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAAC6E9E5;
	Thu,  7 May 2020 15:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14D36E9E5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:00:26 +0000 (UTC)
IronPort-SDR: MIq5VlJTwA6k9Rb2clZ3RK7IckD3jBsfAlb5pRaEpv0K9fxF5baVmdm3DjmY7QQWlgasFKtdFw
 vtETzZ6x0/AQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:25 -0700
IronPort-SDR: ccj/YBIhZWifHTceF3C935K94/o3dJdXmT/VRmo3rphR+KioUyOCSj372Y/MERIhXtEQ84T1Fq
 9jpOl8Z1pCKQ==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="407664237"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:24 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 15/15] kmap: Consolidate kmap_prot definitions
Date: Thu,  7 May 2020 08:00:03 -0700
Message-Id: <20200507150004.1423069-16-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
MIME-Version: 1.0
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

Most architectures define kmap_prot to be PAGE_KERNEL.

Let sparc and xtensa define there own and define PAGE_KERNEL as the
default if not overridden.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	New Patch for this series
---
 arch/arc/include/asm/highmem.h        | 3 ---
 arch/arm/include/asm/highmem.h        | 2 --
 arch/csky/include/asm/highmem.h       | 2 --
 arch/microblaze/include/asm/highmem.h | 1 -
 arch/mips/include/asm/highmem.h       | 2 --
 arch/nds32/include/asm/highmem.h      | 1 -
 arch/powerpc/include/asm/highmem.h    | 1 -
 arch/sparc/include/asm/highmem.h      | 3 ++-
 arch/sparc/mm/highmem.c               | 4 ----
 arch/x86/include/asm/fixmap.h         | 1 -
 include/linux/highmem.h               | 4 ++++
 11 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 70900a73bfc8..6e5eafb3afdd 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -25,9 +25,6 @@
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 #define PKMAP_NR(virt)		(((virt) - PKMAP_BASE) >> PAGE_SHIFT)
 
-#define kmap_prot		PAGE_KERNEL
-
-
 #include <asm/cacheflush.h>
 
 extern void kmap_init(void);
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index b0d4bd8dc3c1..31811be38d78 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -10,8 +10,6 @@
 #define PKMAP_NR(virt)		(((virt) - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-#define kmap_prot		PAGE_KERNEL
-
 #define flush_cache_kmaps() \
 	do { \
 		if (cache_is_vivt()) \
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index ea2f3f39174d..14645e3d5cd5 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -38,8 +38,6 @@ extern void *kmap_atomic_pfn(unsigned long pfn);
 
 extern void kmap_init(void);
 
-#define kmap_prot PAGE_KERNEL
-
 #endif /* __KERNEL__ */
 
 #endif /* __ASM_CSKY_HIGHMEM_H */
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index d7c55cfd27bd..284ca8fb54c1 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -25,7 +25,6 @@
 #include <linux/uaccess.h>
 #include <asm/fixmap.h>
 
-#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 76dec0bd4f59..f1f788b57166 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -54,8 +54,6 @@ extern void *kmap_atomic_pfn(unsigned long pfn);
 
 extern void kmap_init(void);
 
-#define kmap_prot PAGE_KERNEL
-
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_HIGHMEM_H */
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index a48a6536d41a..5717647d14d1 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -32,7 +32,6 @@
 #define LAST_PKMAP_MASK		(LAST_PKMAP - 1)
 #define PKMAP_NR(virt)		(((virt) - (PKMAP_BASE)) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
-#define kmap_prot		PAGE_KERNEL
 
 static inline void flush_cache_kmaps(void)
 {
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index 8d8ee3fcd800..104026f7d6bc 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -29,7 +29,6 @@
 #include <asm/page.h>
 #include <asm/fixmap.h>
 
-#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index f4babe67cb5d..37f8694bde84 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -25,11 +25,12 @@
 #include <asm/vaddrs.h>
 #include <asm/kmap_types.h>
 #include <asm/pgtable.h>
+#include <asm/pgtsrmmu.h>
 
 /* declarations for highmem.c */
 extern unsigned long highstart_pfn, highend_pfn;
 
-extern pgprot_t kmap_prot;
+#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
 extern pte_t *pkmap_page_table;
 
 void kmap_init(void) __init;
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index 414f578d1e57..d237d902f9c3 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -32,9 +32,6 @@
 #include <asm/pgalloc.h>
 #include <asm/vaddrs.h>
 
-pgprot_t kmap_prot;
-EXPORT_SYMBOL(kmap_prot);
-
 static pte_t *kmap_pte;
 
 void __init kmap_init(void)
@@ -51,7 +48,6 @@ void __init kmap_init(void)
 
         /* cache the first kmap pte */
         kmap_pte = pte_offset_kernel(dir, address);
-        kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
 }
 
 void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
index 28183ee3cc42..b9527a54db99 100644
--- a/arch/x86/include/asm/fixmap.h
+++ b/arch/x86/include/asm/fixmap.h
@@ -152,7 +152,6 @@ extern void reserve_top_address(unsigned long reserve);
 extern int fixmaps_set;
 
 extern pte_t *kmap_pte;
-#define kmap_prot PAGE_KERNEL
 extern pte_t *pkmap_page_table;
 
 void __native_set_fixmap(enum fixed_addresses idx, pte_t pte);
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index cc0c3904e501..bf470c16cecb 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -40,6 +40,10 @@ extern void kunmap_atomic_high(void *kvaddr);
 static inline void kmap_flush_tlb(unsigned long addr) { }
 #endif
 
+#ifndef kmap_prot
+#define kmap_prot PAGE_KERNEL
+#endif
+
 void *kmap_high(struct page *page);
 static inline void *kmap(struct page *page)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
