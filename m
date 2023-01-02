Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB165B24D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 13:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E010E325;
	Mon,  2 Jan 2023 12:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A30110E325
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pF/KCbULCEbPQWOpK06K6CN7IKw9G4tBQTzNVM9xw5I=; b=ctCBmyDG42gdB/neWLx0MScxxT
 ul7jidEmiCHP8wRoRVE2l/INGx0o+hQMcRj2mmGRzNFxPoEnyxpC4tY4eAEE2udPYUfLYT6cKPTz4
 h6ZxRchKxurH3mXsLDqyMMLRYcM1fhvzd+47JW+POvZU6Ba6+amDCgAexjIYcjZfRzSetMrNAFlDy
 vbBmaNw+Ov0TjhLk2XVhx4YchcsN95pDPdtXPO3aaA9CxF+u8yx83/osJ6yyc9T053rAFPpNTz6GS
 8ZyVjsei04BLufrbr6q5n8ApcNc4pK4/sTFgmwRCOqnTteLUCfeNsvANLclivtGmDDktURhr19bZg
 9XsobT9w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pCKCN-00FGSv-Cq; Mon, 02 Jan 2023 13:45:51 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/vc4: replace drm_gem_dma_object for drm_gem_object in
 vc4_exec_info
Date: Mon,  2 Jan 2023 09:45:34 -0300
Message-Id: <20230102124535.139202-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230102124535.139202-1-mcanal@igalia.com>
References: <20230102124535.139202-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The array of BOs that are lookup up at the start of exec doesn't need
to be instantiated as drm_gem_dma_object, as it doesn't benefit
from its attributes. So, simplify the code by replacing the array of
drm_gem_dma_object for an array of drm_gem_object in the struct
vc4_exec_info.

