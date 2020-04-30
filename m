Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B31C080E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 22:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D396E956;
	Thu, 30 Apr 2020 20:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3805B6E956
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 20:38:56 +0000 (UTC)
IronPort-SDR: 18xqAFx/2LfzY288NnzdEb22vpUi4IaAri06i0BhaOtDzdWvcYur6J0C6BBI7N7dYMHHA7p/1e
 kqvjl9R9VI6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:55 -0700
IronPort-SDR: raQpdC72YFymAIww5pBWhgwTlpswHIXh/yYnXb0jxGotejI0KfGe2RpyzN+m+jLvUgvh7ne7hF
 E5EUVtWuHrAw==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="459712118"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:54 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V1 08/10] arch/kmap: Don't hard code kmap_prot values
Date: Thu, 30 Apr 2020 13:38:43 -0700
Message-Id: <20200430203845.582900-9-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
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
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

To support kmap_atomic_prot() on all architectures each arch must
support protections passed in to them.

Change csky, mips, nds32 and xtensa to use their global kmap_prot value
rather than a hard coded value which was equal.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/csky/mm/highmem.c   | 2 +-
 arch/mips/mm/highmem.c   | 2 +-
 arch/nds32/mm/highmem.c  | 2 +-
 arch/xtensa/mm/highmem.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 0aafbbbe651c..f4311669b5bb 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -32,7 +32,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, PAGE_KERNEL));
+	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
 	flush_tlb_one((unsigned long)vaddr);
 
 	return (void *)vaddr;
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 155fbb107b35..87023bd1a33c 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -29,7 +29,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, PAGE_KERNEL));
+	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
 	local_flush_tlb_one((unsigned long)vaddr);
 
 	return (void*) vaddr;
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index f6e6915c0d31..809f8c830f06 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -21,7 +21,7 @@ void *kmap_atomic_high(struct page *page)
 
 	idx = type + KM_TYPE_NR * smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	pte = (page_to_pfn(page) << PAGE_SHIFT) | (PAGE_KERNEL);
+	pte = (page_to_pfn(page) << PAGE_SHIFT) | (kmap_prot);
 	ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
 	set_pte(ptep, pte);
 
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index f57a7770eb08..8c58c4c37033 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -48,7 +48,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte + idx)));
 #endif
-	set_pte(kmap_pte + idx, mk_pte(page, PAGE_KERNEL_EXEC));
+	set_pte(kmap_pte + idx, mk_pte(page, kmap_prot));
 
 	return (void *)vaddr;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
