Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF527A6BBF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 21:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BC310E24F;
	Tue, 19 Sep 2023 19:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECC710E1D9;
 Tue, 19 Sep 2023 19:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vdqM9SRxwQlx1Icm+Y2BUJy4OvZR+xQvc2NZy3lMllo=; b=VWvC7AOVyrmVZ69EWYqETfNWzM
 LPPoTgCAgs4/flhJBcgd+KtrL41recfIOYc97OXcwTy2/XisT9/fyRKo92+DG/HibXDm3sfwJa7Tp
 mFppHnAcdd1GI4b1f54NifXzQz5dvzHMvnIAnOcg7A/wg1t/gRpwe+rkRfNmhucG3jRt23yOfNgq6
 3fXjc2HAGJgyOCGN0qmi4IYySbOa3MHBZJNJnQtUNGrpcLFkdV0ljAvzoNQh/bp8Wzin21yO716Wv
 GeAICBMRtoA9Kt8WBv/KYftqNKtTBlvJrrtUb/C6LhSgUhPSRuJXLwe9FnU7JEYw2kO7WP0B6m3G2
 s/GClI4A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qigiR-001SQP-2I; Tue, 19 Sep 2023 19:48:59 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] i915: Limit the length of an sg list to the requested length
Date: Tue, 19 Sep 2023 20:48:55 +0100
Message-Id: <20230919194855.347582-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The folio conversion changed the behaviour of shmem_sg_alloc_table() to
put the entire length of the last folio into the sg list, even if the sg
list should have been shorter.  gen8_ggtt_insert_entries() relied on the
list being the right langth and would overrun the end of the page tables.
Other functions may also have been affected.

Clamp the length of the last entry in the sg list to be the expected
length.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
Cc: stable@vger.kernel.org # 6.5.x
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9256
Link: https://lore.kernel.org/lkml/6287208.lOV4Wx5bFT@natalenko.name/
Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 8f1633c3fb93..73a4a4eb29e0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -100,6 +100,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 	st->nents = 0;
 	for (i = 0; i < page_count; i++) {
 		struct folio *folio;
+		unsigned long nr_pages;
 		const unsigned int shrink[] = {
 			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND,
 			0,
@@ -150,6 +151,8 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 			}
 		} while (1);
 
+		nr_pages = min_t(unsigned long,
+				folio_nr_pages(folio), page_count - i);
 		if (!i ||
 		    sg->length >= max_segment ||
 		    folio_pfn(folio) != next_pfn) {
@@ -157,13 +160,13 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 				sg = sg_next(sg);
 
 			st->nents++;
-			sg_set_folio(sg, folio, folio_size(folio), 0);
+			sg_set_folio(sg, folio, nr_pages * PAGE_SIZE, 0);
 		} else {
 			/* XXX: could overflow? */
-			sg->length += folio_size(folio);
+			sg->length += nr_pages * PAGE_SIZE;
 		}
-		next_pfn = folio_pfn(folio) + folio_nr_pages(folio);
-		i += folio_nr_pages(folio) - 1;
+		next_pfn = folio_pfn(folio) + nr_pages;
+		i += nr_pages - 1;
 
 		/* Check that the i965g/gm workaround works. */
 		GEM_BUG_ON(gfp & __GFP_DMA32 && next_pfn >= 0x00100000UL);
-- 
2.40.1

