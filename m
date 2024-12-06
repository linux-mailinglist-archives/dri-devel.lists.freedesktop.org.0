Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167239E6F1E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 14:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021B510F0CD;
	Fri,  6 Dec 2024 13:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lLUdUYgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB92A10F0D5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9cnJwX5vBVA53SV+FuCCQIt4R1G+KZmMzEPipYtAiVw=; b=lLUdUYgHl5Y0uyys4NT8ZuJlMh
 UjYTgJ+H4Ek4ZTfNZbiydRI04GT/1BMcyXUv7ZLFUHYaWi/SXJXhG9bQt4aG95hkAzmNamiElXAnI
 SSQj1NNrAOzQF7f8FxhLT/USzwEUy+/Ato1jOghuncZ1s9XZX4+HORlDpVLHlJ6U1GN1gJkPHxJNs
 /0sOGkhA8WO4fhN66q4/shOiHfiYV+XRCveDOGV9pvOrfhkgjI2SB8YpCzddCnenzlDGyDVxwuaIe
 Ugwv2gCRF1ZwXIJV0Y2v28DYKkCX0Ru06Wxl03tKlIY9N20wYfUBhUPaM6XSlSUu8rEkB4wtZtoYn
 ISUh1+uQ==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tJYCz-00HQHu-Du; Fri, 06 Dec 2024 14:17:26 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 1/4] drm/vc4: Use `drm_gem_lock_reservations()` instead of
 hard-coding
Date: Fri,  6 Dec 2024 10:12:34 -0300
Message-ID: <20241206131706.203324-2-mcanal@igalia.com>
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

Instead of creating internal copies of `drm_gem_lock_reservations()`
and `drm_gem_unlock_reservations()`, use the functions provided by DRM
GEM.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 66 ++++-------------------------------
 1 file changed, 6 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 22bccd69eb62..2e5477b1c73a 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -578,19 +578,6 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 	}
 }
 
-static void
-vc4_unlock_bo_reservations(struct drm_device *dev,
-			   struct vc4_exec_info *exec,
-			   struct ww_acquire_ctx *acquire_ctx)
-{
-	int i;
-
-	for (i = 0; i < exec->bo_count; i++)
-		dma_resv_unlock(exec->bo[i]->resv);
-
-	ww_acquire_fini(acquire_ctx);
-}
-
 /* Takes the reservation lock on all the BOs being referenced, so that
  * at queue submit time we can update the reservations.
  *
@@ -603,54 +590,12 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 			 struct vc4_exec_info *exec,
 			 struct ww_acquire_ctx *acquire_ctx)
 {
-	int contended_lock = -1;
 	int i, ret;
 	struct drm_gem_object *bo;
 
-	ww_acquire_init(acquire_ctx, &reservation_ww_class);
-
-retry:
-	if (contended_lock != -1) {
-		bo = exec->bo[contended_lock];
-		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
-		if (ret) {
-			ww_acquire_done(acquire_ctx);
-			return ret;
-		}
-	}
-
-	for (i = 0; i < exec->bo_count; i++) {
-		if (i == contended_lock)
-			continue;
-
-		bo = exec->bo[i];
-
-		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
-		if (ret) {
-			int j;
-
-			for (j = 0; j < i; j++) {
-				bo = exec->bo[j];
-				dma_resv_unlock(bo->resv);
-			}
-
-			if (contended_lock != -1 && contended_lock >= i) {
-				bo = exec->bo[contended_lock];
-
-				dma_resv_unlock(bo->resv);
-			}
-
-			if (ret == -EDEADLK) {
-				contended_lock = i;
-				goto retry;
-			}
-
-			ww_acquire_done(acquire_ctx);
-			return ret;
-		}
-	}
-
-	ww_acquire_done(acquire_ctx);
+	ret = drm_gem_lock_reservations(exec->bo, exec->bo_count, acquire_ctx);
+	if (ret)
+		return ret;
 
 	/* Reserve space for our shared (read-only) fence references,
 	 * before we commit the CL to the hardware.
@@ -660,7 +605,8 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 
 		ret = dma_resv_reserve_fences(bo->resv, 1);
 		if (ret) {
-			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
+			drm_gem_unlock_reservations(exec->bo, exec->bo_count,
+						    acquire_ctx);
 			return ret;
 		}
 	}
@@ -708,7 +654,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
 
 	vc4_update_bo_seqnos(exec, seqno);
 
-	vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
+	drm_gem_unlock_reservations(exec->bo, exec->bo_count, acquire_ctx);
 
 	list_add_tail(&exec->head, &vc4->bin_job_list);
 
-- 
2.47.1

