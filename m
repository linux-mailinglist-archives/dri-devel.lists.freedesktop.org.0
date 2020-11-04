Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C12A6FF1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 22:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3B96E844;
	Wed,  4 Nov 2020 21:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C9E6E845
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 21:52:48 +0000 (UTC)
IronPort-SDR: bFtTRTDZDkaBE0U+DhBSQRgDCDuFFbfoAIY8DFbcA9KgklszLcqDx/5auuaGBtOEeH7WrM2LnJ
 CtoNyN9zyuUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157067644"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="157067644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 13:52:48 -0800
IronPort-SDR: teyFNYBaoJIsaNW1OaSq0HaoFjwZUL2OPBDAyKxrq4x7KweZIU49t0rI+kecsA5Ze0mlKn7aHo
 mQTSsZQGWWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="337019414"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga002.jf.intel.com with ESMTP; 04 Nov 2020 13:52:48 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Date: Wed,  4 Nov 2020 14:06:34 -0800
Message-Id: <1604527595-39736-5-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
References: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the new driver method 'reg_user_mr_dmabuf'.  Utilize the core
functions to import dma-buf based memory region and update the mappings.

Add code to handle dma-buf related page fault.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
Reviewed-by: Sean Hefty <sean.hefty@intel.com>
Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Acked-by: Christian Koenig <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/infiniband/hw/mlx5/main.c    |   2 +
 drivers/infiniband/hw/mlx5/mlx5_ib.h |  18 +++++
 drivers/infiniband/hw/mlx5/mr.c      | 123 ++++++++++++++++++++++++++++++++++-
 drivers/infiniband/hw/mlx5/odp.c     | 105 +++++++++++++++++++++++++++---
 4 files changed, 236 insertions(+), 12 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index 36b15a0..e647ea4 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
 /*
  * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  */
 
 #include <linux/debugfs.h>
@@ -4055,6 +4056,7 @@ static int mlx5_ib_enable_driver(struct ib_device *dev)
 	.query_srq = mlx5_ib_query_srq,
 	.query_ucontext = mlx5_ib_query_ucontext,
 	.reg_user_mr = mlx5_ib_reg_user_mr,
+	.reg_user_mr_dmabuf = mlx5_ib_reg_user_mr_dmabuf,
 	.req_notify_cq = mlx5_ib_arm_cq,
 	.rereg_user_mr = mlx5_ib_rereg_user_mr,
 	.resize_cq = mlx5_ib_resize_cq,
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index bb44080..3ef6872 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
 /*
  * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  */
 
 #ifndef MLX5_IB_H
@@ -665,6 +666,12 @@ static inline bool is_odp_mr(struct mlx5_ib_mr *mr)
 	       mr->umem->is_odp;
 }
 
+static inline bool is_dmabuf_mr(struct mlx5_ib_mr *mr)
+{
+	return IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING) && mr->umem &&
+	       mr->umem->is_dmabuf;
+}
+
 struct mlx5_ib_mw {
 	struct ib_mw		ibmw;
 	struct mlx5_core_mkey	mmkey;
@@ -1200,6 +1207,10 @@ int mlx5_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 				  u64 virt_addr, int access_flags,
 				  struct ib_udata *udata);
+struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
+					 u64 length, u64 virt_addr,
+					 int fd, int access_flags,
+					 struct ib_udata *udata);
 int mlx5_ib_advise_mr(struct ib_pd *pd,
 		      enum ib_uverbs_advise_mr_advice advice,
 		      u32 flags,
@@ -1210,11 +1221,13 @@ int mlx5_ib_advise_mr(struct ib_pd *pd,
 int mlx5_ib_dealloc_mw(struct ib_mw *mw);
 int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
 		       int page_shift, int flags);
+int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags);
 struct mlx5_ib_mr *mlx5_ib_alloc_implicit_mr(struct mlx5_ib_pd *pd,
 					     struct ib_udata *udata,
 					     int access_flags);
 void mlx5_ib_free_implicit_mr(struct mlx5_ib_mr *mr);
 void mlx5_ib_fence_odp_mr(struct mlx5_ib_mr *mr);
+void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr);
 int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 			  u64 length, u64 virt_addr, int access_flags,
 			  struct ib_pd *pd, struct ib_udata *udata);
