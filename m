Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BB28A0F2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 19:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09236F389;
	Sat, 10 Oct 2020 17:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4396F389
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 17:01:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09AH14bT048888;
 Sat, 10 Oct 2020 12:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602349264;
 bh=19wrczLmXhP7YDQO1FpnleaJSisEBX1ORbAbd62PuLc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=S96c3Y0r5AvqRaCcNInCMPgb4s9p2V1kxcp3t0yX9CMnFJVRHWxRD3B9o2Vcv/Sw4
 wBdd0aG3zylvuT8ukd4BDdmKPAuLnQJsse3ri0I082zCLQygJn3uXs7RUxGjci/Tfv
 Bbqp0kNDJWmSi0apNK94T6q23f6dO56odcfmURrc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09AH14Qx089766
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 10 Oct 2020 12:01:04 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 10
 Oct 2020 12:01:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 10 Oct 2020 12:01:03 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09AH0xKL012138;
 Sat, 10 Oct 2020 12:01:02 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/tilcdc: Remove tilcdc_crtc_max_width(),
 use private data
Date: Sat, 10 Oct 2020 20:00:59 +0300
Message-ID: <73683d2ce151cffb811a756595b02892eeac3d84.1602349100.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602349100.git.jsarha@ti.com>
References: <cover.1602349100.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have a private data member for maximum display width so
let's use it and get rid of the redundant tilcdc_crtc_max_width().

The LCDC version probing is moved to before reading the device tree
properties so that the version information is available when private
data maximum width is initialized, if "max-width" property is not
found.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 16 +-----------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 38 +++++++++++++++-------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  7 ++---
 3 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 0fd3dafe6404..da2ab2aa3577 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -754,20 +754,6 @@ static const struct drm_crtc_funcs tilcdc_crtc_funcs = {
 	.disable_vblank	= tilcdc_crtc_disable_vblank,
 };
 
-int tilcdc_crtc_max_width(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	int max_width = 0;
-
-	if (priv->rev == 1)
-		max_width = 1024;
-	else if (priv->rev == 2)
-		max_width = 2048;
-
-	return max_width;
-}
-
 static enum drm_mode_status
 tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 		       const struct drm_display_mode *mode)
@@ -780,7 +766,7 @@ tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 	 * check to see if the width is within the range that
 	 * the LCD Controller physically supports
 	 */
-	if (mode->hdisplay > tilcdc_crtc_max_width(crtc))
+	if (mode->hdisplay > priv->max_width)
 		return MODE_VIRTUAL_X;
 
 	/* width must be multiple of 16 */
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 4f5fc3e87383..c5f82e693f1a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -105,7 +105,7 @@ static void modeset_init(struct drm_device *dev)
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-	dev->mode_config.max_width = tilcdc_crtc_max_width(priv->crtc);
+	dev->mode_config.max_width = priv->max_width;
 	dev->mode_config.max_height = 2048;
 	dev->mode_config.funcs = &mode_config_funcs;
 }
@@ -218,22 +218,6 @@ static int tilcdc_init(struct drm_driver *ddrv, struct device *dev)
 		goto init_failed;
 	}
 
-	if (of_property_read_u32(node, "max-bandwidth", &priv->max_bandwidth))
-		priv->max_bandwidth = TILCDC_DEFAULT_MAX_BANDWIDTH;
-
-	DBG("Maximum Bandwidth Value %d", priv->max_bandwidth);
-
-	if (of_property_read_u32(node, "max-width", &priv->max_width))
-		priv->max_width = TILCDC_DEFAULT_MAX_WIDTH;
-
-	DBG("Maximum Horizontal Pixel Width Value %dpixels", priv->max_width);
-
-	if (of_property_read_u32(node, "max-pixelclock",
-					&priv->max_pixelclock))
-		priv->max_pixelclock = TILCDC_DEFAULT_MAX_PIXELCLOCK;
-
-	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
-
 	pm_runtime_enable(dev);
 
 	/* Determine LCD IP Version */
@@ -287,6 +271,26 @@ static int tilcdc_init(struct drm_driver *ddrv, struct device *dev)
 		}
 	}
 
+	if (of_property_read_u32(node, "max-bandwidth", &priv->max_bandwidth))
+		priv->max_bandwidth = TILCDC_DEFAULT_MAX_BANDWIDTH;
+
+	DBG("Maximum Bandwidth Value %d", priv->max_bandwidth);
+
+	if (of_property_read_u32(node, "max-width", &priv->max_width)) {
+		if (priv->rev == 1)
+			priv->max_width = TILCDC_DEFAULT_MAX_WIDTH_V1;
+		else
+			priv->max_width = TILCDC_DEFAULT_MAX_WIDTH_V2;
+	}
+
+	DBG("Maximum Horizontal Pixel Width Value %dpixels", priv->max_width);
+
+	if (of_property_read_u32(node, "max-pixelclock",
+				 &priv->max_pixelclock))
+		priv->max_pixelclock = TILCDC_DEFAULT_MAX_PIXELCLOCK;
+
+	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
+
 	ret = tilcdc_crtc_create(ddev);
 	if (ret < 0) {
 		dev_err(dev, "failed to create crtc\n");
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 18815e75ca4f..d29806ca8817 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -28,8 +28,10 @@ struct drm_plane;
 
 /* Defaulting to pixel clock defined on AM335x */
 #define TILCDC_DEFAULT_MAX_PIXELCLOCK  126000
-/* Defaulting to max width as defined on AM335x */
-#define TILCDC_DEFAULT_MAX_WIDTH  2048
+/* Maximum display width for LCDC V1 */
+#define TILCDC_DEFAULT_MAX_WIDTH_V1  1024
+/* ... and for LCDC V2 found on AM335x: */
+#define TILCDC_DEFAULT_MAX_WIDTH_V2  2048
 /*
  * This may need some tweaking, but want to allow at least 1280x1024@60
  * with optimized DDR & EMIF settings tweaked 1920x1080@24 appears to
@@ -158,7 +160,6 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 		const struct tilcdc_panel_info *info);
 void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
 					bool simulate_vesa_sync);
-int tilcdc_crtc_max_width(struct drm_crtc *crtc);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
 		struct drm_framebuffer *fb,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
