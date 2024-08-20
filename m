Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B995826D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04110E5E1;
	Tue, 20 Aug 2024 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nNru4CrA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UFUt/JtZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nNru4CrA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UFUt/JtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C773410E595
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F95C225B5;
 Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
 b=nNru4CrAxSJR2RtgPw/YAYPseLz1rINlT7nulVPvZZskRaF2+YPVyNejg9mTz+hiAajVGx
 Dg0qiweHOCeJg3IZJ4DPwozhC0kszf3gqb8GKDWHjRch79N+HJje8dXt5u9Bh6Q/pCBS+a
 nTrV7pSlFgYRlXC3Fa11zVaziZNhmrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
 b=UFUt/JtZnSb/JUlMmRqBMrOBb8EOfLnmGzC3sO42gZaWv3GnjsnpEMX3ZBFD4VTFIl2oNR
 eWi7cL47VbaT8KDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
 b=nNru4CrAxSJR2RtgPw/YAYPseLz1rINlT7nulVPvZZskRaF2+YPVyNejg9mTz+hiAajVGx
 Dg0qiweHOCeJg3IZJ4DPwozhC0kszf3gqb8GKDWHjRch79N+HJje8dXt5u9Bh6Q/pCBS+a
 nTrV7pSlFgYRlXC3Fa11zVaziZNhmrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
 b=UFUt/JtZnSb/JUlMmRqBMrOBb8EOfLnmGzC3sO42gZaWv3GnjsnpEMX3ZBFD4VTFIl2oNR
 eWi7cL47VbaT8KDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C29313B04;
 Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IBWPCU5jxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 26/28] backlight: lcd: Replace check_fb with controls_device
Date: Tue, 20 Aug 2024 11:23:04 +0200
Message-ID: <20240820093452.68270-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe),to(RLr3u6jgwj9sedc854c38mga)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
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

Rename check_fb in struct lcd_ops with controls_device. The callback
is not independent from fbdev's struct fb_info and tests is an lcd
device controls a hardware display device. The new naming and semantics
follow similar funcionality for backlight devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c          |  2 +-
 drivers/video/backlight/platform_lcd.c | 11 +++++------
 include/linux/lcd.h                    | 16 ++++++++++++----
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index edd5ccb7a43a..269ca9061df4 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -55,7 +55,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!ld->ops)
 		goto out;
-	if (ld->ops->check_fb && !ld->ops->check_fb(ld, evdata->info))
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, info->device))
 		goto out;
 	if (fb_lcd && fb_lcd != ld)
 		goto out;
diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 69a22d1a8a35..c9fe50f4d8ed 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -9,7 +9,6 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/slab.h>
 
@@ -50,17 +49,17 @@ static int platform_lcd_set_power(struct lcd_device *lcd, int power)
 	return 0;
 }
 
-static int platform_lcd_match(struct lcd_device *lcd, struct fb_info *info)
+static bool platform_lcd_controls_device(struct lcd_device *lcd, struct device *display_device)
 {
 	struct platform_lcd *plcd = to_our_lcd(lcd);
 
-	return plcd->us->parent == info->device;
+	return plcd->us->parent == display_device;
 }
 
 static const struct lcd_ops platform_lcd_ops = {
-	.get_power	= platform_lcd_get_power,
-	.set_power	= platform_lcd_set_power,
-	.check_fb	= platform_lcd_match,
+	.get_power		= platform_lcd_get_power,
+	.set_power		= platform_lcd_set_power,
+	.controls_device	= platform_lcd_controls_device,
 };
 
 static int platform_lcd_probe(struct platform_device *pdev)
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index dfcc54d327f5..8399b5ed48f2 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -35,7 +35,6 @@
  */
 
 struct lcd_device;
-struct fb_info;
 
 struct lcd_properties {
 	/* The maximum value for contrast (read-only) */
@@ -54,9 +53,18 @@ struct lcd_ops {
         int (*set_contrast)(struct lcd_device *, int contrast);
 	/* Set LCD panel mode (resolutions ...) */
 	int (*set_mode)(struct lcd_device *, struct fb_videomode *);
-	/* Check if given framebuffer device is the one LCD is bound to;
-	   return 0 if not, !=0 if it is. If NULL, lcd always matches the fb. */
-	int (*check_fb)(struct lcd_device *, struct fb_info *);
+
+	/*
+	 * Check if the LCD controls the given display device. This
+	 * operation is optional and if not implemented it is assumed that
+	 * the display is always the one controlled by the LCD.
+	 *
+	 * RETURNS:
+	 *
+	 * If display_dev is NULL or display_dev matches the device controlled by
+	 * the LCD, return true. Otherwise return false.
+	 */
+	bool (*controls_device)(struct lcd_device *lcd, struct device *display_device);
 };
 
 struct lcd_device {
-- 
2.46.0

