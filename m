Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7F738C0C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3050F10E330;
	Wed, 21 Jun 2023 16:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73610E326
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eONAo72om3NJJPfeQU98nnaiEyx1girYaBRrJpkgqkU=; b=JXUQqB4dBUOu93/qitkyE97f3Z
 vicwKtf2V+aPt3Dbg9/7v8WVwzM1uW09KbzEgrV7HoZavbGv57iMq0P8yKRiVHqblH2VN4jJwQ51P
 3UBOa8B2hu7+kv08AyN/nJEB47YJdT5WmFl8qEnhdI5jyaHNGAsAFAZ1nL/q35cRWiLbB1YToy/e8
 42a1+W41mg0rHN6jVqxvTZByBSAn9Z9fMtkxjLN56svcogUEoy8anGD/EDPT8G5k/Bd4memePz7s9
 CrQmO7YpoNGtdgXoNsSSDZ7tXeMZyLnRddcjDjPExN2w8ZnbHBneVjox+kOnqzeVCqXZWHclrs02X
 NKuWOUMg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y1-00EjDm-IE; Wed, 21 Jun 2023 16:46:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/13] i915: Convert shmem_sg_free_table() to use a folio_batch
Date: Wed, 21 Jun 2023 17:45:48 +0100
Message-Id: <20230621164557.3510324-5-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230621164557.3510324-1-willy@infradead.org>
References: <20230621164557.3510324-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a few hidden compound_head() calls by converting the returned
page to a folio once and using the folio APIs.  We also only increment
the refcount on the folio once instead of once for each page.  Ideally,
we would have a for_each_sgt_folio macro, but until then this will do.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 55 +++++++++++++----------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 33d5d5178103..8f1633c3fb93 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -19,13 +19,13 @@
 #include "i915_trace.h"
 
 /*
- * Move pages to appropriate lru and release the pagevec, decrementing the
- * ref count of those pages.
+ * Move folios to appropriate lru and release the batch, decrementing the
+ * ref count of those folios.
  */
-static void check_release_pagevec(struct pagevec *pvec)
+static void check_release_folio_batch(struct folio_batch *fbatch)
 {
-	check_move_unevictable_pages(pvec);
-	__pagevec_release(pvec);
+	check_move_unevictable_folios(fbatch);
+	__folio_batch_release(fbatch);
 	cond_resched();
 }
 
@@ -33,24 +33,29 @@ void shmem_sg_free_table(struct sg_table *st, struct address_space *mapping,
 			 bool dirty, bool backup)
 {
 	struct sgt_iter sgt_iter;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
+	struct folio *last = NULL;
 	struct page *page;
 
 	mapping_clear_unevictable(mapping);
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	for_each_sgt_page(page, sgt_iter, st) {
-		if (dirty)
-			set_page_dirty(page);
+		struct folio *folio = page_folio(page);
 
+		if (folio == last)
+			continue;
+		last = folio;
+		if (dirty)
+			folio_mark_dirty(folio);
 		if (backup)
-			mark_page_accessed(page);
+			folio_mark_accessed(folio);
 
-		if (!pagevec_add(&pvec, page))
-			check_release_pagevec(&pvec);
+		if (!folio_batch_add(&fbatch, folio))
+			check_release_folio_batch(&fbatch);
 	}
-	if (pagevec_count(&pvec))
-		check_release_pagevec(&pvec);
+	if (fbatch.nr)
+		check_release_folio_batch(&fbatch);
 
 	sg_free_table(st);
 }
@@ -63,8 +68,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 	unsigned int page_count; /* restricted by sg_alloc_table */
 	unsigned long i;
 	struct scatterlist *sg;
-	struct page *page;
-	unsigned long last_pfn = 0;	/* suppress gcc warning */
+	unsigned long next_pfn = 0;	/* suppress gcc warning */
 	gfp_t noreclaim;
 	int ret;
 
@@ -95,6 +99,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 	sg = st->sgl;
 	st->nents = 0;
 	for (i = 0; i < page_count; i++) {
+		struct folio *folio;
 		const unsigned int shrink[] = {
 			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND,
 			0,
@@ -103,12 +108,12 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 
 		do {
 			cond_resched();
-			page = shmem_read_mapping_page_gfp(mapping, i, gfp);
-			if (!IS_ERR(page))
+			folio = shmem_read_folio_gfp(mapping, i, gfp);
+			if (!IS_ERR(folio))
 				break;
 
 			if (!*s) {
-				ret = PTR_ERR(page);
+				ret = PTR_ERR(folio);
 				goto err_sg;
 			}
 
@@ -147,19 +152,21 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 
 		if (!i ||
 		    sg->length >= max_segment ||
-		    page_to_pfn(page) != last_pfn + 1) {
+		    folio_pfn(folio) != next_pfn) {
 			if (i)
 				sg = sg_next(sg);
 
 			st->nents++;
-			sg_set_page(sg, page, PAGE_SIZE, 0);
+			sg_set_folio(sg, folio, folio_size(folio), 0);
 		} else {
-			sg->length += PAGE_SIZE;
+			/* XXX: could overflow? */
+			sg->length += folio_size(folio);
 		}
-		last_pfn = page_to_pfn(page);
+		next_pfn = folio_pfn(folio) + folio_nr_pages(folio);
+		i += folio_nr_pages(folio) - 1;
 
 		/* Check that the i965g/gm workaround works. */
-		GEM_BUG_ON(gfp & __GFP_DMA32 && last_pfn >= 0x00100000UL);
+		GEM_BUG_ON(gfp & __GFP_DMA32 && next_pfn >= 0x00100000UL);
 	}
 	if (sg) /* loop terminated early; short sg table */
 		sg_mark_end(sg);
-- 
2.39.2

