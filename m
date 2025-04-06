Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEF5A7CE0E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 15:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5EC10E263;
	Sun,  6 Apr 2025 13:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="sjR5zR6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A4F10E023
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 13:16:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743945415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CEJ/sO7DltNlZUxnxCEA4NszRFr0//KBDDudIa4h8M=;
 b=sjR5zR6okZRx7GOZEVcu4YBsJOMaeuprpQyx9sgdtdI4uwmuzl5giYFuIfI8HF+Z9vvyo5
 qnEe/TKF4Vxo/avWmJARHTFw2l+3FFDFL5QZBypkpGhlWuybMJ80ftsBz+rDE8Ofq6aEmo
 Krx8LmU2Q7WudZwu9TsMRRlrzvX91vE=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v12 1/5] drm/atomic-helper: Refactor crtc & encoder-bridge op
 loops into separate functions
Date: Sun,  6 Apr 2025 18:46:38 +0530
Message-Id: <20250406131642.171240-2-aradhya.bhatia@linux.dev>
In-Reply-To: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
References: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The way any singular display pipeline, in need of a modeset, gets
enabled is as follows -

	crtc enable
	(all) bridge pre-enable
	encoder enable
	(all) bridge enable

- and the disable sequence is exactly the reverse of this.

The crtc operations occur by looping over the old and new crtc states,
while the encoder and bridge operations occur together, by looping over
the connector states of the display pipelines.

Refactor these operations - crtc enable/disable, and encoder & bridge
(pre/post) enable/disable - into separate functions each, to make way
for the re-ordering of the enable/disable sequences.

This patch doesn't alter the sequence of crtc/encoder/bridge operations
in any way, but helps to cleanly pave the way for the next two patches,
by maintaining logical bisectability.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 69 ++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ee64ca1b1bec..d185486071c5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1160,11 +1160,10 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
+encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
-	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
@@ -1227,6 +1226,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 
 		drm_atomic_bridge_chain_post_disable(bridge, state);
 	}
+}
+
+static void
+crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
@@ -1274,6 +1281,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 	}
 }
 
+static void
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	encoder_bridge_disable(dev, state);
+
+	crtc_disable(dev, state);
+}
+
 /**
  * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
  * @dev: DRM device
@@ -1483,28 +1498,12 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
-/**
- * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
- * @dev: DRM device
- * @state: atomic state object being committed
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
-					      struct drm_atomic_state *state)
+static void
+crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
 	int i;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1528,6 +1527,14 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 				funcs->commit(crtc);
 		}
 	}
+}
+
+static void
+encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
 
 	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
@@ -1565,6 +1572,28 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 
 		drm_atomic_bridge_chain_enable(bridge, state);
 	}
+}
+
+/**
+ * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
+ * @dev: DRM device
+ * @state: atomic state object being committed
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
+					      struct drm_atomic_state *state)
+{
+	crtc_enable(dev, state);
+
+	encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
 }
-- 
2.34.1

