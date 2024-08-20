Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29566958261
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BC410E5A2;
	Tue, 20 Aug 2024 09:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CmdJTkjV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ehkrBKf2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VrnH5eF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KSBV65o8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B00410E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2BE51FFCC;
 Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
 b=CmdJTkjVYXsJS0DhS6SgQ8jOnB+WARfLwv0Z4bjs2T46Wahu/sjO4+XEpirdSK45wR/Lpe
 zvcg/6jnigqm7zXseJynLFkYqJsS8TOi1ArFazOLTEq58ZXt4kELBkzDGd217Mdbd9SZCB
 vX9QyEAZ7t1dGnyX2idw4MAVtW1RpBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
 b=ehkrBKf2n9ncC8RMFdc0FjV9RTsRo9Wk5ItDE0AABvTgAudKadcpc+nWdooaxif47XLsTn
 uwjeEfjMT3gS8YAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VrnH5eF6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KSBV65o8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
 b=VrnH5eF6kkHVv4xsVJqgTvOLcg37GsaH9wDrywsIKyrIWTFQjrhtaiu/qZNXqDBf68A+46
 uv09t/tYKxwhtZkVh2xlS+JqH8rfD2TaTN/rGbKCpOt4UmPsOPqZoorIH8s6n5L80YXR+x
 emAZKulhdfReomK32SZO7jaPe9xENdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
 b=KSBV65o8F1+Y2K7o7ri7lTgz9c2U9ylAo2icZe2fF1lFRC2VecoxWA/iamGzui4M3SNl70
 MD+LrgffBzg1tyAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8790213770;
 Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mOveH0djxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/28] backlight: l4f00242t03: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:48 +0200
Message-ID: <20240820093452.68270-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E2BE51FFCC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
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
 drivers/video/backlight/l4f00242t03.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index dd0874f8c7ff..5b5887607f16 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -112,40 +112,40 @@ static int l4f00242t03_lcd_power_set(struct lcd_device *ld, int power)
 	const u16 slpin = 0x10;
 	const u16 disoff = 0x28;
 
-	if (power <= FB_BLANK_NORMAL) {
-		if (priv->lcd_state <= FB_BLANK_NORMAL) {
+	if (power <= LCD_POWER_REDUCED) {
+		if (priv->lcd_state <= LCD_POWER_REDUCED) {
 			/* Do nothing, the LCD is running */
-		} else if (priv->lcd_state < FB_BLANK_POWERDOWN) {
+		} else if (priv->lcd_state < LCD_POWER_OFF) {
 			dev_dbg(&spi->dev, "Resuming LCD\n");
 
 			spi_write(spi, (const u8 *)&slpout, sizeof(u16));
 			msleep(60);
 			spi_write(spi, (const u8 *)&dison, sizeof(u16));
 		} else {
-			/* priv->lcd_state == FB_BLANK_POWERDOWN */
+			/* priv->lcd_state == LCD_POWER_OFF */
 			l4f00242t03_lcd_init(spi);
-			priv->lcd_state = FB_BLANK_VSYNC_SUSPEND;
+			priv->lcd_state = LCD_POWER_REDUCED_VSYNC_SUSPEND;
 			l4f00242t03_lcd_power_set(priv->ld, power);
 		}
-	} else if (power < FB_BLANK_POWERDOWN) {
-		if (priv->lcd_state <= FB_BLANK_NORMAL) {
+	} else if (power < LCD_POWER_OFF) {
+		if (priv->lcd_state <= LCD_POWER_REDUCED) {
 			/* Send the display in standby */
 			dev_dbg(&spi->dev, "Standby the LCD\n");
 
 			spi_write(spi, (const u8 *)&disoff, sizeof(u16));
 			msleep(60);
 			spi_write(spi, (const u8 *)&slpin, sizeof(u16));
-		} else if (priv->lcd_state < FB_BLANK_POWERDOWN) {
+		} else if (priv->lcd_state < LCD_POWER_OFF) {
 			/* Do nothing, the LCD is already in standby */
 		} else {
-			/* priv->lcd_state == FB_BLANK_POWERDOWN */
+			/* priv->lcd_state == LCD_POWER_OFF */
 			l4f00242t03_lcd_init(spi);
-			priv->lcd_state = FB_BLANK_UNBLANK;
+			priv->lcd_state = LCD_POWER_ON;
 			l4f00242t03_lcd_power_set(ld, power);
 		}
 	} else {
-		/* power == FB_BLANK_POWERDOWN */
-		if (priv->lcd_state != FB_BLANK_POWERDOWN) {
+		/* power == LCD_POWER_OFF */
+		if (priv->lcd_state != LCD_POWER_OFF) {
 			/* Clear the screen before shutting down */
 			spi_write(spi, (const u8 *)&disoff, sizeof(u16));
 			msleep(60);
@@ -209,8 +209,8 @@ static int l4f00242t03_probe(struct spi_device *spi)
 
 	/* Init the LCD */
 	l4f00242t03_lcd_init(spi);
-	priv->lcd_state = FB_BLANK_VSYNC_SUSPEND;
-	l4f00242t03_lcd_power_set(priv->ld, FB_BLANK_UNBLANK);
+	priv->lcd_state = LCD_POWER_REDUCED_VSYNC_SUSPEND;
+	l4f00242t03_lcd_power_set(priv->ld, LCD_POWER_ON);
 
 	dev_info(&spi->dev, "Epson l4f00242t03 lcd probed.\n");
 
@@ -221,7 +221,7 @@ static void l4f00242t03_remove(struct spi_device *spi)
 {
 	struct l4f00242t03_priv *priv = spi_get_drvdata(spi);
 
-	l4f00242t03_lcd_power_set(priv->ld, FB_BLANK_POWERDOWN);
+	l4f00242t03_lcd_power_set(priv->ld, LCD_POWER_OFF);
 }
 
 static void l4f00242t03_shutdown(struct spi_device *spi)
@@ -229,7 +229,7 @@ static void l4f00242t03_shutdown(struct spi_device *spi)
 	struct l4f00242t03_priv *priv = spi_get_drvdata(spi);
 
 	if (priv)
-		l4f00242t03_lcd_power_set(priv->ld, FB_BLANK_POWERDOWN);
+		l4f00242t03_lcd_power_set(priv->ld, LCD_POWER_OFF);
 
 }
 
-- 
2.46.0

