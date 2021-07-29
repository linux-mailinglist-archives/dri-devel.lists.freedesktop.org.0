Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ADD3DA06B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B062C6ED0E;
	Thu, 29 Jul 2021 09:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11BA6ED0A;
 Thu, 29 Jul 2021 09:39:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86C5561076;
 Thu, 29 Jul 2021 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627551566;
 bh=n7oQnK+wMpt8zpfHrbRVmqTPBILHKq7IJx69M7lQsIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nOsh/68F3eDLiWirWF8B1v6YupCYX8sP1rFQ1qFz3PA0zltyweRKMFL4kIw0ttlir
 97j2AnIX/CQEZJWy9GL0apJtYTZl3TqWqEzDSesrLO/mSd/yO7Kg1WpfcwF9wI7i43
 poXuglznLZ+M4F3/zUXQ98l6+tX7InxaB5UiHHGpbkX6H7tFZlnxOBHzWKN7LtaxtG
 e/cJznH+CYKFD1ENMQzVA/INFNYLt7t4gyY99OnjpRuiT6SPuOl2GClKm7q4QPKD3W
 ACZlJwZz04Lqb/7qh6vJpIYQV/JyP7QJmKm10SPcLAuhnvCWEWRmACII6OdTrgf33f
 FO197ph5ferAw==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH rdma-next v3 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Date: Thu, 29 Jul 2021 12:39:12 +0300
Message-Id: <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
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

orig_nents should represent the number of entries with pages,
but __sg_alloc_table_from_pages sets orig_nents as the number of
total entries in the table. This is wrong when the API is used for
dynamic allocation where not all the table entries are mapped with
pages. It wasn't observed until now, since RDMA umem who uses this
API in the dynamic form doesn't use orig_nents implicit or explicit
by the scatterlist APIs.

Fix it by changing the append API to track the SG append table
state and have an API to free the append table according to the
total number of entries in the table.
Now all APIs set orig_nents as number of enries with pages.

Fixes: 07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation of SG table from pages")
Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/core/umem.c   |  34 ++++---
 include/linux/scatterlist.h      |  17 +++-
 include/rdma/ib_umem.h           |   1 +
 lib/scatterlist.c                | 161 +++++++++++++++++++------------
 tools/testing/scatterlist/main.c |  45 +++++----
 5 files changed, 154 insertions(+), 104 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index b741758e528f..42481e7a72e8 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -59,7 +59,7 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 		unpin_user_page_range_dirty_lock(sg_page(sg),
 			DIV_ROUND_UP(sg->length, PAGE_SIZE), make_dirty);
 
-	sg_free_table(&umem->sg_head);
+	sg_free_append_table(&umem->sgt_append);
 }
 
 /**
@@ -155,8 +155,7 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 	unsigned long dma_attr = 0;
 	struct mm_struct *mm;
 	unsigned long npages;
-	int ret;
-	struct scatterlist *sg = NULL;
+	int pinned, ret;
 	unsigned int gup_flags = FOLL_WRITE;
 
 	/*
@@ -216,28 +215,33 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 
 	while (npages) {
 		cond_resched();
-		ret = pin_user_pages_fast(cur_base,
+		pinned = pin_user_pages_fast(cur_base,
 					  min_t(unsigned long, npages,
 						PAGE_SIZE /
 						sizeof(struct page *)),
 					  gup_flags | FOLL_LONGTERM, page_list);
-		if (ret < 0)
+		if (pinned < 0) {
+			ret = pinned;
 			goto umem_release;
+		}
 
-		cur_base += ret * PAGE_SIZE;
-		npages -= ret;
-		sg = sg_alloc_append_table_from_pages(&umem->sg_head, page_list,
-				ret, 0, ret << PAGE_SHIFT,
-				ib_dma_max_seg_size(device), sg, npages,
-				GFP_KERNEL);
-		umem->sg_nents = umem->sg_head.nents;
-		if (IS_ERR(sg)) {
-			unpin_user_pages_dirty_lock(page_list, ret, 0);
-			ret = PTR_ERR(sg);
+		cur_base += pinned * PAGE_SIZE;
+		npages -= pinned;
+		ret = sg_alloc_append_table_from_pages(
+			&umem->sgt_append, page_list, pinned, 0,
+			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
+			npages, GFP_KERNEL);
+		umem->sg_nents = umem->sgt_append.sgt.nents;
+		if (ret) {
+			memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
+			       sizeof(umem->sgt_append.sgt));
+			unpin_user_pages_dirty_lock(page_list, pinned, 0);
 			goto umem_release;
 		}
 	}
 
+	memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
+	       sizeof(umem->sgt_append.sgt));
 	if (access & IB_ACCESS_RELAXED_ORDERING)
 		dma_attr |= DMA_ATTR_WEAK_ORDERING;
 
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 5c700f2a0d18..0c7aa5ccebfc 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -39,6 +39,12 @@ struct sg_table {
 	unsigned int orig_nents;	/* original size of list */
 };
 
