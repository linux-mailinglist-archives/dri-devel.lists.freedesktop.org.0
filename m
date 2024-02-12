Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D28518ED
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 17:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A363A10E806;
	Mon, 12 Feb 2024 16:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB15310E806
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 16:26:51 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70966220E6;
 Mon, 12 Feb 2024 16:26:50 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2011213A0E;
 Mon, 12 Feb 2024 16:26:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gIKhBspGymXmXgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 16:26:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Subject: [PATCH 04/10] hid/hid-picolcd: Remove struct backlight_ops.check_fb
Date: Mon, 12 Feb 2024 17:16:37 +0100
Message-ID: <20240212162645.5661-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212162645.5661-1-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 70966220E6
X-Spam-Level: 
X-Spam-Score: -4.00
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

The driver sets struct fb_info.bl_dev to the correct backlight
device. Thus rely on the backlight core code to match backlight
and framebuffer devices, and remove the extra check_fb function
from struct backlight_ops.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
---
 drivers/hid/hid-picolcd_backlight.c | 7 -------
 drivers/hid/hid-picolcd_fb.c        | 4 ++++
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-picolcd_backlight.c b/drivers/hid/hid-picolcd_backlight.c
index 5bd2a8c4bbd66..08d16917eb60b 100644
--- a/drivers/hid/hid-picolcd_backlight.c
+++ b/drivers/hid/hid-picolcd_backlight.c
@@ -9,7 +9,6 @@
 
 #include <linux/hid.h>
 
-#include <linux/fb.h>
 #include <linux/backlight.h>
 
 #include "hid-picolcd.h"
@@ -39,15 +38,9 @@ static int picolcd_set_brightness(struct backlight_device *bdev)
 	return 0;
 }
 
-static int picolcd_check_bl_fb(struct backlight_device *bdev, struct fb_info *fb)
-{
-	return fb && fb == picolcd_fbinfo((struct picolcd_data *)bl_get_data(bdev));
-}
-
 static const struct backlight_ops picolcd_blops = {
 	.update_status  = picolcd_set_brightness,
 	.get_brightness = picolcd_get_brightness,
-	.check_fb       = picolcd_check_bl_fb,
 };
 
 int picolcd_init_backlight(struct picolcd_data *data, struct hid_report *report)
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index d7dddd99d325e..4500f6e03d32f 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -493,6 +493,10 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
 	info->fix = picolcdfb_fix;
 	info->fix.smem_len   = PICOLCDFB_SIZE*8;
 
+#ifdef CONFIG_HID_PICOLCD_BACKLIGHT
+	info->bl_dev = data->backlight;
+#endif
+
 	fbdata = info->par;
 	spin_lock_init(&fbdata->lock);
 	fbdata->picolcd = data;
-- 
2.43.0

