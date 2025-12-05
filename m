Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D4CA700B
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1D510EA96;
	Fri,  5 Dec 2025 09:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t+Pobx3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EF410EA96
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:52:32 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 019281698;
 Fri,  5 Dec 2025 10:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764928213;
 bh=H3iYoV2u9r8Jk4Es7Q8H1ijV4oQjUUL3oWEdE+IWF8Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=t+Pobx3kWZWMt/3iPVjse+cvhwXCnHnZpzWU+hyTGXOBYs8yPG53Z1DqYRIWUPCNM
 FrcTw6jPw3mKIhhgP36dIh/aOirHRPV51KTDhk68K+Z/a3YxsFIQ4PCcqb0TXk4SpB
 8ZfnaRqMLFqTFV6mOAEGRvCHpz4lNrHt3bDFHoO4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 05 Dec 2025 11:51:50 +0200
Subject: [PATCH 3/4] drm/atomic-helper: Export and namespace some functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-drm-seq-fix-v1-3-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10930;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=F5H0/6LPFd3VrdUCkl9TQQyakRyv9LISoY+KgS2MwLA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpMqtWaJNXojh3c+Ewaz+pFtky4IV5bYpYBocWO
 kPXpLijOauJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaTKrVgAKCRD6PaqMvJYe
 9Y60EACrZv4FojLk5Y7t5enoqig0Hgz/HdhYosA2II+6nNilUBS9lP/OAg9+qOVdNVudJwPVqeX
 CwjSNT4YSflCDKkfJ2/IYwdjTV1m/qGmWZlznMS8VLeSKJLfLYqeZySRBcRGwRWmVRCErieMUkg
 nxtHmxbyo1/qfbB6JUkJRytwf144bK12v/X7FHAjnpwVcVfKB1CNgrpctfH05741rkl0oUlHwIy
 zAse1ZQPK8N3WQHBGw+06kYNhzR+2FdB2/AwTrarPoI8x6dDc9ImyBthsszprfFwIgVZ0ewXXd7
 t+3q8fM2Cs/QDNBdpSRkGWHr7yEqNcVTt77OqTj1Pam/TzsbyqtshD7c5djEqaDzBr96bApBP/R
 9rFUd6E/01vq4gqHcYuc1Qzzk1kup3t4ZgkJuhjlL9FVqDwU9yARCjBFn6FN6BaZ4gBFcOtS54b
 cyeJVqz3UvPW9IsatN3AFxHf2cfW4B1PUPK0Xy73NVtILGgMrfzYV9yA2jZaLoSgn1tbTpLaybF
 FXGBUMtomHdEhOmqIXSvCaY8OsxmNIRpoSu0311OqjjwLe3UIMlbqa90rxRf6jAJWXQuTd4P/8x
 4Q5hCpvIfhTtuUMm5u/Gb5THP4g8aP2LYSZf3p4DFQf166yrmybKXzdBQI8Yzdia2e5ZvjFJoP8
 yxbsgfLSjtP3mjw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Linus Walleij <linusw@kernel.org>

Export and namespace those not prefixed with drm_* so
it becomes possible to write custom commit tail functions
in individual drivers using the helper infrastructure.

Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Linus Walleij <linusw@kernel.org>
[Tomi: Resolved conflicts, fixed indentation]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org # v6.17+
---
 drivers/gpu/drm/drm_atomic_helper.c | 122 +++++++++++++++++++++++++++++-------
 include/drm/drm_atomic_helper.h     |  22 +++++++
 2 files changed, 121 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ef97f37560b2..5beea645035f 100644
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
 
-	encoder_bridge_post_disable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_post_disable(dev, state);
 
-	crtc_disable(dev, state);
+	drm_atomic_helper_commit_crtc_disable(dev, state);
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
-	crtc_enable(dev, state);
+	drm_atomic_helper_commit_crtc_enable(dev, state);
 
-	encoder_bridge_pre_enable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_pre_enable(dev, state);
 
-	encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..e154ee4f0696 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -60,6 +60,12 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 int drm_atomic_helper_check_planes(struct drm_device *dev,
 			       struct drm_atomic_state *state);
 int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state);
+void drm_atomic_helper_commit_encoder_bridge_disable(struct drm_device *dev,
+						     struct drm_atomic_state *state);
+void drm_atomic_helper_commit_crtc_disable(struct drm_device *dev,
+					   struct drm_atomic_state *state);
+void drm_atomic_helper_commit_encoder_bridge_post_disable(struct drm_device *dev,
+							  struct drm_atomic_state *state);
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
+							struct drm_atomic_state *state);
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
2.43.0

