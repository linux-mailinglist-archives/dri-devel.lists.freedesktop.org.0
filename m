Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22185147E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E529E10ED58;
	Mon, 12 Feb 2024 13:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VHrn8z6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEE610ED58
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2ABD60FA2;
 Mon, 12 Feb 2024 13:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C53C433F1;
 Mon, 12 Feb 2024 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707743697;
 bh=bRreKbUecy/+FkVCukXu2mCUkHjtO1oSNdav7rsrWtg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VHrn8z6MsU/NNdmuTqFxHpyWs0FHGJ6vYy5hhzwWKrr60LPTMs/M8YSvtokZh5ltr
 zpgFWy8+F5EUaK4WdhphGh8YyfBXjO9ZVVjNoWmqowzB/F7B31jjmeFzp3m8WNNDcC
 943QWpUPFb5IIqZ2GZk5fX1YoJHbNR0lCBoyM57JdrBxsuL4WTKou76uiHg9Ezxa7A
 eyo8zDv1EfGApe9gcNG5jviYUhgzjXZrFvLRxdiLKAtFDUjjJRmVo/R1C+ox5bwep8
 YiZGEvY4XfKp64lEhDt4jUOVD+xgGt1qWG49m8CEgEmoLPiNneMjy1NX3FJSKr0jAy
 SNtcAuwr89ecQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:13:14 +0100
Subject: [PATCH v6 31/36] drm/rockchip: inno_hdmi: Switch to HDMI connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-31-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9853; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bRreKbUecy/+FkVCukXu2mCUkHjtO1oSNdav7rsrWtg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJAsF5/AHvwkzbnB0b3E2KfOYU7ZVz+OQFZOk7zwtB
 5uqivUdpSwMYlwMsmKKLDHC5kviTs163cnGNw9mDisTyBAGLk4BmMjLIob/KdIHnA62/RdnPbR7
 m8T89+oTqtmfnL5p9rn8tsjEqAKeGkaGFc8+ulyV1c1orT7yeHO9gMG+f7/uPvhwTnvxZ6850s2
 NPAA=
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

The new HDMI connector infrastructure allows to remove some boilerplate,
especially to generate infoframes. Let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 123 ++++++++++++-----------------------
 1 file changed, 42 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 1d2261643743..d59947679042 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -67,9 +67,7 @@ struct inno_hdmi {
 
 struct inno_hdmi_connector_state {
 	struct drm_connector_state	base;
-	unsigned int			enc_out_format;
 	unsigned int			colorimetry;
-	bool				rgb_limited_range;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -257,26 +255,29 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_standby(hdmi);
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-				    enum hdmi_infoframe_type type)
+static int inno_hdmi_disable_frame(struct drm_connector *connector,
+				   enum hdmi_infoframe_type type)
 {
-	struct drm_connector *connector = &hdmi->connector;
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
 			"Unsupported infoframe type: %u\n", type);
-		return;
+		return 0;
 	}
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
+
+	return 0;
 }
 
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
+static int inno_hdmi_upload_frame(struct drm_connector *connector,
+				  enum hdmi_infoframe_type type,
+				  const u8 *buffer, size_t len)
 {
-	struct drm_connector *connector = &hdmi->connector;
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-	ssize_t rc, i;
+	ssize_t i;
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
@@ -284,59 +285,19 @@ static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
 		return 0;
 	}
 
-	inno_hdmi_disable_frame(hdmi, type);
+	inno_hdmi_disable_frame(connector, type);
 
-	rc = hdmi_infoframe_pack(frame, packed_frame,
-				 sizeof(packed_frame));
-	if (rc < 0)
-		return rc;
-
-	for (i = 0; i < rc; i++)
+	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
 			    packed_frame[i]);
 
 	return 0;
 }
 
