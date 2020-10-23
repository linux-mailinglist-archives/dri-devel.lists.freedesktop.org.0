Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C4297399
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C0F6E25B;
	Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3D76E145
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 16:26:16 +0000 (UTC)
IronPort-SDR: RtIrAqh9ilSsxurVBUZ+kbBUbSTL2aCeiDZCmXzp6IrmQBtlAiE6Dq3Q7hIexSXm6s4zdJjoJK
 9xtvdUURHg5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="167820737"
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="167820737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 09:26:15 -0700
IronPort-SDR: 0xBzPI2/b35bif2NL2fQWxUKl/CNOqjwcxYMBKxO5Mvt/Ratv83eIUU2Bmqx+Osyi5rGfArs9V
 29In0Xqn7R6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="349257214"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2020 09:26:15 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Date: Fri, 23 Oct 2020 09:40:01 -0700
Message-Id: <1603471201-32588-5-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
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
 drivers/infiniband/hw/mlx5/mlx5_ib.h |  11 ++++
 drivers/infiniband/hw/mlx5/mr.c      | 114 ++++++++++++++++++++++++++++++++++-
 drivers/infiniband/hw/mlx5/odp.c     |  70 +++++++++++++++++++--
 4 files changed, 191 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index 89e04ca..ec4ad2f 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
 /*
  * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  */
 
 #include <linux/debugfs.h>
@@ -4060,6 +4061,7 @@ static int mlx5_ib_enable_driver(struct ib_device *dev)
 	.query_srq = mlx5_ib_query_srq,
 	.query_ucontext = mlx5_ib_query_ucontext,
 	.reg_user_mr = mlx5_ib_reg_user_mr,
+	.reg_user_mr_dmabuf = mlx5_ib_reg_user_mr_dmabuf,
 	.req_notify_cq = mlx5_ib_arm_cq,
 	.rereg_user_mr = mlx5_ib_rereg_user_mr,
 	.resize_cq = mlx5_ib_resize_cq,
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index b1f2b34..4b72ff9 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
 /*
  * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  */
 
 #ifndef MLX5_IB_H
@@ -639,6 +640,12 @@ static inline bool is_odp_mr(struct mlx5_ib_mr *mr)
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
@@ -1174,6 +1181,10 @@ int mlx5_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
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
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index b261797..3bc412b 100644
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
@@ -1113,6 +1116,8 @@ int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
 		dma_sync_single_for_cpu(ddev, dma, size, DMA_TO_DEVICE);
 		if (mr->umem->is_odp) {
 			mlx5_odp_populate_xlt(xlt, idx, npages, mr, flags);
+		} else if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP)) {
+			memset(xlt, 0, size);
 		} else {
 			__mlx5_ib_populate_pas(dev, mr->umem, page_shift, idx,
 					       npages, xlt,
@@ -1462,6 +1467,111 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	return ERR_PTR(err);
 }
 
+static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
+	struct mlx5_ib_mr *mr = umem_dmabuf->device_context;
+
+	mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, MLX5_IB_UPD_XLT_ZAP);
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
+	struct ib_umem_dmabuf *umem_dmabuf;
+	int npages;
+	int order;
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
+	npages = ib_umem_num_pages(umem);
+	if (!npages) {
+		mlx5_ib_warn(dev, "avoid zero region\n");
+		ib_umem_release(umem);
+		return ERR_PTR(-EINVAL);
+	}
+
+	order = ilog2(roundup_pow_of_two(npages));
+
+	mlx5_ib_dbg(dev, "npages %d, ncont %d, order %d, page_shift %d\n",
+		    npages, npages, order, PAGE_SHIFT);
+
+	mr = alloc_mr_from_cache(pd, umem, virt_addr, length, npages,
+				 PAGE_SHIFT, order, access_flags);
+	if (IS_ERR(mr))
+		mr = NULL;
+
+	if (!mr) {
+		mutex_lock(&dev->slow_path_mutex);
+		mr = reg_create(NULL, pd, virt_addr, length, umem, npages,
+				PAGE_SHIFT, access_flags, false);
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
+	set_mr_fields(dev, mr, npages, length, access_flags);
+
+	umem_dmabuf = to_ib_umem_dmabuf(umem);
+	umem_dmabuf->device_context = mr;
+
+	err = mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT,
+				 MLX5_IB_UPD_XLT_ENABLE | MLX5_IB_UPD_XLT_ZAP);
+
+	if (err) {
+		dereg_mr(dev, mr);
+		return ERR_PTR(err);
+	}
+
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
+	return &mr->ibmr;
+error:
+	ib_umem_release(umem);
+	return ERR_PTR(err);
+}
+
 /**
  * mlx5_mr_cache_invalidate - Fence all DMA on the MR
  * @mr: The MR to fence
@@ -1536,7 +1646,7 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 	if (!mr->umem)
 		return -EINVAL;
 
-	if (is_odp_mr(mr))
+	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
 		return -EOPNOTSUPP;
 
 	if (flags & IB_MR_REREG_TRANS) {
@@ -1695,7 +1805,7 @@ static void dereg_mr(struct mlx5_ib_dev *dev, struct mlx5_ib_mr *mr)
 	struct ib_umem *umem = mr->umem;
 
 	/* Stop all DMA */
