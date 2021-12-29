Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E97481E88
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C850A10E298;
	Thu, 30 Dec 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6447A10E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 07:09:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r17so42667300wrc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 23:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ee3/Ct1G+mZzQD8p6bAGJfxmlHApZMCGVdI9a5DfxHc=;
 b=VjqeyP1IDih5o+n1wQblN72N3hdhvMr6/Cm3trtcg9PG5yN29SeoxPW1ICtI8wJeNP
 /Zm7BpbQwjpc4IKxVkZSkh2QHBQS2JAjUeVdDZyjtoR0Q1+zfrMPyxM/2hQp/Trx0fFX
 /OZw/2PPWo3utgdKD58fKoe08OPjeVPNO2iZn8IsQTdT84kUj1Cvrej1aChOYZKYP18o
 g93fJFFPJoxyiI3f4hJZx9106MDUvTZvZ3BrNpbUWDpMcu2BcDhSXCh7cyGUbKgTjROV
 fvczXQgldr5CAbWeRrA5hvJbz54hAcyqfo04LP676hqRAotsq754QO/rf5cttP65GOz3
 SKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ee3/Ct1G+mZzQD8p6bAGJfxmlHApZMCGVdI9a5DfxHc=;
 b=rl+o31ywlL9h2JGlk0V/7DiR7m0U/CFnAguFcHnLTKDPzOkLUxopPwaRFuAU749ryy
 ZrFneV9HnZhndS4ISIa3U41dRBHhQ7Ju1/dvhnLC7/gNkyaeiHn5H4/xFZ9cqvVa3Drf
 LmYsVX6gIeJHBq9TAis4kKo98hcVBBjU5eo4Fms1PeEWbc2NXCZSoRmWwiDN3wacfoKD
 UYOWYfAFS4X4yoF2spOZCz0mTn+6zdfs0BtaagjXqlZPsmrFfKqYTOlHN4zJGiWoRezG
 7RQSA6/i1QcSROrU3WQ59ICpVaeGDmgRdQvypf0E0UhT23UmF3FHLrz4MHHnjO320IQP
 EFqg==
X-Gm-Message-State: AOAM532mY/MxDS8S3xS4Q5lOmrnGdmbbtuqVMcHGWICZF6Ln2jLbjKU0
 kBdEsO8qTY/LtPiKlUs86SM=
X-Google-Smtp-Source: ABdhPJxf1SzzWoJyn1pial7eQY1+Pdnn8nufiqMGFLm/XWQGLh2FqKeMsG2/SNuuYi9JKb2o0igpcg==
X-Received: by 2002:adf:da51:: with SMTP id r17mr20483402wrl.389.1640761787893; 
 Tue, 28 Dec 2021 23:09:47 -0800 (PST)
Received: from ownia.. ([103.105.48.220])
 by smtp.gmail.com with ESMTPSA id b2sm22515559wrd.35.2021.12.28.23.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 23:09:47 -0800 (PST)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com
Subject: [PATCH RESEND] dma-buf: heaps: Fix mutex lock area and generalize
 struct dma_heap_attachment
Date: Wed, 29 Dec 2021 15:07:13 +0800
Message-Id: <20211229070713.218548-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Weizhao Ouyang <o451686892@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cma_heap_buffer mutex lock area to protect vmap_cnt and vaddr. And
move struct dma_heap_attachment to dma-heap.h so that vendor dma heaps
can use it, the same behaviour as struct dma_buf_attachment.

Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
Resend to correct email addresses.

 drivers/dma-buf/heaps/cma_heap.c    | 25 ++++++++++---------------
 drivers/dma-buf/heaps/system_heap.c | 12 ++----------
 include/linux/dma-heap.h            | 15 +++++++++++++++
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c05b79870f9..23dad5b6421e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -40,13 +40,6 @@ struct cma_heap_buffer {
 	void *vaddr;
 };
 
-struct dma_heap_attachment {
-	struct device *dev;
-	struct sg_table table;
-	struct list_head list;
-	bool mapped;
-};
-
 static int cma_heap_attach(struct dma_buf *dmabuf,
 			   struct dma_buf_attachment *attachment)
 {
@@ -58,7 +51,7 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 	if (!a)
 		return -ENOMEM;
 
-	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
+	ret = sg_alloc_table_from_pages(a->table, buffer->pages,
 					buffer->pagecount, 0,
 					buffer->pagecount << PAGE_SHIFT,
 					GFP_KERNEL);
@@ -90,7 +83,7 @@ static void cma_heap_detach(struct dma_buf *dmabuf,
 	list_del(&a->list);
 	mutex_unlock(&buffer->lock);
 
-	sg_free_table(&a->table);
+	sg_free_table(a->table);
 	kfree(a);
 }
 
@@ -98,12 +91,12 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 					     enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
-	struct sg_table *table = &a->table;
+	struct sg_table *table = a->table;
 	int ret;
 
 	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
 	if (ret)
-		return ERR_PTR(-ENOMEM);
+		return ERR_PTR(ret);
 	a->mapped = true;
 	return table;
 }
@@ -124,14 +117,15 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
 
+	mutex_lock(&buffer->lock);
+
 	if (buffer->vmap_cnt)
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
-	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -144,14 +138,15 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
 
+	mutex_lock(&buffer->lock);
+
 	if (buffer->vmap_cnt)
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
-	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
+		dma_sync_sgtable_for_device(a->dev, a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
 
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index ab7fd896d2c4..aac8fc660ea6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -17,7 +17,6 @@
 #include <linux/highmem.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
@@ -33,13 +32,6 @@ struct system_heap_buffer {
 	void *vaddr;
 };
 
-struct dma_heap_attachment {
-	struct device *dev;
-	struct sg_table *table;
-	struct list_head list;
-	bool mapped;
-};
-
 #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
 #define MID_ORDER_GFP (LOW_ORDER_GFP | __GFP_NOWARN)
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
@@ -68,7 +60,7 @@ static struct sg_table *dup_sg_table(struct sg_table *table)
 	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
 	if (ret) {
 		kfree(new_table);
-		return ERR_PTR(-ENOMEM);
+		return ERR_PTR(ret);
 	}
 
 	new_sg = new_table->sgl;
@@ -94,7 +86,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	table = dup_sg_table(&buffer->sg_table);
 	if (IS_ERR(table)) {
 		kfree(a);
-		return -ENOMEM;
+		return PTR_ERR(table);
 	}
 
 	a->table = table;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..7d02aefe0e78 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -11,6 +11,7 @@
 
 #include <linux/cdev.h>
 #include <linux/types.h>
+#include <linux/scatterlist.h>
 
 struct dma_heap;
 
@@ -41,6 +42,20 @@ struct dma_heap_export_info {
 	void *priv;
 };
 
+/**
+ * struct dma_heap_attachment - holds device-heap attachment data
+ * @dev:	device attached to the heap
+ * @table:	sgtables for tracking the associated pages
+ * @list:	list of dma_heap_attachment
+ * @mapped:	true if attachment is actually mapped on the device
+ */
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+	bool mapped;
+};
+
 /**
  * dma_heap_get_drvdata() - get per-heap driver data
  * @heap: DMA-Heap to retrieve private data for
-- 
2.32.0

