Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4596ECB7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B2F10E986;
	Fri,  6 Sep 2024 07:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kemJvG99";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sXybBtxS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kemJvG99";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sXybBtxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E795310E97D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 806221F8A4;
 Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CGGhocsfFKCTiL5J1LrCr4fste5CC9euAMr/GNeoRU=;
 b=kemJvG995Sz6dq0b27TS1+lDcWwYFXt/b3fMD7zqEx4i5cWVMlg7YnHdQiGNykHD3cW8Hn
 YwuWyJi/uWMmg75pxoPQ/La4dJM0kG087kAvkbCQNy6U9F1ejd63PlHZwcxDMA3EghBITi
 6EqC4HVP/xgXCr7PX9ogdUSf+0qG+yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CGGhocsfFKCTiL5J1LrCr4fste5CC9euAMr/GNeoRU=;
 b=sXybBtxSGsFPfvkv2n47NdB3UjU4d/G9VneKvuJdKIFgzviN1C3Em3aBD+RzBqDJNMPYnk
 O1FLFf9U64eH9GAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CGGhocsfFKCTiL5J1LrCr4fste5CC9euAMr/GNeoRU=;
 b=kemJvG995Sz6dq0b27TS1+lDcWwYFXt/b3fMD7zqEx4i5cWVMlg7YnHdQiGNykHD3cW8Hn
 YwuWyJi/uWMmg75pxoPQ/La4dJM0kG087kAvkbCQNy6U9F1ejd63PlHZwcxDMA3EghBITi
 6EqC4HVP/xgXCr7PX9ogdUSf+0qG+yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CGGhocsfFKCTiL5J1LrCr4fste5CC9euAMr/GNeoRU=;
 b=sXybBtxSGsFPfvkv2n47NdB3UjU4d/G9VneKvuJdKIFgzviN1C3Em3aBD+RzBqDJNMPYnk
 O1FLFf9U64eH9GAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 213FB13A7A;
 Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GNLcBlC12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 26/28] backlight: lcd: Replace check_fb with controls_device
Date: Fri,  6 Sep 2024 09:52:40 +0200
Message-ID: <20240906075439.98476-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Rename check_fb in struct lcd_ops to controls_device. The callback
is now independent from fbdev's struct fb_info and tests if an lcd
device controls a hardware display device. The new naming and semantics
follow similar functionality for backlight devices.

v2:
- fix typos in commit description (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lcd.c          |  2 +-
 drivers/video/backlight/platform_lcd.c | 11 +++++------
 include/linux/lcd.h                    | 16 ++++++++++++----
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 713f7fb8b10a..dd175b446180 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -54,7 +54,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!ld->ops)
 		return 0;
-	if (ld->ops->check_fb && !ld->ops->check_fb(ld, info))
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, info->device))
 		return 0;
 	if (fb_lcd && fb_lcd != ld)
 		return 0;
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

