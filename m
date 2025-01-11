Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB56A0A5A7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 20:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD8F10E2DE;
	Sat, 11 Jan 2025 19:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Olrlmk+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2979E10E2D9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 19:28:42 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736623719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r69bcEgf4AdnBQxjp1E80vclTFc1FX9Eq26gq83uybY=;
 b=Olrlmk+lJDXsnuq0ewIe7rZWW9Z+T86/BF0odIh7Q/RZS2WWOFib8J3Yu3Wqe1kT+OlPFz
 sa8lZZ6P1DLZFFHNwig1KjaGOzPNX/xc7dIhkxecwvYsPoB14kzRN35hvc34RWP7flFzgL
 LgyYza6bzLR3NTYMl1HYiu+j/2I1we8=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v6 11/12] drm/atomic-helper: Re-order bridge chain pre-enable
 and post-disable
Date: Sun, 12 Jan 2025 00:57:37 +0530
Message-Id: <20250111192738.308889-12-aradhya.bhatia@linux.dev>
In-Reply-To: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Move the bridge pre_enable call before crtc enable, and the bridge
post_disable call after the crtc disable.

The sequence of enable after this patch will look like:

	bridge[n]_pre_enable
	...
	bridge[1]_pre_enable

	crtc_enable
	encoder_enable

	bridge[1]_enable
	...
	bridge[n]_enable

And, the disable sequence for the display pipeline will look like:

	bridge[n]_disable
	...
	bridge[1]_disable

	encoder_disable
	crtc_disable

	bridge[1]_post_disable
	...
	bridge[n]_post_disable

The definition of bridge pre_enable hook says that,
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Since CRTC is also a source feeding the bridge, it should not be enabled
before the bridges in the pipeline are pre_enabled. Fix that by
re-ordering the sequence of bridge pre_enable and bridge post_disable.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 300 +++++++++++++++++-----------
 1 file changed, 181 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a50..ad6290a4a528 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -74,6 +74,12 @@
  * also shares the &struct drm_plane_helper_funcs function table with the plane
  * helpers.
  */
+
+enum bridge_chain_operation_type {
+	DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE,
+	DRM_BRIDGE_ENABLE_OR_DISABLE,
+};
+
 static void
 drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
 				struct drm_plane_state *old_plane_state,
@@ -1122,74 +1128,12 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+crtc_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
-	struct drm_connector *connector;
-	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
-	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
-		const struct drm_encoder_helper_funcs *funcs;
-		struct drm_encoder *encoder;
-		struct drm_bridge *bridge;
-
-		/*
-		 * Shut down everything that's in the changeset and currently
-		 * still on. So need to check the old, saved state.
-		 */
-		if (!old_conn_state->crtc)
-			continue;
-
-		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
-
-		if (new_conn_state->crtc)
-			new_crtc_state = drm_atomic_get_new_crtc_state(
-						old_state,
-						new_conn_state->crtc);
-		else
-			new_crtc_state = NULL;
-
-		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
-		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
-			continue;
-
-		encoder = old_conn_state->best_encoder;
-
-		/* We shouldn't get this far if we didn't previously have
-		 * an encoder.. but WARN_ON() rather than explode.
-		 */
-		if (WARN_ON(!encoder))
-			continue;
-
-		funcs = encoder->helper_private;
-
-		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
-			       encoder->base.id, encoder->name);
-
-		/*
-		 * Each encoder has at most one connector (since we always steal
-		 * it away), so we won't call disable hooks twice.
-		 */
-		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_disable(bridge, old_state);
-
-		/* Right function depends upon target state. */
-		if (funcs) {
-			if (funcs->atomic_disable)
-				funcs->atomic_disable(encoder, old_state);
-			else if (new_conn_state->crtc && funcs->prepare)
-				funcs->prepare(encoder);
-			else if (funcs->disable)
-				funcs->disable(encoder);
-			else if (funcs->dpms)
-				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
-		}
-
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
-	}
-
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 		int ret;
@@ -1206,7 +1150,6 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		drm_dbg_atomic(dev, "disabling [CRTC:%d:%s]\n",
 			       crtc->base.id, crtc->name);
 
-
 		/* Right function depends upon target state. */
 		if (new_crtc_state->enable && funcs->prepare)
 			funcs->prepare(crtc);
@@ -1236,6 +1179,97 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 	}
 }
 
