Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A396ECCA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CCF10E994;
	Fri,  6 Sep 2024 07:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554E10E984
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E66BA21A52;
 Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86C4D136A8;
 Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AIZ9H1C12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 27/28] backlight: lcd: Remove struct fb_videomode from
 set_mode callback
Date: Fri,  6 Sep 2024 09:52:41 +0200
Message-ID: <20240906075439.98476-28-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E66BA21A52
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

Implementations of struct lcd_ops.set_mode only require the resolution
from struct fb_videomode. Pass the xres and yres fields, but remove the
dependency on the fbdev data structure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/corgi_lcd.c | 5 ++---
 drivers/video/backlight/lcd.c       | 4 +++-
 drivers/video/backlight/tdo24m.c    | 5 ++---
 include/linux/lcd.h                 | 7 +++++--
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index 35c3fd3281ca..69f49371ea35 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -17,7 +17,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/corgi_lcd.h>
@@ -332,12 +331,12 @@ static void corgi_lcd_power_off(struct corgi_lcd *lcd)
 			POWER1_VW_OFF | POWER1_GVSS_OFF | POWER1_VDD_OFF);
 }
 
-static int corgi_lcd_set_mode(struct lcd_device *ld, struct fb_videomode *m)
+static int corgi_lcd_set_mode(struct lcd_device *ld, u32 xres, u32 yres)
 {
 	struct corgi_lcd *lcd = lcd_get_data(ld);
 	int mode = CORGI_LCD_MODE_QVGA;
 
-	if (m->xres == 640 || m->xres == 480)
+	if (xres == 640 || xres == 480)
 		mode = CORGI_LCD_MODE_VGA;
 
 	if (lcd->mode == mode)
diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index dd175b446180..3267acf8dc5b 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -65,8 +65,10 @@ static int fb_notifier_callback(struct notifier_block *self,
 		if (ld->ops->set_power)
 			ld->ops->set_power(ld, power);
 	} else {
+		const struct fb_videomode *videomode = evdata->data;
+
 		if (ld->ops->set_mode)
-			ld->ops->set_mode(ld, evdata->data);
+			ld->ops->set_mode(ld, videomode->xres, videomode->yres);
 	}
 
 	return 0;
diff --git a/drivers/video/backlight/tdo24m.c b/drivers/video/backlight/tdo24m.c
index a14a94114e9d..c04ee3d04d87 100644
--- a/drivers/video/backlight/tdo24m.c
+++ b/drivers/video/backlight/tdo24m.c
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/tdo24m.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/slab.h>
 
@@ -308,12 +307,12 @@ static int tdo24m_get_power(struct lcd_device *ld)
 	return lcd->power;
 }
 
-static int tdo24m_set_mode(struct lcd_device *ld, struct fb_videomode *m)
+static int tdo24m_set_mode(struct lcd_device *ld, u32 xres, u32 yres)
 {
 	struct tdo24m *lcd = lcd_get_data(ld);
 	int mode = MODE_QVGA;
 
-	if (m->xres == 640 || m->xres == 480)
+	if (xres == 640 || xres == 480)
 		mode = MODE_VGA;
 
 	if (lcd->mode == mode)
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 8399b5ed48f2..59a80b396a71 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -51,8 +51,11 @@ struct lcd_ops {
 	int (*get_contrast)(struct lcd_device *);
 	/* Set LCD panel contrast */
         int (*set_contrast)(struct lcd_device *, int contrast);
-	/* Set LCD panel mode (resolutions ...) */
-	int (*set_mode)(struct lcd_device *, struct fb_videomode *);
+
+	/*
+	 * Set LCD panel mode (resolutions ...)
+	 */
+	int (*set_mode)(struct lcd_device *lcd, u32 xres, u32 yres);
 
 	/*
 	 * Check if the LCD controls the given display device. This
-- 
2.46.0

