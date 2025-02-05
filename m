Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8627A28491
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 07:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9010E73C;
	Wed,  5 Feb 2025 06:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BPyHYCx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C841210E73B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 06:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A60DEA42704;
 Wed,  5 Feb 2025 06:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63ED9C4CEE5;
 Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738737634;
 bh=gJttkzn6BJFiI8fPoTRjXq8kfmPVSjAVBm2+rRUyFm4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=BPyHYCx3qkb3x2tF10WH39ZOpMy/A0Lemb6mWDjsJMJBaC7G/cYUQ+DVZztf5Ud6+
 9EKbas4LexMr6B4Zt9DQdPoOZNKew9PYDmphmcAZYu9fxNQhcJXOXYOy8xAd3TsWDt
 HkGivJxHhdTvhpK9Ym22pixmXCfliz/YJXYFiqy3TFupocBLI9pZStcivzxWIqV7ro
 FoqYW6vDGm+0LDf5jesfYIFaEMAyql7G5CiQs6TUjEA/AIabrt87ImSj193eXaMk8C
 uvdUIu4MDAZgUmqTucv4KRJIqONqoTrynjmGPi9KPqGclGJZQEopsUxq4KXrjzl0Sb
 olrBLwMr6qVNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 50FA9C02197;
 Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 05 Feb 2025 14:41:03 +0800
Subject: [PATCH v3 1/2] drm/bridge: it6505: add support DRM_BRIDGE_OP_HDMI
 to drm_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-add-audio-codec-v3-1-26cfadb2d81f@ite.com.tw>
References: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
In-Reply-To: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: treapking@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738737663; l=9180;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=HsvghXCd4JyDknaGsA3NNvvjMzjG9ZuIBRMO9tJETkE=;
 b=igPnzGn4a+UA7iXGKouqKmB8ravxdw3TuH1hogt7Jxy6U28L0PkOsFZYXDvi8f4KMBTm/DoQy
 354DC/w75vsArtSHk3Xul6y96cU6enH49Vvs1QuCkNdSPl/Q0/oT+dx
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

Add DRM_BRIDGE_OP_HDMI to bridge.ops and implement necessary callback
functions.

The native AVI and AUDIO infoframe configuration API are removed.

In .atomic_enable use
drm_atomic_helper_connector_hdmi_update_infoframes().
for infoframe updates.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 185 ++++++++++++++++++++++--------------
 1 file changed, 115 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..4c766854de14093b80949bdb410488f504b24db8 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -25,6 +25,8 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
@@ -1414,37 +1416,6 @@ static void it6505_variable_config(struct it6505 *it6505)
 	memset(it6505->bksvs, 0, sizeof(it6505->bksvs));
 }
 
-static int it6505_send_video_infoframe(struct it6505 *it6505,
-				       struct hdmi_avi_infoframe *frame)
-{
-	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
-	int err;
-	struct device *dev = it6505->dev;
-
-	err = hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(dev, "Failed to pack AVI infoframe: %d", err);
-		return err;
-	}
-
-	err = it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0x00);
-	if (err)
-		return err;
-
-	err = regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
-				buffer + HDMI_INFOFRAME_HEADER_SIZE,
-				frame->length);
-	if (err)
-		return err;
-
-	err = it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT,
-			      EN_AVI_PKT);
-	if (err)
-		return err;
-
-	return 0;
-}
-
 static void it6505_get_extcon_property(struct it6505 *it6505)
 {
 	int err;
@@ -1604,27 +1575,6 @@ static void it6505_enable_audio_source(struct it6505 *it6505)
 	it6505_write(it6505, REG_AUDIO_SRC_CTRL, audio_source_count);
 }
 
-static void it6505_enable_audio_infoframe(struct it6505 *it6505)
-{
-	struct device *dev = it6505->dev;
-	u8 audio_info_ca[] = { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F, 0x1F };
-
-	DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
-			     audio_info_ca[it6505->audio.channel_count - 1]);
-
-	it6505_write(it6505, REG_AUD_INFOFRAM_DB1, it6505->audio.channel_count
-		     - 1);
-	it6505_write(it6505, REG_AUD_INFOFRAM_DB2, 0x00);
-	it6505_write(it6505, REG_AUD_INFOFRAM_DB3,
-		     audio_info_ca[it6505->audio.channel_count - 1]);
-	it6505_write(it6505, REG_AUD_INFOFRAM_DB4, 0x00);
-	it6505_write(it6505, REG_AUD_INFOFRAM_SUM, 0x00);
-
-	/* Enable Audio InfoFrame */
-	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_CTRL_PKT,
-			EN_AUD_CTRL_PKT);
-}
-
 static void it6505_disable_audio(struct it6505 *it6505)
 {
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, EN_AUD_MUTE);
@@ -1644,7 +1594,6 @@ static void it6505_enable_audio(struct it6505 *it6505)
 	it6505_setup_audio_channel_status(it6505);
 	it6505_setup_audio_format(it6505);
 	it6505_enable_audio_source(it6505);
