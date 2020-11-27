Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1C2C656A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B45C6ED27;
	Fri, 27 Nov 2020 12:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06F46ED27;
 Fri, 27 Nov 2020 12:11:55 +0000 (UTC)
IronPort-SDR: RzVG0nduLImn9nH6jN8HBx4J9ki97OQ4ALpGCyoTCla13LJ9m/0IKuVmZs3P4x4wfIcO92RP6r
 1uK7ZFmN/6sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092967"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:55 -0800
IronPort-SDR: xg4QABFf/BaxphTdJHe3rCkMjsCdjBmNaoItE1GKdCfzBA6iAlz/Bke1SvRDblGpDX86JcBSlj
 coVWIKDEwh7A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029929"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:54 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 138/162] drm/i915/dg1: Eliminate eviction mutex
Date: Fri, 27 Nov 2020 12:06:54 +0000
Message-Id: <20201127120718.454037-139-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We can eliminate the current evict window mutex, held over the whole
eviction process, and replace it with a wait queue which takes over the
role of co-ordinating access to pre-configured window copy vmas.

Apart from the global lock not being held over whole of the copy,
additional benefit is that, since we have two pairs of copy windows, two
evict operations can now progress independently. (One swap-in plus one
swap-out.)

Also consolidate some of the eviction code into helper functions for
readability and fix cleanup if emit_init_breadcrumb fails.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 144 ++++++++++++---------
 drivers/gpu/drm/i915/i915_drv.h            |   2 +-
 2 files changed, 85 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 3943a184fbe3..34bbefa6d67f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -856,7 +856,8 @@ int i915_setup_blt_windows(struct drm_i915_private *i915)
 		return 0;
 	}
 
-	mutex_init(&i915->mm.window_mutex);
+	init_waitqueue_head(&i915->mm.window_queue);
+
 	for (i = 0; i < ARRAY_SIZE(lmem); i++) {
 		lmem[i] = i915_window_vma_init(i915, lmem_region);
 		if (IS_ERR_OR_NULL(lmem[i])) {
@@ -904,7 +905,6 @@ void i915_teardown_blt_windows(struct drm_i915_private *i915)
 			continue;
 		i915_window_vma_teardown(i915->mm.smem_window[i]);
 	}
-	mutex_destroy(&i915->mm.window_mutex);
 }
 
 static int i915_window_blt_copy_prepare_obj(struct drm_i915_gem_object *obj)
@@ -950,6 +950,36 @@ i915_window_blt_copy_batch_prepare(struct i915_request *rq,
 	return 0;
 }
 
