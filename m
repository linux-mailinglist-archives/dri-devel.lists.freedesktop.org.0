Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3896ECC6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D59110E990;
	Fri,  6 Sep 2024 07:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54A10E976
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B582021ABD;
 Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58FA613A7A;
 Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OMeCFEe12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 14/28] backlight: ltv350qv: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:28 +0200
Message-ID: <20240906075439.98476-15-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: B582021ABD
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
 drivers/video/backlight/ltv350qv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/ltv350qv.c b/drivers/video/backlight/ltv350qv.c
index cdc4c087f230..c919b0fe4cd9 100644
--- a/drivers/video/backlight/ltv350qv.c
+++ b/drivers/video/backlight/ltv350qv.c
@@ -6,7 +6,6 @@
  */
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
@@ -15,7 +14,7 @@
 
 #include "ltv350qv.h"
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 struct ltv350qv {
 	struct spi_device	*spi;
@@ -233,7 +232,7 @@ static int ltv350qv_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	lcd->spi = spi;
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 	lcd->buffer = devm_kzalloc(&spi->dev, 8, GFP_KERNEL);
 	if (!lcd->buffer)
 		return -ENOMEM;
@@ -245,7 +244,7 @@ static int ltv350qv_probe(struct spi_device *spi)
 
 	lcd->ld = ld;
 
-	ret = ltv350qv_power(lcd, FB_BLANK_UNBLANK);
+	ret = ltv350qv_power(lcd, LCD_POWER_ON);
 	if (ret)
 		return ret;
 
@@ -258,7 +257,7 @@ static void ltv350qv_remove(struct spi_device *spi)
 {
 	struct ltv350qv *lcd = spi_get_drvdata(spi);
 
-	ltv350qv_power(lcd, FB_BLANK_POWERDOWN);
+	ltv350qv_power(lcd, LCD_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -266,14 +265,14 @@ static int ltv350qv_suspend(struct device *dev)
 {
 	struct ltv350qv *lcd = dev_get_drvdata(dev);
 
-	return ltv350qv_power(lcd, FB_BLANK_POWERDOWN);
+	return ltv350qv_power(lcd, LCD_POWER_OFF);
 }
 
 static int ltv350qv_resume(struct device *dev)
 {
 	struct ltv350qv *lcd = dev_get_drvdata(dev);
 
-	return ltv350qv_power(lcd, FB_BLANK_UNBLANK);
+	return ltv350qv_power(lcd, LCD_POWER_ON);
 }
 #endif
 
@@ -284,7 +283,7 @@ static void ltv350qv_shutdown(struct spi_device *spi)
 {
 	struct ltv350qv *lcd = spi_get_drvdata(spi);
 
-	ltv350qv_power(lcd, FB_BLANK_POWERDOWN);
+	ltv350qv_power(lcd, LCD_POWER_OFF);
 }
 
 static struct spi_driver ltv350qv_driver = {
-- 
2.46.0

