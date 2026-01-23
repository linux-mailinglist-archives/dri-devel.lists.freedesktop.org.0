Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGI7Kwiec2lgxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D078333
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988C410EB3B;
	Fri, 23 Jan 2026 16:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jfT4TGGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060810EB2C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:12:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 751184E42222;
 Fri, 23 Jan 2026 16:12:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 489D760766;
 Fri, 23 Jan 2026 16:12:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 266B6119A87DB; Fri, 23 Jan 2026 17:12:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Drz+V5zSCo/xDGMhhUKOwdHPwsGJbTExDYM6rsO7Bv8=;
 b=jfT4TGGsH+8ZN94z6JffmPhERJPJQU7F675g2h2H3w/er4HpR4Nr7KDj+KMbhvtPf4Vzwi
 CE1iACqdazSx3W8MjMjCH6XxNxOrVK44uXSI0naHlEI0GqGhvwxtHlJZxg2Uamw9PXtLi5
 mOijQn1F/n/aR3qPdEMWE+EwatzDuYCleyaP45getBbC1rYzDMFjB09bevLj2Vr62uxF4s
 i7LWRyt/RSs06afCL/UsAdPvdUm7WRvPxJNfNypaexvmrKrDOLyl+NOGsvu82sc7QbGHSC
 TledfBEcGdRP5iyeaLZWBfe2kccU2aQcBl4MegRbfmG8gJpcaBZyljksGcBIEQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:22 +0100
Subject: [PATCH v5 04/25] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-4-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5B5D078333
X-Rspamd-Action: no action

Migrate CRTC mode configuration to use standard DRM bus flags in
preparation for removing the tilcdc_panel driver and its custom
tilcdc_panel_info structure.

Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
signal edge polarity, while maintaining backward compatibility with the
existing tilcdc panel info structure.

Simplify several hardware parameters by setting them to fixed defaults
based on common usage across existing device trees:
- DMA burst size: 16 (previously configurable via switch statement)
- AC bias frequency: 255 (previously panel-specific)
- FIFO DMA request delay: 128 (previously panel-specific)

These parameters show no variation in real-world usage, so hardcoding
them simplifies the driver without losing functionality.

Preserve FIFO threshold configurability by detecting the SoC type, as
this parameter varies between AM33xx (8) and DA850 (16) platforms.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Change in v4:
- Use of_device_get_match_data() instead of of_match_node().
- Move back the tilcdc_of_match table down were it was before.

Change in v2:
- Use SoC type instead of devicetree parameter to set FIFO threshold
  value.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 47 +++++++++++++-----------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 17 +++++++++++--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 ++
 3 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b06b1453db2dd..2309a9a0c925d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -285,27 +285,15 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 
 	/* Configure the Burst Size and fifo threshold of DMA: */
 	reg = tilcdc_read(dev, LCDC_DMA_CTRL_REG) & ~0x00000770;
-	switch (info->dma_burst_sz) {
-	case 1:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_1);
-		break;
-	case 2:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_2);
-		break;
-	case 4:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_4);
-		break;
-	case 8:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_8);
-		break;
-	case 16:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
-		break;
-	default:
-		dev_err(dev->dev, "invalid burst size\n");
-		return;
+	/* Use 16 bit DMA burst size by default */
+	reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
+	if (priv->fifo_th) {
+		int fifo_th_val = ilog2(priv->fifo_th) - 3;
+
+		reg |= (fifo_th_val << 8);
+	} else {
+		reg |= (info->fifo_th << 8);
 	}
-	reg |= (info->fifo_th << 8);
 	tilcdc_write(dev, LCDC_DMA_CTRL_REG, reg);
 
 	/* Configure timings: */
@@ -321,8 +309,8 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 
 	/* Set AC Bias Period and Number of Transitions per Interrupt: */
 	reg = tilcdc_read(dev, LCDC_RASTER_TIMING_2_REG) & ~0x000fff00;
-	reg |= LCDC_AC_BIAS_FREQUENCY(info->ac_bias) |
-		LCDC_AC_BIAS_TRANSITIONS_PER_INT(info->ac_bias_intrpt);
+	/* Use 255 AC Bias Pin Frequency by default */
+	reg |= LCDC_AC_BIAS_FREQUENCY(255);
 
 	/*
 	 * subtract one from hfp, hbp, hsw because the hardware uses
@@ -392,20 +380,19 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 			return;
 		}
 	}
-	reg |= info->fdd << 12;
+	/* Use 128 FIFO DMA Request Delay by default */
+	reg |= 128 << 12;
 	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
 
-	if (info->invert_pxl_clk)
+	if (info->invert_pxl_clk ||
+	    mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 
-	if (info->sync_ctrl)
-		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-	else
-		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-
-	if (info->sync_edge)
+	tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
+	if (info->sync_edge ||
+	    mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3dcbec312bacb..fe01f3fcaf3c2 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -31,6 +31,11 @@
 #include "tilcdc_panel.h"
 #include "tilcdc_regs.h"
 
+enum tilcdc_variant {
+	AM33XX_TILCDC,
+	DA850_TILCDC,
+};
+
 static LIST_HEAD(module_list);
 
 static const u32 tilcdc_rev1_formats[] = { DRM_FORMAT_RGB565 };
@@ -198,6 +203,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *node = dev->of_node;
 	struct tilcdc_drm_private *priv;
+	enum tilcdc_variant variant;
 	u32 bpp = 0;
 	int ret;
 
@@ -209,6 +215,8 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
 
+	variant = (uintptr_t)of_device_get_match_data(dev);
+
 	ddev->dev_private = priv;
 	platform_set_drvdata(pdev, ddev);
 	drm_mode_config_init(ddev);
@@ -309,6 +317,11 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
 
+	if (variant == DA850_TILCDC)
+		priv->fifo_th = 16;
+	else
+		priv->fifo_th = 8;
+
 	ret = tilcdc_crtc_create(ddev);
 	if (ret < 0) {
 		dev_err(dev, "failed to create crtc\n");
@@ -598,8 +611,8 @@ static void tilcdc_pdev_shutdown(struct platform_device *pdev)
 }
 
 static const struct of_device_id tilcdc_of_match[] = {
-		{ .compatible = "ti,am33xx-tilcdc", },
-		{ .compatible = "ti,da850-tilcdc", },
+		{ .compatible = "ti,am33xx-tilcdc", .data = (void *)AM33XX_TILCDC},
+		{ .compatible = "ti,da850-tilcdc", .data = (void *)DA850_TILCDC},
 		{ },
 };
 MODULE_DEVICE_TABLE(of, tilcdc_of_match);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 3aba3a1155ba0..79078b4ae7393 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -61,6 +61,8 @@ struct tilcdc_drm_private {
 	 */
 	uint32_t max_width;
 
+	u32 fifo_th;
+
 	/* Supported pixel formats */
 	const uint32_t *pixelformats;
 	uint32_t num_pixelformats;

-- 
2.43.0

