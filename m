Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BFA12D2D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5808810E7EF;
	Wed, 15 Jan 2025 21:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YCAZyEub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66710E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC7265C5C06;
 Wed, 15 Jan 2025 21:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CE9C4CEE1;
 Wed, 15 Jan 2025 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975175;
 bh=2hnCkwftdq+vOkBj7qH7PV9IG+JRCfhlib275mgFgpA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YCAZyEubYjM70re2iYK1CWe3RV7IM9RSum00f+4fc0SsDAqoBAIANRc9GZDJY77zl
 On+x5cwDy5kngGHYEYWyAe/wo1ihwemv2dqlO/mGchr9rq95yoFtqN5pcHXx1Xyrxe
 Rki5itIZQsny8BULkelksE52VnwvDPjQF6KXBfu+cxOYB8Uw1F5A60W5XzC3n2K3fo
 JjF+H8tI4PtYw3H72yazEr6+nLKDCT3SuMRIaHZiYjL5pa0ntBCVd7+crJvAVnZE/4
 j/njeGUohKfq2G+o8IHCfEgn4vYqmCNhW0v+B5WB45gdxxNuTBsT1p3kOYJsUJwYcT
 RwDsO184H/zSQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:19 +0100
Subject: [PATCH 12/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_modeset_enables()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-12-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2hnCkwftdq+vOkBj7qH7PV9IG+JRCfhlib275mgFgpA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdylKnPl4T3LFo7a1T6z0WqaV+sEuM4D4gJPbhjGVZz
 VrfDVUiHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAir5oZ6z03B5qv053QdGY1
 g27DfjbpRYePhHanHN59TGhBUbvzqTazWXu4Y7LufH4g+sXtUezbFYz1/h0TDq3t2cNz0VWy4+v
 XE387XQNaOcM9XqjJNV9WfvPjcPj7yhcbDL79XG3G4DJ7vlMYAA==
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
2.47.1

