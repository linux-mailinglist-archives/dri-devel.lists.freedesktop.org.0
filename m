Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B295826E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DF510E5E4;
	Tue, 20 Aug 2024 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CF8gUMrH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5trSQq8y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CF8gUMrH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5trSQq8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D1010E595
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36365225AA;
 Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX91yI4Op6D2w4gSixX1FdiFGxsmbU0zNWwnCvimueU=;
 b=CF8gUMrHyNy0kWWnPqL61sUvKYDO6UIUYWCxSvOs00X/JVQZ9qlaafrJNYf8cCweDJGC4u
 JoIKdUUQAe/iywGN61lI9pVGusnl3OyKzKfmmP76YbNWzV8Ei8Sd8E5pbyGxbybrySnAa4
 aPlSEX13rUrvsNPudVRATVUSO7BdpN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX91yI4Op6D2w4gSixX1FdiFGxsmbU0zNWwnCvimueU=;
 b=5trSQq8y/Hrp55Z5o4tEyMjkP3oUlk3wMhWmAo5M2V2PH3t4PfM9uEaegFcxxHPVzXL9ZU
 LGzrjQjqpIKLTTCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CF8gUMrH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5trSQq8y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX91yI4Op6D2w4gSixX1FdiFGxsmbU0zNWwnCvimueU=;
 b=CF8gUMrHyNy0kWWnPqL61sUvKYDO6UIUYWCxSvOs00X/JVQZ9qlaafrJNYf8cCweDJGC4u
 JoIKdUUQAe/iywGN61lI9pVGusnl3OyKzKfmmP76YbNWzV8Ei8Sd8E5pbyGxbybrySnAa4
 aPlSEX13rUrvsNPudVRATVUSO7BdpN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX91yI4Op6D2w4gSixX1FdiFGxsmbU0zNWwnCvimueU=;
 b=5trSQq8y/Hrp55Z5o4tEyMjkP3oUlk3wMhWmAo5M2V2PH3t4PfM9uEaegFcxxHPVzXL9ZU
 LGzrjQjqpIKLTTCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C312B13AFE;
 Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sE10LkhjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 13/28] backlight: lms501kf03: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:51 +0200
Message-ID: <20240820093452.68270-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 36365225AA
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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
---
 drivers/video/backlight/lms501kf03.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
index e051e6b6036e..28721b48b4c7 100644
--- a/drivers/video/backlight/lms501kf03.c
+++ b/drivers/video/backlight/lms501kf03.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
@@ -205,7 +204,7 @@ static int lms501kf03_ldi_disable(struct lms501kf03 *lcd)
 
 static int lms501kf03_power_is_on(int power)
 {
-	return (power) <= FB_BLANK_NORMAL;
+	return (power) <= LCD_POWER_REDUCED;
 }
 
 static int lms501kf03_power_on(struct lms501kf03 *lcd)
@@ -294,8 +293,8 @@ static int lms501kf03_set_power(struct lcd_device *ld, int power)
 {
 	struct lms501kf03 *lcd = lcd_get_data(ld);
 
-	if (power != FB_BLANK_UNBLANK && power != FB_BLANK_POWERDOWN &&
-		power != FB_BLANK_NORMAL) {
+	if (power != LCD_POWER_ON && power != LCD_POWER_OFF &&
+		power != LCD_POWER_REDUCED) {
 		dev_err(lcd->dev, "power value should be 0, 1 or 4.\n");
 		return -EINVAL;
 	}
@@ -349,11 +348,11 @@ static int lms501kf03_probe(struct spi_device *spi)
 		 * current lcd status is powerdown and then
 		 * it enables lcd panel.
 		 */
-		lcd->power = FB_BLANK_POWERDOWN;
+		lcd->power = LCD_POWER_OFF;
 
-		lms501kf03_power(lcd, FB_BLANK_UNBLANK);
+		lms501kf03_power(lcd, LCD_POWER_ON);
 	} else {
-		lcd->power = FB_BLANK_UNBLANK;
+		lcd->power = LCD_POWER_ON;
 	}
 
 	spi_set_drvdata(spi, lcd);
@@ -367,7 +366,7 @@ static void lms501kf03_remove(struct spi_device *spi)
 {
 	struct lms501kf03 *lcd = spi_get_drvdata(spi);
 
-	lms501kf03_power(lcd, FB_BLANK_POWERDOWN);
+	lms501kf03_power(lcd, LCD_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -381,16 +380,16 @@ static int lms501kf03_suspend(struct device *dev)
 	 * when lcd panel is suspend, lcd panel becomes off
 	 * regardless of status.
 	 */
-	return lms501kf03_power(lcd, FB_BLANK_POWERDOWN);
+	return lms501kf03_power(lcd, LCD_POWER_OFF);
 }
 
 static int lms501kf03_resume(struct device *dev)
 {
 	struct lms501kf03 *lcd = dev_get_drvdata(dev);
 
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 
-	return lms501kf03_power(lcd, FB_BLANK_UNBLANK);
+	return lms501kf03_power(lcd, LCD_POWER_ON);
 }
 #endif
 
@@ -401,7 +400,7 @@ static void lms501kf03_shutdown(struct spi_device *spi)
 {
 	struct lms501kf03 *lcd = spi_get_drvdata(spi);
 
-	lms501kf03_power(lcd, FB_BLANK_POWERDOWN);
+	lms501kf03_power(lcd, LCD_POWER_OFF);
 }
 
 static struct spi_driver lms501kf03_driver = {
-- 
2.46.0

