Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D387C65E65
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA7E10E1CA;
	Mon, 17 Nov 2025 19:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="EZq9WaAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04CE10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763406806; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z21pBSIEKUkTOJiB5hdGRgDrSUkip71Dp0v3zMyBa/QIV91Bd45ohaf2V25lHpjAFmJHncl76IBuNmkhzZGhIySDuo8NpWckdf43wSSTDwYbxBpobQrQ0eCc70k6STIuxKvZmsIe13NUrOIiOKK3rMgiGUwB8x+yVlIWzWlkhXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763406806;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Gs1lZySDkGpqwXxYZoOAuegaRpnGsTAvT6lpT/qhmRM=; 
 b=cpYIuOBubqMBGCEVmD8BaEQzteCMEQ0+il35O/s8LJ5DUQNuwg8JeEkpfT5tICHbVUDfAHiX7vcmZqAkPhV+8tJJzLz8FqHpSFmstFY1oLNde4Vwq+tVCI3vJo+b4/m5fhQSmrSJOEOvXOEUKrDBCRpYhliRzW7xHwgcIZ8/APk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406806; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Gs1lZySDkGpqwXxYZoOAuegaRpnGsTAvT6lpT/qhmRM=;
 b=EZq9WaACwM6nu+4207zjZ7BFLwIjrwdMyzWM0XlkTylKaYIqvf2uzfCzyI6nDfne
 iyyXiO/WxV665oIWV+zsMZ4XXeYKTTO9yDhTPabVp4RTUEqBuBhlj5W5u6y4ODqPWAT
 bAV3r+G3+tEMNB8rcuRWOCVuH2ry8WOtrCKrBhKg=
Received: by mx.zohomail.com with SMTPS id 1763406804770398.6739711663877;
 Mon, 17 Nov 2025 11:13:24 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:54 +0100
Subject: [PATCH v4 10/10] drm/rockchip: Implement "color format" DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-10-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
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
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Derek Foreman <derek.foreman@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
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

From: Derek Foreman <derek.foreman@collabora.com>

Register the color format property in the dw_hdmi_qp-rockchip driver,
and act on requested format changes as part of the connector state in
the vop2 video output driver.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  3 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   | 46 ++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h   |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7c294751de19..7028166fdace 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -635,6 +635,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+
 	return drm_connector_attach_encoder(connector, encoder);
 }
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..2fc9b21c5522 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1549,6 +1549,50 @@ static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
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
@@ -1600,6 +1644,8 @@ static void vop2_post_config(struct drm_crtc *crtc)
 	}
 
 	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
+
+	vop2_bcsh_config(crtc, vp);
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 9124191899ba..33fdc9d8d819 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -637,6 +637,8 @@ enum dst_factor_mode {
 
 #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN		BIT(15)
 
+#define RK3568_VP_BCSH_CTRL__BCSH_R2Y_EN		BIT(4)
+
 #define RK3568_VP_DSP_CTRL__STANDBY			BIT(31)
 #define RK3568_VP_DSP_CTRL__DSP_LUT_EN			BIT(28)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE		BIT(20)

-- 
2.51.2

