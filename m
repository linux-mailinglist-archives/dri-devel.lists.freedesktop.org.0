Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14695825C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C48910E5A8;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tucuGKcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BjGrD95e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tucuGKcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BjGrD95e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249CF10E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E8912253C;
 Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
 b=tucuGKcX5yp6tfDMyqH97Y9EfM4+x04bSRtvhp4T8bfPQ82JH0wAmK4BZ61vuc1XuNleaU
 WelL4QDBFMP2PuHgKrseyNXOVPMQrAaj9SXW/aWyWQLfjnkS6lNHP6do3fZBE03Mkg1h/D
 psZemsG98g7iZwor6O0RV3A6LM1tyoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
 b=BjGrD95e7NN1DR4VUsMyiR5Du7aoIIWU0CMrqEMgmvy4rpWjKa1pKPudPHJQzQm+EHz+td
 fqr/P30HvMdzvbDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
 b=tucuGKcX5yp6tfDMyqH97Y9EfM4+x04bSRtvhp4T8bfPQ82JH0wAmK4BZ61vuc1XuNleaU
 WelL4QDBFMP2PuHgKrseyNXOVPMQrAaj9SXW/aWyWQLfjnkS6lNHP6do3fZBE03Mkg1h/D
 psZemsG98g7iZwor6O0RV3A6LM1tyoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
 b=BjGrD95e7NN1DR4VUsMyiR5Du7aoIIWU0CMrqEMgmvy4rpWjKa1pKPudPHJQzQm+EHz+td
 fqr/P30HvMdzvbDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38BC113AFE;
 Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aFWaDEZjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/28] backlight: ili9320: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:45 +0200
Message-ID: <20240820093452.68270-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
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

