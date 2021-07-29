Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D991F3DA06A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C926ED0F;
	Thu, 29 Jul 2021 09:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD1A6ED0D;
 Thu, 29 Jul 2021 09:39:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D916F61090;
 Thu, 29 Jul 2021 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627551569;
 bh=BokEWfcIVN4Fe6xU8WP7wsbXuMINaEDXKElpZ5y2kYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XdWqUVMZGvlTEc+uV3W15YrGNF1gjnjwE+t0HWZaq2lWGG4Ls5eDHydp7ygalBl/7
 rTHE9sr3no68tK+ybfAC2JXpeVjrujPvaVROExjkbxFoLuqk85jGdWwFU2BYkkayWe
 vL8NydD0SMS3x4FOjrkxsQJ945Axdhvy3QBVFUedBRkwLwkNEA+fpRwY1zpAekfP1L
 +VUcqTLqw7PhjmiUoWjy+ZGDv9eKKH+/yvvTNj4JP3y1RV+stebgDPSxl43Xs0X/PQ
 9TtWq4hMHQjSiJk0wJTXXuCDe4rv+Kggn4pFVgqGstc0StukcJIktmiOlfDDZCS1jr
 Tr9EK/xYct/Jg==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH rdma-next v3 3/3] RDMA: Use the sg_table directly and remove
 the opencoded version from umem
Date: Thu, 29 Jul 2021 12:39:13 +0300
Message-Id: <313cf82ed9997ab5de954f9133f33124caf0e662.1627551226.git.leonro@nvidia.com>
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

This allows using the normal sg_table APIs and makes all the code
cleaner. Remove sgt, nents and nmapd from ib_umem.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/core/umem.c          | 32 +++++++++----------------
 drivers/infiniband/core/umem_dmabuf.c   |  5 ++--
 drivers/infiniband/hw/hns/hns_roce_db.c |  4 ++--
 drivers/infiniband/hw/irdma/verbs.c     |  2 +-
 drivers/infiniband/hw/mlx4/doorbell.c   |  3 ++-
 drivers/infiniband/hw/mlx4/mr.c         |  4 ++--
 drivers/infiniband/hw/mlx5/doorbell.c   |  3 ++-
 drivers/infiniband/hw/mlx5/mr.c         |  3 ++-
 drivers/infiniband/hw/qedr/verbs.c      |  2 +-
 drivers/infiniband/sw/rdmavt/mr.c       |  2 +-
 drivers/infiniband/sw/rxe/rxe_mr.c      |  2 +-
 include/rdma/ib_umem.h                  | 10 ++++----
 include/rdma/ib_verbs.h                 | 28 ++++++++++++++++++++++
 13 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 42481e7a72e8..86d479772fbc 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -51,11 +51,11 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 	struct scatterlist *sg;
 	unsigned int i;
 
-	if (umem->nmap > 0)
-		ib_dma_unmap_sg(dev, umem->sg_head.sgl, umem->sg_nents,
-				DMA_BIDIRECTIONAL);
+	if (dirty)
+		ib_dma_unmap_sgtable_attrs(dev, &umem->sgt_append.sgt,
+					   DMA_BIDIRECTIONAL, 0);
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->sg_nents, i)
+	for_each_sgtable_sg(&umem->sgt_append.sgt, sg, i)
 		unpin_user_page_range_dirty_lock(sg_page(sg),
 			DIV_ROUND_UP(sg->length, PAGE_SIZE), make_dirty);
 
@@ -111,7 +111,7 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 	/* offset into first SGL */
 	pgoff = umem->address & ~PAGE_MASK;
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
 		/* Walk SGL and reduce max page size if VA/PA bits differ
 		 * for any address.
 		 */
@@ -121,7 +121,7 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 		 * the maximum possible page size as the low bits of the iova
 		 * must be zero when starting the next chunk.
 		 */
-		if (i != (umem->nmap - 1))
+		if (i != (umem->sgt_append.sgt.nents - 1))
 			mask |= va;
 		pgoff = 0;
 	}
@@ -231,30 +231,19 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 			&umem->sgt_append, page_list, pinned, 0,
 			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
 			npages, GFP_KERNEL);
