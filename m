Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B590AC94F42
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 13:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489E10E25F;
	Sun, 30 Nov 2025 12:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cQHYlhUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3BE10E25F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 12:11:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B78B60123;
 Sun, 30 Nov 2025 12:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D672C116B1;
 Sun, 30 Nov 2025 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764504694;
 bh=yLaqFlUKoQskuobeKv9GVi2XN6Vgl1CVxymwQDo9LrA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cQHYlhUE6D6YvZ1/3gQ7w8K3J1dQCDakzmnkQ2OVtG6k0CMcpSh688tH8qhhl5iLm
 xBSBOk7w4OgBC8y/4IBK6pNo4Q3vUFIfEehMFzc/y1EYex9KX8S2DI7jmmFvTqmHxG
 Xn6OaU+DG7azSt2abXZr+MbRPV2M55gIj0YoZzf9G/YO2qcQ04szxUssoRZcS3m9pV
 9wn8e2gSSM5RpEV2rPw1ovgxreHXOmUoGLy6ucYjXu1iOQ2YR/XXVVa3YW3oStl2rq
 lHOZf2YihU+HNTzVJo0xoTxYCDMw09bwkSS163klcLrUUAPsspF42PSaIr3mgXcjB9
 7aSeGejRT0znQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 30 Nov 2025 13:11:17 +0100
Subject: [PATCH v5 1/3] drm/atomic-helper: Export and namespace some functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-mcde-drm-regression-thirdfix-v5-1-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Export and namespace those not prefixed with drm_* so
it becomes possible to write custom commit tail functions
in individual drivers using the helper infrastructure.

Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 122 +++++++++++++++++++++++++++++-------
 include/drm/drm_atomic_helper.h     |  22 +++++++
 2 files changed, 121 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..bfbe3a0ee178 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1162,8 +1162,18 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	       new_state->self_refresh_active;
 }
 
-static void
-encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_encoder_bridge_disable - disable bridges and encoder
+ * @dev: DRM device
+ * @state: the driver state object
+ *
+ * Loops over all connectors in the current state and if the CRTC needs
+ * it, disables the bridge chain all the way, then disables the encoder
+ * afterwards.
+ */
+void
+drm_atomic_helper_commit_encoder_bridge_disable(struct drm_device *dev,
+						struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1229,9 +1239,18 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_encoder_bridge_disable);
 
-static void
-crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_crtc_disable - disable CRTSs
+ * @dev: DRM device
+ * @state: the driver state object
+ *
+ * Loops over all CRTCs in the current state and if the CRTC needs
+ * it, disables it.
+ */
+void
+drm_atomic_helper_commit_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
@@ -1282,9 +1301,18 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 			drm_crtc_vblank_put(crtc);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_crtc_disable);
 
-static void
-encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_encoder_bridge_post_disable - post-disable encoder bridges
+ * @dev: DRM device
+ * @state: the driver state object
+ *
+ * Loops over all connectors in the current state and if the CRTC needs
+ * it, post-disables all encoder bridges.
+ */
+void
+drm_atomic_helper_commit_encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1335,15 +1363,16 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_encoder_bridge_post_disable);
 
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
-	encoder_bridge_disable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_disable(dev, state);
 
-	crtc_disable(dev, state);
+	drm_atomic_helper_commit_crtc_disable(dev, state);
 
-	encoder_bridge_post_disable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_post_disable(dev, state);
 }
 
 /**
@@ -1446,8 +1475,17 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
 }
 EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
 
-static void
-crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_crtc_set_mode - set the new mode
+ * @dev: DRM device
+ * @state: the driver state object
+ *
+ * Loops over all connectors in the current state and if the mode has
+ * changed, change the mode of the CRTC, then call down the bridge
+ * chain and change the mode in all bridges as well.
+ */
+void
+drm_atomic_helper_commit_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
@@ -1508,6 +1546,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_crtc_set_mode);
 
 /**
  * drm_atomic_helper_commit_modeset_disables - modeset commit to disable outputs
@@ -1531,12 +1570,21 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
 
-	crtc_set_mode(dev, state);
+	drm_atomic_helper_commit_crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
-static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
-						struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_writebacks - issue writebacks
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This loops over the connectors, checks if the new state requires
+ * a writeback job to be issued and in that case issues an atomic
+ * commit on each connector.
+ */
+void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
+					 struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1555,9 +1603,18 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 		}
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_writebacks);
 
-static void
-encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_encoder_bridge_pre_enable - pre-enable bridges
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This loops over the connectors and if the CRTC needs it, pre-enables
+ * the entire bridge chain.
+ */
+void
+drm_atomic_helper_commit_encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1588,9 +1645,18 @@ encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_encoder_bridge_pre_enable);
 
-static void
-crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_crtc_enable - enables the CRTCs
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This loops over CRTCs in the new state, and of the CRTC needs
+ * it, enables it.
+ */
+void
+drm_atomic_helper_commit_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
@@ -1619,9 +1685,18 @@ crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_crtc_enable);
 
-static void
-encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
+/**
+ * drm_atomic_helper_commit_encoder_bridge_enable - enables the bridges
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This loops over all connectors in the new state, and of the CRTC needs
+ * it, enables the entire bridge chain.
+ */
+void
+drm_atomic_helper_commit_encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1664,6 +1739,7 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_encoder_bridge_enable);
 
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
@@ -1682,11 +1758,11 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					      struct drm_atomic_state *state)
 {
-	encoder_bridge_pre_enable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_pre_enable(dev, state);
 
-	crtc_enable(dev, state);
+	drm_atomic_helper_commit_crtc_enable(dev, state);
 
-	encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..9afc2e1e24c7 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -60,6 +60,12 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 int drm_atomic_helper_check_planes(struct drm_device *dev,
 			       struct drm_atomic_state *state);
 int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state);
+void drm_atomic_helper_commit_encoder_bridge_disable(struct drm_device *dev,
+				struct drm_atomic_state *state);
+void drm_atomic_helper_commit_crtc_disable(struct drm_device *dev,
+				struct drm_atomic_state *state);
+void drm_atomic_helper_commit_encoder_bridge_post_disable(struct drm_device *dev,
+				struct drm_atomic_state *state);
 int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
@@ -89,8 +95,24 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 void
 drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *state);
 
+void drm_atomic_helper_commit_crtc_set_mode(struct drm_device *dev,
+					    struct drm_atomic_state *state);
+
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
+
+void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
+					 struct drm_atomic_state *state);
+
+void drm_atomic_helper_commit_encoder_bridge_pre_enable(struct drm_device *dev,
+					struct drm_atomic_state *state);
+
+void drm_atomic_helper_commit_crtc_enable(struct drm_device *dev,
+					  struct drm_atomic_state *state);
+
+void drm_atomic_helper_commit_encoder_bridge_enable(struct drm_device *dev,
+						    struct drm_atomic_state *state);
+
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
 

-- 
2.51.1

