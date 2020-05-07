Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB871C92EE
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174BB6E9E8;
	Thu,  7 May 2020 15:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEFD6E9E0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:00:19 +0000 (UTC)
IronPort-SDR: zr1cQBWYrRLm7qwemuLnE+zSBaIFIVY3INmaPagD3OUaj+fFkgJ0FywDP/tsgkaCnjJQSwAfcx
 3+9nfOabD1sA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:17 -0700
IronPort-SDR: GyT9A+G3FXRtWFWcmfwMN9FcbsbQcr5tTAtKkC/v34jELwmSILAhr9zv8Dit3jxz9xzUuFqhJm
 A8YMoD3TSAdQ==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="278623726"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:15 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 08/15] arch/kmap: Ensure kmap_prot visibility
Date: Thu,  7 May 2020 07:59:56 -0700
Message-Id: <20200507150004.1423069-9-ira.weiny@intel.com>
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
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

We want to support kmap_atomic_prot() on all architectures and it makes
sense to define kmap_atomic() to use the default kmap_prot.

So we ensure all arch's have a globally available kmap_prot either as a
define or exported symbol.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/microblaze/include/asm/highmem.h | 2 +-
 arch/microblaze/mm/init.c             | 3 ---
 arch/powerpc/include/asm/highmem.h    | 2 +-
 arch/powerpc/mm/mem.c                 | 3 ---
 arch/sparc/mm/highmem.c               | 1 +
 5 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index c3cbda90391d..90d96239152f 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -25,8 +25,8 @@
 #include <linux/uaccess.h>
 #include <asm/fixmap.h>
 
+#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
-extern pgprot_t kmap_prot;
 extern pte_t *pkmap_page_table;
 
 /*
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 1ffbfa96b9b8..a467686c13af 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -49,8 +49,6 @@ unsigned long lowmem_size;
 #ifdef CONFIG_HIGHMEM
 pte_t *kmap_pte;
 EXPORT_SYMBOL(kmap_pte);
-pgprot_t kmap_prot;
-EXPORT_SYMBOL(kmap_prot);
 
 static inline pte_t *virt_to_kpte(unsigned long vaddr)
 {
@@ -68,7 +66,6 @@ static void __init highmem_init(void)
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
 
 	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
-	kmap_prot = PAGE_KERNEL;
 }
 
 static void highmem_setup(void)
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index 373a470df205..ee5de974c5ef 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -29,8 +29,8 @@
 #include <asm/page.h>
 #include <asm/fixmap.h>
 
+#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
-extern pgprot_t kmap_prot;
 extern pte_t *pkmap_page_table;
 
 /*
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 041ed7cfd341..3f642b058731 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -64,8 +64,6 @@ bool init_mem_is_free;
 #ifdef CONFIG_HIGHMEM
 pte_t *kmap_pte;
 EXPORT_SYMBOL(kmap_pte);
-pgprot_t kmap_prot;
-EXPORT_SYMBOL(kmap_prot);
 #endif
 
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
@@ -245,7 +243,6 @@ void __init paging_init(void)
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
 
 	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
-	kmap_prot = PAGE_KERNEL;
 #endif /* CONFIG_HIGHMEM */
 
 	printk(KERN_DEBUG "Top of RAM: 0x%llx, Total RAM: 0x%llx\n",
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index 469786bc430f..9f06d75e88e1 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -33,6 +33,7 @@
 #include <asm/vaddrs.h>
 
 pgprot_t kmap_prot;
+EXPORT_SYMBOL(kmap_prot);
 
 static pte_t *kmap_pte;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