-	if (is_odp_mr(mr))
+	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
 		mlx5_ib_fence_odp_mr(mr);
 	else
 		clean_mr(dev, mr);
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 5c853ec..7bc863b 100644
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
@@ -204,6 +206,16 @@ static void dma_fence_odp_mr(struct mlx5_ib_mr *mr)
 	}
 }
 
+static void dma_fence_dmabuf_mr(struct mlx5_ib_mr *mr)
+{
+	mlx5_mr_cache_invalidate(mr);
+
+	if (!mr->cache_ent) {
+		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
+		WARN_ON(mr->descs);
+	}
+}
+
 /*
  * This must be called after the mr has been removed from implicit_children
  * and the SRCU synchronized.  NOTE: The MR does not necessarily have to be
@@ -661,6 +673,9 @@ void mlx5_ib_fence_odp_mr(struct mlx5_ib_mr *mr)
 
 	wait_event(mr->q_deferred_work, !atomic_read(&mr->num_deferred_work));
 
+	if (is_dmabuf_mr(mr))
+		return dma_fence_dmabuf_mr(mr);
+
 	dma_fence_odp_mr(mr);
 }
 
@@ -801,6 +816,52 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
  * Returns:
  *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
  *           not accessible, or the MR is no longer valid.
+ *  -EAGAIN: The operation should be retried
+ *
+ *  >0: Number of pages mapped
+ */
+static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, struct ib_umem *umem,
+			       u64 io_virt, size_t bcnt, u32 *bytes_mapped,
+			       u32 flags)
+{
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
+	u64 user_va;
+	u64 end;
+	int npages;
+	int err;
+
+	if (unlikely(io_virt < mr->mmkey.iova))
+		return -EFAULT;
+	if (check_add_overflow(io_virt - mr->mmkey.iova,
+			       (u64)umem->address, &user_va))
+		return -EFAULT;
+
+	/* Overflow has alreddy been checked at the umem creation time */
+	end = umem->address + umem->length;
+	if (unlikely(user_va >= end || end  - user_va < bcnt))
+		return -EFAULT;
+
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
+	if (!err)
+		err = mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, 0);
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
@@ -811,6 +872,10 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
 {
 	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
 
+	if (is_dmabuf_mr(mr))
+		return pagefault_dmabuf_mr(mr, mr->umem, io_virt, bcnt,
+					   bytes_mapped, flags);
+
 	lockdep_assert_held(&mr->dev->odp_srcu);
 	if (unlikely(io_virt < mr->mmkey.iova))
 		return -EFAULT;
@@ -1747,7 +1812,6 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
 {
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
 	struct mlx5_core_mkey *mmkey;
-	struct ib_umem_odp *odp;
 	struct mlx5_ib_mr *mr;
 
 	lockdep_assert_held(&dev->odp_srcu);
@@ -1761,11 +1825,9 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
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
