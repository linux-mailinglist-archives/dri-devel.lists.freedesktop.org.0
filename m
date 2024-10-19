Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496E9A50AF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 22:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE3410E3BC;
	Sat, 19 Oct 2024 20:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="QIRbTUNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FA810E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 20:11:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729368370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1mTlRs3oQsDBG/+x5OdouM4LzMKdzAVm73oOqZh66M=;
 b=QIRbTUNXEbiYyMhFlq4KSABWEuB631lZe3wcIToxRwh/k3bzaBqbUA2fc1j9qgvDY916BV
 yqMBHBhemzCwWNvVIQFQSb+C40K9Pi7bEvX/NyBqnLKGHa8xkEpX8mRrUPoESu/ihEDT+6
 Yuwo34rUv55WC21+n4lRZuvTNscWzGE=
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
Subject: [PATCH v5 12/13] drm/atomic-helper: Re-order bridge chain pre-enable
 and post-disable
Date: Sun, 20 Oct 2024 01:35:29 +0530
Message-Id: <20241019200530.270738-5-aradhya.bhatia@linux.dev>
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

and vice-versa for the bridge chain disable sequence.

The definition of bridge pre_enable hook says that,
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Since CRTC is also a source feeding the bridge, it should not be enabled
before the bridges in the pipeline are pre_enabled. Fix that by
re-ordering the sequence of bridge pre_enable and bridge post_disable.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 102 ++++++++++++++++++----------
 include/drm/drm_atomic_helper.h     |   5 ++
 2 files changed, 71 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 7741fbcc8fc7..6ebd869df79b 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1122,7 +1122,8 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
+encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state,
+			     enum bridge_chain_operation_type op_type)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1162,31 +1163,43 @@ encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *ol
 		if (WARN_ON(!encoder))
 			continue;
 
-		funcs = encoder->helper_private;
-
-		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
-			       encoder->base.id, encoder->name);
-
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call disable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_disable(bridge, old_state);
 
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
+		switch (op_type) {
+		case DRM_BRIDGE_ENABLE_DISABLE:
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
 
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+			break;
+
+		case DRM_BRIDGE_PRE_ENABLE_POST_DISABLE:
+			drm_atomic_bridge_chain_post_disable(bridge, old_state);
+			break;
+
+		default:
+			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
+			break;
+		}
 	}
 }
 
@@ -1197,7 +1210,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
-	encoder_bridge_chain_disable(dev, old_state);
+	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_ENABLE_DISABLE);
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
@@ -1243,6 +1256,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		if (ret == 0)
 			drm_crtc_vblank_put(crtc);
 	}
+
+	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_POST_DISABLE);
 }
 
 /**
@@ -1455,7 +1470,8 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 }
 
 static void
-encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
+encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state,
+			    enum bridge_chain_operation_type op_type)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1474,28 +1490,40 @@ encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old
 			continue;
 
 		encoder = new_conn_state->best_encoder;
-		funcs = encoder->helper_private;
-
-		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
-			       encoder->base.id, encoder->name);
 
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call enable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
 
-		if (funcs) {
-			if (funcs->atomic_enable)
-				funcs->atomic_enable(encoder, old_state);
-			else if (funcs->enable)
-				funcs->enable(encoder);
-			else if (funcs->commit)
-				funcs->commit(encoder);
-		}
+		switch (op_type) {
+		case DRM_BRIDGE_PRE_ENABLE_POST_DISABLE:
+			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+			break;
+
+		case DRM_BRIDGE_ENABLE_DISABLE:
+			funcs = encoder->helper_private;
+
+			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
+				       encoder->base.id, encoder->name);
 
-		drm_atomic_bridge_chain_enable(bridge, old_state);
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
 	}
 }
 
@@ -1521,6 +1549,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 	struct drm_crtc_state *new_crtc_state;
 	int i;
 
+	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_POST_DISABLE);
+
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
@@ -1543,7 +1573,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		}
 	}
 
-	encoder_bridge_chain_enable(dev, old_state);
+	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_ENABLE_DISABLE);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 9aa0a05aa072..92a5812adc6c 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -43,6 +43,11 @@
  */
 #define DRM_PLANE_NO_SCALING (1<<16)
 
+enum bridge_chain_operation_type {
+	DRM_BRIDGE_PRE_ENABLE_POST_DISABLE,
+	DRM_BRIDGE_ENABLE_DISABLE,
+};
+
 struct drm_atomic_state;
 struct drm_private_obj;
 struct drm_private_state;
-- 
2.34.1

