Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61C2A89E5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 23:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4089147;
	Thu,  5 Nov 2020 22:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A40D6EDF6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 22:34:19 +0000 (UTC)
IronPort-SDR: mXnxYd/9ZFo6Qfqj1vm/jy8A+NDqrY8fJob1nH4doyuIIkoktDihpEmLg0vhoAKIOFVKR9WReB
 YhqSRAquzreA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="169581911"
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; d="scan'208";a="169581911"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 14:34:19 -0800
IronPort-SDR: KayF1SQKazR1gNpXWzkSsQspErKmprDDRd+6S6Uzj2ku7IlHnu3kje6tYZ4VNvUnrSHLof7oEf
 dUVRgCRvi87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; d="scan'208";a="363980555"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2020 14:34:18 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based MR
 registration
Date: Thu,  5 Nov 2020 14:48:07 -0800
Message-Id: <1604616489-69267-4-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
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
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/infiniband/core/uverbs_std_types_mr.c | 112 ++++++++++++++++++++++++++
 include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++++
 2 files changed, 126 insertions(+)

diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c b/drivers/infiniband/core/uverbs_std_types_mr.c
index 9b22bb5..f22e58b 100644
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
+	u64 offset, length, virt_addr;
+	u32 fd, access_flags;
+	struct ib_mr *mr;
+	int ret;
+
+	if (!ib_dev->ops.reg_user_mr_dmabuf)
+		return -EOPNOTSUPP;
+
+	ret = uverbs_copy_from(&offset, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_OFFSET);
+	if (ret)
+		return ret;
+
+	ret = uverbs_copy_from(&length, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_LENGTH);
+	if (ret)
+		return ret;
+
+	ret = uverbs_copy_from(&virt_addr, attrs,
+			       UVERBS_ATTR_REG_DMABUF_MR_IOVA);
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
+	mr = pd->device->ops.reg_user_mr_dmabuf(pd, offset, length, virt_addr,
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
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_OFFSET,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_IOVA,
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
index 7968a18..dafc7eb 100644
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
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
