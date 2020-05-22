Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7741DDF31
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 07:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507DC89167;
	Fri, 22 May 2020 05:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484589167;
 Fri, 22 May 2020 05:19:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec760950000>; Thu, 21 May 2020 22:18:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 22:19:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 22:19:33 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 05:19:32 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 22 May 2020 05:19:32 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec760e40004>; Thu, 21 May 2020 22:19:32 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/4] mm/gup: refactor and de-duplicate gup_fast() code
Date: Thu, 21 May 2020 22:19:29 -0700
Message-ID: <20200522051931.54191-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522051931.54191-1-jhubbard@nvidia.com>
References: <20200522051931.54191-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590124693; bh=nsPsKapZXn+OxTjoLo2YVB0tASsozoFnU20LRvrrKZw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=T1RyAMggc45BKtYidiW62E4esSR6VNCnKwFHHSOzOhQxSXgnITiPOPtvw74pAWd3Y
 DXJCuDTOlB0OoKwqdmmRMFTwP7WlcmN+ACt8a1olwx1e6KOwCGZS4C2NsyPceRqxls
 Fo2tN1tz6gIwmlmFw/JtjhzfcilkSrolCDvt13eUp4ScRrxh9hUbOtU/VM2QQFC/t0
 7d1NNi71+TYPnofSt/ZF2Yi34nDJ93/YhfPRJzjgFRw4zmtWuPlBdXWJhGXy98bxNz
 Mn1oxPCtQ8E11mzkPsRohafWbmqsp+WWLFqZw82/d8qFjv30+i0a9CXW8sfC37CsZ+
 N2lvSYwtCQMUw==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were two nearly identical sets of code for gup_fast()
style of walking the page tables with interrupts disabled.
This has lead to the usual maintenance problems that arise from
having duplicated code.

There is already a core internal routine in gup.c for gup_fast(),
so just enhance it very slightly: allow skipping the fall-back
to "slow" (regular) get_user_pages(), via the new FOLL_FAST_ONLY
flag. Then, just call internal_get_user_pages_fast() from
__get_user_pages_fast(), and adjust the API to match pre-existing
API behavior.

There is a change in behavior from this refactoring: the nested
form of interrupt disabling is used in all gup_fast() variants
now. That's because there is only one place that interrupt disabling
for page walking is done, and so the safer form is required. This
should, if anything, eliminate possible (rare) bugs, because the
non-nested form of enabling interrupts was fragile at best.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/mm.h |  1 +
 mm/gup.c           | 63 ++++++++++++++++++++++------------------------
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a5594ac9ebe3..84b601cab699 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2782,6 +2782,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 #define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below */
 #define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
 #define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
+#define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
 
 /*
  * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
diff --git a/mm/gup.c b/mm/gup.c
index 4502846d57f9..4564b0dc7d0b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2694,10 +2694,12 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
 					struct page **pages)
 {
 	unsigned long addr, len, end;
+	unsigned long flags;
 	int nr_pinned = 0, ret = 0;
 
 	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
-				       FOLL_FORCE | FOLL_PIN | FOLL_GET)))
+				       FOLL_FORCE | FOLL_PIN | FOLL_GET |
+				       FOLL_FAST_ONLY)))
 		return -EINVAL;
 
 	start = untagged_addr(start) & PAGE_MASK;
@@ -2710,15 +2712,26 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
 	if (unlikely(!access_ok((void __user *)start, len)))
 		return -EFAULT;
 
+	/*
+	 * Disable interrupts. The nested form is used, in order to allow full,
+	 * general purpose use of this routine.
+	 *
+	 * With interrupts disabled, we block page table pages from being
+	 * freed from under us. See struct mmu_table_batch comments in
+	 * include/asm-generic/tlb.h for more details.
+	 *
+	 * We do not adopt an rcu_read_lock(.) here as we also want to
+	 * block IPIs that come from THPs splitting.
+	 */
 	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
 	    gup_fast_permitted(start, end)) {
-		local_irq_disable();
+		local_irq_save(flags);
 		gup_pgd_range(addr, end, gup_flags, pages, &nr_pinned);
-		local_irq_enable();
+		local_irq_restore(flags);
 		ret = nr_pinned;
 	}
 
-	if (nr_pinned < nr_pages) {
+	if (nr_pinned < nr_pages && !(gup_flags & FOLL_FAST_ONLY)) {
 		/* Try to get the remaining pages with get_user_pages */
 		start += nr_pinned << PAGE_SHIFT;
 		pages += nr_pinned;
@@ -2750,45 +2763,29 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
 int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 			  struct page **pages)
 {
-	unsigned long len, end;
-	unsigned long flags;
-	int nr_pinned = 0;
+	int nr_pinned;
 	/*
 	 * Internally (within mm/gup.c), gup fast variants must set FOLL_GET,
 	 * because gup fast is always a "pin with a +1 page refcount" request.
+	 *
+	 * FOLL_FAST_ONLY is required in order to match the API description of
+	 * this routine: no fall back to regular ("slow") GUP.
 	 */
-	unsigned int gup_flags = FOLL_GET;
+	unsigned int gup_flags = FOLL_GET | FOLL_FAST_ONLY;
 
 	if (write)
 		gup_flags |= FOLL_WRITE;
 
-	start = untagged_addr(start) & PAGE_MASK;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-
-	if (end <= start)
-		return 0;
-	if (unlikely(!access_ok((void __user *)start, len)))
-		return 0;
-
+	nr_pinned = internal_get_user_pages_fast(start, nr_pages, gup_flags,
+						 pages);
 	/*
-	 * Disable interrupts.  We use the nested form as we can already have
-	 * interrupts disabled by get_futex_key.
-	 *
-	 * With interrupts disabled, we block page table pages from being
-	 * freed from under us. See struct mmu_table_batch comments in
-	 * include/asm-generic/tlb.h for more details.
-	 *
-	 * We do not adopt an rcu_read_lock(.) here as we also want to
-	 * block IPIs that come from THPs splitting.
+	 * As specified in the API description above, this routine is not
+	 * allowed to return negative values. However, the common core
+	 * routine internal_get_user_pages_fast() *can* return -errno.
+	 * Therefore, correct for that here:
 	 */
-
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
-	    gup_fast_permitted(start, end)) {
-		local_irq_save(flags);
-		gup_pgd_range(start, end, gup_flags, pages, &nr_pinned);
-		local_irq_restore(flags);
-	}
+	if (nr_pinned < 0)
+		nr_pinned = 0;
 
 	return nr_pinned;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
