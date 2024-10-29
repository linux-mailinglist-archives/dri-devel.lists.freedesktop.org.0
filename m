Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7769B5767
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 00:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039410E3DD;
	Tue, 29 Oct 2024 23:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="s58++sij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F00510E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=q6KYr6GX03M+Jc/IuwI+wp3bmGaFy8No8qY4nPfb1c0=; b=s58++sijcLeKwTXm
 wGEjJosh4SJ8wnHzmGTYDQQ4jU7F1hi45+enQfHBCmxdWlPrMHckbKGKA+EFGCy/ryNl/iFCRXFVp
 C9GSvq8lT2imZ63nzKNNZPiY3zb61zoBOuDCY8v8VPLxrOSGMlXN524qzu3DdVgRNjzag1U5xbKjD
 Wo1xsgj0aj4vGgPSssLKViHGyXsiAXzFdyDdUpV77pWiA6SbHigrNhEdU15E9DNPMev9aaNCmFCOy
 +uizTpbNfIC3kyDomfrKF/8xrbE14vORDWr2lMZ6GEa40Q0hO62EAlVNnCpJWe4izZ3ljo3kQSBHt
 T5E2nKY83xuBoqJJjA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t5vvX-00EMNX-2z;
 Tue, 29 Oct 2024 23:47:07 +0000
From: linux@treblig.org
To: dmitry.baryshkov@linaro.org, ville.syrjala@linux.intel.com,
 jfalempe@redhat.com, tomi.valkeinen@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 1/3] drm: Remove unused
 drm_atomic_helper_commit_planes_on_crtc
Date: Tue, 29 Oct 2024 23:47:03 +0000
Message-ID: <20241029234706.285087-2-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029234706.285087-1-linux@treblig.org>
References: <20241029234706.285087-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of drm_atomic_helper_commit_planes_on_crtc() was removed
in 2018 by
commit 6c246b81f938 ("drm/i915: Replace call to commit_planes_on_crtc with
internal update, v2.")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 72 -----------------------------
 include/drm/drm_atomic_helper.h     |  1 -
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 43cdf39019a4..dd8f7d6f5a36 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2705,8 +2705,6 @@ static bool plane_crtc_active(const struct drm_plane_state *state)
  * crtcs need to be updated though.
  *
  * Note that this function does all plane updates across all CRTCs in one step.
- * If the hardware can't support this approach look at
- * drm_atomic_helper_commit_planes_on_crtc() instead.
  *
  * Plane parameters can be updated by applications while the associated CRTC is
  * disabled. The DRM/KMS core will store the parameters in the plane state,
@@ -2833,76 +2831,6 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
 
-/**
- * drm_atomic_helper_commit_planes_on_crtc - commit plane state for a CRTC
- * @old_crtc_state: atomic state object with the old CRTC state
- *
- * This function commits the new plane state using the plane and atomic helper
- * functions for planes on the specific CRTC. It assumes that the atomic state
- * has already been pushed into the relevant object state pointers, since this
- * step can no longer fail.
- *
- * This function is useful when plane updates should be done CRTC-by-CRTC
- * instead of one global step like drm_atomic_helper_commit_planes() does.
- *
- * This function can only be savely used when planes are not allowed to move
- * between different CRTCs because this function doesn't handle inter-CRTC
- * dependencies. Callers need to ensure that either no such dependencies exist,
- * resolve them through ordering of commit calls or through some other means.
- */
-void
-drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
-{
-	const struct drm_crtc_helper_funcs *crtc_funcs;
-	struct drm_crtc *crtc = old_crtc_state->crtc;
-	struct drm_atomic_state *old_state = old_crtc_state->state;
-	struct drm_crtc_state *new_crtc_state =
-		drm_atomic_get_new_crtc_state(old_state, crtc);
-	struct drm_plane *plane;
-	unsigned int plane_mask;
-
-	plane_mask = old_crtc_state->plane_mask;
-	plane_mask |= new_crtc_state->plane_mask;
-
-	crtc_funcs = crtc->helper_private;
-	if (crtc_funcs && crtc_funcs->atomic_begin)
-		crtc_funcs->atomic_begin(crtc, old_state);
-
-	drm_for_each_plane_mask(plane, crtc->dev, plane_mask) {
-		struct drm_plane_state *old_plane_state =
-			drm_atomic_get_old_plane_state(old_state, plane);
-		struct drm_plane_state *new_plane_state =
-			drm_atomic_get_new_plane_state(old_state, plane);
-		const struct drm_plane_helper_funcs *plane_funcs;
-		bool disabling;
-
-		plane_funcs = plane->helper_private;
-
-		if (!old_plane_state || !plane_funcs)
-			continue;
-
-		WARN_ON(new_plane_state->crtc &&
-			new_plane_state->crtc != crtc);
-
-		disabling = drm_atomic_plane_disabling(old_plane_state, new_plane_state);
-
-		if (disabling && plane_funcs->atomic_disable) {
-			plane_funcs->atomic_disable(plane, old_state);
-		} else if (new_plane_state->crtc || disabling) {
-			plane_funcs->atomic_update(plane, old_state);
-
-			if (!disabling && plane_funcs->atomic_enable) {
-				if (drm_atomic_plane_enabling(old_plane_state, new_plane_state))
-					plane_funcs->atomic_enable(plane, old_state);
-			}
-		}
-	}
-
-	if (crtc_funcs && crtc_funcs->atomic_flush)
-		crtc_funcs->atomic_flush(crtc, old_state);
-}
-EXPORT_SYMBOL(drm_atomic_helper_commit_planes_on_crtc);
-
 /**
  * drm_atomic_helper_disable_planes_on_crtc - helper to disable CRTC's planes
  * @old_crtc_state: atomic state object with the old CRTC state
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 9aa0a05aa072..6ad50c531fc0 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -107,7 +107,6 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 				     uint32_t flags);
 void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
 				      struct drm_atomic_state *old_state);
-void drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state);
 void
 drm_atomic_helper_disable_planes_on_crtc(struct drm_crtc_state *old_crtc_state,
 					 bool atomic);
-- 
2.47.0

