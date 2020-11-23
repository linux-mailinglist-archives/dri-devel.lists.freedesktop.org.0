Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A8B2C1213
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 18:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8B6E071;
	Mon, 23 Nov 2020 17:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2B86E081
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 17:39:10 +0000 (UTC)
IronPort-SDR: WK2yyhMiz0R8r+uhb2pVbhrNJtZp7Vlb0eOYGyv6PlQD4+lKyAFel68y8Aus6vM68mpSZ/4NtC
 8bvXuIb+NPjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="233421234"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="233421234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:39:09 -0800
IronPort-SDR: 6S5X1On1jW+bAw0bHRCSyY61wr5vW9+lWQX/wPDHYNLyX7DWdT/yLVetqFZPVSLIJArPJY1vw/
 7p9uPa58HCuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="361525789"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2020 09:39:09 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 1/5] verbs: Support dma-buf based memory region
Date: Mon, 23 Nov 2020 09:53:00 -0800
Message-Id: <1606153984-104583-2-git-send-email-jianxin.xiong@intel.com>
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

Add new API function and new provider method for registering dma-buf
based memory region. Update the man page and bump the API version.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 kernel-headers/rdma/ib_user_ioctl_cmds.h | 14 ++++++++++++
 libibverbs/cmd_mr.c                      | 38 ++++++++++++++++++++++++++++++++
 libibverbs/driver.h                      |  7 ++++++
 libibverbs/dummy_ops.c                   | 11 +++++++++
 libibverbs/libibverbs.map.in             |  6 +++++
 libibverbs/man/ibv_reg_mr.3              | 21 ++++++++++++++++--
 libibverbs/verbs.c                       | 19 ++++++++++++++++
 libibverbs/verbs.h                       | 10 +++++++++
 8 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/kernel-headers/rdma/ib_user_ioctl_cmds.h b/kernel-headers/rdma/ib_user_ioctl_cmds.h
