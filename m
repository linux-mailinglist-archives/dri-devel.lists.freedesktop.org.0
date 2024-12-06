Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD759E6F21
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 14:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D06810F0E1;
	Fri,  6 Dec 2024 13:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lgCs08rL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798BE10F0E4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GONI0SMrMfuWcIQ8AIoZ2owyXRnLZP14tiFwFxaEdKk=; b=lgCs08rLjjg63WoD/f3ULD3h0K
 oobJGOxWL1x1lueFNgSiDLHg1pm4hm5+KLAIN8JjqXjZ8lNqrSH6PSNY8J3sU4TAsXIM55EOK3mDv
 VJVBEiVzPCMRtPfFh4Z6tXp+ZQnPpiiMiip+194OzoXVzxv1Z/o5qkkzXNZVepR8MVp9Mm6K4XHWZ
 9Gra0TX21bihYI4Ud0+7JfxCQ9KUzFER2UotFYkTHDl3BaKENuk6JNaLRriZfDxUtJl9X2ZAZI1+F
 k8M3rLBR06FVgyCvKjnbJAQJtjVO8RdSjF7cEFA/8FjvKHAHv9SyCzV+PRjovDlvqD7bPta1+6R/6
 r43Uw2Dg==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tJYD7-00HQHu-K8; Fri, 06 Dec 2024 14:17:34 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 3/4] drm/vc4: Remove BOs seqnos
Date: Fri,  6 Dec 2024 10:12:36 -0300
Message-ID: <20241206131706.203324-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206131706.203324-1-mcanal@igalia.com>
References: <20241206131706.203324-1-mcanal@igalia.com>
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
from a time when VC4 didn't support DMA Reservation Objects. When they
were introduced, it made sense to think about tracking the correspondence
between the BOs and the jobs through the job's seqno.

This is no longer needed, as VC4 already has support for DMA Reservation
Objects and attaches the "job done" fence to the BOs.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c     | 22 +++++++++++-----------
 drivers/gpu/drm/vc4/vc4_drv.h      | 13 -------------
 drivers/gpu/drm/vc4/vc4_gem.c      | 18 ++----------------
 drivers/gpu/drm/vc4/vc4_validate.c | 11 -----------
 4 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bfa25efa5db2..1b9b54286a6e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -919,10 +919,11 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 	kfree(flip_state);
 }
 
-static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
+static void vc4_async_page_flip_seqno_complete(struct dma_fence *fence,
+					       struct dma_fence_cb *cb)
 {
 	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb.seqno);
+		container_of(cb, struct vc4_async_flip_state, cb.fence);
 	struct vc4_bo *bo = NULL;
 
 	if (flip_state->old_fb) {
@@ -961,16 +962,15 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
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
+		async_page_flip_complete_function = vc4_async_page_flip_seqno_complete;
+	else
+		async_page_flip_complete_function = vc4_async_page_flip_fence_complete;
 
 	ret = dma_resv_get_singleton(dma_bo->base.resv, DMA_RESV_USAGE_READ, &fence);
 	if (ret)
@@ -978,14 +978,14 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
 
 	/* If there's no fence, complete the page flip immediately */
 	if (!fence) {
-		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
+		async_page_flip_complete_function(fence, &flip_state->cb.fence);
 		return 0;
 	}
 
 	/* If the fence has already been completed, complete the page flip */
 	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
-				   vc4_async_page_flip_fence_complete))
-		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
+				   async_page_flip_complete_function))
+		async_page_flip_complete_function(fence, &flip_state->cb.fence);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 03ed40ab9a93..ff8048991030 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -247,16 +247,6 @@ struct vc4_dev {
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
@@ -695,9 +685,6 @@ struct vc4_exec_info {
 	/* Sequence number for this bin/render job. */
 	uint64_t seqno;
 
-	/* Latest write_seqno of any BO that binning depends on. */
-	uint64_t bin_dep_seqno;
-
 	struct dma_fence *fence;
 
 	/* Last current addresses the hardware was processing when the
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 256af016ade0..879d9fdfff22 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -552,27 +552,19 @@ vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec)
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
@@ -652,7 +644,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
 	if (out_sync)
 		drm_syncobj_replace_fence(out_sync, exec->fence);
 
-	vc4_update_bo_seqnos(exec, seqno);
+	vc4_attach_fences(exec);
 
 	drm_gem_unlock_reservations(exec->bo, exec->bo_count, acquire_ctx);
 
@@ -850,12 +842,6 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
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