+static void prepare_vma(struct i915_vma *vma,
+			struct drm_i915_gem_object *obj,
+			u32 offset,
+			u32 chunk,
+			bool is_lmem)
+{
+	struct scatterlist *sgl;
+	u32 size;
+
+	/*
+	 * Source obj size could be smaller than the dst obj size,
+	 * due to the varying min_page_size of the mem regions the
+	 * obj belongs to. But when we insert the pages into vm,
+	 * the total size of the pages supposed to be multiples of
+	 * the min page size of that mem region.
+	 */
+	size = ALIGN(chunk, obj->mm.region->min_page_size) >> PAGE_SHIFT;
+	intel_partial_pages_for_sg_table(obj, vma->pages, offset, size, &sgl);
+
+	/*
+	 * Insert pages into vm, expects the pages to the full
+	 * length of VMA. But we may have the pages of <= vma_size.
+	 * Hence altering the vma size to match the total size of
+	 * the pages attached.
+	 */
+	vma->size = size << PAGE_SHIFT;
+	i915_insert_vma_pages(vma, is_lmem);
+	sg_unmark_end(sgl);
+}
+
 int i915_window_blt_copy(struct drm_i915_gem_object *dst,
 			 struct drm_i915_gem_object *src)
 {
@@ -957,24 +987,10 @@ int i915_window_blt_copy(struct drm_i915_gem_object *dst,
 	struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
 	bool src_is_lmem = i915_gem_object_is_lmem(src);
 	bool dst_is_lmem = i915_gem_object_is_lmem(dst);
-	struct scatterlist *last_sgl;
-	struct i915_vma *src_vma, *dst_vma;
-	struct i915_request *rq;
-	u64 cur_win_sz, blt_copied, offset;
-	long timeout;
-	u32 size;
+	u64 remain = src->base.size, offset = 0;
+	struct i915_vma *src_vma, *dst_vma, **ps, **pd;
 	int err;
 
-	src_vma = src_is_lmem ? i915->mm.lmem_window[0] :
-				i915->mm.smem_window[0];
-	dst_vma = dst_is_lmem ? i915->mm.lmem_window[1] :
-				i915->mm.smem_window[1];
-
-	if (!src_vma || !dst_vma)
-		return -ENODEV;
-
-	blt_copied = 0;
-
 	err = i915_window_blt_copy_prepare_obj(src);
 	if (err)
 		return err;
@@ -985,43 +1001,42 @@ int i915_window_blt_copy(struct drm_i915_gem_object *dst,
 		return err;
 	}
 
-	mutex_lock(&i915->mm.window_mutex);
+	ps = src_is_lmem ? &i915->mm.lmem_window[0] :
+			   &i915->mm.smem_window[0];
+	pd = dst_is_lmem ? &i915->mm.lmem_window[1] :
+			   &i915->mm.smem_window[1];
+
+	spin_lock(&i915->mm.window_queue.lock);
+
+	err = wait_event_interruptible_locked(i915->mm.window_queue,
+					      *ps && *pd);
+	if (err) {
+		spin_unlock(&i915->mm.window_queue.lock);
+		i915_gem_object_unpin_pages(src);
+		i915_gem_object_unpin_pages(dst);
+		return err;
+	}
+
+	src_vma = *ps;
+	dst_vma = *pd;
+
 	src_vma->obj = src;
 	dst_vma->obj = dst;
-	do {
-		cur_win_sz = min_t(u64, BLT_WINDOW_SZ,
-				   (src->base.size - blt_copied));
-		offset = blt_copied >> PAGE_SHIFT;
-		size = ALIGN(cur_win_sz, src->mm.region->min_page_size) >>
-		       PAGE_SHIFT;
-		intel_partial_pages_for_sg_table(src, src_vma->pages, offset,
-						 size, &last_sgl);
 
-		/*
-		 * Insert pages into vm, expects the pages to the full
-		 * length of VMA. But we may have the pages of <= vma_size.
-		 * Hence altering the vma size to match the total size of
-		 * the pages attached.
-		 */
-		src_vma->size = size << PAGE_SHIFT;
-		i915_insert_vma_pages(src_vma, src_is_lmem);
-		sg_unmark_end(last_sgl);
+	*ps = NULL;
+	*pd = NULL;
 
-		/*
-		 * Source obj size could be smaller than the dst obj size,
-		 * due to the varying min_page_size of the mem regions the
-		 * obj belongs to. But when we insert the pages into vm,
-		 * the total size of the pages supposed to be multiples of
-		 * the min page size of that mem region.
-		 */
-		size = ALIGN(cur_win_sz, dst->mm.region->min_page_size) >>
-		       PAGE_SHIFT;
-		intel_partial_pages_for_sg_table(dst, dst_vma->pages, offset,
-						 size, &last_sgl);
+	spin_unlock(&i915->mm.window_queue.lock);
+
+	do {
+		struct i915_request *rq;
+		long timeout;
+		u32 chunk;
 
-		dst_vma->size = size << PAGE_SHIFT;
-		i915_insert_vma_pages(dst_vma, dst_is_lmem);
-		sg_unmark_end(last_sgl);
+		chunk = min_t(u64, BLT_WINDOW_SZ, remain);
+
+		prepare_vma(src_vma, src, offset, chunk, src_is_lmem);
+		prepare_vma(dst_vma, dst, offset, chunk, dst_is_lmem);
 
 		rq = i915_request_create(ce);
 		if (IS_ERR(rq)) {
@@ -1032,11 +1047,14 @@ int i915_window_blt_copy(struct drm_i915_gem_object *dst,
 			err = rq->engine->emit_init_breadcrumb(rq);
 			if (unlikely(err)) {
 				DRM_ERROR("init_breadcrumb failed. %d\n", err);
+				i915_request_set_error_once(rq, err);
+				__i915_request_skip(rq);
+				i915_request_add(rq);
 				break;
 			}
 		}
 		err = i915_window_blt_copy_batch_prepare(rq, src_vma, dst_vma,
-							 cur_win_sz);
+							 chunk);
 		if (err) {
 			DRM_ERROR("Batch preparation failed. %d\n", err);
 			i915_request_set_error_once(rq, -EIO);
@@ -1045,26 +1063,32 @@ int i915_window_blt_copy(struct drm_i915_gem_object *dst,
 		i915_request_get(rq);
 		i915_request_add(rq);
 
-		timeout = i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
-		if (timeout < 0) {
+		if (!err)
+			timeout = i915_request_wait(rq, 0,
+						    MAX_SCHEDULE_TIMEOUT);
+		i915_request_put(rq);
+		if (!err && timeout < 0) {
 			DRM_ERROR("BLT Request is not completed. %ld\n",
 				  timeout);
 			err = timeout;
-			i915_request_put(rq);
 			break;
 		}
 
-		blt_copied += cur_win_sz;
-		err = 0;
-		i915_request_put(rq);
-		flush_work(&i915->gt.engine[BCS0]->retire_work);
-	} while (src->base.size != blt_copied);
+		remain -= chunk;
+		offset += chunk >> PAGE_SHIFT;
+
+		flush_work(&ce->engine->retire_work);
+	} while (remain);
 
+	spin_lock(&i915->mm.window_queue.lock);
 	src_vma->size = BLT_WINDOW_SZ;
 	dst_vma->size = BLT_WINDOW_SZ;
 	src_vma->obj = NULL;
 	dst_vma->obj = NULL;
-	mutex_unlock(&i915->mm.window_mutex);
+	*ps = src_vma;
+	*pd = dst_vma;
+	wake_up_locked(&i915->mm.window_queue);
+	spin_unlock(&i915->mm.window_queue.lock);
 
 	dst->mm.dirty = true;
 	i915_gem_object_unpin_pages(src);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 07da059640a1..82f431cc38cd 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -600,7 +600,7 @@ struct i915_gem_mm {
 	struct i915_vma *smem_window[2];
 
 	/* To protect above two set of vmas */
-	struct mutex window_mutex;
+	wait_queue_head_t window_queue;
 };
 
 #define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
