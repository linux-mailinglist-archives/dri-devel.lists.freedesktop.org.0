Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B662AC49FA
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 10:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5410E3E7;
	Tue, 27 May 2025 08:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="HVZJMCtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091710E463
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1748333699;
 bh=Yb79EJcC8v+0loWb2s5hqKOarC0FNlz/EkB5OXIpGzI=;
 h=From:To:Subject:Date:Message-Id;
 b=HVZJMCtgq5uGQ4FTIyURr/lbOaG88DuokVyyokOKTskbKcGs5QdEibGQwCCAMlTUR
 OdQ6/ppRu09F3578EH1VjNRmPjwH/EfCt9hRrYIQuOhjCxj0Zontq3ajzc6ClscdOd
 quJD7xMkXO+zoe0RIE3+jAONTaya/UjnxLL3ggzk=
X-QQ-mid: zesmtpsz3t1748333691t0a00ae5b
X-QQ-Originating-IP: jmMkXCCGuBV/psBnOvh48mmWPXdBIEZC0pQuzvzfIiE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 May 2025 16:14:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1510287522126049275
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
Date: Tue, 27 May 2025 16:14:47 +0800
Message-Id: <20250527081447.304-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Nzm/ywkHpQhPfwad78O6VrSj37VhrEEReZ/7ghfHzzR8L4LOcMqa73wV
 17/7ZWkDcfc0MLECcILuTfhEOs3Pzs9cIE5+9/XPYImbADHL8tbiGnWd385t7Ha26b4Suva
 pXQtf6GecgjwNoHZ2jFvyK7W4T8yb6/FtMnJO6hiw/sRhS5GnpU/wmzPwyGH5k7extEdnWC
 v6aCYI/NXy2G0CB8BkHFzQDV0vbbINJGSSKTxxuRozFKRw4rAkK/AvLwGjA8Xtn8YJoykKn
 9HQda0z53NViOWUvshS5VYNbVuxUARdHi/Y0pobLp8jKszVsHHmOQW+EZ4Ez6MOCvrOrL5J
 YgWt3UbCbrYQUntYtqxX44+eP96+ADlzW09fUuXz1za68qdRPycoqZcF1VhoyZsTP8EhAEJ
 6mIU+W045Kt+m6bl9Nwn7DssoSrCDU4r72x8MjDiCLNiigVK5ZYTC8DX664F3rDGivcxiHz
 8KHwRgBSeBo+0DYHrGsYkOquKI5LlTsVBVyMisO6yX04ZgcVQ80xVTGZx8pMT+Pn7MSLczv
 46NPGJZ9Tiy+KxxZSh7oXkyG2TApBHmc99uG/HsJ1+KCAeFwDhhCskoukMZUEDyNRtcmLuw
 zD9OzsufA9NuoBdhbliODlRjsX840Fr7itInwN24bD7dCVy1hX1sAL3e622oy1ew11BreX+
 YFLOVdarMF1bhHWxYMADuR+5OwTbEBJo0nKsnP0Sd3DS+GvYJ+AfN69joP/HMkCobsHCBIy
 oTtIzNfwAiOgcqluRnXnQJCMp4cQMw+9IuLKp42JG7JG7NF1KcCdDAVec++/qyMeaRpXQwI
 fQwHzm81Np6Dr13VnOPA2alHZRhsEmXwEvsytxtePGSJyAfTUQzb4qV+jgAc4M5C7ceZVGH
 6xlj+heRzltVZ4j8ejrqpc1dJlPQmy4tAtd1gvz7WB28kL/CmRKRfZptBZgeSvMcGv5R1MM
 qyWM++ML7RHDldAj/7f3vi6mr/SDoEYaDlzPgGgBLxEZeew==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Considering that some code depend on the connector, the following
changes have been made:
- Only process edid in &drm_bridge_funcs.edid_read(), so no need to
store additional edid info.
- Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
- Update bpc info in cdn_dp_bridge_atomic_enable() instead of
cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
cdn_dp_bridge_atomic_enable().
- Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.

