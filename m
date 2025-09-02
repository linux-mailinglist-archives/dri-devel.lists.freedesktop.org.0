Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE5B3FA4E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9263D10E618;
	Tue,  2 Sep 2025 09:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="plDeZ6Hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755BC10E617
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756805288;
 bh=DJEgTveXx+nh3X2zirS8evwV7Zg17ZJfI1XFceEOvsc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=plDeZ6HrxNX2C/q5p3BHe1TkPU0Lea5RU6czuNfLVhtknWSnjblE75hMrtLzwKu37
 Q8iKK/WW/a5j/KSQeD8wId5AEc6fgSQzo/oAAA2VxYAgR4L5SLrZdt94BtI1xHitz4
 6Lc9YjqACRsoZ2SfiXT+YF0Y6g3xc1AZuJ2d5ONR2GzLnvUa1l8q0TgQupJXa+1r1X
 VS3Izs8F7LsSdeMfm3rHMmkwdoTLoz53bywuTZq649dwf1Er6kQPtMPKCPNWypcee/
 cfanGtMIsLDj8e5DkDEOJMoSpKPWI/kcopLTXFdT3trXWpJPyeShcFngmS0j6c977N
 xgufOIwyjS+EA==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D468417E1301;
 Tue,  2 Sep 2025 11:28:07 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Sep 2025 12:27:57 +0300
Subject: [PATCH 2/2] drm/rockchip: vop2: Support setting custom background
 color
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-rk3588-bgcolor-v1-2-fd97df91d89f@collabora.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
In-Reply-To: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
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

VOP2 allows configuring the background color of each video output port.

Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
which defaults to solid black, take it into account when programming the
hardware.

Note that only the 10 least significant bits of each color component are
used, as this is the maximum precision supported by the display
controller.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4020a7ffd57974070ed202cd8b838..7fe060e7e58297d583b1396cf606b7ba580b8e79 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1548,6 +1548,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
 	struct vop2 *vop2 = vp->vop2;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	u64 bgcolor = crtc->state->background_color;
 	u16 vtotal = mode->crtc_vtotal;
 	u16 hdisplay = mode->crtc_hdisplay;
 	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
@@ -1593,7 +1594,11 @@ static void vop2_post_config(struct drm_crtc *crtc)
 		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
 	}
 
-	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
+	/* Background color is programmed with 10 bits of precision */
+	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_RED(bgcolor));
+	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GREEN(bgcolor));
+	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_BLUE(bgcolor));
+	vop2_vp_write(vp, RK3568_VP_DSP_BG, val);
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
@@ -1972,6 +1977,10 @@ static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
 		   drm_get_bus_format_name(vcstate->bus_format));
 	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
 	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
+	seq_printf(s, "\tbackground color (10bpc): r=%x g=%x b=%x\n",
+		   DRM_ARGB64_RED(cstate->background_color),
+		   DRM_ARGB64_GREEN(cstate->background_color),
+		   DRM_ARGB64_BLUE(cstate->background_color));
 	seq_printf(s, "    Display mode: %dx%d%s%d\n",
 		   mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
 		   drm_mode_vrefresh(mode));
@@ -2461,6 +2470,8 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			return dev_err_probe(drm->dev, ret,
 					     "crtc init for video_port%d failed\n", i);
 
+		drm_crtc_attach_background_color_property(&vp->crtc);
+
 		drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
 		if (vop2->lut_regs) {
 			const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index fa5c56f16047e3493e82fbedaced221459696dcc..596558adc1207e837eb8eca49b35d7a55d693f88 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -659,6 +659,10 @@ enum dst_factor_mode {
 #define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV		GENMASK(3, 2)
 #define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV		GENMASK(1, 0)
 
+#define RK3568_VP_DSP_BG__DSP_BG_RED			GENMASK(29, 20)
+#define RK3568_VP_DSP_BG__DSP_BG_GREEN			GENMASK(19, 10)
+#define RK3568_VP_DSP_BG__DSP_BG_BLUE			GENMASK(9, 0)
+
 #define RK3568_VP_POST_SCL_CTRL__VSCALEDOWN		BIT(1)
 #define RK3568_VP_POST_SCL_CTRL__HSCALEDOWN		BIT(0)
 

-- 
2.51.0

