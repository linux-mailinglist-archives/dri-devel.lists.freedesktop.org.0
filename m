Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03909A50AE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 22:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F4E10E3C0;
	Sat, 19 Oct 2024 20:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="J8X2qPhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9B310E3C2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 20:11:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729368363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/FQaXG0b2YwvUvBytmEDjYRTIaIDCFBgU8bD+QAH/4=;
 b=J8X2qPhCKbAfc4GMwbX5gyDuV0Eb/4WOlf759e9CamvXTksrLiEc4iMaHrKvNQY7vOSplt
 wSmsT6/Kcu2kNpiraMWUXjZLOjxIY4RhfgLaSWRYlCCiqSr+VQBIOxMvr5FaVk92jYgVZK
 QbLXSvVgCwYudKkgajqKRE/B/wJC0Zw=
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
Cc: Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v5 11/13] drm/atomic-helper: Separate out Encoder-Bridge
 enable and disable
Date: Sun, 20 Oct 2024 01:35:28 +0530
Message-Id: <20241019200530.270738-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20241019200530.270738-1-aradhya.bhatia@linux.dev>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
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

	CRTC Enable
	All Bridge Pre-Enable
	Encoder Enable
	All Bridge Enable

- and the disable path is exactly the reverse of this.

The CRTC enable/disable occurs by looping over the old and new CRTC
states, while the bridge pre-enable, encoder enable, and bridge enable
occur by looping through the new connector states of the display
pipelines.

At the moment, the encoder and bridge operations are grouped together
and occur under the same loops.

Separate out the enable/disable loops of the encoder and bridge
operations into a different function, to make way for the re-ordering of
the enable and disable sequence of all these display elements.

This patch doesn't alter in any way the ordering of CRTC/encoder/bridge
enable and disable, but merely helps to cleanly set up for the next
patch and to make sure that the bisectibility remains intact.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 97 +++++++++++++++++------------
 1 file changed, 57 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a50..7741fbcc8fc7 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1122,11 +1122,10 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
-	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
@@ -1189,6 +1188,16 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		drm_atomic_bridge_chain_post_disable(bridge, old_state);
 	}
+}
+
+static void
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
+
+	encoder_bridge_chain_disable(dev, old_state);
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
@@ -1445,6 +1454,51 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
+static void
+encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
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
+		funcs = encoder->helper_private;
+
+		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call enable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+
+		if (funcs) {
+			if (funcs->atomic_enable)
+				funcs->atomic_enable(encoder, old_state);
+			else if (funcs->enable)
+				funcs->enable(encoder);
+			else if (funcs->commit)
+				funcs->commit(encoder);
+		}
+
+		drm_atomic_bridge_chain_enable(bridge, old_state);
+	}
+}
+
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
  * @dev: DRM device
@@ -1465,8 +1519,6 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
 	int i;
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1491,42 +1543,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		}
 	}
 
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
+	encoder_bridge_chain_enable(dev, old_state);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
 }
-- 
2.34.1

