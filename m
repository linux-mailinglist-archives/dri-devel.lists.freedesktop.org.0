Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B03EFE23
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23816E479;
	Wed, 18 Aug 2021 07:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC236E479
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1629272736; x=1660808736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gea+CxC3NBudbiuJVzgvdOp/DWIOyvVEeeipiHZ4r9w=;
 b=m+V12C6jTODZP7SJ15QG+Yq6dAdn+wibur511I+xyjdnsKdtVcV1csnr
 OBw9CXG39v8LgRss0OJ2vrHBQ9k0V3maJV1CNXHmd0dup1ODE4X4Pg0zV
 MamArYW9DzygIhXz1uTTG2KhmcH/64JH28hshgif+WqcYw15hhZP+qlxm U=;
X-IronPort-AV: E=Sophos;i="5.84,330,1620691200"; d="scan'208";a="153217483"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 18 Aug 2021 07:45:28 +0000
Received: from EX13D19EUA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id AA82324B6B6; Wed, 18 Aug 2021 07:45:22 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D19EUA001.ant.amazon.com (10.43.165.74) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Wed, 18 Aug 2021 07:45:21 +0000
Received: from 8c85908914bf.ant.amazon.com.com (10.1.213.15) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1497.23 via Frontend Transport; Wed, 18 Aug 2021 07:45:16 +0000
From: Gal Pressman <galpress@amazon.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Doug Ledford <dledford@redhat.com>, Jason
 Gunthorpe <jgg@ziepe.ca>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Oded Gabbay
 <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich
 <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, Leon
 Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>, Gal
 Pressman <galpress@amazon.com>
Subject: [RFC] Make use of non-dynamic dmabuf in RDMA
Date: Wed, 18 Aug 2021 10:43:51 +0300
Message-ID: <20210818074352.29950-1-galpress@amazon.com>
X-Mailer: git-send-email 2.32.0
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

Hey all,

Currently, the RDMA subsystem can only work with dynamic dmabuf
attachments, which requires the RDMA device to support on-demand-paging
(ODP) which is not common on most devices (only supported by mlx5).

While the dynamic requirement makes sense for certain GPUs, some devices
(such as habanalabs) have device memory that is always "pinned" and do
not need/use the move_notify operation.

The motivation of this RFC is to use habanalabs as the dmabuf exporter,
and EFA as the importer to allow for peer2peer access through libibverbs.

This draft patch changes the dmabuf driver to differentiate between
static/dynamic attachments by looking at the move_notify op instead of
the importer_ops struct, and allowing the peer2peer flag to be enabled
in case of a static exporter.

Thanks

Signed-off-by: Gal Pressman <galpress@amazon.com>
---
 drivers/dma-buf/dma-buf.c             | 5 +++--
 drivers/infiniband/core/umem_dmabuf.c | 2 +-
 include/linux/dma-buf.h               | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..e3faad8f492c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -727,7 +727,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
 
-	if (WARN_ON(importer_ops && !importer_ops->move_notify))
+	if (WARN_ON(importer_ops && !importer_ops->move_notify &&
+		    dma_buf_is_dynamic(attach->dmabuf)))
 		return ERR_PTR(-EINVAL);
 
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
@@ -1048,7 +1049,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
 	dma_resv_assert_held(dmabuf->resv);
 
 	list_for_each_entry(attach, &dmabuf->attachments, node)
-		if (attach->importer_ops)
+		if (attach->importer_ops && attach->importer_ops->move_notify)
 			attach->importer_ops->move_notify(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_move_notify);
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index c6e875619fac..c502ae828bd3 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -118,7 +118,7 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (check_add_overflow(offset, (unsigned long)size, &end))
 		return ret;
 
-	if (unlikely(!ops || !ops->move_notify))
+	if (unlikely(!ops))
 		return ret;
 
 	dmabuf = dma_buf_get(fd);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..4b2e99012cb1 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -473,7 +473,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 static inline bool
 dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
 {
-	return !!attach->importer_ops;
+	return !!attach->importer_ops->move_notify;
 }
 
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-- 
2.32.0

