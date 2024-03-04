Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D7870716
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839C711231E;
	Mon,  4 Mar 2024 16:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627C8112315
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:32:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 871301FF57;
 Mon,  4 Mar 2024 16:32:24 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F04713A92;
 Mon,  4 Mar 2024 16:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id aOolCpj35WVLAQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 16:32:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
Date: Mon,  4 Mar 2024 17:29:46 +0100
Message-ID: <20240304163220.19144-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304163220.19144-1-tzimmermann@suse.de>
References: <20240304163220.19144-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 871301FF57
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

Framebuffer drivers for devices with dedicated backlight are supposed
to set struct fb_info.bl_dev to the backlight's respective device. Use
the value to match backlight and framebuffer in the backlight core code.

The code first tests against struct backlight_ops.check_ops. If this
test succeeds, it performs the test against fbdev. So backlight drivers
can override the later test as before.

Fbdev's backlight support depends on CONFIG_FB_BACKLIGHT. To avoid
ifdef in the code, the new helper fb_bl_device() returns the backlight
device, or NULL if the config option has been disabled. The test in
the backlight code will then do nothing.

v3:
	* hide ifdef in fb_bl_device() (Lee)
	* no if-else blocks (Andy)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/backlight/backlight.c     | 8 ++++++--
 drivers/video/fbdev/core/fb_backlight.c | 5 +++++
 include/linux/fb.h                      | 9 +++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 86e1cdc8e3697..4f7973c6fcc79 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -98,7 +98,9 @@ static int fb_notifier_callback(struct notifier_block *self,
 {
 	struct backlight_device *bd;
 	struct fb_event *evdata = data;
-	int node = evdata->info->node;
+	struct fb_info *info = evdata->info;
+	struct backlight_device *fb_bd = fb_bl_device(info);
+	int node = info->node;
 	int fb_blank = 0;
 
 	/* If we aren't interested in this event, skip it immediately ... */
@@ -110,7 +112,9 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!bd->ops)
 		goto out;
-	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
+	if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
+		goto out;
+	if (fb_bd && fb_bd != bd)
 		goto out;
 
 	fb_blank = *(int *)evdata->data;
diff --git a/drivers/video/fbdev/core/fb_backlight.c b/drivers/video/fbdev/core/fb_backlight.c
index e2d3b3adc870f..d3470a90042ea 100644
--- a/drivers/video/fbdev/core/fb_backlight.c
+++ b/drivers/video/fbdev/core/fb_backlight.c
@@ -30,4 +30,9 @@ void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
 	mutex_unlock(&fb_info->bl_curve_mutex);
 }
 EXPORT_SYMBOL_GPL(fb_bl_default_curve);
+
+struct backlight_device *fb_bl_device(struct fb_info *info)
+{
+	return info->bl_dev;
+}
 #endif
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 708e6a177b1be..1dce640308b5e 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -732,6 +732,15 @@ extern struct fb_info *framebuffer_alloc(size_t size, struct device *dev);
 extern void framebuffer_release(struct fb_info *info);
 extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max);
 
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+struct backlight_device *fb_bl_device(struct fb_info *info);
+#else
+struct backlight_device *fb_bl_device(struct fb_info *info)
+{
+	return NULL;
+}
+#endif
+
 /* fbmon.c */
 #define FB_MAXTIMINGS		0
 #define FB_VSYNCTIMINGS		1
-- 
2.44.0

