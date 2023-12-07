Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283BF808C95
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105F510E90F;
	Thu,  7 Dec 2023 15:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612CC10E916
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:51:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C05CD62111;
 Thu,  7 Dec 2023 15:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182BEC433CA;
 Thu,  7 Dec 2023 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964282;
 bh=LzQARmdyZG/5BnUtRQEmceUDk93EvDyktXtd9V/8yHU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UVRm4/uTQ1DKUWgV0N94CBi/X1+yi/v9WupNu5axqha8f5KaxTJwdBW4BTlhGn2v0
 Y0NjFwa6J0tftABKAWCOWwz0gekhh79YeoHxGQW8HAEtZ2bSxD/JJpJlWV1jN36CBP
 Uc4nH9LiIJYxVxMRQ0UlgBV0zH5uDW8dnNqtLlpRX+/+Ag/iRhQezpR95GypPNSNbI
 D0xdTqcvN7c+XH5vd5lg5RfBWdFViFfnoUXZJSx0VmBUBAd1KXqGvkaaHh//DF/7m8
 DIG6Fps6sPfuNPAO8JyovvgOZqI7Wm9mqe+retYJUPIxTDePood8oPYzJVwZDuh1VB
 LxFek+3C9Wwxg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:50:02 +0100
Subject: [PATCH v5 39/44] drm/rockchip: inno_hdmi: Switch to HDMI connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-39-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6545; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LzQARmdyZG/5BnUtRQEmceUDk93EvDyktXtd9V/8yHU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9vVnXLnPYnesW3JD5G4Sb9XmbrpltbVrn4gnzjfS
 DIse3JaRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACay7wjDfw85UdUvc+96Xlml
 svd35usZjr0OVVnK6X/Eb59XDHrw+xEjw8qIiTx3NlfLm1axRsUVBj3zr3g8OX7CzFnpnqsVlz0
 8xwgA
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new HDMI connector infrastructure allows to remove some boilerplate,
especially to generate infoframes. Let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 86 ++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 0f3ec6eaf270..97fb4268bd7f 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -155,26 +155,29 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
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
@@ -182,38 +185,19 @@ static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
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
-	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
-
-	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
-}
+static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
+	.clear_infoframe	= inno_hdmi_disable_frame,
+	.write_infoframe	= inno_hdmi_upload_frame,
+};
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 {
@@ -292,9 +276,12 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 }
 
 static int inno_hdmi_setup(struct inno_hdmi *hdmi,
-			   struct drm_display_mode *mode)
+			   struct drm_crtc_state *new_crtc_state,
+			   struct drm_connector_state *new_conn_state)
 {
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_connector *connector = &hdmi->connector;
+	struct drm_display_info *display = &connector->display_info;
+	struct drm_display_mode *mode = &new_crtc_state->adjusted_mode;
 
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -308,8 +295,8 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (display->is_hdmi)
-		inno_hdmi_config_video_avi(hdmi, mode);
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector,
+							   new_conn_state->state);
 
 	/*
 	 * When IP controller have configured to an accurate video
@@ -317,7 +304,7 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
 	 * clock rate, and reconfigure the DDC clock.
 	 */
-	inno_hdmi_i2c_init(hdmi, mode->clock * 1000);
+	inno_hdmi_i2c_init(hdmi, new_conn_state->hdmi.tmds_char_rate);
 
 	/* Unmute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -341,7 +328,7 @@ static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 	if (WARN_ON(!crtc_state))
 		return;
 
-	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+	inno_hdmi_setup(hdmi, crtc_state, conn_state);
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
@@ -407,6 +394,12 @@ inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
 	return drm_helper_probe_single_connector_modes(connector, 1920, 1080);
 }
 
+static void inno_hdmi_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+}
+
 static void inno_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
@@ -417,12 +410,13 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 	.fill_modes = inno_hdmi_probe_single_connector_modes,
 	.detect = inno_hdmi_connector_detect,
 	.destroy = inno_hdmi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = inno_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
+	.atomic_check = drm_atomic_helper_connector_hdmi_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 };
 
@@ -449,10 +443,14 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 
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

