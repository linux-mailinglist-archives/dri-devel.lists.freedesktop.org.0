Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266CB282B88
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 17:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF1489F4A;
	Sun,  4 Oct 2020 15:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D534889E50;
 Sun,  4 Oct 2020 15:43:57 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EC0B20735;
 Sun,  4 Oct 2020 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601826237;
 bh=cMP0wpbyjV/IgdoWA8GFyhNdFCLseQ+W1zGduoOqTuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XazOb65HVrgpSmRiSceGVm2q2yryjkuepf6G/LXWO3qkAed580vQdH/mipD4PuegF
 E53dn5FKQvLWWTLFCuaoeH/vA5eSNH9zogmj30fOer4bumH3qf5xdDAiR32ZZUlI0n
 9OV/g8m2C4KMPBK5spl4CUf85NhIQj1X+Od66oio=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH rdma-next v5 1/4] lib/scatterlist: Add support in dynamic
 allocation of SG table from pages
Date: Sun,  4 Oct 2020 18:43:37 +0300
Message-Id: <20201004154340.1080481-2-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004154340.1080481-1-leon@kernel.org>
References: <20201004154340.1080481-1-leon@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maor Gottlieb <maorg@nvidia.com>

Extend __sg_alloc_table_from_pages to support dynamic allocation of
SG table from pages. It should be used by drivers that can't supply
all the pages at one time.

This function returns the last populated SGE in the table. Users should
pass it as an argument to the function from the second call and forward.
As before, nents will be equal to the number of populated SGEs (chunks).

With this new extension, drivers can benefit the optimization of merging
contiguous pages without a need to allocate all pages in advance and
hold them in a large buffer.

