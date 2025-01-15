Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37DA12D2C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8FB10E7EE;
	Wed, 15 Jan 2025 21:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NZQWVLg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4C110E7EC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F672A42534;
 Wed, 15 Jan 2025 21:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAB6C4CED1;
 Wed, 15 Jan 2025 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975172;
 bh=4FufsHC9m2G2exxSOBIj1GnRZlr7++zve5XtvmcgBsg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NZQWVLg4ejKsVeASyciS13xA10GQE/TyNQoD8sL5QESmxw9PVY9wHZoLGJmnIavAy
 qQ+nqpZs4jvqGdcCRnnVUfBs6IUbI3kXmeZ9VhVVQizG+wmxE0KH+Hz8xgPpQMyV6x
 994BFmv9QSGzZYEsXk9uey9aqm+61Atglj9rGvfkfXdx6J05WhvP4AzqLGWA3Frc2H
 JNb8AQMFaGI8WolSgzZpSlvmTEVFW3iT2m1Zo35X5U2nwEV4dPcMRrYiug8ZbfVPar
 /oQGP1GQvLNfwgcYSfcNvOdRA1wyLkz++CKxqkLjzfl98TGG58t/s2sTJPd9asZA1w
 m0OEj6if2eSIA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:18 +0100
Subject: [PATCH 11/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-11-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4891; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4FufsHC9m2G2exxSOBIj1GnRZlr7++zve5XtvmcgBsg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdylJlG+z+FTcrm3x9sokv7/pnzzf8/g9OZBiqywrOC
 tjsUP+pYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExklg1jrfRvVX6ds9ZzTss5
 2MdL/jxWciH7feLyu2v4l8jfjNe5qHuIV+HUj7O6Gpwptn3GH7cJMjY8CS0Krvlh0/a8t1M9y+9
 YYuhsgVLtxbzbJ9te8a0MddeeMveO7MTH7ss4Ok8mnfl1rx4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

drm_atomic_helper_commit_planes() updates all planes affected by a new
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 55c91f2821d550c8af52b71d8f452e0fdee997e4..9f3cf5df0dd810e3725bf44a02a9574f676f17de 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2719,19 +2719,19 @@ static bool plane_crtc_active(const struct drm_plane_state *state)
 }
 
 /**
  * drm_atomic_helper_commit_planes - commit plane state
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  * @flags: flags for committing plane state
  *
  * This function commits the new plane state using the plane and atomic helper
  * functions for planes and CRTCs. It assumes that the atomic state has already
  * been pushed into the relevant object state pointers, since this step can no
  * longer fail.
  *
- * It still requires the global state object @old_state to know which planes and
+ * It still requires the global state object @state to know which planes and
  * crtcs need to be updated though.
  *
  * Note that this function does all plane updates across all CRTCs in one step.
  * If the hardware can't support this approach look at
  * drm_atomic_helper_commit_planes_on_crtc() instead.
@@ -2758,36 +2758,36 @@ static bool plane_crtc_active(const struct drm_plane_state *state)
  * The drm_atomic_helper_commit() default implementation doesn't set the
  * ACTIVE_ONLY flag to most closely match the behaviour of the legacy helpers.
  * This should not be copied blindly by drivers.
  */
 void drm_atomic_helper_commit_planes(struct drm_device *dev,
-				     struct drm_atomic_state *old_state,
+				     struct drm_atomic_state *state,
 				     uint32_t flags)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	int i;
 	bool active_only = flags & DRM_PLANE_COMMIT_ACTIVE_ONLY;
 	bool no_disable = flags & DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		funcs = crtc->helper_private;
 
 		if (!funcs || !funcs->atomic_begin)
 			continue;
 
 		if (active_only && !new_crtc_state->active)
 			continue;
 
-		funcs->atomic_begin(crtc, old_state);
+		funcs->atomic_begin(crtc, state);
 	}
 
-	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
+	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs;
 		bool disabling;
 
 		funcs = plane->helper_private;
 
@@ -2821,40 +2821,40 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 
 			if (drm_atomic_crtc_needs_modeset(crtc_state) &&
 			    no_disable)
 				continue;
 
-			funcs->atomic_disable(plane, old_state);
+			funcs->atomic_disable(plane, state);
 		} else if (new_plane_state->crtc || disabling) {
-			funcs->atomic_update(plane, old_state);
+			funcs->atomic_update(plane, state);
 
 			if (!disabling && funcs->atomic_enable) {
 				if (drm_atomic_plane_enabling(old_plane_state, new_plane_state))
-					funcs->atomic_enable(plane, old_state);
+					funcs->atomic_enable(plane, state);
 			}
 		}
 	}
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		funcs = crtc->helper_private;
 
 		if (!funcs || !funcs->atomic_flush)
 			continue;
 
 		if (active_only && !new_crtc_state->active)
 			continue;
 
-		funcs->atomic_flush(crtc, old_state);
+		funcs->atomic_flush(crtc, state);
 	}
 
 	/*
 	 * Signal end of framebuffer access here before hw_done. After hw_done,
 	 * a later commit might have already released the plane state.
 	 */
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
 
 		if (funcs->end_fb_access)
 			funcs->end_fb_access(plane, old_plane_state);
 	}

-- 
2.47.1

