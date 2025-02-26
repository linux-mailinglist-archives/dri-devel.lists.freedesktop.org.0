Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F1A45A3E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F6A10E8A6;
	Wed, 26 Feb 2025 09:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A46410E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 09:37:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7FAD2119B;
 Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5878113A53;
 Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qCJOFOvgvmezXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/11] backlight: lcd: Replace fb events with a dedicated
 function call
Date: Wed, 26 Feb 2025 10:31:57 +0100
Message-ID: <20250226093456.147402-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226093456.147402-1-tzimmermann@suse.de>
References: <20250226093456.147402-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: A7FAD2119B
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

Remove support for fb events from the lcd subsystem. Provide the
helper lcd_notify_blank_all() instead. In fbdev, call
lcd_notify_blank_all() to inform the lcd subsystem of changes
to a display's blank state.

Fbdev maintains a list of all installed notifiers. Instead of fbdev
notifiers, maintain an internal list of lcd devices.

v2:
- maintain global list of lcd devices
- avoid IS_REACHABLE() in source file
- use lock guards
- initialize lcd list and list mutex

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c    | 97 ++++++++------------------------
 drivers/video/fbdev/core/fbmem.c | 39 +++++++++++--
 include/linux/lcd.h              | 21 ++++++-
 3 files changed, 78 insertions(+), 79 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index f57ff8bcc2fa..b59531d7f4d6 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -15,9 +15,11 @@
 #include <linux/notifier.h>
 #include <linux/ctype.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
+static DEFINE_MUTEX(lcd_dev_list_mutex);
+static LIST_HEAD(lcd_dev_list);
+
 static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
 			     int power)
 {
@@ -31,6 +33,17 @@ static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
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
@@ -44,76 +57,17 @@ static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display
 	ld->ops->set_mode(ld, width, height);
 }
 
-#if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
-			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
-static int to_lcd_power(int fb_blank)
+void lcd_notify_mode_change_all(struct device *display_dev,
+				unsigned int width, unsigned int height)
 {
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
+	struct lcd_device *ld;
 
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
+	guard(mutex)(&lcd_dev_list_mutex);
 
-	return 0;
+	list_for_each_entry(ld, &lcd_dev_list, entry)
+		lcd_notify_mode_change(ld, display_dev, width, height);
 }
 
-static int lcd_register_fb(struct lcd_device *ld)
-{
-	memset(&ld->fb_notif, 0, sizeof(ld->fb_notif));
-	ld->fb_notif.notifier_call = fb_notifier_callback;
-	return fb_register_client(&ld->fb_notif);
-}
-
-static void lcd_unregister_fb(struct lcd_device *ld)
-{
-	fb_unregister_client(&ld->fb_notif);
-}
-#else
-static int lcd_register_fb(struct lcd_device *ld)
-{
-	return 0;
-}
-
-static inline void lcd_unregister_fb(struct lcd_device *ld)
-{
-}
-#endif /* CONFIG_FB */
-
 static ssize_t lcd_power_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
@@ -263,11 +217,8 @@ struct lcd_device *lcd_device_register(const char *name, struct device *parent,
 		return ERR_PTR(rc);
 	}
 
-	rc = lcd_register_fb(new_ld);
-	if (rc) {
-		device_unregister(&new_ld->dev);
-		return ERR_PTR(rc);
-	}
+	guard(mutex)(&lcd_dev_list_mutex);
+	list_add(&new_ld->entry, &lcd_dev_list);
 
 	return new_ld;
 }
@@ -284,10 +235,12 @@ void lcd_device_unregister(struct lcd_device *ld)
 	if (!ld)
 		return;
 
+	guard(mutex)(&lcd_dev_list_mutex);
+	list_del(&ld->entry);
+
 	mutex_lock(&ld->ops_lock);
 	ld->ops = NULL;
 	mutex_unlock(&ld->ops_lock);
-	lcd_unregister_fb(ld);
 
 	device_unregister(&ld->dev);
 }
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index c931f270ac34..001662c606d7 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -15,6 +15,7 @@
 #include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
+#include <linux/lcd.h>
 
 #include <video/nomodeset.h>
 
@@ -220,6 +221,12 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 	return err;
 }
 
+static void fb_lcd_notify_mode_change(struct fb_info *info,
+				      struct fb_videomode *mode)
+{
+	lcd_notify_mode_change_all(info->device, mode->xres, mode->yres);
+}
+
 int
 fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 {
@@ -227,7 +234,6 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	u32 activate;
 	struct fb_var_screeninfo old_var;
 	struct fb_videomode mode;
-	struct fb_event event;
 	u32 unused;
 
 	if (var->activate & FB_ACTIVATE_INV_MODE) {
@@ -331,14 +337,38 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
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
+}
+
 int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
@@ -364,6 +394,7 @@ int fb_blank(struct fb_info *info, int blank)
 		goto err;
 
 	fb_bl_notify_blank(info, old_blank);
+	fb_lcd_notify_blank(info);
 
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index c3ccdff4519a..d4fa03722b72 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -11,7 +11,6 @@
 
 #include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 
 #define LCD_POWER_ON			(0)
 #define LCD_POWER_REDUCED		(1) // deprecated; don't use in new code
@@ -79,8 +78,11 @@ struct lcd_device {
 	const struct lcd_ops *ops;
 	/* Serialise access to set_power method */
 	struct mutex update_lock;
-	/* The framebuffer notifier block */
-	struct notifier_block fb_notif;
+
+	/**
+	 * @entry: List entry of all registered lcd devices
+	 */
+	struct list_head entry;
 
 	struct device dev;
 };
@@ -125,6 +127,19 @@ extern void lcd_device_unregister(struct lcd_device *ld);
 extern void devm_lcd_device_unregister(struct device *dev,
 	struct lcd_device *ld);
 
+#if IS_REACHABLE(CONFIG_LCD_CLASS_DEVICE)
+void lcd_notify_blank_all(struct device *display_dev, int power);
+void lcd_notify_mode_change_all(struct device *display_dev,
+				unsigned int width, unsigned int height);
+#else
+static inline void lcd_notify_blank_all(struct device *display_dev, int power)
+{}
+
+static inline void lcd_notify_mode_change_all(struct device *display_dev,
+					      unsigned int width, unsigned int height)
+{}
+#endif
+
 #define to_lcd_device(obj) container_of(obj, struct lcd_device, dev)
 
 static inline void * lcd_get_data(struct lcd_device *ld_dev)
-- 
2.48.1