-	it6505_enable_audio_infoframe(it6505);
 
 	it6505_write(it6505, REG_AUDIO_N_0_7, 0x00);
 	it6505_write(it6505, REG_AUDIO_N_8_15, 0x80);
@@ -3168,17 +3117,13 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
 			 const struct drm_display_info *info,
 			 const struct drm_display_mode *mode)
 {
-	struct it6505 *it6505 = bridge_to_it6505(bridge);
-
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		return MODE_NO_INTERLACE;
-
-	if (mode->clock > it6505->max_dpi_pixel_clock)
-		return MODE_CLOCK_HIGH;
+	unsigned long long rate;
 
-	it6505->video_info.clock = mode->clock;
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (rate == 0)
+		return MODE_NOCLOCK;
 
-	return MODE_OK;
+	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
 }
 
 static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -3217,6 +3162,8 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (WARN_ON(!mode))
 		return;
 
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame,
 						       connector,
 						       mode);
@@ -3224,15 +3171,8 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 		dev_err(dev, "Failed to setup AVI infoframe: %d", ret);
 
 	it6505_update_video_parameter(it6505, mode);
-
-	ret = it6505_send_video_infoframe(it6505, &frame);
-
-	if (ret)
-		dev_err(dev, "Failed to send AVI infoframe: %d", ret);
-
 	it6505_int_mask_enable(it6505);
 	it6505_video_reset(it6505);
-
 	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 				     DP_SET_POWER_D0);
 }
@@ -3302,6 +3242,106 @@ static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid_dup(it6505->cached_edid);
 }
 
+static void it6505_write_audio_infoframe(struct it6505 *it6505,
+					 const u8 *buffer, size_t len)
+{
+	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT, 0);
+	regmap_bulk_write(it6505->regmap, REG_AUD_INFOFRAM_DB1,
+			  buffer + HDMI_INFOFRAME_HEADER_SIZE,
+			  4);
+	it6505_write(it6505, REG_AUD_INFOFRAM_SUM, buffer[3]);
+	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT,
+			EN_AUD_PKT);
+}
+
+static int it6505_write_avi_infoframe(struct it6505 *it6505,
+				      const u8 *buffer, size_t len)
+{
+	struct device *dev = it6505->dev;
+
+	if (len - HDMI_INFOFRAME_HEADER_SIZE > 13) {
+		DRM_DEV_DEBUG_DRIVER(dev, "AVI size fail %d", len);
+		return -EINVAL;
+	}
+
+	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0);
+	regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
+			  buffer + HDMI_INFOFRAME_HEADER_SIZE,
+			  len - HDMI_INFOFRAME_HEADER_SIZE);
+
+	it6505_write(it6505, REG_AVI_INFO_SUM, buffer[3]);
+	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT,
+			EN_AVI_PKT);
+
+	return 0;
+}
+
+static int it6505_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
+					      enum hdmi_infoframe_type type,
+					      const u8 *buffer, size_t len)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
+	/*HW supports AVI and AUDIO infoframe only*/
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		it6505_write_audio_infoframe(it6505, buffer, len);
+		break;
+
+	case HDMI_INFOFRAME_TYPE_AVI:
+		it6505_write_avi_infoframe(it6505, buffer, len);
+		break;
+	default:
+		dev_dbg(dev, "unsupported HDMI infoframe 0x%x\n", type);
+		break;
+	}
+
+	return 0;
+}
+
+static int it6505_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					      enum hdmi_infoframe_type type)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
+	/*HW supports AVI and AUDIO infoframe only*/
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT, 0);
+		break;
+
+	case HDMI_INFOFRAME_TYPE_AVI:
+		it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0);
+		break;
+	default:
+		dev_dbg(dev, "unsupported HDMI infoframe 0x%x\n", type);
+		break;
+	}
+
+	return 0;
+}
+
+static enum drm_mode_status
+it6505_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+					const struct drm_display_mode *mode,
+					unsigned long long tmds_rate)
+{
+	const struct it6505 *it6505 = container_of(bridge,
+						   const struct it6505,
+						   bridge);
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_NO_INTERLACE;
+
+	if (mode->clock > it6505->max_dpi_pixel_clock ||
+	    tmds_rate > 148500000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -3315,6 +3355,9 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_post_disable = it6505_bridge_atomic_post_disable,
 	.detect = it6505_bridge_detect,
 	.edid_read = it6505_bridge_edid_read,
+	.hdmi_clear_infoframe = it6505_bridge_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = it6505_bridge_hdmi_write_infoframe,
+	.hdmi_tmds_char_rate_valid = it6505_bridge_hdmi_tmds_char_rate_valid,
 };
 
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
@@ -3700,7 +3743,9 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-			     DRM_BRIDGE_OP_HPD;
+			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI;
+	it6505->bridge.vendor = "iTE";
+	it6505->bridge.product = "IT6505";
 	drm_bridge_add(&it6505->bridge);
 
 	return 0;

-- 
2.34.1


