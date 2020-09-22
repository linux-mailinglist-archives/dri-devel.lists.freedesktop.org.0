Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF0A273D81
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 10:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172146E843;
	Tue, 22 Sep 2020 08:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895C86E22A;
 Tue, 22 Sep 2020 08:40:14 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F1D123A7A;
 Tue, 22 Sep 2020 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600764014;
 bh=h9rFTp2cY1cCW7PPaasSWRxT8TazEpwM3hRasp7X/k4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tu99uOeB/lioA+H+0JqwuIkhF3i1afaGTCFBMQ9UVF2/UjwVm2joSf4RAqkUFnU4F
 IXekd/mIIkS/PaZ5tYGb0Xv1VCmQQ2Gus8mmUKg6eIE1TpCYvEidcz3c5cmmHIa9qb
 JxpCiH3mWCKt3eHQ8NhtS6ObpFA04tzXmTiakdL0=
From: Leon Romanovsky <leon@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH rdma-next v3 1/2] lib/scatterlist: Add support in dynamic
 allocation of SG table from pages
Date: Tue, 22 Sep 2020 11:39:57 +0300
Message-Id: <20200922083958.2150803-2-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200922083958.2150803-1-leon@kernel.org>
References: <20200922083958.2150803-1-leon@kernel.org>
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Maor Gottlieb <maorg@mellanox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maor Gottlieb <maorg@mellanox.com>

Extend __sg_alloc_table_from_pages to support dynamic allocation of
SG table from pages. It should be used by drivers that can't supply
all the pages at one time.

This function returns the last populated SGE in the table. Users should
pass it as an argument to the function from the second call and forward.
As before, nents will be equal to the number of populated SGEs (chunks).

With this new extension, drivers can benefit the optimization of merging
contiguous pages without a need to allocate all pages in advance and
hold them in a large buffer.

E.g. with the Infiniband driver that allocates a single page for hold
the
pages. For 1TB memory registration, the temporary buffer would consume
only
4KB, instead of 2GB.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  15 +-
 include/linux/scatterlist.h                 |  43 +++---
 lib/scatterlist.c                           | 158 +++++++++++++++-----
 lib/sg_pool.c                               |   3 +-
 tools/testing/scatterlist/main.c            |   9 +-
 6 files changed, 163 insertions(+), 77 deletions(-)

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
index 45cf7b69d852..c24cc667b56b 100644
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
@@ -283,13 +288,15 @@ typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
 void __sg_free_table(struct sg_table *, unsigned int, unsigned int,
 		     sg_free_fn *);
 void sg_free_table(struct sg_table *);
-int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
-		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
+int __sg_alloc_table(struct sg_table *, struct scatterlist *, unsigned int,
+		unsigned int, struct scatterlist *, unsigned int,
+		gfp_t, sg_alloc_fn *);
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
index 5d63a8857f36..91587560497d 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -245,6 +245,7 @@ EXPORT_SYMBOL(sg_free_table);
 /**
  * __sg_alloc_table - Allocate and initialize an sg table with given allocator
  * @table:	The sg table header to use
+ * @prv:	Last populated sge in sgt
  * @nents:	Number of entries in sg list
  * @max_ents:	The maximum number of entries the allocator returns per call
  * @nents_first_chunk: Number of entries int the (preallocated) first
@@ -263,17 +264,15 @@ EXPORT_SYMBOL(sg_free_table);
  *   __sg_free_table() to cleanup any leftover allocations.
  *
  **/
