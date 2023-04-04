Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B26D557C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AD10E0E3;
	Tue,  4 Apr 2023 00:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A138C10E048;
 Tue,  4 Apr 2023 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567744; x=1712103744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PkFDbYuDEsMLPA63PNlLCfLAaP0jp+1ED1yaUoTrNYQ=;
 b=DTXU4MiaMA6ZGzx3FF2408oQ/1zB79ycN9JyPUHziphyq3yn7/ZJ+ZMm
 nxpGEh5hKTRgOcxY78AJAzzDiaSdlh7xaqMTwOSUvko5yqaYZMDLBQl6Z
 Lao2G1QFwHwraP6UYmVz+0fb4wMhPMb/z3MqAzXyudOIx6f9XIydUUUvZ
 fvEzj2GYepaOkKeI5nb3ghG5avyU+jdgMjUw8TfLeWtQW3XsmqyQNRWPD
 7gh3TiJmTr753RRQ/PUiHBa+wVH0AMM8N5uQ4+Yx428wx8mDYfDuhZ2Wk
 /MnHRrYq5+AWFRepPC7QWY8mjjH41S7AGzJAXc+OVZ1NkWlHGhjtlMQye w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810549"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460312"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460312"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Date: Mon,  3 Apr 2023 17:22:09 -0700
Message-Id: <20230404002211.3611376-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

For long-running workloads, drivers either need to open-code completion
waits, invent their own synchronization primitives or internally use
dma-fences that do not obey the cross-driver dma-fence protocol, but
without any lockdep annotation all these approaches are error prone.

So since for example the drm scheduler uses dma-fences it is desirable for
a driver to be able to use it for throttling and error handling also with
internal dma-fences tha do not obey the cros-driver dma-fence protocol.

Introduce long-running completion fences in form of dma-fences, and add
lockdep annotation for them. In particular:

* Do not allow waiting under any memory management locks.
* Do not allow to attach them to a dma-resv object.
* Introduce a new interface for adding callbacks making the helper adding
  a callback sign off on that it is aware that the dma-fence may not
  complete anytime soon. Typically this will be the scheduler chaining
  a new long-running fence on another one.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence.c | 142 ++++++++++++++++++++++++++----------
 drivers/dma-buf/dma-resv.c  |   5 ++
 include/linux/dma-fence.h   |  55 +++++++++++++-
 3 files changed, 160 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..9726b2a3c67d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -111,6 +111,20 @@ static atomic64_t dma_fence_context_counter = ATOMIC64_INIT(1);
  * drivers/gpu should ever call dma_fence_wait() in such contexts.
  */
 
+/**
+ * DOC: Long-Running (lr) dma-fences.
+ *
+ * * Long-running dma-fences are NOT required to complete in reasonable time.
+ *   Typically they signal completion of user-space controlled workloads and
+ *   as such, need to never be part of a cross-driver contract, never waited
+ *   for inside a kernel lock, nor attached to a dma-resv. There are helpers
+ *   and warnings in place to help facilitate that that never happens.
+ *
+ * * The motivation for their existense is that helpers that are intended to
+ *   be used by drivers may use dma-fences that, given the workloads mentioned
+ *   above, become long-running.
+ */
+
 static const char *dma_fence_stub_get_name(struct dma_fence *fence)
 {
         return "stub";
@@ -284,6 +298,34 @@ static struct lockdep_map dma_fence_lockdep_map = {
 	.name = "dma_fence_map"
 };
 
+static struct lockdep_map dma_fence_lr_lockdep_map = {
+	.name = "dma_fence_lr_map"
+};
+
+static bool __dma_fence_begin_signalling(struct lockdep_map *map)
+{
+	/* explicitly nesting ... */
+	if (lock_is_held_type(map, 1))
+		return true;
+
+	/* rely on might_sleep check for soft/hardirq locks */
+	if (in_atomic())
+		return true;
+
+	/* ... and non-recursive readlock */
+	lock_acquire(map, 0, 0, 1, 1, NULL, _RET_IP_);
+
+	return false;
+}
+
+static void __dma_fence_end_signalling(bool cookie, struct lockdep_map *map)
+{
+	if (cookie)
+		return;
+
+	lock_release(map, _RET_IP_);
+}
+
 /**
  * dma_fence_begin_signalling - begin a critical DMA fence signalling section
  *
@@ -300,18 +342,7 @@ static struct lockdep_map dma_fence_lockdep_map = {
  */
 bool dma_fence_begin_signalling(void)
 {
-	/* explicitly nesting ... */
-	if (lock_is_held_type(&dma_fence_lockdep_map, 1))
-		return true;
-
-	/* rely on might_sleep check for soft/hardirq locks */
-	if (in_atomic())
-		return true;
-
-	/* ... and non-recursive readlock */
-	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _RET_IP_);
-
-	return false;
+	return __dma_fence_begin_signalling(&dma_fence_lockdep_map);
 }
 EXPORT_SYMBOL(dma_fence_begin_signalling);
 