+struct sg_append_table {
+	struct sg_table sgt;		/* The scatter list table */
+	struct scatterlist *prv;	/* last populated sge in the table */
+	unsigned int total_nents;	/* Total entries in the table */
+};
+
 /*
  * Notes on SG table design.
  *
@@ -282,14 +288,15 @@ typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
 void __sg_free_table(struct sg_table *, unsigned int, unsigned int,
 		     sg_free_fn *);
 void sg_free_table(struct sg_table *);
+void sg_free_append_table(struct sg_append_table *sgt);
 int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
 		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
 int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
-struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
-		struct page **pages, unsigned int n_pages, unsigned int offset,
-		unsigned long size, unsigned int max_segment,
-		struct scatterlist *prv, unsigned int left_pages,
-		gfp_t gfp_mask);
+int sg_alloc_append_table_from_pages(struct sg_append_table *sgt,
+				     struct page **pages, unsigned int n_pages,
+				     unsigned int offset, unsigned long size,
+				     unsigned int max_segment,
+				     unsigned int left_pages, gfp_t gfp_mask);
 int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				      unsigned int n_pages, unsigned int offset,
 				      unsigned long size,
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 676c57f5ca80..33cb23b2ee3c 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -26,6 +26,7 @@ struct ib_umem {
 	u32 is_odp : 1;
 	u32 is_dmabuf : 1;
 	struct work_struct	work;
+	struct sg_append_table  sgt_append;
 	struct sg_table sg_head;
 	int             nmap;
 	unsigned int    sg_nents;
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 611c63d4a958..b96b71c762b6 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -175,22 +175,9 @@ static void sg_kfree(struct scatterlist *sg, unsigned int nents)
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
+static void sg_free_table_entries(struct sg_table *table, unsigned int max_ents,
+				  unsigned int nents_first_chunk,
+				  sg_free_fn *free_fn, unsigned int num_entries)
 {
 	struct scatterlist *sgl, *next;
 	unsigned curr_max_ents = nents_first_chunk ?: max_ents;
@@ -199,8 +186,8 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 		return;
 
 	sgl = table->sgl;
-	while (table->orig_nents) {
-		unsigned int alloc_size = table->orig_nents;
+	while (num_entries) {
+		unsigned int alloc_size = num_entries;
 		unsigned int sg_size;
 
 		/*
@@ -218,7 +205,7 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 			next = NULL;
 		}
 
-		table->orig_nents -= sg_size;
+		num_entries -= sg_size;
 		if (nents_first_chunk)
 			nents_first_chunk = 0;
 		else
@@ -229,6 +216,41 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 
 	table->sgl = NULL;
 }
+
+/**
+ * sg_free_append_table - Free a previously allocated append sg table.
+ * @table:	 The mapped sg append table header
+ *
+ **/
+void sg_free_append_table(struct sg_append_table *table)
+{
+	sg_free_table_entries(&table->sgt, SG_MAX_SINGLE_ALLOC, false, sg_kfree,
+			      table->total_nents);
+}
+EXPORT_SYMBOL(sg_free_append_table);
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
+	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
+			      table->orig_nents);
+}
 EXPORT_SYMBOL(__sg_free_table);
 
 /**
@@ -238,7 +260,8 @@ EXPORT_SYMBOL(__sg_free_table);
  **/
 void sg_free_table(struct sg_table *table)
 {
-	__sg_free_table(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree);
+	sg_free_table_entries(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree,
+			      table->orig_nents);
 }
 EXPORT_SYMBOL(sg_free_table);
 
@@ -365,7 +388,7 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(sg_alloc_table);
 
