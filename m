Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA2875062
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2A61137B2;
	Thu,  7 Mar 2024 13:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sacIf3J/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0E91137B3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:40:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7ECF6CE139E;
 Thu,  7 Mar 2024 13:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DBAC433F1;
 Thu,  7 Mar 2024 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709818809;
 bh=OZcorIJO1o+v2FQ5fprPdjhHAZXbQyuEG8TtVbtTpnM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sacIf3J/IL3SBgYIUr+fPo3ey6F+yt7HPK4lVh1YKYjxqVjtO+EdF2f2ThOupwslQ
 xvgdHDkvcfsxEHtEXO0ZA+vnusbjO2OBAgRhPOPNvEvt0yI2/dUDDhbYlsWZAKrjt4
 vqU4sLSzWjw/14cgaB145RvGsMAvR+HnlIr6C3dD52bd0D1Pu72nYHr+p2mqDVg6f0
 Uv4Tr8aJhZhlRUjDgjoUGyjEpAPEndoF5Yn79OxqCSjwq6uYWoenShKpavGBo7ZcNG
 uE8tA1Xcp/NAZlrjlFOqmQLw5XHiOYM/YlfAz5Tx3m6Ng2hYk9fxXhNaG5cPQgArSY
 fP0Sa9wCog2jw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Mar 2024 14:38:53 +0100
Subject: [PATCH v8 26/27] drm/rockchip: inno_hdmi: Switch to HDMI connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-kms-hdmi-connector-state-v8-26-ef6a6f31964b@kernel.org>
References: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
In-Reply-To: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11744; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OZcorIJO1o+v2FQ5fprPdjhHAZXbQyuEG8TtVbtTpnM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKkvD2cXefL4Vy3YI9eS/eLt/srG9Or2DWtX7uexPdebH
 rmIY+KHjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkYALD/2LnZ992/2QwF1A7
 0v+Kfyarzw79BLe2d/d4vHkemPKdU2b4n/fW6dKa0y7FsxWFFx4OvF3Gq1G/tvjVdZYioU3hl/d
 95wUA
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 143 +++++++++++++----------------------
 1 file changed, 52 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 1d2261643743..d59947679042 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -65,13 +65,11 @@ struct inno_hdmi {
 	const struct inno_hdmi_variant *variant;
 };
 
 struct inno_hdmi_connector_state {
 	struct drm_connector_state	base;
-	unsigned int			enc_out_format;
 	unsigned int			colorimetry;
-	bool				rgb_limited_range;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
 {
 	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
@@ -255,90 +253,53 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
 	inno_hdmi_standby(hdmi);
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-				    enum hdmi_infoframe_type type)
+static int inno_hdmi_disable_frame(struct drm_connector *connector,
+				   enum hdmi_infoframe_type type)
 {
-	struct drm_connector *connector = &hdmi->connector;
-
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return;
-	}
-
-	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
-}
-
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
-{
-	struct drm_connector *connector = &hdmi->connector;
-	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-	ssize_t rc, i;
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
 			"Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
-	inno_hdmi_disable_frame(hdmi, type);
+	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 
-	rc = hdmi_infoframe_pack(frame, packed_frame,
-				 sizeof(packed_frame));
-	if (rc < 0)
-		return rc;
+	return 0;
+}
 
-	for (i = 0; i < rc; i++)
+static int inno_hdmi_upload_frame(struct drm_connector *connector,
+				  enum hdmi_infoframe_type type,
+				  const u8 *buffer, size_t len)
+{
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
+	ssize_t i;
+
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", type);
+		return 0;
+	}
+
+	inno_hdmi_disable_frame(connector, type);
+
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
 	struct drm_connector *connector = &hdmi->connector;
 	struct drm_connector_state *conn_state = connector->state;
@@ -359,12 +320,12 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 	value = v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
 		v_VIDEO_OUTPUT_COLOR(0) |
 		v_VIDEO_INPUT_CSP(0);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
 
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		if (inno_conn_state->rgb_limited_range) {
+	if (conn_state->hdmi.output_format == HDMI_COLORSPACE_RGB) {
+		if (!conn_state->hdmi.is_full_range) {
 			csc_mode = CSC_RGB_0_255_TO_RGB_16_235_8BIT;
 			auto_csc = AUTO_CSC_DISABLE;
 			c0_c2_change = C0_C2_CHANGE_DISABLE;
 			csc_enable = v_CSC_ENABLE;
 
@@ -378,18 +339,18 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
 			return 0;
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
 				csc_enable = v_CSC_ENABLE;
 			}
@@ -460,14 +421,16 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 
 	return 0;
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
 		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
 
@@ -477,26 +440,26 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	inno_hdmi_config_video_timing(hdmi, mode);
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (display->is_hdmi)
-		inno_hdmi_config_video_avi(hdmi, mode);
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector,
+							   new_conn_state->state);
 
 	/*
 	 * When IP controller have configured to an accurate video
 	 * timing, then the TMDS clock source would be switched to
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
 
 static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
@@ -544,11 +507,11 @@ static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return;
 
-	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+	inno_hdmi_setup(hdmi, crtc_state, conn_state);
 }
 
 static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
 				      struct drm_atomic_state *state)
 {
@@ -561,11 +524,10 @@ static int
 inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_connector_state *conn_state)
 {
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	u8 vic = drm_match_cea_mode(mode);
 	struct inno_hdmi_connector_state *inno_conn_state =
 					to_inno_hdmi_conn_state(conn_state);
 
@@ -578,16 +540,11 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	    vic == 17 || vic == 18)
 		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_601;
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
 	.atomic_check	= inno_hdmi_encoder_atomic_check,
 	.atomic_enable	= inno_hdmi_encoder_enable,
@@ -660,14 +617,13 @@ static void inno_hdmi_connector_reset(struct drm_connector *connector)
 	inno_conn_state = kzalloc(sizeof(*inno_conn_state), GFP_KERNEL);
 	if (!inno_conn_state)
 		return;
 
 	__drm_atomic_helper_connector_reset(connector, &inno_conn_state->base);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
 
 	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
-	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
-	inno_conn_state->rgb_limited_range = false;
 }
 
 static struct drm_connector_state *
 inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -696,10 +652,11 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 	.atomic_duplicate_state = inno_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = inno_hdmi_connector_destroy_state,
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
+	.atomic_check = drm_atomic_helper_connector_hdmi_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };
 
 static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
@@ -723,14 +680,18 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
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
 
 	return 0;
 }

-- 
2.43.2

