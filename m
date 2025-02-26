Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C330A465C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 16:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CE510E2D3;
	Wed, 26 Feb 2025 15:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="YyUyRzRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8381810E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 15:58:07 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1740585485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jklZLBYCEE+OmwIoYtlSr3uMwHWkfh2W7zGiyaa7ZXM=;
 b=YyUyRzRZxNTtUr33mQuzi3Nvw7vHs1016V/hF2Uywzp+ZhQWyCvihu14+ahTbZxCUFCkp+
 X1rr5vKHuh/6mBqZm1CGe9O8+vCP8E0XNcFNPQ6dHBAh6tpUxcF6G+tDvyuh0fSZmvqSAb
 MpnEO18LxjIWQ0AkhFepqI4/WdZGESE=
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
Subject: [PATCH v10 11/13] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
Date: Wed, 26 Feb 2025 21:27:35 +0530
Message-Id: <20250226155737.565931-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20250226155737.565931-1-aradhya.bhatia@linux.dev>
References: <20250226155228.564289-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-1-aradhya.bhatia@linux.dev>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
Note on checkpatch warning:
This patch causes the checkpatch to flare up for 1 checkpatch 'check' -

CHECK: Lines should not end with a '('
#77: FILE: drivers/gpu/drm/drm_atomic_helper.c:1304:
+                       new_crtc_state = drm_atomic_get_new_crtc_state(

This patch is largely duplicating the original code, with minor differences to
perform different operations. This line of code pre-exists in the file and
have simply been duplicated. I have decided to keep it as is to maintain the
uniformity and the originally intended readability. Should perhaps a fix be
required, this patch/series is not the right place, and another patch can be
created to fix this across the whole file.

---
 drivers/gpu/drm/drm_atomic_helper.c | 91 ++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ce13c9b58bbd..d6a14e0c3e93 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1223,8 +1223,6 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 			else if (funcs->dpms)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
-
-		drm_atomic_bridge_chain_post_disable(bridge, state);
 	}
 }
 
@@ -1281,11 +1279,65 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 	}
 }
 
+static void
+encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *old_conn_state, *new_conn_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
+
+	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
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
+		old_crtc_state = drm_atomic_get_old_crtc_state(state, old_conn_state->crtc);
+
+		if (new_conn_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(
+						state,
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
+		drm_atomic_bridge_chain_post_disable(bridge, state);
+	}
+}
+
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	encoder_bridge_disable(dev, state);
 
+	encoder_bridge_post_disable(dev, state);
+
 	crtc_disable(dev, state);
 }
 
@@ -1498,6 +1550,38 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
+static void
+encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
+
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
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
+		drm_atomic_bridge_chain_pre_enable(bridge, state);
+	}
+}
+
 static void
 crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
@@ -1559,7 +1643,6 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		 * it away), so we won't call enable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_pre_enable(bridge, state);
 
 		if (funcs) {
 			if (funcs->atomic_enable)
@@ -1593,6 +1676,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 {
 	crtc_enable(dev, state);
 
+	encoder_bridge_pre_enable(dev, state);
+
 	encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
-- 
2.34.1

