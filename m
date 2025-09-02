Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DDB3F88B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D2010E5EC;
	Tue,  2 Sep 2025 08:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k+u/c0ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D0010E5F1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4727343C33;
 Tue,  2 Sep 2025 08:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD536C4CEF8;
 Tue,  2 Sep 2025 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802035;
 bh=Uf200s2rpSOmJOf+Wvcc44k1xE0ek2fgZ011/JxQ/NQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=k+u/c0phwHPAlal5L2Z/qG8E80x7Xi/B8MMKisE3UFs6UWnLtCrVbH323ffp4VQx9
 QE4BtrTtBCoQZsaUCYWjQNpMmw+u9WDv+I3fxEz+r08nGHTomeb3t5ghd8mvbyrO6n
 CXKvEal8o5oVDHSBI7ToeIkUIccX3h9fSCr+Mn0qqFcuWZfRy1TCmsH38n1uieGqIJ
 qPcM2sKIbMWH4ZoHM4cLcUolmiQ7LXGW/WAlE3zFF2eKk5NA0r3UE3rbVuqr8brrFk
 RT8PD09uRX73TVMLDJaQp1RF6Dn5slHHU65h6gSi9wQgBqg2Kn4ilm5UzU6hcgwu3u
 ld9A7Aga+Mhtg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:45 +0200
Subject: [PATCH 17/29] drm/bridge_connector: Implement hw readout for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-17-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5532; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Uf200s2rpSOmJOf+Wvcc44k1xE0ek2fgZ011/JxQ/NQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu/RF+a3ymQR1Z+o8PUJs2t9Rqtx2It639e8s+5z9
 CZVMUh0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIkkWDPWJ++f8cR7uUbv5Q67
 Rz1iZ7iPfnpTv8f1QMkFuZtXlz54wes46eGF0xaK527VXTVJa9yXyNjQk3aBPVkr2DXrXeRJi5B
 1jA0JJYxeLTu4dM1OeC06ZTnbUVT+hfAe5xl3fyYZJHBp6gMA
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

drm_bridge_connector allows to create a generic connector from a list of
bridges.

However, it's a somewhat virtual connector, and relies on the bridges to
implement its various capabilities.

What we actually want though is for the last bridge implementing
hardware readout to fill the connector state from its own state.

Thus, let's implement a new op for bridge_connector to allow just that.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 36 +++++++++++++++++++++++---
 include/drm/drm_bridge.h                       | 21 +++++++++++++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 091c5335355a2b6c70dd823df69ce060fd56c4f9..0cf97cd0e554fd5f1101e4afb28f2a341bd774fb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -64,10 +64,18 @@ struct drm_bridge_connector {
 	 * @encoder:
 	 *
 	 * The encoder at the start of the bridges chain.
 	 */
 	struct drm_encoder *encoder;
+	/**
+	 * @bridge_connector_hw_readout:
+	 *
+	 * The last bridge in the chain (closest to the connector) that
+	 * provides hardware state readout support, if any (see
+	 * &DRM_BRIDGE_OP_CONNECTOR_HW_READOUT).
+	 */
+	struct drm_bridge *bridge_connector_hw_readout;
 	/**
 	 * @bridge_edid:
 	 *
 	 * The last bridge in the chain (closest to the connector) that provides
 	 * EDID read support, if any (see &DRM_BRIDGE_OP_EDID).
@@ -256,26 +264,46 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 		if (bridge->funcs->debugfs_init)
 			bridge->funcs->debugfs_init(bridge, root);
 	}
 }
 
-static void drm_bridge_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+drm_bridge_connector_readout_state(struct drm_connector *connector,
+				   struct drm_atomic_state *state)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_connector_state *conn_state;
+	struct drm_bridge *readout =
+		bridge_connector->bridge_connector_hw_readout;
+
+	if (connector->state)
+		connector->funcs->atomic_destroy_state(connector,
+						       connector->state);
+
+	conn_state = kzalloc(sizeof(*conn_state), GFP_KERNEL);
+	if (!conn_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_connector_state_reset(conn_state, connector);
 
-	drm_atomic_helper_connector_reset(connector);
 	if (bridge_connector->bridge_hdmi)
 		__drm_atomic_helper_connector_hdmi_reset(connector,
 							 connector->state);
+
+	if (readout)
+		readout->funcs->connector_hw_readout(readout, state, conn_state);
+
+	return conn_state;
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_readout_state = drm_bridge_connector_readout_state,
+	.atomic_compare_state = drm_atomic_helper_connector_compare_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
 	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
@@ -671,10 +699,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
 		if (!bridge->ycbcr_420_allowed)
 			connector->ycbcr_420_allowed = false;
 
+		if (bridge->ops & DRM_BRIDGE_OP_CONNECTOR_HW_READOUT)
+			bridge_connector->bridge_connector_hw_readout = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_EDID)
 			bridge_connector->bridge_edid = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_HPD)
 			bridge_connector->bridge_hpd = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 5ea63b51a4dd4cb00468afcf7d126c774f63ade0..7c401e905c023923f1f94daec746b56c3e478b83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1017,10 +1017,27 @@ struct drm_bridge_funcs {
 	 */
 	int (*dp_audio_mute_stream)(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
 				    bool enable, int direction);
 
+	/**
+	 * @connector_hw_readout:
+	 *
+	 * Initializes the &struct drm_connector_state based on hardware
+	 * state.
+	 *
+	 * This callback is optional, it can be implemented by bridges
+	 * that set the @DRM_BRIDGE_OP_CONNECTOR_HW_READOUT flag in
+	 * their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*connector_hw_readout)(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state,
+				    struct drm_connector_state *conn_state);
+
 	/**
 	 * @debugfs_init:
 	 *
 	 * Allows bridges to create bridge-specific debugfs files.
 	 */
@@ -1138,10 +1155,14 @@ enum drm_bridge_ops {
 	/**
 	 * @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER: The bridge requires CEC adapter
 	 * to be present.
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_ADAPTER = BIT(8),
+	/**
+	 * @DRM_BRIDGE_OP_CONNECTOR_HW_READOUT: TODO
+	 */
+	DRM_BRIDGE_OP_CONNECTOR_HW_READOUT = BIT(9),
 };
 
 /**
  * struct drm_bridge - central DRM bridge control structure
  */

-- 
2.50.1

