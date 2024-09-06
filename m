Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636796ECA0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B516A10E978;
	Fri,  6 Sep 2024 07:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28CB10E947
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77A7D1F899;
 Fri,  6 Sep 2024 07:54:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 153CE136A8;
 Fri,  6 Sep 2024 07:54:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GN7sA0O12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/28] backlight: corgi_lcd: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:18 +0200
Message-ID: <20240906075439.98476-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 77A7D1F899
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/corgi_lcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index e4fcfbe38dc6..35c3fd3281ca 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -24,7 +24,7 @@
 #include <linux/slab.h>
 #include <asm/mach/sharpsl_param.h>
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 /* Register Addresses */
 #define RESCTL_ADRS     0x00
@@ -455,7 +455,7 @@ static int corgi_lcd_suspend(struct device *dev)
 
 	corgibl_flags |= CORGIBL_SUSPENDED;
 	corgi_bl_set_intensity(lcd, 0);
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_POWERDOWN);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_OFF);
 	return 0;
 }
 
@@ -464,7 +464,7 @@ static int corgi_lcd_resume(struct device *dev)
 	struct corgi_lcd *lcd = dev_get_drvdata(dev);
 
 	corgibl_flags &= ~CORGIBL_SUSPENDED;
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_UNBLANK);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_ON);
 	backlight_update_status(lcd->bl_dev);
 	return 0;
 }
@@ -513,7 +513,7 @@ static int corgi_lcd_probe(struct spi_device *spi)
 	if (IS_ERR(lcd->lcd_dev))
 		return PTR_ERR(lcd->lcd_dev);
 
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 	lcd->mode = (pdata) ? pdata->init_mode : CORGI_LCD_MODE_VGA;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
@@ -535,7 +535,7 @@ static int corgi_lcd_probe(struct spi_device *spi)
 	lcd->kick_battery = pdata->kick_battery;
 
 	spi_set_drvdata(spi, lcd);
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_UNBLANK);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_ON);
 	backlight_update_status(lcd->bl_dev);
 
 	lcd->limit_mask = pdata->limit_mask;
@@ -550,7 +550,7 @@ static void corgi_lcd_remove(struct spi_device *spi)
 	lcd->bl_dev->props.power = BACKLIGHT_POWER_ON;
 	lcd->bl_dev->props.brightness = 0;
 	backlight_update_status(lcd->bl_dev);
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_POWERDOWN);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_OFF);
 }
 
 static struct spi_driver corgi_lcd_driver = {
-- 
2.46.0

