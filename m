Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99D2C6CA3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608E76EE8F;
	Fri, 27 Nov 2020 20:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CBA6EE8F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:41:45 +0000 (UTC)
IronPort-SDR: FrYANuD6x2zQ99QKQGT949Ic3LUFzSgtaoZUL5yejZRIr05h4/Z1LIi5Pn8j3lrC95z/vpvsDC
 QmGjguf6Q3lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="172587555"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="172587555"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 12:41:45 -0800
IronPort-SDR: OGGEj6j8XwePoQt8wvF+RjV9vgtyeyFu3CFLoZ+Js5Kfa0vhvgtLpGRUlt3qLGhIZwkLFamCPZ
 Q++/GJnehv3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="537737686"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2020 12:41:45 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 3/6] mlx5: Support dma-buf based memory region
Date: Fri, 27 Nov 2020 12:55:40 -0800
Message-Id: <1606510543-45567-4-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
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
 providers/mlx5/verbs.c | 22 ++++++++++++++++++++++
 3 files changed, 27 insertions(+)

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
index b956156..a7fc3b0 100644
--- a/providers/mlx5/verbs.c
+++ b/providers/mlx5/verbs.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2012 Mellanox Technologies, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -647,6 +648,27 @@ struct ibv_mr *mlx5_reg_mr(struct ibv_pd *pd, void *addr, size_t length,
 	return &mr->vmr.ibv_mr;
 }
 
+struct ibv_mr *mlx5_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+				  uint64_t iova, int fd, int acc)
+{
+	struct mlx5_mr *mr;
+	int ret;
+
+	mr = calloc(1, sizeof(*mr));
+	if (!mr)
+		return NULL;
+
+	ret = ibv_cmd_reg_dmabuf_mr(pd, offset, length, iova, fd, acc,
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