-static struct scatterlist *get_next_sg(struct sg_table *table,
+static struct scatterlist *get_next_sg(struct sg_append_table *table,
 				       struct scatterlist *cur,
 				       unsigned long needed_sges,
 				       gfp_t gfp_mask)
@@ -386,54 +409,52 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
 		return ERR_PTR(-ENOMEM);
 	sg_init_table(new_sg, alloc_size);
 	if (cur) {
+		table->total_nents += alloc_size - 1;
 		__sg_chain(next_sg, new_sg);
-		table->orig_nents += alloc_size - 1;
 	} else {
-		table->sgl = new_sg;
-		table->orig_nents = alloc_size;
-		table->nents = 0;
+		table->sgt.sgl = new_sg;
+		table->total_nents = alloc_size;
 	}
 	return new_sg;
 }
 
 /**
- * sg_alloc_append_table_from_pages - Allocate and initialize an sg table from
- *			         an array of pages
- * @sgt:	 The sg table header to use
- * @pages:	 Pointer to an array of page pointers
- * @n_pages:	 Number of pages in the pages array
+ * sg_alloc_append_table_from_pages - Allocate and initialize an append sg
+ *                                    table from an array of pages
+ * @sgt_append:  The sg append table to use
+ * @pages:       Pointer to an array of page pointers
+ * @n_pages:     Number of pages in the pages array
  * @offset:      Offset from start of the first page to the start of a buffer
  * @size:        Number of valid bytes in the buffer (after offset)
  * @max_segment: Maximum size of a scatterlist element in bytes
- * @prv:	 Last populated sge in sgt
  * @left_pages:  Left pages caller have to set after this call
  * @gfp_mask:	 GFP allocation mask
  *
  * Description:
- *    If @prv is NULL, allocate and initialize an sg table from a list of pages,
- *    else reuse the scatterlist passed in at @prv.
- *    Contiguous ranges of the pages are squashed into a single scatterlist
- *    entry up to the maximum size specified in @max_segment.  A user may
- *    provide an offset at a start and a size of valid data in a buffer
- *    specified by the page array.
+ *    In the first call it allocate and initialize an sg table from a list of
+ *    pages, else reuse the scatterlist from sgt_append. Contiguous ranges of
+ *    the pages are squashed into a single scatterlist entry up to the maximum
+ *    size specified in @max_segment.  A user may provide an offset at a start
+ *    and a size of valid data in a buffer specified by the page array. The
+ *    returned sg table is released by sg_free_append_table
  *
  * Returns:
- *   Last SGE in sgt on success, PTR_ERR on otherwise.
- *   The allocation in @sgt must be released by sg_free_table.
+ *   0 on success, negative error on failure
  *
  * Notes:
  *   If this function returns non-0 (eg failure), the caller must call
- *   sg_free_table() to cleanup any leftover allocations.
+ *   sg_free_append_table() to cleanup any leftover allocations.
+ *
+ *   In the fist call, sgt_append must by initialized.
  */
-struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
+int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
-		struct scatterlist *prv, unsigned int left_pages,
-		gfp_t gfp_mask)
+		unsigned int left_pages, gfp_t gfp_mask)
 {
 	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
 	unsigned int added_nents = 0;
-	struct scatterlist *s = prv;
+	struct scatterlist *s = sgt_append->prv;
 
 	/*
 	 * The algorithm below requires max_segment to be aligned to PAGE_SIZE
@@ -441,25 +462,26 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 	 */
 	max_segment = ALIGN_DOWN(max_segment, PAGE_SIZE);
 	if (WARN_ON(max_segment < PAGE_SIZE))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
-		return ERR_PTR(-EOPNOTSUPP);
+	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && sgt_append->prv)
+		return -EOPNOTSUPP;
 
