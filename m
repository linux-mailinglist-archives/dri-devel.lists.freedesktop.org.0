Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C9481E85
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1A810E2C6;
	Thu, 30 Dec 2021 17:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA2610E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 06:36:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so10450829wmj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 22:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aVsAoP2T3tzUodu4VGKyNEW0sphmTDDncHzes2frrOs=;
 b=bQQ8nvrhuvCETjMeJ9h0Eb9hkbJIrbr4SKihusqXFjU+d5gf0mXDgdRUp+z7hJfvQb
 JjxSVDl8TXXdkcyei7e9eeEp6Dztxbw6yS2hMjGq2t1ICy3jp5FK3pozZB49Y1Dj/gyD
 4kK9mVxp06A19aXks8CQ4v9NgZBMA0pYoWRPuu5z62JbZQz7+37zEzdA6WRxblez0GvE
 fTTkwV99WTStkviHBP2J6Af8V8mTbbXWgg1WVdK6mpv1fmmV1ao0zImxMmExWnaUGnYO
 /Hly8+mtu6fqnqt0ElKuwfknZ2WQ80kP6dhOAetBMLRAqA5nkKYWteI+mo0xYyJBNFDp
 ltwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aVsAoP2T3tzUodu4VGKyNEW0sphmTDDncHzes2frrOs=;
 b=SwfuL9ImHLG4SjYDsGCDZ7xudO/WBVWsWdE05Qt4ZRsNTnJYIYRRu1wCH0nNUkGUd3
 gR8p7A9T9LKFQdws0WYnsNTxD0nYUU1U6hRL6qpAnjcCnAyN+uyyNaQyUQESqiQGPm77
 nAZKpKOzjWqOT4Mu4Usf1cd564Sb1XVaXTUxtrfTXBBI98av2DWtaCxBB/ZhdUWCDI8/
 kGKwbkFkaG3JHStIFmDIPxW52Wmr6bXZQsK7vdxD8ftlLuN40T2azdyr3OOodiKoVYgl
 pY1+UL8bgpcyrGEC8xoS6W2/GCQ4saUwCtm11WHMrWt+cBp0JsCcEOKTj9xsv7hjQo0b
 RhYg==
X-Gm-Message-State: AOAM530Jat16yKVFQo42Pr8tw9r0Qp7oJzc2/Dlai4VvtrXYOBqEiwho
 uGS0d/xBoZpVgkmrfI67afM=
X-Google-Smtp-Source: ABdhPJysdnMAvIRMu3NQjqh3TRsP70+m9zCz27aJbE26CBqDoMBfIJyJ9lkILTCCw6d9dhVfu1YpMg==
X-Received: by 2002:a1c:494:: with SMTP id 142mr12441200wme.191.1640586988638; 
 Sun, 26 Dec 2021 22:36:28 -0800 (PST)
Received: from ownia.. ([103.105.48.220])
 by smtp.gmail.com with ESMTPSA id g8sm14153982wmh.17.2021.12.26.22.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 22:36:28 -0800 (PST)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com
Subject: [PATCH] dma-buf: heaps: Fix mutex lock area and generalize struct
 dma_heap_attachment
Date: Mon, 27 Dec 2021 14:36:19 +0800
Message-Id: <20211227063619.215692-1-o451686892@gmail.com>
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

