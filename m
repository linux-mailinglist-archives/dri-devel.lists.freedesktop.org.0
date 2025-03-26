Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4AA70ECD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 03:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A655410E2A3;
	Wed, 26 Mar 2025 02:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lJ9CyPyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B193F10E2A3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 02:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742955315; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dMCydFgVGb0hKAHeEKcKHFrQJnPIUfBTKy9Q22muUIESOqe2dOCm2baB6POTJWnorsYUel8jNGwvFZ+XJ4PjwXM2SzE0cx7X5UKz3sIIljUfRxkxJuVrmcigCu+4Am4GrlXkzZDixtpLLNvF1++9/sRJ40bztLDOo9KGM03mla0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742955315;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vsMAwuSHWK3nfxRNgzm50oxQnEhwhSDIhkkuUteoLM0=; 
 b=VxyJMSL/IWn+/Cv6TUY/LrqVkMvGgx09COt9HxWT2tel8D7E8mD+tW/6gQD6jN8ONPFS/JpXb0e04gzvcP+zi/KzQQ9NCmM+tX3la5uUevno6IYvwvIncOEAhcrRz8YU0ZlPypYQ4gib4BDRedb27cV5JfxOjafTlGAkNcxx5I8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742955315; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vsMAwuSHWK3nfxRNgzm50oxQnEhwhSDIhkkuUteoLM0=;
 b=lJ9CyPyN1CrbjDjto8jfQDnxgPIb9UowWNms0DU7whnSCShQAZmGIhRGOVRQg0LW
 rB+BOGEHBBWXUZtC3y8RbNvwgtMcHqQrJHaXWHCBtiWu17ciTIxdtkRl2iN++i/Ddcd
 JxruTfe12YUfBAo3XyVMrJpwweGIJEuuRKI/3Ng4=
Received: by mx.zohomail.com with SMTPS id 17429553144887.4970395832125405;
 Tue, 25 Mar 2025 19:15:14 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 1/6] lib/scatterlist.c: Support constructing sgt from
 page xarray
Date: Wed, 26 Mar 2025 02:14:21 +0000
Message-ID: <20250326021433.772196-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326021433.772196-1-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for a future commit that will introduce sparse allocation
of pages in DRM shmem, a scatterlist function that knows how to deal
with an xarray collection of memory pages had to be introduced.

Because the new function is identical to the existing one that deals
with a page array, the page_array abstraction is also introduced, which
hides the way pages are retrieved from a collection.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/linux/scatterlist.h |  17 ++++
 lib/scatterlist.c           | 175 +++++++++++++++++++++++++-----------
 2 files changed, 142 insertions(+), 50 deletions(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index d836e7440ee8..cffb0cffcda0 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -447,6 +447,11 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				      unsigned int n_pages, unsigned int offset,
 				      unsigned long size,
 				      unsigned int max_segment, gfp_t gfp_mask);
