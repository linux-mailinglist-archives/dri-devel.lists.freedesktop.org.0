Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B503A6610E1
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 19:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E0610E34F;
	Sat,  7 Jan 2023 18:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503DA10E1BF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 18:26:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F06760BCC;
 Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0630FC43323;
 Sat,  7 Jan 2023 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673115982;
 bh=xpo8jUeerzmavUSQe9zKlH8WJyJePz17BLWzlSJ9W5w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=leSuGdHpQ5DishtvWWyEHD84Rm+3zDpxcCk6Y/o5NTJYim1zGPo/nCCGi4ApYAmy5
 EGPK6F9qRo9FA79zd96UlO8+oj7N9uIqJpTRy4x/wHdIBbOGYh0cXV0rSfMsiQaTRA
 v0UEBf9kIh57tMQLQAE8TwDjdE1kJ3OK7oxPEqMFT/Ub/bv63O5PS8Npo+Ycim1/os
 B60WufGI+Ceet6SmbiOonk0wvsqabqYtY7L8a867H0+wzmf4WjjRAnoiidtyztMs67
 i93IRKMOI7IDyPWcz0VgvqKkn2Gfh23SlDjV/RJ9KWzU5152Y6/OhuNViPzi5nf7F/
 5U+P5w5KEdTQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E6565C46467;
 Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 07 Jan 2023 19:26:27 +0100
Subject: [PATCH 13/15] backlight: omap1: Use backlight helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=3774;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=srCckeZD3FDZipiWT3z6Jx0O9ZavywUIgE9g9CQnkT4=; =?utf-8?q?b=3DZnBn79WC7Jd0?=
 =?utf-8?q?7w2kvEoUqNXOLxMXiRR81z3KD4hu/AuT4FkBWuhIb8mnv9JkUKSSwMaj8t3RWh8T?=
 8DR2+MBwD0MvdIdeiVcdPN0SSEF+zFiSKPHpLxPwqkw+xml8oExD
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Rework backlight handling to avoid access to the deprecated
backlight_properties.fb_blank member.

The rework includes removal of get_brightness() operation,
because there was no read back from HW so no use for it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/omap1_bl.c | 67 +++++---------------------------------
 1 file changed, 9 insertions(+), 58 deletions(-)

diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
index 69a49384b3de..49f37da857e7 100644
--- a/drivers/video/backlight/omap1_bl.c
+++ b/drivers/video/backlight/omap1_bl.c
@@ -20,9 +20,6 @@
 #define OMAPBL_MAX_INTENSITY		0xff
 
 struct omap_backlight {
-	int powermode;
-	int current_intensity;
-
 	struct device *dev;
 	struct omap_backlight_config *pdata;
 };
@@ -37,82 +34,40 @@ static inline void omapbl_send_enable(int enable)
 	omap_writeb(enable, OMAP_PWL_CLK_ENABLE);
 }
 
-static void omapbl_blank(struct omap_backlight *bl, int mode)
-{
-	if (bl->pdata->set_power)
-		bl->pdata->set_power(bl->dev, mode);
-
-	switch (mode) {
-	case FB_BLANK_NORMAL:
-	case FB_BLANK_VSYNC_SUSPEND:
-	case FB_BLANK_HSYNC_SUSPEND:
-	case FB_BLANK_POWERDOWN:
-		omapbl_send_intensity(0);
-		omapbl_send_enable(0);
-		break;
-
-	case FB_BLANK_UNBLANK:
-		omapbl_send_intensity(bl->current_intensity);
-		omapbl_send_enable(1);
-		break;
-	}
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int omapbl_suspend(struct device *dev)
 {
 	struct backlight_device *bl_dev = dev_get_drvdata(dev);
-	struct omap_backlight *bl = bl_get_data(bl_dev);
 
-	omapbl_blank(bl, FB_BLANK_POWERDOWN);
+	backlight_disable(bl_dev);
 	return 0;
 }
 
 static int omapbl_resume(struct device *dev)
 {
 	struct backlight_device *bl_dev = dev_get_drvdata(dev);
-	struct omap_backlight *bl = bl_get_data(bl_dev);
 
-	omapbl_blank(bl, bl->powermode);
+	backlight_enable(bl_dev);
 	return 0;
 }
 #endif
 
-static int omapbl_set_power(struct backlight_device *dev, int state)
-{
-	struct omap_backlight *bl = bl_get_data(dev);
-
-	omapbl_blank(bl, state);
-	bl->powermode = state;
-
-	return 0;
-}
-
 static int omapbl_update_status(struct backlight_device *dev)
 {
-	struct omap_backlight *bl = bl_get_data(dev);
+	int brightness = backlight_get_brightness(dev);
 
-	if (bl->current_intensity != dev->props.brightness) {
-		if (bl->powermode == FB_BLANK_UNBLANK)
-			omapbl_send_intensity(dev->props.brightness);
-		bl->current_intensity = dev->props.brightness;
+	if (brightness > 0) {
+		omapbl_send_intensity(dev->props.brightness);
+		omapbl_send_enable(1);
+	} else {
+		omapbl_send_intensity(0);
+		omapbl_send_enable(0);
 	}
 
-	if (dev->props.fb_blank != bl->powermode)
-		omapbl_set_power(dev, dev->props.fb_blank);
-
 	return 0;
 }
 
-static int omapbl_get_intensity(struct backlight_device *dev)
-{
-	struct omap_backlight *bl = bl_get_data(dev);
-
-	return bl->current_intensity;
-}
-
 static const struct backlight_ops omapbl_ops = {
-	.get_brightness = omapbl_get_intensity,
 	.update_status  = omapbl_update_status,
 };
 
@@ -139,9 +94,6 @@ static int omapbl_probe(struct platform_device *pdev)
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-	bl->powermode = FB_BLANK_POWERDOWN;
-	bl->current_intensity = 0;
-
 	bl->pdata = pdata;
 	bl->dev = &pdev->dev;
 
@@ -149,7 +101,6 @@ static int omapbl_probe(struct platform_device *pdev)
 
 	omap_cfg_reg(PWL);	/* Conflicts with UART3 */
 
-	dev->props.fb_blank = FB_BLANK_UNBLANK;
 	dev->props.brightness = pdata->default_intensity;
 	omapbl_update_status(dev);
 

-- 
2.34.1
