Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAF42515A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8861A6F3FB;
	Thu,  7 Oct 2021 10:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDA36F3FC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1633603423; x=1665139423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZC5z2T2gw+PahGCJ3v0eUrB5lX6HX0lWhLeZpwqBms0=;
 b=J4sHm7aPfDrOgzAFz6l8+7BoDWt5BzmI6A/n7V0t0Z+2NW3sU/A7h4Kb
 9lesvAdmq2iO/VBRjbNPm/OVOt9uHYGjeTfWbsST8ggF4n+olEuGlYBGL
 sznEfS6/+Bi9v2JwWaC6ZjniOof4eKO7HiUC5P2Ot3ty+cGp1xunWKTdg 0=;
X-IronPort-AV: E=Sophos;i="5.85,354,1624320000"; d="scan'208";a="142961449"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 07 Oct 2021 10:43:33 +0000
Received: from EX13D02EUC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com (Postfix) with
 ESMTPS id 8D121415A8; Thu,  7 Oct 2021 10:43:32 +0000 (UTC)
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D02EUC001.ant.amazon.com (10.43.164.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 7 Oct 2021 10:43:31 +0000
Received: from 8c85908914bf.ant.amazon.com.com (10.1.213.27) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1497.23 via Frontend Transport; Thu, 7 Oct 2021 10:43:24 +0000
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
Subject: [RFC PATCH 2/2] RDMA/efa: Add support for dmabuf memory regions
Date: Thu, 7 Oct 2021 13:43:00 +0300
Message-ID: <20211007104301.76693-3-galpress@amazon.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007104301.76693-1-galpress@amazon.com>
References: <20211007104301.76693-1-galpress@amazon.com>
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
the dmabuf memory regions always pin the buffers to prevent the
move_notify callback from being called.

Signed-off-by: Gal Pressman <galpress@amazon.com>
---
 drivers/infiniband/hw/efa/efa.h       |   4 +
 drivers/infiniband/hw/efa/efa_main.c  |   1 +
 drivers/infiniband/hw/efa/efa_verbs.c | 166 +++++++++++++++++++++-----
 3 files changed, 141 insertions(+), 30 deletions(-)

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
index be6d3ff0f1be..ca907853a84f 100644
--- a/drivers/infiniband/hw/efa/efa_verbs.c
+++ b/drivers/infiniband/hw/efa/efa_verbs.c
@@ -3,6 +3,8 @@
  * Copyright 2018-2020 Amazon.com, Inc. or its affiliates. All rights reserved.
  */
 
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include <linux/vmalloc.h>
 #include <linux/log2.h>
 
@@ -1491,26 +1493,29 @@ static int efa_create_pbl(struct efa_dev *dev,
 	return 0;
 }
 
-struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
-			 u64 virt_addr, int access_flags,
-			 struct ib_udata *udata)
+static void efa_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
+{
+	WARN_ON_ONCE(1,
+		     "Invalidate callback should not be called when memory is pinned\n");
+}
+
+static struct dma_buf_attach_ops efa_dmabuf_attach_ops = {
+	.allow_peer2peer = true,
+	.move_notify = efa_dmabuf_invalidate_cb,
+};
+
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
@@ -1522,23 +1527,26 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
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
@@ -1549,10 +1557,9 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
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
@@ -1566,21 +1573,21 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
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
@@ -1588,9 +1595,98 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
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
+	umem_dmabuf = ib_umem_dmabuf_get(ibpd->device, start, length, fd,
+					 access_flags, &efa_dmabuf_attach_ops);
+	if (IS_ERR(umem_dmabuf)) {
+		ibdev_dbg(&dev->ibdev, "Failed to get dmabuf[%d]\n", err);
+		err = PTR_ERR(umem_dmabuf);
+		goto err_free;
+	}
+
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	err = dma_buf_pin(umem_dmabuf->attach);
+	if (err) {
+		ibdev_dbg(&dev->ibdev, "Failed to pin dmabuf memory\n");
+		goto err_release;
+	}
+
+	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
+	if (err) {
+		ibdev_dbg(&dev->ibdev, "Failed to map dmabuf pages\n");
+		goto err_unpin;
+	}
+	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
+
+	mr->umem = &umem_dmabuf->umem;
+	err = efa_register_mr(ibpd, mr, start, length, virt_addr, access_flags);
+	if (err)
+		goto err_unmap;
+
 	return &mr->ibmr;
 
 err_unmap:
+	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
+err_unpin:
+	dma_buf_unpin(umem_dmabuf->attach);
+err_release:
+	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
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
@@ -1603,6 +1699,7 @@ int efa_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
 {
 	struct efa_dev *dev = to_edev(ibmr->device);
 	struct efa_com_dereg_mr_params params;
+	struct ib_umem_dmabuf *umem_dmabuf;
 	struct efa_mr *mr = to_emr(ibmr);
 	int err;
 
@@ -1613,6 +1710,15 @@ int efa_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
 	if (err)
 		return err;
 
+	if (mr->umem->is_dmabuf) {
+		umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
+
+		dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
+		ib_umem_dmabuf_unmap_pages(umem_dmabuf);
+		dma_buf_unpin(umem_dmabuf->attach);
+		dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
+	}
+
 	ib_umem_release(mr->umem);
 	kfree(mr);
 
-- 
2.33.0

