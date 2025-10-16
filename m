Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C1BE406E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88B110E309;
	Thu, 16 Oct 2025 14:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wcIChap/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB00B10E309
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:54:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C0DABC041C4;
 Thu, 16 Oct 2025 14:53:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E46246062C;
 Thu, 16 Oct 2025 14:54:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9C22102F22F7; 
 Thu, 16 Oct 2025 16:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760626443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=ip9FcPTQfQiKY0HvwfhSL02mh9mNCQbyAOIIr4J+lY0=;
 b=wcIChap/A8B3T2Iza8erbHq5ViSZ0XEF9dn+1KjryZSJxSPtURpqqiHiMmgdbPCqD39noO
 Uy26s+lCMraUFhhX3Yon+NcOaKsHV+OjyWVz6Ax6Nb7+laU452QQWIpflDaf4jLojDjBtc
 LUhHalcgobWqAjmgEpCeucmFMgQ/FXgaFSkUZLqi3ITBsce/spme3k0rZbT4RS7flPm5rD
 S54yUcqb0uaR4u/jG2Ht9bdc5df0ejrK0pTTtg4OUfADI8s4Swg4Qt+ji/EyfvVMQ40RoC
 4GFSNz3okmeLKF8ivIOIhkn5UG72xQx/CVwuFBXuOXcq8J/ncr/gEaCEuXfBFg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 16 Oct 2025 16:53:33 +0200
Subject: [PATCH] Revert "drm/display: bridge_connector: get/put the stored
 bridges"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOwG8WgC/zWN0QrCMAxFf2Xk2cBapjh/RWR0SdwCWzvSKsLYv
 1sEH889cO4OWUwlw63ZweStWVOs4E4N0BziJKhcGXzrz651F2RbcTTlasKyJMJJyvYq/41SjEI
 lGT71gzOvOpAQ9qHzPfPYXcVDbW8m1f9+74/j+AJGzV7shwAAAA==
X-Change-ID: 20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-9a429ddb48e2
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

This reverts commit 2be300f9a0b6f6b0ae2a90be97e558ec0535be54.

The commit being reverted moved all the bridge_connector->bridge_*
assignments to just before the final successful return in order to handle
the bridge refcounting in a clean way.

This introduced a bug, because a bit before the successful return
drmm_connector_hdmi_cec_register() is called, which calls funcs->init()
which is drm_bridge_connector_hdmi_cec_init() which needs
bridge_connector->bridge_hdmi_cec to be set.

The reported bug may be fixed in a relatively simple way, but other similar
patterns are potentially present, so just revert the offending commit. A
different approach will be implemented.

Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored bridges")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/r/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 114 ++++++++-----------------
 1 file changed, 36 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7b18be3ff9a32b362468351835bdab43c3f524f1..a5bdd6c1064399ece6b19560f145b877c9e0680e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -618,20 +618,6 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
  * Bridge Connector Initialisation
  */
 
