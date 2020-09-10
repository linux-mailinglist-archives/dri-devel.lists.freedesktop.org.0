Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56257265CE5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141C06E9A9;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477F6E122
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 16:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 5B83C29B802
Received: by jupiter.universe (Postfix, from userid 1000)
 id A4C68480114; Thu, 10 Sep 2020 18:28:45 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCHv1] gpu: ipu-v3: Add 8 pixel alignment fix
Date: Thu, 10 Sep 2020 18:28:31 +0200
Message-Id: <20200910162831.321556-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some standard (but unusual) resolutions like 1366x768 do not work
properly with i.MX6 SoCs, since the horizontal resolution needs to
be aligned to 8 pixels (so 1360x768 or 1368x768 work).

This patch allocates framebuffers allocated to 8 pixels. The extra
time required to send the additional pixels is removed from the blank
time. In order to expose the correct display size to userspace, the
stride is increased without increasing the width.

Without this patch, system hangs on an imx6dl board with 1366x768
panel connected via LVDS (and will be rebooted by watchdog). Last
message printed by a kernel at default loglevel is:

[    1.876609] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsystem on minor 1

After this patch the system boots fine and it is possible to start
X.org and Weston from Debian testing.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Hi,

I could not find much about the 8 pixel requirement in the datasheets,
but the problem is real and the NXP kernel has an alignment fix for
this. I think this was not yet detected because resolutions with width
not being a multiply of 8 are not that common.

PS: I'm on vacation for two weeks, so take your time reviewing this
and don't expect timely replies from me :)

-- Sebastian
---
 drivers/gpu/drm/imx/imx-drm-core.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/imx/ipuv3-crtc.c   | 11 ++++++++++-
 drivers/gpu/drm/imx/ipuv3-plane.c  | 18 ++++++++++++++----
 drivers/gpu/ipu-v3/ipu-dc.c        |  5 +++++
 drivers/gpu/ipu-v3/ipu-di.c        |  7 +++++++
 5 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 7d00c49fd5a5..c4d904ecb517 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -144,9 +144,33 @@ static const struct drm_ioctl_desc imx_drm_ioctls[] = {
 	/* none so far */
 };
 
+static int imx_drm_dumb_create(struct drm_file *file_priv,
+			       struct drm_device *drm,
+			       struct drm_mode_create_dumb *args)
+{
+	u32 width = args->width;
+	int ret;
+
+	/*
+	 * Width must be multiple of 8 pixels or system will hang. This
+	 * generates a big enough buffer, so that we can send a few 'dead'
+	 * pixels to satisfy this requirement. Userspace is supposed to
+	 * see 'correct' panel resolution instead, so that it does not
+	 * render content into non-visible pixels.
+	 */
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
 static struct drm_driver imx_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
-	DRM_GEM_CMA_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(imx_drm_dumb_create),
 	.ioctls			= imx_drm_ioctls,
 	.num_ioctls		= ARRAY_SIZE(imx_drm_ioctls),
 	.fops			= &imx_drm_driver_fops,
diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index d412fc265395..87a408e77694 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -301,10 +301,19 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	sig_cfg.vsync_pin = imx_crtc_state->di_vsync_pin;
 
 	drm_display_mode_to_videomode(mode, &sig_cfg.mode);
+	if (!IS_ALIGNED(sig_cfg.mode.hactive, 8)) {
+		unsigned int new_hactive = ALIGN(sig_cfg.mode.hactive, 8);
+
+		dev_info(ipu_crtc->dev, "8-pixel alignment change hactive %d -> %d\n",
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
index 6776ebb3246d..3e33dc59f454 100644
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
@@ -418,6 +423,11 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	if (old_fb && fb->pitches[0] != old_fb->pitches[0])
 		crtc_state->mode_changed = true;
 
+	if (ALIGN(fb->width, 8) * fb->format->cpp[0] > fb->pitches[0] + fb->offsets[0]) {
+		dev_warn(dev, "pitch is not big enough for 8 pixels alignment");
+		return -EINVAL;
+	}
+
 	switch (fb->format->format) {
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
@@ -590,7 +600,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	if (ipu_state->use_pre) {
 		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
 		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
-					  drm_rect_width(&state->src) >> 16,
+					  ipu_src_rect_width(state),
 					  drm_rect_height(&state->src) >> 16,
 					  fb->pitches[0], fb->format->format,
 					  fb->modifier, &eba);
@@ -623,9 +633,9 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		break;
 	}
 
-	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, drm_rect_width(dst));
+	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, ALIGN(drm_rect_width(dst), 8));
 
-	width = drm_rect_width(&state->src) >> 16;
+	width = ipu_src_rect_width(state);
 	height = drm_rect_height(&state->src) >> 16;
 	info = drm_format_info(fb->format->format);
 	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
@@ -689,7 +699,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 		ipu_cpmem_zero(ipu_plane->alpha_ch);
 		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
-					 drm_rect_width(&state->src) >> 16,
+					 ipu_src_rect_width(state),
 					 drm_rect_height(&state->src) >> 16);
 		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
 		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
diff --git a/drivers/gpu/ipu-v3/ipu-dc.c b/drivers/gpu/ipu-v3/ipu-dc.c
index dbcc16721931..b0e8b74b8258 100644
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
index b4a31d506fcc..015b5b6bb3c5 100644
--- a/drivers/gpu/ipu-v3/ipu-di.c
+++ b/drivers/gpu/ipu-v3/ipu-di.c
@@ -510,6 +510,13 @@ int ipu_di_adjust_videomode(struct ipu_di *di, struct videomode *mode)
 {
 	u32 diff;
 
+	if (!IS_ALIGNED(mode->hactive, 8) &&
+	    mode->hfront_porch < ALIGN(mode->hactive, 8) - mode->hactive) {
+		dev_err(di->ipu->dev, "hactive %d is not aligned to 8 and front porch is too small to compensate\n",
+			mode->hactive);
+		return -EOPNOTSUPP;
+	}
+
 	if (mode->vfront_porch >= 2)
 		return 0;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