@@ -1306,6 +1319,7 @@ int mlx5_ib_advise_mr_prefetch(struct ib_pd *pd,
 			       enum ib_uverbs_advise_mr_advice advice,
 			       u32 flags, struct ib_sge *sg_list, u32 num_sge);
 int mlx5_ib_init_odp_mr(struct mlx5_ib_mr *mr, bool enable);
+int mlx5_ib_init_dmabuf_mr(struct mlx5_ib_mr *mr);
 #else /* CONFIG_INFINIBAND_ON_DEMAND_PAGING */
 static inline void mlx5_ib_internal_fill_odp_caps(struct mlx5_ib_dev *dev)
 {
@@ -1331,6 +1345,10 @@ static inline int mlx5_ib_init_odp_mr(struct mlx5_ib_mr *mr, bool enable)
 {
 	return -EOPNOTSUPP;
 }
+static inline int mlx5_ib_init_dmabuf_mr(struct mlx5_ib_mr *mr)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_INFINIBAND_ON_DEMAND_PAGING */
 
 extern const struct mmu_interval_notifier_ops mlx5_mn_ops;
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 9f653b4..f39127b 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2013-2015, Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -36,6 +37,8 @@
 #include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include <rdma/ib_umem.h>
 #include <rdma/ib_umem_odp.h>
 #include <rdma/ib_verbs.h>
@@ -1212,8 +1215,11 @@ int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
 
 /*
  * Send the DMA list to the HW for a normal MR using UMR.
+ * DMABUF MR is handled in a similar way, with two exceptions:
+ * (1) The MR may only cover a sub-range of the scatterlist;
+ * (2) The MLX5_IB_UPD_XLT_ZAP flag can be used.
  */
-static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
+int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 {
 	struct mlx5_ib_dev *dev = mr->dev;
 	struct device *ddev = dev->ib_dev.dev.parent;
@@ -1225,6 +1231,8 @@ static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 	size_t final_size;
 	struct ib_sge sg;
 	int err = 0;
+	unsigned int skip;
+	unsigned int todo;
 
 	if (WARN_ON(mr->umem->is_odp))
 		return -EINVAL;
@@ -1237,6 +1245,11 @@ static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 		return -ENOMEM;
 	orig_sg_length = sg.length;
 
+	if (mr->umem->is_dmabuf) {
+		skip = mr->umem->address >> mr->page_shift;
+		todo = ib_umem_num_dma_blocks(mr->umem, 1 << mr->page_shift);
+	}
+
 	cur_mtt = mtt;
 	rdma_for_each_block (mr->umem->sg_head.sgl, &biter, mr->umem->nmap,
 			     BIT(mr->page_shift)) {
@@ -1255,6 +1268,19 @@ static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 		cur_mtt->ptag =
 			cpu_to_be64(rdma_block_iter_dma_address(&biter) |
 				    MLX5_IB_MTT_PRESENT);
+
+		if (mr->umem->is_dmabuf) {
+			if (flags & MLX5_IB_UPD_XLT_ZAP)
+				cur_mtt->ptag = 0;
+			if (skip) {
+				skip--;
+				continue;
+			}
+			if (!todo)
+				break;
+			todo--;
+		}
+
 		cur_mtt++;
 	}
 
@@ -1581,6 +1607,97 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	return ERR_PTR(err);
 }
 
+static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
+	struct mlx5_ib_mr *mr = umem_dmabuf->private;
+
+	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
+
+	/* mr could have been destroyed. see mlx5_ib_fence_dmabuf_mr(). */
+	if (!mr)
+		return;
+
+	mlx5_ib_update_mr_pas(mr, MLX5_IB_UPD_XLT_ZAP);
+	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
+}
+
+static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
+	.allow_peer2peer = 1,
+	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
+};
+
+struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
+					 u64 length, u64 virt_addr,
+					 int fd, int access_flags,
+					 struct ib_udata *udata)
+{
+	struct mlx5_ib_dev *dev = to_mdev(pd->device);
+	struct mlx5_ib_mr *mr = NULL;
+	struct ib_umem *umem;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mlx5_ib_dbg(dev,
+		    "offset 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
+		    offset, virt_addr, length, fd, access_flags);
+
+	if (!mlx5_ib_can_load_pas_with_umr(dev, length))
+		return ERR_PTR(-EINVAL);
+
+	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
+				  &mlx5_ib_dmabuf_attach_ops);
+	if (IS_ERR(umem)) {
+		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
+		return ERR_PTR(PTR_ERR(umem));
+	}
+
+	mr = alloc_mr_from_cache(pd, umem, virt_addr, access_flags);
+	if (IS_ERR(mr))
+		mr = NULL;
+
+	if (!mr) {
+		mutex_lock(&dev->slow_path_mutex);
+		mr = reg_create(NULL, pd, umem, virt_addr, access_flags,
+				false);
+		mutex_unlock(&dev->slow_path_mutex);
+	}
+
+	if (IS_ERR(mr)) {
+		err = PTR_ERR(mr);
+		goto error;
+	}
+
+	mlx5_ib_dbg(dev, "mkey 0x%x\n", mr->mmkey.key);
+
+	mr->umem = umem;
+	atomic_add(ib_umem_num_pages(mr->umem), &dev->mdev->priv.reg_pages);
+	set_mr_fields(dev, mr, length, access_flags);
+
+	to_ib_umem_dmabuf(umem)->private = mr;
+	init_waitqueue_head(&mr->q_deferred_work);
+	atomic_set(&mr->num_deferred_work, 0);
+	err = xa_err(xa_store(&dev->odp_mkeys,
+			      mlx5_base_mkey(mr->mmkey.key), &mr->mmkey,
+			      GFP_KERNEL));
+	if (err) {
+		dereg_mr(dev, mr);
+		return ERR_PTR(err);
+	}
+
+	err = mlx5_ib_init_dmabuf_mr(mr);
+	if (err) {
+		dereg_mr(dev, mr);
+		return ERR_PTR(err);
+	}
+	return &mr->ibmr;
+error:
+	ib_umem_release(umem);
+	return ERR_PTR(err);
+}
+
 /**
  * mlx5_mr_cache_invalidate - Fence all DMA on the MR
  * @mr: The MR to fence
@@ -1649,7 +1766,7 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 	if (!mr->umem)
 		return -EINVAL;
 
-	if (is_odp_mr(mr))
+	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
 		return -EOPNOTSUPP;
 
 	if (flags & IB_MR_REREG_TRANS) {
@@ -1812,6 +1929,8 @@ static void dereg_mr(struct mlx5_ib_dev *dev, struct mlx5_ib_mr *mr)
 	/* Stop all DMA */
 	if (is_odp)
 		mlx5_ib_fence_odp_mr(mr);
