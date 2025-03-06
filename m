Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA950A54D31
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6DD10E9B1;
	Thu,  6 Mar 2025 14:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vYjQ0ECU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wm0vs66Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vYjQ0ECU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wm0vs66Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BBA10E9B2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:13:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC7671F786;
 Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741270392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6qjttdkahc1MoVW4s97PFdg4M/OojxRYNkzJj2CQt4=;
 b=vYjQ0ECUOEzUmjaqv4gjBm55nX7BYlkWmgiYWgkUJGXsi/GmWWHxeR8S3Fn9Dn9cwx+fAm
 RTeJTo+ylO4NHUztj/NKle/HMYX2nekOXNOUUMkqyn2fiNdwUSllFiYgZHR6RXw/FZLLlV
 ZBPaadY2+KLygt6D3AzWzXrgpdS82QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741270392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6qjttdkahc1MoVW4s97PFdg4M/OojxRYNkzJj2CQt4=;
 b=wm0vs66YxTKvCSq3DkGgkCVZ9uauh4qNvq0h9A85EnQ658gpEkPHlVqKvn5V6ECaJH6JAX
 gup9kGozdkns9bAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741270392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6qjttdkahc1MoVW4s97PFdg4M/OojxRYNkzJj2CQt4=;
 b=vYjQ0ECUOEzUmjaqv4gjBm55nX7BYlkWmgiYWgkUJGXsi/GmWWHxeR8S3Fn9Dn9cwx+fAm
 RTeJTo+ylO4NHUztj/NKle/HMYX2nekOXNOUUMkqyn2fiNdwUSllFiYgZHR6RXw/FZLLlV
 ZBPaadY2+KLygt6D3AzWzXrgpdS82QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741270392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6qjttdkahc1MoVW4s97PFdg4M/OojxRYNkzJj2CQt4=;
 b=wm0vs66YxTKvCSq3DkGgkCVZ9uauh4qNvq0h9A85EnQ658gpEkPHlVqKvn5V6ECaJH6JAX
 gup9kGozdkns9bAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 666C713676;
 Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +C2uF3ityWeveQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 10/11] leds: backlight trigger: Replace fb events with a
 dedicated function call
Date: Thu,  6 Mar 2025 15:05:52 +0100
Message-ID: <20250306140947.580324-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
References: <20250306140947.580324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
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

Remove support for fb events from the led backlight trigger. Provide
the helper ledtrig_backlight_blank() instead. Call it from fbdev to
inform the trigger of changes to a display's blank state.

Fbdev maintains a list of all installed notifiers. Instead of the fbdev
notifiers, maintain an internal list of led backlight triggers.

v3:
- export ledtrig_backlight_blank()
v2:
- maintain global list of led backlight triggers (Lee)
- avoid IS_REACHABLE() in source file (Lee)
- notify on changes to blank state instead of display state
- use lock guards
- initialize led list and list mutex

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/leds/trigger/ledtrig-backlight.c | 42 ++++++++++--------------
 drivers/video/fbdev/core/fbmem.c         | 19 ++++++-----
 include/linux/leds.h                     |  6 ++++
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 8e66d55a6c82..c1f0f5becaee 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/init.h>
-#include <linux/fb.h>
 #include <linux/leds.h>
 #include "../leds.h"
 
@@ -21,10 +20,14 @@ struct bl_trig_notifier {
 	struct led_classdev *led;
 	int brightness;
 	int old_status;
-	struct notifier_block notifier;
 	unsigned invert;
+
+	struct list_head entry;
 };
 
+static DEFINE_MUTEX(ledtrig_backlight_list_mutex);
+static LIST_HEAD(ledtrig_backlight_list);
+
 static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_status)
 {
 	struct led_classdev *led = n->led;
@@ -42,26 +45,17 @@ static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_s
 	n->old_status = new_status;
 }
 
