Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC3B26C0A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D279210E8AE;
	Thu, 14 Aug 2025 16:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Mi25nH73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978810E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:11:01 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EGApTC2341387;
 Thu, 14 Aug 2025 11:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755187851;
 bh=aVAhYkleVSv4ZtITWuhjhbqLUh5eZKiY9tFN77/BJTM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Mi25nH73vhkTSs+fAIpuSpmrg0S/s1kq4+1VCYJn1uYFzVexATNk+M9HtWCpu3hKV
 QDIAwqLsW3t5krZHDQp8HOhXwzeVA9P52gViYKzvqPwonsejcNPONTeP9uHxt7OnLP
 f1L586FejvvP8PHcgA8Yc2cAFDbsRKfD3EN8OQrQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EGAp8o1264129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 14 Aug 2025 11:10:51 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 11:10:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 11:10:51 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EGAndm4172380;
 Thu, 14 Aug 2025 11:10:50 -0500
From: Andrew Davis <afd@ti.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>, Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 2/3] udmabuf: Sync buffer mappings for attached devices
Date: Thu, 14 Aug 2025 11:10:48 -0500
Message-ID: <20250814161049.678672-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814161049.678672-1-afd@ti.com>
References: <20250814161049.678672-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
 drivers/dma-buf/udmabuf.c | 64 +++++++++++++--------------------------
 1 file changed, 21 insertions(+), 43 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index cc5c1cc42c7f2..8d71c3d72eb5e 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -39,8 +39,6 @@ struct udmabuf {
 	pgoff_t nr_pinned;
 	struct folio **pinned_folios;
 
-	struct sg_table *sg;
-	struct miscdevice *device;
 	pgoff_t *offsets;
 	struct list_head attachments;
 	struct mutex lock; /* for attachments list */
@@ -272,10 +270,6 @@ static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
 static void release_udmabuf(struct dma_buf *buf)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct device *dev = ubuf->device->this_device;
-
-	if (ubuf->sg)
-		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	deinit_udmabuf(ubuf);
 	kfree(ubuf);
@@ -285,32 +279,27 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
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
-		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
-	}
+	struct udmabuf_attachment *a;
 
-	return ret;
+	guard(mutex)(&ubuf->lock);
+
+	list_for_each_entry(a, &ubuf->attachments, list)
+		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
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
+	guard(mutex)(&ubuf->lock);
+
+	list_for_each_entry(a, &ubuf->attachments, list)
+		dma_sync_sgtable_for_device(a->dev, a->table, direction);
 
-	dma_sync_sgtable_for_device(dev, ubuf->sg, direction);
 	return 0;
 }
 
@@ -346,12 +335,10 @@ static int check_memfd_seals(struct file *memfd)
 	return 0;
 }
 
-static struct dma_buf *export_udmabuf(struct udmabuf *ubuf,
-				      struct miscdevice *device)
+static struct dma_buf *export_udmabuf(struct udmabuf *ubuf)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
-	ubuf->device = device;
 	exp_info.ops  = &udmabuf_ops;
 	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
 	exp_info.priv = ubuf;
@@ -406,8 +393,7 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 	return 0;
 }
 
-static long udmabuf_create(struct miscdevice *device,
-			   struct udmabuf_create_list *head,
+static long udmabuf_create(struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
 	unsigned long max_nr_folios = 0;
@@ -482,7 +468,7 @@ static long udmabuf_create(struct miscdevice *device,
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
-	dmabuf = export_udmabuf(ubuf, device);
+	dmabuf = export_udmabuf(ubuf);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
 		goto err;
@@ -508,7 +494,7 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 }
 
-static long udmabuf_ioctl_create(struct file *filp, unsigned long arg)
+static long udmabuf_ioctl_create(unsigned long arg)
 {
 	struct udmabuf_create create;
 	struct udmabuf_create_list head;
@@ -524,10 +510,10 @@ static long udmabuf_ioctl_create(struct file *filp, unsigned long arg)
 	list.offset = create.offset;
 	list.size   = create.size;
 
-	return udmabuf_create(filp->private_data, &head, &list);
+	return udmabuf_create(&head, &list);
 }
 
-static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
+static long udmabuf_ioctl_create_list(unsigned long arg)
 {
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
@@ -543,7 +529,7 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	if (IS_ERR(list))
 		return PTR_ERR(list);
 
-	ret = udmabuf_create(filp->private_data, &head, list);
+	ret = udmabuf_create(&head, list);
 	kfree(list);
 	return ret;
 }
@@ -555,10 +541,10 @@ static long udmabuf_ioctl(struct file *filp, unsigned int ioctl,
 
 	switch (ioctl) {
 	case UDMABUF_CREATE:
-		ret = udmabuf_ioctl_create(filp, arg);
+		ret = udmabuf_ioctl_create(arg);
 		break;
 	case UDMABUF_CREATE_LIST:
-		ret = udmabuf_ioctl_create_list(filp, arg);
+		ret = udmabuf_ioctl_create_list(arg);
 		break;
 	default:
 		ret = -ENOTTY;
@@ -591,14 +577,6 @@ static int __init udmabuf_dev_init(void)
 		return ret;
 	}
 
-	ret = dma_coerce_mask_and_coherent(udmabuf_misc.this_device,
-					   DMA_BIT_MASK(64));
-	if (ret < 0) {
-		pr_err("Could not setup DMA mask for udmabuf device\n");
-		misc_deregister(&udmabuf_misc);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.39.2

