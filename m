Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7941D8C16
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 02:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A76E4C4;
	Tue, 19 May 2020 00:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7E56E4C1;
 Tue, 19 May 2020 00:21:28 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec325f90002>; Mon, 18 May 2020 17:19:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 18 May 2020 17:21:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 18 May 2020 17:21:27 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 May
 2020 00:21:27 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 19 May 2020 00:21:27 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.55.90]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec326860000>; Mon, 18 May 2020 17:21:26 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/4] mm/gup: move __get_user_pages_fast() down a few lines in
 gup.c
Date: Mon, 18 May 2020 17:21:21 -0700
Message-ID: <20200519002124.2025955-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519002124.2025955-1-jhubbard@nvidia.com>
References: <20200519002124.2025955-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589847546; bh=rovyqRvoWmUY8LZ787X+YkZeUTez+YCYnMbA60VZKSY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=bSQ34rpRpEOByCzljfvC/zfc+UVQ2Rn8RyR8bdgPZR2DNTrpl8PkavKtjTEuscWrd
 JXJB008sQjaDiHiaipNpC7QRm3/xF0SR7xUuIz6f9FUne9lgD47lmRB40+OWyCy5gj
 mF7WTWbg/vfo7D17F9f2Roho+MrbfURPvNvvYVUNF6lX7Al0oraHZhMjiWHn6zqjaF
 ExjbImR95YFfmlP/Z8W7f1wb8ABXmC9OpXQZQ1kUxMifYC1qqdbjdcl7fq2CScM3uw
 X1hIFk76ZaYn5DST5AfgzCqeXzXV2vhyorhVCH1kG+7fccAblz6n8S/vtBqYbpRiGb
 5JsazZgU3xcrw==
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

This is in order to avoid a forward declaration of
internal_get_user_pages_fast(), in the next patch.

This is code movement only--all generated code should
be identical.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 112 +++++++++++++++++++++++++++----------------------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 50cd9323efff..4502846d57f9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2666,62 +2666,6 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
 }
 #endif
 
-/*
- * Like get_user_pages_fast() except it's IRQ-safe in that it won't fall back to
- * the regular GUP.
- * Note a difference with get_user_pages_fast: this always returns the
- * number of pages pinned, 0 if no pages were pinned.
- *
- * If the architecture does not support this function, simply return with no
- * pages pinned.
- */
-int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
-			  struct page **pages)
-{
-	unsigned long len, end;
-	unsigned long flags;
-	int nr_pinned = 0;
-	/*
-	 * Internally (within mm/gup.c), gup fast variants must set FOLL_GET,
-	 * because gup fast is always a "pin with a +1 page refcount" request.
-	 */
-	unsigned int gup_flags = FOLL_GET;
-
-	if (write)
-		gup_flags |= FOLL_WRITE;
-
-	start = untagged_addr(start) & PAGE_MASK;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-
-	if (end <= start)
-		return 0;
-	if (unlikely(!access_ok((void __user *)start, len)))
-		return 0;
-
-	/*
-	 * Disable interrupts.  We use the nested form as we can already have
-	 * interrupts disabled by get_futex_key.
-	 *
-	 * With interrupts disabled, we block page table pages from being
-	 * freed from under us. See struct mmu_table_batch comments in
-	 * include/asm-generic/tlb.h for more details.
-	 *
-	 * We do not adopt an rcu_read_lock(.) here as we also want to
-	 * block IPIs that come from THPs splitting.
-	 */
-
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
-	    gup_fast_permitted(start, end)) {
-		local_irq_save(flags);
-		gup_pgd_range(start, end, gup_flags, pages, &nr_pinned);
-		local_irq_restore(flags);
-	}
-
-	return nr_pinned;
-}
-EXPORT_SYMBOL_GPL(__get_user_pages_fast);
-
 static int __gup_longterm_unlocked(unsigned long start, int nr_pages,
 				   unsigned int gup_flags, struct page **pages)
 {
@@ -2794,6 +2738,62 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
 	return ret;
 }
 
+/*
+ * Like get_user_pages_fast() except it's IRQ-safe in that it won't fall back to
+ * the regular GUP.
+ * Note a difference with get_user_pages_fast: this always returns the
+ * number of pages pinned, 0 if no pages were pinned.
+ *
+ * If the architecture does not support this function, simply return with no
+ * pages pinned.
+ */
+int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
+			  struct page **pages)
+{
+	unsigned long len, end;
+	unsigned long flags;
+	int nr_pinned = 0;
+	/*
+	 * Internally (within mm/gup.c), gup fast variants must set FOLL_GET,
+	 * because gup fast is always a "pin with a +1 page refcount" request.
+	 */
+	unsigned int gup_flags = FOLL_GET;
+
+	if (write)
+		gup_flags |= FOLL_WRITE;
+
+	start = untagged_addr(start) & PAGE_MASK;
+	len = (unsigned long) nr_pages << PAGE_SHIFT;
+	end = start + len;
+
+	if (end <= start)
+		return 0;
+	if (unlikely(!access_ok((void __user *)start, len)))
+		return 0;
+
+	/*
+	 * Disable interrupts.  We use the nested form as we can already have
+	 * interrupts disabled by get_futex_key.
+	 *
+	 * With interrupts disabled, we block page table pages from being
+	 * freed from under us. See struct mmu_table_batch comments in
+	 * include/asm-generic/tlb.h for more details.
+	 *
+	 * We do not adopt an rcu_read_lock(.) here as we also want to
+	 * block IPIs that come from THPs splitting.
+	 */
+
+	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
+	    gup_fast_permitted(start, end)) {
+		local_irq_save(flags);
+		gup_pgd_range(start, end, gup_flags, pages, &nr_pinned);
+		local_irq_restore(flags);
+	}
+
+	return nr_pinned;
+}
+EXPORT_SYMBOL_GPL(__get_user_pages_fast);
+
 /**
  * get_user_pages_fast() - pin user pages in memory
  * @start:      starting user address
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