-		umem->sg_nents = umem->sgt_append.sgt.nents;
 		if (ret) {
-			memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
-			       sizeof(umem->sgt_append.sgt));
 			unpin_user_pages_dirty_lock(page_list, pinned, 0);
 			goto umem_release;
 		}
 	}
 
-	memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
-	       sizeof(umem->sgt_append.sgt));
 	if (access & IB_ACCESS_RELAXED_ORDERING)
 		dma_attr |= DMA_ATTR_WEAK_ORDERING;
 
-	umem->nmap =
-		ib_dma_map_sg_attrs(device, umem->sg_head.sgl, umem->sg_nents,
-				    DMA_BIDIRECTIONAL, dma_attr);
-
-	if (!umem->nmap) {
-		ret = -ENOMEM;
+	ret = ib_dma_map_sgtable_attrs(device, &umem->sgt_append.sgt,
+				       DMA_BIDIRECTIONAL, dma_attr);
+	if (ret)
 		goto umem_release;
-	}
-
-	ret = 0;
 	goto out;
 
 umem_release:
@@ -314,7 +303,8 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 		return -EINVAL;
 	}
 
-	ret = sg_pcopy_to_buffer(umem->sg_head.sgl, umem->sg_nents, dst, length,
+	ret = sg_pcopy_to_buffer(umem->sgt_append.sgt.sgl,
+				 umem->sgt_append.sgt.orig_nents, dst, length,
 				 offset + ib_umem_offset(umem));
 
 	if (ret < 0)
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index c6e875619fac..e824baf4640d 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -55,9 +55,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 		cur += sg_dma_len(sg);
 	}
 
-	umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
-	umem_dmabuf->umem.sg_head.nents = nmap;
-	umem_dmabuf->umem.nmap = nmap;
+	umem_dmabuf->umem.sgt_append.sgt.sgl = umem_dmabuf->first_sg;
+	umem_dmabuf->umem.sgt_append.sgt.nents = nmap;
 	umem_dmabuf->sgt = sgt;
 
 wait_fence:
