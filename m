Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD36CAAD450
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 06:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992EC10E13F;
	Wed,  7 May 2025 04:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="M1gDInb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Wed, 07 May 2025 04:02:20 UTC
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58EB10E13F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 04:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1746590537;
 bh=Tj5P6TtcgSVDpS1T+ZWu4nBhzWiNoYxJkl3RNDQY6IA=;
 h=From:To:Subject:Date:Message-Id;
 b=M1gDInb51vF9YEaq0Dsm6HbSNt58BYsc8eb3buBM4IaR/cRy0hgEA7Jy6ZolbzDGQ
 NnGvV5dIMKN3uthNd0mV9LL29rIb1nyyTnx+WvKn7+CuyRVn9qmImadnumwXadZfQJ
 y+EK6qC2guoaOifQluwlAAd1DOwJ9Sa60lTouWcM=
X-QQ-mid: esmtpgz14t1746589918t6bb1e88a
X-QQ-Originating-IP: BKJhp3IJF7PmAJk32cxPsmEjd1tieTKgIMel2vtjp74=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 May 2025 11:51:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3187435413464874817
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] drm/rockchip: cdn-dp: Convert to drm bridge
Date: Wed,  7 May 2025 11:51:48 +0800
Message-Id: <20250507035148.415-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OOkIcXXGmR+0iDU7G/HfeFOX5sf4jL1QXIhre20J1JTUrHoFBEBdr/Fr
 TnsgpKigLy20CXMpgXZHP/F8WVNfUCWeTxPhVyt6bS2W41X2EZ34GuoH5jHo5JKdiWHm2Kk
 BCjFa7eA4zn6Fxmgy+Oety4D1Zw+urIGqPI2tcVH10lsRAvUEdK8Jop5+SxUqf0KyMk4Kru
 qdg0WyDSKsKqhNULuqUG06OSUQwxw/KRmBEGNejGFzsNCX4R1R0Tu3oid92G+GZmvpPFJwf
 l53IY/lWvOi5bryooepVmmKYyYc0L01qkOjpp4Q/fDoBvU6S8cMYHlSwF3cc30EDrlsIY2n
 XqfrZjb0304Vb8DMCvzTnQzVhfyNJsetQ1ldX5LBm/O2C9EQN/4vhaGpJarCky25Owclwbm
 hwFV8G5KuhMeWiLQMSFp7VZkkutMXTa0/RKlcJ3IxwAJr4MuwTtdbQ7+qRjwa2hsv0dr4as
 anz5ceiQFiiOTxfzvNWJRhgM6xdNr0mzj4gFeG5VXPmXKOaMyH59K9qYtqa/LuHrnwL6FSA
 fTenQGhwFmm5f84lK0cXH8H6oA+vmUjk8Pk1chUVMbDhPQ1SyJd6bQbHQMWCn2oWiALt/A0
 af4pQcW/Q0M++40Y8M7Qjk46bVVWuGbSq2eMx3oQvMKeHq2S1ndSVqYy81jYSwcwwuiqG+h
 ERBVntubLQTOnHODBwGvxNaTDVDVKRJuwcVEPvwjgqo9G/joY9fr6sbRa/HFzGYPs6jmRn3
 RswiDFIlbBnDT1a2lrimlO+JZCpweaJ5laKomrpftBoHmwbPJNYBmwmU3lEnq2n/vELTrBv
 cMjkjJMcCzq7rh8GzHzyN9XZQU9PNJ98JdxV9dhzNQhgmm+cAnr2Q+JsBPrIeAKzpFM0YFn
 baZO2SS+2+2+Gd/X0S/bZK5KwjcdToQB1JTxjFU75lYAWbFsc6dNR2PDq3tPEwNjLuaz+5H
 fI9xaZGsc1iDwPVcs7KjCPXANTcB6vLhM63E9OZyCF041/KW6ekPzMESPCMQO4ExPMxVFSE
 FaZW0b8Tuw1okhYCpNxiNUYj1DnciiUYFVrnzx2g==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Tested with RK3399 EVB IND board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 163 +++++++++++++------------
 drivers/gpu/drm/rockchip/cdn-dp-core.h |   5 +-
 2 files changed, 86 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 292c31de18f1..bc70dae8ff72 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -25,9 +25,9 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-static inline struct cdn_dp_device *connector_to_dp(struct drm_connector *connector)
