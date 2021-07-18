Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A625A3CC8B0
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 13:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1672E89F4F;
	Sun, 18 Jul 2021 11:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD5C89F4F;
 Sun, 18 Jul 2021 11:09:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D170C61179;
 Sun, 18 Jul 2021 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626606561;
 bh=WymSd8E+zl7DWfXzmH25kO8A3dUQu5ir04bp7X4oYAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Div0VZukZii6DFdi3WLQD0ZvarEV7dglobaNb+w0/Scbg2FC5tYP5i5jFlzh7anCX
 7o7sa1GMtbxk4on4UNLLEk6CJK9oNmxIzlRfzHjGoGPZp6Q0KGPhlGSAEidLjnO+HR
 IBzlu/01IgAY0KTsz8sw6CcP34n1OZYJi985kyvfe3H3oKLLH1U5gUmFu5l8BOIjv5
 QT2HSgUF846o0Qgsm7XNA28f5YXe5tmdD+Jnq4OSR+jaDCIphgMh29h5syJtjFpzUQ
 3w6lQsAVOdfow3cwwoTAdf6+EAaCzxRhyNXs2aByW6+a59ySw97WUKTnrBH3PD4XDj
 LODAllrPnn2qg==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH rdma-next v2 2/2] RDMA: Use dma_map_sgtable for map umem pages
Date: Sun, 18 Jul 2021 14:09:13 +0300
Message-Id: <009740c35873683e401da3f86d0e7a78b2f25601.1626605893.git.leonro@nvidia.com>
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

In order to avoid incorrect usage of sg_table fields, change umem to
use dma_map_sgtable for map the pages for DMA. Since dma_map_sgtable
update the nents field (number of DMA entries), there is no need
anymore for nmap variable, hence do some cleanups accordingly.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/core/umem.c        | 28 +++++++++++----------------
 drivers/infiniband/core/umem_dmabuf.c |  1 -
 drivers/infiniband/hw/mlx4/mr.c       |  4 ++--
 drivers/infiniband/hw/mlx5/mr.c       |  3 ++-
 drivers/infiniband/sw/rdmavt/mr.c     |  2 +-
 drivers/infiniband/sw/rxe/rxe_mr.c    |  3 ++-
 include/rdma/ib_umem.h                |  3 ++-
 include/rdma/ib_verbs.h               | 28 +++++++++++++++++++++++++++
 8 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index cf4197363346..77c2df1c91d1 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -51,11 +51,11 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 	struct scatterlist *sg;
 	unsigned int i;
 
-	if (umem->nmap > 0)
-		ib_dma_unmap_sg(dev, umem->sg_head.sgl, umem->sg_nents,
-				DMA_BIDIRECTIONAL);
+	if (dirty)
+		ib_dma_unmap_sgtable_attrs(dev, &umem->sg_head,
+					   DMA_BIDIRECTIONAL, 0);
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->sg_nents, i)
+	for_each_sgtable_sg(&umem->sg_head, sg, i)
 		unpin_user_page_range_dirty_lock(sg_page(sg),
 			DIV_ROUND_UP(sg->length, PAGE_SIZE), make_dirty);
 
@@ -111,7 +111,7 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 	/* offset into first SGL */
 	pgoff = umem->address & ~PAGE_MASK;
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sg_head, sg, i) {
 		/* Walk SGL and reduce max page size if VA/PA bits differ
 		 * for any address.
 		 */
@@ -121,7 +121,7 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 		 * the maximum possible page size as the low bits of the iova
 		 * must be zero when starting the next chunk.
 		 */
-		if (i != (umem->nmap - 1))
+		if (i != (umem->sg_head.nents - 1))
 			mask |= va;
 		pgoff = 0;
 	}
@@ -240,16 +240,10 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 	if (access & IB_ACCESS_RELAXED_ORDERING)
 		dma_attr |= DMA_ATTR_WEAK_ORDERING;
 
-	umem->nmap =
-		ib_dma_map_sg_attrs(device, umem->sg_head.sgl, umem->sg_nents,
-				    DMA_BIDIRECTIONAL, dma_attr);
-
-	if (!umem->nmap) {
-		ret = -ENOMEM;
+	ret = ib_dma_map_sgtable_attrs(device, &umem->sg_head,
+				       DMA_BIDIRECTIONAL, dma_attr);
+	if (ret)
 		goto umem_release;
-	}
-
-	ret = 0;
 	goto out;
 
 umem_release:
@@ -309,8 +303,8 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 		return -EINVAL;
 	}
 
-	ret = sg_pcopy_to_buffer(umem->sg_head.sgl, umem->sg_nents, dst, length,
-				 offset + ib_umem_offset(umem));
+	ret = sg_pcopy_to_buffer(umem->sg_head.sgl, umem->sg_head.orig_nents,
+				 dst, length, offset + ib_umem_offset(umem));
 
 	if (ret < 0)
 		return ret;
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index c6e875619fac..2884e4526d78 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -57,7 +57,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 
 	umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
 	umem_dmabuf->umem.sg_head.nents = nmap;
-	umem_dmabuf->umem.nmap = nmap;
 	umem_dmabuf->sgt = sgt;
 
 wait_fence:
diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4/mr.c
index 50becc0e4b62..ab5dc8eac7f8 100644
--- a/drivers/infiniband/hw/mlx4/mr.c
+++ b/drivers/infiniband/hw/mlx4/mr.c
@@ -200,7 +200,7 @@ int mlx4_ib_umem_write_mtt(struct mlx4_ib_dev *dev, struct mlx4_mtt *mtt,
 	mtt_shift = mtt->page_shift;
 	mtt_size = 1ULL << mtt_shift;
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sg_head, sg, i) {
 		if (cur_start_addr + len == sg_dma_address(sg)) {
 			/* still the same block */
 			len += sg_dma_len(sg);
@@ -273,7 +273,7 @@ int mlx4_ib_umem_calc_optimal_mtt_size(struct ib_umem *umem, u64 start_va,
 
 	*num_of_mtts = ib_umem_num_dma_blocks(umem, PAGE_SIZE);
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sg_head, sg, i) {
 		/*
 		 * Initialization - save the first chunk start as the
 		 * current_block_start - block means contiguous pages.
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 3263851ea574..4954fb9eb6dc 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1226,7 +1226,8 @@ int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 	orig_sg_length = sg.length;
 
 	cur_mtt = mtt;
-	rdma_for_each_block (mr->umem->sg_head.sgl, &biter, mr->umem->nmap,
+	rdma_for_each_block (mr->umem->sg_head.sgl, &biter,
+			     mr->umem->sg_head.nents,
 			     BIT(mr->page_shift)) {
 		if (cur_mtt == (void *)mtt + sg.length) {
 			dma_sync_single_for_device(ddev, sg.addr, sg.length,
diff --git a/drivers/infiniband/sw/rdmavt/mr.c b/drivers/infiniband/sw/rdmavt/mr.c
index 34b7af6ab9c2..d955c8c4acc4 100644
--- a/drivers/infiniband/sw/rdmavt/mr.c
+++ b/drivers/infiniband/sw/rdmavt/mr.c
@@ -410,7 +410,7 @@ struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	mr->mr.page_shift = PAGE_SHIFT;
 	m = 0;
 	n = 0;
-	for_each_sg_page (umem->sg_head.sgl, &sg_iter, umem->nmap, 0) {
+	for_each_sg_page (umem->sg_head.sgl, &sg_iter, umem->sg_head.nents, 0) {
 		void *vaddr;
 
 		vaddr = page_address(sg_page_iter_page(&sg_iter));
diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
index 1ee5bd8291e5..ba534b6c67f0 100644
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@ -141,7 +141,8 @@ int rxe_mr_init_user(struct rxe_pd *pd, u64 start, u64 length, u64 iova,
 	if (length > 0) {
 		buf = map[0]->buf;
 
-		for_each_sg_page(umem->sg_head.sgl, &sg_iter, umem->nmap, 0) {
+		for_each_sg_page(umem->sg_head.sgl, &sg_iter,
+				 umem->sg_head.nents, 0) {
 			if (num_buf >= RXE_BUF_PER_MAP) {
 				map++;
 				buf = map[0]->buf;
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 5a65212efc2e..3f5576877072 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -76,7 +76,8 @@ static inline void __rdma_umem_block_iter_start(struct ib_block_iter *biter,
 						struct ib_umem *umem,
 						unsigned long pgsz)
 {
-	__rdma_block_iter_start(biter, umem->sg_head.sgl, umem->nmap, pgsz);
+	__rdma_block_iter_start(biter, umem->sg_head.sgl, umem->sg_head.nents,
+				pgsz);
 }
 
 /**
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