E.g. with the Infiniband driver that allocates a single page for hold the
pages. For 1TB memory registration, the temporary buffer would consume only
4KB, instead of 2GB.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  15 ++-
 include/linux/scatterlist.h                 |  38 +++---
 lib/scatterlist.c                           | 125 ++++++++++++++++----
 tools/testing/scatterlist/main.c            |   9 +-
 5 files changed, 142 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 12b30075134a..f2eaed6aca3d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -403,6 +403,7 @@ __i915_gem_userptr_alloc_pages(struct drm_i915_gem_object *obj,
 	unsigned int max_segment = i915_sg_segment_size();
 	struct sg_table *st;
 	unsigned int sg_page_sizes;
+	struct scatterlist *sg;
 	int ret;

 	st = kmalloc(sizeof(*st), GFP_KERNEL);
@@ -410,13 +411,12 @@ __i915_gem_userptr_alloc_pages(struct drm_i915_gem_object *obj,
 		return ERR_PTR(-ENOMEM);

 alloc_table:
-	ret = __sg_alloc_table_from_pages(st, pvec, num_pages,
-					  0, num_pages << PAGE_SHIFT,
-					  max_segment,
-					  GFP_KERNEL);
-	if (ret) {
+	sg = __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
+					 num_pages << PAGE_SHIFT, max_segment,
+					 NULL, 0, GFP_KERNEL);
+	if (IS_ERR(sg)) {
 		kfree(st);
-		return ERR_PTR(ret);
+		return ERR_CAST(sg);
 	}

 	ret = i915_gem_gtt_prepare_pages(obj, st);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index ab524ab3b0b4..f22acd398b1f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -419,6 +419,7 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 	int ret = 0;
 	static size_t sgl_size;
 	static size_t sgt_size;
+	struct scatterlist *sg;

 	if (vmw_tt->mapped)
 		return 0;
@@ -441,13 +442,15 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			return ret;

-		ret = __sg_alloc_table_from_pages
-			(&vmw_tt->sgt, vsgt->pages, vsgt->num_pages, 0,
-			 (unsigned long) vsgt->num_pages << PAGE_SHIFT,
-			 dma_get_max_seg_size(dev_priv->dev->dev),
-			 GFP_KERNEL);
-		if (unlikely(ret != 0))
+		sg = __sg_alloc_table_from_pages(&vmw_tt->sgt, vsgt->pages,
+				vsgt->num_pages, 0,
+				(unsigned long) vsgt->num_pages << PAGE_SHIFT,
+				dma_get_max_seg_size(dev_priv->dev->dev),
+				NULL, 0, GFP_KERNEL);
+		if (IS_ERR(sg)) {
+			ret = PTR_ERR(sg);
 			goto out_sg_alloc_fail;
+		}

 		if (vsgt->num_pages > vmw_tt->sgt.nents) {
 			uint64_t over_alloc =
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 45cf7b69d852..36c47e7e66a2 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -165,6 +165,22 @@ static inline void sg_set_buf(struct scatterlist *sg, const void *buf,
 #define for_each_sgtable_dma_sg(sgt, sg, i)	\
 	for_each_sg((sgt)->sgl, sg, (sgt)->nents, i)

+static inline void __sg_chain(struct scatterlist *chain_sg,
+			      struct scatterlist *sgl)
+{
+	/*
+	 * offset and length are unused for chain entry. Clear them.
+	 */
+	chain_sg->offset = 0;
+	chain_sg->length = 0;
+
+	/*
+	 * Set lowest bit to indicate a link pointer, and make sure to clear
+	 * the termination bit if it happens to be set.
+	 */
+	chain_sg->page_link = ((unsigned long) sgl | SG_CHAIN) & ~SG_END;
+}
+
 /**
  * sg_chain - Chain two sglists together
  * @prv:	First scatterlist
@@ -178,18 +194,7 @@ static inline void sg_set_buf(struct scatterlist *sg, const void *buf,
 static inline void sg_chain(struct scatterlist *prv, unsigned int prv_nents,
 			    struct scatterlist *sgl)
 {
-	/*
-	 * offset and length are unused for chain entry.  Clear them.
-	 */
-	prv[prv_nents - 1].offset = 0;
-	prv[prv_nents - 1].length = 0;
-
-	/*
-	 * Set lowest bit to indicate a link pointer, and make sure to clear
-	 * the termination bit if it happens to be set.
-	 */
-	prv[prv_nents - 1].page_link = ((unsigned long) sgl | SG_CHAIN)
-					& ~SG_END;
+	__sg_chain(&prv[prv_nents - 1], sgl);
 }

 /**
@@ -286,10 +291,11 @@ void sg_free_table(struct sg_table *);
 int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
 		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
 int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
-int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-				unsigned int n_pages, unsigned int offset,
-				unsigned long size, unsigned int max_segment,
-				gfp_t gfp_mask);
+struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+		struct page **pages, unsigned int n_pages, unsigned int offset,
+		unsigned long size, unsigned int max_segment,
+		struct scatterlist *prv, unsigned int left_pages,
+		gfp_t gfp_mask);
 int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			      unsigned int n_pages, unsigned int offset,
 			      unsigned long size, gfp_t gfp_mask);
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 5d63a8857f36..e102fdfaa75b 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -365,6 +365,37 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(sg_alloc_table);

+static struct scatterlist *get_next_sg(struct sg_table *table,
+				       struct scatterlist *cur,
+				       unsigned long needed_sges,
+				       gfp_t gfp_mask)
+{
+	struct scatterlist *new_sg, *next_sg;
+	unsigned int alloc_size;
+
+	if (cur) {
+		next_sg = sg_next(cur);
+		/* Check if last entry should be keeped for chainning */
+		if (!sg_is_last(next_sg) || needed_sges == 1)
+			return next_sg;
+	}
+
+	alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
+	new_sg = sg_kmalloc(alloc_size, gfp_mask);
+	if (!new_sg)
+		return ERR_PTR(-ENOMEM);
+	sg_init_table(new_sg, alloc_size);
+	if (cur) {
+		__sg_chain(next_sg, new_sg);
+		table->orig_nents += alloc_size - 1;
+	} else {
+		table->sgl = new_sg;
+		table->orig_nents = alloc_size;
+		table->nents = 0;
+	}
+	return new_sg;
+}
+
 /**
  * __sg_alloc_table_from_pages - Allocate and initialize an sg table from
  *			         an array of pages
@@ -374,29 +405,63 @@ EXPORT_SYMBOL(sg_alloc_table);
  * @offset:      Offset from start of the first page to the start of a buffer
  * @size:        Number of valid bytes in the buffer (after offset)
  * @max_segment: Maximum size of a scatterlist node in bytes (page aligned)
+ * @prv:	 Last populated sge in sgt
+ * @left_pages:  Left pages caller have to set after this call
  * @gfp_mask:	 GFP allocation mask
  *
- *  Description:
- *    Allocate and initialize an sg table from a list of pages. Contiguous
- *    ranges of the pages are squashed into a single scatterlist node up to the
- *    maximum size specified in @max_segment. An user may provide an offset at a
- *    start and a size of valid data in a buffer specified by the page array.
- *    The returned sg table is released by sg_free_table.
+ * Description:
+ *    If @prv is NULL, allocate and initialize an sg table from a list of pages,
+ *    else reuse the scatterlist passed in at @prv.
+ *    Contiguous ranges of the pages are squashed into a single scatterlist
+ *    entry up to the maximum size specified in @max_segment.  A user may
+ *    provide an offset at a start and a size of valid data in a buffer
+ *    specified by the page array.
  *
  * Returns:
- *   0 on success, negative error on failure
+ *   Last SGE in sgt on success, PTR_ERR on otherwise.
+ *   The allocation in @sgt must be released by sg_free_table.
+ *
+ * Notes:
+ *   If this function returns non-0 (eg failure), the caller must call
+ *   sg_free_table() to cleanup any leftover allocations.
  */
-int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-				unsigned int n_pages, unsigned int offset,
-				unsigned long size, unsigned int max_segment,
-				gfp_t gfp_mask)
+struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+		struct page **pages, unsigned int n_pages, unsigned int offset,
+		unsigned long size, unsigned int max_segment,
+		struct scatterlist *prv, unsigned int left_pages,
+		gfp_t gfp_mask)
 {
-	unsigned int chunks, cur_page, seg_len, i;
-	int ret;
-	struct scatterlist *s;
+	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
+	unsigned int added_nents = 0;
+	struct scatterlist *s = prv;

 	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (prv) {
+		unsigned long paddr = (page_to_pfn(sg_page(prv)) * PAGE_SIZE +
+				       prv->offset + prv->length) /
+				      PAGE_SIZE;
+
+		if (WARN_ON(offset))
+			return ERR_PTR(-EINVAL);
+
+		/* Merge contiguous pages into the last SG */
+		prv_len = prv->length;
+		while (n_pages && page_to_pfn(pages[0]) == paddr) {
+			if (prv->length + PAGE_SIZE > max_segment)
+				break;
+			prv->length += PAGE_SIZE;
+			paddr++;
+			pages++;
+			n_pages--;
+		}
+		if (!n_pages)
+			goto out;
+	}

 	/* compute number of contiguous chunks */
 	chunks = 1;
@@ -410,13 +475,9 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 		}
 	}

