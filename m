Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D841A435F24
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FCA6E427;
	Thu, 21 Oct 2021 10:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67496E42A;
 Thu, 21 Oct 2021 10:36:09 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 01/28] drm/i915: Fix i915_request fence wait semantics
Date: Thu, 21 Oct 2021 12:35:38 +0200
Message-Id: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915_request fence wait behaves differently for timeout = 0
compared to expected dma-fence behavior.

i915 behavior:
- Unsignaled: -ETIME
- Signaled: 0 (= timeout)

Expected:
- Unsignaled: 0
- Signaled: 1

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 57 ++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/i915_request.h |  5 +++
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 820a1f38b271..42cd17357771 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -96,9 +96,9 @@ static signed long i915_fence_wait(struct dma_fence *fence,
 				   bool interruptible,
 				   signed long timeout)
 {
-	return i915_request_wait(to_request(fence),
-				 interruptible | I915_WAIT_PRIORITY,
-				 timeout);
+	return i915_request_wait_timeout(to_request(fence),
+					 interruptible | I915_WAIT_PRIORITY,
+					 timeout);
 }
 
 struct kmem_cache *i915_request_slab_cache(void)
@@ -1857,23 +1857,27 @@ static void request_wait_wake(struct dma_fence *fence, struct dma_fence_cb *cb)
 }
 
 /**
- * i915_request_wait - wait until execution of request has finished
+ * i915_request_wait_timeout - wait until execution of request has finished
  * @rq: the request to wait upon
  * @flags: how to wait
  * @timeout: how long to wait in jiffies
  *
- * i915_request_wait() waits for the request to be completed, for a
+ * i915_request_wait_timeout() waits for the request to be completed, for a
  * maximum of @timeout jiffies (with MAX_SCHEDULE_TIMEOUT implying an
  * unbounded wait).
  *
  * Returns the remaining time (in jiffies) if the request completed, which may
- * be zero or -ETIME if the request is unfinished after the timeout expires.
+ * be zero if the request is unfinished after the timeout expires.
+ * If the timeout is 0, it will return 1 if the fence is signaled.
+ *
  * May return -EINTR is called with I915_WAIT_INTERRUPTIBLE and a signal is
  * pending before the request completes.
+ *
+ * NOTE: This function has the same wait semantics as dma-fence.
  */
-long i915_request_wait(struct i915_request *rq,
-		       unsigned int flags,
-		       long timeout)
+long i915_request_wait_timeout(struct i915_request *rq,
+			       unsigned int flags,
+			       long timeout)
 {
 	const int state = flags & I915_WAIT_INTERRUPTIBLE ?
 		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
@@ -1883,7 +1887,7 @@ long i915_request_wait(struct i915_request *rq,
 	GEM_BUG_ON(timeout < 0);
 
 	if (dma_fence_is_signaled(&rq->fence))
-		return timeout;
+		return timeout ?: 1;
 
 	if (!timeout)
 		return -ETIME;
@@ -1992,6 +1996,39 @@ long i915_request_wait(struct i915_request *rq,
 	return timeout;
 }
 
+/**
+ * i915_request_wait - wait until execution of request has finished
+ * @rq: the request to wait upon
+ * @flags: how to wait
+ * @timeout: how long to wait in jiffies
+ *
+ * i915_request_wait() waits for the request to be completed, for a
+ * maximum of @timeout jiffies (with MAX_SCHEDULE_TIMEOUT implying an
+ * unbounded wait).
+ *
+ * Returns the remaining time (in jiffies) if the request completed, which may
+ * be zero or -ETIME if the request is unfinished after the timeout expires.
+ * May return -EINTR is called with I915_WAIT_INTERRUPTIBLE and a signal is
+ * pending before the request completes.
+ *
+ * NOTE: This function behaves differently from dma-fence wait semantics for
+ * timeout = 0. It returns 0 on success, and -ETIME if not signaled.
+ */
+long i915_request_wait(struct i915_request *rq,
+		       unsigned int flags,
+		       long timeout)
+{
+	long ret = i915_request_wait_timeout(rq, flags, timeout);
+
+	if (!ret)
+		return -ETIME;
+
+	if (ret > 0 && !timeout)
+		return 0;
+
+	return ret;
+}
+
 static int print_sched_attr(const struct i915_sched_attr *attr,
 			    char *buf, int x, int len)
 {
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index dc359242d1ae..3c6e8acd1457 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -414,6 +414,11 @@ void i915_request_unsubmit(struct i915_request *request);
 
 void i915_request_cancel(struct i915_request *rq, int error);
 
+long i915_request_wait_timeout(struct i915_request *rq,
+			       unsigned int flags,
+			       long timeout)
+	__attribute__((nonnull(1)));
+
 long i915_request_wait(struct i915_request *rq,
 		       unsigned int flags,
 		       long timeout)
-- 
2.33.0