Suggested-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h      |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c      | 37 ++++++++++++++----------------
 drivers/gpu/drm/vc4/vc4_validate.c |  4 ++--
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 95069bb16821..8768566c610b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -690,7 +690,7 @@ struct vc4_exec_info {
 	/* This is the array of BOs that were looked up at the start of exec.
 	 * Command validation will use indices into this array.
 	 */
-	struct drm_gem_dma_object **bo;
+	struct drm_gem_object **bo;
 	uint32_t bo_count;
 
 	/* List of BOs that are being written by the RCL.  Other than
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 628d40ff3aa1..d6985d067e34 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -199,7 +199,7 @@ vc4_save_hang_state(struct drm_device *dev)
 			continue;
 
 		for (j = 0; j < exec[i]->bo_count; j++) {
-			bo = to_vc4_bo(&exec[i]->bo[j]->base);
+			bo = to_vc4_bo(exec[i]->bo[j]);
 
 			/* Retain BOs just in case they were marked purgeable.
 			 * This prevents the BO from being purged before
@@ -207,8 +207,8 @@ vc4_save_hang_state(struct drm_device *dev)
 			 */
 			WARN_ON(!refcount_read(&bo->usecnt));
 			refcount_inc(&bo->usecnt);
-			drm_gem_object_get(&exec[i]->bo[j]->base);
-			kernel_state->bo[k++] = &exec[i]->bo[j]->base;
+			drm_gem_object_get(exec[i]->bo[j]);
+			kernel_state->bo[k++] = exec[i]->bo[j];
 		}
 
 		list_for_each_entry(bo, &exec[i]->unref_list, unref_head) {
@@ -558,7 +558,7 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 	unsigned i;
 
 	for (i = 0; i < exec->bo_count; i++) {
-		bo = to_vc4_bo(&exec->bo[i]->base);
+		bo = to_vc4_bo(exec->bo[i]);
 		bo->seqno = seqno;
 
 		dma_resv_add_fence(bo->base.base.resv, exec->fence,
@@ -585,11 +585,8 @@ vc4_unlock_bo_reservations(struct drm_device *dev,
 {
 	int i;
 
-	for (i = 0; i < exec->bo_count; i++) {
-		struct drm_gem_object *bo = &exec->bo[i]->base;
-
-		dma_resv_unlock(bo->resv);
-	}
+	for (i = 0; i < exec->bo_count; i++)
+		dma_resv_unlock(exec->bo[i]->resv);
 
 	ww_acquire_fini(acquire_ctx);
 }
@@ -614,7 +611,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 
 retry:
 	if (contended_lock != -1) {
-		bo = &exec->bo[contended_lock]->base;
+		bo = exec->bo[contended_lock];
 		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
 		if (ret) {
 			ww_acquire_done(acquire_ctx);
@@ -626,19 +623,19 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 		if (i == contended_lock)
 			continue;
 
-		bo = &exec->bo[i]->base;
+		bo = exec->bo[i];
 
 		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
 		if (ret) {
 			int j;
 
 			for (j = 0; j < i; j++) {
-				bo = &exec->bo[j]->base;
+				bo = exec->bo[j];
 				dma_resv_unlock(bo->resv);
 			}
 
 			if (contended_lock != -1 && contended_lock >= i) {
-				bo = &exec->bo[contended_lock]->base;
+				bo = exec->bo[contended_lock];
 
 				dma_resv_unlock(bo->resv);
 			}
@@ -659,7 +656,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 	 * before we commit the CL to the hardware.
 	 */
 	for (i = 0; i < exec->bo_count; i++) {
-		bo = &exec->bo[i]->base;
+		bo = exec->bo[i];
 
 		ret = dma_resv_reserve_fences(bo->resv, 1);
 		if (ret) {
@@ -797,7 +794,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 		}
 
 		drm_gem_object_get(bo);
-		exec->bo[i] = (struct drm_gem_dma_object *)bo;
+		exec->bo[i] = bo;
 	}
 	spin_unlock(&file_priv->table_lock);
 
@@ -805,7 +802,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 		goto fail_put_bo;
 
 	for (i = 0; i < exec->bo_count; i++) {
-		ret = vc4_bo_inc_usecnt(to_vc4_bo(&exec->bo[i]->base));
+		ret = vc4_bo_inc_usecnt(to_vc4_bo(exec->bo[i]));
 		if (ret)
 			goto fail_dec_usecnt;
 	}
@@ -823,12 +820,12 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 	 * step.
 	 */
 	for (i-- ; i >= 0; i--)
-		vc4_bo_dec_usecnt(to_vc4_bo(&exec->bo[i]->base));
+		vc4_bo_dec_usecnt(to_vc4_bo(exec->bo[i]));
 
 fail_put_bo:
 	/* Release any reference to acquired objects. */
 	for (i = 0; i < exec->bo_count && exec->bo[i]; i++)
-		drm_gem_object_put(&exec->bo[i]->base);
+		drm_gem_object_put(exec->bo[i]);
 
 fail:
 	kvfree(handles);
@@ -974,10 +971,10 @@ vc4_complete_exec(struct drm_device *dev, struct vc4_exec_info *exec)
 
 	if (exec->bo) {
 		for (i = 0; i < exec->bo_count; i++) {
-			struct vc4_bo *bo = to_vc4_bo(&exec->bo[i]->base);
+			struct vc4_bo *bo = to_vc4_bo(exec->bo[i]);
 
 			vc4_bo_dec_usecnt(bo);
-			drm_gem_object_put(&exec->bo[i]->base);
+			drm_gem_object_put(exec->bo[i]);
 		}
 		kvfree(exec->bo);
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 520231af4df9..7dff3ca5af6b 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -117,7 +117,7 @@ vc4_use_bo(struct vc4_exec_info *exec, uint32_t hindex)
 			  hindex, exec->bo_count);
 		return NULL;
 	}
-	obj = exec->bo[hindex];
+	obj = to_drm_gem_dma_obj(exec->bo[hindex]);
 	bo = to_vc4_bo(&obj->base);
 
 	if (bo->validated_shader) {
@@ -810,7 +810,7 @@ validate_gl_shader_rec(struct drm_device *dev,
 			return -EINVAL;
 		}
 
-		bo[i] = exec->bo[src_handles[i]];
+		bo[i] = to_drm_gem_dma_obj(exec->bo[src_handles[i]]);
 		if (!bo[i])
 			return -EINVAL;
 	}
-- 
2.38.1

