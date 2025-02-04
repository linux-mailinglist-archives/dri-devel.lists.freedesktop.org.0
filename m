Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922AA2750D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA74310E679;
	Tue,  4 Feb 2025 14:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i1bzbena";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B19610E678
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC1F85C6A75;
 Tue,  4 Feb 2025 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36BAC4CEDF;
 Tue,  4 Feb 2025 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681147;
 bh=uxBDuIzE3MeUz79jWnci/f2RLclYZxQteOTg5o3Y3QY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i1bzbenaLATFNJMaRMsc3i1WsBxXWMHJbZkZjb2NRRteqmd5aSZiba0AfZkIOMeRw
 1sSAhXTRrKrsjMYBcKn0vcrK3rRFHajLL6VSzWl/RjZiCYs4s97LRjiR+17z5YDeV5
 STiI2Gj42H0KBOPASNhX/sVoJZWgg2NXv7fHaBnUX1RBnspBwHYuzlh6KsybQDwEgM
 y1yP+C8odZjFLn3GG4WcUIwUnCYTUDu7arSpuPtYkTW5ruVIo+2xpIWGXkXY/yB0sL
 DklzAUS10YPx0DB1kQidTBh52L92ezVWUpAKvogeftAzI3ZnEWQt/xtV7ZgIcVKIPe
 c6WKlZKTImKPw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:39 +0100
Subject: [PATCH v2 11/35] drm/atomic-helper: Change parameter name of
 disable_outputs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-11-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uxBDuIzE3MeUz79jWnci/f2RLclYZxQteOTg5o3Y3QY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN6e+tx8/NX5Z2sWJJRGLlh7fEtew+W2l2zSTWdPt
 /UsuPfFpWMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMpEaJsYo5ecG15kKr856n
 QtfsPyZlGbJxU++blztm756g8HhJ2ZPvb/nnVwoEnFbiqrn6ZlvBsw+MDR+Ke5li3uaIpudyL5j
 UIGOmZ2y/Qb3ZSV/jQqcdl7fEz+SfVZfMppjs+VSc8zHF7r0eAA==
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

disable_outputs() disables all connectors and CRTCs affected by a
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called as old_state, which is pretty
confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5129de2278d5f62c136f8b6c831f903d9e53927..0d561b5c249a79a723e047f061d4103ef7742e87 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1148,19 +1148,19 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	       (old_state->self_refresh_active && !new_state->active) ||
 	       new_state->self_refresh_active;
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
-	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
 		/*
@@ -1168,15 +1168,15 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		 * still on. So need to check the old, saved state.
 		 */
 		if (!old_conn_state->crtc)
 			continue;
 
-		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
+		old_crtc_state = drm_atomic_get_old_crtc_state(state, old_conn_state->crtc);
 
 		if (new_conn_state->crtc)
 			new_crtc_state = drm_atomic_get_new_crtc_state(
-						old_state,
+						state,
 						new_conn_state->crtc);
 		else
 			new_crtc_state = NULL;
 
 		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
@@ -1199,28 +1199,28 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call disable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_disable(bridge, old_state);
+		drm_atomic_bridge_chain_disable(bridge, state);
 
 		/* Right function depends upon target state. */
 		if (funcs) {
 			if (funcs->atomic_disable)
-				funcs->atomic_disable(encoder, old_state);
+				funcs->atomic_disable(encoder, state);
 			else if (new_conn_state->crtc && funcs->prepare)
 				funcs->prepare(encoder);
 			else if (funcs->disable)
 				funcs->disable(encoder);
 			else if (funcs->dpms)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
 
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+		drm_atomic_bridge_chain_post_disable(bridge, state);
 	}
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 		int ret;
 
 		/* Shut down everything that needs a full modeset. */
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
@@ -1237,11 +1237,11 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		/* Right function depends upon target state. */
 		if (new_crtc_state->enable && funcs->prepare)
 			funcs->prepare(crtc);
 		else if (funcs->atomic_disable)
-			funcs->atomic_disable(crtc, old_state);
+			funcs->atomic_disable(crtc, state);
 		else if (funcs->disable)
 			funcs->disable(crtc);
 		else if (funcs->dpms)
 			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
 

-- 
2.48.0

