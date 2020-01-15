Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA613C171
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9985A6E9AE;
	Wed, 15 Jan 2020 12:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27F06E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:46:00 +0000 (UTC)
Received: from ramsan ([84.195.182.253])
 by baptiste.telenet-ops.be with bizsmtp
 id qclq210065USYZQ01clqdB; Wed, 15 Jan 2020 13:45:57 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iri3S-0003z7-5D; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iri3S-00012h-3r; Wed, 15 Jan 2020 13:45:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 4/5] drm: tiny: st7735r: Prepare for adding support for
 more displays
Date: Wed, 15 Jan 2020 13:45:47 +0100
Message-Id: <20200115124548.3951-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
References: <20200115124548.3951-1-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the st7735r driver supports only a single display panel.
Prepare for adding support for other display panels by factoring out the
display-specific parameters in struct st7735r_cfg.

For now, the following parameters can be configured:
  - Display resolution,
  - Horizontal/vertical display offsets,
  - Read-write versus read-only controllers,
  - RGB versus BGR color component ordering.

Rename jd_t18003_t01_pipe_enable() and jd_t18003_t01_pipe_funcs() to
st7735r_pipe_enable() resp. st7735r_pipe_funcs(), as they are not really
specific to the Jianda JD-T18003-T01 display anymore.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split off from "drm: tiny: st7735r: Add support for Okaya
    RH128128T",
  - Replace st7735r_priv.rgb by a pointer to struct st7735r_cfg,
  - Change prefix of jd_t18003_t01_pipe_enable() and
    jd_t18003_t01_pipe_funcs().
---
 drivers/gpu/drm/tiny/st7735r.c | 67 +++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 3f4487c716848cf8..a838f237c8d82e3d 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -3,6 +3,7 @@
  * DRM driver for Sitronix ST7735R panels
  *
  * Copyright 2017 David Lechner <david@lechnology.com>
+ * Copyright (C) 2019 Glider bvba
  */
 
 #include <linux/backlight.h>
@@ -10,6 +11,7 @@
 #include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <video/mipi_display.h>
@@ -37,12 +39,28 @@
 #define ST7735R_MY	BIT(7)
 #define ST7735R_MX	BIT(6)
 #define ST7735R_MV	BIT(5)
+#define ST7735R_RGB	BIT(3)
+
+struct st7735r_cfg {
+	const struct drm_display_mode mode;
+	unsigned int left_offset;
+	unsigned int top_offset;
+	unsigned int write_only:1;
+	unsigned int rgb:1;		/* RGB (vs. BGR) */
+};
+
+struct st7735r_priv {
+	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */
+	const struct st7735r_cfg *cfg;
+};
 
-static void jd_t18003_t01_pipe_enable(struct drm_simple_display_pipe *pipe,
-				      struct drm_crtc_state *crtc_state,
-				      struct drm_plane_state *plane_state)
+static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct st7735r_priv *priv = container_of(dbidev, struct st7735r_priv,
+						 dbidev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 	u8 addr_mode;
@@ -87,6 +105,10 @@ static void jd_t18003_t01_pipe_enable(struct drm_simple_display_pipe *pipe,
 		addr_mode = ST7735R_MY | ST7735R_MV;
 		break;
 	}
+
+	if (priv->cfg->rgb)
+		addr_mode |= ST7735R_RGB;
+
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
 	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
 			 MIPI_DCS_PIXEL_FMT_16BIT);
@@ -109,15 +131,19 @@ static void jd_t18003_t01_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static const struct drm_simple_display_pipe_funcs jd_t18003_t01_pipe_funcs = {
-	.enable		= jd_t18003_t01_pipe_enable,
+static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
+	.enable		= st7735r_pipe_enable,
 	.disable	= mipi_dbi_pipe_disable,
 	.update		= mipi_dbi_pipe_update,
 	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
 };
 
-static const struct drm_display_mode jd_t18003_t01_mode = {
-	DRM_SIMPLE_MODE(128, 160, 28, 35),
+static const struct st7735r_cfg jd_t18003_t01_cfg = {
+	.mode		= { DRM_SIMPLE_MODE(128, 160, 28, 35) },
+	/* Cannot read from Adafruit 1.8" display via SPI */
+	.write_only	= true,
+};
+
 };
 
 DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
@@ -136,13 +162,13 @@ static struct drm_driver st7735r_driver = {
 };
 
 static const struct of_device_id st7735r_of_match[] = {
-	{ .compatible = "jianda,jd-t18003-t01" },
+	{ .compatible = "jianda,jd-t18003-t01", .data = &jd_t18003_t01_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, st7735r_of_match);
 
 static const struct spi_device_id st7735r_id[] = {
-	{ "jd-t18003-t01", 0 },
+	{ "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, st7735r_id);
@@ -150,17 +176,26 @@ MODULE_DEVICE_TABLE(spi, st7735r_id);
 static int st7735r_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	const struct st7735r_cfg *cfg;
 	struct mipi_dbi_dev *dbidev;
+	struct st7735r_priv *priv;
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *dc;
 	u32 rotation = 0;
 	int ret;
 
-	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
-	if (!dbidev)
+	cfg = of_device_get_match_data(&spi->dev);
+	if (!cfg)
+		cfg = (void *)spi_get_device_id(spi)->driver_data;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
+	dbidev = &priv->dbidev;
+	priv->cfg = cfg;
+
 	dbi = &dbidev->dbi;
 	drm = &dbidev->drm;
 	ret = devm_drm_dev_init(dev, drm, &st7735r_driver);
@@ -193,10 +228,14 @@ static int st7735r_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	/* Cannot read from Adafruit 1.8" display via SPI */
-	dbi->read_commands = NULL;
+	if (cfg->write_only)
+		dbi->read_commands = NULL;
+
+	dbidev->left_offset = cfg->left_offset;
+	dbidev->top_offset = cfg->top_offset;
 
-	ret = mipi_dbi_dev_init(dbidev, &jd_t18003_t01_pipe_funcs, &jd_t18003_t01_mode, rotation);
+	ret = mipi_dbi_dev_init(dbidev, &st7735r_pipe_funcs, &cfg->mode,
+				rotation);
 	if (ret)
 		return ret;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
