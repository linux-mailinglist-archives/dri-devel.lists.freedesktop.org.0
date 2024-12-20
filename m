Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCC9F936E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 14:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573FB10E37F;
	Fri, 20 Dec 2024 13:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I3n0+TEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E5A10E5EF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QYnwXbultzEWA6F475Vwz1xj8TdWh7vXuJ9eSwX88lE=; b=I3n0+TEBsbN14U0Xu8l8jSqBOV
 U2R5A0qvh5D1VIN0HE1p/8GOJcjc7hIGzv4j6eiRfFn0zZ0/AB/qKDjbqtb2W5Mm5IEl2MkOnbl2U
 MuHBCoABlsq9AgDvCUpXAV9e7IMY6zm8wNbxoEpZONEvLX0ZKjIj/DZpa7PNoNzryzhDeJDHzhRdl
 Fy1hyyu4xzpAwv+jA4puQ6X5go9+2u+OmlciL2jWZmiZULIlhms4nSFkEL0B4KS0M9IbaJS7EhvLO
 pH/N7f0i3gum6rHqpX+CXoEGQKfQycDjYzuTMSOQaCYHa1KTO4ftsas7aZXUceLggLUEZmyqIteLX
 MWuapb+g==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tOdH2-005n05-1L; Fri, 20 Dec 2024 14:42:36 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 3/3] drm/vc4: Remove BOs seqnos
Date: Fri, 20 Dec 2024 10:37:09 -0300
Message-ID: <20241220134204.634577-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220134204.634577-1-mcanal@igalia.com>
References: <20241220134204.634577-1-mcanal@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`bo->seqno`, `bo->write_seqno`, and `exec->bin_dep_seqno` are leftovers
from a time when VC4 didn't support DMA Reservation Objects. Before DMA
Resv was introduced, tracking the correspondence between BOs and jobs
through the job's seqno made sense.

However, this is no longer needed, as VC4 now supports DMA Reservation
Objects and attaches the "job done" fence to the BOs. Therefore, remove
the BOs seqnos in favor of using DMA Resv Objects.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_crtc.c     | 33 ++++++++---------
 drivers/gpu/drm/vc4/vc4_drv.h      | 27 --------------
 drivers/gpu/drm/vc4/vc4_gem.c      | 59 +-----------------------------
 drivers/gpu/drm/vc4/vc4_validate.c | 11 ------
 4 files changed, 17 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index cf40a53ad42e..2a48038abe7a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -884,11 +884,7 @@ struct vc4_async_flip_state {
 	struct drm_framebuffer *fb;
 	struct drm_framebuffer *old_fb;
 	struct drm_pending_vblank_event *event;
-
-	union {
-		struct dma_fence_cb fence;
-		struct vc4_seqno_cb seqno;
-	} cb;
+	struct dma_fence_cb cb;
 };
 
 /* Called when the V3D execution for the BO being flipped to is done, so that
@@ -919,10 +915,11 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 	kfree(flip_state);
 }
 
-static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
+static void vc4_async_page_flip_complete_with_cleanup(struct dma_fence *fence,
+						      struct dma_fence_cb *cb)
 {
 	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb.seqno);
+		container_of(cb, struct vc4_async_flip_state, cb);
 	struct vc4_bo *bo = NULL;
 
 	if (flip_state->old_fb) {
@@ -932,6 +929,7 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
 	}
 
 	vc4_async_page_flip_complete(flip_state);
+	dma_fence_put(fence);
 
 	/*
 	 * Decrement the BO usecnt in order to keep the inc/dec
@@ -950,7 +948,7 @@ static void vc4_async_page_flip_fence_complete(struct dma_fence *fence,
 					       struct dma_fence_cb *cb)
 {
 	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb.fence);
+		container_of(cb, struct vc4_async_flip_state, cb);
 
 	vc4_async_page_flip_complete(flip_state);
 	dma_fence_put(fence);
@@ -961,16 +959,15 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
 {
 	struct drm_framebuffer *fb = flip_state->fb;
 	struct drm_gem_dma_object *dma_bo = drm_fb_dma_get_gem_obj(fb, 0);
+	dma_fence_func_t async_page_flip_complete_function;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct dma_fence *fence;
 	int ret;
 
-	if (vc4->gen == VC4_GEN_4) {
-		struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
-
-		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
-					  vc4_async_page_flip_seqno_complete);
-	}
+	if (vc4->gen == VC4_GEN_4)
+		async_page_flip_complete_function = vc4_async_page_flip_complete_with_cleanup;
+	else
+		async_page_flip_complete_function = vc4_async_page_flip_fence_complete;
 
 	ret = dma_resv_get_singleton(dma_bo->base.resv, DMA_RESV_USAGE_READ, &fence);
 	if (ret)
@@ -978,14 +975,14 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
 
 	/* If there's no fence, complete the page flip immediately */
 	if (!fence) {
-		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
+		async_page_flip_complete_function(fence, &flip_state->cb);
 		return 0;
 	}
 
 	/* If the fence has already been completed, complete the page flip */
