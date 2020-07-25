Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30DE22D441
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 05:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6834E6EA5A;
	Sat, 25 Jul 2020 03:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16656EA5A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 03:26:37 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w2so6438980pgg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 20:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=H0jwgkKJw1F2QGrxp3XRsBO4Zv0vbxAb7H7LFDlABiQ=;
 b=RbNTN2vPJ+dA/LwMFiC3sJgHNi9P7iDpEf0QPN9vRRqQ7v6rh8ugXQpi5Vouhpb/+x
 E/SZz2L0MCrCHEVHr9cQu4Fa+J9Oq6lk738yyuyDRw+2Ej5YQOGNQjVEs6rpQ38YxvVY
 mrkXyY/dpROjus1mzoaCe3ZvJaPBbZsCVRiB3LkavibRHIGwVH5CbMFDNohLUpHSyO1R
 Hf0jM7DvjDSq3Id5l1M0ElsmQ1zPlI5eziR8fpmSC7io0yxpn4ckZiTj+RBX2EA7SUhy
 pmLxYj5HhfjFkeeE+7fkuSm24xWP8b4xfqAthKMGLZI9OKgeJEKSaT1uD/uQzBOK3UST
 A6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H0jwgkKJw1F2QGrxp3XRsBO4Zv0vbxAb7H7LFDlABiQ=;
 b=gIibajQ7I7gUehQl/1ltKt1MByANy6RFU2Zc+G3hnXMcb4/eXQ0/kiYqRo71x6b4qa
 v8hvZl7nL7cNz38rjd/A4bRd/lwqiLTn+IP4ZYnxwGFAimHquAO+wqhaVLevN6xXCdAe
 AK+Glbrk8e2uZ7oG6TXIOzB8jGZGkHucf7cDtF4x1410uVh7pv7aPoWGtS0Vw56LiHGk
 vXl8ei4GLtdmOoXxcx34nN+85z+g+hGgSSg47uUwHSWIq4ojhXgNAIxKylBwcfo6ODGE
 KpwlNgqW9glp9/fsvEmkMxVb1NFOR43++ICf3vS1Hp+idJTQ+SYFQ3FjLg6BjKNk+1Q2
 ZuoQ==
X-Gm-Message-State: AOAM531i45GTHcle5n1tDkhZDJAaTINUCMhPPPYpj/xyWJ+/XNlz8dci
 a4WpXzpce4mDNK5kpA9SWKZX0Q==
X-Google-Smtp-Source: ABdhPJye4Zi1p+g7i5EeVNtB5XOqoG/SM8okB5VAhbaF1GX8NRKfTkCuaLkqofWvksTtGS/kYQYgww==
X-Received: by 2002:a63:fe42:: with SMTP id x2mr11177808pgj.207.1595647597349; 
 Fri, 24 Jul 2020 20:26:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 204sm7754074pfx.3.2020.07.24.20.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 20:26:36 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH] dma-heap: Add proper kref handling on dma-buf heaps
Date: Sat, 25 Jul 2020 03:26:33 +0000
Message-Id: <20200725032633.125006-1-john.stultz@linaro.org>
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
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add proper refcounting on the dma_heap structure.
While existing heaps are built-in, we may eventually
have heaps loaded from modules, and we'll need to be
able to properly handle the references to the heaps

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 31 +++++++++++++++++++++++++++----
 include/linux/dma-heap.h   |  6 ++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..90c3720acc1c 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -40,6 +40,8 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	int minor;
+	struct kref refcount;
 };
 
 static LIST_HEAD(heap_list);
@@ -190,11 +192,31 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 	return heap->priv;
 }
 
+static void dma_heap_release(struct kref *ref)
+{
+	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
+
+	/* Remove heap from the list */
+	mutex_lock(&heap_list_lock);
+	list_del(&heap->list);
+	mutex_unlock(&heap_list_lock);
+
+	device_destroy(dma_heap_class, heap->heap_devt);
+	cdev_del(&heap->heap_cdev);
+	xa_erase(&dma_heap_minors, heap->minor);
+
+	kfree(heap);
+}
+
+void dma_heap_put(struct dma_heap *h)
+{
+	kref_put(&h->refcount, dma_heap_release);
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
 	struct device *dev_ret;
-	unsigned int minor;
 	int ret;
 
 	if (!exp_info->name || !strcmp(exp_info->name, "")) {
@@ -223,12 +245,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	if (!heap)
 		return ERR_PTR(-ENOMEM);
 
+	kref_init(&heap->refcount);
 	heap->name = exp_info->name;
 	heap->ops = exp_info->ops;
 	heap->priv = exp_info->priv;
 
 	/* Find unused minor number */
-	ret = xa_alloc(&dma_heap_minors, &minor, heap,
+	ret = xa_alloc(&dma_heap_minors, &heap->minor, heap,
 		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
 	if (ret < 0) {
 		pr_err("dma_heap: Unable to get minor number for heap\n");
@@ -237,7 +260,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	}
 
 	/* Create device */
-	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), minor);
+	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), heap->minor);
 
 	cdev_init(&heap->heap_cdev, &dma_heap_fops);
 	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
@@ -267,7 +290,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 err2:
 	cdev_del(&heap->heap_cdev);
 err1:
-	xa_erase(&dma_heap_minors, minor);
+	xa_erase(&dma_heap_minors, heap->minor);
 err0:
 	kfree(heap);
 	return err_ret;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..c1572f29cfac 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -56,4 +56,10 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+/**
+ * dma_heap_put - drops a reference to a dmabuf heaps, potentially freeing it
+ * @heap:		heap pointer
+ */
+void dma_heap_put(struct dma_heap *heap);
+
 #endif /* _DMA_HEAPS_H */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
