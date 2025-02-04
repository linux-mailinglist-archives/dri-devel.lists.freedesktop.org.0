Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA9A27515
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF9410E681;
	Tue,  4 Feb 2025 14:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nX+1MVXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FB210E680
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E290EA41AE0;
 Tue,  4 Feb 2025 14:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E16CC4CEDF;
 Tue,  4 Feb 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681173;
 bh=tFfKlGt5RgPkNRrTsf4WzrnPOiwCyYjT9iW7xh93qcc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nX+1MVXm+faCKMAvWUz3Tvqu8fcmR/WZUwfCfQT42XCPwcpFVPL84HHcS1VRCHeeC
 V3yfpOPzK4XkloJ7nB/L+Wzj4n+pKCJZQzGYfr8ZGOYibZfLU5XJAQyxuUgYO+HOCV
 pQQQ8Zf5Cqf3ivAcNiaJcozHGc+AvNn4iJVvhsyn06DPG2s+CL7R07Y+VqIBFlkhWr
 3pEkkqGSq305J7d86NM5ZJc/QBOUVpeKY83Rz3gbB4retR7NCmtNzCZkOu6uQ4fmdD
 A2xl5nKRRY9vUAgojhkxicXv/eUy/MyME3w0DQ7AJy6b6VPW7KqpgRyXvGrh0rtF7i
 CvwOeiIZa8AGQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:45 +0100
Subject: [PATCH v2 17/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_modeset_enables()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-17-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tFfKlGt5RgPkNRrTsf4WzrnPOiwCyYjT9iW7xh93qcc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD788A//MGfdwzD7vd9Pv3nAo7Pc7W5sz/RDev/3y
 u8u9F+o0zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmklfE2LDV2NavuOh3L59i
 nHtwc+HzRz8mMtQEKbHMnrzjefiz3HOHn8psUm18yb+xyCswYqbFYsY6c7eSm5yX92yTyHP6rLq
 epdXwJ2e+ZkoBy+1rd96emre9jdvymkvcqTuLDl69ukV/ldclAA==
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

drm_atomic_helper_commit_modeset_enables() enables all outputs affected
by a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9f3cf5df0dd810e3725bf44a02a9574f676f17de..b95e30dee1b4e2ba8991affd1e280a7a36171afd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1474,11 +1474,11 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 }
 
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function enables all the outputs with the new configuration which had to
  * be turned off for the update.
  *
  * For compatibility with legacy CRTC helpers this should be called after
@@ -1486,20 +1486,20 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
  * does. But drivers with different needs can group the modeset commits together
  * and do the plane commits at the end. This is useful for drivers doing runtime
  * PM since planes updates then only happen when the CRTC is actually enabled.
  */
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		/* Need to filter out CRTCs where only planes change. */
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
@@ -1511,17 +1511,17 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 
 		if (new_crtc_state->enable) {
 			drm_dbg_atomic(dev, "enabling [CRTC:%d:%s]\n",
 				       crtc->base.id, crtc->name);
 			if (funcs->atomic_enable)
-				funcs->atomic_enable(crtc, old_state);
+				funcs->atomic_enable(crtc, state);
 			else if (funcs->commit)
 				funcs->commit(crtc);
 		}
 	}
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
 		if (!new_conn_state->best_encoder)
@@ -1540,25 +1540,25 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call enable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+		drm_atomic_bridge_chain_pre_enable(bridge, state);
 
 		if (funcs) {
 			if (funcs->atomic_enable)
-				funcs->atomic_enable(encoder, old_state);
+				funcs->atomic_enable(encoder, state);
 			else if (funcs->enable)
 				funcs->enable(encoder);
 			else if (funcs->commit)
 				funcs->commit(encoder);
 		}
 
-		drm_atomic_bridge_chain_enable(bridge, old_state);
+		drm_atomic_bridge_chain_enable(bridge, state);
 	}
 
-	drm_atomic_helper_commit_writebacks(dev, old_state);
+	drm_atomic_helper_commit_writebacks(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
 /*
  * For atomic updates which touch just a single CRTC, calculate the time of the

-- 
2.48.0

