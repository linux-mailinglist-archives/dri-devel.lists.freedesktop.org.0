Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16342A3FA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 14:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595686E915;
	Tue, 12 Oct 2021 12:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677D8894C3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1634040577; x=1665576577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RAvVbglZIGn00+TK43/FpsCS0ygJ/42Q29aCAfOFiOw=;
 b=P25h076dDEdzO9E+irPzdwL447ITyVwMR60wUmE4BrZoYS7KwNFHEsph
 NJYHKIQ3XbBKoVZRA30OTiSp+2JXSk51Yg/moR7+IF3g6EVXBwWPS/3F+
 Jf+OHRJPGgIZ6JKVbY8py6FmWsI7fPHu0Oz6i8niWKGHTP6myZ75iScT8 8=;
X-IronPort-AV: E=Sophos;i="5.85,367,1624320000"; d="scan'208";a="147112909"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-1f9d5b26.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 12 Oct 2021 12:09:35 +0000
Received: from EX13D02EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-1f9d5b26.us-west-2.amazon.com (Postfix) with
 ESMTPS id 049DD423AC; Tue, 12 Oct 2021 12:09:31 +0000 (UTC)
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D02EUB003.ant.amazon.com (10.43.166.172) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 12 Oct 2021 12:09:30 +0000
Received: from 8c85908914bf.ant.amazon.com.com (10.1.212.21) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1497.23 via Frontend Transport; Tue, 12 Oct 2021 12:09:26 +0000
From: Gal Pressman <galpress@amazon.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Doug Ledford <dledford@redhat.com>, Jason
 Gunthorpe <jgg@ziepe.ca>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Oded Gabbay
 <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich
 <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, Leon
 Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Firas Jahjah <firasj@amazon.com>, Gal Pressman <galpress@amazon.com>
Subject: [PATCH for-next 3/3] RDMA/efa: Add support for dmabuf memory regions
Date: Tue, 12 Oct 2021 15:09:03 +0300
Message-ID: <20211012120903.96933-4-galpress@amazon.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012120903.96933-1-galpress@amazon.com>
References: <20211012120903.96933-1-galpress@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a dmabuf importer for the EFA driver. As ODP is not supported,
the pinned dmabuf are used to prevent the move_notify callback from
being called.

Signed-off-by: Gal Pressman <galpress@amazon.com>
---
 drivers/infiniband/hw/efa/efa.h       |   4 +
 drivers/infiniband/hw/efa/efa_main.c  |   1 +
 drivers/infiniband/hw/efa/efa_verbs.c | 127 +++++++++++++++++++-------
 3 files changed, 101 insertions(+), 31 deletions(-)

diff --git a/drivers/infiniband/hw/efa/efa.h b/drivers/infiniband/hw/efa/efa.h
index 2b8ca099b381..407d7c4baa16 100644
--- a/drivers/infiniband/hw/efa/efa.h
+++ b/drivers/infiniband/hw/efa/efa.h
@@ -141,6 +141,10 @@ int efa_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 			 u64 virt_addr, int access_flags,
 			 struct ib_udata *udata);
+struct ib_mr *efa_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
+				     u64 length, u64 virt_addr,
+				     int fd, int access_flags,
+				     struct ib_udata *udata);
 int efa_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata);
 int efa_get_port_immutable(struct ib_device *ibdev, u32 port_num,
 			   struct ib_port_immutable *immutable);
diff --git a/drivers/infiniband/hw/efa/efa_main.c b/drivers/infiniband/hw/efa/efa_main.c
index 203e6ddcacbc..72cd7d952a07 100644
--- a/drivers/infiniband/hw/efa/efa_main.c
+++ b/drivers/infiniband/hw/efa/efa_main.c
@@ -267,6 +267,7 @@ static const struct ib_device_ops efa_dev_ops = {
 	.query_port = efa_query_port,
 	.query_qp = efa_query_qp,
 	.reg_user_mr = efa_reg_mr,
+	.reg_user_mr_dmabuf = efa_reg_user_mr_dmabuf,
 
 	INIT_RDMA_OBJ_SIZE(ib_ah, efa_ah, ibah),
 	INIT_RDMA_OBJ_SIZE(ib_cq, efa_cq, ibcq),
diff --git a/drivers/infiniband/hw/efa/efa_verbs.c b/drivers/infiniband/hw/efa/efa_verbs.c
index be6d3ff0f1be..659f5aab3d9e 100644
--- a/drivers/infiniband/hw/efa/efa_verbs.c
+++ b/drivers/infiniband/hw/efa/efa_verbs.c
@@ -3,6 +3,8 @@
  * Copyright 2018-2020 Amazon.com, Inc. or its affiliates. All rights reserved.
  */
 
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include <linux/vmalloc.h>
 #include <linux/log2.h>
 
@@ -1491,26 +1493,18 @@ static int efa_create_pbl(struct efa_dev *dev,
 	return 0;
 }
 
-struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
-			 u64 virt_addr, int access_flags,
-			 struct ib_udata *udata)
+static struct efa_mr *efa_alloc_mr(struct ib_pd *ibpd, int access_flags,
+				   struct ib_udata *udata)
 {
 	struct efa_dev *dev = to_edev(ibpd->device);
-	struct efa_com_reg_mr_params params = {};
-	struct efa_com_reg_mr_result result = {};
-	struct pbl_context pbl;
 	int supp_access_flags;
-	unsigned int pg_sz;
 	struct efa_mr *mr;
-	int inline_size;
-	int err;
 
 	if (udata && udata->inlen &&
 	    !ib_is_udata_cleared(udata, 0, sizeof(udata->inlen))) {
 		ibdev_dbg(&dev->ibdev,
 			  "Incompatible ABI params, udata not cleared\n");
-		err = -EINVAL;
-		goto err_out;
+		return ERR_PTR(-EINVAL);
 	}
 
 	supp_access_flags =
@@ -1522,23 +1516,26 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 		ibdev_dbg(&dev->ibdev,
 			  "Unsupported access flags[%#x], supported[%#x]\n",
 			  access_flags, supp_access_flags);
-		err = -EOPNOTSUPP;
-		goto err_out;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	mr = kzalloc(sizeof(*mr), GFP_KERNEL);
-	if (!mr) {
-		err = -ENOMEM;
-		goto err_out;
-	}
+	if (!mr)
+		return ERR_PTR(-ENOMEM);
 
-	mr->umem = ib_umem_get(ibpd->device, start, length, access_flags);
-	if (IS_ERR(mr->umem)) {
-		err = PTR_ERR(mr->umem);
-		ibdev_dbg(&dev->ibdev,
-			  "Failed to pin and map user space memory[%d]\n", err);
-		goto err_free;
-	}
+	return mr;
+}
+
+static int efa_register_mr(struct ib_pd *ibpd, struct efa_mr *mr, u64 start,
+			   u64 length, u64 virt_addr, int access_flags)
+{
+	struct efa_dev *dev = to_edev(ibpd->device);
+	struct efa_com_reg_mr_params params = {};
+	struct efa_com_reg_mr_result result = {};
+	struct pbl_context pbl;
+	unsigned int pg_sz;
+	int inline_size;
+	int err;
 
 	params.pd = to_epd(ibpd)->pdn;
 	params.iova = virt_addr;
@@ -1549,10 +1546,9 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 				       dev->dev_attr.page_size_cap,
 				       virt_addr);
 	if (!pg_sz) {
-		err = -EOPNOTSUPP;
 		ibdev_dbg(&dev->ibdev, "Failed to find a suitable page size in page_size_cap %#llx\n",
 			  dev->dev_attr.page_size_cap);
-		goto err_unmap;
+		return -EOPNOTSUPP;
 	}
 
 	params.page_shift = order_base_2(pg_sz);
