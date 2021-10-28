Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5C43E1C6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74326E84E;
	Thu, 28 Oct 2021 13:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132726E826;
 Thu, 28 Oct 2021 13:13:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227852738"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="227852738"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:01:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="665406494"
Received: from malloyd-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.16.73])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:01:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 02/11] drm/i915: Slightly rework EXEC_OBJECT_CAPTURE handling,
 v2.
Date: Thu, 28 Oct 2021 13:58:46 +0100
Message-Id: <20211028125855.3281674-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211028125855.3281674-1-matthew.auld@intel.com>
References: <20211028125855.3281674-1-matthew.auld@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Use a single null-terminated array for simplicity instead of a linked
list. This might slightly speed up execbuf when many vma's may be marked
as capture, but definitely removes an allocation from a signaling path.

We are not allowed to allocate memory in eb_move_to_gpu, but we can't
enforce it yet through annotations.

Changes since v1:
- Rebase on top of multi-batchbuffer changes.

v2:
  - Fix up checkpatch warnings

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> #v1
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 28 +++++++++++--------
 drivers/gpu/drm/i915/i915_gpu_error.c         |  9 +++---
 drivers/gpu/drm/i915/i915_request.c           |  9 ++----
 drivers/gpu/drm/i915/i915_request.h           |  7 +----
 4 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index ea5b7b2a4d70..37b9f7ddc409 100644
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
 
@@ -3130,6 +3128,13 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
 			return out_fence;
 		}
 
+		if (eb->capture_count) {
+			eb->requests[i]->capture_list =
+				kvcalloc(eb->capture_count + 1,
+					 sizeof(*eb->requests[i]->capture_list),
+					 GFP_KERNEL | __GFP_NOWARN);
+		}
+
 		/*
 		 * Only the first request added (committed to backend) has to
 		 * take the in fences into account as all subsequent requests
@@ -3197,6 +3202,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
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
index 820a1f38b271..808632337832 100644
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
index dc359242d1ae..49c87b160a6a 100644
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
2.26.3

