Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EE7582F8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A126F10E3A3;
	Tue, 18 Jul 2023 16:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A776910E386
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by laurent.telenet-ops.be with bizsmtp
 id Ngur2A00E1C8whw01gurjD; Tue, 18 Jul 2023 18:54:52 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nZ4-GR;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gd6-Hc;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 25/41] drm: renesas: shmobile: Move interface handling to
 connector setup
Date: Tue, 18 Jul 2023 18:54:30 +0200
Message-Id: <56e4480a712ad9b8a7f38f4741ac2683815d0efa.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move legacy interface handling to the connector setup code.
Set up bus_flags and bus_formats in display_info according to the
bus format and panel information from platform data, to make it more
similar with DT-based connector/bridge/panel setup.
This will allow us to use the same LCD interface setup code for both
legacy and DT-based systems.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop superfluous blank lines,
  - Keep initialization of info fields together,
  - Use shmob_drm_bus_fmts[],
  - Keep bus format validation at probe time.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 118 +++++++++++++++---
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  34 -----
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |   3 +-
 3 files changed, 104 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index b3ef10b7828de197..caafd04acd3d46d0 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_crtc.h>
@@ -39,20 +40,55 @@
  * CRTC
  */
 
+static const struct {
+	u32 fmt;
+	u32 ldmt1r;
+} shmob_drm_bus_fmts[] = {
+	{ MEDIA_BUS_FMT_RGB888_3X8,	 LDMT1R_MIFTYP_RGB8 },
+	{ MEDIA_BUS_FMT_RGB666_2X9_BE,	 LDMT1R_MIFTYP_RGB9 },
+	{ MEDIA_BUS_FMT_RGB888_2X12_BE,	 LDMT1R_MIFTYP_RGB12A },
+	{ MEDIA_BUS_FMT_RGB444_1X12,	 LDMT1R_MIFTYP_RGB12B },
+	{ MEDIA_BUS_FMT_RGB565_1X16,	 LDMT1R_MIFTYP_RGB16 },
+	{ MEDIA_BUS_FMT_RGB666_1X18,	 LDMT1R_MIFTYP_RGB18 },
+	{ MEDIA_BUS_FMT_RGB888_1X24,	 LDMT1R_MIFTYP_RGB24 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16,	 LDMT1R_MIFTYP_YCBCR },
+};
+
 static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
-	enum display_flags dpy_flags = sdev->connector.mode->flags;
+	const struct drm_display_info *info = &sdev->connector->display_info;
 	const struct drm_display_mode *mode = &crtc->mode;
+	unsigned int i;
 	u32 value;
 
-	value = sdev->ldmt1r
-	      | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : LDMT1R_VPOL)
-	      | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : LDMT1R_HPOL)
-	      | ((dpy_flags & DISPLAY_FLAGS_PIXDATA_POSEDGE) ? LDMT1R_DWPOL : 0)
-	      | ((dpy_flags & DISPLAY_FLAGS_DE_LOW) ? LDMT1R_DIPOL : 0);
+	if (!info->num_bus_formats || !info->bus_formats) {
+		dev_warn(sdev->dev, "No bus format reported, using RGB888\n");
+		value = LDMT1R_MIFTYP_RGB24;
+	} else {
+		for (i = 0; i < ARRAY_SIZE(shmob_drm_bus_fmts); i++) {
+			if (shmob_drm_bus_fmts[i].fmt == info->bus_formats[0])
+				break;
+		}
+		if (i < ARRAY_SIZE(shmob_drm_bus_fmts)) {
+			value = shmob_drm_bus_fmts[i].ldmt1r;
+		} else {
+			dev_warn(sdev->dev,
+				 "unsupported bus format 0x%x, using RGB888\n",
+				 info->bus_formats[0]);
+			value = LDMT1R_MIFTYP_RGB24;
+		}
+	}
 
+	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
+		value |= LDMT1R_DWPOL;
+	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= LDMT1R_DIPOL;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		value |= LDMT1R_VPOL;
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		value |= LDMT1R_HPOL;
 	lcdc_write(sdev, LDMT1R, value);
 
 	value = ((mode->hdisplay / 8) << 16)			/* HDCN */