-static int fb_notifier_callback(struct notifier_block *p,
-				unsigned long event, void *data)
+void ledtrig_backlight_blank(bool blank)
 {
-	struct bl_trig_notifier *n = container_of(p,
-					struct bl_trig_notifier, notifier);
-	struct fb_event *fb_event = data;
-	int *blank;
-	int new_status;
-
-	/* If we aren't interested in this event, skip it immediately ... */
-	if (event != FB_EVENT_BLANK)
-		return 0;
-
-	blank = fb_event->data;
-	new_status = *blank ? BLANK : UNBLANK;
+	struct bl_trig_notifier *n;
+	int new_status = blank ? BLANK : UNBLANK;
 
-	ledtrig_backlight_notify_blank(n, new_status);
+	guard(mutex)(&ledtrig_backlight_list_mutex);
 
-	return 0;
+	list_for_each_entry(n, &ledtrig_backlight_list, entry)
+		ledtrig_backlight_notify_blank(n, new_status);
 }
+EXPORT_SYMBOL(ledtrig_backlight_blank);
 
 static ssize_t bl_trig_invert_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -106,8 +100,6 @@ ATTRIBUTE_GROUPS(bl_trig);
 
 static int bl_trig_activate(struct led_classdev *led)
 {
-	int ret;
-
 	struct bl_trig_notifier *n;
 
 	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
@@ -118,11 +110,9 @@ static int bl_trig_activate(struct led_classdev *led)
 	n->led = led;
 	n->brightness = led->brightness;
 	n->old_status = UNBLANK;
-	n->notifier.notifier_call = fb_notifier_callback;
 
-	ret = fb_register_client(&n->notifier);
-	if (ret)
-		dev_err(led->dev, "unable to register backlight trigger\n");
+	guard(mutex)(&ledtrig_backlight_list_mutex);
+	list_add(&n->entry, &ledtrig_backlight_list);
 
 	return 0;
 }
@@ -131,7 +121,9 @@ static void bl_trig_deactivate(struct led_classdev *led)
 {
 	struct bl_trig_notifier *n = led_get_trigger_data(led);
 
-	fb_unregister_client(&n->notifier);
+	guard(mutex)(&ledtrig_backlight_list_mutex);
+	list_del(&n->entry);
+
 	kfree(n);
 }
 
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 001662c606d7..f089f72ec75a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -16,6 +16,7 @@
 #include <linux/fb.h>
 #include <linux/fbcon.h>
 #include <linux/lcd.h>
+#include <linux/leds.h>
 
 #include <video/nomodeset.h>
 
@@ -369,11 +370,17 @@ static void fb_lcd_notify_blank(struct fb_info *info)
 	lcd_notify_blank_all(info->device, power);
 }
 
+static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
+{
+	if (info->blank == FB_BLANK_UNBLANK)
+		ledtrig_backlight_blank(false);
+	else
+		ledtrig_backlight_blank(true);
+}
+
 int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
-	struct fb_event event;
-	int data[2];
 	int ret;
 
 	if (!info->fbops->fb_blank)
@@ -382,11 +389,6 @@ int fb_blank(struct fb_info *info, int blank)
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
 
-	data[0] = blank;
-	data[1] = old_blank;
-	event.info = info;
-	event.data = data;
-
 	info->blank = blank;
 
 	ret = info->fbops->fb_blank(blank, info);
@@ -395,8 +397,7 @@ int fb_blank(struct fb_info *info, int blank)
 
 	fb_bl_notify_blank(info, old_blank);
 	fb_lcd_notify_blank(info);
-
-	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
+	fb_ledtrig_backlight_notify_blank(info);
 
 	return 0;
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 98f9719c924c..b3f0aa081064 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -640,6 +640,12 @@ static inline void ledtrig_flash_ctrl(bool on) {}
 static inline void ledtrig_torch_ctrl(bool on) {}
 #endif
 
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)
+void ledtrig_backlight_blank(bool blank);
+#else
+static inline void ledtrig_backlight_blank(bool blank) {}
+#endif
+
 /*
  * Generic LED platform data for describing LED names and default triggers.
  */
-- 
2.48.1