index 7968a18..dafc7eb 100644
--- a/kernel-headers/rdma/ib_user_ioctl_cmds.h
+++ b/kernel-headers/rdma/ib_user_ioctl_cmds.h
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -251,6 +252,7 @@ enum uverbs_methods_mr {
 	UVERBS_METHOD_MR_DESTROY,
 	UVERBS_METHOD_ADVISE_MR,
 	UVERBS_METHOD_QUERY_MR,
+	UVERBS_METHOD_REG_DMABUF_MR,
 };
 
 enum uverbs_attrs_mr_destroy_ids {
@@ -272,6 +274,18 @@ enum uverbs_attrs_query_mr_cmd_attr_ids {
 	UVERBS_ATTR_QUERY_MR_RESP_IOVA,
 };
 
+enum uverbs_attrs_reg_dmabuf_mr_cmd_attr_ids {
+	UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
+	UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE,
+	UVERBS_ATTR_REG_DMABUF_MR_OFFSET,
+	UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
+	UVERBS_ATTR_REG_DMABUF_MR_IOVA,
+	UVERBS_ATTR_REG_DMABUF_MR_FD,
+	UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+	UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
+	UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
+};
+
 enum uverbs_attrs_create_counters_cmd_attr_ids {
 	UVERBS_ATTR_CREATE_COUNTERS_HANDLE,
 };
diff --git a/libibverbs/cmd_mr.c b/libibverbs/cmd_mr.c
index 42dbe42..91ce2ef 100644
--- a/libibverbs/cmd_mr.c
+++ b/libibverbs/cmd_mr.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2018 Mellanox Technologies, Ltd.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -116,3 +117,40 @@ int ibv_cmd_query_mr(struct ibv_pd *pd, struct verbs_mr *vmr,
 	return 0;
 }
 
+int ibv_cmd_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+			  uint64_t iova, int fd, int access,
+			  struct verbs_mr *vmr)
+{
+	DECLARE_COMMAND_BUFFER(cmdb, UVERBS_OBJECT_MR,
+			       UVERBS_METHOD_REG_DMABUF_MR,
+			       9);
+	struct ib_uverbs_attr *handle;
+	uint32_t lkey, rkey;
+	int ret;
+
+	handle = fill_attr_out_obj(cmdb, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
+	fill_attr_out_ptr(cmdb, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY, &lkey);
+	fill_attr_out_ptr(cmdb, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY, &rkey);
+
+	fill_attr_in_obj(cmdb, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE, pd->handle);
+	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_OFFSET, offset);
+	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_LENGTH, length);
+	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_IOVA, iova);
+	fill_attr_in_uint32(cmdb, UVERBS_ATTR_REG_DMABUF_MR_FD, fd);
+	fill_attr_in_uint32(cmdb, UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS, access);
+
+	ret = execute_ioctl(pd->context, cmdb);
+	if (ret)
+		return errno;
+
+	vmr->ibv_mr.handle =
+		read_attr_obj(UVERBS_ATTR_REG_DMABUF_MR_HANDLE, handle);
+	vmr->ibv_mr.context = pd->context;
+	vmr->ibv_mr.lkey    = lkey;
+	vmr->ibv_mr.rkey    = rkey;
+	vmr->ibv_mr.pd	    = pd;
+	vmr->ibv_mr.addr    = (void *)offset;
+	vmr->ibv_mr.length  = length;
+	vmr->mr_type        = IBV_MR_TYPE_MR;
+	return 0;
+}
diff --git a/libibverbs/driver.h b/libibverbs/driver.h
index ab80f4b..d6a9d0a 100644
--- a/libibverbs/driver.h
+++ b/libibverbs/driver.h
@@ -2,6 +2,7 @@
  * Copyright (c) 2004, 2005 Topspin Communications.  All rights reserved.
  * Copyright (c) 2005, 2006 Cisco Systems, Inc.  All rights reserved.
  * Copyright (c) 2005 PathScale, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -373,6 +374,9 @@ struct verbs_context_ops {
 	struct ibv_mr *(*reg_dm_mr)(struct ibv_pd *pd, struct ibv_dm *dm,
 				    uint64_t dm_offset, size_t length,
 				    unsigned int access);
+	struct ibv_mr *(*reg_dmabuf_mr)(struct ibv_pd *pd, uint64_t offset,
+					size_t length, uint64_t iova,
+					int fd, int access);
 	struct ibv_mr *(*reg_mr)(struct ibv_pd *pd, void *addr, size_t length,
 				 uint64_t hca_va, int access);
 	int (*req_notify_cq)(struct ibv_cq *cq, int solicited_only);
@@ -498,6 +502,9 @@ int ibv_cmd_advise_mr(struct ibv_pd *pd,
 		      uint32_t flags,
 		      struct ibv_sge *sg_list,
 		      uint32_t num_sge);
+int ibv_cmd_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+			  uint64_t iova, int fd, int access,
+			  struct verbs_mr *vmr);
 int ibv_cmd_alloc_mw(struct ibv_pd *pd, enum ibv_mw_type type,
 		     struct ibv_mw *mw, struct ibv_alloc_mw *cmd,
 		     size_t cmd_size,
diff --git a/libibverbs/dummy_ops.c b/libibverbs/dummy_ops.c
index e5af9e4..dca96d2 100644
--- a/libibverbs/dummy_ops.c
+++ b/libibverbs/dummy_ops.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2017 Mellanox Technologies, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -452,6 +453,14 @@ static struct ibv_mr *reg_mr(struct ibv_pd *pd, void *addr, size_t length,
 	return NULL;
 }
 
+static struct ibv_mr *reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
+				    size_t length, uint64_t iova,
+				    int fd, int access)
+{
+	errno = ENOSYS;
+	return NULL;
+}
+
 static int req_notify_cq(struct ibv_cq *cq, int solicited_only)
 {
 	return EOPNOTSUPP;
@@ -560,6 +569,7 @@ const struct verbs_context_ops verbs_dummy_ops = {
 	query_srq,
 	read_counters,
 	reg_dm_mr,
+	reg_dmabuf_mr,
 	reg_mr,
 	req_notify_cq,
 	rereg_mr,
@@ -689,6 +699,7 @@ void verbs_set_ops(struct verbs_context *vctx,
 	SET_PRIV_OP_IC(vctx, set_ece);
 	SET_PRIV_OP_IC(vctx, unimport_mr);
 	SET_PRIV_OP_IC(vctx, unimport_pd);
+	SET_OP(vctx, reg_dmabuf_mr);
 
 #undef SET_OP
 #undef SET_OP2
diff --git a/libibverbs/libibverbs.map.in b/libibverbs/libibverbs.map.in
index b5ccaca..f67e1ef 100644
--- a/libibverbs/libibverbs.map.in
+++ b/libibverbs/libibverbs.map.in
@@ -148,6 +148,11 @@ IBVERBS_1.11 {
 		_ibv_query_gid_table;
 } IBVERBS_1.10;
 
+IBVERBS_1.12 {
+	global:
+		ibv_reg_dmabuf_mr;
+} IBVERBS_1.11;
+
 /* If any symbols in this stanza change ABI then the entire staza gets a new symbol
    version. See the top level CMakeLists.txt for this setting. */
 
@@ -211,6 +216,7 @@ IBVERBS_PRIVATE_@IBVERBS_PABI_VERSION@ {
 		ibv_cmd_query_srq;
 		ibv_cmd_read_counters;
 		ibv_cmd_reg_dm_mr;
+		ibv_cmd_reg_dmabuf_mr;
 		ibv_cmd_reg_mr;
 		ibv_cmd_req_notify_cq;
 		ibv_cmd_rereg_mr;
diff --git a/libibverbs/man/ibv_reg_mr.3 b/libibverbs/man/ibv_reg_mr.3
index 2bfc955..4975c79 100644
--- a/libibverbs/man/ibv_reg_mr.3
+++ b/libibverbs/man/ibv_reg_mr.3
@@ -3,7 +3,7 @@
 .\"
 .TH IBV_REG_MR 3 2006-10-31 libibverbs "Libibverbs Programmer's Manual"
 .SH "NAME"
-ibv_reg_mr, ibv_reg_mr_iova, ibv_dereg_mr \- register or deregister a memory region (MR)
+ibv_reg_mr, ibv_reg_mr_iova, ibv_reg_dmabuf_mr, ibv_dereg_mr \- register or deregister a memory region (MR)
 .SH "SYNOPSIS"
 .nf
 .B #include <infiniband/verbs.h>
@@ -15,6 +15,9 @@ ibv_reg_mr, ibv_reg_mr_iova, ibv_dereg_mr \- register or deregister a memory reg
 .BI "                               size_t " "length" ", uint64_t " "hca_va" ,
 .BI "                               int " "access" );
 .sp
+.BI "struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd " "*pd" ", uint64_t " "offset" ,
+.BI "                                 size_t " "length" ", int " "access" );
+.sp
 .BI "int ibv_dereg_mr(struct ibv_mr " "*mr" );
 .fi
 .SH "DESCRIPTION"
@@ -71,11 +74,25 @@ a lkey or rkey. The offset in the memory region is computed as 'addr +
 (iova - hca_va)'. Specifying 0 for hca_va has the same effect as
 IBV_ACCESS_ZERO_BASED.
 .PP
+.B ibv_reg_dmabuf_mr()
+registers a dma-buf based memory region (MR) associated with the protection domain
+.I pd\fR.
+The MR starts at
+.I offset
+of the dma-buf and its size is
+.I length\fR.
+The dma-buf is identified by the file descriptor
+.I fd\fR.
+The argument
+.I access
+describes the desired memory protection attributes; it is similar to the ibv_reg_mr case except that only the following flags are supported:
+.B IBV_ACCESS_LOCAL_WRITE, IBV_ACCESS_REMOTE_WRITE, IBV_ACCESS_REMOTE_READ, IBV_ACCESS_REMOTE_ATOMIC, IBV_ACCESS_RELAXED_ORDERING.
+.PP
 .B ibv_dereg_mr()
 deregisters the MR
 .I mr\fR.
 .SH "RETURN VALUE"
-.B ibv_reg_mr() / ibv_reg_mr_iova()
+.B ibv_reg_mr() / ibv_reg_mr_iova() / ibv_reg_dmabuf_mr()
 returns a pointer to the registered MR, or NULL if the request fails.
 The local key (\fBL_Key\fR) field
 .B lkey
diff --git a/libibverbs/verbs.c b/libibverbs/verbs.c
index 2b0ede8..84ddac7 100644
--- a/libibverbs/verbs.c
+++ b/libibverbs/verbs.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (c) 2005 Topspin Communications.  All rights reserved.
  * Copyright (c) 2006, 2007 Cisco Systems, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corperation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -367,6 +368,24 @@ void ibv_unimport_mr(struct ibv_mr *mr)
 	get_ops(mr->context)->unimport_mr(mr);
 }
 