-int __sg_alloc_table(struct sg_table *table, unsigned int nents,
-		     unsigned int max_ents, struct scatterlist *first_chunk,
-		     unsigned int nents_first_chunk, gfp_t gfp_mask,
-		     sg_alloc_fn *alloc_fn)
+int __sg_alloc_table(struct sg_table *table, struct scatterlist *prv,
+		unsigned int nents, unsigned int max_ents,
+		struct scatterlist *first_chunk,
+		unsigned int nents_first_chunk, gfp_t gfp_mask,
+		sg_alloc_fn *alloc_fn)
 {
-	struct scatterlist *sg, *prv;
-	unsigned int left;
-	unsigned curr_max_ents = nents_first_chunk ?: max_ents;
-	unsigned prv_max_ents;
-
-	memset(table, 0, sizeof(*table));
+	unsigned int curr_max_ents = nents_first_chunk ?: max_ents;
+	unsigned int left, prv_max_ents = 0;
+	struct scatterlist *sg;

 	if (nents == 0)
 		return -EINVAL;
@@ -283,7 +282,6 @@ int __sg_alloc_table(struct sg_table *table, unsigned int nents,
 #endif

 	left = nents;
-	prv = NULL;
 	do {
 		unsigned int sg_size, alloc_size = left;

@@ -308,7 +306,7 @@ int __sg_alloc_table(struct sg_table *table, unsigned int nents,
 			 * linkage.  Without this, sg_kfree() may get
 			 * confused.
 			 */
-			if (prv)
+			if (prv_max_ents)
 				table->nents = ++table->orig_nents;

 			return -ENOMEM;
@@ -321,10 +319,18 @@ int __sg_alloc_table(struct sg_table *table, unsigned int nents,
 		 * If this is the first mapping, assign the sg table header.
 		 * If this is not the first mapping, chain previous part.
 		 */
-		if (prv)
-			sg_chain(prv, prv_max_ents, sg);
-		else
+		if (!prv)
 			table->sgl = sg;
+		else if (prv_max_ents)
+			sg_chain(prv, prv_max_ents, sg);
+		else {
+			__sg_chain(prv, sg);
+			/*
+			 * We decrease one since the prvious last sge in used to
+			 * chain the chunks together.
+			 */
+			table->nents = table->orig_nents -= 1;
+		}

 		/*
 		 * If no more entries after this one, mark the end
@@ -356,7 +362,8 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
 {
 	int ret;

-	ret = __sg_alloc_table(table, nents, SG_MAX_SINGLE_ALLOC,
+	memset(table, 0, sizeof(*table));
+	ret = __sg_alloc_table(table, NULL, nents, SG_MAX_SINGLE_ALLOC,
 			       NULL, 0, gfp_mask, sg_kmalloc);
 	if (unlikely(ret))
 		__sg_free_table(table, SG_MAX_SINGLE_ALLOC, 0, sg_kfree);
@@ -365,6 +372,30 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(sg_alloc_table);

+static struct scatterlist *get_next_sg(struct sg_table *table,
+		struct scatterlist *prv, unsigned long left_npages,
+		gfp_t gfp_mask)
+{
+	struct scatterlist *next_sg;
+	int ret;
+
+	/* If table was just allocated */
+	if (!prv)
+		return table->sgl;
+
+	/* Check if last entry should be keeped for chainning */
+	next_sg = sg_next(prv);
+	if (!sg_is_last(next_sg) || left_npages == 1)
+		return next_sg;
+
+	ret = __sg_alloc_table(table, next_sg,
+			min_t(unsigned long, left_npages, SG_MAX_SINGLE_ALLOC),
+			SG_MAX_SINGLE_ALLOC, NULL, 0, gfp_mask, sg_kmalloc);
+	if (ret)
+		return ERR_PTR(ret);
+	return sg_next(prv);
+}
+
 /**
  * __sg_alloc_table_from_pages - Allocate and initialize an sg table from
  *			         an array of pages
@@ -374,29 +405,47 @@ EXPORT_SYMBOL(sg_alloc_table);
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
+	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
+	unsigned int tmp_nents = sgt->nents;
+	struct scatterlist *s = prv;
+	unsigned int table_size;
 	int ret;
-	struct scatterlist *s;

 	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (prv &&
+	    page_to_pfn(sg_page(prv)) + (prv->length >> PAGE_SHIFT) ==
+	    page_to_pfn(pages[0]))
+		prv_len = prv->length;

 	/* compute number of contiguous chunks */
 	chunks = 1;
@@ -410,13 +459,17 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 		}
 	}

-	ret = sg_alloc_table(sgt, chunks, gfp_mask);
-	if (unlikely(ret))
-		return ret;
+	if (!prv) {
+		/* Only the last allocation could be less than the maximum */
+		table_size = left_pages ? SG_MAX_SINGLE_ALLOC : chunks;
+		ret = sg_alloc_table(sgt, table_size, gfp_mask);
+		if (unlikely(ret))
+			return ERR_PTR(ret);
+	}

 	/* merging chunks and putting them into the scatterlist */
 	cur_page = 0;
-	for_each_sg(sgt->sgl, s, sgt->orig_nents, i) {
+	for (i = 0; i < chunks; i++) {
 		unsigned int j, chunk_size;

 		/* look for the end of the current chunk */
@@ -425,19 +478,41 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			seg_len += PAGE_SIZE;
 			if (seg_len >= max_segment ||
 			    page_to_pfn(pages[j]) !=
-			    page_to_pfn(pages[j - 1]) + 1)
+				    page_to_pfn(pages[j - 1]) + 1)
 				break;
 		}

 		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
-		sg_set_page(s, pages[cur_page],
-			    min_t(unsigned long, size, chunk_size), offset);
+		chunk_size = min_t(unsigned long, size, chunk_size);
+		if (!i && prv_len) {
+			if (max_segment - prv->length >= chunk_size) {
+				sg_set_page(s, sg_page(s),
+					    s->length + chunk_size, s->offset);
+				goto next;
+			}
+		}
+
+		/* Pass how many chunks might left */
+		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
+		if (IS_ERR(s)) {
+			/*
+			 * Adjust entry length to be as before function was
+			 * called.
+			 */
+			if (prv_len)
+				prv->length = prv_len;
+			goto out;
+		}
+		sg_set_page(s, pages[cur_page], chunk_size, offset);
+		tmp_nents++;
+next:
 		size -= chunk_size;
 		offset = 0;
 		cur_page = j;
 	}
-
-	return 0;
+	sgt->nents = tmp_nents;
+out:
+	return s;
 }
 EXPORT_SYMBOL(__sg_alloc_table_from_pages);

@@ -465,8 +540,9 @@ int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			      unsigned int n_pages, unsigned int offset,
 			      unsigned long size, gfp_t gfp_mask)
 {
-	return __sg_alloc_table_from_pages(sgt, pages, n_pages, offset, size,
-					   SCATTERLIST_MAX_SEGMENT, gfp_mask);
+	return PTR_ERR_OR_ZERO(__sg_alloc_table_from_pages(sgt, pages, n_pages,
+			offset, size, SCATTERLIST_MAX_SEGMENT, NULL, 0,
+			gfp_mask));
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages);

diff --git a/lib/sg_pool.c b/lib/sg_pool.c
index db29e5c1f790..c449248bf5d5 100644
--- a/lib/sg_pool.c
+++ b/lib/sg_pool.c
@@ -129,7 +129,8 @@ int sg_alloc_table_chained(struct sg_table *table, int nents,
 		nents_first_chunk = 0;
 	}

-	ret = __sg_alloc_table(table, nents, SG_CHUNK_SIZE,
+	memset(table, 0, sizeof(*table));
+	ret = __sg_alloc_table(table, NULL, nents, SG_CHUNK_SIZE,
 			       first_chunk, nents_first_chunk,
 			       GFP_ATOMIC, sg_pool_alloc);
 	if (unlikely(ret))
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