+int sg_alloc_table_from_xarray_segment(struct sg_table *sgt, struct xarray *pages,
+				       unsigned int idx, unsigned int n_pages,
+				       unsigned int offset, unsigned long size,
+				       unsigned int max_segment, gfp_t gfp_mask);
+
 
 /**
  * sg_alloc_table_from_pages - Allocate and initialize an sg table from
@@ -478,6 +483,18 @@ static inline int sg_alloc_table_from_pages(struct sg_table *sgt,
 						 size, UINT_MAX, gfp_mask);
 }
 
+static inline int sg_alloc_table_from_xarray(struct sg_table *sgt,
+					     struct xarray *pages,
+					     unsigned int idx,
+					     unsigned int n_pages,
+					     unsigned int offset,
+					     unsigned long size, gfp_t gfp_mask)
+{
+	return sg_alloc_table_from_xarray_segment(sgt, pages, idx, n_pages, offset,
+						  size, UINT_MAX, gfp_mask);
+}
+
+
 #ifdef CONFIG_SGL_ALLOC
 struct scatterlist *sgl_alloc_order(unsigned long long length,
 				    unsigned int order, bool chainable,
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 5bb6b8aff232..08b9ed51324e 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -423,43 +423,53 @@ static bool pages_are_mergeable(struct page *a, struct page *b)
 	return true;
 }
 
-/**
- * sg_alloc_append_table_from_pages - Allocate and initialize an append sg
- *                                    table from an array of pages
- * @sgt_append:  The sg append table to use
- * @pages:       Pointer to an array of page pointers
- * @n_pages:     Number of pages in the pages array
- * @offset:      Offset from start of the first page to the start of a buffer
- * @size:        Number of valid bytes in the buffer (after offset)
- * @max_segment: Maximum size of a scatterlist element in bytes
- * @left_pages:  Left pages caller have to set after this call
- * @gfp_mask:	 GFP allocation mask
- *
- * Description:
- *    In the first call it allocate and initialize an sg table from a list of
- *    pages, else reuse the scatterlist from sgt_append. Contiguous ranges of
- *    the pages are squashed into a single scatterlist entry up to the maximum
- *    size specified in @max_segment.  A user may provide an offset at a start
- *    and a size of valid data in a buffer specified by the page array. The
- *    returned sg table is released by sg_free_append_table
- *
- * Returns:
- *   0 on success, negative error on failure
- *
- * Notes:
- *   If this function returns non-0 (eg failure), the caller must call
- *   sg_free_append_table() to cleanup any leftover allocations.
- *
- *   In the fist call, sgt_append must by initialized.
- */
-int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
-		struct page **pages, unsigned int n_pages, unsigned int offset,
-		unsigned long size, unsigned int max_segment,
-		unsigned int left_pages, gfp_t gfp_mask)
+struct page_array {
+	union {
+		struct page **array;
+		struct xarray *xarray;
+	};
+
+	struct page * (* const get_page)(struct page_array, unsigned int);
+};
+
+static inline struct page *page_array_get_page(struct page_array a,
+					       unsigned int index)
 {
-	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
+	return a.array[index];
+}
+
+static inline struct page *page_xarray_get_page(struct page_array a,
+						unsigned int index)
+{
+	return xa_load(a.xarray, index);
+}
+
+#define PAGE_ARRAY(pages)				\
+	((struct page_array) {				\
+		.array = pages,				\
+		.get_page = page_array_get_page,	\
+	})
+
+#define PAGE_XARRAY(pages)				\
+	((struct page_array) {				\
+		.xarray = pages,			\
+		.get_page = page_xarray_get_page,	\
+	})
+
+static inline int
+sg_alloc_append_table_from_page_array(struct sg_append_table *sgt_append,
+				      struct page_array pages,
+				      unsigned int first_page,
+				      unsigned int n_pages,
+				      unsigned int offset, unsigned long size,
+				      unsigned int max_segment,
+				      unsigned int left_pages, gfp_t gfp_mask)
+{
+	unsigned int chunks, seg_len, i, prv_len = 0;
 	unsigned int added_nents = 0;
 	struct scatterlist *s = sgt_append->prv;
+	unsigned int cur_pg_index = first_page;
+	unsigned int last_pg_index = first_page + n_pages - 1;
 	struct page *last_pg;
 
 	/*
@@ -475,24 +485,26 @@ int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 
 	if (sgt_append->prv) {
 		unsigned long next_pfn;
+		struct page *page;
 
 		if (WARN_ON(offset))
 			return -EINVAL;
 
 		/* Merge contiguous pages into the last SG */
+		page = pages.get_page(pages, cur_pg_index);
 		prv_len = sgt_append->prv->length;
 		next_pfn = (sg_phys(sgt_append->prv) + prv_len) / PAGE_SIZE;
-		if (page_to_pfn(pages[0]) == next_pfn) {
+		if (page_to_pfn(page) == next_pfn) {
 			last_pg = pfn_to_page(next_pfn - 1);
-			while (n_pages && pages_are_mergeable(pages[0], last_pg)) {
+			while (cur_pg_index <= last_pg_index &&
+			       pages_are_mergeable(page, last_pg)) {
 				if (sgt_append->prv->length + PAGE_SIZE > max_segment)
 					break;
 				sgt_append->prv->length += PAGE_SIZE;
-				last_pg = pages[0];
-				pages++;
-				n_pages--;
+				last_pg = page;
+				cur_pg_index++;
 			}
-			if (!n_pages)
+			if (cur_pg_index > last_pg_index)
 				goto out;
 		}
 	}
@@ -500,26 +512,27 @@ int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 	/* compute number of contiguous chunks */
 	chunks = 1;
 	seg_len = 0;
-	for (i = 1; i < n_pages; i++) {
+	for (i = cur_pg_index + 1; i <= last_pg_index; i++) {
 		seg_len += PAGE_SIZE;
 		if (seg_len >= max_segment ||
-		    !pages_are_mergeable(pages[i], pages[i - 1])) {
+		    !pages_are_mergeable(pages.get_page(pages, i),
+					 pages.get_page(pages, i - 1))) {
 			chunks++;
 			seg_len = 0;
 		}
 	}
 
 	/* merging chunks and putting them into the scatterlist */
-	cur_page = 0;
 	for (i = 0; i < chunks; i++) {
 		unsigned int j, chunk_size;
 
 		/* look for the end of the current chunk */
 		seg_len = 0;
-		for (j = cur_page + 1; j < n_pages; j++) {
+		for (j = cur_pg_index + 1; j <= last_pg_index; j++) {
 			seg_len += PAGE_SIZE;
 			if (seg_len >= max_segment ||
-			    !pages_are_mergeable(pages[j], pages[j - 1]))
+			    !pages_are_mergeable(pages.get_page(pages, j),
+						 pages.get_page(pages, j - 1)))
 				break;
 		}
 
@@ -535,13 +548,13 @@ int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 				sgt_append->prv->length = prv_len;
 			return PTR_ERR(s);
 		}
-		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
-		sg_set_page(s, pages[cur_page],
+		chunk_size = ((j - cur_pg_index) << PAGE_SHIFT) - offset;
+		sg_set_page(s, pages.get_page(pages, cur_pg_index),
 			    min_t(unsigned long, size, chunk_size), offset);
 		added_nents++;
 		size -= chunk_size;
 		offset = 0;
-		cur_page = j;
+		cur_pg_index = j;
 	}
 	sgt_append->sgt.nents += added_nents;
 	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
@@ -551,6 +564,46 @@ int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 		sg_mark_end(s);
 	return 0;
 }
+
+/**
+ * sg_alloc_append_table_from_pages - Allocate and initialize an append sg
+ *                                    table from an array of pages
+ * @sgt_append:  The sg append table to use
+ * @pages:       Pointer to an array of page pointers
+ * @n_pages:     Number of pages in the pages array
+ * @offset:      Offset from start of the first page to the start of a buffer
+ * @size:        Number of valid bytes in the buffer (after offset)
+ * @max_segment: Maximum size of a scatterlist element in bytes
+ * @left_pages:  Left pages caller have to set after this call
+ * @gfp_mask:	 GFP allocation mask
+ *
+ * Description:
+ *    In the first call it allocate and initialize an sg table from a list of
+ *    pages, else reuse the scatterlist from sgt_append. Contiguous ranges of
+ *    the pages are squashed into a single scatterlist entry up to the maximum
+ *    size specified in @max_segment.  A user may provide an offset at a start
+ *    and a size of valid data in a buffer specified by the page array. The
+ *    returned sg table is released by sg_free_append_table
+ *
+ * Returns:
+ *   0 on success, negative error on failure
+ *
+ * Notes:
+ *   If this function returns non-0 (eg failure), the caller must call
+ *   sg_free_append_table() to cleanup any leftover allocations.
+ *
+ *   In the fist call, sgt_append must by initialized.
+ */
+int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
+		struct page **pages, unsigned int n_pages, unsigned int offset,
+		unsigned long size, unsigned int max_segment,
+		unsigned int left_pages, gfp_t gfp_mask)
+{
+	struct page_array parray = PAGE_ARRAY(pages);
+
+	return sg_alloc_append_table_from_page_array(sgt_append, parray, 0, n_pages, offset,
+						    size, max_segment, left_pages, gfp_mask);
+}
 EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
 
 /**
@@ -582,10 +635,11 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				gfp_t gfp_mask)
 {
 	struct sg_append_table append = {};
+	struct page_array parray = PAGE_ARRAY(pages);
 	int err;
 
-	err = sg_alloc_append_table_from_pages(&append, pages, n_pages, offset,
-					       size, max_segment, 0, gfp_mask);
+	err = sg_alloc_append_table_from_page_array(&append, parray, 0, n_pages, offset,
+						    size, max_segment, 0, gfp_mask);
 	if (err) {
 		sg_free_append_table(&append);
 		return err;
@@ -596,6 +650,27 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
 
+int sg_alloc_table_from_xarray_segment(struct sg_table *sgt, struct xarray *pages,
+				       unsigned int idx, unsigned int n_pages,
+				       unsigned int offset, unsigned long size,
+				       unsigned int max_segment, gfp_t gfp_mask)
+{
+	struct sg_append_table append = {};
+	struct page_array parray = PAGE_XARRAY(pages);
+	int err;
+
+	err = sg_alloc_append_table_from_page_array(&append, parray, idx, n_pages, offset,
+						    size, max_segment, 0, gfp_mask);
+	if (err) {
+		sg_free_append_table(&append);
+		return err;
+	}
+	memcpy(sgt, &append.sgt, sizeof(*sgt));
+	WARN_ON(append.total_nents != sgt->orig_nents);
+	return 0;
+}
+EXPORT_SYMBOL(sg_alloc_table_from_xarray_segment);
+
 #ifdef CONFIG_SGL_ALLOC
 
 /**
-- 
2.48.1

