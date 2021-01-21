Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0C2FDD82
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 01:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD2E89913;
	Wed, 20 Jan 2021 23:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EA96E48F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 23:59:47 +0000 (UTC)
IronPort-SDR: 4oYv6kxIp/cOUPBzouVvfoWyyQeEy8Fa29kRfcfxntX29KO4YwgUF6vY1ZV20RJ7ugbe8Bx7oD
 7ptJDJQodBbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="176622395"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="176622395"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 15:59:44 -0800
IronPort-SDR: L4bp47Ts2dwbILfCUgYn6jv2nuHq3ocCSxjecLar5nbxhr4p9QYmtMtPr4hoNAT4X4/ahdceRr
 1BU7QUFDkb2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="570551143"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2021 15:59:41 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v6 2/6] verbs: Support dma-buf based memory region
Date: Wed, 20 Jan 2021 16:14:34 -0800
Message-Id: <1611188078-119233-3-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611188078-119233-1-git-send-email-jianxin.xiong@intel.com>
References: <1611188078-119233-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Edward Srouji <edwards@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 CMakeLists.txt               |  2 +-
 debian/control               |  2 +-
 debian/libibverbs1.symbols   |  4 +++-
 libibverbs/CMakeLists.txt    |  2 +-
 libibverbs/cmd_mr.c          | 38 ++++++++++++++++++++++++++++++++++++++
 libibverbs/driver.h          |  8 ++++++++
 libibverbs/dummy_ops.c       | 11 +++++++++++
 libibverbs/libibverbs.map.in |  6 ++++++
 libibverbs/man/ibv_reg_mr.3  | 27 +++++++++++++++++++++++++--
 libibverbs/verbs.c           | 19 +++++++++++++++++++
 libibverbs/verbs.h           |  7 +++++++
 11 files changed, 120 insertions(+), 6 deletions(-)

diff --git a/CMakeLists.txt b/CMakeLists.txt
index 30ae0cc..4113423 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -76,7 +76,7 @@ set(PACKAGE_VERSION "34.0")
 # When this is changed the values in these files need changing too:
 #   debian/control
 #   debian/libibverbs1.symbols
-set(IBVERBS_PABI_VERSION "33")
+set(IBVERBS_PABI_VERSION "34")
 set(IBVERBS_PROVIDER_SUFFIX "-rdmav${IBVERBS_PABI_VERSION}.so")
 
 #-------------------------
diff --git a/debian/control b/debian/control
index a423e4f..9022644 100644
--- a/debian/control
+++ b/debian/control
@@ -152,7 +152,7 @@ Section: libs
 Pre-Depends: ${misc:Pre-Depends}
 Depends: adduser, ${misc:Depends}, ${shlibs:Depends}
 Recommends: ibverbs-providers
-Breaks: ibverbs-providers (<< 33~)
+Breaks: ibverbs-providers (<< 34~)
 Description: Library for direct userspace use of RDMA (InfiniBand/iWARP)
  libibverbs is a library that allows userspace processes to use RDMA
  "verbs" as described in the InfiniBand Architecture Specification and
diff --git a/debian/libibverbs1.symbols b/debian/libibverbs1.symbols
index 9130f41..6cf5c2f 100644
--- a/debian/libibverbs1.symbols
+++ b/debian/libibverbs1.symbols
@@ -9,7 +9,8 @@ libibverbs.so.1 libibverbs1 #MINVER#
  IBVERBS_1.9@IBVERBS_1.9 30
  IBVERBS_1.10@IBVERBS_1.10 31
  IBVERBS_1.11@IBVERBS_1.11 32
- (symver)IBVERBS_PRIVATE_33 33
+ IBVERBS_1.12@IBVERBS_1.12 34
+ (symver)IBVERBS_PRIVATE_34 34
  _ibv_query_gid_ex@IBVERBS_1.11 32
  _ibv_query_gid_table@IBVERBS_1.11 32
  ibv_ack_async_event@IBVERBS_1.0 1.1.6
@@ -99,6 +100,7 @@ libibverbs.so.1 libibverbs1 #MINVER#
  ibv_rate_to_mbps@IBVERBS_1.1 1.1.8
  ibv_rate_to_mult@IBVERBS_1.0 1.1.6
  ibv_read_sysfs_file@IBVERBS_1.0 1.1.6
+ ibv_reg_dmabuf_mr@IBVERBS_1.12 34
  ibv_reg_mr@IBVERBS_1.0 1.1.6
  ibv_reg_mr@IBVERBS_1.1 1.1.6
  ibv_reg_mr_iova@IBVERBS_1.7 25
