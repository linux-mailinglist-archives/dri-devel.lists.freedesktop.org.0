Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91E83CC8B2
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 13:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177F16E03B;
	Sun, 18 Jul 2021 11:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE346E03B;
 Sun, 18 Jul 2021 11:09:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 385AE61108;
 Sun, 18 Jul 2021 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626606564;
 bh=9I9suquaeUoy7KIKMGoROMwdPP0OyiicuKCa0o4yGMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1mzsgZy5c1Eg0AJacl+hISBGmuLwlGqyOZf2HsHdsHIgRokBv8E6ZZL/6IhYfHxR
 g1UTiQF4ToPUmRXSut65zXJ9ywAsH6WnX7281Rki3Ar1MpVaxcbzKM0BwZRQLQEYCb
 G3iLNdpPi10y0LMDMz1xE59fh6bEadc8SlpXloiftEIIVOlwPMIV8JsNSYOtQ6Jcnd
 VB7Xxijzh4YsyX6n1KpUOiWwQsFwdd0+3M60a2S9s2CLmWJhCkeZesrI8zYOvcQUnW
 he9kdkpitK3JSgV/VLJO4YimNLE0l6t+LdOAweP30QwMdrYXA0J5xLrg7WgjWFCycz
 kXgcev36t1VyQ==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH rdma-next v2 1/2] lib/scatterlist: Fix wrong update of
 orig_nents
Date: Sun, 18 Jul 2021 14:09:12 +0300
Message-Id: <36d655a0ff45f4c86762358c7b6a7b58939313fb.1626605893.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626605893.git.leonro@nvidia.com>
References: <cover.1626605893.git.leonro@nvidia.com>
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
Cc: Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Yishai Hadas <yishaih@nvidia.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Maor Gottlieb <maorg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maor Gottlieb <maorg@nvidia.com>

orig_nents should represent the number of entries with pages,
but __sg_alloc_table_from_pages sets orig_nents as the number of
total entries in the table. This is wrong when the API is used for
dynamic allocation where not all the table entries are mapped with
pages. It wasn't observed until now, since RDMA umem who uses this
API in the dynamic form doesn't use orig_nents implicit or explicit
by the scatterlist APIs.

Fix it by:
1. Set orig_nents as number of entries with pages also in
   __sg_alloc_table_from_pages.
2. To fix the release flow, add a new output argument to
   __sg_alloc_table_from_pages which will be set to the
   number of total entries in the table. User like umem that use
   this function for dynamic allocation, should free the table by
   calling to sg_free_table_entries and pass the number of entries.

Fixes: 07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation of SG table from pages")
Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/gpu/drm/drm_prime.c                 |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 +-
 drivers/infiniband/core/umem.c              |  5 +-
 include/linux/scatterlist.h                 |  3 +-
 include/rdma/ib_umem.h                      |  3 +-
 lib/scatterlist.c                           | 88 ++++++++++++++-------
 tools/testing/scatterlist/main.c            | 15 +++-
 8 files changed, 80 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..1739d10a2c55 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -821,7 +821,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 	sge = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
 					  nr_pages << PAGE_SHIFT,
 					  max_segment,
