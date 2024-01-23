Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E957839BE7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 23:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C2610E5BD;
	Tue, 23 Jan 2024 22:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AF810E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 22:12:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NMCTA0037452;
 Tue, 23 Jan 2024 16:12:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1706047949;
 bh=O9hVuXwF6nE6rUWyrB9U3f/wPgQjIzOpQGzpiCphLH8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vmty/q4lJum4ChM0nmBfE+luuoEk2v+xFJ/dc2MuxnlqJrr13o/nP8dypXgK4YJ0Q
 Sl0BdC2J0Jpps1MxHqBt2QosGfOM0iA/vzGTKRUvNUEvrkoLTqf/a3vdUC5nQa/uK1
 UwapsJ4hae9RC3mM+ATs9H7p5bYqqzdLK1RTo0DI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NMCTK9024752
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jan 2024 16:12:29 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 16:12:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 16:12:29 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NMCSuT068795;
 Tue, 23 Jan 2024 16:12:29 -0600
From: Andrew Davis <afd@ti.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Date: Tue, 23 Jan 2024 16:12:26 -0600
Message-ID: <20240123221227.868341-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123221227.868341-1-afd@ti.com>
References: <20240123221227.868341-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linaro-mm-sig@lists.linaro.org, Andrew Davis <afd@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently this driver creates a SGT table using the CPU as the
target device, then performs the dma_sync operations against
that SGT. This is backwards to how DMA-BUFs are supposed to behave.
This may have worked for the case where these buffers were given
only back to the same CPU that produced them as in the QEMU case.
And only then because the original author had the dma_sync
operations also backwards, syncing for the "device" on begin_cpu.
This was noticed and "fixed" in this patch[0].

That then meant we were sync'ing from the CPU to the CPU using
a pseudo-device "miscdevice". Which then caused another issue
due to the miscdevice not having a proper DMA mask (and why should
it, the CPU is not a DMA device). The fix for that was an even
more egregious hack[1] that declares the CPU is coherent with
itself and can access its own memory space..

Unwind all this and perform the correct action by doing the dma_sync
operations for each device currently attached to the backing buffer.

[0] commit 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
[1] commit 9e9fa6a9198b ("udmabuf: Set the DMA mask for the udmabuf device (v2)")

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/dma-buf/udmabuf.c | 41 +++++++++++++++------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 3a23f0a7d112a..ab6764322523c 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -26,8 +26,6 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
 struct udmabuf {
 	pgoff_t pagecount;
 	struct page **pages;
-	struct sg_table *sg;
-	struct miscdevice *device;
 	struct list_head attachments;
 	struct mutex lock;
 };
@@ -169,12 +167,8 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 static void release_udmabuf(struct dma_buf *buf)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct device *dev = ubuf->device->this_device;
 	pgoff_t pg;
 
-	if (ubuf->sg)
-		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
-
 	for (pg = 0; pg < ubuf->pagecount; pg++)
 		put_page(ubuf->pages[pg]);
 	kfree(ubuf->pages);
@@ -185,33 +179,31 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 			     enum dma_data_direction direction)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct device *dev = ubuf->device->this_device;
-	int ret = 0;
-
-	if (!ubuf->sg) {
-		ubuf->sg = get_sg_table(dev, buf, direction);
-		if (IS_ERR(ubuf->sg)) {
-			ret = PTR_ERR(ubuf->sg);
-			ubuf->sg = NULL;
-		}
-	} else {
-		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
-				    direction);
-	}
+	struct udmabuf_attachment *a;
 
-	return ret;
+	mutex_lock(&ubuf->lock);
+
+	list_for_each_entry(a, &ubuf->attachments, list)
+		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+
+	mutex_unlock(&ubuf->lock);
+
+	return 0;
 }
 
 static int end_cpu_udmabuf(struct dma_buf *buf,
 			   enum dma_data_direction direction)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct device *dev = ubuf->device->this_device;
+	struct udmabuf_attachment *a;
 
-	if (!ubuf->sg)
-		return -EINVAL;
+	mutex_lock(&ubuf->lock);
+
+	list_for_each_entry(a, &ubuf->attachments, list)
+		dma_sync_sgtable_for_device(a->dev, a->table, direction);
+
+	mutex_unlock(&ubuf->lock);
 
-	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
 	return 0;
 }
 
@@ -307,7 +299,6 @@ static long udmabuf_create(struct miscdevice *device,
 	exp_info.priv = ubuf;
 	exp_info.flags = O_RDWR;
 
-	ubuf->device = device;
 	buf = dma_buf_export(&exp_info);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
-- 
2.39.2

