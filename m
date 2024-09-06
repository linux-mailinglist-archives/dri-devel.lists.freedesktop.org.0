Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B496A96ECA7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810FF10E97A;
	Fri,  6 Sep 2024 07:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5E010E977
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B84F321AC0;
 Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5819C13A7A;
 Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uDI9FES12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/28] backlight: ili9320: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:21 +0200
Message-ID: <20240906075439.98476-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B84F321AC0
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
 drivers/video/backlight/ili9320.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/ili9320.c b/drivers/video/backlight/ili9320.c
index 3e318d1891b6..2df96a882119 100644
--- a/drivers/video/backlight/ili9320.c
+++ b/drivers/video/backlight/ili9320.c
@@ -10,7 +10,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
@@ -121,7 +120,7 @@ static inline int ili9320_power_off(struct ili9320 *lcd)
 	return 0;
 }
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 static int ili9320_power(struct ili9320 *lcd, int power)
 {
@@ -223,7 +222,7 @@ int ili9320_probe_spi(struct spi_device *spi,
 
 	ili->dev = dev;
 	ili->client = client;
-	ili->power = FB_BLANK_POWERDOWN;
+	ili->power = LCD_POWER_OFF;
 	ili->platdata = cfg;
 
 	spi_set_drvdata(spi, ili);
@@ -241,7 +240,7 @@ int ili9320_probe_spi(struct spi_device *spi,
 
 	dev_info(dev, "initialising %s\n", client->name);
 
-	ret = ili9320_power(ili, FB_BLANK_UNBLANK);
+	ret = ili9320_power(ili, LCD_POWER_ON);
 	if (ret != 0) {
 		dev_err(dev, "failed to set lcd power state\n");
 		return ret;
@@ -253,7 +252,7 @@ EXPORT_SYMBOL_GPL(ili9320_probe_spi);
 
 void ili9320_remove(struct ili9320 *ili)
 {
-	ili9320_power(ili, FB_BLANK_POWERDOWN);
+	ili9320_power(ili, LCD_POWER_OFF);
 }
 EXPORT_SYMBOL_GPL(ili9320_remove);
 
@@ -262,7 +261,7 @@ int ili9320_suspend(struct ili9320 *lcd)
 {
 	int ret;
 
-	ret = ili9320_power(lcd, FB_BLANK_POWERDOWN);
+	ret = ili9320_power(lcd, LCD_POWER_OFF);
 
 	if (lcd->platdata->suspend == ILI9320_SUSPEND_DEEP) {
 		ili9320_write(lcd, ILI9320_POWER1, lcd->power1 |
@@ -282,7 +281,7 @@ int ili9320_resume(struct ili9320 *lcd)
 	if (lcd->platdata->suspend == ILI9320_SUSPEND_DEEP)
 		ili9320_write(lcd, ILI9320_POWER1, 0x00);
 
-	return ili9320_power(lcd, FB_BLANK_UNBLANK);
+	return ili9320_power(lcd, LCD_POWER_ON);
 }
 EXPORT_SYMBOL_GPL(ili9320_resume);
 #endif
@@ -290,7 +289,7 @@ EXPORT_SYMBOL_GPL(ili9320_resume);
 /* Power down all displays on reboot, poweroff or halt */
 void ili9320_shutdown(struct ili9320 *lcd)
 {
-	ili9320_power(lcd, FB_BLANK_POWERDOWN);
+	ili9320_power(lcd, LCD_POWER_OFF);
 }
 EXPORT_SYMBOL_GPL(ili9320_shutdown);
 
-- 
2.46.0

