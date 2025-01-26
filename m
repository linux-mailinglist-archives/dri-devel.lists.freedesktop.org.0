Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A8A1CE17
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 20:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DB010E48A;
	Sun, 26 Jan 2025 19:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BFDvh0VJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E1D10E48C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 19:17:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1737919055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AO3I0o9SQ48v+FKatpnD2UF3iwgK82gjzwcQcZZju4=;
 b=BFDvh0VJ9Zcpqk0vlNKNFiLKIIjKsDGIoFWjXoAiIfIjR3DI3NFSVvS3z0PVq4OTbZ6r5F
 kOkClpJ0mB2dht/mBZ+WYmBHIBeaSLNCfdN3K79lsgyCW0JtfxC9LPHNaxxGifO6jESrBt
 aBxtYMruJxdcHiHGY6f9O/TmLfEq6RA=
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
Subject: [PATCH v8 11/13] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
Date: Mon, 27 Jan 2025 00:45:49 +0530
Message-Id: <20250126191551.741957-12-aradhya.bhatia@linux.dev>
In-Reply-To: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
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

The encoder-bridge ops occur by looping over the new connector states of
the display pipelines. The enable sequence runs as follows -

	- pre_enable(bridge),
	- enable(encoder),
	- enable(bridge),

while the disable sequnce runs as follows -

	- disable(bridge),
	- disable(encoder),
	- post_disable(bridge).

Separate out the pre_enable(bridge), and the post_disable(bridge)
operations into separate functions each.

This patch keeps the sequence same for any singular disaplay pipe, but
changes the sequence across multiple display pipelines.

This patch is meant to be an interim patch, to cleanly pave the way for
the sequence re-ordering patch, and maintain bisectability in the
process.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 92 +++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e805fd0a54c5..f5532e3646e1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1185,8 +1185,6 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *old_stat
 			else if (funcs->dpms)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
-
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
 	}
 }
 
@@ -1243,11 +1241,65 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
 	}
 }
 
+static void
+encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *old_conn_state, *new_conn_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
+
+	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
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
+		drm_dbg_atomic(dev, "post-disabling bridges [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call disable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+	}
+}
+
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	encoder_bridge_disable(dev, old_state);
 
+	encoder_bridge_post_disable(dev, old_state);
+
 	crtc_disable(dev, old_state);
 }
 
@@ -1460,6 +1512,38 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
+static void
+encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
+
+	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
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
+
+		drm_dbg_atomic(dev, "pre-enabling bridges [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call enable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+	}
+}
+
 static void
 crtc_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
@@ -1531,8 +1615,6 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *old_state
 			else if (funcs->commit)
 				funcs->commit(encoder);
 		}
-
-		drm_atomic_bridge_chain_enable(bridge, old_state);
 	}
 }
 
@@ -1555,6 +1637,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 {
 	crtc_enable(dev, old_state);
 
+	encoder_bridge_pre_enable(dev, old_state);
+
 	encoder_bridge_enable(dev, old_state);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
-- 
2.34.1