-	ret = sg_alloc_table(sgt, chunks, gfp_mask);
-	if (unlikely(ret))
-		return ret;
-
 	/* merging chunks and putting them into the scatterlist */
 	cur_page = 0;
-	for_each_sg(sgt->sgl, s, sgt->orig_nents, i) {
+	for (i = 0; i < chunks; i++) {
 		unsigned int j, chunk_size;

 		/* look for the end of the current chunk */
@@ -429,15 +490,30 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 				break;
 		}

+		/* Pass how many chunks might be left */
+		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
+		if (IS_ERR(s)) {
+			/*
+			 * Adjust entry length to be as before function was
+			 * called.
+			 */
+			if (prv)
+				prv->length = prv_len;
+			return s;
+		}
 		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
 		sg_set_page(s, pages[cur_page],
 			    min_t(unsigned long, size, chunk_size), offset);
+		added_nents++;
 		size -= chunk_size;
 		offset = 0;
 		cur_page = j;
 	}
-
-	return 0;
+	sgt->nents += added_nents;
+out:
+	if (!left_pages)
+		sg_mark_end(s);
+	return s;
 }
 EXPORT_SYMBOL(__sg_alloc_table_from_pages);

@@ -465,8 +541,9 @@ int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			      unsigned int n_pages, unsigned int offset,
 			      unsigned long size, gfp_t gfp_mask)
 {
-	return __sg_alloc_table_from_pages(sgt, pages, n_pages, offset, size,
-					   SCATTERLIST_MAX_SEGMENT, gfp_mask);
+	return PTR_ERR_OR_ZERO(__sg_alloc_table_from_pages(sgt, pages, n_pages,
+			offset, size, SCATTERLIST_MAX_SEGMENT,
+			NULL, 0, gfp_mask));
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages);

diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index 0a1464181226..4899359a31ac 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -55,14 +55,13 @@ int main(void)
 	for (i = 0, test = tests; test->expected_segments; test++, i++) {
 		struct page *pages[MAX_PAGES];
 		struct sg_table st;
-		int ret;
+		struct scatterlist *sg;

 		set_pages(pages, test->pfn, test->num_pages);

-		ret = __sg_alloc_table_from_pages(&st, pages, test->num_pages,
-						  0, test->size, test->max_seg,
-						  GFP_KERNEL);
-		assert(ret == test->alloc_ret);
+		sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
+				test->size, test->max_seg, NULL, 0, GFP_KERNEL);
+		assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);

 		if (test->alloc_ret)
 			continue;
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