diff --git a/libibverbs/CMakeLists.txt b/libibverbs/CMakeLists.txt
index 0fe4256..d075225 100644
--- a/libibverbs/CMakeLists.txt
+++ b/libibverbs/CMakeLists.txt
@@ -21,7 +21,7 @@ configure_file("libibverbs.map.in"
 
 rdma_library(ibverbs "${CMAKE_CURRENT_BINARY_DIR}/libibverbs.map"
   # See Documentation/versioning.md
-  1 1.11.${PACKAGE_VERSION}
+  1 1.12.${PACKAGE_VERSION}
   all_providers.c
   cmd.c
   cmd_ah.c
diff --git a/libibverbs/cmd_mr.c b/libibverbs/cmd_mr.c
index 42dbe42..af0fad7 100644
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
+	vmr->ibv_mr.handle = read_attr_obj(UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
+					   handle);
+	vmr->ibv_mr.context = pd->context;
+	vmr->ibv_mr.lkey = lkey;
+	vmr->ibv_mr.rkey = rkey;
+	vmr->ibv_mr.pd = pd;
+	vmr->ibv_mr.addr = (void *)offset;
+	vmr->ibv_mr.length = length;
+	vmr->mr_type = IBV_MR_TYPE_DMABUF_MR;
+	return 0;
+}
diff --git a/libibverbs/driver.h b/libibverbs/driver.h
index 427c225..0798152 100644
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
@@ -87,6 +88,7 @@ enum ibv_mr_type {
 	IBV_MR_TYPE_MR,
 	IBV_MR_TYPE_NULL_MR,
 	IBV_MR_TYPE_IMPORTED_MR,
+	IBV_MR_TYPE_DMABUF_MR,
 };
 
 struct verbs_mr {
@@ -371,6 +373,9 @@ struct verbs_context_ops {
 	struct ibv_mr *(*reg_dm_mr)(struct ibv_pd *pd, struct ibv_dm *dm,
 				    uint64_t dm_offset, size_t length,
 				    unsigned int access);
+	struct ibv_mr *(*reg_dmabuf_mr)(struct ibv_pd *pd, uint64_t offset,
+					size_t length, uint64_t iova,
+					int fd, int access);
 	struct ibv_mr *(*reg_mr)(struct ibv_pd *pd, void *addr, size_t length,
 				 uint64_t hca_va, int access);
 	int (*req_notify_cq)(struct ibv_cq *cq, int solicited_only);
@@ -489,6 +494,9 @@ int ibv_cmd_advise_mr(struct ibv_pd *pd,
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
index b6f272d..a4769ad 100644
--- a/libibverbs/dummy_ops.c
+++ b/libibverbs/dummy_ops.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2017 Mellanox Technologies, Inc.  All rights reserved.
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -435,6 +436,14 @@ static struct ibv_mr *reg_mr(struct ibv_pd *pd, void *addr, size_t length,
 	return NULL;
 }
 
+static struct ibv_mr *reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
+				    size_t length, uint64_t iova,
+				    int fd, int access)
+{
+	errno = EOPNOTSUPP;
+	return NULL;
+}
+
 static int req_notify_cq(struct ibv_cq *cq, int solicited_only)
 {
 	return EOPNOTSUPP;
@@ -542,6 +551,7 @@ const struct verbs_context_ops verbs_dummy_ops = {
 	query_srq,
 	read_counters,
 	reg_dm_mr,
+	reg_dmabuf_mr,
 	reg_mr,
 	req_notify_cq,
 	rereg_mr,
@@ -663,6 +673,7 @@ void verbs_set_ops(struct verbs_context *vctx,
 	SET_OP(vctx, read_counters);
 	SET_PRIV_OP(ctx, query_srq);
 	SET_OP(vctx, reg_dm_mr);
+	SET_PRIV_OP_IC(vctx, reg_dmabuf_mr);
 	SET_PRIV_OP(ctx, reg_mr);
 	SET_OP(ctx, req_notify_cq);
 	SET_PRIV_OP(ctx, rereg_mr);
diff --git a/libibverbs/libibverbs.map.in b/libibverbs/libibverbs.map.in
index d124004..745146d 100644
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
index 2bfc955..a522527 100644
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
@@ -15,6 +15,10 @@ ibv_reg_mr, ibv_reg_mr_iova, ibv_dereg_mr \- register or deregister a memory reg
 .BI "                               size_t " "length" ", uint64_t " "hca_va" ,
 .BI "                               int " "access" );
 .sp
+.BI "struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd " "*pd" ", uint64_t " "offset" ,
+.BI "                                 size_t " "length" ", uint64_t " "iova" ,
+.BI "                                 int " "fd" ", int " "access" );
+.sp
 .BI "int ibv_dereg_mr(struct ibv_mr " "*mr" );
 .fi
 .SH "DESCRIPTION"
@@ -71,11 +75,30 @@ a lkey or rkey. The offset in the memory region is computed as 'addr +
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
+.I iova
+specifies the virtual base address of the MR when accessed through a lkey or rkey.
+It must have the same page offset as
+.I offset\fR.
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
index 4fb3893..b93046a 100644
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
@@ -370,6 +371,24 @@ void ibv_unimport_mr(struct ibv_mr *mr)
 	get_ops(mr->context)->unimport_mr(mr);
 }
 
+struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
+				 size_t length, uint64_t iova, int fd,
+				 int access)
+{
+	struct ibv_mr *mr;
+
+	mr = get_ops(pd->context)->reg_dmabuf_mr(pd, offset, length, iova,
+						 fd, access);
+	if (!mr)
+		return NULL;
+
+	mr->context = pd->context;
+	mr->pd = pd;
+	mr->addr = (void *)offset;
+	mr->length = length;
+	return mr;
+}
+
 LATEST_SYMVER_FUNC(ibv_rereg_mr, 1_1, "IBVERBS_1.1",
 		   int,
 		   struct ibv_mr *mr, int flags,
diff --git a/libibverbs/verbs.h b/libibverbs/verbs.h
index da782f2..656b0f9 100644
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
@@ -2536,6 +2537,12 @@ __ibv_reg_mr_iova(struct ibv_pd *pd, void *addr, size_t length, uint64_t iova,
 			  __builtin_constant_p(                                \
 				  ((access) & IBV_ACCESS_OPTIONAL_RANGE) == 0))
 
+/**
+ * ibv_reg_dmabuf_mr - Register a dambuf-based memory region
+ */
+struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
+				 uint64_t iova, int fd, int access);
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