@@ -479,7 +515,7 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 {
 	struct drm_device *dev = encoder->dev;
 	struct shmob_drm_device *sdev = to_shmob_device(dev);
-	struct drm_connector *connector = &sdev->connector.connector;
+	struct drm_connector *connector = sdev->connector;
 	const struct drm_display_mode *panel_mode;
 
 	if (list_empty(&connector->modes)) {
@@ -581,6 +617,8 @@ static void shmob_drm_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
+
+	kfree(connector);
 }
 
 static const struct drm_connector_funcs connector_funcs = {
@@ -589,26 +627,74 @@ static const struct drm_connector_funcs connector_funcs = {
 	.destroy = shmob_drm_connector_destroy,
 };
 
-int shmob_drm_connector_create(struct shmob_drm_device *sdev,
-			       struct drm_encoder *encoder)
+static struct drm_connector *
+shmob_drm_connector_init(struct shmob_drm_device *sdev,
+			 struct drm_encoder *encoder)
 {
-	struct shmob_drm_connector *scon = &sdev->connector;
-	struct drm_connector *connector = &scon->connector;
+	u32 bus_fmt = sdev->pdata->iface.bus_fmt;
+	struct shmob_drm_connector *scon;
+	struct drm_connector *connector;
+	struct drm_display_info *info;
+	unsigned int i;
 	int ret;
 
+	for (i = 0; i < ARRAY_SIZE(shmob_drm_bus_fmts); i++) {
+		if (shmob_drm_bus_fmts[i].fmt == bus_fmt)
+			break;
+	}
+	if (i == ARRAY_SIZE(shmob_drm_bus_fmts)) {
+		dev_err(sdev->dev, "unsupported bus format 0x%x\n", bus_fmt);
+		return ERR_PTR(-EINVAL);
+	}
+
+	scon = kzalloc(sizeof(*scon), GFP_KERNEL);
+	if (!scon)
+		return ERR_PTR(-ENOMEM);
+
+	connector = &scon->connector;
 	scon->encoder = encoder;
 	scon->mode = &sdev->pdata->panel.mode;
 
-	connector->display_info.width_mm = sdev->pdata->panel.width_mm;
-	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
+	info = &connector->display_info;
+	info->width_mm = sdev->pdata->panel.width_mm;
+	info->height_mm = sdev->pdata->panel.height_mm;
+
+	if (scon->mode->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
+	if (scon->mode->flags & DISPLAY_FLAGS_DE_LOW)
+		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;
+
+	ret = drm_display_info_set_bus_formats(info, &bus_fmt, 1);
+	if (ret < 0) {
+		kfree(scon);
+		return ERR_PTR(ret);
+	}
 
 	ret = drm_connector_init(&sdev->ddev, connector, &connector_funcs,
 				 DRM_MODE_CONNECTOR_DPI);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		kfree(scon);
+		return ERR_PTR(ret);
+	}
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
 
+	return connector;
+}
+
+int shmob_drm_connector_create(struct shmob_drm_device *sdev,
+			       struct drm_encoder *encoder)
+{
+	struct drm_connector *connector;
+	int ret;
+
+	connector = shmob_drm_connector_init(sdev, encoder);
+	if (IS_ERR(connector)) {
+		dev_err(sdev->dev, "failed to created connector: %pe\n",
+			connector);
+		return PTR_ERR(connector);
+	}
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0)
 		goto error;
@@ -617,6 +703,8 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 	drm_object_property_set_value(&connector->base,
 		sdev->ddev.mode_config.dpms_property, DRM_MODE_DPMS_OFF);
 
+	sdev->connector = connector;
+
 	return 0;
 
 error:
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 08b254f0f2874786..8da3054f26b2d235 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -9,7 +9,6 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/media-bus-format.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -33,35 +32,6 @@
  * Hardware initialization
  */
 
-static int shmob_drm_init_interface(struct shmob_drm_device *sdev)
-{
-	static const struct {
-		u32 fmt;
-		u32 ldmt1r;
-	} bus_fmts[] = {
-		{ MEDIA_BUS_FMT_RGB888_3X8,	 LDMT1R_MIFTYP_RGB8 },
-		{ MEDIA_BUS_FMT_RGB666_2X9_BE,	 LDMT1R_MIFTYP_RGB9 },
-		{ MEDIA_BUS_FMT_RGB888_2X12_BE,	 LDMT1R_MIFTYP_RGB12A },
-		{ MEDIA_BUS_FMT_RGB444_1X12,	 LDMT1R_MIFTYP_RGB12B },
-		{ MEDIA_BUS_FMT_RGB565_1X16,	 LDMT1R_MIFTYP_RGB16 },
-		{ MEDIA_BUS_FMT_RGB666_1X18,	 LDMT1R_MIFTYP_RGB18 },
-		{ MEDIA_BUS_FMT_RGB888_1X24,	 LDMT1R_MIFTYP_RGB24 },
-		{ MEDIA_BUS_FMT_UYVY8_1X16,	 LDMT1R_MIFTYP_YCBCR },
-	};
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(bus_fmts); i++) {
-		if (bus_fmts[i].fmt == sdev->pdata->iface.bus_fmt) {
-			sdev->ldmt1r = bus_fmts[i].ldmt1r;
-			return 0;
-		}
-	}
-
-	dev_err(sdev->dev, "unsupported bus format 0x%x\n",
-		sdev->pdata->iface.bus_fmt);
-	return -EINVAL;
-}
-
 static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
 				  enum shmob_drm_clk_source clksrc)
 {
@@ -247,10 +217,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = shmob_drm_init_interface(sdev);
-	if (ret < 0)
-		return ret;
-
 	ret = shmob_drm_modeset_init(sdev);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
index 5e55ba7a207865bd..18907e5ace51c681 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
@@ -27,7 +27,6 @@ struct shmob_drm_device {
 	void __iomem *mmio;
 	struct clk *clock;
 	u32 lddckr;
-	u32 ldmt1r;
 
 	unsigned int irq;
 	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
@@ -36,7 +35,7 @@ struct shmob_drm_device {
 
 	struct shmob_drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct shmob_drm_connector connector;
+	struct drm_connector *connector;
 };
 
 static inline struct shmob_drm_device *to_shmob_device(struct drm_device *dev)
-- 
2.34.1

