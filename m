Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE40690D5D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45B710EB34;
	Thu,  9 Feb 2023 15:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A00E10EB2E;
 Thu,  9 Feb 2023 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675957410; x=1707493410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lrPdTfl1YDJNIs0dJwyIhJGh23rQm1EcY6zS5LmHiGo=;
 b=n4Ra9qELHME0fB1RmKlxjmOpAapmXtGAXVdt4/eXK695vcIY7s9lJ/Kv
 P9pGB5vs1eIhv9Fdzze3+qA+Lv0KssHUmjnhohBsCv3MSc5vr3MgDBV4q
 Tibx3WXcpzPePjMppGNR40Aw1fF3GxMmSEkrtriqI1pdISE33gzpbfg/k
 83wA14BLKtpJ8CdS9NlCLi11RHNkeI2K2S+O3m6vrIL3Ncteb8lMGa4tO
 jumxnjvgaGxOBrfny995t+mFwYFjzu67rc0ajNRtxUEeP93EnlQAfAldw
 mEU0h6bQIEfyr/J9S7b7ZnD/Un9VUSGlghVli+2IzADUonqzjh4oojB18 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="331440708"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="331440708"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645308790"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="645308790"
Received: from jptoner-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.192.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:28 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 1/3] dma-fence: Track explicit waiters
Date: Thu,  9 Feb 2023 15:43:13 +0000
Message-Id: <20230209154315.468682-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
References: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Track how many callers are explicity waiting on a fence to signal and
allow querying that via new dma_fence_wait_count() API.

This provides infrastructure on top of which generic "waitboost" concepts
can be implemented by individual drivers. Wait-boosting is any reactive
activity, such as raising the GPU clocks, which happens while there are
active external waiters.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-fence.c | 102 ++++++++++++++++++++++++++----------
 include/linux/dma-fence.h   |  14 +++++
 2 files changed, 88 insertions(+), 28 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0de0482cd36e..d463c06ebd6d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -344,6 +344,24 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
+static void incr_wait_count(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	lockdep_assert_held(fence->lock);
+
+	__set_bit(DMA_FENCE_CB_FLAG_WAITCOUNT_BIT, &cb->flags);
+	fence->waitcount++;
+	WARN_ON_ONCE(!fence->waitcount);
+}
+
+static void decr_wait_count(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	lockdep_assert_held(fence->lock);
+
+	if (__test_and_clear_bit(DMA_FENCE_CB_FLAG_WAITCOUNT_BIT, &cb->flags)) {
+		WARN_ON_ONCE(!fence->waitcount);
+		fence->waitcount--;
+	}
+}
 
 /**
  * dma_fence_signal_timestamp_locked - signal completion of a fence
@@ -384,6 +402,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
 		INIT_LIST_HEAD(&cur->node);
+		decr_wait_count(fence, cur);
 		cur->func(fence, cur);
 	}
 
@@ -612,35 +631,15 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 	unsigned long flags;
 
 	spin_lock_irqsave(fence->lock, flags);
+	fence->waitcount++;
+	WARN_ON_ONCE(!fence->waitcount);
 	__dma_fence_enable_signaling(fence);
 	spin_unlock_irqrestore(fence->lock, flags);
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
-/**
- * dma_fence_add_callback - add a callback to be called when the fence
- * is signaled
- * @fence: the fence to wait on
- * @cb: the callback to register
- * @func: the function to call
- *
- * Add a software callback to the fence. The caller should keep a reference to
- * the fence.
- *
- * @cb will be initialized by dma_fence_add_callback(), no initialization
- * by the caller is required. Any number of callbacks can be registered
- * to a fence, but a callback can only be registered to one fence at a time.
- *
- * If fence is already signaled, this function will return -ENOENT (and
- * *not* call the callback).
- *
- * Note that the callback can be called from an atomic context or irq context.
- *
- * Returns 0 in case of success, -ENOENT if the fence is already signaled
- * and -EINVAL in case of error.
- */
-int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
-			   dma_fence_func_t func)
+static int add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
+			dma_fence_func_t func, bool wait)
 {
 	unsigned long flags;
 	int ret = 0;
@@ -655,10 +654,15 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 
 	spin_lock_irqsave(fence->lock, flags);
 
+	if (wait)
+		incr_wait_count(fence, cb);
+
 	if (__dma_fence_enable_signaling(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
 	} else {
+		if (wait)
+			decr_wait_count(fence, cb);
 		INIT_LIST_HEAD(&cb->node);
 		ret = -ENOENT;
 	}
@@ -667,8 +671,44 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 
 	return ret;
 }
+
+/**
+ * dma_fence_add_callback - add a callback to be called when the fence
+ * is signaled
+ * @fence: the fence to wait on
+ * @cb: the callback to register
+ * @func: the function to call
+ *
+ * Add a software callback to the fence. The caller should keep a reference to
+ * the fence.
+ *
+ * @cb will be initialized by dma_fence_add_callback(), no initialization
+ * by the caller is required. Any number of callbacks can be registered
+ * to a fence, but a callback can only be registered to one fence at a time.
+ *
+ * If fence is already signaled, this function will return -ENOENT (and
+ * *not* call the callback).
+ *
+ * Note that the callback can be called from an atomic context or irq context.
+ *
+ * Returns 0 in case of success, -ENOENT if the fence is already signaled
+ * and -EINVAL in case of error.
+ */
+int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
+			   dma_fence_func_t func)
+{
+	return add_callback(fence, cb, func, false);
+}
 EXPORT_SYMBOL(dma_fence_add_callback);
 