+LATEST_SYMVER_FUNC(ibv_reg_dmabuf_mr, 1_12, "IBVERBS_1.12",
+		   struct ibv_mr *,
+		   struct ibv_pd *pd, uint64_t offset,
+		   size_t length, int fd, int access)
+{
+	struct ibv_mr *mr;
+
+	mr = get_ops(pd->context)->reg_dmabuf_mr(pd, offset, length, offset,
+						 fd, access);
+	if (mr) {
+		mr->context = pd->context;
+		mr->pd      = pd;
+		mr->addr    = (void *)offset;
+		mr->length  = length;
+	}
+	return mr;
+}
+
 LATEST_SYMVER_FUNC(ibv_rereg_mr, 1_1, "IBVERBS_1.1",
 		   int,
 		   struct ibv_mr *mr, int flags,
diff --git a/libibverbs/verbs.h b/libibverbs/verbs.h
index ee57e05..3961b1e 100644
--- a/libibverbs/verbs.h
+++ b/libibverbs/verbs.h
@@ -3,6 +3,7 @@
  * Copyright (c) 2004, 2011-2012 Intel Corporation.  All rights reserved.
  * Copyright (c) 2005, 2006, 2007 Cisco Systems, Inc.  All rights reserved.
  * Copyright (c) 2005 PathScale, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -2133,6 +2134,9 @@ struct verbs_context {
 	struct ibv_xrcd *	(*open_xrcd)(struct ibv_context *context,
 					     struct ibv_xrcd_init_attr *xrcd_init_attr);
 	int			(*close_xrcd)(struct ibv_xrcd *xrcd);
+	struct ibv_mr *		(*reg_dmabuf_mr)(struct ibv_pd *pd, uint64_t offset,
+						 size_t length, uint64_t iova,
+						 int fd, int access);
 	uint64_t _ABI_placeholder3;
 	size_t   sz;			/* Must be immediately before struct ibv_context */
 	struct ibv_context context;	/* Must be last field in the struct */
@@ -2535,6 +2539,12 @@ __ibv_reg_mr_iova(struct ibv_pd *pd, void *addr, size_t length, uint64_t iova,
 			  __builtin_constant_p(                                \
 				  ((access) & IBV_ACCESS_OPTIONAL_RANGE) == 0))
 
+/**
+ * ibv_reg_dmabuf_mr - Register a dambuf-based memory region
+ */
+struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+				 int fd, int access);
+
 enum ibv_rereg_mr_err_code {
 	/* Old MR is valid, invalid input */
 	IBV_REREG_MR_ERR_INPUT = -1,
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
