Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA123DA063
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCDE6ED08;
	Thu, 29 Jul 2021 09:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6A26ED02;
 Thu, 29 Jul 2021 09:39:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C6A461058;
 Thu, 29 Jul 2021 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627551563;
 bh=oGLPTe0mfmXWuL4iGqaxlMWMNr0RA0EnCilhc6HniCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s06i2lXc0X5Yxp9xGhL8wgGFApOAc+78EShKtRdEwixFag3wvL7yhBsbodJbohnVR
 Qmm3wS/yau2yjRGiuqVecGMc+dXX0rxmRtYC7Ohaw8Sq3Uw5fnw88PndyHIjlvXVRk
 NiBXwMcwyPIdOp9KFnW2juJNttYhlSky0D1voWkv9sOT28vTAHA+MUSlbXygXZK1C8
 cuWy0uZAnL8L5btosfHHhMcBl6aCVVDe/osMfSr1BwktICRcYfoVuzW5O0L3OabCCq
 XhsRwVKRoOX7p98YJ6Oh1syj/Ubouk/+TgsUcvnmKfsUufcw2zSejr4hwzTvCyNsnq
 WSyics37o3OkA==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH rdma-next v3 1/3] lib/scatterlist: Provide a dedicated
 function to support table append
Date: Thu, 29 Jul 2021 12:39:11 +0300
Message-Id: <b0f6e50a8cdfc484f2dc18d3215e86465e2e1f1c.1627551226.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627551226.git.leonro@nvidia.com>
References: <cover.1627551226.git.leonro@nvidia.com>
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
Cc: Mustafa Ismail <mustafa.ismail@intel.com>, David Airlie <airlied@linux.ie>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ariel Elior <aelior@marvell.com>, Michal Kalderon <mkalderon@marvell.com>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Wenpeng Liang <liangwenpeng@huawei.com>,
 linux-kernel@vger.kernel.org, Weihang Li <liweihang@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maor Gottlieb <maorg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maor Gottlieb <maorg@nvidia.com>

