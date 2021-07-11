Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770EF3C3B4C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 11:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA56EB9C;
	Sun, 11 Jul 2021 09:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD166EB9C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 09:19:40 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 222bb1a3-e229-11eb-8d1a-0050568cd888;
 Sun, 11 Jul 2021 09:19:45 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 284ED194B35;
 Sun, 11 Jul 2021 11:19:49 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm/atmel-hlcdc: Move interrupt helper funtions
Date: Sun, 11 Jul 2021 11:19:25 +0200
Message-Id: <20210711091926.552861-2-sam@ravnborg.org>
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

This is in preparation for removal of drm_irq use.
Functions are moved without any other changes.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 52 ++++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 65af56e47129..f67363188cbc 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -521,6 +521,32 @@ atmel_hlcdc_dc_mode_valid(struct atmel_hlcdc_dc *dc,
 	return MODE_OK;
 }
 
+static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
+{
+	struct atmel_hlcdc_dc *dc = dev->dev_private;
+	unsigned int cfg = 0;
+	int i;
+
+	/* Enable interrupts on activated layers */
+	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
+		if (dc->layers[i])
+			cfg |= ATMEL_HLCDC_LAYER_STATUS(i);
+	}
+
+	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, cfg);
+
+	return 0;
+}
+
+static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
+{
+	struct atmel_hlcdc_dc *dc = dev->dev_private;
+	unsigned int isr;
+
+	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
+	regmap_read(dc->hlcdc->regmap, ATMEL_HLCDC_ISR, &isr);
+}
+
 static void atmel_hlcdc_layer_irq(struct atmel_hlcdc_layer *layer)
 {
 	if (!layer)
@@ -684,32 +710,6 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
 }
 
-static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
-{
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
-	unsigned int cfg = 0;
-	int i;
-
-	/* Enable interrupts on activated layers */
-	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
-		if (dc->layers[i])
-			cfg |= ATMEL_HLCDC_LAYER_STATUS(i);
-	}
-
-	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, cfg);
-
-	return 0;
-}
-
-static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
-{
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
-	unsigned int isr;
-
-	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
-	regmap_read(dc->hlcdc->regmap, ATMEL_HLCDC_ISR, &isr);
-}
-
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver atmel_hlcdc_dc_driver = {
-- 
2.30.2