-	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
-				   vc4_async_page_flip_fence_complete))
-		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
+	if (dma_fence_add_callback(fence, &flip_state->cb,
+				   async_page_flip_complete_function))
+		async_page_flip_complete_function(fence, &flip_state->cb);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4a078ffd9f82..221d8e01d539 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -186,11 +186,6 @@ struct vc4_dev {
 	 */
 	struct vc4_perfmon *active_perfmon;
 
-	/* List of struct vc4_seqno_cb for callbacks to be made from a
-	 * workqueue when the given seqno is passed.
-	 */
-	struct list_head seqno_cb_list;
-
 	/* The memory used for storing binner tile alloc, tile state,
 	 * and overflow memory allocations.  This is freed when V3D
 	 * powers down.
@@ -247,16 +242,6 @@ struct vc4_dev {
 struct vc4_bo {
 	struct drm_gem_dma_object base;
 
-	/* seqno of the last job to render using this BO. */
-	uint64_t seqno;
-
-	/* seqno of the last job to use the RCL to write to this BO.
-	 *
-	 * Note that this doesn't include binner overflow memory
-	 * writes.
-	 */
-	uint64_t write_seqno;
-
 	bool t_format;
 
 	/* List entry for the BO's position in either
@@ -304,12 +289,6 @@ struct vc4_fence {
 #define to_vc4_fence(_fence)					\
 	container_of_const(_fence, struct vc4_fence, base)
 
-struct vc4_seqno_cb {
-	struct work_struct work;
-	uint64_t seqno;
-	void (*func)(struct vc4_seqno_cb *cb);
-};
-
 struct vc4_v3d {
 	struct vc4_dev *vc4;
 	struct platform_device *pdev;
@@ -695,9 +674,6 @@ struct vc4_exec_info {
 	/* Sequence number for this bin/render job. */
 	uint64_t seqno;
 
-	/* Latest write_seqno of any BO that binning depends on. */
-	uint64_t bin_dep_seqno;
-
 	struct dma_fence *fence;
 
 	/* Last current addresses the hardware was processing when the
@@ -1025,9 +1001,6 @@ void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
 int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
 		       uint64_t timeout_ns, bool interruptible);
 void vc4_job_handle_completed(struct vc4_dev *vc4);
-int vc4_queue_seqno_cb(struct drm_device *dev,
-		       struct vc4_seqno_cb *cb, uint64_t seqno,
-		       void (*func)(struct vc4_seqno_cb *cb));
 int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file_priv);
 
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index de7be9942c13..8125f87edc60 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -553,27 +553,19 @@ vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec)
 }
 
 static void
-vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
+vc4_attach_fences(struct vc4_exec_info *exec)
 {
 	struct vc4_bo *bo;
 	unsigned i;
 
 	for (i = 0; i < exec->bo_count; i++) {
 		bo = to_vc4_bo(exec->bo[i]);
-		bo->seqno = seqno;
-
 		dma_resv_add_fence(bo->base.base.resv, exec->fence,
 				   DMA_RESV_USAGE_READ);
 	}
 
-	list_for_each_entry(bo, &exec->unref_list, unref_head) {
-		bo->seqno = seqno;
-	}
-
 	for (i = 0; i < exec->rcl_write_bo_count; i++) {
 		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
-		bo->write_seqno = seqno;
-
 		dma_resv_add_fence(bo->base.base.resv, exec->fence,
 				   DMA_RESV_USAGE_WRITE);
 	}
@@ -647,7 +639,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
 	if (out_sync)
 		drm_syncobj_replace_fence(out_sync, exec->fence);
 
-	vc4_update_bo_seqnos(exec, seqno);
+	vc4_attach_fences(exec);
 
 	drm_exec_fini(exec_ctx);
 
@@ -845,12 +837,6 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
 			goto fail;
 	}
 
-	/* Block waiting on any previous rendering into the CS's VBO,
-	 * IB, or textures, so that pixels are actually written by the
-	 * time we try to read them.
-	 */
-	ret = vc4_wait_for_seqno(dev, exec->bin_dep_seqno, ~0ull, true);
-
 fail:
 	kvfree(temp);
 	return ret;
@@ -909,7 +895,6 @@ void
 vc4_job_handle_completed(struct vc4_dev *vc4)
 {
 	unsigned long irqflags;
-	struct vc4_seqno_cb *cb, *cb_temp;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
@@ -926,48 +911,9 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
 		spin_lock_irqsave(&vc4->job_lock, irqflags);
 	}
 
-	list_for_each_entry_safe(cb, cb_temp, &vc4->seqno_cb_list, work.entry) {
-		if (cb->seqno <= vc4->finished_seqno) {
-			list_del_init(&cb->work.entry);
-			schedule_work(&cb->work);
-		}
-	}
-
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 }
 
