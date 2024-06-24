Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9949151F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4974A10E4B7;
	Mon, 24 Jun 2024 15:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA37010E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:20:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 990DA21A62;
 Mon, 24 Jun 2024 15:20:38 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4744E13ACD;
 Mon, 24 Jun 2024 15:20:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uLgVEMaOeWbqGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 15:20:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org,
 jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org,
 f.suligoi@asem.it, ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/17] backlight: ams369fb06: Use backlight power constants
Date: Mon, 24 Jun 2024 17:19:58 +0200
Message-ID: <20240624152033.25016-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>
References: <20240624152033.25016-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 990DA21A62
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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
backlight subsystem. The values are identical, so there's no
change in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/ams369fg06.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/ams369fg06.c b/drivers/video/backlight/ams369fg06.c
index 57ec205d2bd2..f8442689ac43 100644
--- a/drivers/video/backlight/ams369fg06.c
+++ b/drivers/video/backlight/ams369fg06.c
@@ -10,7 +10,6 @@
 
 #include <linux/backlight.h>
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
@@ -300,7 +299,7 @@ static int ams369fg06_ldi_disable(struct ams369fg06 *lcd)
 
 static int ams369fg06_power_is_on(int power)
 {
-	return power <= FB_BLANK_NORMAL;
+	return power <= BACKLIGHT_POWER_REDUCED;
 }
 
 static int ams369fg06_power_on(struct ams369fg06 *lcd)
@@ -396,8 +395,8 @@ static int ams369fg06_set_power(struct lcd_device *ld, int power)
 {
 	struct ams369fg06 *lcd = lcd_get_data(ld);
 
-	if (power != FB_BLANK_UNBLANK && power != FB_BLANK_POWERDOWN &&
-		power != FB_BLANK_NORMAL) {
+	if (power != BACKLIGHT_POWER_ON && power != BACKLIGHT_POWER_OFF &&
+		power != BACKLIGHT_POWER_REDUCED) {
 		dev_err(lcd->dev, "power value should be 0, 1 or 4.\n");
 		return -EINVAL;
 	}
@@ -492,11 +491,11 @@ static int ams369fg06_probe(struct spi_device *spi)
 		 * current lcd status is powerdown and then
 		 * it enables lcd panel.
 		 */
-		lcd->power = FB_BLANK_POWERDOWN;
+		lcd->power = BACKLIGHT_POWER_OFF;
 
-		ams369fg06_power(lcd, FB_BLANK_UNBLANK);
+		ams369fg06_power(lcd, BACKLIGHT_POWER_ON);
 	} else {
-		lcd->power = FB_BLANK_UNBLANK;
+		lcd->power = BACKLIGHT_POWER_ON;
 	}
 
 	spi_set_drvdata(spi, lcd);
@@ -510,7 +509,7 @@ static void ams369fg06_remove(struct spi_device *spi)
 {
 	struct ams369fg06 *lcd = spi_get_drvdata(spi);
 
-	ams369fg06_power(lcd, FB_BLANK_POWERDOWN);
+	ams369fg06_power(lcd, BACKLIGHT_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -524,16 +523,16 @@ static int ams369fg06_suspend(struct device *dev)
 	 * when lcd panel is suspend, lcd panel becomes off
 	 * regardless of status.
 	 */
-	return ams369fg06_power(lcd, FB_BLANK_POWERDOWN);
+	return ams369fg06_power(lcd, BACKLIGHT_POWER_OFF);
 }
 
 static int ams369fg06_resume(struct device *dev)
 {
 	struct ams369fg06 *lcd = dev_get_drvdata(dev);
 
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = BACKLIGHT_POWER_OFF;
 
-	return ams369fg06_power(lcd, FB_BLANK_UNBLANK);
+	return ams369fg06_power(lcd, BACKLIGHT_POWER_ON);
 }
 #endif
 
@@ -544,7 +543,7 @@ static void ams369fg06_shutdown(struct spi_device *spi)
 {
 	struct ams369fg06 *lcd = spi_get_drvdata(spi);
 
-	ams369fg06_power(lcd, FB_BLANK_POWERDOWN);
+	ams369fg06_power(lcd, BACKLIGHT_POWER_OFF);
 }
 
 static struct spi_driver ams369fg06_driver = {
-- 
2.45.2

