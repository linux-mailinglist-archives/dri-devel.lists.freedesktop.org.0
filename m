Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B4435F20
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD5D6E3EC;
	Thu, 21 Oct 2021 10:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B782A6E42C;
 Thu, 21 Oct 2021 10:36:09 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 05/28] drm/i915: Slightly rework EXEC_OBJECT_CAPTURE handling,
 v2.
Date: Thu, 21 Oct 2021 12:35:42 +0200
Message-Id: <20211021103605.735002-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
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

Use a single null-terminated array for simplicity instead of a linked
list. This might slightly speed up execbuf when many vma's may be marked
as capture, but definitely removes an allocation from a signaling path.

We are not allowed to allocate memory in eb_move_to_gpu, but we can't
enforce it yet through annotations.

Changes since v1:
- Rebase on top of multi-batchbuffer changes.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> #v1
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 29 ++++++++++++-------
 drivers/gpu/drm/i915/i915_gpu_error.c         |  9 +++---
 drivers/gpu/drm/i915/i915_request.c           |  9 ++----
 drivers/gpu/drm/i915/i915_request.h           |  7 +----
 4 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9c323666bd7c..eaacadd2d2e5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -265,6 +265,9 @@ struct i915_execbuffer {
 	/* number of batches in execbuf IOCTL */
 	unsigned int num_batches;
 
+	/* Number of objects with EXEC_OBJECT_CAPTURE set */
+	unsigned int capture_count;
+
 	/** list of vma not yet bound during reservation phase */
 	struct list_head unbound;
 
@@ -909,6 +912,9 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 			goto err;
 		}
 
+		if (eb->exec[i].flags & EXEC_OBJECT_CAPTURE)
+			eb->capture_count++;
+
 		err = eb_validate_vma(eb, &eb->exec[i], vma);
 		if (unlikely(err)) {
 			i915_vma_put(vma);
@@ -1906,19 +1912,11 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 		assert_vma_held(vma);
 
 		if (flags & EXEC_OBJECT_CAPTURE) {
-			struct i915_capture_list *capture;
+			eb->capture_count--;
 
 			for_each_batch_create_order(eb, j) {
-				if (!eb->requests[j])
-					break;
-
-				capture = kmalloc(sizeof(*capture), GFP_KERNEL);
-				if (capture) {
-					capture->next =
-						eb->requests[j]->capture_list;
-					capture->vma = vma;
-					eb->requests[j]->capture_list = capture;
-				}
+				if (eb->requests[j]->capture_list)
+					eb->requests[j]->capture_list[eb->capture_count] = vma;
 			}
 		}
 
@@ -3130,6 +3128,14 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
 			return out_fence;
 		}
 
+		if (eb->capture_count) {
+			eb->requests[i]->capture_list =
+				kvcalloc(eb->capture_count + 1,
+					sizeof(*eb->requests[i]->capture_list),
+					GFP_KERNEL | __GFP_NOWARN);
+		}
+
+
 		/*
 		 * Only the first request added (committed to backend) has to
 		 * take the in fences into account as all subsequent requests
@@ -3197,6 +3203,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
 	eb.fences = NULL;
 	eb.num_fences = 0;
+	eb.capture_count = 0;
 
 	memset(eb.requests, 0, sizeof(struct i915_request *) *
 	       ARRAY_SIZE(eb.requests));
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2a2d7643b551..45104bb12a98 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1356,10 +1356,10 @@ capture_user(struct intel_engine_capture_vma *capture,
 	     const struct i915_request *rq,
 	     gfp_t gfp)
 {
-	struct i915_capture_list *c;
+	int i;
 
-	for (c = rq->capture_list; c; c = c->next)
-		capture = capture_vma(capture, c->vma, "user", gfp);
+	for (i = 0; rq->capture_list[i]; i++)
+		capture = capture_vma(capture, rq->capture_list[i], "user", gfp);
 
 	return capture;
 }
@@ -1407,7 +1407,8 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
 	 * by userspace.
 	 */
 	vma = capture_vma(vma, rq->batch, "batch", gfp);
-	vma = capture_user(vma, rq, gfp);
+	if (rq->capture_list)
+		vma = capture_user(vma, rq, gfp);
 	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
 	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 42cd17357771..9b28e6f97c4b 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -188,15 +188,10 @@ void i915_request_notify_execute_cb_imm(struct i915_request *rq)
 
 static void free_capture_list(struct i915_request *request)
 {
-	struct i915_capture_list *capture;
+	struct i915_vma **capture;
 
 	capture = fetch_and_zero(&request->capture_list);
-	while (capture) {
-		struct i915_capture_list *next = capture->next;
-
-		kfree(capture);
-		capture = next;
-	}
+	kvfree(capture);
 }
 
 static void __i915_request_fill(struct i915_request *rq, u8 val)
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 3c6e8acd1457..2d04b25dca36 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -48,11 +48,6 @@ struct drm_i915_gem_object;
 struct drm_printer;
 struct i915_request;
 
-struct i915_capture_list {
-	struct i915_capture_list *next;
-	struct i915_vma *vma;
-};
-
 #define RQ_TRACE(rq, fmt, ...) do {					\
 	const struct i915_request *rq__ = (rq);				\
 	ENGINE_TRACE(rq__->engine, "fence %llx:%lld, current %d " fmt,	\
@@ -299,7 +294,7 @@ struct i915_request {
 	 * active reference - all objects on this list must also be
 	 * on the active_list (of their final request).
 	 */
-	struct i915_capture_list *capture_list;
+	struct i915_vma **capture_list;
 
 	/** Time at which this request was emitted, in jiffies. */
 	unsigned long emitted_jiffies;
-- 
2.33.0