RDMA is the only in-kernel user that uses __sg_alloc_table_from_pages to
append pages dynamically. In the next patch. That mode will be extended
and that function will get more parameters. So separate it into a unique
function to make such change more clear.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/gpu/drm/drm_prime.c                 | 13 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 11 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  | 14 +++-----
 drivers/infiniband/core/umem.c              |  4 +--
 include/linux/scatterlist.h                 | 39 ++++++++++++++++++---
 lib/scatterlist.c                           | 36 ++++++++++---------
 tools/testing/scatterlist/main.c            | 25 +++++++++----
 7 files changed, 90 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..cf3278041f9c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -807,8 +807,8 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 				       struct page **pages, unsigned int nr_pages)
 {
 	struct sg_table *sg;
-	struct scatterlist *sge;
 	size_t max_segment = 0;
+	int err;
 
 	sg = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
 	if (!sg)
@@ -818,13 +818,12 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		max_segment = dma_max_mapping_size(dev->dev);
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
-	sge = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
-					  nr_pages << PAGE_SHIFT,
-					  max_segment,
-					  NULL, 0, GFP_KERNEL);
-	if (IS_ERR(sge)) {
+	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
+						nr_pages << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
+	if (err) {
 		kfree(sg);
-		sg = ERR_CAST(sge);
+		sg = ERR_PTR(err);
 	}
 	return sg;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 7487bab11f0b..458f797a9e1e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -133,7 +133,6 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	unsigned int max_segment = i915_sg_segment_size();
 	struct sg_table *st;
 	unsigned int sg_page_sizes;
-	struct scatterlist *sg;
 	struct page **pvec;
 	int ret;
 
@@ -153,13 +152,11 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	spin_unlock(&i915->mm.notifier_lock);
 
 alloc_table:
-	sg = __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
-					 num_pages << PAGE_SHIFT, max_segment,
-					 NULL, 0, GFP_KERNEL);
-	if (IS_ERR(sg)) {
-		ret = PTR_ERR(sg);
+	ret = sg_alloc_table_from_pages_segment(st, pvec, num_pages, 0,
+						num_pages << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
+	if (ret)
 		goto err;
-	}
 
 	ret = i915_gem_gtt_prepare_pages(obj, st);
 	if (ret) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 0488042fb287..fc372d2e52a1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -363,7 +363,6 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 	int ret = 0;
 	static size_t sgl_size;
 	static size_t sgt_size;
-	struct scatterlist *sg;
 
 	if (vmw_tt->mapped)
 		return 0;
@@ -386,15 +385,12 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			return ret;
 
-		sg = __sg_alloc_table_from_pages(&vmw_tt->sgt, vsgt->pages,
-				vsgt->num_pages, 0,
-				(unsigned long) vsgt->num_pages << PAGE_SHIFT,
-				dma_get_max_seg_size(dev_priv->drm.dev),
-				NULL, 0, GFP_KERNEL);
-		if (IS_ERR(sg)) {
-			ret = PTR_ERR(sg);
+		ret = sg_alloc_table_from_pages_segment(
+			&vmw_tt->sgt, vsgt->pages, vsgt->num_pages, 0,
+			(unsigned long)vsgt->num_pages << PAGE_SHIFT,
+			dma_get_max_seg_size(dev_priv->drm.dev), GFP_KERNEL);
+		if (ret)
 			goto out_sg_alloc_fail;
-		}
 
 		if (vsgt->num_pages > vmw_tt->sgt.orig_nents) {
 			uint64_t over_alloc =
diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 0eb40025075f..b741758e528f 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -226,8 +226,8 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 
 		cur_base += ret * PAGE_SIZE;
 		npages -= ret;
-		sg = __sg_alloc_table_from_pages(&umem->sg_head, page_list, ret,
-				0, ret << PAGE_SHIFT,
+		sg = sg_alloc_append_table_from_pages(&umem->sg_head, page_list,
+				ret, 0, ret << PAGE_SHIFT,
 				ib_dma_max_seg_size(device), sg, npages,
 				GFP_KERNEL);
 		umem->sg_nents = umem->sg_head.nents;
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index ecf87484814f..5c700f2a0d18 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -285,14 +285,45 @@ void sg_free_table(struct sg_table *);
 int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
 		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
 int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
-struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
 		struct scatterlist *prv, unsigned int left_pages,
 		gfp_t gfp_mask);
-int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-			      unsigned int n_pages, unsigned int offset,
-			      unsigned long size, gfp_t gfp_mask);
+int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
+				      unsigned int n_pages, unsigned int offset,
+				      unsigned long size,
+				      unsigned int max_segment, gfp_t gfp_mask);
+
+/**
+ * sg_alloc_table_from_pages - Allocate and initialize an sg table from
+ *			       an array of pages
+ * @sgt:	 The sg table header to use
+ * @pages:	 Pointer to an array of page pointers
+ * @n_pages:	 Number of pages in the pages array
+ * @offset:      Offset from start of the first page to the start of a buffer
+ * @size:        Number of valid bytes in the buffer (after offset)
+ * @gfp_mask:	 GFP allocation mask
+ *
+ *  Description:
+ *    Allocate and initialize an sg table from a list of pages. Contiguous
+ *    ranges of the pages are squashed into a single scatterlist node. A user
+ *    may provide an offset at a start and a size of valid data in a buffer
+ *    specified by the page array. The returned sg table is released by
+ *    sg_free_table.
+ *
+ * Returns:
+ *   0 on success, negative error on failure
+ */
+static inline int sg_alloc_table_from_pages(struct sg_table *sgt,
+					    struct page **pages,
+					    unsigned int n_pages,
+					    unsigned int offset,
+					    unsigned long size, gfp_t gfp_mask)
+{
+	return sg_alloc_table_from_pages_segment(sgt, pages, n_pages, offset,
+						 size, UINT_MAX, gfp_mask);
+}
 
 #ifdef CONFIG_SGL_ALLOC
 struct scatterlist *sgl_alloc_order(unsigned long long length,
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 27efa6178153..611c63d4a958 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -397,7 +397,7 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
 }
 
 /**
- * __sg_alloc_table_from_pages - Allocate and initialize an sg table from
+ * sg_alloc_append_table_from_pages - Allocate and initialize an sg table from
  *			         an array of pages
  * @sgt:	 The sg table header to use
  * @pages:	 Pointer to an array of page pointers
@@ -425,7 +425,7 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
  *   If this function returns non-0 (eg failure), the caller must call
  *   sg_free_table() to cleanup any leftover allocations.
  */
-struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
 		struct scatterlist *prv, unsigned int left_pages,
@@ -520,36 +520,40 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 		sg_mark_end(s);
 	return s;
 }
-EXPORT_SYMBOL(__sg_alloc_table_from_pages);
+EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
 
 /**
- * sg_alloc_table_from_pages - Allocate and initialize an sg table from
- *			       an array of pages
+ * sg_alloc_table_from_pages_segment - Allocate and initialize an sg table from
+ *                                     an array of pages and given maximum
+ *                                     segment.
  * @sgt:	 The sg table header to use
  * @pages:	 Pointer to an array of page pointers
  * @n_pages:	 Number of pages in the pages array
  * @offset:      Offset from start of the first page to the start of a buffer
  * @size:        Number of valid bytes in the buffer (after offset)
+ * @max_segment: Maximum size of a scatterlist element in bytes
  * @gfp_mask:	 GFP allocation mask
  *
  *  Description:
  *    Allocate and initialize an sg table from a list of pages. Contiguous
- *    ranges of the pages are squashed into a single scatterlist node. A user
- *    may provide an offset at a start and a size of valid data in a buffer
- *    specified by the page array. The returned sg table is released by
- *    sg_free_table.
+ *    ranges of the pages are squashed into a single scatterlist node up to the
+ *    maximum size specified in @max_segment. A user may provide an offset at a
+ *    start and a size of valid data in a buffer specified by the page array.
  *
- * Returns:
+ *    The returned sg table is released by sg_free_table.
+ *
+ *  Returns:
  *   0 on success, negative error on failure
  */
-int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-			      unsigned int n_pages, unsigned int offset,
-			      unsigned long size, gfp_t gfp_mask)
+int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
+				unsigned int n_pages, unsigned int offset,
+				unsigned long size, unsigned int max_segment,
+				gfp_t gfp_mask)
 {
-	return PTR_ERR_OR_ZERO(__sg_alloc_table_from_pages(sgt, pages, n_pages,
-			offset, size, UINT_MAX, NULL, 0, gfp_mask));
+	return PTR_ERR_OR_ZERO(sg_alloc_append_table_from_pages(sgt, pages,
+			n_pages, offset, size, max_segment, NULL, 0, gfp_mask));
 }
-EXPORT_SYMBOL(sg_alloc_table_from_pages);
+EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
 
 #ifdef CONFIG_SGL_ALLOC
 
diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index 652254754b4c..c2ff9179c2cc 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -87,28 +87,39 @@ int main(void)
 		int left_pages = test->pfn_app ? test->num_pages : 0;
 		struct page *pages[MAX_PAGES];
 		struct sg_table st;
-		struct scatterlist *sg;
+		struct scatterlist *sg = NULL;
+		int ret;
 
 		set_pages(pages, test->pfn, test->num_pages);
 
-		sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
-				test->size, test->max_seg, NULL, left_pages, GFP_KERNEL);
-		assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
+		if (test->pfn_app) {
+			sg = sg_alloc_append_table_from_pages(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, NULL, left_pages, GFP_KERNEL);
+			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
+		} else {
+			ret = sg_alloc_table_from_pages_segment(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, GFP_KERNEL);
+			assert(ret == test->alloc_ret);
+		}
 
 		if (test->alloc_ret)
 			continue;
 
 		if (test->pfn_app) {
 			set_pages(pages, test->pfn_app, test->num_pages);
-			sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
-					test->size, test->max_seg, sg, 0, GFP_KERNEL);
+			sg = sg_alloc_append_table_from_pages(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, sg, 0, GFP_KERNEL);
 
 			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
 		}
 
 		VALIDATE(st.nents == test->expected_segments, &st, test);
 		if (!test->pfn_app)
-			VALIDATE(st.orig_nents == test->expected_segments, &st, test);
+			VALIDATE(st.orig_nents == test->expected_segments, &st,
+				 test);
 
 		sg_free_table(&st);
 	}
-- 
2.31.1

