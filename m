Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C89BA451D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BC310EA82;
	Fri, 26 Sep 2025 14:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DdugRzsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EF810EA82
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:59:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0F9D1C00D96;
 Fri, 26 Sep 2025 14:59:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A824606B5;
 Fri, 26 Sep 2025 14:59:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BFC6102F193B; 
 Fri, 26 Sep 2025 16:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758898788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=8CsfXJ96vvuHTwghIJVgoKGQ8FN5YoZW9uDWIPZGU7k=;
 b=DdugRzsmwSQH5OwGjinoq83eM1eHQ9VWovuz2TUnWXmLW5eSne/GMliFBRr2I50JBor7h2
 PK+WrAxMPejNfXaVL28YjximFZGp0A6B5zmLebvBVQr6/6CMXF7vcf/5GbLRKTGrtqS/J0
 27ziEzHavPNG1ZqgOTFUdlHbWpBpsHB8DbiOqkYTI0YFIjgaRmEEPTGzJ5PcQ0pl6UGq6p
 s68QHWOU1mJE3z/gvc9wMQSZhpFu0jlz+UGxmX39qXGpbxpMrApmOgvI/bYT6I0PGOYYNg
 oIL45c/E2uL1giN7JA/tsePiTGnwVuEfjecBcnqPrVg6vKqvSlCiXaHQ3BdI7Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Sep 2025 16:59:40 +0200
Subject: [PATCH v2] drm/display: bridge_connector: get/put the stored bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFuq1mgC/52NQQ6DIBREr2JYlwZQtO2q92hc6OejP1EwQE0b4
 91LTXqBLt/MZN7GIgbCyG7FxgKuFMm7DOpUMBg7NyAnk5kpobS4Ks1NmHkfyOSmmyYPfMC0PNM
 vA+8cQvKBa13biwFZdbZi+W4JaOl1qB5t5pFinr0P8yq/6R+SVXLBrWjKGiU0JeK99z5N5M7gZ
 9bu+/4BGi+UgeIAAAA=
X-Change-ID: 20250925-drm-bridge-alloc-getput-bridge-connector-556f8dc14af4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

drm_bridge_connector_init() takes eight pointers to various bridges, some
of which can be identical, and stores them in pointers inside struct
drm_bridge_connector. Get a reference to each of the taken bridges and put
it on cleanup.

This is tricky because the pointers are currently stored directly in the
drm_bridge_connector in the loop, but there is no nice and clean way to put
those pointers on error return paths. To overcome this, store all pointers
in temporary local variables with a cleanup action, and only on success
copy them into struct drm_bridge_connector (getting another ref while
copying).

Additionally four of these pointers (edid, hpd, detect and modes) can be
written in multiple loop iterations, in order to eventually store the last
matching bridge. However, when one of those pointers is overwritten, we
need to put the reference that we got during the previous assignment. Add a
drm_bridge_put() before writing them to handle this.

Finally, there is also a function-local panel_bridge pointer taken inside
the loop and used after the loop. Use a cleanup action as well to ensure it
is put on return.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
This series ensures the bridge-connector gets a reference to bridges when
storing a pointer to them, and releases them afterwards.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. … add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
            (drm-misc-next)
       2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
       3. ✔ drm_bridge_get_next_bridge() (drm-misc-next)
       4. ✔ drm_for_each_bridge_in_chain() (drm-misc-next)
       5. ➜ drm_bridge_connector_init
       6. protect encoder bridge chain with a mutex
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. ➜ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list removed bridges (drm-misc-next)
 2. … handle gracefully atomic updates during bridge removal
 3. … DSI host-device driver interaction
 4. removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

