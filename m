Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2FBA2ACCF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA9410E8B0;
	Thu,  6 Feb 2025 15:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="heIeLe3f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G257eZme";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vZfcmheD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N7HAUygQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDA510E8AC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B725C1F450;
 Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/GIQVkpHxJ+GI04jthWUn4ca+shl1eH95iOIeDhcyk=;
 b=heIeLe3ffCQb+21eCLQrmvVxHn4GBL9FjItfEbV8HsJu2bHOTtXfp5i3Oy5N2XNfGroOL9
 /T31IrBVozOWjPgiilTzNSMRRiBNRgDuX1hvmlioXunaNtW76aTI1pwVZzz0p3hFcQeohg
 oBOLlYWLSHB+UOM3a0DXDW4g8iCMOo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/GIQVkpHxJ+GI04jthWUn4ca+shl1eH95iOIeDhcyk=;
 b=G257eZmewITO1DXH1a4QdyRWHOVwOraIK2GmNjaOF2V1rMjRTpF2+EeaNutWxl1OpbqSVm
 QP9cdIvmnS/JyiDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/GIQVkpHxJ+GI04jthWUn4ca+shl1eH95iOIeDhcyk=;
 b=vZfcmheDqUkyppyDsiMtz3x+Mx7EZz4AT0zdIeLC/b0iM5/RoEazcWYwp8ceY376RYB+CO
 zBOcJVnmYzRTwCwwZbM55rMrTkIy0027tHfbqfjD2jj/R+9/F1btdtc41wouMpgCeGinA1
 m2UDrs7yrXMy0iSz4iKr/lFFl6W7gRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/GIQVkpHxJ+GI04jthWUn4ca+shl1eH95iOIeDhcyk=;
 b=N7HAUygQbTpn56kE/X5iidb6sp0BJp00bMS9BWgsZI65vquIQeqG781wAhMxqr6x/xgGOJ
 rN/H3hcSlqw3MTAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 743C313A7F;
 Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KJYwG/7XpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/13] backlight: lcd: Replace fb events with a dedicated
 function call
Date: Thu,  6 Feb 2025 16:30:28 +0100
Message-ID: <20250206154033.697495-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

Remove support for fb events from the lcd subsystem. Provide the
helper lcd_notify_blank_all() instead. In fbdev, call
lcd_notify_blank_all() to inform the lcd subsystem of changes
to a display's blank state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c    | 90 ++++++--------------------------
 drivers/video/fbdev/core/fbmem.c | 43 +++++++++++++--
 include/linux/lcd.h              |  7 +--
 3 files changed, 60 insertions(+), 80 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index b2ee25060d66..67daa3757211 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -15,7 +15,6 @@
 #include <linux/notifier.h>
 #include <linux/ctype.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
 static struct list_head lcd_dev_list;
@@ -34,6 +33,17 @@ static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
 	ld->ops->set_power(ld, power);
 }
 
+void lcd_notify_blank_all(struct device *display_dev, int power)
+{
+	struct lcd_device *ld;
+
+	guard(mutex)(&lcd_dev_list_mutex);
+
+	list_for_each_entry(ld, &lcd_dev_list, entry)
+		lcd_notify_blank(ld, display_dev, power);
+}
+EXPORT_SYMBOL(lcd_notify_blank_all);
+
 static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display_dev,
 				   unsigned int width, unsigned int height)
 {
@@ -47,75 +57,16 @@ static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display
 	ld->ops->set_mode(ld, width, height);
 }
 
-#if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
-			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
-static int to_lcd_power(int fb_blank)
-{
-	switch (fb_blank) {
-	case FB_BLANK_UNBLANK:
-		return LCD_POWER_ON;
-	/* deprecated; TODO: should become 'off' */
-	case FB_BLANK_NORMAL:
-		return LCD_POWER_REDUCED;
-	case FB_BLANK_VSYNC_SUSPEND:
-		return LCD_POWER_REDUCED_VSYNC_SUSPEND;
-	/* 'off' */
-	case FB_BLANK_HSYNC_SUSPEND:
-	case FB_BLANK_POWERDOWN:
-	default:
-		return LCD_POWER_OFF;
-	}
-}
-
-/* This callback gets called when something important happens inside a
- * framebuffer driver. We're looking if that important event is blanking,
- * and if it is, we're switching lcd power as well ...
- */
-static int fb_notifier_callback(struct notifier_block *self,
-				 unsigned long event, void *data)
-{
-	struct lcd_device *ld = container_of(self, struct lcd_device, fb_notif);
-	struct fb_event *evdata = data;
-	struct fb_info *info = evdata->info;
-	struct lcd_device *fb_lcd = fb_lcd_device(info);
-
-	if (fb_lcd && fb_lcd != ld)
-		return 0;
-
-	if (event == FB_EVENT_BLANK) {
-		int power = to_lcd_power(*(int *)evdata->data);
-
-		lcd_notify_blank(ld, info->device, power);
-	} else {
-		const struct fb_videomode *videomode = evdata->data;
-
-		lcd_notify_mode_change(ld, info->device, videomode->xres, videomode->yres);
-	}
-
-	return 0;
-}
-
-static int lcd_register_fb(struct lcd_device *ld)
+void lcd_notify_mode_change_all(struct device *display_dev,
+				unsigned int width, unsigned int height)
 {
-	memset(&ld->fb_notif, 0, sizeof(ld->fb_notif));
-	ld->fb_notif.notifier_call = fb_notifier_callback;
-	return fb_register_client(&ld->fb_notif);
-}
+	struct lcd_device *ld;
 