This patch also convert to use devm_drm_bridge_alloc() API.

Tested with RK3399 EVB IND board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250523011310.120-1-kernel@airkyi.com/
- Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers
- Remove the dependency for connector
- Remove the extra stored edid
- Code cleanup

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250507035148.415-1-kernel@airkyi.com/
- Use drm_atomic_get_new_connector_for_encoder() to get connector
- Convert to use devm_drm_bridge_alloc() API
- Fix typo: cdn_dp_connector_edid_read -> cdn_dp_bridge_edid_read

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 279 ++++++++++---------------
 drivers/gpu/drm/rockchip/cdn-dp-core.h |   9 +-
 2 files changed, 110 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 292c31de18f1..5e116d3e516b 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -16,6 +16,7 @@
 #include <sound/hdmi-codec.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
@@ -25,9 +26,9 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-static inline struct cdn_dp_device *connector_to_dp(struct drm_connector *connector)
+static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
 {
-	return container_of(connector, struct cdn_dp_device, connector);
+	return container_of(bridge, struct cdn_dp_device, bridge);
 }
 
 static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
@@ -231,9 +232,9 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 }
 
 static enum drm_connector_status
-cdn_dp_connector_detect(struct drm_connector *connector, bool force)
+cdn_dp_bridge_detect(struct drm_bridge *bridge)
 {
-	struct cdn_dp_device *dp = connector_to_dp(connector);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	mutex_lock(&dp->lock);
@@ -244,41 +245,25 @@ cdn_dp_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void cdn_dp_connector_destroy(struct drm_connector *connector)
+static const struct drm_edid *
+cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
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
+	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
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
@@ -360,7 +340,6 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 
 static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 {
-	const struct drm_display_info *info = &dp->connector.display_info;
 	int ret;
 
 	if (!cdn_dp_check_sink_connection(dp))
@@ -373,17 +352,6 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 		return ret;
 	}
 
-	drm_edid_free(dp->drm_edid);
-	dp->drm_edid = drm_edid_read_custom(&dp->connector,
-					    cdn_dp_get_edid_block, dp);
-	drm_edid_connector_update(&dp->connector, dp->drm_edid);
-
-	dp->sink_has_audio = info->has_audio;
-
-	if (dp->drm_edid)
-		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
-				  info->width_mm / 10, info->height_mm / 10);
-
 	return 0;
 }
 
@@ -488,10 +456,6 @@ static int cdn_dp_disable(struct cdn_dp_device *dp)
 	dp->active = false;
 	dp->max_lanes = 0;
 	dp->max_rate = 0;
-	if (!dp->connected) {
-		drm_edid_free(dp->drm_edid);
-		dp->drm_edid = NULL;
-	}
 
 	return 0;
 }
@@ -551,21 +515,8 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
 				    struct drm_display_mode *adjusted)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
-	struct drm_display_info *display_info = &dp->connector.display_info;
 	struct video_info *video = &dp->video_info;
 
-	switch (display_info->bpc) {
-	case 10:
-		video->color_depth = 10;
-		break;
-	case 6:
-		video->color_depth = 6;
-		break;
-	default:
-		video->color_depth = 8;
-		break;
-	}
-
 	video->color_fmt = PXL_RGB;
 	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
 	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
@@ -595,16 +546,41 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
 					       bool plugged)
 {
-	if (dp->codec_dev)
-		dp->plugged_cb(dp->codec_dev, plugged);
+	if (dp->sink_has_audio)
+		drm_connector_hdmi_audio_plugged_notify(dp->connector, plugged);
 }
 
-static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
+static void cdn_dp_display_info_update(struct cdn_dp_device *dp, struct drm_display_info *display_info)
 {
-	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct video_info *video = &dp->video_info;
+
+	switch (display_info->bpc) {
+	case 10:
+		video->color_depth = 10;
+		break;
+	case 6:
+		video->color_depth = 6;
+		break;
+	default:
+		video->color_depth = 8;
+		break;
+	}
+
+	dp->sink_has_audio = display_info->has_audio;
+}
+
+static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
+{
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret, val;
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	dp->connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (!dp->connector)
+		return;
+
+	cdn_dp_display_info_update(dp, &dp->connector->display_info);
+
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
 		return;
@@ -625,7 +601,7 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 
 	ret = cdn_dp_enable(dp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to enable encoder %d\n",
+		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
 			      ret);
 		goto out;
 	}
