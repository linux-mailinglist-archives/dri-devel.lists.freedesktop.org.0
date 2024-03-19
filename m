Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C63387FAF9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1064110F917;
	Tue, 19 Mar 2024 09:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC2210F90B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:39:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E710137618;
 Tue, 19 Mar 2024 09:39:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 882F4136A5;
 Tue, 19 Mar 2024 09:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OFEkIEdd+WU6GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 09:39:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, andy@kernel.org, geert@linux-m68k.org,
 dan.carpenter@linaro.org, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Flavio Suligoi <f.suligoi@asem.it>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 6/6] backlight: Remove fb_blank from struct
 backlight_properties
Date: Tue, 19 Mar 2024 10:37:25 +0100
Message-ID: <20240319093915.31778-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319093915.31778-1-tzimmermann@suse.de>
References: <20240319093915.31778-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: E710137618
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

Remove the field fb_blank from struct backlight_properties and remove
all code that still sets or reads it. Backlight blank status is now
tracked exclusively in struct backlight_properties.state.

The core backlight code keeps the fb_blank and state fields in sync,
but doesn't do anything else with fb_blank. Several drivers initialize
fb_blank to FB_BLANK_UNBLANK to enable the backlight. This is already
the default for the state field. So we can delete the fb_blank code
from core and drivers and rely on the state field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Flavio Suligoi <f.suligoi@asem.it>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Tested-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/backlight/backlight.c           |  2 --
 drivers/video/backlight/mp3309c.c             |  1 -
 drivers/video/backlight/omap1_bl.c            |  1 -
 drivers/video/fbdev/atmel_lcdfb.c             |  1 -
 .../omap2/omapfb/displays/panel-dsi-cm.c      |  1 -
 .../omapfb/displays/panel-sony-acx565akm.c    |  1 -
 include/linux/backlight.h                     | 25 +------------------
 7 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 86e1cdc8e3697..691f1f3030e98 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -118,14 +118,12 @@ static int fb_notifier_callback(struct notifier_block *self,
 		bd->fb_bl_on[node] = true;
 		if (!bd->use_count++) {
 			bd->props.state &= ~BL_CORE_FBBLANK;
-			bd->props.fb_blank = FB_BLANK_UNBLANK;
 			backlight_update_status(bd);
 		}
 	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
 		bd->fb_bl_on[node] = false;
 		if (!(--bd->use_count)) {
 			bd->props.state |= BL_CORE_FBBLANK;
-			bd->props.fb_blank = fb_blank;
 			backlight_update_status(bd);
 		}
 	}
diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 34d71259fac1d..059f4ddbbc842 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -378,7 +378,6 @@ static int mp3309c_probe(struct i2c_client *client)
 	props.scale = BACKLIGHT_SCALE_LINEAR;
 	props.type = BACKLIGHT_RAW;
 	props.power = FB_BLANK_UNBLANK;
-	props.fb_blank = FB_BLANK_UNBLANK;
 	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
 						  chip->dev, chip,
 						  &mp3309c_bl_ops, &props);
diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
index 636b390f78f04..e461e19231ae3 100644
--- a/drivers/video/backlight/omap1_bl.c
+++ b/drivers/video/backlight/omap1_bl.c
@@ -139,7 +139,6 @@ static int omapbl_probe(struct platform_device *pdev)
 
 	omap_cfg_reg(PWL);	/* Conflicts with UART3 */
 
-	dev->props.fb_blank = FB_BLANK_UNBLANK;
 	dev->props.brightness = pdata->default_intensity;
 	omapbl_update_status(dev);
 
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 9e391e5eaf9da..5574fb0361ee3 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -153,7 +153,6 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
 	sinfo->backlight = bl;
 
 	bl->props.power = FB_BLANK_UNBLANK;
-	bl->props.fb_blank = FB_BLANK_UNBLANK;
 	bl->props.brightness = atmel_bl_get_brightness(bl);
 }
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 47683a6c00767..274bdf7b3b459 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -1215,7 +1215,6 @@ static int dsicm_probe(struct platform_device *pdev)
 
 		ddata->bldev = bldev;
 
-		bldev->props.fb_blank = FB_BLANK_UNBLANK;
 		bldev->props.power = FB_BLANK_UNBLANK;
 		bldev->props.brightness = 255;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 9d3ce234a7874..71d2e015960c7 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -753,7 +753,6 @@ static int acx565akm_probe(struct spi_device *spi)
 	}
 
 	memset(&props, 0, sizeof(props));
-	props.fb_blank = FB_BLANK_UNBLANK;
 	props.power = FB_BLANK_UNBLANK;
 	props.type = BACKLIGHT_RAW;
 
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a8..31600b144d794 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -218,25 +218,6 @@ struct backlight_properties {
 	 */
 	int power;
 
-	/**
-	 * @fb_blank: The power state from the FBIOBLANK ioctl.
-	 *
-	 * When the FBIOBLANK ioctl is called @fb_blank is set to the
-	 * blank parameter and the update_status() operation is called.
-	 *
-	 * When the backlight device is enabled @fb_blank is set
-	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
-	 * @fb_blank is set to FB_BLANK_POWERDOWN.
-	 *
-	 * Backlight drivers should avoid using this property. It has been
-	 * replaced by state & BL_CORE_FBLANK (although most drivers should
-	 * use backlight_is_blank() as the preferred means to get the blank
-	 * state).
-	 *
-	 * fb_blank is deprecated and will be removed.
-	 */
-	int fb_blank;
-
 	/**
 	 * @type: The type of backlight supported.
 	 *
@@ -366,7 +347,6 @@ static inline int backlight_enable(struct backlight_device *bd)
 		return 0;
 
 	bd->props.power = FB_BLANK_UNBLANK;
-	bd->props.fb_blank = FB_BLANK_UNBLANK;
 	bd->props.state &= ~BL_CORE_FBBLANK;
 
 	return backlight_update_status(bd);
@@ -382,7 +362,6 @@ static inline int backlight_disable(struct backlight_device *bd)
 		return 0;
 
 	bd->props.power = FB_BLANK_POWERDOWN;
-	bd->props.fb_blank = FB_BLANK_POWERDOWN;
 	bd->props.state |= BL_CORE_FBBLANK;
 
 	return backlight_update_status(bd);
@@ -395,15 +374,13 @@ static inline int backlight_disable(struct backlight_device *bd)
  * Display is expected to be blank if any of these is true::
  *
  *   1) if power in not UNBLANK
- *   2) if fb_blank is not UNBLANK
- *   3) if state indicate BLANK or SUSPENDED
+ *   2) if state indicate BLANK or SUSPENDED
  *
  * Returns true if display is expected to be blank, false otherwise.
  */
 static inline bool backlight_is_blank(const struct backlight_device *bd)
 {
 	return bd->props.power != FB_BLANK_UNBLANK ||
-	       bd->props.fb_blank != FB_BLANK_UNBLANK ||
 	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
 }
 
-- 
2.44.0