diff --git a/drivers/infiniband/hw/hns/hns_roce_db.c b/drivers/infiniband/hw/hns/hns_roce_db.c
index d40ea3d87260..751470c7a2ce 100644
--- a/drivers/infiniband/hw/hns/hns_roce_db.c
+++ b/drivers/infiniband/hw/hns/hns_roce_db.c
@@ -42,8 +42,8 @@ int hns_roce_db_map_user(struct hns_roce_ucontext *context, unsigned long virt,
 
 found:
 	offset = virt - page_addr;
-	db->dma = sg_dma_address(page->umem->sg_head.sgl) + offset;
-	db->virt_addr = sg_virt(page->umem->sg_head.sgl) + offset;
+	db->dma = sg_dma_address(page->umem->sgt_append.sgt.sgl) + offset;
+	db->virt_addr = sg_virt(page->umem->sgt_append.sgt.sgl) + offset;
 	db->u.user_page = page;
 	refcount_inc(&page->refcount);
 
diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index 9712f6902ba8..dbb59a828307 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -2237,7 +2237,7 @@ static void irdma_copy_user_pgaddrs(struct irdma_mr *iwmr, u64 *pbl,
 	pinfo = (level == PBLE_LEVEL_1) ? NULL : palloc->level2.leaf;
 
 	if (iwmr->type == IRDMA_MEMREG_TYPE_QP)
-		iwpbl->qp_mr.sq_page = sg_page(region->sg_head.sgl);
+		iwpbl->qp_mr.sq_page = sg_page(region->sgt_append.sgt.sgl);
 
 	rdma_umem_for_each_dma_block(region, &biter, iwmr->page_size) {
 		*pbl = rdma_block_iter_dma_address(&biter);
diff --git a/drivers/infiniband/hw/mlx4/doorbell.c b/drivers/infiniband/hw/mlx4/doorbell.c
index d41f03ccb0e1..9bbd695a9fd5 100644
--- a/drivers/infiniband/hw/mlx4/doorbell.c
+++ b/drivers/infiniband/hw/mlx4/doorbell.c
@@ -75,7 +75,8 @@ int mlx4_ib_db_map_user(struct ib_udata *udata, unsigned long virt,
 	list_add(&page->list, &context->db_page_list);
 
 found:
-	db->dma = sg_dma_address(page->umem->sg_head.sgl) + (virt & ~PAGE_MASK);
+	db->dma = sg_dma_address(page->umem->sgt_append.sgt.sgl) +
+		  (virt & ~PAGE_MASK);
 	db->u.user_page = page;
 	++page->refcnt;
 
diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4/mr.c
index 50becc0e4b62..04a67b481608 100644
--- a/drivers/infiniband/hw/mlx4/mr.c
+++ b/drivers/infiniband/hw/mlx4/mr.c
@@ -200,7 +200,7 @@ int mlx4_ib_umem_write_mtt(struct mlx4_ib_dev *dev, struct mlx4_mtt *mtt,
 	mtt_shift = mtt->page_shift;
 	mtt_size = 1ULL << mtt_shift;
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
 		if (cur_start_addr + len == sg_dma_address(sg)) {
 			/* still the same block */
 			len += sg_dma_len(sg);
@@ -273,7 +273,7 @@ int mlx4_ib_umem_calc_optimal_mtt_size(struct ib_umem *umem, u64 start_va,
 
 	*num_of_mtts = ib_umem_num_dma_blocks(umem, PAGE_SIZE);
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
 		/*
 		 * Initialization - save the first chunk start as the
 		 * current_block_start - block means contiguous pages.
diff --git a/drivers/infiniband/hw/mlx5/doorbell.c b/drivers/infiniband/hw/mlx5/doorbell.c
index 9ca2e61807ec..6398e2f48579 100644
--- a/drivers/infiniband/hw/mlx5/doorbell.c
+++ b/drivers/infiniband/hw/mlx5/doorbell.c
@@ -78,7 +78,8 @@ int mlx5_ib_db_map_user(struct mlx5_ib_ucontext *context, unsigned long virt,
 	list_add(&page->list, &context->db_page_list);
 
 found:
-	db->dma = sg_dma_address(page->umem->sg_head.sgl) + (virt & ~PAGE_MASK);
+	db->dma = sg_dma_address(page->umem->sgt_append.sgt.sgl) +
+		  (virt & ~PAGE_MASK);
 	db->u.user_page = page;
 	++page->refcnt;
 
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 3263851ea574..d1eb49dbca15 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1226,7 +1226,8 @@ int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 	orig_sg_length = sg.length;
 
 	cur_mtt = mtt;
-	rdma_for_each_block (mr->umem->sg_head.sgl, &biter, mr->umem->nmap,
+	rdma_for_each_block (mr->umem->sgt_append.sgt.sgl, &biter,
+			     mr->umem->sgt_append.sgt.nents,
 			     BIT(mr->page_shift)) {
 		if (cur_mtt == (void *)mtt + sg.length) {
 			dma_sync_single_for_device(ddev, sg.addr, sg.length,
diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index fdc47ef7d861..f23d324bd5e1 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -1481,7 +1481,7 @@ static int qedr_init_srq_user_params(struct ib_udata *udata,
 		return PTR_ERR(srq->prod_umem);
 	}
 
-	sg = srq->prod_umem->sg_head.sgl;
+	sg = srq->prod_umem->sgt_append.sgt.sgl;
 	srq->hw_srq.phy_prod_pair_addr = sg_dma_address(sg);
 
 	return 0;
diff --git a/drivers/infiniband/sw/rdmavt/mr.c b/drivers/infiniband/sw/rdmavt/mr.c
index 34b7af6ab9c2..dfb99a56d952 100644
--- a/drivers/infiniband/sw/rdmavt/mr.c
+++ b/drivers/infiniband/sw/rdmavt/mr.c
@@ -410,7 +410,7 @@ struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	mr->mr.page_shift = PAGE_SHIFT;
 	m = 0;
 	n = 0;
-	for_each_sg_page (umem->sg_head.sgl, &sg_iter, umem->nmap, 0) {
+	for_each_sgtable_page (&umem->sgt_append.sgt, &sg_iter, 0) {
 		void *vaddr;
 
 		vaddr = page_address(sg_page_iter_page(&sg_iter));
diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
index 1ee5bd8291e5..16de1bc6db6e 100644
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@ -141,7 +141,7 @@ int rxe_mr_init_user(struct rxe_pd *pd, u64 start, u64 length, u64 iova,
 	if (length > 0) {
 		buf = map[0]->buf;
 
-		for_each_sg_page(umem->sg_head.sgl, &sg_iter, umem->nmap, 0) {
+		for_each_sgtable_page (&umem->sgt_append.sgt, &sg_iter, 0) {
 			if (num_buf >= RXE_BUF_PER_MAP) {
 				map++;
 				buf = map[0]->buf;
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 33cb23b2ee3c..62f8e0604207 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -27,9 +27,6 @@ struct ib_umem {
 	u32 is_dmabuf : 1;
 	struct work_struct	work;
 	struct sg_append_table  sgt_append;
-	struct sg_table sg_head;
-	int             nmap;
-	unsigned int    sg_nents;
 };
 
 struct ib_umem_dmabuf {
@@ -57,7 +54,7 @@ static inline int ib_umem_offset(struct ib_umem *umem)
 static inline unsigned long ib_umem_dma_offset(struct ib_umem *umem,
 					       unsigned long pgsz)
 {
-	return (sg_dma_address(umem->sg_head.sgl) + ib_umem_offset(umem)) &
+	return (sg_dma_address(umem->sgt_append.sgt.sgl) + ib_umem_offset(umem)) &
 	       (pgsz - 1);
 }
 
@@ -78,7 +75,8 @@ static inline void __rdma_umem_block_iter_start(struct ib_block_iter *biter,
 						struct ib_umem *umem,
 						unsigned long pgsz)
 {
-	__rdma_block_iter_start(biter, umem->sg_head.sgl, umem->nmap, pgsz);
+	__rdma_block_iter_start(biter, umem->sgt_append.sgt.sgl,
+				umem->sgt_append.sgt.nents, pgsz);
 }
 
 /**
@@ -129,7 +127,7 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
 						    unsigned long pgsz_bitmap,
 						    u64 pgoff_bitmask)
 {
-	struct scatterlist *sg = umem->sg_head.sgl;
+	struct scatterlist *sg = umem->sgt_append.sgt.sgl;
 	dma_addr_t dma_addr;
 
 	dma_addr = sg_dma_address(sg) + (umem->address & ~PAGE_MASK);
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 371df1c80aeb..2dba30849731 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -4057,6 +4057,34 @@ static inline void ib_dma_unmap_sg_attrs(struct ib_device *dev,
 				   dma_attrs);
 }
 
+/**
+ * ib_dma_map_sgtable_attrs - Map a scatter/gather table to DMA addresses
+ * @dev: The device for which the DMA addresses are to be created
+ * @sg: The sg_table object describing the buffer
+ * @direction: The direction of the DMA
+ * @attrs: Optional DMA attributes for the map operation
+ */
+static inline int ib_dma_map_sgtable_attrs(struct ib_device *dev,
+					   struct sg_table *sgt,
+					   enum dma_data_direction direction,
+					   unsigned long dma_attrs)
+{
+	if (ib_uses_virt_dma(dev)) {
+		ib_dma_virt_map_sg(dev, sgt->sgl, sgt->orig_nents);
+		return 0;
+	}
+	return dma_map_sgtable(dev->dma_device, sgt, direction, dma_attrs);
+}
+
+static inline void ib_dma_unmap_sgtable_attrs(struct ib_device *dev,
+					      struct sg_table *sgt,
+					      enum dma_data_direction direction,
+					      unsigned long dma_attrs)
+{
+	if (!ib_uses_virt_dma(dev))
+		dma_unmap_sgtable(dev->dma_device, sgt, direction, dma_attrs);
+}
+
 /**
  * ib_dma_map_sg - Map a scatter/gather list to DMA addresses
  * @dev: The device for which the DMA addresses are to be created
-- 
2.31.1