@@ -323,25 +354,61 @@ EXPORT_SYMBOL(dma_fence_begin_signalling);
  */
 void dma_fence_end_signalling(bool cookie)
 {
-	if (cookie)
-		return;
-
-	lock_release(&dma_fence_lockdep_map, _RET_IP_);
+	__dma_fence_end_signalling(cookie, &dma_fence_lockdep_map);
 }
 EXPORT_SYMBOL(dma_fence_end_signalling);
 
-void __dma_fence_might_wait(void)
+/**
+ * dma_fence_lr begin_signalling - begin a critical long-running DMA fence
+ * signalling section
+ *
+ * Drivers should use this to annotate the beginning of any code section
+ * required to eventually complete &dma_fence by calling dma_fence_signal().
+ *
+ * The end of these critical sections are annotated with
+ * dma_fence_lr_end_signalling(). Ideally the section should encompass all
+ * locks that are ever required to signal a long-running dma-fence.
+ *
+ * Return: An opaque cookie needed by the implementation, which needs to be
+ * passed to dma_fence_lr end_signalling().
+ */
+bool dma_fence_lr_begin_signalling(void)
+{
+	return __dma_fence_begin_signalling(&dma_fence_lr_lockdep_map);
+}
+EXPORT_SYMBOL(dma_fence_lr_begin_signalling);
+
+/**
+ * dma_fence_lr_end_signalling - end a critical DMA fence signalling section
+ * @cookie: opaque cookie from dma_fence_lr_begin_signalling()
+ *
+ * Closes a critical section annotation opened by
+ * dma_fence_lr_begin_signalling().
+ */
+void dma_fence_lr_end_signalling(bool cookie)
+{
+	__dma_fence_end_signalling(cookie, &dma_fence_lr_lockdep_map);
+}
+EXPORT_SYMBOL(dma_fence_lr_end_signalling);
+
+static void ___dma_fence_might_wait(struct lockdep_map *map)
 {
 	bool tmp;
 
-	tmp = lock_is_held_type(&dma_fence_lockdep_map, 1);
+	tmp = lock_is_held_type(map, 1);
 	if (tmp)
-		lock_release(&dma_fence_lockdep_map, _THIS_IP_);
-	lock_map_acquire(&dma_fence_lockdep_map);
-	lock_map_release(&dma_fence_lockdep_map);
+		lock_release(map, _THIS_IP_);
+	lock_map_acquire(map);
+	lock_map_release(map);
 	if (tmp)
-		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _THIS_IP_);
+		lock_acquire(map, 0, 0, 1, 1, NULL, _THIS_IP_);
+}
+
+void __dma_fence_might_wait(void)
+{
+	___dma_fence_might_wait(&dma_fence_lockdep_map);
 }
+
 #endif
 
 
@@ -506,7 +573,11 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	might_sleep();
 
-	__dma_fence_might_wait();
+#ifdef CONFIG_LOCKDEP
+	___dma_fence_might_wait(dma_fence_is_lr(fence) ?
+				&dma_fence_lr_lockdep_map :
+				&dma_fence_lockdep_map);
+#endif
 
 	dma_fence_enable_sw_signaling(fence);
 
