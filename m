Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86010B53334
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0786710EB29;
	Thu, 11 Sep 2025 13:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OBSc1qGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56410EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596064;
 bh=naEX153HUEAIxi6iZK0ya+LCDWN969qBnFaCmm9jFIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OBSc1qGBDTTQI7C8EotUmk1geVEhMBvxXeLHjS1Wt7m2DdBkIN6Gl/vOuOikiTYWu
 jelK3GMKiDEIP1cH7Q3brWBkyhYsh+sIiBX4dfb30DMETrRIz4UFN10ij4Pyobo61V
 h3m2y2Lkh7qWJRwAn4vEsYhRePUeKlen+PqVrW3i0aOdhZln8bDbQlwH4LQCtRd11p
 dOMJ9znz7sf+cr9oI9wCAeeOQM8lHoGaXiSmABQ4mgFierk/BJyEa3JFLrKrwt3b+O
 236opMvoGbwoun60scJDzQAOUca425q4v4NYeNkkMLrYwukFxBWbguitPgSdLSP7Na
 Ux+nQVLq7PwfA==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F0DD017E129D;
 Thu, 11 Sep 2025 15:07:43 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 8/8] drm/rockchip: Implement "color format" DRM property
Date: Thu, 11 Sep 2025 16:07:39 +0300
Message-ID: <20250911130739.4936-9-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250911130739.4936-1-marius.vlad@collabora.com>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Derek Foreman <derek.foreman@collabora.com>

This adds YUV444 and Auto, which will fallback to RGB as per
commit "drm: Pass supported color formats straight onto drm_bridge".

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 10 +++-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |  8 ++++
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  8 ++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 46 +++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  2 +
 5 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 58e24669ef34..794b8de9c9c5 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -427,6 +427,11 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
 
+static const u32 supported_colorformats =
+       DRM_COLOR_FORMAT_AUTO |
+       DRM_COLOR_FORMAT_RGB444 |
+       DRM_COLOR_FORMAT_YCBCR444;
+
 static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
@@ -563,13 +568,16 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	connector = drm_bridge_connector_init(drm, encoder, BIT(HDMI_COLORSPACE_RGB));
+	connector = drm_bridge_connector_init(drm, encoder, supported_colorformats);
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
 		return ret;
 	}
 
+	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+
 	return drm_connector_attach_encoder(connector, encoder);
 }
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 1ab3ad4bde9e..59f0f055cdf1 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -810,6 +810,11 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	return 0;
 }
 
+static const u32 supported_colorformats =
+       DRM_COLOR_FORMAT_AUTO |
+       DRM_COLOR_FORMAT_RGB444 |
+       DRM_COLOR_FORMAT_YCBCR444;
+
 static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 			   struct drm_atomic_state *state)
 {
@@ -826,6 +831,9 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	if (WARN_ON(!new_crtc_state))
 		return -EINVAL;
 
+	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
 		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a..4794ab334cb2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -302,6 +302,11 @@ static void rk3066_hdmi_config_phy(struct rk3066_hdmi *hdmi)
 	}
 }
 
+static const u32 supported_colorformats =
+       DRM_COLOR_FORMAT_AUTO |
+       DRM_COLOR_FORMAT_RGB444 |
+       DRM_COLOR_FORMAT_YCBCR444;
+
 static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 			     struct drm_atomic_state *state)
 {
@@ -322,6 +327,9 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	if (WARN_ON(!new_crtc_state))
 		return -EINVAL;
 
+	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+
 	display = &connector->display_info;
 	mode = &new_crtc_state->adjusted_mode;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 186f6452a7d3..5634e59a6412 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1543,6 +1543,50 @@ static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
 				DITHER_DOWN_ALLEGRO);
 }
 
+static void vop2_bcsh_config(struct drm_crtc *crtc, struct vop2_video_port *vp)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	u32 format = 0;
+	enum drm_colorspace colorspace = 0;
+	u32 val = 0;
+
+	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (!(crtc->state->connector_mask & drm_connector_mask(connector)))
+			continue;
+
+		format = connector->state->color_format;
+		colorspace = connector->state->colorspace;
+		break;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (format == DRM_COLOR_FORMAT_YCBCR420 ||
+	    format == DRM_COLOR_FORMAT_YCBCR444 ||
+	    format == DRM_COLOR_FORMAT_YCBCR422) {
+		val = RK3568_VP_BCSH_CTRL__BCSH_R2Y_EN | BIT(7);
+
+		switch (colorspace) {
+		case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		case DRM_MODE_COLORIMETRY_BT2020_YCC:
+			val |= BIT(7) | BIT(6);
+			break;
+		case DRM_MODE_COLORIMETRY_BT709_YCC:
+			val |= BIT(6);
+			break;
+		default:
+			break;
+		}
+		if (colorspace == DRM_MODE_COLORIMETRY_BT2020_RGB ||
+		    colorspace == DRM_MODE_COLORIMETRY_BT2020_YCC)
+			val |= BIT(6);
+	}
+
+	vop2_vp_write(vp, RK3568_VP_BCSH_CTRL, val);
+	vop2_vp_write(vp, RK3568_VP_BCSH_COLOR_BAR, 0);
+}
+
 static void vop2_post_config(struct drm_crtc *crtc)
 {
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
@@ -1594,6 +1638,8 @@ static void vop2_post_config(struct drm_crtc *crtc)
 	}
 
 	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
+
+	vop2_bcsh_config(crtc, vp);
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index fa5c56f16047..0b589f326093 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -638,6 +638,8 @@ enum dst_factor_mode {
 
 #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN		BIT(15)
 
+#define RK3568_VP_BCSH_CTRL__BCSH_R2Y_EN		BIT(4)
+
 #define RK3568_VP_DSP_CTRL__STANDBY			BIT(31)
 #define RK3568_VP_DSP_CTRL__DSP_LUT_EN			BIT(28)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE		BIT(20)
-- 
2.47.2