-static void vc4_seqno_cb_work(struct work_struct *work)
-{
-	struct vc4_seqno_cb *cb = container_of(work, struct vc4_seqno_cb, work);
-
-	cb->func(cb);
-}
-
-int vc4_queue_seqno_cb(struct drm_device *dev,
-		       struct vc4_seqno_cb *cb, uint64_t seqno,
-		       void (*func)(struct vc4_seqno_cb *cb))
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	unsigned long irqflags;
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return -ENODEV;
-
-	cb->func = func;
-	INIT_WORK(&cb->work, vc4_seqno_cb_work);
-
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	if (seqno > vc4->finished_seqno) {
-		cb->seqno = seqno;
-		list_add_tail(&cb->work.entry, &vc4->seqno_cb_list);
-	} else {
-		schedule_work(&cb->work);
-	}
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-
-	return 0;
-}
-
 /* Scheduled when any job has been completed, this walks the list of
  * jobs that had completed and unrefs their BOs and frees their exec
  * structs.
@@ -1221,7 +1167,6 @@ int vc4_gem_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&vc4->bin_job_list);
 	INIT_LIST_HEAD(&vc4->render_job_list);
 	INIT_LIST_HEAD(&vc4->job_done_list);
-	INIT_LIST_HEAD(&vc4->seqno_cb_list);
 	spin_lock_init(&vc4->job_lock);
 
 	INIT_WORK(&vc4->hangcheck.reset_work, vc4_reset_work);
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 5bf134968ade..1e7bdda55698 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -284,9 +284,6 @@ validate_indexed_prim_list(VALIDATE_ARGS)
 	if (!ib)
 		return -EINVAL;
 
-	exec->bin_dep_seqno = max(exec->bin_dep_seqno,
-				  to_vc4_bo(&ib->base)->write_seqno);
-
 	if (offset > ib->base.size ||
 	    (ib->base.size - offset) / index_size < length) {
 		DRM_DEBUG("IB access overflow (%d + %d*%d > %zd)\n",
@@ -738,11 +735,6 @@ reloc_tex(struct vc4_exec_info *exec,
 
 	*validated_p0 = tex->dma_addr + p0;
 
-	if (is_cs) {
-		exec->bin_dep_seqno = max(exec->bin_dep_seqno,
-					  to_vc4_bo(&tex->base)->write_seqno);
-	}
-
 	return true;
  fail:
 	DRM_INFO("Texture p0 at %d: 0x%08x\n", sample->p_offset[0], p0);
@@ -904,9 +896,6 @@ validate_gl_shader_rec(struct drm_device *dev,
 		uint32_t stride = *(uint8_t *)(pkt_u + o + 5);
 		uint32_t max_index;
 
-		exec->bin_dep_seqno = max(exec->bin_dep_seqno,
-					  to_vc4_bo(&vbo->base)->write_seqno);
-
 		if (state->addr & 0x8)
 			stride |= (*(uint32_t *)(pkt_u + 100 + i * 4)) & ~0xff;
 
-- 
2.47.1

