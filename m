Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52B28E3E4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 18:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267576EAB1;
	Wed, 14 Oct 2020 16:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD6D6EAA5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 16:02:02 +0000 (UTC)
IronPort-SDR: yaZw3Qid+dKpLaewostUJ62xYXoOn2Qb+rJveN4bQezDzqKS7pJ2sKk8vFc3S5mhi0A27M1HzF
 wc+3XwOB2kkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="183661651"
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; d="scan'208";a="183661651"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 09:01:31 -0700
IronPort-SDR: SdjKmP1y2PCUyb9QkV13uUYfRLXkhgcqHHeHrTnTdlDomyLH57deq5OZ2OYioQ5dzEFZn96dm1
 gd9S6BF7SggQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; d="scan'208";a="521471652"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2020 09:01:31 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/5] RDMA/uverbs: Add uverbs command for dma-buf based MR
 registration
Date: Wed, 14 Oct 2020 09:15:40 -0700
Message-Id: <1602692140-107018-1-git-send-email-jianxin.xiong@intel.com>
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

Implement a new uverbs ioctl method for memory registration with file
descriptor as an extra parameter.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
Reviewed-by: Sean Hefty <sean.hefty@intel.com>
Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Acked-by: Christian Koenig <christian.koenig@amd.com>
---
 drivers/infiniband/core/uverbs_std_types_mr.c | 112 ++++++++++++++++++++++++++
 include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++++
 2 files changed, 126 insertions(+)

diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c b/drivers/infiniband/core/uverbs_std_types_mr.c
index 9b22bb5..e54459f 100644
--- a/drivers/infiniband/core/uverbs_std_types_mr.c
+++ b/drivers/infiniband/core/uverbs_std_types_mr.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
+ * Copyright (c) 2020, Intel Corporation.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -178,6 +179,85 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
 	return IS_UVERBS_COPY_ERR(ret) ? ret : 0;
 }
 
+static int UVERBS_HANDLER(UVERBS_METHOD_REG_DMABUF_MR)(
+	struct uverbs_attr_bundle *attrs)
+{
+	struct ib_uobject *uobj =
+		uverbs_attr_get_uobject(attrs, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
+	struct ib_pd *pd =
+		uverbs_attr_get_obj(attrs, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE);
+	struct ib_device *ib_dev = pd->device;
+
+	u64 start, length, virt_addr;
+	u32 fd, access_flags;
+	struct ib_mr *mr;
+	int ret;
+
+	if (!ib_dev->ops.reg_user_mr_dmabuf)
+		return -EOPNOTSUPP;
+
+	ret = uverbs_copy_from(&start, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_ADDR);
+	if (ret)
+		return ret;
+
+	ret = uverbs_copy_from(&length, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_LENGTH);
+	if (ret)
+		return ret;
+
+	ret = uverbs_copy_from(&virt_addr, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_HCA_VA);
+	if (ret)
+		return ret;
+
+	ret = uverbs_copy_from(&fd, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_FD);
+	if (ret)
+		return ret;
+
+	ret = uverbs_get_flags32(&access_flags, attrs,
+				 UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+				 IB_ACCESS_SUPPORTED);
+	if (ret)
+		return ret;
+
+	ret = ib_check_mr_access(access_flags);
+	if (ret)
+		return ret;
+
+	mr = pd->device->ops.reg_user_mr_dmabuf(pd, start, length, virt_addr,
+						fd, access_flags,
+						&attrs->driver_udata);
+	if (IS_ERR(mr))
+		return PTR_ERR(mr);
+
+	mr->device  = pd->device;
+	mr->pd      = pd;
+	mr->type    = IB_MR_TYPE_USER;
+	mr->uobject = uobj;
+	atomic_inc(&pd->usecnt);
+
+	uobj->object = mr;
+
+	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
+			     &mr->lkey, sizeof(mr->lkey));
+	if (ret)
+		goto err_dereg;
+
+	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
+			     &mr->rkey, sizeof(mr->rkey));
+	if (ret)
+		goto err_dereg;
+
+	return 0;
+
+err_dereg:
+	ib_dereg_mr_user(mr, uverbs_get_cleared_udata(attrs));
+
+	return ret;
+}
+
 DECLARE_UVERBS_NAMED_METHOD(
 	UVERBS_METHOD_ADVISE_MR,
 	UVERBS_ATTR_IDR(UVERBS_ATTR_ADVISE_MR_PD_HANDLE,
@@ -243,6 +323,37 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
 			    UVERBS_ATTR_TYPE(u32),
 			    UA_MANDATORY));
 
+DECLARE_UVERBS_NAMED_METHOD(
+	UVERBS_METHOD_REG_DMABUF_MR,
+	UVERBS_ATTR_IDR(UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
+			UVERBS_OBJECT_MR,
+			UVERBS_ACCESS_NEW,
+			UA_MANDATORY),
+	UVERBS_ATTR_IDR(UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE,
+			UVERBS_OBJECT_PD,
+			UVERBS_ACCESS_READ,
+			UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_ADDR,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_HCA_VA,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_FD,
+			   UVERBS_ATTR_TYPE(u32),
+			   UA_MANDATORY),
+	UVERBS_ATTR_FLAGS_IN(UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+			     enum ib_access_flags),
+	UVERBS_ATTR_PTR_OUT(UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
+			    UVERBS_ATTR_TYPE(u32),
+			    UA_MANDATORY),
+	UVERBS_ATTR_PTR_OUT(UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
+			    UVERBS_ATTR_TYPE(u32),
+			    UA_MANDATORY));
+
 DECLARE_UVERBS_NAMED_METHOD_DESTROY(
 	UVERBS_METHOD_MR_DESTROY,
 	UVERBS_ATTR_IDR(UVERBS_ATTR_DESTROY_MR_HANDLE,
@@ -253,6 +364,7 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
 DECLARE_UVERBS_NAMED_OBJECT(
 	UVERBS_OBJECT_MR,
 	UVERBS_TYPE_ALLOC_IDR(uverbs_free_mr),
+	&UVERBS_METHOD(UVERBS_METHOD_REG_DMABUF_MR),
 	&UVERBS_METHOD(UVERBS_METHOD_DM_MR_REG),
 	&UVERBS_METHOD(UVERBS_METHOD_MR_DESTROY),
 	&UVERBS_METHOD(UVERBS_METHOD_ADVISE_MR),
diff --git a/include/uapi/rdma/ib_user_ioctl_cmds.h b/include/uapi/rdma/ib_user_ioctl_cmds.h
index 7968a18..7e07f52 100644
--- a/include/uapi/rdma/ib_user_ioctl_cmds.h
+++ b/include/uapi/rdma/ib_user_ioctl_cmds.h
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
+	UVERBS_ATTR_REG_DMABUF_MR_ADDR,
+	UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
+	UVERBS_ATTR_REG_DMABUF_MR_HCA_VA,
+	UVERBS_ATTR_REG_DMABUF_MR_FD,
+	UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+	UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
+	UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
+};
+
 enum uverbs_attrs_create_counters_cmd_attr_ids {
 	UVERBS_ATTR_CREATE_COUNTERS_HANDLE,
 };
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
