Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3702444F8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 08:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D796EB0B;
	Fri, 14 Aug 2020 06:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967576EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:25:02 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f5so3716399plr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 23:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=pwDOHGKYvCi61mHFneVF0EduuTKfnrQsk03HbkNHX20=;
 b=dOPsv7f/wEuHeXmKjjFDeLAv02B1ounW5ulazhQV8hHqRYaoJ6XQBCnvtser32aA0E
 lgWuqqXH8kA0synMTCgHcFY7N2wuxSKoFOHOV6kqBkcKr5CSJ0fDOOolLuankz4PSiHm
 g+oRPe6gRdVqcAEnDUy6PIBRaTLR1LZZEGpxq4/ei7DQd0f9nkuuUli4Irvpx6e132Ev
 KKUCcTypG0YxXTabLVsyduvK5KJXFsR2GNAFoPL+SZGzbV9iiCoUhTMcAOa0EfqUFfJT
 LfhJ8/iUXz/Nfy9Wl7PPWVm2+2qUjp++JKg7RGAM5d8BbrjLDB9TujIrQQZgqMVHr1gt
 0Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pwDOHGKYvCi61mHFneVF0EduuTKfnrQsk03HbkNHX20=;
 b=QHWw81tnNA6cqifVYpKxYGMH2AVWgPswGhVPjWHHl0F6Dbe6kEOQZuyaLAOx3c2ZdF
 cvuM0aGGwvpRbMbc+BHKNLFvjPbES45NFtztPJ/g+Po/uyH29SFf6+LaUIeeDOqG8hsa
 DnESFzqCLwLCI/GMT5gAy8yfah1+Qv58RGUHw0bmk9xQIRqzC5I5r9ROhkzH/RvSpNsb
 sxBse6u6A88o3gSCI6ljkdDIl9tMimoPo2U7ppUPrum77fQQ4XNOlyJDTWQfCcCJK0rn
 IbWT39cLVoNcKLKyfyKIJVLmVhpLBBemi/K+pXxBCwvs7MOnCjk+uKBJFZwt3Jkq0ZPa
 RErg==
X-Gm-Message-State: AOAM530EBOZoPPcRSnifIVFI6uzMdXSbCPdvus3s5J2V7K9eYzljZQR2
 gtOlTzbByggir+jrvI+1juiK5A==
X-Google-Smtp-Source: ABdhPJxnGWB4G0BauuF1CXzPhUUlFpGdCXVBwviMTN5qRwfvr9KZRSe4Mu5Ey8K87w5P6jwDUx+ihA==
X-Received: by 2002:a17:90b:1254:: with SMTP id
 gx20mr1133241pjb.117.1597386302081; 
 Thu, 13 Aug 2020 23:25:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 z4sm7651496pfb.55.2020.08.13.23.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 23:25:01 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH v2 1/2] dma-heap: Keep track of the heap device struct
Date: Fri, 14 Aug 2020 06:24:57 +0000
Message-Id: <20200814062458.53049-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: dri-devel@lists.freedesktop.org, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keep track of the heap device struct.

This will be useful for special DMA allocations
and actions.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 33 +++++++++++++++++++++++++--------
 include/linux/dma-heap.h   |  9 +++++++++
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..72c746755d89 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -30,6 +30,7 @@
  * @heap_devt		heap device node
  * @list		list head connecting to list of heaps
  * @heap_cdev		heap char device
+ * @heap_dev		heap device struct
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -40,6 +41,7 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	struct device *heap_dev;
 };
 
 static LIST_HEAD(heap_list);
@@ -190,10 +192,21 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 	return heap->priv;
 }
 
+/**
+ * dma_heap_get_dev() - get device struct for the heap
+ * @heap: DMA-Heap to retrieve device struct from
+ *
+ * Returns:
+ * The device struct for the heap.
+ */
+struct device *dma_heap_get_dev(struct dma_heap *heap)
+{
+	return heap->heap_dev;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
-	struct device *dev_ret;
 	unsigned int minor;
 	int ret;
 
@@ -247,16 +260,20 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err1;
 	}
 
-	dev_ret = device_create(dma_heap_class,
-				NULL,
-				heap->heap_devt,
-				NULL,
-				heap->name);
-	if (IS_ERR(dev_ret)) {
+	heap->heap_dev = device_create(dma_heap_class,
+				       NULL,
+				       heap->heap_devt,
+				       NULL,
+				       heap->name);
+	if (IS_ERR(heap->heap_dev)) {
 		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(dev_ret);
+		err_ret = ERR_CAST(heap->heap_dev);
 		goto err2;
 	}
+
+	/* Make sure it doesn't disappear on us */
+	heap->heap_dev = get_device(heap->heap_dev);
+
 	/* Add heap to the list */
 	mutex_lock(&heap_list_lock);
 	list_add(&heap->list, &heap_list);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..82857e096910 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -50,6 +50,15 @@ struct dma_heap_export_info {
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
+/**
+ * dma_heap_get_dev() - get device struct for the heap
+ * @heap: DMA-Heap to retrieve device struct from
+ *
+ * Returns:
+ * The device struct for the heap.
+ */
+struct device *dma_heap_get_dev(struct dma_heap *heap);
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