+static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
 {
-	return container_of(connector, struct cdn_dp_device, connector);
+	return container_of(bridge, struct cdn_dp_device, bridge);
 }
 
 static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
@@ -231,9 +231,9 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 }
 
 static enum drm_connector_status
-cdn_dp_connector_detect(struct drm_connector *connector, bool force)
+cdn_dp_bridge_detect(struct drm_bridge *bridge)
 {
-	struct cdn_dp_device *dp = connector_to_dp(connector);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	mutex_lock(&dp->lock);
@@ -244,41 +244,26 @@ cdn_dp_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void cdn_dp_connector_destroy(struct drm_connector *connector)
+static const struct drm_edid *
+cdn_dp_connector_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_funcs cdn_dp_atomic_connector_funcs = {
-	.detect = cdn_dp_connector_detect,
-	.destroy = cdn_dp_connector_destroy,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int cdn_dp_connector_get_modes(struct drm_connector *connector)
-{
-	struct cdn_dp_device *dp = connector_to_dp(connector);
-	int ret = 0;
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	const struct drm_edid *drm_edid;
 
 	mutex_lock(&dp->lock);
-
-	ret = drm_edid_connector_add_modes(connector);
-
+	drm_edid = drm_edid_read_custom(dp->connector,
+					cdn_dp_get_edid_block, dp);
 	mutex_unlock(&dp->lock);
 
-	return ret;
+	return drm_edid;
 }
 
 static enum drm_mode_status
-cdn_dp_connector_mode_valid(struct drm_connector *connector,
-			    const struct drm_display_mode *mode)
+cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *display_info,
+			 const struct drm_display_mode *mode)
 {
-	struct cdn_dp_device *dp = connector_to_dp(connector);
-	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	u32 requested, actual, rate, sink_max, source_max = 0;
 	u8 lanes, bpc;
 
@@ -323,11 +308,6 @@ cdn_dp_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static struct drm_connector_helper_funcs cdn_dp_connector_helper_funcs = {
-	.get_modes = cdn_dp_connector_get_modes,
-	.mode_valid = cdn_dp_connector_mode_valid,
-};
-
 static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 {
 	int ret;
@@ -360,7 +340,7 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 
 static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 {
-	const struct drm_display_info *info = &dp->connector.display_info;
+	const struct drm_display_info *info = &dp->connector->display_info;
 	int ret;
 
 	if (!cdn_dp_check_sink_connection(dp))
@@ -374,9 +354,9 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 	}
 
 	drm_edid_free(dp->drm_edid);
-	dp->drm_edid = drm_edid_read_custom(&dp->connector,
+	dp->drm_edid = drm_edid_read_custom(dp->connector,
 					    cdn_dp_get_edid_block, dp);
-	drm_edid_connector_update(&dp->connector, dp->drm_edid);
+	drm_edid_connector_update(dp->connector, dp->drm_edid);
 
 	dp->sink_has_audio = info->has_audio;
 
@@ -416,11 +396,11 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -551,7 +531,7 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
 				    struct drm_display_mode *adjusted)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
-	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct drm_display_info *display_info = &dp->connector->display_info;
 	struct video_info *video = &dp->video_info;
 
 	switch (display_info->bpc) {
@@ -599,12 +579,12 @@ static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
 		dp->plugged_cb(dp->codec_dev, plugged);
 }
 
-static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
+static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
-	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret, val;
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
 		return;
@@ -625,7 +605,7 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 
 	ret = cdn_dp_enable(dp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to enable encoder %d\n",
+		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
 			      ret);
 		goto out;
 	}
@@ -661,9 +641,9 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 	mutex_unlock(&dp->lock);
 }
 
-static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
+static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
-	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -672,7 +652,7 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Failed to disable encoder %d\n",
+			DRM_DEV_ERROR(dp->dev, "Failed to disable bridge %d\n",
 				      ret);
 		}
 	}
