Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83A565ACB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226D10E55F;
	Mon,  4 Jul 2022 16:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6A910E004
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 23:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1656803257; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=92NWIXySgUrbyWE6mJHilDjq0xBHQsBRdrjwPSCu7a4=;
 b=ORwy4kAlzw9XFRM+JYaY+34fIMbtYbt4Q0GGZp4WE/xCeMWpJRi4ArT50/PT+84EmIfODo
 d3KnZoD7mBxAtwADAvgBilde8zw8xSMfrNP7jeangftG7/qVpKGZrJsH09BKWgqgcVQWJ+
 RFG9zeRzMwxf+k3jWGda6cB3uPDjWXk=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ingenic: Use the highest possible DMA burst size
Date: Sun,  3 Jul 2022 00:07:27 +0100
Message-Id: <20220702230727.66704-1-paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org,
 list@opendingux.net, Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now, when running at the maximum resolution of 1280x720 at 32bpp
on the JZ4770 SoC the output was garbled, the X/Y position of the
top-left corner of the framebuffer warping to a random position with
the whole image being offset accordingly, every time a new frame was
being submitted.

This problem can be eliminated by using a bigger burst size for the DMA.

Set in each soc_info structure the maximum burst size supported by the
corresponding SoC, and use it in the driver.

Set the new value using regmap_update_bits() instead of
regmap_set_bits(), since we do want to override the old value of the
burst size. (Note that regmap_set_bits() wasn't really valid before for
the same reason, but it never seemed to be a problem).

Cc: <stable@vger.kernel.org>
Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 10 ++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  3 +++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 2c559885347a..8ad6080b32b2 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -70,6 +70,7 @@ struct jz_soc_info {
 	bool map_noncoherent;
 	bool use_extended_hwdesc;
 	bool plane_f0_not_working;
+	u32 max_burst;
 	unsigned int max_width, max_height;
 	const u32 *formats_f0, *formats_f1;
 	unsigned int num_formats_f0, num_formats_f1;
@@ -319,8 +320,9 @@ static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
 		regmap_write(priv->map, JZ_REG_LCD_REV, mode->htotal << 16);
 	}
 
-	regmap_set_bits(priv->map, JZ_REG_LCD_CTRL,
-			JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
+	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
+			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_MASK,
+			   JZ_LCD_CTRL_OFUP | priv->soc_info->max_burst);
 
 	/*
 	 * IPU restart - specify how much time the LCDC will wait before
@@ -1519,6 +1521,7 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.map_noncoherent = false,
 	.max_width = 800,
 	.max_height = 600,
+	.max_burst = JZ_LCD_CTRL_BURST_16,
 	.formats_f1 = jz4740_formats,
 	.num_formats_f1 = ARRAY_SIZE(jz4740_formats),
 	/* JZ4740 has only one plane */
@@ -1530,6 +1533,7 @@ static const struct jz_soc_info jz4725b_soc_info = {
 	.map_noncoherent = false,
 	.max_width = 800,
 	.max_height = 600,
+	.max_burst = JZ_LCD_CTRL_BURST_16,
 	.formats_f1 = jz4725b_formats_f1,
 	.num_formats_f1 = ARRAY_SIZE(jz4725b_formats_f1),
 	.formats_f0 = jz4725b_formats_f0,
@@ -1542,6 +1546,7 @@ static const struct jz_soc_info jz4770_soc_info = {
 	.map_noncoherent = true,
 	.max_width = 1280,
 	.max_height = 720,
+	.max_burst = JZ_LCD_CTRL_BURST_64,
 	.formats_f1 = jz4770_formats_f1,
 	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
 	.formats_f0 = jz4770_formats_f0,
@@ -1556,6 +1561,7 @@ static const struct jz_soc_info jz4780_soc_info = {
 	.plane_f0_not_working = true,	/* REVISIT */
 	.max_width = 4096,
 	.max_height = 2048,
+	.max_burst = JZ_LCD_CTRL_BURST_64,
 	.formats_f1 = jz4770_formats_f1,
 	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
 	.formats_f0 = jz4770_formats_f0,
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index cb1d09b62588..e5bd007ea93d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -106,6 +106,9 @@
 #define JZ_LCD_CTRL_BURST_4			(0x0 << 28)
 #define JZ_LCD_CTRL_BURST_8			(0x1 << 28)
 #define JZ_LCD_CTRL_BURST_16			(0x2 << 28)
+#define JZ_LCD_CTRL_BURST_32			(0x3 << 28)
+#define JZ_LCD_CTRL_BURST_64			(0x4 << 28)
+#define JZ_LCD_CTRL_BURST_MASK			(0x7 << 28)
 #define JZ_LCD_CTRL_RGB555			BIT(27)
 #define JZ_LCD_CTRL_OFUP			BIT(26)
 #define JZ_LCD_CTRL_FRC_GRAYSCALE_16		(0x0 << 24)
-- 
2.35.1