@@ -1566,21 +1562,21 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 	if (params.page_num <= inline_size) {
 		err = efa_create_inline_pbl(dev, mr, &params);
 		if (err)
-			goto err_unmap;
+			return err;
 
 		err = efa_com_register_mr(&dev->edev, &params, &result);
 		if (err)
-			goto err_unmap;
+			return err;
 	} else {
 		err = efa_create_pbl(dev, &pbl, mr, &params);
 		if (err)
-			goto err_unmap;
+			return err;
 
 		err = efa_com_register_mr(&dev->edev, &params, &result);
 		pbl_destroy(dev, &pbl);
 
 		if (err)
-			goto err_unmap;
+			return err;
 	}
 
 	mr->ibmr.lkey = result.l_key;
@@ -1588,9 +1584,78 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 	mr->ibmr.length = length;
 	ibdev_dbg(&dev->ibdev, "Registered mr[%d]\n", mr->ibmr.lkey);
 
+	return 0;
+}
+
+struct ib_mr *efa_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
+				     u64 length, u64 virt_addr,
+				     int fd, int access_flags,
+				     struct ib_udata *udata)
+{
+	struct efa_dev *dev = to_edev(ibpd->device);
+	struct ib_umem_dmabuf *umem_dmabuf;
+	struct efa_mr *mr;
+	int err;
+
+	mr = efa_alloc_mr(ibpd, access_flags, udata);
+	if (IS_ERR(mr)) {
+		err = PTR_ERR(mr);
+		goto err_out;
+	}
+
+	umem_dmabuf = ib_umem_dmabuf_get_pinned(ibpd->device, start, length, fd,
+						access_flags);
+	if (IS_ERR(umem_dmabuf)) {
+		ibdev_dbg(&dev->ibdev, "Failed to get dmabuf umem[%d]\n", err);
+		err = PTR_ERR(umem_dmabuf);
+		goto err_free;
+	}
+
+	mr->umem = &umem_dmabuf->umem;
+	err = efa_register_mr(ibpd, mr, start, length, virt_addr, access_flags);
+	if (err)
+		goto err_release;
+
 	return &mr->ibmr;
 
-err_unmap:
+err_release:
+	ib_umem_release(mr->umem);
+err_free:
+	kfree(mr);
+err_out:
+	atomic64_inc(&dev->stats.reg_mr_err);
+	return ERR_PTR(err);
+}
+
+struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
+			 u64 virt_addr, int access_flags,
+			 struct ib_udata *udata)
+{
+	struct efa_dev *dev = to_edev(ibpd->device);
+	struct efa_mr *mr;
+	int err;
+
+	mr = efa_alloc_mr(ibpd, access_flags, udata);
+	if (IS_ERR(mr)) {
+		err = PTR_ERR(mr);
+		goto err_out;
+	}
+
+	mr->umem = ib_umem_get(ibpd->device, start, length, access_flags);
+	if (IS_ERR(mr->umem)) {
+		err = PTR_ERR(mr->umem);
+		ibdev_dbg(&dev->ibdev,
+			  "Failed to pin and map user space memory[%d]\n", err);
+		goto err_free;
+	}
+
+	err = efa_register_mr(ibpd, mr, start, length, virt_addr, access_flags);
+	if (err)
+		goto err_release;
+
+	return &mr->ibmr;
+
+err_release:
 	ib_umem_release(mr->umem);
 err_free:
 	kfree(mr);
-- 
2.33.0

