Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A7B282CA4
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 20:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7819889D8A;
	Sun,  4 Oct 2020 18:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2FE89D8A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 18:59:33 +0000 (UTC)
IronPort-SDR: q0RiyQ9MdfgLQIGAhqJhlxOXXtvQpZh3PdnxDhR36BwFMdtb9KZe67ieQCwvMsnaW4NFw8ZS6q
 uDjEa8SMs6vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="142693154"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="142693154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 11:59:32 -0700
IronPort-SDR: 9fjw+GYLMqW/5R7zYeyYWMDxr2L7Uw0fYRxHq5u4sY1BuRXZaa0TvnNC6cdXOMYGb/tw6fS1b2
 IvhMEPgymCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="295384656"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga007.fm.intel.com with ESMTP; 04 Oct 2020 11:59:32 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 2/4] RDMA: Expand driver memory registration methods to
 support dma-buf
Date: Sun,  4 Oct 2020 12:12:29 -0700
Message-Id: <1601838751-148544-3-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
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

For better extensibility, driver methods for user memory registration
are changed to to accept a structure instead of individual attributes
of the memory region.

To support dma-buf based memory region, a 'fd' field is added to the
the structure and a new access flag is defined.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
Reviewed-by: Sean Hefty <sean.hefty@intel.com>
Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/infiniband/core/uverbs_cmd.c            | 25 +++++++++---
 drivers/infiniband/core/verbs.c                 | 15 ++++++--
 drivers/infiniband/hw/bnxt_re/ib_verbs.c        | 23 +++++------
 drivers/infiniband/hw/bnxt_re/ib_verbs.h        |  4 +-
 drivers/infiniband/hw/cxgb4/iw_cxgb4.h          |  6 +--
 drivers/infiniband/hw/cxgb4/mem.c               | 19 ++++-----
 drivers/infiniband/hw/efa/efa.h                 |  3 +-
 drivers/infiniband/hw/efa/efa_verbs.c           | 24 ++++++------
 drivers/infiniband/hw/hns/hns_roce_device.h     |  8 ++--
 drivers/infiniband/hw/hns/hns_roce_mr.c         | 28 +++++++-------
 drivers/infiniband/hw/i40iw/i40iw_verbs.c       | 24 +++++-------
 drivers/infiniband/hw/mlx4/mlx4_ib.h            |  7 ++--
 drivers/infiniband/hw/mlx4/mr.c                 | 37 +++++++++---------
 drivers/infiniband/hw/mlx5/mlx5_ib.h            |  8 ++--
 drivers/infiniband/hw/mlx5/mr.c                 | 51 +++++++++++++------------
 drivers/infiniband/hw/mthca/mthca_provider.c    | 13 ++++---
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c     | 23 ++++++-----
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.h     |  5 ++-
 drivers/infiniband/hw/qedr/verbs.c              | 25 ++++++------
 drivers/infiniband/hw/qedr/verbs.h              |  4 +-
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c    | 12 +++---
 drivers/infiniband/hw/usnic/usnic_ib_verbs.h    |  4 +-
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c    | 24 ++++++------
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h |  4 +-
 drivers/infiniband/sw/rdmavt/mr.c               | 21 +++++-----
 drivers/infiniband/sw/rdmavt/mr.h               |  4 +-
 drivers/infiniband/sw/rxe/rxe_verbs.c           | 10 ++---
 drivers/infiniband/sw/siw/siw_verbs.c           | 26 +++++++------
 drivers/infiniband/sw/siw/siw_verbs.h           |  5 ++-
 include/rdma/ib_verbs.h                         | 21 +++++++---
 include/uapi/rdma/ib_user_ioctl_verbs.h         |  2 +
 31 files changed, 265 insertions(+), 220 deletions(-)

diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
index 2fbc583..b522204 100644
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2005, 2006, 2007 Cisco Systems.  All rights reserved.
  * Copyright (c) 2005 PathScale, Inc.  All rights reserved.
  * Copyright (c) 2006 Mellanox Technologies.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporatiion.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -694,6 +695,7 @@ static int ib_uverbs_reg_mr(struct uverbs_attr_bundle *attrs)
 	struct ib_uobject           *uobj;
 	struct ib_pd                *pd;
 	struct ib_mr                *mr;
+	struct ib_user_mr_attr	     user_mr_attr;
 	int                          ret;
 	struct ib_device *ib_dev;
 
@@ -727,8 +729,17 @@ static int ib_uverbs_reg_mr(struct uverbs_attr_bundle *attrs)
 		}
 	}
 
