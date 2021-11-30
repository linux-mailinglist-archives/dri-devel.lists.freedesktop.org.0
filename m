Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D004463410
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030746E11C;
	Tue, 30 Nov 2021 12:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469356E284;
 Tue, 30 Nov 2021 12:19:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="234926317"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="234926317"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:19:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="459577056"
Received: from hekner-mobl5.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.206])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:19:52 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] dma-fence: Avoid establishing a locking order between
 fence classes
Date: Tue, 30 Nov 2021 13:19:35 +0100
Message-Id: <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The locking order for taking two fence locks is implicitly defined in
at least two ways in the code:

1) Fence containers first and other fences next, which is defined by
the enable_signaling() callbacks of dma_fence_chain and
dma_fence_array.
2) Reverse signal order, which is used by __i915_active_fence_set().

Now 1) implies 2), except for the signal_on_any mode of dma_fence_array
and 2) does not imply 1), and also 1) makes locking order between
different containers confusing.

Establish 2) and fix up the signal_on_any mode by calling
enable_signaling() on such fences unlocked at creation.

Cc: linaro-mm-sig@lists.linaro.org
Cc: dri-devel@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 13 +++--
 drivers/dma-buf/dma-fence-chain.c |  3 +-
 drivers/dma-buf/dma-fence.c       | 79 +++++++++++++++++++++----------
 include/linux/dma-fence.h         |  3 ++
 4 files changed, 69 insertions(+), 29 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..0322b92909fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -84,8 +84,8 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 		 * insufficient).
 		 */
 		dma_fence_get(&array->base);
-		if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
-					   dma_fence_array_cb_func)) {
+		if (dma_fence_add_callback_nested(array->fences[i], &cb[i].cb,
+						  dma_fence_array_cb_func)) {
 			int error = array->fences[i]->error;
 
 			dma_fence_array_set_pending_error(array, error);
@@ -158,6 +158,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 {
 	struct dma_fence_array *array;
 	size_t size = sizeof(*array);
+	struct dma_fence *fence;
 
 	/* Allocate the callback structures behind the array. */
 	size += num_fences * sizeof(struct dma_fence_array_cb);
@@ -165,8 +166,9 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	if (!array)
 		return NULL;
 
+	fence = &array->base;
 	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
+	dma_fence_init(fence, &dma_fence_array_ops, &array->lock,
 		       context, seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
@@ -174,7 +176,10 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
 	array->fences = fences;
 
-	array->base.error = PENDING_ERROR;
+	fence->error = PENDING_ERROR;
+
+	if (signal_on_any)
+		dma_fence_enable_sw_signaling(fence);
 
 	return array;
 }
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..0518e53880f6 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -152,7 +152,8 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 		struct dma_fence *f = chain ? chain->fence : fence;
 
 		dma_fence_get(f);
-		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
+		if (!dma_fence_add_callback_nested(f, &head->cb,
+						   dma_fence_chain_cb)) {
 			dma_fence_put(fence);
 			return true;
 		}
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..90a3d5121746 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -610,6 +610,37 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
+static int __dma_fence_add_callback(struct dma_fence *fence,
+				    struct dma_fence_cb *cb,
+				    dma_fence_func_t func,
+				    int nest_level)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	if (WARN_ON(!fence || !func))
+		return -EINVAL;
+
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+		INIT_LIST_HEAD(&cb->node);
+		return -ENOENT;
+	}
+
+	spin_lock_irqsave_nested(fence->lock, flags, 0);
+
+	if (__dma_fence_enable_signaling(fence)) {
+		cb->func = func;
+		list_add_tail(&cb->node, &fence->cb_list);
+	} else {
+		INIT_LIST_HEAD(&cb->node);
+		ret = -ENOENT;
+	}
+
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	return ret;
+}
+
 /**
  * dma_fence_add_callback - add a callback to be called when the fence
  * is signaled
@@ -635,33 +666,33 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 			   dma_fence_func_t func)
 {
-	unsigned long flags;
-	int ret = 0;
-
-	if (WARN_ON(!fence || !func))
-		return -EINVAL;
-
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		INIT_LIST_HEAD(&cb->node);
-		return -ENOENT;
-	}
-
-	spin_lock_irqsave(fence->lock, flags);
-
-	if (__dma_fence_enable_signaling(fence)) {
-		cb->func = func;
-		list_add_tail(&cb->node, &fence->cb_list);
-	} else {
-		INIT_LIST_HEAD(&cb->node);
-		ret = -ENOENT;
-	}
-
-	spin_unlock_irqrestore(fence->lock, flags);
-
-	return ret;
+	return __dma_fence_add_callback(fence, cb, func, 0);
 }
 EXPORT_SYMBOL(dma_fence_add_callback);
 
+/**
+ * dma_fence_add_callback_nested - add a callback from within a fence locked
+ * section to be called when the fence is signaled
+ * @fence: the fence to wait on
+ * @cb: the callback to register
+ * @func: the function to call
+ *
+ * This function is identical to dma_fence_add_callback() except it is
+ * intended to be used from within a section where the fence lock of
+ * another fence might be locked, and where it is guaranteed that
+ * other fence will signal _after_ @fence.
+ *
+ * Returns 0 in case of success, -ENOENT if the fence is already signaled
+ * and -EINVAL in case of error.
+ */
+int dma_fence_add_callback_nested(struct dma_fence *fence,
+				  struct dma_fence_cb *cb,
+				  dma_fence_func_t func)
+{
+	return __dma_fence_add_callback(fence, cb, func, SINGLE_DEPTH_NESTING);
+}
+EXPORT_SYMBOL(dma_fence_add_callback_nested);
+
 /**
  * dma_fence_get_status - returns the status upon completion
  * @fence: the dma_fence to query
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 1ea691753bd3..405cd83936f6 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -377,6 +377,9 @@ signed long dma_fence_default_wait(struct dma_fence *fence,
 int dma_fence_add_callback(struct dma_fence *fence,
 			   struct dma_fence_cb *cb,
 			   dma_fence_func_t func);
+int dma_fence_add_callback_nested(struct dma_fence *fence,
+				  struct dma_fence_cb *cb,
+				  dma_fence_func_t func);
 bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
-- 
2.31.1

