Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C778A9C2EBE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCE610E35C;
	Sat,  9 Nov 2024 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISmOcBsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D510E35B;
 Sat,  9 Nov 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173355; x=1762709355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g3Fnr+eeiYufPr352u35VGvUGKDvw6+Cf03KpdN8IJY=;
 b=ISmOcBsuRwkdlGkJSGl9FGa45vquLKx6Sd3LrTZvgxM+m0s58r8ikfn+
 fUylGgmD3ejenkucLAKbOZQfHyj2mfak+iieSc9wZVZ/FNVKlJ36KkCy8
 +u4I4x38anQWRxzgvxFboZsacnNBjAICo05hjF6uHTBbxgugIcOEN5GBs
 KiRTPU9GS+GF8tL3sfPKCd5WpfWMF8S2cnIi8jgsbt5Znuuw94iHqIlYX
 UJD71xfZM+vtA0A3htA4z/8S8E3PLsEoi6a6RKn5prcOCLmzXnPYa8i1J
 olZX6yspRoNOHtxev4lCIsLzEtS5gqMD4u8Svlqy4KQQVycEwpvvG+Nkc A==;
X-CSE-ConnectionGUID: 0BJvhSRjRxmRgrqK7qsrPQ==
X-CSE-MsgGUID: lyxwaL8LRKqlJ+yDv6wj4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600123"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:14 -0800
X-CSE-ConnectionGUID: TlX3u9tRSOKmHJeK7vU7IQ==
X-CSE-MsgGUID: lYXUv1+tQ5y5VNPlv5SiNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499490"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 mihail.atanassov@arm.com, steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 3/6] dma-fence: Add dma_fence_preempt base class
Date: Sat,  9 Nov 2024 09:29:39 -0800
Message-Id: <20241109172942.482630-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

Add a dma_fence_preempt base class with driver ops to implement
preemption, based on the existing Xe preemptive fence implementation.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/Makefile            |   2 +-
 drivers/dma-buf/dma-fence-preempt.c | 102 ++++++++++++++++++++++++++++
 include/linux/dma-fence-preempt.h   |  54 +++++++++++++++
 3 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/dma-fence-preempt.c
 create mode 100644 include/linux/dma-fence-preempt.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 70ec901edf2c..c25500bb38b5 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-fence-unwrap.o dma-resv.o
+	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
new file mode 100644
index 000000000000..e97ddd925db6
--- /dev/null
+++ b/drivers/dma-buf/dma-fence-preempt.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/dma-fence-preempt.h>
+#include <linux/dma-resv.h>
+
+static const char *
+dma_fence_preempt_get_driver_name(struct dma_fence *fence)
+{
+	return "dma_fence_preempt";
+}
+
+static const char *
+dma_fence_preempt_get_timeline_name(struct dma_fence *fence)
+{
+	return "ordered";
+}
+
+static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
+{
+	struct dma_fence_preempt *pfence =
+		container_of(fence, typeof(*pfence), base);
+	int err;
+
+	err = pfence->ops->preempt(pfence);
+	if (err)
+		dma_fence_set_error(&pfence->base, err);
+	else
+		WARN_ON(!dma_resv_test_signaled(pfence->resv,
+						DMA_RESV_USAGE_BOOKKEEP));
+
+	dma_fence_get(fence);
+	queue_work(pfence->wq, &pfence->work);
+
+	return true;
+}
+
+static const struct dma_fence_ops preempt_fence_ops = {
+	.get_driver_name = dma_fence_preempt_get_driver_name,
+	.get_timeline_name = dma_fence_preempt_get_timeline_name,
+	.enable_signaling = dma_fence_preempt_enable_signaling,
+};
+
+static void dma_fence_preempt_work_func(struct work_struct *w)
+{
+	bool cookie = dma_fence_begin_signalling();
+	struct dma_fence_preempt *pfence =
+		container_of(w, typeof(*pfence), work);
+	int err = pfence->base.error;
+
+	if (!err) {
+		err = pfence->ops->preempt_wait(pfence);
+		if (err)
+			dma_fence_set_error(&pfence->base, err);
+	}
+
+	dma_fence_signal(&pfence->base);
+	pfence->ops->preempt_finished(pfence);
+
+	dma_fence_end_signalling(cookie);
+	dma_fence_put(&pfence->base);
+}
+
+/**
+ * dma_fence_is_preempt() - Is preempt fence
+ *
+ * @fence: Preempt fence
+ *
+ * Return: True if preempt fence, False otherwise
+ */
+bool dma_fence_is_preempt(const struct dma_fence *fence)
+{
+	return fence->ops == &preempt_fence_ops;
+}
+EXPORT_SYMBOL(dma_fence_is_preempt);
+
+/**
+ * dma_fence_preempt_init() - Initial preempt fence
+ *
+ * @fence: Preempt fence
+ * @ops: Preempt fence operations
+ * @resv: Dma resv which preempt fence is attached to
+ * @wq: Work queue for preempt wait
+ * @context: Fence context
+ * @seqno: Fence seqence number
+ */
+void dma_fence_preempt_init(struct dma_fence_preempt *fence,
+			    const struct dma_fence_preempt_ops *ops,
+			    struct dma_resv *resv, struct workqueue_struct *wq,
+			    u64 context, u64 seqno)
+{
+	fence->ops = ops;
+	fence->resv = resv;
+	fence->wq = wq;
+	INIT_WORK(&fence->work, dma_fence_preempt_work_func);
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &preempt_fence_ops,
+		       &fence->lock, context, seqno);
+}
+EXPORT_SYMBOL(dma_fence_preempt_init);
diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
new file mode 100644
index 000000000000..9fdfe4a6b00f
--- /dev/null
+++ b/include/linux/dma-fence-preempt.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __LINUX_DMA_FENCE_PREEMPT_H
+#define __LINUX_DMA_FENCE_PREEMPT_H
+
+#include <linux/dma-fence.h>
+#include <linux/workqueue.h>
+
+struct dma_fence_preempt;
+struct dma_resv;
+
+/**
+ * struct dma_fence_preempt_ops - Preempt fence operations
+ *
+ * These functions should be implemented in the driver side.
+ */
+struct dma_fence_preempt_ops {
+	/** @preempt: Preempt execution */
+	int (*preempt)(struct dma_fence_preempt *fence);
+	/** @preempt_wait: Wait for preempt of execution to complete */
+	int (*preempt_wait)(struct dma_fence_preempt *fence);
+	/** @preempt_finished: Signal that the preempt has finished */
+	void (*preempt_finished)(struct dma_fence_preempt *fence);
+};
+
+/**
+ * struct dma_fence_preempt - Embedded preempt fence base class
+ */
+struct dma_fence_preempt {
+	/** @base: Fence base class */
+	struct dma_fence base;
+	/** @lock: Spinlock for fence handling */
+	spinlock_t lock;
+	/** @ops: Preempt fence operation */
+	const struct dma_fence_preempt_ops *ops;
+	/** @resv: DMA resv which preempt fence attached to */
+	struct dma_resv *resv;
+	/** @wq: Work queue for preempt wait */
+	struct workqueue_struct *wq;
+	/** @work: Work struct for preempt wait */
+	struct work_struct work;
+};
+
+bool dma_fence_is_preempt(const struct dma_fence *fence);
+
+void dma_fence_preempt_init(struct dma_fence_preempt *fence,
+			    const struct dma_fence_preempt_ops *ops,
+			    struct dma_resv *resv, struct workqueue_struct *wq,
+			    u64 context, u64 seqno);
+
+#endif
-- 
2.34.1