-	mr = pd->device->ops.reg_user_mr(pd, cmd.start, cmd.length, cmd.hca_va,
-					 cmd.access_flags,
+	if (cmd.access_flags & IB_ACCESS_DMABUF) {
+		pr_debug("Dma-buf support not available via regular reg_mr call\n");
+		ret = -EINVAL;
+		goto err_put;
+	}
+
+	user_mr_attr.start = cmd.start;
+	user_mr_attr.length = cmd.length;
+	user_mr_attr.virt_addr = cmd.hca_va;
+	user_mr_attr.access_flags = cmd.access_flags;
+	mr = pd->device->ops.reg_user_mr(pd, &user_mr_attr,
 					 &attrs->driver_udata);
 	if (IS_ERR(mr)) {
 		ret = PTR_ERR(mr);
@@ -769,6 +780,7 @@ static int ib_uverbs_rereg_mr(struct uverbs_attr_bundle *attrs)
 	struct ib_pd                *pd = NULL;
 	struct ib_mr                *mr;
 	struct ib_pd		    *old_pd;
+	struct ib_user_mr_attr	     user_mr_attr;
 	int                          ret;
 	struct ib_uobject	    *uobj;
 
@@ -811,9 +823,12 @@ static int ib_uverbs_rereg_mr(struct uverbs_attr_bundle *attrs)
 	}
 
 	old_pd = mr->pd;
-	ret = mr->device->ops.rereg_user_mr(mr, cmd.flags, cmd.start,
-					    cmd.length, cmd.hca_va,
-					    cmd.access_flags, pd,
+	user_mr_attr.start = cmd.start;
+	user_mr_attr.length = cmd.length;
+	user_mr_attr.virt_addr = cmd.hca_va;
+	user_mr_attr.access_flags = cmd.access_flags;
+	ret = mr->device->ops.rereg_user_mr(mr, cmd.flags,
+					    &user_mr_attr, pd,
 					    &attrs->driver_udata);
 	if (ret)
 		goto put_uobj_pd;
diff --git a/drivers/infiniband/core/verbs.c b/drivers/infiniband/core/verbs.c
index 3096e73..574dc26 100644
--- a/drivers/infiniband/core/verbs.c
+++ b/drivers/infiniband/core/verbs.c
@@ -1,7 +1,7 @@
 /*
  * Copyright (c) 2004 Mellanox Technologies Ltd.  All rights reserved.
  * Copyright (c) 2004 Infinicon Corporation.  All rights reserved.
- * Copyright (c) 2004 Intel Corporation.  All rights reserved.
+ * Copyright (c) 2004, 2020 Intel Corporation.  All rights reserved.
  * Copyright (c) 2004 Topspin Corporation.  All rights reserved.
  * Copyright (c) 2004 Voltaire Corporation.  All rights reserved.
  * Copyright (c) 2005 Sun Microsystems, Inc. All rights reserved.
@@ -2039,6 +2039,7 @@ int ib_resize_cq(struct ib_cq *cq, int cqe)
 struct ib_mr *ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 			     u64 virt_addr, int access_flags)
 {
+	struct ib_user_mr_attr attr;
 	struct ib_mr *mr;
 
 	if (access_flags & IB_ACCESS_ON_DEMAND) {
@@ -2049,8 +2050,16 @@ struct ib_mr *ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		}
 	}
 
-	mr = pd->device->ops.reg_user_mr(pd, start, length, virt_addr,
-					 access_flags, NULL);
+	if (access_flags & IB_ACCESS_DMABUF) {
+		pr_debug("Dma-buf support not available via kernel Verbs\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	attr.start = start;
+	attr.length = length;
+	attr.virt_addr = virt_addr;
+	attr.access_flags = access_flags;
+	mr = pd->device->ops.reg_user_mr(pd, &attr, NULL);
 
 	if (IS_ERR(mr))
 		return mr;
diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index 5ee272d..aae4861 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -3790,8 +3790,8 @@ static int fill_umem_pbl_tbl(struct ib_umem *umem, u64 *pbl_tbl_orig,
 }
 
 /* uverbs */
-struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
-				  u64 virt_addr, int mr_access_flags,
+struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd,
+				  struct ib_user_mr_attr *attr,
 				  struct ib_udata *udata)
 {
 	struct bnxt_re_pd *pd = container_of(ib_pd, struct bnxt_re_pd, ib_pd);
@@ -3801,9 +3801,9 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 	u64 *pbl_tbl = NULL;
 	int umem_pgs, page_shift, rc;
 
-	if (length > BNXT_RE_MAX_MR_SIZE) {
+	if (attr->length > BNXT_RE_MAX_MR_SIZE) {
 		ibdev_err(&rdev->ibdev, "MR Size: %lld > Max supported:%lld\n",
-			  length, BNXT_RE_MAX_MR_SIZE);
+			  attr->length, BNXT_RE_MAX_MR_SIZE);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -3813,7 +3813,7 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 
 	mr->rdev = rdev;
 	mr->qplib_mr.pd = &pd->qplib_pd;
-	mr->qplib_mr.flags = __from_ib_access_flags(mr_access_flags);
+	mr->qplib_mr.flags = __from_ib_access_flags(attr->access_flags);
 	mr->qplib_mr.type = CMDQ_ALLOCATE_MRW_MRW_FLAGS_MR;
 
 	rc = bnxt_qplib_alloc_mrw(&rdev->qplib_res, &mr->qplib_mr);
@@ -3824,7 +3824,8 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 	/* The fixed portion of the rkey is the same as the lkey */
 	mr->ib_mr.rkey = mr->qplib_mr.rkey;
 
-	umem = ib_umem_get(&rdev->ibdev, start, length, mr_access_flags);
+	umem = ib_umem_get(&rdev->ibdev, attr->start, attr->length,
+			   attr->access_flags);
 	if (IS_ERR(umem)) {
 		ibdev_err(&rdev->ibdev, "Failed to get umem");
 		rc = -EFAULT;
@@ -3832,14 +3833,14 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 	}
 	mr->ib_umem = umem;
 
-	mr->qplib_mr.va = virt_addr;
+	mr->qplib_mr.va = attr->virt_addr;
 	umem_pgs = ib_umem_page_count(umem);
 	if (!umem_pgs) {
 		ibdev_err(&rdev->ibdev, "umem is invalid!");
 		rc = -EINVAL;
 		goto free_umem;
 	}
-	mr->qplib_mr.total_size = length;
+	mr->qplib_mr.total_size = attr->length;
 
 	pbl_tbl = kcalloc(umem_pgs, sizeof(u64 *), GFP_KERNEL);
 	if (!pbl_tbl) {
@@ -3849,7 +3850,7 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 
 	page_shift = __ffs(ib_umem_find_best_pgsz(umem,
 				BNXT_RE_PAGE_SIZE_4K | BNXT_RE_PAGE_SIZE_2M,
-				virt_addr));
+				attr->virt_addr));
 
 	if (!bnxt_re_page_size_ok(page_shift)) {
 		ibdev_err(&rdev->ibdev, "umem page size unsupported!");
@@ -3858,9 +3859,9 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 	}
 
 	if (page_shift == BNXT_RE_PAGE_SHIFT_4K &&
-	    length > BNXT_RE_MAX_MR_SIZE_LOW) {
+	    attr->length > BNXT_RE_MAX_MR_SIZE_LOW) {
 		ibdev_err(&rdev->ibdev, "Requested MR Sz:%llu Max sup:%llu",
-			  length, (u64)BNXT_RE_MAX_MR_SIZE_LOW);
+			  attr->length, (u64)BNXT_RE_MAX_MR_SIZE_LOW);
 		rc = -EINVAL;
 		goto fail;
 	}
diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.h b/drivers/infiniband/hw/bnxt_re/ib_verbs.h
index 1daeb30..a7538809 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.h
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.h
@@ -206,8 +206,8 @@ struct ib_mr *bnxt_re_alloc_mr(struct ib_pd *ib_pd, enum ib_mr_type mr_type,
 struct ib_mw *bnxt_re_alloc_mw(struct ib_pd *ib_pd, enum ib_mw_type type,
 			       struct ib_udata *udata);
 int bnxt_re_dealloc_mw(struct ib_mw *mw);
-struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				  u64 virt_addr, int mr_access_flags,
+struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *pd,
+				  struct ib_user_mr_attr *attr,
 				  struct ib_udata *udata);
 int bnxt_re_alloc_ucontext(struct ib_ucontext *ctx, struct ib_udata *udata);
 void bnxt_re_dealloc_ucontext(struct ib_ucontext *context);
diff --git a/drivers/infiniband/hw/cxgb4/iw_cxgb4.h b/drivers/infiniband/hw/cxgb4/iw_cxgb4.h
index 2b2b009..9b56538 100644
--- a/drivers/infiniband/hw/cxgb4/iw_cxgb4.h
+++ b/drivers/infiniband/hw/cxgb4/iw_cxgb4.h
@@ -987,9 +987,9 @@ int c4iw_map_mr_sg(struct ib_mr *ibmr, struct scatterlist *sg, int sg_nents,
 void c4iw_dealloc(struct uld_ctx *ctx);
 struct ib_mw *c4iw_alloc_mw(struct ib_pd *pd, enum ib_mw_type type,
 			    struct ib_udata *udata);
-struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, u64 start,
-					   u64 length, u64 virt, int acc,
-					   struct ib_udata *udata);
+struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd,
+			       struct ib_user_mr_attr *attr,
+			       struct ib_udata *udata);
 struct ib_mr *c4iw_get_dma_mr(struct ib_pd *pd, int acc);
 int c4iw_dereg_mr(struct ib_mr *ib_mr, struct ib_udata *udata);
 void c4iw_destroy_cq(struct ib_cq *ib_cq, struct ib_udata *udata);
diff --git a/drivers/infiniband/hw/cxgb4/mem.c b/drivers/infiniband/hw/cxgb4/mem.c
index 73936c3..9203037 100644
--- a/drivers/infiniband/hw/cxgb4/mem.c
+++ b/drivers/infiniband/hw/cxgb4/mem.c
@@ -504,8 +504,8 @@ struct ib_mr *c4iw_get_dma_mr(struct ib_pd *pd, int acc)
 	return ERR_PTR(ret);
 }
 
-struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-			       u64 virt, int acc, struct ib_udata *udata)
+struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, struct ib_user_mr_attr *attr,
+			       struct ib_udata *udata)
 {
 	__be64 *pages;
 	int shift, n, i;
@@ -517,16 +517,16 @@ struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 
 	pr_debug("ib_pd %p\n", pd);
 
-	if (length == ~0ULL)
+	if (attr->length == ~0ULL)
 		return ERR_PTR(-EINVAL);
 
-	if ((length + start) < start)
+	if ((attr->length + attr->start) < attr->start)
 		return ERR_PTR(-EINVAL);
 
 	php = to_c4iw_pd(pd);
 	rhp = php->rhp;
 
-	if (mr_exceeds_hw_limits(rhp, length))
+	if (mr_exceeds_hw_limits(rhp, attr->length))
 		return ERR_PTR(-EINVAL);
 
 	mhp = kzalloc(sizeof(*mhp), GFP_KERNEL);
@@ -542,7 +542,8 @@ struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 
 	mhp->rhp = rhp;
 
-	mhp->umem = ib_umem_get(pd->device, start, length, acc);
+	mhp->umem = ib_umem_get(pd->device, attr->start, attr->length,
+				attr->access_flags);
 	if (IS_ERR(mhp->umem))
 		goto err_free_skb;
 
@@ -586,10 +587,10 @@ struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 
 	mhp->attr.pdid = php->pdid;
 	mhp->attr.zbva = 0;
-	mhp->attr.perms = c4iw_ib_to_tpt_access(acc);
-	mhp->attr.va_fbo = virt;
+	mhp->attr.perms = c4iw_ib_to_tpt_access(attr->access_flags);
+	mhp->attr.va_fbo = attr->virt_addr;
 	mhp->attr.page_size = shift - 12;
-	mhp->attr.len = length;
+	mhp->attr.len = attr->length;
 
 	err = register_mem(rhp, php, mhp, shift);
 	if (err)
diff --git a/drivers/infiniband/hw/efa/efa.h b/drivers/infiniband/hw/efa/efa.h
index 1889dd1..a32a55f 100644
--- a/drivers/infiniband/hw/efa/efa.h
+++ b/drivers/infiniband/hw/efa/efa.h
@@ -142,8 +142,7 @@ struct ib_qp *efa_create_qp(struct ib_pd *ibpd,
 void efa_destroy_cq(struct ib_cq *ibcq, struct ib_udata *udata);
 int efa_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 		  struct ib_udata *udata);
-struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
-			 u64 virt_addr, int access_flags,
+struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, struct ib_user_mr_attr *attr,
 			 struct ib_udata *udata);
 int efa_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata);
 int efa_get_port_immutable(struct ib_device *ibdev, u8 port_num,
diff --git a/drivers/infiniband/hw/efa/efa_verbs.c b/drivers/infiniband/hw/efa/efa_verbs.c
index 9e201f169..d1452fb 100644
--- a/drivers/infiniband/hw/efa/efa_verbs.c
+++ b/drivers/infiniband/hw/efa/efa_verbs.c
@@ -1346,8 +1346,7 @@ static int efa_create_pbl(struct efa_dev *dev,
 	return 0;
 }
 
-struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
-			 u64 virt_addr, int access_flags,
+struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, struct ib_user_mr_attr *attr,
 			 struct ib_udata *udata)
 {
 	struct efa_dev *dev = to_edev(ibpd->device);
@@ -1372,11 +1371,11 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 		IB_ACCESS_LOCAL_WRITE |
 		(is_rdma_read_cap(dev) ? IB_ACCESS_REMOTE_READ : 0);
 
-	access_flags &= ~IB_ACCESS_OPTIONAL;
-	if (access_flags & ~supp_access_flags) {
+	attr->access_flags &= ~IB_ACCESS_OPTIONAL;
+	if (attr->access_flags & ~supp_access_flags) {
 		ibdev_dbg(&dev->ibdev,
 			  "Unsupported access flags[%#x], supported[%#x]\n",
-			  access_flags, supp_access_flags);
+			  attr->access_flags, supp_access_flags);
 		err = -EOPNOTSUPP;
 		goto err_out;
 	}
@@ -1387,7 +1386,8 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 		goto err_out;
 	}
 