+	else if (is_dmabuf_mr(mr))
+		mlx5_ib_fence_dmabuf_mr(mr);
 	else
 		clean_mr(dev, mr);
 
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 5c853ec..546edc6 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -33,6 +33,8 @@
 #include <rdma/ib_umem.h>
 #include <rdma/ib_umem_odp.h>
 #include <linux/kernel.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 
 #include "mlx5_ib.h"
 #include "cmd.h"
@@ -664,6 +666,36 @@ void mlx5_ib_fence_odp_mr(struct mlx5_ib_mr *mr)
 	dma_fence_odp_mr(mr);
 }
 
+/**
+ * mlx5_ib_fence_dmabuf_mr - Stop all access to the dmabuf MR
+ * @mr: to fence
+ *
+ * On return no parallel threads will be touching this MR and no DMA will be
+ * active.
+ */
+void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
+
+	/* Prevent new page faults and prefetch requests from succeeding */
+	xa_erase(&mr->dev->odp_mkeys, mlx5_base_mkey(mr->mmkey.key));
+
+	/* Wait for all running page-fault handlers to finish. */
+	synchronize_srcu(&mr->dev->odp_srcu);
+
+	wait_event(mr->q_deferred_work, !atomic_read(&mr->num_deferred_work));
+
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	mlx5_mr_cache_invalidate(mr);
+	umem_dmabuf->private = NULL;
+	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
+
+	if (!mr->cache_ent) {
+		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
+		WARN_ON(mr->descs);
+	}
+}
+
 #define MLX5_PF_FLAGS_DOWNGRADE BIT(1)
 #define MLX5_PF_FLAGS_SNAPSHOT BIT(2)
 #define MLX5_PF_FLAGS_ENABLE BIT(3)