This was tricky both because there is no central place in
drm_bridge_connector.c to put the references on disposal (handled by patch
1) and because of the complex code flow of drm_bridge_connector_init()
(handled by patch 2).
---
Changes in v2:
- Use drmm_add_action() instead of hacking the .destroy connector func
- Removed patch 1 (where the hacking the .destroy connector func was)
- Link to v1: https://lore.kernel.org/r/20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 114 +++++++++++++++++--------
 1 file changed, 78 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a5bdd6c1064399ece6b19560f145b877c9e0680e..7b18be3ff9a32b362468351835bdab43c3f524f1 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -618,6 +618,20 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
  * Bridge Connector Initialisation
  */
 
+static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
+{
+	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
+
+	drm_bridge_put(bridge_connector->bridge_edid);
+	drm_bridge_put(bridge_connector->bridge_hpd);
+	drm_bridge_put(bridge_connector->bridge_detect);
+	drm_bridge_put(bridge_connector->bridge_modes);
+	drm_bridge_put(bridge_connector->bridge_hdmi);
+	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
+	drm_bridge_put(bridge_connector->bridge_dp_audio);
+	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
+}
+
 /**
  * drm_bridge_connector_init - Initialise a connector for a chain of bridges
  * @drm: the DRM device
@@ -638,7 +652,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
-	struct drm_bridge *panel_bridge = NULL;
+	struct drm_bridge *panel_bridge      __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_edid       __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_hpd        __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_detect     __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_modes      __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_hdmi       __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_hdmi_audio __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_dp_audio   __free(drm_bridge_put) = NULL;
+	struct drm_bridge *bridge_hdmi_cec   __free(drm_bridge_put) = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
 	bool support_hdcp = false;
@@ -649,6 +671,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
+	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
+	if (ret)
+		return ERR_PTR(ret);
+
 	bridge_connector->encoder = encoder;
 
 	/*
@@ -672,22 +698,30 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!bridge->ycbcr_420_allowed)
 			connector->ycbcr_420_allowed = false;
 
-		if (bridge->ops & DRM_BRIDGE_OP_EDID)
-			bridge_connector->bridge_edid = bridge;
-		if (bridge->ops & DRM_BRIDGE_OP_HPD)
-			bridge_connector->bridge_hpd = bridge;
-		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
-			bridge_connector->bridge_detect = bridge;
-		if (bridge->ops & DRM_BRIDGE_OP_MODES)
-			bridge_connector->bridge_modes = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_EDID) {
+			drm_bridge_put(bridge_edid);
+			bridge_edid = drm_bridge_get(bridge);
+		}
+		if (bridge->ops & DRM_BRIDGE_OP_HPD) {
+			drm_bridge_put(bridge_hpd);
+			bridge_hpd = drm_bridge_get(bridge);
+		}
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT) {
+			drm_bridge_put(bridge_detect);
+			bridge_detect = drm_bridge_get(bridge);
+		}
+		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
+			drm_bridge_put(bridge_modes);
+			bridge_modes = drm_bridge_get(bridge);
+		}
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
-			if (bridge_connector->bridge_hdmi)
+			if (bridge_hdmi)
 				return ERR_PTR(-EBUSY);
 			if (!bridge->funcs->hdmi_write_infoframe ||
 			    !bridge->funcs->hdmi_clear_infoframe)
 				return ERR_PTR(-EINVAL);
 
-			bridge_connector->bridge_hdmi = bridge;
+			bridge_hdmi = drm_bridge_get(bridge);
 
 			if (bridge->supported_formats)
 				supported_formats = bridge->supported_formats;
@@ -696,10 +730,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
-			if (bridge_connector->bridge_hdmi_audio)
+			if (bridge_hdmi_audio)
 				return ERR_PTR(-EBUSY);
 
-			if (bridge_connector->bridge_dp_audio)
+			if (bridge_dp_audio)
 				return ERR_PTR(-EBUSY);
 
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
@@ -710,14 +744,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->funcs->hdmi_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 
-			bridge_connector->bridge_hdmi_audio = bridge;
+			bridge_hdmi_audio = drm_bridge_get(bridge);
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
-			if (bridge_connector->bridge_dp_audio)
+			if (bridge_dp_audio)
 				return ERR_PTR(-EBUSY);
 
-			if (bridge_connector->bridge_hdmi_audio)
+			if (bridge_hdmi_audio)
 				return ERR_PTR(-EBUSY);
 
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
@@ -728,7 +762,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->funcs->dp_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 
-			bridge_connector->bridge_dp_audio = bridge;
+			bridge_dp_audio = drm_bridge_get(bridge);
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
@@ -739,10 +773,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
-			if (bridge_connector->bridge_hdmi_cec)
+			if (bridge_hdmi_cec)
 				return ERR_PTR(-EBUSY);
 
-			bridge_connector->bridge_hdmi_cec = bridge;
+			bridge_hdmi_cec = drm_bridge_get(bridge);
 
 			if (!bridge->funcs->hdmi_cec_enable ||
 			    !bridge->funcs->hdmi_cec_log_addr ||
@@ -762,7 +796,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			ddc = bridge->ddc;
 
 		if (drm_bridge_is_panel(bridge))
-			panel_bridge = bridge;
+			panel_bridge = drm_bridge_get(bridge);
 
 		if (bridge->support_hdcp)
 			support_hdcp = true;
@@ -771,13 +805,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi) {
+	if (bridge_hdmi) {
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
 		ret = drmm_connector_hdmi_init(drm, connector,
-					       bridge_connector->bridge_hdmi->vendor,
-					       bridge_connector->bridge_hdmi->product,
+					       bridge_hdmi->vendor,
+					       bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
@@ -793,15 +827,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_connector->bridge_hdmi_audio ||
-	    bridge_connector->bridge_dp_audio) {
+	if (bridge_hdmi_audio || bridge_dp_audio) {
 		struct device *dev;
 		struct drm_bridge *bridge;
 
-		if (bridge_connector->bridge_hdmi_audio)
-			bridge = bridge_connector->bridge_hdmi_audio;
+		if (bridge_hdmi_audio)
+			bridge = bridge_hdmi_audio;
 		else
-			bridge = bridge_connector->bridge_dp_audio;
+			bridge = bridge_dp_audio;
 
 		dev = bridge->hdmi_audio_dev;
 
@@ -815,9 +848,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_connector->bridge_hdmi_cec &&
-	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
-		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
+	if (bridge_hdmi_cec &&
+	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+		struct drm_bridge *bridge = bridge_hdmi_cec;
 
 		ret = drmm_connector_hdmi_cec_notifier_register(connector,
 								NULL,
@@ -826,9 +859,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_connector->bridge_hdmi_cec &&
-	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
-		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
+	if (bridge_hdmi_cec &&
+	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+		struct drm_bridge *bridge = bridge_hdmi_cec;
 
 		ret = drmm_connector_hdmi_cec_register(connector,
 						       &drm_bridge_connector_hdmi_cec_funcs,
@@ -841,9 +874,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
-	if (bridge_connector->bridge_hpd)
+	if (bridge_hpd)
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
-	else if (bridge_connector->bridge_detect)
+	else if (bridge_detect)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
@@ -854,6 +887,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
 		drm_connector_attach_content_protection_property(connector, true);
 
+	bridge_connector->bridge_edid       = drm_bridge_get(bridge_edid);
+	bridge_connector->bridge_hpd        = drm_bridge_get(bridge_hpd);
+	bridge_connector->bridge_detect     = drm_bridge_get(bridge_detect);
+	bridge_connector->bridge_modes      = drm_bridge_get(bridge_modes);
+	bridge_connector->bridge_hdmi       = drm_bridge_get(bridge_hdmi);
+	bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge_hdmi_audio);
+	bridge_connector->bridge_dp_audio   = drm_bridge_get(bridge_dp_audio);
+	bridge_connector->bridge_hdmi_cec   = drm_bridge_get(bridge_hdmi_cec);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);

---
base-commit: 063db451832b8849faf1b0b8404b3a6a39995b29
change-id: 20250925-drm-bridge-alloc-getput-bridge-connector-556f8dc14af4

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