-static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
-{
-	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
-
-	drm_bridge_put(bridge_connector->bridge_edid);
-	drm_bridge_put(bridge_connector->bridge_hpd);
-	drm_bridge_put(bridge_connector->bridge_detect);
-	drm_bridge_put(bridge_connector->bridge_modes);
-	drm_bridge_put(bridge_connector->bridge_hdmi);
-	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
-	drm_bridge_put(bridge_connector->bridge_dp_audio);
-	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
-}
-
 /**
  * drm_bridge_connector_init - Initialise a connector for a chain of bridges
  * @drm: the DRM device
@@ -652,15 +638,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
-	struct drm_bridge *panel_bridge      __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_edid       __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_hpd        __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_detect     __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_modes      __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_hdmi       __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_hdmi_audio __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_dp_audio   __free(drm_bridge_put) = NULL;
-	struct drm_bridge *bridge_hdmi_cec   __free(drm_bridge_put) = NULL;
+	struct drm_bridge *panel_bridge = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
 	bool support_hdcp = false;
@@ -671,10 +649,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
-	if (ret)
-		return ERR_PTR(ret);
-
 	bridge_connector->encoder = encoder;
 
 	/*
@@ -698,30 +672,22 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!bridge->ycbcr_420_allowed)
 			connector->ycbcr_420_allowed = false;
 
-		if (bridge->ops & DRM_BRIDGE_OP_EDID) {
-			drm_bridge_put(bridge_edid);
-			bridge_edid = drm_bridge_get(bridge);
-		}
-		if (bridge->ops & DRM_BRIDGE_OP_HPD) {
-			drm_bridge_put(bridge_hpd);
-			bridge_hpd = drm_bridge_get(bridge);
-		}
-		if (bridge->ops & DRM_BRIDGE_OP_DETECT) {
-			drm_bridge_put(bridge_detect);
-			bridge_detect = drm_bridge_get(bridge);
-		}
-		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
-			drm_bridge_put(bridge_modes);
-			bridge_modes = drm_bridge_get(bridge);
-		}
+		if (bridge->ops & DRM_BRIDGE_OP_EDID)
+			bridge_connector->bridge_edid = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_HPD)
+			bridge_connector->bridge_hpd = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			bridge_connector->bridge_detect = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_MODES)
+			bridge_connector->bridge_modes = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
-			if (bridge_hdmi)
+			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
 			if (!bridge->funcs->hdmi_write_infoframe ||
 			    !bridge->funcs->hdmi_clear_infoframe)
 				return ERR_PTR(-EINVAL);
 
-			bridge_hdmi = drm_bridge_get(bridge);
+			bridge_connector->bridge_hdmi = bridge;
 
 			if (bridge->supported_formats)
 				supported_formats = bridge->supported_formats;
@@ -730,10 +696,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
-			if (bridge_hdmi_audio)
+			if (bridge_connector->bridge_hdmi_audio)
 				return ERR_PTR(-EBUSY);
 
-			if (bridge_dp_audio)
+			if (bridge_connector->bridge_dp_audio)
 				return ERR_PTR(-EBUSY);
 
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
@@ -744,14 +710,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->funcs->hdmi_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 
-			bridge_hdmi_audio = drm_bridge_get(bridge);
+			bridge_connector->bridge_hdmi_audio = bridge;
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
-			if (bridge_dp_audio)
+			if (bridge_connector->bridge_dp_audio)
 				return ERR_PTR(-EBUSY);
 
-			if (bridge_hdmi_audio)
+			if (bridge_connector->bridge_hdmi_audio)
 				return ERR_PTR(-EBUSY);
 
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
@@ -762,7 +728,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->funcs->dp_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 
-			bridge_dp_audio = drm_bridge_get(bridge);
+			bridge_connector->bridge_dp_audio = bridge;
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
@@ -773,10 +739,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
-			if (bridge_hdmi_cec)
+			if (bridge_connector->bridge_hdmi_cec)
 				return ERR_PTR(-EBUSY);
 
-			bridge_hdmi_cec = drm_bridge_get(bridge);
+			bridge_connector->bridge_hdmi_cec = bridge;
 
 			if (!bridge->funcs->hdmi_cec_enable ||
 			    !bridge->funcs->hdmi_cec_log_addr ||
@@ -796,7 +762,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			ddc = bridge->ddc;
 
 		if (drm_bridge_is_panel(bridge))
-			panel_bridge = drm_bridge_get(bridge);
+			panel_bridge = bridge;
 
 		if (bridge->support_hdcp)
 			support_hdcp = true;
@@ -805,13 +771,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_hdmi) {
+	if (bridge_connector->bridge_hdmi) {
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
 		ret = drmm_connector_hdmi_init(drm, connector,
-					       bridge_hdmi->vendor,
-					       bridge_hdmi->product,
+					       bridge_connector->bridge_hdmi->vendor,
+					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
@@ -827,14 +793,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_hdmi_audio || bridge_dp_audio) {
+	if (bridge_connector->bridge_hdmi_audio ||
+	    bridge_connector->bridge_dp_audio) {
 		struct device *dev;
 		struct drm_bridge *bridge;
 
-		if (bridge_hdmi_audio)
-			bridge = bridge_hdmi_audio;
+		if (bridge_connector->bridge_hdmi_audio)
+			bridge = bridge_connector->bridge_hdmi_audio;
 		else
-			bridge = bridge_dp_audio;
+			bridge = bridge_connector->bridge_dp_audio;
 
 		dev = bridge->hdmi_audio_dev;
 
@@ -848,9 +815,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_hdmi_cec &&
-	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
-		struct drm_bridge *bridge = bridge_hdmi_cec;
+	if (bridge_connector->bridge_hdmi_cec &&
+	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
 
 		ret = drmm_connector_hdmi_cec_notifier_register(connector,
 								NULL,
@@ -859,9 +826,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_hdmi_cec &&
-	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
-		struct drm_bridge *bridge = bridge_hdmi_cec;
+	if (bridge_connector->bridge_hdmi_cec &&
+	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
 
 		ret = drmm_connector_hdmi_cec_register(connector,
 						       &drm_bridge_connector_hdmi_cec_funcs,
@@ -874,9 +841,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
-	if (bridge_hpd)
+	if (bridge_connector->bridge_hpd)
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
-	else if (bridge_detect)
+	else if (bridge_connector->bridge_detect)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
@@ -887,15 +854,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
 		drm_connector_attach_content_protection_property(connector, true);
 
-	bridge_connector->bridge_edid       = drm_bridge_get(bridge_edid);
-	bridge_connector->bridge_hpd        = drm_bridge_get(bridge_hpd);
-	bridge_connector->bridge_detect     = drm_bridge_get(bridge_detect);
-	bridge_connector->bridge_modes      = drm_bridge_get(bridge_modes);
-	bridge_connector->bridge_hdmi       = drm_bridge_get(bridge_hdmi);
-	bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge_hdmi_audio);
-	bridge_connector->bridge_dp_audio   = drm_bridge_get(bridge_dp_audio);
-	bridge_connector->bridge_hdmi_cec   = drm_bridge_get(bridge_hdmi_cec);
-
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);

---
base-commit: e018d46b9934dc04da74f65456bc1b3ff993ae97
change-id: 20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-9a429ddb48e2

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