@@ -801,6 +833,43 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
  * Returns:
  *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
  *           not accessible, or the MR is no longer valid.
+ *  -EAGAIN: The operation should be retried
+ *
+ *  >0: Number of pages mapped
+ */
+static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr,
+			       struct ib_umem_dmabuf *umem_dmabuf,
+			       u64 user_va, size_t bcnt, u32 *bytes_mapped,
+			       u32 flags)
+{
+	int npages;
+	int err;
+	u32 xlt_flags = 0;
+
+	if (flags & MLX5_PF_FLAGS_ENABLE)
+		xlt_flags |= MLX5_IB_UPD_XLT_ENABLE;
+
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
+	if (!err)
+		err = mlx5_ib_update_mr_pas(mr, xlt_flags);
+	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
+
+	if (err)
+		return err;
+
+	if (bytes_mapped)
+		*bytes_mapped += bcnt;
+
+	npages = (ALIGN(user_va + bcnt, PAGE_SIZE) -
+		 ALIGN_DOWN(user_va, PAGE_SIZE)) >> PAGE_SHIFT;
+	return npages;
+}
+
+/*
+ * Returns:
+ *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
+ *           not accessible, or the MR is no longer valid.
  *  -EAGAIN/-ENOMEM: The operation should be retried
  *
  *  -EINVAL/others: General internal malfunction
@@ -810,22 +879,31 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
 			u32 *bytes_mapped, u32 flags)
 {
 	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
 
 	lockdep_assert_held(&mr->dev->odp_srcu);
 	if (unlikely(io_virt < mr->mmkey.iova))
 		return -EFAULT;
 
-	if (!odp->is_implicit_odp) {
+	if (is_dmabuf_mr(mr) || !odp->is_implicit_odp) {
 		u64 user_va;
+		u64 end;
 
 		if (check_add_overflow(io_virt - mr->mmkey.iova,
-				       (u64)odp->umem.address, &user_va))
+				       (u64)mr->umem->address, &user_va))
 			return -EFAULT;
-		if (unlikely(user_va >= ib_umem_end(odp) ||
-			     ib_umem_end(odp) - user_va < bcnt))
+		if (is_dmabuf_mr(mr))
+			end = mr->umem->address + mr->umem->length;
+		else
+			end = ib_umem_end(odp);
+		if (unlikely(user_va >= end || end - user_va < bcnt))
 			return -EFAULT;
-		return pagefault_real_mr(mr, odp, user_va, bcnt, bytes_mapped,
-					 flags);
+		if (is_dmabuf_mr(mr))
+			return pagefault_dmabuf_mr(mr, umem_dmabuf, user_va,
+						   bcnt, bytes_mapped, flags);
+		else
+			return pagefault_real_mr(mr, odp, user_va, bcnt,
+						 bytes_mapped, flags);
 	}
 	return pagefault_implicit_mr(mr, odp, io_virt, bcnt, bytes_mapped,
 				     flags);
@@ -845,6 +923,16 @@ int mlx5_ib_init_odp_mr(struct mlx5_ib_mr *mr, bool enable)
 	return ret >= 0 ? 0 : ret;
 }
 
+int mlx5_ib_init_dmabuf_mr(struct mlx5_ib_mr *mr)
+{
+	int ret;
+
+	ret = pagefault_dmabuf_mr(mr, to_ib_umem_dmabuf(mr->umem),
+				  mr->umem->address, mr->umem->length, NULL,
+				  MLX5_PF_FLAGS_ENABLE);
+	return ret >= 0 ? 0 : ret;
+}
+
 struct pf_frame {
 	struct pf_frame *next;
 	u32 key;
@@ -1747,7 +1835,6 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
 {
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
 	struct mlx5_core_mkey *mmkey;
-	struct ib_umem_odp *odp;
 	struct mlx5_ib_mr *mr;
 
 	lockdep_assert_held(&dev->odp_srcu);
@@ -1761,11 +1848,9 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
 	if (mr->ibmr.pd != pd)
 		return NULL;
 
-	odp = to_ib_umem_odp(mr->umem);
-
 	/* prefetch with write-access must be supported by the MR */
 	if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
-	    !odp->umem.writable)
+	    !mr->umem->writable)
 		return NULL;
 
 	return mr;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
