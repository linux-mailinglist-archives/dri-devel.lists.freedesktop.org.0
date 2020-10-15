Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8728FAE3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 23:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261266E1F2;
	Thu, 15 Oct 2020 21:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32176E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 21:48:44 +0000 (UTC)
IronPort-SDR: h6p0KUo58T2o7QAm+xTEY9AazsZiWjUGHZnsfvJFAYwAjxjg5CTKuhRKg/GazXibCysvS8H3Kb
 +ndGojc/SrOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="145771620"
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="145771620"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 14:48:44 -0700
IronPort-SDR: vok97SB612IKNty+hKFTeLPWscotwbyZk51Iq2gspUz7IAHX8YxE4FZsG57biXWy3xZcCiBCRS
 8VqJ2jZ7JZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="357866565"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga007.jf.intel.com with ESMTP; 15 Oct 2020 14:48:44 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Date: Thu, 15 Oct 2020 15:02:58 -0700
Message-Id: <1602799378-138316-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
 drivers/infiniband/hw/mlx5/mlx5_ib.h |   5 ++
 drivers/infiniband/hw/mlx5/mr.c      | 119 +++++++++++++++++++++++++++++++++++
 drivers/infiniband/hw/mlx5/odp.c     |  42 +++++++++++++
 4 files changed, 168 insertions(+)

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
index b1f2b34..65fcc18 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
 /*
  * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  */
 
 #ifndef MLX5_IB_H
@@ -1174,6 +1175,10 @@ int mlx5_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 				  u64 virt_addr, int access_flags,
 				  struct ib_udata *udata);
+struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
+					 u64 length, u64 virt_addr,
+					 int dmabuf_fd, int access_flags,
+					 struct ib_udata *udata);
 int mlx5_ib_advise_mr(struct ib_pd *pd,
 		      enum ib_uverbs_advise_mr_advice advice,
 		      u32 flags,
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index b261797..24750f1 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2013-2015, Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -1462,6 +1463,124 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	return ERR_PTR(err);
 }
 
+static int mlx5_ib_umem_dmabuf_xlt_init(struct ib_umem *umem, void *context)
+{
+	struct mlx5_ib_mr *mr = context;
+	int flags = MLX5_IB_UPD_XLT_ENABLE;
+
+	if (!mr)
+		return -EINVAL;
+
+	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags);
+}
+
+static int mlx5_ib_umem_dmabuf_xlt_update(struct ib_umem *umem, void *context)
+{
+	struct mlx5_ib_mr *mr = context;
+	int flags = MLX5_IB_UPD_XLT_ATOMIC;
+
+	if (!mr)
+		return -EINVAL;
+
+	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags);
+}
+
+static int mlx5_ib_umem_dmabuf_xlt_invalidate(struct ib_umem *umem, void *context)
+{
+	struct mlx5_ib_mr *mr = context;
+	int flags = MLX5_IB_UPD_XLT_ZAP | MLX5_IB_UPD_XLT_ATOMIC;
+
+	if (!mr)
+		return -EINVAL;
+
+	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags);
+}
+
+static struct ib_umem_dmabuf_ops mlx5_ib_umem_dmabuf_ops = {
+	.init = mlx5_ib_umem_dmabuf_xlt_init,
+	.update = mlx5_ib_umem_dmabuf_xlt_update,
+	.invalidate = mlx5_ib_umem_dmabuf_xlt_invalidate,
+};
+
+struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
+					 u64 length, u64 virt_addr,
+					 int dmabuf_fd, int access_flags,
+					 struct ib_udata *udata)
+{
+	struct mlx5_ib_dev *dev = to_mdev(pd->device);
+	struct mlx5_ib_mr *mr = NULL;
+	struct ib_umem *umem;
+	int page_shift;
+	int npages;
+	int ncont;
+	int order;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mlx5_ib_dbg(dev,
+		    "start 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
+		    start, virt_addr, length, dmabuf_fd, access_flags);
+
+	if (!mlx5_ib_can_load_pas_with_umr(dev, length))
+		return ERR_PTR(-EINVAL);
+
+	umem = ib_umem_dmabuf_get(&dev->ib_dev, start, length, dmabuf_fd,
+				  access_flags, &mlx5_ib_umem_dmabuf_ops);
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
+	page_shift = PAGE_SHIFT;
+	ncont = npages;
+	order = ilog2(roundup_pow_of_two(ncont));
+
+	mlx5_ib_dbg(dev, "npages %d, ncont %d, order %d, page_shift %d\n",
+		    npages, ncont, order, page_shift);
+
+	mr = alloc_mr_from_cache(pd, umem, virt_addr, length, ncont,
+				 page_shift, order, access_flags);
+	if (IS_ERR(mr))
+		mr = NULL;
+
+	if (!mr) {
+		mutex_lock(&dev->slow_path_mutex);
+		mr = reg_create(NULL, pd, virt_addr, length, umem, ncont,
+				page_shift, access_flags, false);
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
+	err = ib_umem_dmabuf_init_mapping(umem, mr);
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
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 5c853ec..16e2e51 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -801,6 +801,44 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
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
+	u64 user_va;
+	u64 end;
+	int npages;
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
+	if (!ib_umem_dmabuf_mapping_ready(umem))
+		return -EAGAIN;
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
@@ -811,6 +849,10 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
 {
 	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
 
+	if (mr->umem->is_dmabuf)
+		return pagefault_dmabuf_mr(mr, mr->umem, io_virt, bcnt,
+					   bytes_mapped, flags);
+
 	lockdep_assert_held(&mr->dev->odp_srcu);
 	if (unlikely(io_virt < mr->mmkey.iova))
 		return -EFAULT;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
