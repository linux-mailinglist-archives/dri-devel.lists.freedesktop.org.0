Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E992C1214
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 18:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795D36E07D;
	Mon, 23 Nov 2020 17:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFF86E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 17:39:10 +0000 (UTC)
IronPort-SDR: o2dJKoxFB4o8PMoIYlFOQWexJJocKgvs1NjsysiKLBT4e2lZanHdJ4FVDcGf0RepTl9TzsMgBx
 ICiN2ni5mzaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="233421239"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="233421239"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:39:09 -0800
IronPort-SDR: TTxBlRjTclW3F7N+bORXXUlHYLyZ9c+Ws7dmJKMST0PUulg+mH2kzcnYh4OgBHys6XoYYZrNng
 NUMETnpfioCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="361525793"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2020 09:39:09 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 2/5] mlx5: Support dma-buf based memory region
Date: Mon, 23 Nov 2020 09:53:01 -0800
Message-Id: <1606153984-104583-3-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
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

Implement the new provider method for registering dma-buf based memory
regions.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 providers/mlx5/mlx5.c  |  2 ++
 providers/mlx5/mlx5.h  |  3 +++
 providers/mlx5/verbs.c | 23 +++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/providers/mlx5/mlx5.c b/providers/mlx5/mlx5.c
index 1378acf..b3e2d57 100644
--- a/providers/mlx5/mlx5.c
+++ b/providers/mlx5/mlx5.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2012 Mellanox Technologies, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -96,6 +97,7 @@ static const struct verbs_context_ops mlx5_ctx_common_ops = {
 	.async_event   = mlx5_async_event,
 	.dealloc_pd    = mlx5_free_pd,
 	.reg_mr	       = mlx5_reg_mr,
+	.reg_dmabuf_mr = mlx5_reg_dmabuf_mr,
 	.rereg_mr      = mlx5_rereg_mr,
 	.dereg_mr      = mlx5_dereg_mr,
 	.alloc_mw      = mlx5_alloc_mw,
diff --git a/providers/mlx5/mlx5.h b/providers/mlx5/mlx5.h
index 8c94f72..17a2470 100644
--- a/providers/mlx5/mlx5.h
+++ b/providers/mlx5/mlx5.h
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2012 Mellanox Technologies, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -903,6 +904,8 @@ void mlx5_async_event(struct ibv_context *context,
 struct ibv_mr *mlx5_alloc_null_mr(struct ibv_pd *pd);
 struct ibv_mr *mlx5_reg_mr(struct ibv_pd *pd, void *addr, size_t length,
 			   uint64_t hca_va, int access);
+struct ibv_mr *mlx5_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+				  uint64_t iova, int fd, int access);
 int mlx5_rereg_mr(struct verbs_mr *mr, int flags, struct ibv_pd *pd, void *addr,
 		  size_t length, int access);
 int mlx5_dereg_mr(struct verbs_mr *mr);
diff --git a/providers/mlx5/verbs.c b/providers/mlx5/verbs.c
index b956156..6279993 100644
--- a/providers/mlx5/verbs.c
+++ b/providers/mlx5/verbs.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2012 Mellanox Technologies, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -647,6 +648,28 @@ struct ibv_mr *mlx5_reg_mr(struct ibv_pd *pd, void *addr, size_t length,
 	return &mr->vmr.ibv_mr;
 }
 
+struct ibv_mr *mlx5_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+				  uint64_t iova, int fd, int acc)
+{
+	struct mlx5_mr *mr;
+	int ret;
+	enum ibv_access_flags access = (enum ibv_access_flags)acc;
+
+	mr = calloc(1, sizeof(*mr));
+	if (!mr)
+		return NULL;
+
+	ret = ibv_cmd_reg_dmabuf_mr(pd, offset, length, iova, fd, access,
+				    &mr->vmr);
+	if (ret) {
+		free(mr);
+		return NULL;
+	}
+	mr->alloc_flags = acc;
+
+	return &mr->vmr.ibv_mr;
+}
+
 struct ibv_mr *mlx5_alloc_null_mr(struct ibv_pd *pd)
 {
 	struct mlx5_mr *mr;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