-	mr->umem = ib_umem_get(ibpd->device, start, length, access_flags);
+	mr->umem = ib_umem_get(ibpd->device, attr->start, attr->length,
+			       attr->access_flags);
 	if (IS_ERR(mr->umem)) {
 		err = PTR_ERR(mr->umem);
 		ibdev_dbg(&dev->ibdev,
@@ -1396,13 +1396,13 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 	}
 
 	params.pd = to_epd(ibpd)->pdn;
-	params.iova = virt_addr;
-	params.mr_length_in_bytes = length;
-	params.permissions = access_flags;
+	params.iova = attr->virt_addr;
+	params.mr_length_in_bytes = attr->length;
+	params.permissions = attr->access_flags;
 
 	pg_sz = ib_umem_find_best_pgsz(mr->umem,
 				       dev->dev_attr.page_size_cap,
-				       virt_addr);
+				       attr->virt_addr);
 	if (!pg_sz) {
 		err = -EOPNOTSUPP;
 		ibdev_dbg(&dev->ibdev, "Failed to find a suitable page size in page_size_cap %#llx\n",
@@ -1416,7 +1416,7 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 
 	ibdev_dbg(&dev->ibdev,
 		  "start %#llx length %#llx params.page_shift %u params.page_num %u\n",
-		  start, length, params.page_shift, params.page_num);
+		  attr->start, attr->length, params.page_shift, params.page_num);
 
 	inline_size = ARRAY_SIZE(params.pbl.inline_pbl_array);
 	if (params.page_num <= inline_size) {
@@ -1441,7 +1441,7 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 
 	mr->ibmr.lkey = result.l_key;
 	mr->ibmr.rkey = result.r_key;
-	mr->ibmr.length = length;
+	mr->ibmr.length = attr->length;
 	ibdev_dbg(&dev->ibdev, "Registered mr[%d]\n", mr->ibmr.lkey);
 
 	return &mr->ibmr;
diff --git a/drivers/infiniband/hw/hns/hns_roce_device.h b/drivers/infiniband/hw/hns/hns_roce_device.h
index 6edcbdc..c94589d 100644
--- a/drivers/infiniband/hw/hns/hns_roce_device.h
+++ b/drivers/infiniband/hw/hns/hns_roce_device.h
@@ -1184,11 +1184,11 @@ int hns_roce_create_ah(struct ib_ah *ah, struct rdma_ah_init_attr *init_attr,
 void hns_roce_dealloc_pd(struct ib_pd *pd, struct ib_udata *udata);
 
 struct ib_mr *hns_roce_get_dma_mr(struct ib_pd *pd, int acc);
-struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				   u64 virt_addr, int access_flags,
+struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd,
+				   struct ib_user_mr_attr *attr,
 				   struct ib_udata *udata);
-int hns_roce_rereg_user_mr(struct ib_mr *mr, int flags, u64 start, u64 length,
-			   u64 virt_addr, int mr_access_flags, struct ib_pd *pd,
+int hns_roce_rereg_user_mr(struct ib_mr *mr, int flags,
+			   struct ib_user_mr_attr *attr, struct ib_pd *pd,
 			   struct ib_udata *udata);
 struct ib_mr *hns_roce_alloc_mr(struct ib_pd *pd, enum ib_mr_type mr_type,
 				u32 max_num_sg);
diff --git a/drivers/infiniband/hw/hns/hns_roce_mr.c b/drivers/infiniband/hw/hns/hns_roce_mr.c
index e5df388..1e8ebba 100644
--- a/drivers/infiniband/hw/hns/hns_roce_mr.c
+++ b/drivers/infiniband/hw/hns/hns_roce_mr.c
@@ -259,8 +259,8 @@ struct ib_mr *hns_roce_get_dma_mr(struct ib_pd *pd, int acc)
 	return ERR_PTR(ret);
 }
 
-struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				   u64 virt_addr, int access_flags,
+struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd,
+				   struct ib_user_mr_attr *attr,
 				   struct ib_udata *udata)
 {
 	struct hns_roce_dev *hr_dev = to_hr_dev(pd->device);
@@ -272,12 +272,13 @@ struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		return ERR_PTR(-ENOMEM);
 
 	mr->type = MR_TYPE_MR;
-	ret = alloc_mr_key(hr_dev, mr, to_hr_pd(pd)->pdn, virt_addr, length,
-			   access_flags);
+	ret = alloc_mr_key(hr_dev, mr, to_hr_pd(pd)->pdn, attr->virt_addr,
+			   attr->length, attr->access_flags);
 	if (ret)
 		goto err_alloc_mr;
 
-	ret = alloc_mr_pbl(hr_dev, mr, length, udata, start, access_flags);
+	ret = alloc_mr_pbl(hr_dev, mr, attr->length, udata, attr->start,
+			   attr->access_flags);
 	if (ret)
 		goto err_alloc_key;
 
@@ -286,7 +287,7 @@ struct ib_mr *hns_roce_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		goto err_alloc_pbl;
 
 	mr->ibmr.rkey = mr->ibmr.lkey = mr->key;
-	mr->ibmr.length = length;
+	mr->ibmr.length = attr->length;
 
 	return &mr->ibmr;
 
@@ -328,8 +329,8 @@ static int rereg_mr_trans(struct ib_mr *ibmr, int flags,
 	return ret;
 }
 
-int hns_roce_rereg_user_mr(struct ib_mr *ibmr, int flags, u64 start, u64 length,
-			   u64 virt_addr, int mr_access_flags, struct ib_pd *pd,
+int hns_roce_rereg_user_mr(struct ib_mr *ibmr, int flags,
+			   struct ib_user_mr_attr *attr,
 			   struct ib_udata *udata)
 {
 	struct hns_roce_dev *hr_dev = to_hr_dev(ibmr->device);
@@ -365,15 +366,16 @@ int hns_roce_rereg_user_mr(struct ib_mr *ibmr, int flags, u64 start, u64 length,
 
 	if (flags & IB_MR_REREG_TRANS) {
 		ret = rereg_mr_trans(ibmr, flags,
-				     start, length,
-				     virt_addr, mr_access_flags,
+				     attr->start, attr->length,
+				     attr->virt_addr, attr->access_flags,
 				     mailbox, pdn, udata);
 		if (ret)
 			goto free_cmd_mbox;
 	} else {
 		ret = hr_dev->hw->rereg_write_mtpt(hr_dev, mr, flags, pdn,
-						   mr_access_flags, virt_addr,
-						   length, mailbox->buf);
+						   attr->access_flags,
+						   attr->virt_addr,
+						   attr->length, mailbox->buf);
 		if (ret)
 			goto free_cmd_mbox;
 	}
@@ -386,7 +388,7 @@ int hns_roce_rereg_user_mr(struct ib_mr *ibmr, int flags, u64 start, u64 length,
 
 	mr->enabled = 1;
 	if (flags & IB_MR_REREG_ACCESS)
-		mr->access = mr_access_flags;
+		mr->access = attr->access_flags;
 
 	hns_roce_free_cmd_mailbox(hr_dev, mailbox);
 
diff --git a/drivers/infiniband/hw/i40iw/i40iw_verbs.c b/drivers/infiniband/hw/i40iw/i40iw_verbs.c
index b513393..4c3ca7e 100644
--- a/drivers/infiniband/hw/i40iw/i40iw_verbs.c
+++ b/drivers/infiniband/hw/i40iw/i40iw_verbs.c
@@ -1722,17 +1722,11 @@ static int i40iw_hwreg_mr(struct i40iw_device *iwdev,
 /**
  * i40iw_reg_user_mr - Register a user memory region
  * @pd: ptr of pd
- * @start: virtual start address
- * @length: length of mr
- * @virt: virtual address
- * @acc: access of mr
+ * @attr: attributes for user mr
  * @udata: user data
  */
 static struct ib_mr *i40iw_reg_user_mr(struct ib_pd *pd,
-				       u64 start,
-				       u64 length,
-				       u64 virt,
-				       int acc,
+				       struct ib_user_mr_attr *attr,
 				       struct ib_udata *udata)
 {
 	struct i40iw_pd *iwpd = to_iwpd(pd);
@@ -1760,9 +1754,11 @@ static struct ib_mr *i40iw_reg_user_mr(struct ib_pd *pd,
 	if (iwdev->closing)
 		return ERR_PTR(-ENODEV);
 
-	if (length > I40IW_MAX_MR_SIZE)
+	if (attr->length > I40IW_MAX_MR_SIZE)
 		return ERR_PTR(-EINVAL);
-	region = ib_umem_get(pd->device, start, length, acc);
+
+	region = ib_umem_get(pd->device, attr->start, attr->length,
+			     attr->access_flags);
 	if (IS_ERR(region))
 		return (struct ib_mr *)region;
 
@@ -1786,15 +1782,15 @@ static struct ib_mr *i40iw_reg_user_mr(struct ib_pd *pd,
 	iwmr->page_size = PAGE_SIZE;
 	if (req.reg_type == IW_MEMREG_TYPE_MEM)
 		iwmr->page_size = ib_umem_find_best_pgsz(region, SZ_4K | SZ_2M,
-							 virt);
+							 attr->virt_addr);
 
-	region_length = region->length + (start & (iwmr->page_size - 1));
+	region_length = region->length + (attr->start & (iwmr->page_size - 1));
 	pg_shift = ffs(iwmr->page_size) - 1;
 	pbl_depth = region_length >> pg_shift;
 	pbl_depth += (region_length & (iwmr->page_size - 1)) ? 1 : 0;
 	iwmr->length = region->length;
 
-	iwpbl->user_base = virt;
+	iwpbl->user_base = attr->virt_addr;
 	palloc = &iwpbl->pble_alloc;
 
 	iwmr->type = req.reg_type;
@@ -1838,7 +1834,7 @@ static struct ib_mr *i40iw_reg_user_mr(struct ib_pd *pd,
 			}
 		}
 
-		access |= i40iw_get_user_access(acc);
+		access |= i40iw_get_user_access(attr->access_flags);
 		stag = i40iw_create_stag(iwdev);
 		if (!stag) {
 			err = -ENOMEM;
diff --git a/drivers/infiniband/hw/mlx4/mlx4_ib.h b/drivers/infiniband/hw/mlx4/mlx4_ib.h
index 38e87a7..52c41ef 100644
--- a/drivers/infiniband/hw/mlx4/mlx4_ib.h
+++ b/drivers/infiniband/hw/mlx4/mlx4_ib.h
@@ -721,8 +721,8 @@ int mlx4_ib_db_map_user(struct ib_udata *udata, unsigned long virt,
 struct ib_mr *mlx4_ib_get_dma_mr(struct ib_pd *pd, int acc);
 int mlx4_ib_umem_write_mtt(struct mlx4_ib_dev *dev, struct mlx4_mtt *mtt,
 			   struct ib_umem *umem);
-struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				  u64 virt_addr, int access_flags,
+struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd,
+				  struct ib_user_mr_attr *attr,
 				  struct ib_udata *udata);
 int mlx4_ib_dereg_mr(struct ib_mr *mr, struct ib_udata *udata);
 struct ib_mw *mlx4_ib_alloc_mw(struct ib_pd *pd, enum ib_mw_type type,
@@ -876,8 +876,7 @@ void mlx4_ib_slave_alias_guid_event(struct mlx4_ib_dev *dev, int slave,
 int mlx4_ib_steer_qp_reg(struct mlx4_ib_dev *mdev, struct mlx4_ib_qp *mqp,
 			 int is_attach);
 int mlx4_ib_rereg_user_mr(struct ib_mr *mr, int flags,
-			  u64 start, u64 length, u64 virt_addr,
-			  int mr_access_flags, struct ib_pd *pd,
+			  struct ib_user_mr_attr *attr, struct ib_pd *pd,
 			  struct ib_udata *udata);
 int mlx4_ib_gid_index_to_real_index(struct mlx4_ib_dev *ibdev,
 				    const struct ib_gid_attr *attr);
diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4/mr.c
index 1d5ef0d..79752f2c 100644
--- a/drivers/infiniband/hw/mlx4/mr.c
+++ b/drivers/infiniband/hw/mlx4/mr.c
@@ -401,8 +401,8 @@ static struct ib_umem *mlx4_get_umem_mr(struct ib_device *device, u64 start,
 	return ib_umem_get(device, start, length, access_flags);
 }
 
-struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				  u64 virt_addr, int access_flags,
+struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd,
+				  struct ib_user_mr_attr *attr,
 				  struct ib_udata *udata)
 {
 	struct mlx4_ib_dev *dev = to_mdev(pd->device);
@@ -415,17 +415,19 @@ struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	if (!mr)
 		return ERR_PTR(-ENOMEM);
 
-	mr->umem = mlx4_get_umem_mr(pd->device, start, length, access_flags);
+	mr->umem = mlx4_get_umem_mr(pd->device, attr->start, attr->length,
+				    attr->access_flags);
 	if (IS_ERR(mr->umem)) {
 		err = PTR_ERR(mr->umem);
 		goto err_free;
 	}
 
 	n = ib_umem_page_count(mr->umem);
-	shift = mlx4_ib_umem_calc_optimal_mtt_size(mr->umem, start, &n);
+	shift = mlx4_ib_umem_calc_optimal_mtt_size(mr->umem, attr->start, &n);
 
-	err = mlx4_mr_alloc(dev->dev, to_mpd(pd)->pdn, virt_addr, length,
-			    convert_access(access_flags), n, shift, &mr->mmr);
+	err = mlx4_mr_alloc(dev->dev, to_mpd(pd)->pdn, attr->virt_addr,
+			    attr->length, convert_access(attr->access_flags),
+			    n, shift, &mr->mmr);
 	if (err)
 		goto err_umem;
 
@@ -438,7 +440,7 @@ struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		goto err_mr;
 
 	mr->ibmr.rkey = mr->ibmr.lkey = mr->mmr.key;
-	mr->ibmr.length = length;
+	mr->ibmr.length = attr->length;
 	mr->ibmr.page_size = 1U << shift;
 
 	return &mr->ibmr;
@@ -456,8 +458,7 @@ struct ib_mr *mlx4_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 }
 
 int mlx4_ib_rereg_user_mr(struct ib_mr *mr, int flags,
-			  u64 start, u64 length, u64 virt_addr,
-			  int mr_access_flags, struct ib_pd *pd,
+			  struct ib_user_mr_attr *attr, struct ib_pd *pd,
 			  struct ib_udata *udata)
 {
 	struct mlx4_ib_dev *dev = to_mdev(mr->device);
@@ -484,14 +485,14 @@ int mlx4_ib_rereg_user_mr(struct ib_mr *mr, int flags,
 	}
 
 	if (flags & IB_MR_REREG_ACCESS) {
-		if (ib_access_writable(mr_access_flags) &&
+		if (ib_access_writable(attr->access_flags) &&
 		    !mmr->umem->writable) {
 			err = -EPERM;
 			goto release_mpt_entry;
 		}
 
 		err = mlx4_mr_hw_change_access(dev->dev, *pmpt_entry,
-					       convert_access(mr_access_flags));
+					       convert_access(attr->access_flags));
 
 		if (err)
 			goto release_mpt_entry;
@@ -503,8 +504,8 @@ int mlx4_ib_rereg_user_mr(struct ib_mr *mr, int flags,
 
 		mlx4_mr_rereg_mem_cleanup(dev->dev, &mmr->mmr);
 		ib_umem_release(mmr->umem);
-		mmr->umem = mlx4_get_umem_mr(mr->device, start, length,
-					     mr_access_flags);
+		mmr->umem = mlx4_get_umem_mr(mr->device, attr->start, attr->length,
+					     attr->access_flags);
 		if (IS_ERR(mmr->umem)) {
 			err = PTR_ERR(mmr->umem);
 			/* Prevent mlx4_ib_dereg_mr from free'ing invalid pointer */
@@ -515,14 +516,14 @@ int mlx4_ib_rereg_user_mr(struct ib_mr *mr, int flags,
 		shift = PAGE_SHIFT;
 
 		err = mlx4_mr_rereg_mem_write(dev->dev, &mmr->mmr,
-					      virt_addr, length, n, shift,
-					      *pmpt_entry);
+					      attr->virt_addr, attr->length,
+					      n, shift, *pmpt_entry);
 		if (err) {
 			ib_umem_release(mmr->umem);
 			goto release_mpt_entry;
 		}
-		mmr->mmr.iova       = virt_addr;
-		mmr->mmr.size       = length;
+		mmr->mmr.iova       = attr->virt_addr;
+		mmr->mmr.size       = attr->length;
 
 		err = mlx4_ib_umem_write_mtt(dev, &mmr->mmr.mtt, mmr->umem);
 		if (err) {
@@ -537,7 +538,7 @@ int mlx4_ib_rereg_user_mr(struct ib_mr *mr, int flags,
 	 */
 	err = mlx4_mr_hw_write_mpt(dev->dev, &mmr->mmr, pmpt_entry);
 	if (!err && flags & IB_MR_REREG_ACCESS)
-		mmr->mmr.access = mr_access_flags;
+		mmr->mmr.access = attr->access_flags;
 
 release_mpt_entry:
 	mlx4_mr_hw_put_mpt(dev->dev, pmpt_entry);
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index 5287fc8..76b376b 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1154,8 +1154,8 @@ int mlx5_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 int mlx5_ib_modify_cq(struct ib_cq *cq, u16 cq_count, u16 cq_period);
 int mlx5_ib_resize_cq(struct ib_cq *ibcq, int entries, struct ib_udata *udata);
 struct ib_mr *mlx5_ib_get_dma_mr(struct ib_pd *pd, int acc);
-struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				  u64 virt_addr, int access_flags,
+struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd,
+				  struct ib_user_mr_attr *attr,
 				  struct ib_udata *udata);
 int mlx5_ib_advise_mr(struct ib_pd *pd,
 		      enum ib_uverbs_advise_mr_advice advice,
@@ -1173,8 +1173,8 @@ struct mlx5_ib_mr *mlx5_ib_alloc_implicit_mr(struct mlx5_ib_pd *pd,
 					     int access_flags);
 void mlx5_ib_free_implicit_mr(struct mlx5_ib_mr *mr);
 void mlx5_ib_fence_odp_mr(struct mlx5_ib_mr *mr);
-int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
-			  u64 length, u64 virt_addr, int access_flags,
+int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags,
+			  struct ib_user_mr_attr *attr,
 			  struct ib_pd *pd, struct ib_udata *udata);
 int mlx5_ib_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata);
 struct ib_mr *mlx5_ib_alloc_mr(struct ib_pd *pd, enum ib_mr_type mr_type,
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 3e6f2f9..3c91e32 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1347,8 +1347,8 @@ struct ib_mr *mlx5_ib_reg_dm_mr(struct ib_pd *pd, struct ib_dm *dm,
 				 attr->access_flags, mode);
 }
 
-struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				  u64 virt_addr, int access_flags,
+struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd,
+				  struct ib_user_mr_attr *attr,
 				  struct ib_udata *udata)
 {
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
@@ -1365,39 +1365,41 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		return ERR_PTR(-EOPNOTSUPP);
 
 	mlx5_ib_dbg(dev, "start 0x%llx, virt_addr 0x%llx, length 0x%llx, access_flags 0x%x\n",
-		    start, virt_addr, length, access_flags);
+		    attr->start, attr->virt_addr, attr->length, attr->access_flags);
 
-	if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING) && !start &&
-	    length == U64_MAX) {
-		if (virt_addr != start)
+	if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING) && !attr->start &&
+	    attr->length == U64_MAX) {
+		if (attr->virt_addr != attr->start)
 			return ERR_PTR(-EINVAL);
-		if (!(access_flags & IB_ACCESS_ON_DEMAND) ||
+		if (!(attr->access_flags & IB_ACCESS_ON_DEMAND) ||
 		    !(dev->odp_caps.general_caps & IB_ODP_SUPPORT_IMPLICIT))
 			return ERR_PTR(-EINVAL);
 
-		mr = mlx5_ib_alloc_implicit_mr(to_mpd(pd), udata, access_flags);
+		mr = mlx5_ib_alloc_implicit_mr(to_mpd(pd), udata,
+					       attr->access_flags);
 		if (IS_ERR(mr))
 			return ERR_CAST(mr);
 		return &mr->ibmr;
 	}
 
-	err = mr_umem_get(dev, start, length, access_flags, &umem,
+	err = mr_umem_get(dev, attr->start, attr->length,
+			  attr->access_flags, &umem,
 			  &npages, &page_shift, &ncont, &order);
-
 	if (err < 0)
 		return ERR_PTR(err);
 
-	use_umr = mlx5_ib_can_use_umr(dev, true, access_flags);
+	use_umr = mlx5_ib_can_use_umr(dev, true, attr->access_flags);
 
 	if (order <= mr_cache_max_order(dev) && use_umr) {
-		mr = alloc_mr_from_cache(pd, umem, virt_addr, length, ncont,
-					 page_shift, order, access_flags);
+		mr = alloc_mr_from_cache(pd, umem, attr->virt_addr,
+					 attr->length, ncont, page_shift,
+					 order, attr->access_flags);
 		if (PTR_ERR(mr) == -EAGAIN) {
 			mlx5_ib_dbg(dev, "cache empty for order %d\n", order);
 			mr = NULL;
 		}
 	} else if (!MLX5_CAP_GEN(dev->mdev, umr_extended_translation_offset)) {
-		if (access_flags & IB_ACCESS_ON_DEMAND) {
+		if (attr->access_flags & IB_ACCESS_ON_DEMAND) {
 			err = -EINVAL;
 			pr_err("Got MR registration for ODP MR > 512MB, not supported for Connect-IB\n");
 			goto error;
@@ -1407,8 +1409,9 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 
 	if (!mr) {
 		mutex_lock(&dev->slow_path_mutex);
-		mr = reg_create(NULL, pd, virt_addr, length, umem, ncont,
-				page_shift, access_flags, !use_umr);
+		mr = reg_create(NULL, pd, attr->virt_addr, attr->length, umem,
+				ncont, page_shift, attr->access_flags,
+				!use_umr);
 		mutex_unlock(&dev->slow_path_mutex);
 	}
 
@@ -1420,12 +1423,12 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	mlx5_ib_dbg(dev, "mkey 0x%x\n", mr->mmkey.key);
 
 	mr->umem = umem;
-	set_mr_fields(dev, mr, npages, length, access_flags);
+	set_mr_fields(dev, mr, npages, attr->length, attr->access_flags);
 
 	if (use_umr) {
 		int update_xlt_flags = MLX5_IB_UPD_XLT_ENABLE;
 
-		if (access_flags & IB_ACCESS_ON_DEMAND)
+		if (attr->access_flags & IB_ACCESS_ON_DEMAND)
 			update_xlt_flags |= MLX5_IB_UPD_XLT_ZAP;
 
 		err = mlx5_ib_update_xlt(mr, 0, ncont, page_shift,
@@ -1504,15 +1507,15 @@ static int rereg_umr(struct ib_pd *pd, struct mlx5_ib_mr *mr,
 	return err;
 }
 
-int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
-			  u64 length, u64 virt_addr, int new_access_flags,
+int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags,
+			  struct ib_user_mr_attr *attr,
 			  struct ib_pd *new_pd, struct ib_udata *udata)
 {
 	struct mlx5_ib_dev *dev = to_mdev(ib_mr->device);
 	struct mlx5_ib_mr *mr = to_mmr(ib_mr);
 	struct ib_pd *pd = (flags & IB_MR_REREG_PD) ? new_pd : ib_mr->pd;
 	int access_flags = flags & IB_MR_REREG_ACCESS ?
-			    new_access_flags :
+			    attr->access_flags :
 			    mr->access_flags;
 	int page_shift = 0;
 	int upd_flags = 0;
@@ -1523,7 +1526,7 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 	int err;
 
 	mlx5_ib_dbg(dev, "start 0x%llx, virt_addr 0x%llx, length 0x%llx, access_flags 0x%x\n",
-		    start, virt_addr, length, access_flags);
+		    attr->start, attr->virt_addr, attr->length, access_flags);
 
 	atomic_sub(mr->npages, &dev->mdev->priv.reg_pages);
 
@@ -1534,8 +1537,8 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 		return -EOPNOTSUPP;
 
 	if (flags & IB_MR_REREG_TRANS) {
-		addr = virt_addr;
-		len = length;
+		addr = attr->virt_addr;
+		len = attr->length;
 	} else {
 		addr = mr->umem->address;
 		len = mr->umem->length;
diff --git a/drivers/infiniband/hw/mthca/mthca_provider.c b/drivers/infiniband/hw/mthca/mthca_provider.c
index 9fa2f91..2f15a36 100644
--- a/drivers/infiniband/hw/mthca/mthca_provider.c
+++ b/drivers/infiniband/hw/mthca/mthca_provider.c
@@ -842,8 +842,9 @@ static struct ib_mr *mthca_get_dma_mr(struct ib_pd *pd, int acc)
 	return &mr->ibmr;
 }
 
-static struct ib_mr *mthca_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				       u64 virt, int acc, struct ib_udata *udata)
+static struct ib_mr *mthca_reg_user_mr(struct ib_pd *pd,
+				       struct ib_user_mr_attr *attr,
+				       struct ib_udata *udata)
 {
 	struct mthca_dev *dev = to_mdev(pd->device);
 	struct sg_dma_page_iter sg_iter;
@@ -871,7 +872,8 @@ static struct ib_mr *mthca_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	if (!mr)
 		return ERR_PTR(-ENOMEM);
 
-	mr->umem = ib_umem_get(pd->device, start, length, acc);
+	mr->umem = ib_umem_get(pd->device, attr->start, attr->length,
+			       attr->access_flags);
 	if (IS_ERR(mr->umem)) {
 		err = PTR_ERR(mr->umem);
 		goto err;
@@ -918,8 +920,9 @@ static struct ib_mr *mthca_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	if (err)
 		goto err_mtt;
 
-	err = mthca_mr_alloc(dev, to_mpd(pd)->pd_num, PAGE_SHIFT, virt, length,
-			     convert_access(acc), mr);
+	err = mthca_mr_alloc(dev, to_mpd(pd)->pd_num, PAGE_SHIFT, attr->virt,
+			     attr->length, convert_access(attr->access_flags),
+			     mr);
 
 	if (err)
 		goto err_mtt;
diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index c1751c9..7b1081a 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -850,8 +850,9 @@ static void build_user_pbes(struct ocrdma_dev *dev, struct ocrdma_mr *mr,
 	}
 }
 
-struct ib_mr *ocrdma_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
-				 u64 usr_addr, int acc, struct ib_udata *udata)
+struct ib_mr *ocrdma_reg_user_mr(struct ib_pd *ibpd,
+				 struct ib_user_mr_attr *attr,
+				 struct ib_udata *udata)
 {
 	int status = -ENOMEM;
 	struct ocrdma_dev *dev = get_ocrdma_dev(ibpd->device);
@@ -867,7 +868,9 @@ struct ib_mr *ocrdma_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
 	mr = kzalloc(sizeof(*mr), GFP_KERNEL);
 	if (!mr)
 		return ERR_PTR(status);
-	mr->umem = ib_umem_get(ibpd->device, start, len, acc);
+
+	mr->umem = ib_umem_get(ibpd->device, attr->start, attr->length,
+			       attr->access_flags);
 	if (IS_ERR(mr->umem)) {
 		status = -EFAULT;
 		goto umem_err;
@@ -879,18 +882,18 @@ struct ib_mr *ocrdma_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
 
 	mr->hwmr.pbe_size = PAGE_SIZE;
 	mr->hwmr.fbo = ib_umem_offset(mr->umem);
-	mr->hwmr.va = usr_addr;
-	mr->hwmr.len = len;
-	mr->hwmr.remote_wr = (acc & IB_ACCESS_REMOTE_WRITE) ? 1 : 0;
-	mr->hwmr.remote_rd = (acc & IB_ACCESS_REMOTE_READ) ? 1 : 0;
-	mr->hwmr.local_wr = (acc & IB_ACCESS_LOCAL_WRITE) ? 1 : 0;
+	mr->hwmr.va = attr->virt_addr;
+	mr->hwmr.len = attr->length;
+	mr->hwmr.remote_wr = (attr->access_flags & IB_ACCESS_REMOTE_WRITE) ? 1 : 0;
+	mr->hwmr.remote_rd = (attr->access_flags & IB_ACCESS_REMOTE_READ) ? 1 : 0;
+	mr->hwmr.local_wr = (attr->access_flags & IB_ACCESS_LOCAL_WRITE) ? 1 : 0;
 	mr->hwmr.local_rd = 1;
-	mr->hwmr.remote_atomic = (acc & IB_ACCESS_REMOTE_ATOMIC) ? 1 : 0;
+	mr->hwmr.remote_atomic = (attr->access_flags & IB_ACCESS_REMOTE_ATOMIC) ? 1 : 0;
 	status = ocrdma_build_pbl_tbl(dev, &mr->hwmr);
 	if (status)
 		goto umem_err;
 	build_user_pbes(dev, mr, num_pbes);
-	status = ocrdma_reg_mr(dev, &mr->hwmr, pd->id, acc);
+	status = ocrdma_reg_mr(dev, &mr->hwmr, pd->id, attr->access_flags);
 	if (status)
 		goto mbx_err;
 	mr->ibmr.lkey = mr->hwmr.lkey;
diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.h b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.h
index df8e3b9..da9cf809 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.h
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.h
@@ -98,8 +98,9 @@ int ocrdma_post_srq_recv(struct ib_srq *, const struct ib_recv_wr *,
 
 int ocrdma_dereg_mr(struct ib_mr *ib_mr, struct ib_udata *udata);
 struct ib_mr *ocrdma_get_dma_mr(struct ib_pd *, int acc);
-struct ib_mr *ocrdma_reg_user_mr(struct ib_pd *, u64 start, u64 length,
-				 u64 virt, int acc, struct ib_udata *);
+struct ib_mr *ocrdma_reg_user_mr(struct ib_pd *,
+				 struct ib_user_mr_attr *attr,
+				 struct ib_udata *);
 struct ib_mr *ocrdma_alloc_mr(struct ib_pd *pd, enum ib_mr_type mr_type,
 			      u32 max_num_sg);
 int ocrdma_map_mr_sg(struct ib_mr *ibmr, struct scatterlist *sg, int sg_nents,
diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index b49bef9..2ffaf92 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -2833,8 +2833,8 @@ static int init_mr_info(struct qedr_dev *dev, struct mr_info *info,
 	return rc;
 }
 
-struct ib_mr *qedr_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
-			       u64 usr_addr, int acc, struct ib_udata *udata)
+struct ib_mr *qedr_reg_user_mr(struct ib_pd *ibpd, struct ib_user_mr_attr *attr,
+			       struct ib_udata *udata)
 {
 	struct qedr_dev *dev = get_qedr_dev(ibpd->device);
 	struct qedr_mr *mr;
@@ -2844,9 +2844,11 @@ struct ib_mr *qedr_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
 	pd = get_qedr_pd(ibpd);
 	DP_DEBUG(dev, QEDR_MSG_MR,
 		 "qedr_register user mr pd = %d start = %lld, len = %lld, usr_addr = %lld, acc = %d\n",
-		 pd->pd_id, start, len, usr_addr, acc);
+		 pd->pd_id, attr->start, attr->length, attr->virt_addr,
+		 attr->access_flags);
 
-	if (acc & IB_ACCESS_REMOTE_WRITE && !(acc & IB_ACCESS_LOCAL_WRITE))
+	if (attr->access_flags & IB_ACCESS_REMOTE_WRITE &&
+	    !(attr->access_flags & IB_ACCESS_LOCAL_WRITE))
 		return ERR_PTR(-EINVAL);
 
 	mr = kzalloc(sizeof(*mr), GFP_KERNEL);
@@ -2855,7 +2857,8 @@ struct ib_mr *qedr_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
 
 	mr->type = QEDR_MR_USER;
 
-	mr->umem = ib_umem_get(ibpd->device, start, len, acc);
+	mr->umem = ib_umem_get(ibpd->device, attr->start, attr->length,
+			       attr->access_flags);
 	if (IS_ERR(mr->umem)) {
 		rc = -EFAULT;
 		goto err0;
@@ -2879,18 +2882,18 @@ struct ib_mr *qedr_reg_user_mr(struct ib_pd *ibpd, u64 start, u64 len,
 	mr->hw_mr.key = 0;
 	mr->hw_mr.pd = pd->pd_id;
 	mr->hw_mr.local_read = 1;
-	mr->hw_mr.local_write = (acc & IB_ACCESS_LOCAL_WRITE) ? 1 : 0;
-	mr->hw_mr.remote_read = (acc & IB_ACCESS_REMOTE_READ) ? 1 : 0;
-	mr->hw_mr.remote_write = (acc & IB_ACCESS_REMOTE_WRITE) ? 1 : 0;
-	mr->hw_mr.remote_atomic = (acc & IB_ACCESS_REMOTE_ATOMIC) ? 1 : 0;
+	mr->hw_mr.local_write = (attr->access_flags & IB_ACCESS_LOCAL_WRITE) ? 1 : 0;
+	mr->hw_mr.remote_read = (attr->access_flags & IB_ACCESS_REMOTE_READ) ? 1 : 0;
+	mr->hw_mr.remote_write = (attr->access_flags & IB_ACCESS_REMOTE_WRITE) ? 1 : 0;
+	mr->hw_mr.remote_atomic = (attr->access_flags & IB_ACCESS_REMOTE_ATOMIC) ? 1 : 0;
 	mr->hw_mr.mw_bind = false;
 	mr->hw_mr.pbl_ptr = mr->info.pbl_table[0].pa;
 	mr->hw_mr.pbl_two_level = mr->info.pbl_info.two_layered;
 	mr->hw_mr.pbl_page_size_log = ilog2(mr->info.pbl_info.pbl_size);
 	mr->hw_mr.page_size_log = PAGE_SHIFT;
 	mr->hw_mr.fbo = ib_umem_offset(mr->umem);
-	mr->hw_mr.length = len;
-	mr->hw_mr.vaddr = usr_addr;
+	mr->hw_mr.length = attr->length;
+	mr->hw_mr.vaddr = attr->virt_addr;
 	mr->hw_mr.zbva = false;
 	mr->hw_mr.phy_mr = false;
 	mr->hw_mr.dma_mr = false;
diff --git a/drivers/infiniband/hw/qedr/verbs.h b/drivers/infiniband/hw/qedr/verbs.h
index 39dd628..1283cc9 100644
--- a/drivers/infiniband/hw/qedr/verbs.h
+++ b/drivers/infiniband/hw/qedr/verbs.h
@@ -77,8 +77,8 @@ int qedr_create_ah(struct ib_ah *ibah, struct rdma_ah_init_attr *init_attr,
 int qedr_dereg_mr(struct ib_mr *ib_mr, struct ib_udata *udata);
 struct ib_mr *qedr_get_dma_mr(struct ib_pd *, int acc);
 
-struct ib_mr *qedr_reg_user_mr(struct ib_pd *, u64 start, u64 length,
-			       u64 virt, int acc, struct ib_udata *);
+struct ib_mr *qedr_reg_user_mr(struct ib_pd *, struct ib_user_mr_attr *attr,
+			       struct ib_udata *);
 
 int qedr_map_mr_sg(struct ib_mr *ibmr, struct scatterlist *sg,
 		   int sg_nents, unsigned int *sg_offset);
diff --git a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
index b8a77ce..3944115 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
@@ -601,22 +601,22 @@ void usnic_ib_destroy_cq(struct ib_cq *cq, struct ib_udata *udata)
 	return;
 }
 
-struct ib_mr *usnic_ib_reg_mr(struct ib_pd *pd, u64 start, u64 length,
-					u64 virt_addr, int access_flags,
+struct ib_mr *usnic_ib_reg_mr(struct ib_pd *pd,
+					struct ib_user_mr_attr *attr,
 					struct ib_udata *udata)
 {
 	struct usnic_ib_mr *mr;
 	int err;
 
-	usnic_dbg("start 0x%llx va 0x%llx length 0x%llx\n", start,
-			virt_addr, length);
+	usnic_dbg("start 0x%llx va 0x%llx length 0x%llx\n", attr->start,
+			attr->virt_addr, attr->length);
 
 	mr = kzalloc(sizeof(*mr), GFP_KERNEL);
 	if (!mr)
 		return ERR_PTR(-ENOMEM);
 
-	mr->umem = usnic_uiom_reg_get(to_upd(pd)->umem_pd, start, length,
-					access_flags, 0);
+	mr->umem = usnic_uiom_reg_get(to_upd(pd)->umem_pd, attr->start,
+					attr->length, attr->access_flags, 0);
 	if (IS_ERR_OR_NULL(mr->umem)) {
 		err = mr->umem ? PTR_ERR(mr->umem) : -EFAULT;
 		goto err_free;
diff --git a/drivers/infiniband/hw/usnic/usnic_ib_verbs.h b/drivers/infiniband/hw/usnic/usnic_ib_verbs.h
index 2aedf78..d2b6837 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_verbs.h
+++ b/drivers/infiniband/hw/usnic/usnic_ib_verbs.h
@@ -61,8 +61,8 @@ int usnic_ib_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *attr,
 int usnic_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 		       struct ib_udata *udata);
 void usnic_ib_destroy_cq(struct ib_cq *cq, struct ib_udata *udata);
-struct ib_mr *usnic_ib_reg_mr(struct ib_pd *pd, u64 start, u64 length,
-				u64 virt_addr, int access_flags,
+struct ib_mr *usnic_ib_reg_mr(struct ib_pd *pd,
+				struct ib_user_mr_attr *attr,
 				struct ib_udata *udata);
 int usnic_ib_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata);
 int usnic_ib_alloc_ucontext(struct ib_ucontext *uctx, struct ib_udata *udata);
diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c
index 77a010e68..d0d0813 100644
--- a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c
+++ b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c
@@ -100,16 +100,13 @@ struct ib_mr *pvrdma_get_dma_mr(struct ib_pd *pd, int acc)
 /**
  * pvrdma_reg_user_mr - register a userspace memory region
  * @pd: protection domain
- * @start: starting address
- * @length: length of region
- * @virt_addr: I/O virtual address
- * @access_flags: access flags for memory region
+ * @attr: user mr attributes
  * @udata: user data
  *
  * @return: ib_mr pointer on success, otherwise returns an errno.
  */
-struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				 u64 virt_addr, int access_flags,
+struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd,
+				 struct ib_user_mr_attr *attr,
 				 struct ib_udata *udata)
 {
 	struct pvrdma_dev *dev = to_vdev(pd->device);
@@ -121,12 +118,13 @@ struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	struct pvrdma_cmd_create_mr_resp *resp = &rsp.create_mr_resp;
 	int ret, npages;
 
-	if (length == 0 || length > dev->dsr->caps.max_mr_size) {
+	if (attr->length == 0 || attr->length > dev->dsr->caps.max_mr_size) {
 		dev_warn(&dev->pdev->dev, "invalid mem region length\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	umem = ib_umem_get(pd->device, start, length, access_flags);
+	umem = ib_umem_get(pd->device, attr->start, attr->length,
+			   attr->access_flags);
 	if (IS_ERR(umem)) {
 		dev_warn(&dev->pdev->dev,
 			 "could not get umem for mem region\n");
@@ -147,8 +145,8 @@ struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		goto err_umem;
 	}
 
-	mr->mmr.iova = virt_addr;
-	mr->mmr.size = length;
+	mr->mmr.iova = attr->virt_addr;
+	mr->mmr.size = attr->length;
 	mr->umem = umem;
 
 	ret = pvrdma_page_dir_init(dev, &mr->pdir, npages, false);
@@ -164,10 +162,10 @@ struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 
 	memset(cmd, 0, sizeof(*cmd));
 	cmd->hdr.cmd = PVRDMA_CMD_CREATE_MR;
-	cmd->start = start;
-	cmd->length = length;
+	cmd->start = attr->start;
+	cmd->length = attr->length;
 	cmd->pd_handle = to_vpd(pd)->pd_handle;
-	cmd->access_flags = access_flags;
+	cmd->access_flags = attr->access_flags;
 	cmd->nchunks = npages;
 	cmd->pdir_dma = mr->pdir.dir_dma;
 
diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
index 699b208..efdc69e 100644
--- a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
+++ b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
@@ -401,8 +401,8 @@ int pvrdma_modify_port(struct ib_device *ibdev, u8 port,
 int pvrdma_alloc_pd(struct ib_pd *pd, struct ib_udata *udata);
 void pvrdma_dealloc_pd(struct ib_pd *ibpd, struct ib_udata *udata);
 struct ib_mr *pvrdma_get_dma_mr(struct ib_pd *pd, int acc);
-struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-				 u64 virt_addr, int access_flags,
+struct ib_mr *pvrdma_reg_user_mr(struct ib_pd *pd,
+				 struct ib_user_mr_attr *attr,
 				 struct ib_udata *udata);
 int pvrdma_dereg_mr(struct ib_mr *mr, struct ib_udata *udata);
 struct ib_mr *pvrdma_alloc_mr(struct ib_pd *pd, enum ib_mr_type mr_type,
diff --git a/drivers/infiniband/sw/rdmavt/mr.c b/drivers/infiniband/sw/rdmavt/mr.c
index 2f7c25f..062d269 100644
--- a/drivers/infiniband/sw/rdmavt/mr.c
+++ b/drivers/infiniband/sw/rdmavt/mr.c
@@ -369,15 +369,13 @@ struct ib_mr *rvt_get_dma_mr(struct ib_pd *pd, int acc)
 /**
  * rvt_reg_user_mr - register a userspace memory region
  * @pd: protection domain for this memory region
- * @start: starting userspace address
- * @length: length of region to register
- * @mr_access_flags: access flags for this memory region
+ * @attr: userspace memory region attributes
  * @udata: unused by the driver
  *
  * Return: the memory region on success, otherwise returns an errno.
  */
-struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-			      u64 virt_addr, int mr_access_flags,
+struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd,
+			      struct ib_user_mr_attr *attr,
 			      struct ib_udata *udata)
 {
 	struct rvt_mr *mr;
@@ -386,10 +384,11 @@ struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	int n, m;
 	struct ib_mr *ret;
 
-	if (length == 0)
+	if (attr->length == 0)
 		return ERR_PTR(-EINVAL);
 
-	umem = ib_umem_get(pd->device, start, length, mr_access_flags);
+	umem = ib_umem_get(pd->device, attr->start, attr->length,
+			   attr->access_flags);
 	if (IS_ERR(umem))
 		return (void *)umem;
 
@@ -401,11 +400,11 @@ struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 		goto bail_umem;
 	}
 
-	mr->mr.user_base = start;
-	mr->mr.iova = virt_addr;
-	mr->mr.length = length;
+	mr->mr.user_base = attr->start;
+	mr->mr.iova = attr->virt_addr;
+	mr->mr.length = attr->length;
 	mr->mr.offset = ib_umem_offset(umem);
-	mr->mr.access_flags = mr_access_flags;
+	mr->mr.access_flags = attr->access_flags;
 	mr->umem = umem;
 
 	mr->mr.page_shift = PAGE_SHIFT;
diff --git a/drivers/infiniband/sw/rdmavt/mr.h b/drivers/infiniband/sw/rdmavt/mr.h
index b3aba35..b58ab5a 100644
--- a/drivers/infiniband/sw/rdmavt/mr.h
+++ b/drivers/infiniband/sw/rdmavt/mr.h
@@ -66,8 +66,8 @@ static inline struct rvt_mr *to_imr(struct ib_mr *ibmr)
 
 /* Mem Regions */
 struct ib_mr *rvt_get_dma_mr(struct ib_pd *pd, int acc);
-struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
-			      u64 virt_addr, int mr_access_flags,
+struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd,
+			      struct ib_user_mr_attr *attr,
 			      struct ib_udata *udata);
 int rvt_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata);
 struct ib_mr *rvt_alloc_mr(struct ib_pd *pd, enum ib_mr_type mr_type,
diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband/sw/rxe/rxe_verbs.c
index 658939e..2f28ecc 100644
--- a/drivers/infiniband/sw/rxe/rxe_verbs.c
+++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
@@ -904,10 +904,8 @@ static struct ib_mr *rxe_get_dma_mr(struct ib_pd *ibpd, int access)
 }
 
 static struct ib_mr *rxe_reg_user_mr(struct ib_pd *ibpd,
-				     u64 start,
-				     u64 length,
-				     u64 iova,
-				     int access, struct ib_udata *udata)
+				     struct ib_user_mr_attr *attr,
+				     struct ib_udata *udata)
 {
 	int err;
 	struct rxe_dev *rxe = to_rdev(ibpd->device);
@@ -924,8 +922,8 @@ static struct ib_mr *rxe_reg_user_mr(struct ib_pd *ibpd,
 
 	rxe_add_ref(pd);
 
-	err = rxe_mem_init_user(pd, start, length, iova,
-				access, udata, mr);
+	err = rxe_mem_init_user(pd, attr->start, attr->length, attr->virt_addr,
+				attr->access_flags, udata, mr);
 	if (err)
 		goto err3;
 
diff --git a/drivers/infiniband/sw/siw/siw_verbs.c b/drivers/infiniband/sw/siw/siw_verbs.c
index adafa1b..399d9b3 100644
--- a/drivers/infiniband/sw/siw/siw_verbs.c
+++ b/drivers/infiniband/sw/siw/siw_verbs.c
@@ -1262,14 +1262,12 @@ int siw_dereg_mr(struct ib_mr *base_mr, struct ib_udata *udata)
  * Register Memory Region.
  *
  * @pd:		Protection Domain
- * @start:	starting address of MR (virtual address)
- * @len:	len of MR
- * @rnic_va:	not used by siw
- * @rights:	MR access rights
+ * @attr:	user space MR attributes
  * @udata:	user buffer to communicate STag and Key.
  */
-struct ib_mr *siw_reg_user_mr(struct ib_pd *pd, u64 start, u64 len,
-			      u64 rnic_va, int rights, struct ib_udata *udata)
+struct ib_mr *siw_reg_user_mr(struct ib_pd *pd,
+			      struct ib_user_mr_attr *attr,
+			      struct ib_udata *udata)
 {
 	struct siw_mr *mr = NULL;
 	struct siw_umem *umem = NULL;
@@ -1280,21 +1278,23 @@ struct ib_mr *siw_reg_user_mr(struct ib_pd *pd, u64 start, u64 len,
 	int rv;
 
 	siw_dbg_pd(pd, "start: 0x%pK, va: 0x%pK, len: %llu\n",
-		   (void *)(uintptr_t)start, (void *)(uintptr_t)rnic_va,
-		   (unsigned long long)len);
+		   (void *)(uintptr_t)attr->start,
+		   (void *)(uintptr_t)attr->virt_addr,
+		   (unsigned long long)attr->length);
 
 	if (atomic_inc_return(&sdev->num_mr) > SIW_MAX_MR) {
 		siw_dbg_pd(pd, "too many mr's\n");
 		rv = -ENOMEM;
 		goto err_out;
 	}
-	if (!len) {
+	if (!attr->length) {
 		rv = -EINVAL;
 		goto err_out;
 	}
 	if (mem_limit != RLIM_INFINITY) {
 		unsigned long num_pages =
-			(PAGE_ALIGN(len + (start & ~PAGE_MASK))) >> PAGE_SHIFT;
+			(PAGE_ALIGN(attr->length + (attr->start & ~PAGE_MASK)))
+				>> PAGE_SHIFT;
 		mem_limit >>= PAGE_SHIFT;
 
 		if (num_pages > mem_limit - current->mm->locked_vm) {
@@ -1305,7 +1305,8 @@ struct ib_mr *siw_reg_user_mr(struct ib_pd *pd, u64 start, u64 len,
 			goto err_out;
 		}
 	}
-	umem = siw_umem_get(start, len, ib_access_writable(rights));
+	umem = siw_umem_get(attr->start, attr->length,
+			    ib_access_writable(attr->access_flags));
 	if (IS_ERR(umem)) {
 		rv = PTR_ERR(umem);
 		siw_dbg_pd(pd, "getting user memory failed: %d\n", rv);
@@ -1317,7 +1318,8 @@ struct ib_mr *siw_reg_user_mr(struct ib_pd *pd, u64 start, u64 len,
 		rv = -ENOMEM;
 		goto err_out;
 	}
-	rv = siw_mr_add_mem(mr, pd, umem, start, len, rights);
+	rv = siw_mr_add_mem(mr, pd, umem, attr->start, attr->length,
+			    attr->access_flags);
 	if (rv)
 		goto err_out;
 
diff --git a/drivers/infiniband/sw/siw/siw_verbs.h b/drivers/infiniband/sw/siw/siw_verbs.h
index d957227..35d65e6 100644
--- a/drivers/infiniband/sw/siw/siw_verbs.h
+++ b/drivers/infiniband/sw/siw/siw_verbs.h
@@ -65,8 +65,9 @@ int siw_post_receive(struct ib_qp *base_qp, const struct ib_recv_wr *wr,
 void siw_destroy_cq(struct ib_cq *base_cq, struct ib_udata *udata);
 int siw_poll_cq(struct ib_cq *base_cq, int num_entries, struct ib_wc *wc);
 int siw_req_notify_cq(struct ib_cq *base_cq, enum ib_cq_notify_flags flags);
-struct ib_mr *siw_reg_user_mr(struct ib_pd *base_pd, u64 start, u64 len,
-			      u64 rnic_va, int rights, struct ib_udata *udata);
+struct ib_mr *siw_reg_user_mr(struct ib_pd *base_pd,
+			      struct ib_user_mr_attr *attr,
+			      struct ib_udata *udata);
 struct ib_mr *siw_alloc_mr(struct ib_pd *base_pd, enum ib_mr_type mr_type,
 			   u32 max_sge);
 struct ib_mr *siw_get_dma_mr(struct ib_pd *base_pd, int rights);
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index c0b2fa7..a22014c 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2004 Mellanox Technologies Ltd.  All rights reserved.
  * Copyright (c) 2004 Infinicon Corporation.  All rights reserved.
- * Copyright (c) 2004 Intel Corporation.  All rights reserved.
+ * Copyright (c) 2004, 2020 Intel Corporation.  All rights reserved.
  * Copyright (c) 2004 Topspin Corporation.  All rights reserved.
  * Copyright (c) 2004 Voltaire Corporation.  All rights reserved.
  * Copyright (c) 2005 Sun Microsystems, Inc. All rights reserved.
@@ -372,6 +372,14 @@ struct ib_dm_alloc_attr {
 	u32	flags;
 };
 
+struct ib_user_mr_attr {
+	u64	start;
+	u64	length;
+	u64	virt_addr;
+	u32	fd;
+	u32	access_flags;
+};
+
 struct ib_device_attr {
 	u64			fw_ver;
 	__be64			sys_image_guid;
@@ -1431,11 +1439,12 @@ enum ib_access_flags {
 	IB_ZERO_BASED = IB_UVERBS_ACCESS_ZERO_BASED,
 	IB_ACCESS_ON_DEMAND = IB_UVERBS_ACCESS_ON_DEMAND,
 	IB_ACCESS_HUGETLB = IB_UVERBS_ACCESS_HUGETLB,
+	IB_ACCESS_DMABUF = IB_UVERBS_ACCESS_DMABUF,
 	IB_ACCESS_RELAXED_ORDERING = IB_UVERBS_ACCESS_RELAXED_ORDERING,
 
 	IB_ACCESS_OPTIONAL = IB_UVERBS_ACCESS_OPTIONAL_RANGE,
 	IB_ACCESS_SUPPORTED =
-		((IB_ACCESS_HUGETLB << 1) - 1) | IB_ACCESS_OPTIONAL,
+		((IB_ACCESS_DMABUF << 1) - 1) | IB_ACCESS_OPTIONAL,
 };
 
 /*
@@ -2442,11 +2451,11 @@ struct ib_device_ops {
 	void (*destroy_cq)(struct ib_cq *cq, struct ib_udata *udata);
 	int (*resize_cq)(struct ib_cq *cq, int cqe, struct ib_udata *udata);
 	struct ib_mr *(*get_dma_mr)(struct ib_pd *pd, int mr_access_flags);
-	struct ib_mr *(*reg_user_mr)(struct ib_pd *pd, u64 start, u64 length,
-				     u64 virt_addr, int mr_access_flags,
+	struct ib_mr *(*reg_user_mr)(struct ib_pd *pd,
+				     struct ib_user_mr_attr *attr,
 				     struct ib_udata *udata);
-	int (*rereg_user_mr)(struct ib_mr *mr, int flags, u64 start, u64 length,
-			     u64 virt_addr, int mr_access_flags,
+	int (*rereg_user_mr)(struct ib_mr *mr, int flags,
+			     struct ib_user_mr_attr *attr,
 			     struct ib_pd *pd, struct ib_udata *udata);
 	int (*dereg_mr)(struct ib_mr *mr, struct ib_udata *udata);
 	struct ib_mr *(*alloc_mr)(struct ib_pd *pd, enum ib_mr_type mr_type,
diff --git a/include/uapi/rdma/ib_user_ioctl_verbs.h b/include/uapi/rdma/ib_user_ioctl_verbs.h
index 5debab4..faf2008 100644
--- a/include/uapi/rdma/ib_user_ioctl_verbs.h
+++ b/include/uapi/rdma/ib_user_ioctl_verbs.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR Linux-OpenIB) */
 /*
  * Copyright (c) 2017-2018, Mellanox Technologies inc.  All rights reserved.
+ * Copyright (c) 2020, Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -57,6 +58,7 @@ enum ib_uverbs_access_flags {
 	IB_UVERBS_ACCESS_ZERO_BASED = 1 << 5,
 	IB_UVERBS_ACCESS_ON_DEMAND = 1 << 6,
 	IB_UVERBS_ACCESS_HUGETLB = 1 << 7,
+	IB_UVERBS_ACCESS_DMABUF = 1 << 8,
 
 	IB_UVERBS_ACCESS_RELAXED_ORDERING = IB_UVERBS_ACCESS_OPTIONAL_FIRST,
 	IB_UVERBS_ACCESS_OPTIONAL_RANGE =
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
