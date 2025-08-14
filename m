Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9FB26C09
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29210E8AC;
	Thu, 14 Aug 2025 16:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="REiJyXhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093510E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:11:00 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EGApFV1916359;
 Thu, 14 Aug 2025 11:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755187851;
 bh=2Ig6l3paNM4Nw8JsMQGv/kPeljj1hI9QWQbQPT8/jcE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=REiJyXhb1QBaC7QWdN1cY2FkQId2g/WGpcR70iGO+x/FmqvaPIv8a+SE8BgyuA03N
 GPv15OjQ/ONcSn82Vm/QUl0TVJ9FpE3VBsDHWX71puodO6O7EBPP+qJV1TXrP/JmPW
 /PB/Y9VfNHPBMRNhF9acXaMzQGFUuDvSOJpw/sXQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EGApQ61264126
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 14 Aug 2025 11:10:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 11:10:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 11:10:50 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EGAndl4172380;
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
Subject: [PATCH v2 1/3] udmabuf: Keep track current device mappings
Date: Thu, 14 Aug 2025 11:10:47 -0500
Message-ID: <20250814161049.678672-2-afd@ti.com>
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

When a device attaches to and maps our buffer we need to keep track
of this mapping/device. This is needed for synchronization with these
devices when beginning and ending CPU access for instance. Add a list
that tracks device mappings as part of {map,unmap}_udmabuf().

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/dma-buf/udmabuf.c | 45 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 40399c26e6be6..cc5c1cc42c7f2 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -42,6 +42,14 @@ struct udmabuf {
 	struct sg_table *sg;
 	struct miscdevice *device;
 	pgoff_t *offsets;
+	struct list_head attachments;
+	struct mutex lock; /* for attachments list */
+};
+
+struct udmabuf_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -185,14 +193,44 @@ static void put_sg_table(struct device *dev, struct sg_table *sg,
 static struct sg_table *map_udmabuf(struct dma_buf_attachment *at,
 				    enum dma_data_direction direction)
 {
-	return get_sg_table(at->dev, at->dmabuf, direction);
+	struct udmabuf *ubuf = at->dmabuf->priv;
+	struct udmabuf_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return ERR_PTR(-ENOMEM);
+
+	table = get_sg_table(at->dev, at->dmabuf, direction);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return table;
+	}
+
+	a->dev = at->dev;
+	a->table = table;
+
+	mutex_lock(&ubuf->lock);
+	list_add(&a->list, &ubuf->attachments);
+	mutex_unlock(&ubuf->lock);
+
+	return a->table;
 }
 
 static void unmap_udmabuf(struct dma_buf_attachment *at,
 			  struct sg_table *sg,
 			  enum dma_data_direction direction)
 {
-	return put_sg_table(at->dev, sg, direction);
+	struct udmabuf_attachment *a = at->priv;
+	struct udmabuf *ubuf = at->dmabuf->priv;
+
+	mutex_lock(&ubuf->lock);
+	list_del(&a->list);
+	mutex_unlock(&ubuf->lock);
+
+	put_sg_table(at->dev, sg, direction);
+
+	kfree(a);
 }
 
 static void unpin_all_folios(struct udmabuf *ubuf)
@@ -384,6 +422,9 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&ubuf->attachments);
+	mutex_init(&ubuf->lock);
+
 	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		pgoff_t subpgcnt;
-- 
2.39.2

