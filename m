Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5D321DEA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 18:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69616E570;
	Mon, 22 Feb 2021 17:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD7189F49
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:13:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id BB2D61F451E1
Received: by jupiter.universe (Postfix, from userid 1000)
 id 5269E4800DC; Mon, 22 Feb 2021 18:12:51 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCHv1 2/6] drm/imx: Add 8 pixel alignment fix
Date: Mon, 22 Feb 2021 18:12:43 +0100
Message-Id: <20210222171247.97609-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222171247.97609-1-sebastian.reichel@collabora.com>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Feb 2021 17:16:54 +0000
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some standard resolutions like 1366x768 do not work properly with
i.MX6 SoCs, since the horizontal resolution needs to be aligned
to 8 pixels (so 1360x768 or 1368x768 would work).

This patch allocates framebuffers allocated to 8 pixels. The extra
time required to send the extra pixels are removed from the blank
time. In order to expose the correct display size to userspace,
the stride is increased without increasing the width.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/imx/imx-ldb.c      |  5 +++++
 drivers/gpu/drm/imx/ipuv3-crtc.c   | 11 ++++++++++-
 drivers/gpu/drm/imx/ipuv3-plane.c  | 19 +++++++++++++++----
 drivers/gpu/ipu-v3/ipu-dc.c        |  5 +++++
 drivers/gpu/ipu-v3/ipu-di.c        |  7 +++++++
 6 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index d1a9841adeed..1bcf740b7f4f 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -145,9 +145,26 @@ static const struct drm_ioctl_desc imx_drm_ioctls[] = {
 	/* none so far */
 };
 
+static int imx_drm_dumb_create(struct drm_file *file_priv,
+			       struct drm_device *drm,
+			       struct drm_mode_create_dumb *args)
+{
+	u32 width = args->width;
+	int ret;
+
+	args->width = ALIGN(width, 8);
+
+	ret = drm_gem_cma_dumb_create(file_priv, drm, args);
+	if (ret)
+		return ret;
+
+	args->width = width;
+	return ret;
+}
+
 static const struct drm_driver imx_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
-	DRM_GEM_CMA_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(imx_drm_dumb_create),
 	.ioctls			= imx_drm_ioctls,
 	.num_ioctls		= ARRAY_SIZE(imx_drm_ioctls),
 	.fops			= &imx_drm_driver_fops,
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 41e2978cb1eb..9c7710c719d7 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -257,6 +257,11 @@ imx_ldb_encoder_atomic_mode_set(struct drm_encoder *encoder,
 			 "%s: mode exceeds 85 MHz pixel clock\n", __func__);
 	}
 
+	if (!IS_ALIGNED(mode->hdisplay, 8)) {
+		dev_warn(ldb->dev,
+			 "%s: hdisplay does not align to 8 byte\n", __func__);
+	}
+
 	if (dual) {
 		serial_clk = 3500UL * mode->clock;
 		imx_ldb_set_clock(ldb, mux, 0, serial_clk, di_clk);
diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index 7ebd99ee3240..1ab970bcd52b 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -305,10 +305,19 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	sig_cfg.vsync_pin = imx_crtc_state->di_vsync_pin;
 
 	drm_display_mode_to_videomode(mode, &sig_cfg.mode);
+	if (!IS_ALIGNED(sig_cfg.mode.hactive, 8)) {
+		unsigned int new_hactive = ALIGN(sig_cfg.mode.hactive, 8);
+
+		dev_warn(ipu_crtc->dev, "8-pixel align hactive %d -> %d\n",
+			 sig_cfg.mode.hactive, new_hactive);
+
+		sig_cfg.mode.hfront_porch = new_hactive - sig_cfg.mode.hactive;
+		sig_cfg.mode.hactive = new_hactive;
+	}
 
 	ipu_dc_init_sync(ipu_crtc->dc, ipu_crtc->di,
 			 mode->flags & DRM_MODE_FLAG_INTERLACE,
-			 imx_crtc_state->bus_format, mode->hdisplay);
+			 imx_crtc_state->bus_format, sig_cfg.mode.hactive);
 	ipu_di_init_sync_panel(ipu_crtc->di, &sig_cfg);
 }
 
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 8a4235d9d9f1..5dd43e8c4d9e 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -29,6 +29,11 @@ to_ipu_plane_state(struct drm_plane_state *p)
 	return container_of(p, struct ipu_plane_state, base);
 }
 