@@ -618,29 +689,22 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
 /**
- * dma_fence_add_callback - add a callback to be called when the fence
+ * dma_fence_lr_add_callback - add a callback to be called when the fence
  * is signaled
  * @fence: the fence to wait on
  * @cb: the callback to register
  * @func: the function to call
  *
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
+ * This function is identical to dma_fence_add_callback() but allows adding
+ * callbacks also to lr dma-fences. The naming helps annotating the fact that
+ * we're adding a callback to a a lr fence and that the callback might therefore
+ * not be called within a reasonable amount of time.
  *
- * Returns 0 in case of success, -ENOENT if the fence is already signaled
+ * Return: 0 in case of success, -ENOENT if the fence is already signaled
  * and -EINVAL in case of error.
  */
-int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
-			   dma_fence_func_t func)
+int dma_fence_lr_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
+			      dma_fence_func_t func)
 {
 	unsigned long flags;
 	int ret = 0;
@@ -667,7 +731,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 
 	return ret;
 }
-EXPORT_SYMBOL(dma_fence_add_callback);
+EXPORT_SYMBOL(dma_fence_lr_add_callback);
 
 /**
  * dma_fence_get_status - returns the status upon completion
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 2a594b754af1..fa0210c1442e 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -292,6 +292,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	 * individually.
 	 */
 	WARN_ON(dma_fence_is_container(fence));
+	WARN_ON_ONCE(dma_fence_is_lr(fence));
 
 	fobj = dma_resv_fences_list(obj);
 	count = fobj->num_fences;
@@ -340,6 +341,7 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 	unsigned int i;
 
 	dma_resv_assert_held(obj);
+	WARN_ON_ONCE(dma_fence_is_lr(replacement));
 
 	list = dma_resv_fences_list(obj);
 	for (i = 0; list && i < list->num_fences; ++i) {
@@ -764,6 +766,7 @@ static int __init dma_resv_lockdep(void)
 	struct ww_acquire_ctx ctx;
 	struct dma_resv obj;
 	struct address_space mapping;
+	bool lr_cookie;
 	int ret;
 
 	if (!mm)
@@ -772,6 +775,7 @@ static int __init dma_resv_lockdep(void)
 	dma_resv_init(&obj);
 	address_space_init_once(&mapping);
 
+	lr_cookie = dma_fence_lr_begin_signalling();
 	mmap_read_lock(mm);
 	ww_acquire_init(&ctx, &reservation_ww_class);
 	ret = dma_resv_lock(&obj, &ctx);
@@ -792,6 +796,7 @@ static int __init dma_resv_lockdep(void)
 	ww_mutex_unlock(&obj.lock);
 	ww_acquire_fini(&ctx);
 	mmap_read_unlock(mm);
+	dma_fence_lr_end_signalling(lr_cookie);
 
 	mmput(mm);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d54b595a0fe0..08d21e26782b 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_LR_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
@@ -279,6 +280,11 @@ struct dma_fence_ops {
 	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
 };
 
+static inline bool dma_fence_is_lr(const struct dma_fence *fence)
+{
+	return test_bit(DMA_FENCE_FLAG_LR_BIT, &fence->flags);
+}
+
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		    spinlock_t *lock, u64 context, u64 seqno);
 
@@ -377,13 +383,23 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
 void dma_fence_end_signalling(bool cookie);
+bool dma_fence_lr_begin_signalling(void);
+void dma_fence_lr_end_signalling(bool cookie);
 void __dma_fence_might_wait(void);
 #else
+
 static inline bool dma_fence_begin_signalling(void)
 {
 	return true;
 }
+
 static inline void dma_fence_end_signalling(bool cookie) {}
+static inline bool dma_fence_lr_begin_signalling(void)
+{
+	return true;
+}
+
+static inline void dma_fence_lr_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
@@ -394,9 +410,42 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
-int dma_fence_add_callback(struct dma_fence *fence,
-			   struct dma_fence_cb *cb,
-			   dma_fence_func_t func);
+
+int dma_fence_lr_add_callback(struct dma_fence *fence,
+			      struct dma_fence_cb *cb,
+			      dma_fence_func_t func);
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
+static inline int dma_fence_add_callback(struct dma_fence *fence,
+					 struct dma_fence_cb *cb,
+					 dma_fence_func_t func)
+{
+	WARN_ON(IS_ENABLED(CONFIG_LOCKDEP) && dma_fence_is_lr(fence));
+
+	return dma_fence_lr_add_callback(fence, cb, func);
+}
+
 bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
-- 
2.34.1

