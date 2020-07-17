Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCE2235CD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448436ED3F;
	Fri, 17 Jul 2020 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Fri, 17 Jul 2020 01:20:06 UTC
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68AA36E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 01:20:06 +0000 (UTC)
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 17 Jul 2020 10:10:19 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 9C3A3180117;
 Fri, 17 Jul 2020 10:10:18 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Fri, 17 Jul 2020 10:10:18 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
 by kinkan.css.socionext.com (Postfix) with ESMTP id 3A0A61A0509;
 Fri, 17 Jul 2020 10:10:18 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, "Andrew F . Davis" <afd@ti.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for non-default
 CMA heap
Date: Fri, 17 Jul 2020 10:10:08 +0900
Message-Id: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: linaro-mm-sig@lists.linaro.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current dma-buf heaps can handle only default CMA. This introduces
dma_heap_add_cma() function to attach CMA heaps that belongs to a device.

At first, the driver calls of_reserved_mem_device_init() to set
memory-region property associated with reserved-memory defined as CMA
to the device. And when the driver calls this dma_heap_add_cma(),
the CMA will be added to dma-buf heaps.

For example, prepare CMA node named "linux,cma@10000000" and
specify the node for memory-region property. After the above calls
in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
associated with the CMA become available as dma-buf heaps.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++++
 include/linux/dma-heap.h         |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 626cf7f..5d2442e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -162,6 +162,18 @@ static int __add_cma_heap(struct cma *cma, void *data)
 	return 0;
 }
 
+/* add device CMA heap to dmabuf heaps */
+int dma_heap_add_cma(struct device *dev)
+{
+	struct cma *cma = dev_get_cma_area(dev);
+
+	if (!cma)
+		return -ENOMEM;
+
+	return __add_cma_heap(cma, NULL);
+}
+EXPORT_SYMBOL_GPL(dma_heap_add_cma);
+
 static int add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354..16bec7d 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -56,4 +56,13 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+/**
+ * dma_heap_add_cma - adds a device CMA heap to dmabuf heaps
+ * @dev:	device with a CMA heap to register
+ */
+int dma_heap_add_cma(struct device *dev);
+
+#endif /* CONFIG_DMABUF_HEAPS_CMA */
+
 #endif /* _DMA_HEAPS_H */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