+static unsigned int ipu_src_rect_width(const struct drm_plane_state *state)
+{
+	return ALIGN(drm_rect_width(&state->src) >> 16, 8);
+}
+
 static inline struct ipu_plane *to_ipu_plane(struct drm_plane *p)
 {
 	return container_of(p, struct ipu_plane, base);
@@ -418,6 +423,12 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	if (old_fb && fb->pitches[0] != old_fb->pitches[0])
 		crtc_state->mode_changed = true;
 
+	if (ALIGN(fb->width, 8) * fb->format->cpp[0] >
+	    fb->pitches[0] + fb->offsets[0]) {
+		dev_warn(dev, "pitch is not big enough for 8 pixels alignment");
+		return -EINVAL;
+	}
+
 	switch (fb->format->format) {
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
@@ -590,7 +601,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	if (ipu_state->use_pre) {
 		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
 		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
-					  drm_rect_width(&state->src) >> 16,
+					  ipu_src_rect_width(state),
 					  drm_rect_height(&state->src) >> 16,
 					  fb->pitches[0], fb->format->format,
 					  fb->modifier, &eba);
@@ -623,9 +634,9 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		break;
 	}
 
-	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, drm_rect_width(dst));
+	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, ALIGN(drm_rect_width(dst), 8));
 
-	width = drm_rect_width(&state->src) >> 16;
+	width = ipu_src_rect_width(state);
 	height = drm_rect_height(&state->src) >> 16;
 	info = drm_format_info(fb->format->format);
 	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
@@ -689,7 +700,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 		ipu_cpmem_zero(ipu_plane->alpha_ch);
 		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
-					 drm_rect_width(&state->src) >> 16,
+					 ipu_src_rect_width(state),
 					 drm_rect_height(&state->src) >> 16);
 		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
 		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
diff --git a/drivers/gpu/ipu-v3/ipu-dc.c b/drivers/gpu/ipu-v3/ipu-dc.c
index 34b4075a6a8e..ca96b235491a 100644
--- a/drivers/gpu/ipu-v3/ipu-dc.c
+++ b/drivers/gpu/ipu-v3/ipu-dc.c
@@ -167,6 +167,11 @@ int ipu_dc_init_sync(struct ipu_dc *dc, struct ipu_di *di, bool interlaced,
 
 	dc->di = ipu_di_get_num(di);
 
+	if (!IS_ALIGNED(width, 8)) {
+		dev_warn(priv->dev,
+			 "%s: hactive does not align to 8 byte\n", __func__);
+	}
+
 	map = ipu_bus_format_to_map(bus_format);
 
 	/*
diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c
index b4a31d506fcc..f914e794a64e 100644
--- a/drivers/gpu/ipu-v3/ipu-di.c
+++ b/drivers/gpu/ipu-v3/ipu-di.c
@@ -510,6 +510,13 @@ int ipu_di_adjust_videomode(struct ipu_di *di, struct videomode *mode)
 {
 	u32 diff;
 
+	if (!IS_ALIGNED(mode->hactive, 8) &&
+	    mode->hfront_porch < ALIGN(mode->hactive, 8) - mode->hactive) {
+		dev_err(di->ipu->dev, "hactive %d is not aligned to 8 and front porch is too small to compensate\n",
+			mode->hactive);
+		return -EINVAL;
+	}
+
 	if (mode->vfront_porch >= 2)
 		return 0;
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