@@ -661,9 +637,9 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 	mutex_unlock(&dp->lock);
 }
 
-static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
+static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
-	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -672,7 +648,7 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Failed to disable encoder %d\n",
+			DRM_DEV_ERROR(dp->dev, "Failed to disable bridge %d\n",
 				      ret);
 		}
 	}
@@ -705,8 +681,6 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
 
 static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
 	.mode_set = cdn_dp_encoder_mode_set,
-	.enable = cdn_dp_encoder_enable,
-	.disable = cdn_dp_encoder_disable,
 	.atomic_check = cdn_dp_encoder_atomic_check,
 };
 
@@ -779,11 +753,12 @@ static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 	return 0;
 }
 
-static int cdn_dp_audio_hw_params(struct device *dev,  void *data,
-				  struct hdmi_codec_daifmt *daifmt,
-				  struct hdmi_codec_params *params)
+static int cdn_dp_audio_prepare(struct drm_connector *connector,
+				struct drm_bridge *bridge,
+				struct hdmi_codec_daifmt *daifmt,
+				struct hdmi_codec_params *params)
 {
-	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	struct audio_info audio = {
 		.sample_width = params->sample_width,
 		.sample_rate = params->sample_rate,
@@ -805,7 +780,7 @@ static int cdn_dp_audio_hw_params(struct device *dev,  void *data,
 		audio.format = AFMT_SPDIF;
 		break;
 	default:
-		DRM_DEV_ERROR(dev, "Invalid format %d\n", daifmt->fmt);
+		DRM_DEV_ERROR(bridge->dev, "Invalid format %d\n", daifmt->fmt);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -819,9 +794,10 @@ static int cdn_dp_audio_hw_params(struct device *dev,  void *data,
 	return ret;
 }
 
-static void cdn_dp_audio_shutdown(struct device *dev, void *data)
+static void cdn_dp_audio_shutdown(struct drm_connector *connector,
+				  struct drm_bridge *bridge)
 {
-	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -835,10 +811,11 @@ static void cdn_dp_audio_shutdown(struct device *dev, void *data)
 	mutex_unlock(&dp->lock);
 }
 
-static int cdn_dp_audio_mute_stream(struct device *dev, void *data,
+static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
+				    struct drm_bridge *bridge,
 				    bool enable, int direction)
 {
-	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -854,57 +831,21 @@ static int cdn_dp_audio_mute_stream(struct device *dev, void *data,
 	return ret;
 }
 
-static int cdn_dp_audio_get_eld(struct device *dev, void *data,
-				u8 *buf, size_t len)
-{
-	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-
-	memcpy(buf, dp->connector.eld, min(sizeof(dp->connector.eld), len));
-
-	return 0;
-}
-
-static int cdn_dp_audio_hook_plugged_cb(struct device *dev, void *data,
-					hdmi_codec_plugged_cb fn,
-					struct device *codec_dev)
-{
-	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-
-	mutex_lock(&dp->lock);
-	dp->plugged_cb = fn;
-	dp->codec_dev = codec_dev;
-	cdn_dp_audio_handle_plugged_change(dp, dp->connected);
-	mutex_unlock(&dp->lock);
-
-	return 0;
-}
-
-static const struct hdmi_codec_ops audio_codec_ops = {
-	.hw_params = cdn_dp_audio_hw_params,
-	.audio_shutdown = cdn_dp_audio_shutdown,
-	.mute_stream = cdn_dp_audio_mute_stream,
-	.get_eld = cdn_dp_audio_get_eld,
-	.hook_plugged_cb = cdn_dp_audio_hook_plugged_cb,
+static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.detect = cdn_dp_bridge_detect,
+	.edid_read = cdn_dp_bridge_edid_read,
+	.atomic_enable = cdn_dp_bridge_atomic_enable,
+	.atomic_disable = cdn_dp_bridge_atomic_disable,
+	.mode_valid = cdn_dp_bridge_mode_valid,
+
+	.dp_audio_prepare = cdn_dp_audio_prepare,
+	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
+	.dp_audio_shutdown = cdn_dp_audio_shutdown,
 };
 
-static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
-				   struct device *dev)
-{
-	struct hdmi_codec_pdata codec_data = {
-		.i2s = 1,
-		.spdif = 1,
-		.ops = &audio_codec_ops,
-		.max_i2s_channels = 8,
-		.no_capture_mute = 1,
-	};
-
-	dp->audio_pdev = platform_device_register_data(
-			 dev, HDMI_CODEC_DRV_NAME, PLATFORM_DEVID_AUTO,
-			 &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(dp->audio_pdev);
-}
-
 static int cdn_dp_request_firmware(struct cdn_dp_device *dp)
 {
 	int ret;
@@ -1006,7 +947,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_connector_helper_hpd_irq_event(&dp->connector);
+	if (dp->connector)
+		drm_connector_helper_hpd_irq_event(dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -1062,26 +1004,35 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	connector = &dp->connector;
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-	connector->dpms = DRM_MODE_DPMS_OFF;
-
-	ret = drm_connector_init(drm_dev, connector,
-				 &cdn_dp_atomic_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		DRM_ERROR("failed to initialize connector with drm\n");
-		goto err_free_encoder;
-	}
+	dp->bridge.ops =
+			DRM_BRIDGE_OP_DETECT |
+			DRM_BRIDGE_OP_EDID |
+			DRM_BRIDGE_OP_HPD |
+			DRM_BRIDGE_OP_DP_AUDIO;
+	dp->bridge.of_node = dp->dev->of_node;
+	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	dp->bridge.hdmi_audio_dev = dp->dev;
+	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
+	dp->bridge.hdmi_audio_spdif_playback = 1;
+	dp->bridge.hdmi_audio_dai_port = -1;
+
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
+	connector = drm_bridge_connector_init(drm_dev, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
+		return ret;
 	}
 
+	drm_connector_attach_encoder(connector, encoder);
+
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
@@ -1101,30 +1052,19 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
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
 		release_firmware(dp->fw);
-	drm_edid_free(dp->drm_edid);
-	dp->drm_edid = NULL;
 }
 
 static const struct component_ops cdn_dp_component_ops = {
@@ -1171,9 +1111,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
-	if (!dp)
-		return -ENOMEM;
+	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
+				   &cdn_dp_bridge_funcs);
+	if (IS_ERR(dp))
+		return PTR_ERR(dp);
 	dp->dev = dev;
 
 	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
@@ -1209,19 +1150,11 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	mutex_init(&dp->lock);
 	dev_set_drvdata(dev, dp);
 
-	ret = cdn_dp_audio_codec_init(dp, dev);
-	if (ret)
-		return ret;
-
 	ret = component_add(dev, &cdn_dp_component_ops);
 	if (ret)
-		goto err_audio_deinit;
+		return ret;
 
 	return 0;
-
-err_audio_deinit:
-	platform_device_unregister(dp->audio_pdev);
-	return ret;
 }
 
 static void cdn_dp_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 17498f576ce7..6aa3ce489382 100644
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
@@ -65,12 +67,12 @@ struct cdn_dp_port {
 struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct drm_connector connector;
+	struct drm_bridge bridge;
+	struct drm_connector *connector;
 	struct rockchip_encoder encoder;
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
 	struct work_struct event_work;
-	const struct drm_edid *drm_edid;
 
 	struct mutex lock;
 	bool connected;
@@ -102,8 +104,5 @@ struct cdn_dp_device {
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	bool sink_has_audio;
-
-	hdmi_codec_plugged_cb plugged_cb;
-	struct device *codec_dev;
 };
 #endif  /* _CDN_DP_CORE_H */
-- 
2.49.0