+static void
+encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state,
+			     enum bridge_chain_operation_type op_type)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *old_conn_state, *new_conn_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
+
+	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+		const struct drm_encoder_helper_funcs *funcs;
+		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
+
+		/*
+		 * Shut down everything that's in the changeset and currently
+		 * still on. So need to check the old, saved state.
+		 */
+		if (!old_conn_state->crtc)
+			continue;
+
+		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
+
+		if (new_conn_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(
+						old_state,
+						new_conn_state->crtc);
+		else
+			new_crtc_state = NULL;
+
+		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
+		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
+			continue;
+
+		encoder = old_conn_state->best_encoder;
+
+		/* We shouldn't get this far if we didn't previously have
+		 * an encoder.. but WARN_ON() rather than explode.
+		 */
+		if (WARN_ON(!encoder))
+			continue;
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call disable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+
+		switch (op_type) {
+		case DRM_BRIDGE_ENABLE_OR_DISABLE:
+			funcs = encoder->helper_private;
+
+			drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
+				       encoder->base.id, encoder->name);
+
+			drm_atomic_bridge_chain_disable(bridge, old_state);
+
+			/* Right function depends upon target state. */
+			if (funcs) {
+				if (funcs->atomic_disable)
+					funcs->atomic_disable(encoder, old_state);
+				else if (new_conn_state->crtc && funcs->prepare)
+					funcs->prepare(encoder);
+				else if (funcs->disable)
+					funcs->disable(encoder);
+				else if (funcs->dpms)
+					funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
+			}
+
+			break;
+
+		case DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE:
+			drm_atomic_bridge_chain_post_disable(bridge, old_state);
+			break;
+
+		default:
+			drm_err(dev, "Unrecognized Encoder/Bridge operation (%d).\n", op_type);
+		}
+	}
+}
+
+static void
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_ENABLE_OR_DISABLE);
+
+	crtc_disable(dev, old_state);
+
+	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE);
+}
+
 /**
  * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
  * @dev: DRM device
@@ -1445,28 +1479,69 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
-/**
- * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
- * @dev: DRM device
- * @old_state: atomic state object with old state structures
- *
- * This function enables all the outputs with the new configuration which had to
- * be turned off for the update.
- *
- * For compatibility with legacy CRTC helpers this should be called after
- * drm_atomic_helper_commit_planes(), which is what the default commit function
- * does. But drivers with different needs can group the modeset commits together
- * and do the plane commits at the end. This is useful for drivers doing runtime
- * PM since planes updates then only happen when the CRTC is actually enabled.
- */
-void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
-					      struct drm_atomic_state *old_state)
+static void
+encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state,
+			    enum bridge_chain_operation_type op_type)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
+
+	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+		const struct drm_encoder_helper_funcs *funcs;
+		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
+
+		if (!new_conn_state->best_encoder)
+			continue;
+
+		if (!new_conn_state->crtc->state->active ||
+		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
+			continue;
+
+		encoder = new_conn_state->best_encoder;
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call enable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+
+		switch (op_type) {
+		case DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE:
+			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+			break;
+
+		case DRM_BRIDGE_ENABLE_OR_DISABLE:
+			funcs = encoder->helper_private;
+
+			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
+				       encoder->base.id, encoder->name);
+
+			if (funcs) {
+				if (funcs->atomic_enable)
+					funcs->atomic_enable(encoder, old_state);
+				else if (funcs->enable)
+					funcs->enable(encoder);
+				else if (funcs->commit)
+					funcs->commit(encoder);
+			}
+
+			drm_atomic_bridge_chain_enable(bridge, old_state);
+			break;
+
+		default:
+			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
+			break;
+		}
+	}
+}
+
+static void
+crtc_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
 	int i;
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1490,43 +1565,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 				funcs->commit(crtc);
 		}
 	}
-
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
-		const struct drm_encoder_helper_funcs *funcs;
-		struct drm_encoder *encoder;
-		struct drm_bridge *bridge;
-
-		if (!new_conn_state->best_encoder)
-			continue;
-
-		if (!new_conn_state->crtc->state->active ||
-		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
-			continue;
-
-		encoder = new_conn_state->best_encoder;
-		funcs = encoder->helper_private;
-
-		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
-			       encoder->base.id, encoder->name);
-
-		/*
-		 * Each encoder has at most one connector (since we always steal
-		 * it away), so we won't call enable hooks twice.
-		 */
-		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
-
-		if (funcs) {
-			if (funcs->atomic_enable)
-				funcs->atomic_enable(encoder, old_state);
-			else if (funcs->enable)
-				funcs->enable(encoder);
-			else if (funcs->commit)
-				funcs->commit(encoder);
-		}
-
-		drm_atomic_bridge_chain_enable(bridge, old_state);
-	}
+}
+
+/**
+ * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
+ * @dev: DRM device
+ * @old_state: atomic state object with old state structures
+ *
+ * This function enables all the outputs with the new configuration which had to
+ * be turned off for the update.
+ *
+ * For compatibility with legacy CRTC helpers this should be called after
+ * drm_atomic_helper_commit_planes(), which is what the default commit function
+ * does. But drivers with different needs can group the modeset commits together
+ * and do the plane commits at the end. This is useful for drivers doing runtime
+ * PM since planes updates then only happen when the CRTC is actually enabled.
+ */
+void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
+					      struct drm_atomic_state *old_state)
+{
+	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE);
+
+	crtc_enable(dev, old_state);
+
+	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_ENABLE_OR_DISABLE);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
 }
-- 
2.34.1

