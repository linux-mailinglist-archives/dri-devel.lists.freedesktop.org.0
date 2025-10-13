Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5CBD5B5D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592BC10E4B6;
	Mon, 13 Oct 2025 18:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZIqy/f8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F020710E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760380054;
 bh=OjaGnhE1YRzI2qBgANQtDB/wf08RvwFcWVWJPhZ0r10=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZIqy/f8ce4ey+q3DZT67PAKC/UwrixfEUUM07CRPJek6JmOoGgTwfLQzDm7m5mVja
 +pMCZBEl9vP02G+okq+d8hMrdb/WSDxtpkYenyZPVVrWvVrtvQz9HSegQoohsIifwk
 d43hcco9H2/7TpY0BVluOtzcuDJqB8QG+q22bM4npU/ebSW7YEUoDLnf67kdoPRjnS
 w3uybTj0qfh416d7nAz4sBSfxACk10BihSsV3O58u0Urln8T/uJeC2z7v3pxTiB2D1
 rDthK7mpF9n4HZmS8Vt1d6YgvURfFEKvq4hhL67/9sqxDl53Qb1BsXdT6AedoCVdKB
 fRrJRk7Q+/sMg==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 71C4A17E1292;
 Mon, 13 Oct 2025 20:27:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 13 Oct 2025 21:27:19 +0300
Subject: [PATCH v2 2/2] drm/rockchip: vop2: Support setting custom
 background color
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-rk3588-bgcolor-v2-2-25cc3810ba8c@collabora.com>
References: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
In-Reply-To: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
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

The Rockchip VOP2 display controller allows configuring the background
color of each video output port.

Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
which defaults to solid black, take it into account when programming the
hardware.

Note that only the 10 least significant bits of each color component are
used, as this is the maximum precision allowed by the display
controller.  Moreover, the alpha component is not supported at all,
hence ignored.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4..a2589840b1df 100644
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
+	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR_BPC(bgcolor, 10));
+	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG_BPC(bgcolor, 10));
+	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB_BPC(bgcolor, 10));
+	vop2_vp_write(vp, RK3568_VP_DSP_BG, val);
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
@@ -1972,6 +1977,10 @@ static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
 		   drm_get_bus_format_name(vcstate->bus_format));
 	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
 	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
+	seq_printf(s, "\tbackground color (10bpc): r=0x%x g=0x%x b=0x%x\n",
+		   DRM_ARGB64_GETR_BPC(cstate->background_color, 10),
+		   DRM_ARGB64_GETG_BPC(cstate->background_color, 10),
+		   DRM_ARGB64_GETB_BPC(cstate->background_color, 10));
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
index 9124191899ba..37722652844a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -658,6 +658,10 @@ enum dst_factor_mode {
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