-static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
-				      struct drm_display_mode *mode)
-{
-	struct drm_connector *connector = &hdmi->connector;
-	struct drm_connector_state *conn_state = connector->state;
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
-	union hdmi_infoframe frame;
-	int rc;
-
-	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						      &hdmi->connector,
-						      mode);
-	if (rc) {
-		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
-		return rc;
-	}
-
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
-	else if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV422)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
-	else
-		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
-
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		drm_hdmi_avi_infoframe_quant_range(&frame.avi,
-						   connector, mode,
-						   inno_conn_state->rgb_limited_range ?
-						   HDMI_QUANTIZATION_RANGE_LIMITED :
-						   HDMI_QUANTIZATION_RANGE_FULL);
-	} else {
-		frame.avi.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
-		frame.avi.ycc_quantization_range =
-			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
-	}
-
-	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
-}
+static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
+	.clear_infoframe	= inno_hdmi_disable_frame,
+	.write_infoframe	= inno_hdmi_upload_frame,
+};
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 {
@@ -361,8 +322,8 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 		v_VIDEO_INPUT_CSP(0);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
 
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		if (inno_conn_state->rgb_limited_range) {
+	if (conn_state->hdmi.output_format == HDMI_COLORSPACE_RGB) {
+		if (!conn_state->hdmi.is_full_range) {
 			csc_mode = CSC_RGB_0_255_TO_RGB_16_235_8BIT;
 			auto_csc = AUTO_CSC_DISABLE;
 			c0_c2_change = C0_C2_CHANGE_DISABLE;
@@ -380,14 +341,14 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 		}
 	} else {
 		if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
-			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
+			if (conn_state->hdmi.output_format == HDMI_COLORSPACE_YUV444) {
 				csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
 				auto_csc = AUTO_CSC_DISABLE;
 				c0_c2_change = C0_C2_CHANGE_DISABLE;
 				csc_enable = v_CSC_ENABLE;
 			}
 		} else {
-			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
+			if (conn_state->hdmi.output_format == HDMI_COLORSPACE_YUV444) {
 				csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
 				auto_csc = AUTO_CSC_DISABLE;
 				c0_c2_change = C0_C2_CHANGE_DISABLE;
@@ -462,10 +423,12 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 }
 
 static int inno_hdmi_setup(struct inno_hdmi *hdmi,
-			   struct drm_display_mode *mode)
+			   struct drm_crtc_state *new_crtc_state,
+			   struct drm_connector_state *new_conn_state)
 {
-	struct drm_display_info *display = &hdmi->connector.display_info;
-	unsigned long mpixelclock = mode->clock * 1000;
+	struct drm_connector *connector = &hdmi->connector;
+	struct drm_display_info *display = &connector->display_info;
+	struct drm_display_mode *mode = &new_crtc_state->adjusted_mode;
 
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -479,8 +442,8 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (display->is_hdmi)
-		inno_hdmi_config_video_avi(hdmi, mode);
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector,
+							   new_conn_state->state);
 
 	/*
 	 * When IP controller have configured to an accurate video
@@ -488,13 +451,13 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
 	 * clock rate, and reconfigure the DDC clock.
 	 */
-	inno_hdmi_i2c_init(hdmi, mpixelclock);
+	inno_hdmi_i2c_init(hdmi, new_conn_state->hdmi.tmds_char_rate);
 
 	/* Unmute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
 		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
 
-	inno_hdmi_power_up(hdmi, mpixelclock);
+	inno_hdmi_power_up(hdmi, new_conn_state->hdmi.tmds_char_rate);
 
 	return 0;
 }
@@ -546,7 +509,7 @@ static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 	if (WARN_ON(!crtc_state))
 		return;
 
-	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+	inno_hdmi_setup(hdmi, crtc_state, conn_state);
 }
 
 static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
@@ -563,7 +526,6 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_connector_state *conn_state)
 {
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	u8 vic = drm_match_cea_mode(mode);
 	struct inno_hdmi_connector_state *inno_conn_state =
@@ -580,12 +542,7 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	else
 		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
 
-	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
-	inno_conn_state->rgb_limited_range =
-		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
-
-	return  inno_hdmi_display_mode_valid(hdmi,
-				&crtc_state->adjusted_mode) == MODE_OK ? 0 : -EINVAL;
+	return 0;
 }
 
 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
@@ -662,10 +619,9 @@ static void inno_hdmi_connector_reset(struct drm_connector *connector)
 		return;
 
 	__drm_atomic_helper_connector_reset(connector, &inno_conn_state->base);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
 
 	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
-	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
-	inno_conn_state->rgb_limited_range = false;
 }
 
 static struct drm_connector_state *
@@ -698,6 +654,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
+	.atomic_check = drm_atomic_helper_connector_hdmi_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };
@@ -725,10 +682,14 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &inno_hdmi_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, &hdmi->connector,
-				    &inno_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
+	drmm_connector_hdmi_init(drm, &hdmi->connector,
+				 "Rockchip", "Inno HDMI",
+				 &inno_hdmi_connector_funcs,
+				 &inno_hdmi_hdmi_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA,
+				 hdmi->ddc,
+				 BIT(HDMI_COLORSPACE_RGB),
+				 8);
 
 	drm_connector_attach_encoder(&hdmi->connector, encoder);
 

-- 
2.43.0