-					  NULL, 0, GFP_KERNEL);
+					  NULL, 0, GFP_KERNEL, NULL);
 	if (IS_ERR(sge)) {
 		kfree(sg);
 		sg = ERR_CAST(sge);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 7487bab11f0b..c341d3e3386c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -155,7 +155,7 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 alloc_table:
 	sg = __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
 					 num_pages << PAGE_SHIFT, max_segment,
-					 NULL, 0, GFP_KERNEL);
+					 NULL, 0, GFP_KERNEL, NULL);
 	if (IS_ERR(sg)) {
 		ret = PTR_ERR(sg);
 		goto err;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 0488042fb287..2ad889272b0a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -390,7 +390,7 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 				vsgt->num_pages, 0,
 				(unsigned long) vsgt->num_pages << PAGE_SHIFT,
 				dma_get_max_seg_size(dev_priv->drm.dev),
-				NULL, 0, GFP_KERNEL);
+				NULL, 0, GFP_KERNEL, NULL);
 		if (IS_ERR(sg)) {
 			ret = PTR_ERR(sg);
 			goto out_sg_alloc_fail;
diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 0eb40025075f..cf4197363346 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -59,7 +59,7 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 		unpin_user_page_range_dirty_lock(sg_page(sg),
 			DIV_ROUND_UP(sg->length, PAGE_SIZE), make_dirty);
 
-	sg_free_table(&umem->sg_head);
+	sg_free_table_entries(&umem->sg_head, umem->total_nents);
 }
 
 /**
@@ -229,8 +229,7 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 		sg = __sg_alloc_table_from_pages(&umem->sg_head, page_list, ret,
 				0, ret << PAGE_SHIFT,
 				ib_dma_max_seg_size(device), sg, npages,
-				GFP_KERNEL);
-		umem->sg_nents = umem->sg_head.nents;
+				GFP_KERNEL, &umem->total_nents);
 		if (IS_ERR(sg)) {
 			unpin_user_pages_dirty_lock(page_list, ret, 0);
 			ret = PTR_ERR(sg);
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index ecf87484814f..c796c165d5ee 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -282,6 +282,7 @@ typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
 void __sg_free_table(struct sg_table *, unsigned int, unsigned int,
 		     sg_free_fn *);
 void sg_free_table(struct sg_table *);
+void sg_free_table_entries(struct sg_table *sgt, unsigned int num_entries);
 int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
 		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
 int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
@@ -289,7 +290,7 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
 		struct scatterlist *prv, unsigned int left_pages,
-		gfp_t gfp_mask);
+		gfp_t gfp_mask, unsigned int *total_nents);
 int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			      unsigned int n_pages, unsigned int offset,
 			      unsigned long size, gfp_t gfp_mask);
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 676c57f5ca80..5a65212efc2e 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -27,8 +27,7 @@ struct ib_umem {
 	u32 is_dmabuf : 1;
 	struct work_struct	work;
 	struct sg_table sg_head;
-	int             nmap;
-	unsigned int    sg_nents;
+	unsigned int total_nents;
 };
 
 struct ib_umem_dmabuf {
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 27efa6178153..5cc41ae962ec 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -175,22 +175,11 @@ static void sg_kfree(struct scatterlist *sg, unsigned int nents)
 		kfree(sg);
 }
 
-/**
- * __sg_free_table - Free a previously mapped sg table
- * @table:	The sg table header to use
- * @max_ents:	The maximum number of entries per single scatterlist
- * @nents_first_chunk: Number of entries int the (preallocated) first
- * 	scatterlist chunk, 0 means no such preallocated first chunk
- * @free_fn:	Free function
- *
- *  Description:
- *    Free an sg table previously allocated and setup with
- *    __sg_alloc_table().  The @max_ents value must be identical to
- *    that previously used with __sg_alloc_table().
- *
- **/
-void __sg_free_table(struct sg_table *table, unsigned int max_ents,
-		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
+static void __sg_free_table_entries(struct sg_table *table,
+				    unsigned int max_ents,
+				    unsigned int nents_first_chunk,
+				    sg_free_fn *free_fn,
+				    unsigned int num_entries)
 {
 	struct scatterlist *sgl, *next;
 	unsigned curr_max_ents = nents_first_chunk ?: max_ents;
@@ -199,8 +188,8 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 		return;
 
 	sgl = table->sgl;
-	while (table->orig_nents) {
-		unsigned int alloc_size = table->orig_nents;
+	while (num_entries) {
+		unsigned int alloc_size = num_entries;
 		unsigned int sg_size;
 
 		/*
@@ -218,7 +207,7 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 			next = NULL;
 		}
 
-		table->orig_nents -= sg_size;
+		num_entries -= sg_size;
 		if (nents_first_chunk)
 			nents_first_chunk = 0;
 		else
@@ -229,6 +218,43 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 
 	table->sgl = NULL;
 }
+
+/**
+ * sg_free_table_entries - Free a previously allocated sg table according to
+ *                         the total number of entries in the table.
+ * @table:	 The mapped sg table header
+ * @num_entries: The number of entries in the table.
+ *
+ **/
+void sg_free_table_entries(struct sg_table *table, unsigned int num_entries)
+{
+	__sg_free_table_entries(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree,
+				num_entries);
+}
+EXPORT_SYMBOL(sg_free_table_entries);
+
+/**
+ * __sg_free_table - Free a previously mapped sg table
+ * @table:	The sg table header to use
+ * @max_ents:	The maximum number of entries per single scatterlist
+ * @total_ents:	The total number of entries in the table
+ * @nents_first_chunk: Number of entries int the (preallocated) first
+ *                     scatterlist chunk, 0 means no such preallocated
+ *                     first chunk
+ * @free_fn:	Free function
+ *
+ *  Description:
+ *    Free an sg table previously allocated and setup with
+ *    __sg_alloc_table().  The @max_ents value must be identical to
+ *    that previously used with __sg_alloc_table().
+ *
+ **/
+void __sg_free_table(struct sg_table *table, unsigned int max_ents,
+		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
+{
+	__sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
+				table->orig_nents);
+}
 EXPORT_SYMBOL(__sg_free_table);
 
 /**
@@ -238,7 +264,8 @@ EXPORT_SYMBOL(__sg_free_table);
  **/
 void sg_free_table(struct sg_table *table)
 {
-	__sg_free_table(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree);
+	__sg_free_table_entries(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree,
+				table->orig_nents);
 }
 EXPORT_SYMBOL(sg_free_table);
 
@@ -368,7 +395,8 @@ EXPORT_SYMBOL(sg_alloc_table);
 static struct scatterlist *get_next_sg(struct sg_table *table,
 				       struct scatterlist *cur,
 				       unsigned long needed_sges,
-				       gfp_t gfp_mask)
+				       gfp_t gfp_mask,
+				       unsigned int *total_nents)
 {
 	struct scatterlist *new_sg, *next_sg;
 	unsigned int alloc_size;
@@ -386,12 +414,14 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
 		return ERR_PTR(-ENOMEM);
 	sg_init_table(new_sg, alloc_size);
 	if (cur) {
+		if (total_nents)
+			*total_nents += alloc_size - 1;
 		__sg_chain(next_sg, new_sg);
-		table->orig_nents += alloc_size - 1;
 	} else {
 		table->sgl = new_sg;
-		table->orig_nents = alloc_size;
 		table->nents = 0;
+		if (total_nents)
+			*total_nents = alloc_size;
 	}
 	return new_sg;
 }
@@ -408,6 +438,7 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
  * @prv:	 Last populated sge in sgt
  * @left_pages:  Left pages caller have to set after this call
  * @gfp_mask:	 GFP allocation mask
+ * @total_nents: Output of total number of entries in the table
  *
  * Description:
  *    If @prv is NULL, allocate and initialize an sg table from a list of pages,
@@ -419,7 +450,8 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
  *
  * Returns:
  *   Last SGE in sgt on success, PTR_ERR on otherwise.
- *   The allocation in @sgt must be released by sg_free_table.
+ *   The allocation in @sgt must be released by sg_free_table or
+ *   sg_free_table_entries.
  *
  * Notes:
  *   If this function returns non-0 (eg failure), the caller must call
@@ -429,7 +461,7 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
 		struct scatterlist *prv, unsigned int left_pages,
-		gfp_t gfp_mask)
+		gfp_t gfp_mask, unsigned int *total_nents)
 {
 	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
 	unsigned int added_nents = 0;
@@ -496,7 +528,8 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 		}
 
 		/* Pass how many chunks might be left */
-		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
+		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask,
+				total_nents);
 		if (IS_ERR(s)) {
 			/*
 			 * Adjust entry length to be as before function was
@@ -515,6 +548,7 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 		cur_page = j;
 	}
 	sgt->nents += added_nents;
+	sgt->orig_nents = sgt->nents;
 out:
 	if (!left_pages)
 		sg_mark_end(s);
@@ -547,7 +581,7 @@ int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			      unsigned long size, gfp_t gfp_mask)
 {
 	return PTR_ERR_OR_ZERO(__sg_alloc_table_from_pages(sgt, pages, n_pages,
-			offset, size, UINT_MAX, NULL, 0, gfp_mask));
+			offset, size, UINT_MAX, NULL, 0, gfp_mask, NULL));
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages);
 
diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index 652254754b4c..00576c86971e 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -88,11 +88,14 @@ int main(void)
 		struct page *pages[MAX_PAGES];
 		struct sg_table st;
 		struct scatterlist *sg;
+		unsigned int total_nents;
 
 		set_pages(pages, test->pfn, test->num_pages);
 
 		sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
-				test->size, test->max_seg, NULL, left_pages, GFP_KERNEL);
+						 test->size, test->max_seg,
+						 NULL, left_pages, GFP_KERNEL,
+						 &total_nents);
 		assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
 
 		if (test->alloc_ret)
@@ -100,8 +103,9 @@ int main(void)
 
 		if (test->pfn_app) {
 			set_pages(pages, test->pfn_app, test->num_pages);
-			sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
-					test->size, test->max_seg, sg, 0, GFP_KERNEL);
+			sg = __sg_alloc_table_from_pages(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, sg, 0, GFP_KERNEL, &total_nents);
 
 			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
 		}
@@ -110,7 +114,10 @@ int main(void)
 		if (!test->pfn_app)
 			VALIDATE(st.orig_nents == test->expected_segments, &st, test);
 
-		sg_free_table(&st);
+		if (test->pfn_app)
+			sg_free_table_entries(&st, total_nents);
+		else
+			sg_free_table(&st);
 	}
 
 	assert(i == (sizeof(tests) / sizeof(tests[0])) - 1);
-- 
2.31.1

