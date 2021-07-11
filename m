Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EF3C3B4D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 11:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F306EB9E;
	Sun, 11 Jul 2021 09:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5936EB9C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 09:19:41 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 22e5bffb-e229-11eb-8d1a-0050568cd888;
 Sun, 11 Jul 2021 09:19:47 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6182C194B1F;
 Sun, 11 Jul 2021 11:19:50 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Date: Sun, 11 Jul 2021 11:19:26 +0200
Message-Id: <20210711091926.552861-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210711091926.552861-1-sam@ravnborg.org>
References: <20210711091926.552861-1-sam@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm mid-layer for irq's is not relevant for atomic display drivers,
and will be available only for legacy drivers in the future.
Drop usage in the atmel hlcdc driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index f67363188cbc..6b3f353e1cc7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -22,7 +22,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -521,9 +520,8 @@ atmel_hlcdc_dc_mode_valid(struct atmel_hlcdc_dc *dc,
 	return MODE_OK;
 }
 
-static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
+static int atmel_hlcdc_dc_irq_postinstall(struct atmel_hlcdc_dc *dc)
 {
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	unsigned int cfg = 0;
 	int i;
 
@@ -538,9 +536,8 @@ static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
 	return 0;
 }
 
-static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
+static void atmel_hlcdc_dc_irq_reset(struct atmel_hlcdc_dc *dc)
 {
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	unsigned int isr;
 
 	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
@@ -672,12 +669,14 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	drm_mode_config_reset(dev);
 
 	pm_runtime_get_sync(dev->dev);
-	ret = drm_irq_install(dev, dc->hlcdc->irq);
+	atmel_hlcdc_dc_irq_reset(dc);
+	ret = request_irq(dc->hlcdc->irq, atmel_hlcdc_dc_irq_handler, 0, dev->driver->name, dev);
 	pm_runtime_put_sync(dev->dev);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to install IRQ handler\n");
 		goto err_periph_clk_disable;
 	}
+	atmel_hlcdc_dc_irq_postinstall(dc);
 
 	platform_set_drvdata(pdev, dev);
 
@@ -701,7 +700,9 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 	drm_mode_config_cleanup(dev);
 
 	pm_runtime_get_sync(dev->dev);
-	drm_irq_uninstall(dev);
+
+	atmel_hlcdc_dc_irq_reset(dc);
+	free_irq(dc->hlcdc->irq, dev);
 	pm_runtime_put_sync(dev->dev);
 
 	dev->dev_private = NULL;
@@ -714,10 +715,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver atmel_hlcdc_dc_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler = atmel_hlcdc_dc_irq_handler,
-	.irq_preinstall = atmel_hlcdc_dc_irq_uninstall,
-	.irq_postinstall = atmel_hlcdc_dc_irq_postinstall,
-	.irq_uninstall = atmel_hlcdc_dc_irq_uninstall,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops = &fops,
 	.name = "atmel-hlcdc",
-- 
2.30.2

