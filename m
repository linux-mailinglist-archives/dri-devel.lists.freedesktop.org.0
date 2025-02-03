Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2299A25234
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 07:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6B10E0B6;
	Mon,  3 Feb 2025 06:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r1ma00Ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367310E0B6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 06:04:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7152D5C5C17;
 Mon,  3 Feb 2025 06:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F21E5C4CEE2;
 Mon,  3 Feb 2025 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738562650;
 bh=durgU11lQ4dYcx2HLXEoqa0U7u7LZGRE+AdiLMGRBdo=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=r1ma00EeevTn4DlJ1qGNErTeu8FOxNw37X7EQB88WfHduYi/PQ5jNY/LSnFITvxSn
 0eoh5g+iMOVvyfREePh+6HGLP0OiQy5Jx6gH+Wy/QsBjzFLffreyoFPzkzDCiFMpK/
 8ReYIh5zTaKTtYy9f/MSSsEBKX03tjxZazTo1rkYHbiv6f6TQb97XvlLqE0gYqFkPU
 kIiZzjailYhncLEYN2c2h3p+VbIZ+PDJfNTlD4Y5Bl5h4+FQsVzNkoC7C/M/V5gDHm
 jdo+unShSwYRP/dSPzh5duPr+tRFxegJqwuAin3nAVai1eWRrNuNhZfObejDIn2yZt
 6z46Z+1HusrYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CE45DC02193;
 Mon,  3 Feb 2025 06:04:09 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 03 Feb 2025 14:04:30 +0800
Subject: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAG1coGcC/2WNyw6CMBBFf8XM2iFMQR6u/A/Dok4HmYXUtIgaw
 r9biTuX5yT33AWiBJUIx90CQWaN6scEZr8DHux4FVSXGExuDjlRidY5tA+nHtk7YWy4dWWdV8Z
 WDGl1D9Lrayueu8SDxsmH93Yw09f+Wob+WjMhoRR9X9Ol4Ibak06Ssb9l0xO6dV0/ZVx3Qa8AA
 AA=
X-Change-ID: 20250114-add-audio-codec-8c9d47062a6c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738562676; l=7353;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=lqZfEfNoydFlPCDKtWPfpO3fwht+N1S5cJwdQJmO1+c=;
 b=/MzEvq2dYLYQujk9oTXPpGxAGAKJzh9XakdQCtNdueKsw5sorux3J1fj0smHHNszs/dZ0EGMC
 jhApGPXTMH+D4G73sNuDwl4tneMGRDapt8DjbHNQZnYfQeVM708gVV/
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

For supporting audio form I2S to DP audio data sub stream.
Add hdmi_audio callbacks to drm_bridge_funcs for the
HDMI codec framework. The DRM_BRIDGE_OP_HDMI flag in bridge.ops
must be set, and hdmi_write_infoframe and hdmi_clear_infoframe
are necessary for the drm_bridge_connector to enable the HDMI codec.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v2:
- Use DRM HDMI codec framewrok for audio stream setup.
- Link to v1: https://lore.kernel.org/r/20250121-add-audio-codec-v1-1-e3ff71b3c819@ite.com.tw
---
 drivers/gpu/drm/bridge/ite-it6505.c | 151 +++++++++++++++++++++++++++++++-----
 1 file changed, 132 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..361e2412b8e8f040cf4254479b60588d99e8c99a 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1414,32 +1414,43 @@ static void it6505_variable_config(struct it6505 *it6505)
 	memset(it6505->bksvs, 0, sizeof(it6505->bksvs));
 }
 
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
 static int it6505_send_video_infoframe(struct it6505 *it6505,
 				       struct hdmi_avi_infoframe *frame)
 {
 	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
-	int err;
+	int err, length;
 	struct device *dev = it6505->dev;
 
-	err = hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(dev, "Failed to pack AVI infoframe: %d", err);
-		return err;
+	length = hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
+	if (length < 0) {
+		dev_err(dev, "Failed to pack AVI infoframe: %d", length);
+		return length;
 	}
 
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
+	err = it6505_write_avi_infoframe(it6505, buffer, length);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -1625,6 +1636,18 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 			EN_AUD_CTRL_PKT);
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
 static void it6505_disable_audio(struct it6505 *it6505)
 {
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, EN_AUD_MUTE);
@@ -3302,6 +3325,85 @@ static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid_dup(it6505->cached_edid);
 }
 
+static int it6505_bridge_hdmi_audio_startup(struct drm_connector *connector,
+					    struct drm_bridge *bridge)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
+	if (!it6505->powered || it6505->enable_drv_hold)
+		return -EIO;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "Audio enable");
+	it6505_enable_audio(it6505);
+
+	return 0;
+}
+
+static int it6505_bridge_hdmi_audio_prepare(struct drm_connector *connector,
+					    struct drm_bridge *bridge,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+
+	return it6505_audio_setup_hw_params(it6505, hparms);
+}
+
+static void it6505_bridge_hdmi_audio_shutdown(struct drm_connector *connector,
+					      struct drm_bridge *bridge)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+
+	if (it6505->powered && !it6505->enable_drv_hold)
+		it6505_disable_audio(it6505);
+}
+
+static int it6505_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					      enum hdmi_infoframe_type type)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
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
+static int it6505_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
+					      enum hdmi_infoframe_type type,
+					      const u8 *buffer, size_t len)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
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
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -3315,6 +3417,12 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_post_disable = it6505_bridge_atomic_post_disable,
 	.detect = it6505_bridge_detect,
 	.edid_read = it6505_bridge_edid_read,
+	.hdmi_audio_startup = it6505_bridge_hdmi_audio_startup,
+	.hdmi_audio_prepare = it6505_bridge_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = it6505_bridge_hdmi_audio_shutdown,
+	.hdmi_clear_infoframe = it6505_bridge_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = it6505_bridge_hdmi_write_infoframe,
+
 };
 
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
@@ -3700,7 +3808,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-			     DRM_BRIDGE_OP_HPD;
+			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI;
+	it6505->bridge.vendor = "iTE";
+	it6505->bridge.product = "IT6505";
+	it6505->bridge.hdmi_audio_dev = dev;
+	it6505->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	it6505->bridge.hdmi_audio_dai_port = 1;
 	drm_bridge_add(&it6505->bridge);
 
 	return 0;

---
base-commit: fe003bcb69f7bff9ff2b30b659b004dbafe52907
change-id: 20250114-add-audio-codec-8c9d47062a6c

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