@@ -703,13 +683,31 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
+			   enum drm_connector_status status)
+{
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+
+	schedule_work(&dp->event_work);
+}
+
 static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
 	.mode_set = cdn_dp_encoder_mode_set,
-	.enable = cdn_dp_encoder_enable,
-	.disable = cdn_dp_encoder_disable,
 	.atomic_check = cdn_dp_encoder_atomic_check,
 };
 
+static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.detect = cdn_dp_bridge_detect,
+	.edid_read = cdn_dp_connector_edid_read,
+	.atomic_enable = cdn_dp_bridge_atomic_enable,
+	.atomic_disable = cdn_dp_bridge_atomic_disable,
+	.mode_valid = cdn_dp_bridge_mode_valid,
+	.hpd_notify = cdn_dp_hpd_notify,
+};
+
 static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 {
 	struct device *dev = dp->dev;
@@ -859,7 +857,7 @@ static int cdn_dp_audio_get_eld(struct device *dev, void *data,
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 
-	memcpy(buf, dp->connector.eld, min(sizeof(dp->connector.eld), len));
+	memcpy(buf, dp->connector->eld, min(sizeof(dp->connector->eld), len));
 
 	return 0;
 }
@@ -1006,7 +1004,6 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_connector_helper_hpd_irq_event(&dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -1030,7 +1027,6 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder;
-	struct drm_connector *connector;
 	struct cdn_dp_port *port;
 	struct drm_device *drm_dev = data;
 	int ret, i;
@@ -1053,6 +1049,15 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet. Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs == 0)
+		return -EPROBE_DEFER;
+
 	ret = drm_simple_encoder_init(drm_dev, encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
@@ -1062,26 +1067,31 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	connector = &dp->connector;
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-	connector->dpms = DRM_MODE_DPMS_OFF;
+	dp->bridge.driver_private = dp;
+	dp->bridge.funcs = &cdn_dp_bridge_funcs;
+	dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
+			   DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HPD;
+	dp->bridge.of_node = dp->dev->of_node;
+	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
-	ret = drm_connector_init(drm_dev, connector,
-				 &cdn_dp_atomic_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		DRM_ERROR("failed to initialize connector with drm\n");
-		goto err_free_encoder;
-	}
+	ret = devm_drm_bridge_add(dev, &dp->bridge);
+	if (ret)
+		return ret;
 
-	drm_connector_helper_add(connector, &cdn_dp_connector_helper_funcs);
+	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
 
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		DRM_ERROR("failed to attach connector and encoder\n");
-		goto err_free_connector;
+	dp->connector = drm_bridge_connector_init(drm_dev, encoder);
+	if (IS_ERR(dp->connector)) {
+		ret = PTR_ERR(dp->connector);
+		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
+		return ret;
 	}
 
+	drm_connector_attach_encoder(dp->connector, encoder);
+
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
@@ -1092,7 +1102,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 		if (ret) {
 			DRM_DEV_ERROR(dev,
 				      "register EXTCON_DISP_DP notifier err\n");
-			goto err_free_connector;
+			return ret;
 		}
 	}
 
@@ -1101,24 +1111,15 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	schedule_work(&dp->event_work);
 
 	return 0;
-
-err_free_connector:
-	drm_connector_cleanup(connector);
-err_free_encoder:
-	drm_encoder_cleanup(encoder);
-	return ret;
 }
 
 static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dp->encoder.encoder;
-	struct drm_connector *connector = &dp->connector;
 
 	cancel_work_sync(&dp->event_work);
-	cdn_dp_encoder_disable(encoder);
 	encoder->funcs->destroy(encoder);
-	connector->funcs->destroy(connector);
 
 	pm_runtime_disable(dev);
 	if (dp->fw_loaded)
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 17498f576ce7..d2778f7a5b31 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -8,6 +8,8 @@
 #define _CDN_DP_CORE_H
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <sound/hdmi-codec.h>
@@ -65,7 +67,8 @@ struct cdn_dp_port {
 struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct drm_connector connector;
+	struct drm_bridge bridge;
+	struct drm_connector *connector;
 	struct rockchip_encoder encoder;
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
-- 
2.49.0