+int dma_fence_add_wait_callback(struct dma_fence *fence,
+				struct dma_fence_cb *cb,
+				dma_fence_func_t func)
+{
+	return add_callback(fence, cb, func, true);
+}
+EXPORT_SYMBOL(dma_fence_add_wait_callback);
+
 /**
  * dma_fence_get_status - returns the status upon completion
  * @fence: the dma_fence to query
@@ -721,8 +761,10 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
 	spin_lock_irqsave(fence->lock, flags);
 
 	ret = !list_empty(&cb->node);
-	if (ret)
+	if (ret) {
+		decr_wait_count(fence, cb);
 		list_del_init(&cb->node);
+	}
 
 	spin_unlock_irqrestore(fence->lock, flags);
 
@@ -780,6 +822,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 
 	cb.base.func = dma_fence_default_wait_cb;
 	cb.task = current;
+	incr_wait_count(fence, &cb.base);
 	list_add(&cb.base.node, &fence->cb_list);
 
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
@@ -796,8 +839,10 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 			ret = -ERESTARTSYS;
 	}
 
-	if (!list_empty(&cb.base.node))
+	if (!list_empty(&cb.base.node)) {
+		decr_wait_count(fence, &cb.base);
 		list_del(&cb.base.node);
+	}
 	__set_current_state(TASK_RUNNING);
 
 out:
@@ -875,8 +920,8 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		struct dma_fence *fence = fences[i];
 
 		cb[i].task = current;
-		if (dma_fence_add_callback(fence, &cb[i].base,
-					   dma_fence_default_wait_cb)) {
+		if (dma_fence_add_wait_callback(fence, &cb[i].base,
+						dma_fence_default_wait_cb)) {
 			/* This fence is already signaled */
 			if (idx)
 				*idx = i;
@@ -957,6 +1002,7 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	fence->context = context;
 	fence->seqno = seqno;
 	fence->flags = 0UL;
+	fence->waitcount = 0;
 	fence->error = 0;
 
 	trace_dma_fence_init(fence);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..d0ed923e4545 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -92,6 +92,7 @@ struct dma_fence {
 	u64 seqno;
 	unsigned long flags;
 	struct kref refcount;
+	unsigned int waitcount;
 	int error;
 };
 
@@ -116,6 +117,11 @@ typedef void (*dma_fence_func_t)(struct dma_fence *fence,
 struct dma_fence_cb {
 	struct list_head node;
 	dma_fence_func_t func;
+	unsigned long flags;
+};
+
+enum dma_fence_cb_flag_bits {
+	DMA_FENCE_CB_FLAG_WAITCOUNT_BIT,
 };
 
 /**
@@ -377,6 +383,9 @@ signed long dma_fence_default_wait(struct dma_fence *fence,
 int dma_fence_add_callback(struct dma_fence *fence,
 			   struct dma_fence_cb *cb,
 			   dma_fence_func_t func);
+int dma_fence_add_wait_callback(struct dma_fence *fence,
+				struct dma_fence_cb *cb,
+				dma_fence_func_t func);
 bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
@@ -528,6 +537,11 @@ static inline int dma_fence_get_status_locked(struct dma_fence *fence)
 
 int dma_fence_get_status(struct dma_fence *fence);
 
+static inline unsigned int dma_fence_wait_count(struct dma_fence *fence)
+{
+	return fence->waitcount;
+}
+
 /**
  * dma_fence_set_error - flag an error condition on the fence
  * @fence: the dma_fence
-- 
2.34.1

