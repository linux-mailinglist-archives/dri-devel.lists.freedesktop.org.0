Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8FD8BE380
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC474112475;
	Tue,  7 May 2024 13:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LtpDn5fO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F40611247E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:19:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0633E6175F;
 Tue,  7 May 2024 13:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBFDC4AF67;
 Tue,  7 May 2024 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087939;
 bh=Mh8ZDhsVheuLAfspcFtEKofuu7c6omICQvztPDf1zMY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LtpDn5fOusFl9Gn5SMNcZvRELq2YUU/vvaQZjAoShp8uFLNt8Y6DRWG39m6jjMlvx
 tGKuqsrAjYcqW0qWFPTcrTGzf9/LhkvbRm/6FdM8YNGn4TcVn86s1E9PHejPDSYv5L
 A+mQMua20D+8Ym8jCfnTKOVrlysaTGRgCXsASHAr9+v+aEWqbBhSGD83uoRaSevXzA
 ozSjphICVQU4X9EzPuJAKdQN+KaGMb7T6yqbJTgtinMmTJJYtd7u/D2IiSscXGNYRO
 TuMv0MKGwqIpdqeKEPlFr0/W/LsoZ0XkU8f0KzSVUHbOFDdhZu1FK2PicXq99OumEC
 xFAD3bbVg0H/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:45 +0200
Subject: [PATCH v13 27/28] drm/rockchip: inno_hdmi: Switch to HDMI
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-27-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14344; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Mh8ZDhsVheuLAfspcFtEKofuu7c6omICQvztPDf1zMY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmp+1H85xbAzx9PO0d5hrEWjbwhcYtWo6c/akOa/TM
 sIfqR3umMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5ZsVY72f+PWmyKPPNOYVn
 1Fy9vNz8rU8/eNN7xnLzzP0ODQ4XDVfVVsnfW/j+nsmkLN4lyVnRjA0XTr5b8/gt09vOz7wMbf4
 fdzTv4d9gsPTAQpm670v0o350TGKZIf354OvkJj+Jvnbn18EA
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
 drivers/gpu/drm/rockchip/Kconfig       |   3 +
 drivers/gpu/drm/rockchip/inno_hdmi.c   | 153 ++++++++++++---------------------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |   3 +
 3 files changed, 61 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 1bf3e2829cd0..7df875e38517 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -72,10 +72,13 @@ config ROCKCHIP_DW_MIPI_DSI
 	  enable MIPI DSI on RK3288 or RK3399 based SoC, you should
 	  select this option.
 
 config ROCKCHIP_INNO_HDMI
 	bool "Rockchip specific extensions for Innosilicon HDMI"
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Innosilicon HDMI driver. If you want to enable
 	  HDMI on RK3036 based SoC, you should select this option.
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 3df2cfcf9998..5069403c3b80 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -20,10 +20,13 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
+
 #include "rockchip_drm_drv.h"
 
 #include "inno_hdmi.h"
 
 #define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
@@ -65,13 +68,11 @@ struct inno_hdmi {
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
@@ -255,90 +256,53 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
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
@@ -359,12 +323,12 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 	value = v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
 		v_VIDEO_OUTPUT_COLOR(0) |
 		v_VIDEO_INPUT_CSP(0);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
 
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		if (inno_conn_state->rgb_limited_range) {
+	if (conn_state->hdmi.output_format == HDMI_COLORSPACE_RGB) {
+		if (conn_state->hdmi.is_limited_range) {
 			csc_mode = CSC_RGB_0_255_TO_RGB_16_235_8BIT;
 			auto_csc = AUTO_CSC_DISABLE;
 			c0_c2_change = C0_C2_CHANGE_DISABLE;
 			csc_enable = v_CSC_ENABLE;
 
@@ -378,18 +342,18 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
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
@@ -460,14 +424,16 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 
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
 
@@ -477,26 +443,26 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
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
@@ -544,11 +510,11 @@ static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return;
 
-	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+	inno_hdmi_setup(hdmi, crtc_state, conn_state);
 }
 
 static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
 				      struct drm_atomic_state *state)
 {
@@ -561,11 +527,10 @@ static int
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
 
@@ -578,16 +543,11 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
@@ -627,16 +587,10 @@ inno_hdmi_connector_mode_valid(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
 	return  inno_hdmi_display_mode_valid(hdmi, mode);
 }
 
-static void inno_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static void
 inno_hdmi_connector_destroy_state(struct drm_connector *connector,
 				  struct drm_connector_state *state)
 {
 	struct inno_hdmi_connector_state *inno_conn_state =
@@ -658,14 +612,13 @@ static void inno_hdmi_connector_reset(struct drm_connector *connector)
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
@@ -687,17 +640,17 @@ inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = inno_hdmi_connector_detect,
-	.destroy = inno_hdmi_connector_destroy,
 	.reset = inno_hdmi_connector_reset,
 	.atomic_duplicate_state = inno_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = inno_hdmi_connector_destroy_state,
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
+	.atomic_check = drm_atomic_helper_connector_hdmi_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };
 
 static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
@@ -721,14 +674,18 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 
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
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 245b34adca5a..1c6cda2bfb14 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -24,10 +24,13 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
+
 #include "sun4i_backend.h"
 #include "sun4i_crtc.h"
 #include "sun4i_drv.h"
 #include "sun4i_hdmi.h"
 

-- 
2.45.0