-static void lcd_unregister_fb(struct lcd_device *ld)
-{
-	fb_unregister_client(&ld->fb_notif);
-}
-#else
-static int lcd_register_fb(struct lcd_device *ld)
-{
-	return 0;
-}
+	guard(mutex)(&lcd_dev_list_mutex);
 
-static inline void lcd_unregister_fb(struct lcd_device *ld)
-{
+	list_for_each_entry(ld, &lcd_dev_list, entry)
+		lcd_notify_mode_change(ld, display_dev, width, height);
 }
-#endif /* CONFIG_FB */
 
 static ssize_t lcd_power_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -266,12 +217,6 @@ struct lcd_device *lcd_device_register(const char *name, struct device *parent,
 		return ERR_PTR(rc);
 	}
 
-	rc = lcd_register_fb(new_ld);
-	if (rc) {
-		device_unregister(&new_ld->dev);
-		return ERR_PTR(rc);
-	}
-
 	mutex_lock(&lcd_dev_list_mutex);
 	list_add(&new_ld->entry, &lcd_dev_list);
 	mutex_unlock(&lcd_dev_list_mutex);
@@ -298,7 +243,6 @@ void lcd_device_unregister(struct lcd_device *ld)
 	mutex_lock(&ld->ops_lock);
 	ld->ops = NULL;
 	mutex_unlock(&ld->ops_lock);
-	lcd_unregister_fb(ld);
 
 	device_unregister(&ld->dev);
 }
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 993fbee602e0..fb7ca143a996 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -15,6 +15,7 @@
 #include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
+#include <linux/lcd.h>
 
 #include <video/nomodeset.h>
 
@@ -220,6 +221,14 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 	return err;
 }
 
+static void fb_lcd_notify_mode_change(struct fb_info *info,
+				      struct fb_videomode *mode)
+{
+#if IS_REACHABLE(CONFIG_LCD_CLASS_DEVICE)
+	lcd_notify_mode_change_all(info->device, mode->xres, mode->yres);
+#endif
+}
+
 int
 fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 {
@@ -227,7 +236,6 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	u32 activate;
 	struct fb_var_screeninfo old_var;
 	struct fb_videomode mode;
-	struct fb_event event;
 	u32 unused;
 
 	if (var->activate & FB_ACTIVATE_INV_MODE) {
@@ -331,14 +339,40 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	if (ret)
 		return ret;
 
-	event.info = info;
-	event.data = &mode;
-	fb_notifier_call_chain(FB_EVENT_MODE_CHANGE, &event);
+	fb_lcd_notify_mode_change(info, &mode);
 
 	return 0;
 }
 EXPORT_SYMBOL(fb_set_var);
 
+static void fb_lcd_notify_blank(struct fb_info *info)
+{
+#if IS_REACHABLE(CONFIG_LCD_CLASS_DEVICE)
+	int power;
+
+	switch (info->blank) {
+	case FB_BLANK_UNBLANK:
+		power = LCD_POWER_ON;
+		break;
+	/* deprecated; TODO: should become 'off' */
+	case FB_BLANK_NORMAL:
+		power = LCD_POWER_REDUCED;
+		break;
+	case FB_BLANK_VSYNC_SUSPEND:
+		power = LCD_POWER_REDUCED_VSYNC_SUSPEND;
+		break;
+	/* 'off' */
+	case FB_BLANK_HSYNC_SUSPEND:
+	case FB_BLANK_POWERDOWN:
+	default:
+		power = LCD_POWER_OFF;
+		break;
+	}
+
+	lcd_notify_blank_all(info->device, power);
+#endif
+}
+
 int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
@@ -364,6 +398,7 @@ int fb_blank(struct fb_info *info, int blank)
 		goto err;
 
 	fb_bl_notify_blank(info, old_blank);
+	fb_lcd_notify_blank(info);
 
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 195b95edb13f..cabcc193a818 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -11,7 +11,6 @@
 
 #include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 
 #define LCD_POWER_ON			(0)
 #define LCD_POWER_REDUCED		(1) // deprecated; don't use in new code
@@ -79,8 +78,6 @@ struct lcd_device {
 	const struct lcd_ops *ops;
 	/* Serialise access to set_power method */
 	struct mutex update_lock;
-	/* The framebuffer notifier block */
-	struct notifier_block fb_notif;
 
 	/**
 	 * @entry: List entry of all registered lcd devices
@@ -130,6 +127,10 @@ extern void lcd_device_unregister(struct lcd_device *ld);
 extern void devm_lcd_device_unregister(struct device *dev,
 	struct lcd_device *ld);
 
+void lcd_notify_blank_all(struct device *display_dev, int power);
+void lcd_notify_mode_change_all(struct device *display_dev,
+				unsigned int width, unsigned int height);
+
 #define to_lcd_device(obj) container_of(obj, struct lcd_device, dev)
 
 static inline void * lcd_get_data(struct lcd_device *ld_dev)
-- 
2.48.1