-	if (prv) {
-		unsigned long paddr = (page_to_pfn(sg_page(prv)) * PAGE_SIZE +
-				       prv->offset + prv->length) /
-				      PAGE_SIZE;
+	if (sgt_append->prv) {
+		unsigned long paddr =
+			(page_to_pfn(sg_page(sgt_append->prv)) * PAGE_SIZE +
+			 sgt_append->prv->offset + sgt_append->prv->length) /
+			PAGE_SIZE;
 
 		if (WARN_ON(offset))
-			return ERR_PTR(-EINVAL);
+			return -EINVAL;
 
 		/* Merge contiguous pages into the last SG */
-		prv_len = prv->length;
+		prv_len = sgt_append->prv->length;
 		while (n_pages && page_to_pfn(pages[0]) == paddr) {
-			if (prv->length + PAGE_SIZE > max_segment)
+			if (sgt_append->prv->length + PAGE_SIZE > max_segment)
 				break;
-			prv->length += PAGE_SIZE;
+			sgt_append->prv->length += PAGE_SIZE;
 			paddr++;
 			pages++;
 			n_pages--;
@@ -496,15 +518,16 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		}
 
 		/* Pass how many chunks might be left */
-		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
+		s = get_next_sg(sgt_append, s, chunks - i + left_pages,
+				gfp_mask);
 		if (IS_ERR(s)) {
 			/*
 			 * Adjust entry length to be as before function was
 			 * called.
 			 */
-			if (prv)
-				prv->length = prv_len;
-			return s;
+			if (sgt_append->prv)
+				sgt_append->prv->length = prv_len;
+			return PTR_ERR(s);
 		}
 		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
 		sg_set_page(s, pages[cur_page],
@@ -514,11 +537,13 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		offset = 0;
 		cur_page = j;
 	}
-	sgt->nents += added_nents;
+	sgt_append->sgt.nents += added_nents;
+	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
+	sgt_append->prv = s;
 out:
 	if (!left_pages)
 		sg_mark_end(s);
-	return s;
+	return 0;
 }
 EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
 
@@ -550,8 +575,18 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				unsigned long size, unsigned int max_segment,
 				gfp_t gfp_mask)
 {
-	return PTR_ERR_OR_ZERO(sg_alloc_append_table_from_pages(sgt, pages,
-			n_pages, offset, size, max_segment, NULL, 0, gfp_mask));
+	struct sg_append_table append = {};
+	int err;
+
+	err = sg_alloc_append_table_from_pages(&append, pages, n_pages, offset,
+					       size, max_segment, 0, gfp_mask);
+	if (err) {
+		sg_free_append_table(&append);
+		return err;
+	}
+	memcpy(sgt, &append.sgt, sizeof(*sgt));
+	WARN_ON(append.total_nents != sgt->orig_nents);
+	return 0;
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
 
diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index c2ff9179c2cc..08465a701cd5 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -85,43 +85,46 @@ int main(void)
 
 	for (i = 0, test = tests; test->expected_segments; test++, i++) {
 		int left_pages = test->pfn_app ? test->num_pages : 0;
+		struct sg_append_table append = {};
 		struct page *pages[MAX_PAGES];
-		struct sg_table st;
-		struct scatterlist *sg = NULL;
 		int ret;
 
 		set_pages(pages, test->pfn, test->num_pages);
 
-		if (test->pfn_app) {
-			sg = sg_alloc_append_table_from_pages(
-				&st, pages, test->num_pages, 0, test->size,
-				test->max_seg, NULL, left_pages, GFP_KERNEL);
-			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
-		} else {
+		if (test->pfn_app)
+			ret = sg_alloc_append_table_from_pages(
+				&append, pages, test->num_pages, 0, test->size,
+				test->max_seg, left_pages, GFP_KERNEL);
+		else
 			ret = sg_alloc_table_from_pages_segment(
-				&st, pages, test->num_pages, 0, test->size,
-				test->max_seg, GFP_KERNEL);
-			assert(ret == test->alloc_ret);
-		}
+				&append.sgt, pages, test->num_pages, 0,
+				test->size, test->max_seg, GFP_KERNEL);
+
+		assert(ret == test->alloc_ret);
 
 		if (test->alloc_ret)
 			continue;
 
 		if (test->pfn_app) {
 			set_pages(pages, test->pfn_app, test->num_pages);
-			sg = sg_alloc_append_table_from_pages(
-				&st, pages, test->num_pages, 0, test->size,
-				test->max_seg, sg, 0, GFP_KERNEL);
+			ret = sg_alloc_append_table_from_pages(
+				&append, pages, test->num_pages, 0, test->size,
+				test->max_seg, 0, GFP_KERNEL);
 
-			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
+			assert(ret == test->alloc_ret);
 		}
 
-		VALIDATE(st.nents == test->expected_segments, &st, test);
+		VALIDATE(append.sgt.nents == test->expected_segments,
+			 &append.sgt, test);
 		if (!test->pfn_app)
-			VALIDATE(st.orig_nents == test->expected_segments, &st,
-				 test);
-
-		sg_free_table(&st);
+			VALIDATE(append.sgt.orig_nents ==
+					 test->expected_segments,
+				 &append.sgt, test);
+
+		if (test->pfn_app)
+			sg_free_append_table(&append);
+		else
+			sg_free_table(&append.sgt);
 	}
 
 	assert(i == (sizeof(tests) / sizeof(tests[0])) - 1);
-- 
2.31.1

