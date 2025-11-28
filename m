Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B31C93295
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6610E941;
	Fri, 28 Nov 2025 21:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="A19WYfmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394C510E93E;
 Fri, 28 Nov 2025 21:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764364062; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=grGoH9h1PdGRRJ3pOURX10ptElYtOElY974w2MJ/iJH02y/xfwCRz1gbwRGuc/wuA7lj/zQjV3oIc8ej0UMFDo3j3oL23IFiCWqnK1yWDrNLmfqCCPHIXV5Dy4CWuIfEQP0vAMDnwY50aXU4a1s+AMIC6Lznas6i+aNpsJ7TEK8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764364062;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=t9MOLGQnjIX0i6MWMRJ3Uvi+d7WdDeCX9ytBsMIm2YI=; 
 b=CYfBc4MsjWzggFnQXVavpzzbVStLdISfZglLeeQQhtG2rMbSvHdssYCl+0EVeSsMfcmHJXIEgpS5uK+lTmKNmbDW9uO04auTgy0mlHHEXmIJMDqzEqDEk/axJ2YVUMSvtwiDZ7AL1Gc4spxtGK32AU/c+4HzArKpJ5Mnjhfp7Jo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764364062; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=t9MOLGQnjIX0i6MWMRJ3Uvi+d7WdDeCX9ytBsMIm2YI=;
 b=A19WYfmmuZJQz5hKGgA2rAC1mCnirw/J0aOZzV92pMI9HVQPBcvOXqxaqSHnVma8
 rU6eprfShFmVka2xK6CiKK70HatTZaZTNkTUbRjzGLXih8gJkp9t6vXmnjqAimE38dG
 XxsaBlXr4m0RafDUHinG68EEFAvvBcJAmYhS5ny8=
Received: by mx.zohomail.com with SMTPS id 1764364060044867.1068385253593;
 Fri, 28 Nov 2025 13:07:40 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:50 +0100
Subject: [PATCH v5 14/17] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-14-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

Switch between requested color formats by setting the right bus formats,
configuring the VO GRF registers, and setting the right output mode.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 61 ++++++++++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h    |  1 +
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c9fe6aa3e3e3..c79ebd9e866c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -135,24 +136,70 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
-	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
+	struct drm_display_info *info = &conn_state->connector->display_info;
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
 	union phy_configure_opts phy_cfg = {};
 	int ret;
 
 	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
-	    s->output_bpc == conn_state->hdmi.output_bpc)
+	    s->output_bpc == conn_state->hdmi.output_bpc &&
+	    s->color_format == conn_state->color_format)
 		return 0;
 
+	if (conn_state->color_format &&
+	    !(info->color_formats & conn_state->color_format))
+		return -EINVAL;
+
+	switch (conn_state->color_format) {
+	case DRM_COLOR_FORMAT_AUTO:
+	case DRM_COLOR_FORMAT_RGB444:
+		if (conn_state->hdmi.output_bpc == 8)
+			s->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		else if (conn_state->hdmi.output_bpc == 10)
+			s->bus_format = MEDIA_BUS_FMT_RGB101010_1X30;
+		else
+			return -EINVAL;
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		if (conn_state->hdmi.output_bpc == 8)
+			s->bus_format = MEDIA_BUS_FMT_YUV8_1X24;
+		else if (conn_state->hdmi.output_bpc == 10)
+			s->bus_format = MEDIA_BUS_FMT_YUV10_1X30;
+		else
+			return -EINVAL;
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		if (conn_state->hdmi.output_bpc == 8)
+			s->bus_format = MEDIA_BUS_FMT_YUYV8_1X16;
+		else /* 10 bpc possible, but currently busted */
+			return -EINVAL;
+		s->output_mode = ROCKCHIP_OUT_MODE_YUV422;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		if (conn_state->hdmi.output_bpc == 8)
+			s->bus_format = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+		else if (conn_state->hdmi.output_bpc == 10)
+			s->bus_format = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		else
+			return -EINVAL;
+		s->output_mode = ROCKCHIP_OUT_MODE_YUV420;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
-		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		s->output_type = DRM_MODE_CONNECTOR_HDMIA;
 		s->output_bpc = conn_state->hdmi.output_bpc;
+		s->color_format = conn_state->color_format;
 	} else {
 		dev_err(hdmi->dev, "Failed to configure phy: %d\n", ret);
 	}
@@ -391,6 +438,8 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,
 				       struct rockchip_crtc_state *state)
 {
+	enum hdmi_colorspace color =
+		drm_color_format_to_hdmi_colorspace(state->color_format);
 	u32 val;
 
 	if (state->output_bpc == 10)
@@ -398,12 +447,16 @@ static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,
 	else
 		val = FIELD_PREP_WM16(RK3576_COLOR_DEPTH_MASK, RK3576_8BPC);
 
+	val |= FIELD_PREP_WM16(RK3576_COLOR_FORMAT_MASK, color);
+
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON8, val);
 }
 
 static void dw_hdmi_qp_rk3588_enc_init(struct rockchip_hdmi_qp *hdmi,
 				       struct rockchip_crtc_state *state)
 {
+	enum hdmi_colorspace color =
+		drm_color_format_to_hdmi_colorspace(state->color_format);
 	u32 val;
 
 	if (state->output_bpc == 10)
@@ -411,6 +464,8 @@ static void dw_hdmi_qp_rk3588_enc_init(struct rockchip_hdmi_qp *hdmi,
 	else
 		val = FIELD_PREP_WM16(RK3588_COLOR_DEPTH_MASK, RK3588_8BPC);
 
+	val |= FIELD_PREP_WM16(RK3588_COLOR_FORMAT_MASK, color);
+
 	regmap_write(hdmi->vo_regmap,
 		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
 		     val);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 4705dc6b8bd7..2549e58f3497 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -57,6 +57,7 @@ struct rockchip_crtc_state {
 	u32 bus_format;
 	u32 bus_flags;
 	int color_space;
+	enum drm_color_format color_format;
 };
 #define to_rockchip_crtc_state(s) \
 		container_of(s, struct rockchip_crtc_state, base)

-- 
2.52.0

