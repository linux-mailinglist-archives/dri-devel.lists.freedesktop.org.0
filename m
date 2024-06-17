Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6490AC38
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 12:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448D10E227;
	Mon, 17 Jun 2024 10:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="f3Ii9NnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E08410E350
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:53:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HArQma082697;
 Mon, 17 Jun 2024 05:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718621606;
 bh=3Ak0cYY9/Ktqpij4a7CVob7W84NwWWlob/wDNvIKk/I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=f3Ii9NnDPeW+RBHd6Ubb4MckjdgRT4jMEB0lycvk61j9xln1Q2EoqwqUv5kyBxbzf
 KCT45Cj54NFTTssYDMQ06VlRbKvVNrDk0b421ueGRm7wFWUBQlQGOXvLXe+po/s84v
 3BynuIOiYk0uquWkgtBdW6iY5JJNjz6uCpuKGFlc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HArQJa039876
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 Jun 2024 05:53:26 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 05:53:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 05:53:26 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HArP8t106207;
 Mon, 17 Jun 2024 05:53:26 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Dominik Haller <d.haller@phytec.de>, Sam
 Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra
 <j-luthra@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v3 09/10] drm/atomic-helper: Re-order bridge chain pre-enable
 and post-disable
Date: Mon, 17 Jun 2024 16:23:10 +0530
Message-ID: <20240617105311.1587489-10-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617105311.1587489-1-a-bhatia1@ti.com>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
	bridge[n]__enable

and vice-versa for the bridge chain disable sequence.

The definition of bridge pre_enable hook says that,
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Since CRTC is also a source feeding the bridge, it should not be enabled
before the bridges in the pipeline are pre_enabled. Fix that by
re-ordering the sequence of bridge pre_enable and bridge post_disable.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 165 ++++++++++++++++++----------
 include/drm/drm_atomic_helper.h     |   7 ++
 2 files changed, 114 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index fb97b51b38f1..e8ad08634f58 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -74,6 +74,7 @@
  * also shares the &struct drm_plane_helper_funcs function table with the plane
  * helpers.
  */
+
 static void
 drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
 				struct drm_plane_state *old_plane_state,
@@ -1122,11 +1123,11 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+disable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_state *old_state,
+			    enum bridge_chain_operation_type op_type)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
-	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
@@ -1163,32 +1164,55 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
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
+		case DRM_ENCODER_BRIDGE_DISABLE:
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
+		case DRM_BRIDGE_POST_DISABLE:
+			drm_atomic_bridge_chain_post_disable(bridge, old_state);
 
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+			break;
+
+		default:
+			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
+			break;
+		}
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
+	disable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_DISABLE);
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
@@ -1234,6 +1258,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		if (ret == 0)
 			drm_crtc_vblank_put(crtc);
 	}
+
+	disable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_POST_DISABLE);
 }
 
 /**
@@ -1445,6 +1471,64 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
+static void
+enable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_state *old_state,
+			   enum bridge_chain_operation_type op_type)
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
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call enable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+
+		switch (op_type) {
+		case DRM_BRIDGE_PRE_ENABLE:
+			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+			break;
+
+		case DRM_ENCODER_BRIDGE_ENABLE:
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
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
  * @dev: DRM device
@@ -1465,10 +1549,10 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
 	int i;
 
+	enable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_PRE_ENABLE);
+
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
@@ -1491,42 +1575,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
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
+	enable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_ENABLE);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 9aa0a05aa072..b45a175a9f8a 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -43,6 +43,13 @@
  */
 #define DRM_PLANE_NO_SCALING (1<<16)
 
+enum bridge_chain_operation_type {
+	DRM_BRIDGE_PRE_ENABLE,
+	DRM_BRIDGE_POST_DISABLE,
+	DRM_ENCODER_BRIDGE_ENABLE,
+	DRM_ENCODER_BRIDGE_DISABLE,
+};
+
 struct drm_atomic_state;
 struct drm_private_obj;
 struct drm_private_state;
-- 
2.34.1

