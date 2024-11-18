Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7499D1BE1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF60C10E040;
	Mon, 18 Nov 2024 23:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2frrSJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956DA10E190;
 Mon, 18 Nov 2024 23:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973043; x=1763509043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rH8hTGJCAoerEtuHvYdMXIH/cuzWnm4A2o119v9dQe0=;
 b=m2frrSJEj5fPKFn7CJ5UjIhy6xlqH8mMOq43r2C+uzx/PKZKK7MrI8H9
 JdIMiFmEzgJ/MkmVJlZia3QlKuezHnBQujLHKMbPjgwSXLgR95Z4T4fF3
 4grXkSdovN/SuoxHCxN79yUgWAM3jvWt6xyTErCR+j5v1h6ZqqKJhaUV+
 ayGSwkcLX1XyJ6/Kr9VjMyQrz4WWzANwJTw265cGZNy5cxIsk1nxu6t4X
 Ba7sVhdExSAQSUWspS0k5GjJfY2ToEu/QOEPwQR6Ad3Zk1bY0CSEIlqAu
 bCeghArZIK8MCUwNnzA8rcX1iUC+BTAqroLuxXEt6pX53ha5c3YNolPde A==;
X-CSE-ConnectionGUID: ehbpurniTCupRzAKRk7UMQ==
X-CSE-MsgGUID: goCsjvMDQa6+AFAaDgYxQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878851"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878851"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
X-CSE-ConnectionGUID: fYuWwgN6RiitE1p5oCjrew==
X-CSE-MsgGUID: z1OTRbCpT4qEiCFw04kY6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521668"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 01/29] dma-fence: Add dma_fence_preempt base class
Date: Mon, 18 Nov 2024 15:37:29 -0800
Message-Id: <20241118233757.2374041-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Annotated to ensure correct driver usage.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/Makefile            |   2 +-
 drivers/dma-buf/dma-fence-preempt.c | 133 ++++++++++++++++++++++++++++
 include/linux/dma-fence-preempt.h   |  56 ++++++++++++
 3 files changed, 190 insertions(+), 1 deletion(-)
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
index 000000000000..6e6ce7ea7421
--- /dev/null
+++ b/drivers/dma-buf/dma-fence-preempt.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/dma-fence-preempt.h>
+#include <linux/dma-resv.h>
+
+static void dma_fence_preempt_work_func(struct work_struct *w)
+{
+	bool cookie = dma_fence_begin_signalling();
+	struct dma_fence_preempt *pfence =
+		container_of(w, typeof(*pfence), work);
+	const struct dma_fence_preempt_ops *ops = pfence->ops;
+	int err = pfence->base.error;
+
+	if (!err) {
+		err = ops->preempt_wait(pfence);
+		if (err)
+			dma_fence_set_error(&pfence->base, err);
+	}
+
+	dma_fence_signal(&pfence->base);
+	ops->preempt_finished(pfence);
+
+	dma_fence_end_signalling(cookie);
+}
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
+static void dma_fence_preempt_issue(struct dma_fence_preempt *pfence)
+{
+	int err;
+
+	err = pfence->ops->preempt(pfence);
+	if (err)
+		dma_fence_set_error(&pfence->base, err);
+
+	queue_work(pfence->wq, &pfence->work);
+}
+
+static void dma_fence_preempt_cb(struct dma_fence *fence,
+				 struct dma_fence_cb *cb)
+{
+	struct dma_fence_preempt *pfence =
+		container_of(cb, typeof(*pfence), cb);
+
+	dma_fence_preempt_issue(pfence);
+}
+
+static void dma_fence_preempt_delay(struct dma_fence_preempt *pfence)
+{
+	struct dma_fence *fence;
+	int err;
+
+	fence = pfence->ops->preempt_delay(pfence);
+	if (WARN_ON_ONCE(!fence || IS_ERR(fence)))
+		return;
+
+	err = dma_fence_add_callback(fence, &pfence->cb, dma_fence_preempt_cb);
+	if (err == -ENOENT)
+		dma_fence_preempt_issue(pfence);
+}
+
+static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
+{
+	struct dma_fence_preempt *pfence =
+		container_of(fence, typeof(*pfence), base);
+
+	if (pfence->ops->preempt_delay)
+		dma_fence_preempt_delay(pfence);
+	else
+		dma_fence_preempt_issue(pfence);
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
+ * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
+ * @context: Fence context
+ * @seqno: Fence seqence number
+ */
+void dma_fence_preempt_init(struct dma_fence_preempt *fence,
+			    const struct dma_fence_preempt_ops *ops,
+			    struct workqueue_struct *wq,
+			    u64 context, u64 seqno)
+{
+	/*
+	 * XXX: We really want to check wq for WQ_MEM_RECLAIM here but
+	 * workqueue_struct is private.
+	 */
+
+	fence->ops = ops;
+	fence->wq = wq;
+	INIT_WORK(&fence->work, dma_fence_preempt_work_func);
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &preempt_fence_ops,
+		       &fence->lock, context, seqno);
+}
+EXPORT_SYMBOL(dma_fence_preempt_init);
diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
new file mode 100644
index 000000000000..28d803f89527
--- /dev/null
+++ b/include/linux/dma-fence-preempt.h
@@ -0,0 +1,56 @@
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
+	/** @preempt_delay: Preempt execution with a delay */
+	struct dma_fence *(*preempt_delay)(struct dma_fence_preempt *fence);
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
+	/** @cb: Callback preempt delay */
+	struct dma_fence_cb cb;
+	/** @ops: Preempt fence operation */
+	const struct dma_fence_preempt_ops *ops;
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
+			    struct workqueue_struct *wq,
+			    u64 context, u64 seqno);
+
+#endif
-- 
2.34.1

