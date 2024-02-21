Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C088E85D401
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924D10E503;
	Wed, 21 Feb 2024 09:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lsATnrjx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8TFBqIGS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lsATnrjx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8TFBqIGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29F610E693
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:43:32 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4982C22149;
 Wed, 21 Feb 2024 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708508611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9poqBGT1D4fdmvAl6rpVBJMyFuTWxjtusItU2HOV0Sc=;
 b=lsATnrjxW9kbUCri3Z9QiTUQMw6Dieqk6fUFX7mmSZl1rb5w9FKGHxXX8fwV4nC8Swi4Xk
 nIBFzG9p59bAbc2O4hpIvE4/yPkUxDKmlrNlRuZNSQQuMtTlvNp1DmfQmak7Y35o1IkIdi
 Tew86zcSJz/MnIsC9F/2dILNWJXrdVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708508611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9poqBGT1D4fdmvAl6rpVBJMyFuTWxjtusItU2HOV0Sc=;
 b=8TFBqIGSgIY3LqR8c/7+PJaqa20uDN1lHoz3R1d5g4qc32jDiseM+McDGdzp9OYed/X7Gy
 LAQcS8pd8nnIvsCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708508611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9poqBGT1D4fdmvAl6rpVBJMyFuTWxjtusItU2HOV0Sc=;
 b=lsATnrjxW9kbUCri3Z9QiTUQMw6Dieqk6fUFX7mmSZl1rb5w9FKGHxXX8fwV4nC8Swi4Xk
 nIBFzG9p59bAbc2O4hpIvE4/yPkUxDKmlrNlRuZNSQQuMtTlvNp1DmfQmak7Y35o1IkIdi
 Tew86zcSJz/MnIsC9F/2dILNWJXrdVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708508611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9poqBGT1D4fdmvAl6rpVBJMyFuTWxjtusItU2HOV0Sc=;
 b=8TFBqIGSgIY3LqR8c/7+PJaqa20uDN1lHoz3R1d5g4qc32jDiseM+McDGdzp9OYed/X7Gy
 LAQcS8pd8nnIvsCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D1A0E13A42;
 Wed, 21 Feb 2024 09:43:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 2O+1McLF1WUpCwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 09:43:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, andy@kernel.org, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/10] backlight: Add controls_device callback to struct
 backlight_ops
Date: Wed, 21 Feb 2024 10:41:37 +0100
Message-ID: <20240221094324.27436-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221094324.27436-1-tzimmermann@suse.de>
References: <20240221094324.27436-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLbrmj4aennmrpd7btm9n9zy3k)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:email];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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

Replace check_fb with controls_device in struct backlight_ops. The
new callback interface takes a Linux device instead of a framebuffer.
Resolves one of the dependencies of backlight.h on fb.h.

The few drivers that had custom implementations of check_fb can easily
use the framebuffer's Linux device instead. Update them accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/backlight/backlight.c      |  2 +-
 drivers/video/backlight/bd6107.c         | 12 ++++++------
 drivers/video/backlight/gpio_backlight.c | 12 ++++++------
 drivers/video/backlight/lv5207lp.c       | 12 ++++++------
 include/linux/backlight.h                | 16 ++++++++--------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 48844a4f28ad3..18a0ac4bd6005 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -111,7 +111,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!bd->ops)
 		goto out;
-	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
+	else if (bd->ops->controls_device && !bd->ops->controls_device(bd, info->device))
 		goto out;
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	else if (info->bl_dev && info->bl_dev != bd)
diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index c95a12bf0ce26..d124ede084ef9 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -99,18 +99,18 @@ static int bd6107_backlight_update_status(struct backlight_device *backlight)
 	return 0;
 }
 
-static int bd6107_backlight_check_fb(struct backlight_device *backlight,
-				       struct fb_info *info)
+static bool bd6107_backlight_controls_device(struct backlight_device *backlight,
+					     struct device *display_dev)
 {
 	struct bd6107 *bd = bl_get_data(backlight);
 
-	return !bd->pdata->dev || bd->pdata->dev == info->device;
+	return !bd->pdata->dev || bd->pdata->dev == display_dev;
 }
 
 static const struct backlight_ops bd6107_backlight_ops = {
-	.options	= BL_CORE_SUSPENDRESUME,
-	.update_status	= bd6107_backlight_update_status,
-	.check_fb	= bd6107_backlight_check_fb,
+	.options	 = BL_CORE_SUSPENDRESUME,
+	.update_status	 = bd6107_backlight_update_status,
+	.controls_device = bd6107_backlight_controls_device,
 };
 
 static int bd6107_probe(struct i2c_client *client)
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index d28c30b2a35d2..c0cff685ea848 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -30,18 +30,18 @@ static int gpio_backlight_update_status(struct backlight_device *bl)
 	return 0;
 }
 
-static int gpio_backlight_check_fb(struct backlight_device *bl,
-				   struct fb_info *info)
+static bool gpio_backlight_controls_device(struct backlight_device *bl,
+					   struct device *display_dev)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
 
-	return !gbl->dev || gbl->dev == info->device;
+	return !gbl->dev || gbl->dev == display_dev;
 }
 
 static const struct backlight_ops gpio_backlight_ops = {
-	.options	= BL_CORE_SUSPENDRESUME,
-	.update_status	= gpio_backlight_update_status,
-	.check_fb	= gpio_backlight_check_fb,
+	.options	 = BL_CORE_SUSPENDRESUME,
+	.update_status	 = gpio_backlight_update_status,
+	.controls_device = gpio_backlight_controls_device,
 };
 
 static int gpio_backlight_probe(struct platform_device *pdev)
diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
index 1f1d06b4e119a..0cf00fee0f605 100644
--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -62,18 +62,18 @@ static int lv5207lp_backlight_update_status(struct backlight_device *backlight)
 	return 0;
 }
 
-static int lv5207lp_backlight_check_fb(struct backlight_device *backlight,
-				       struct fb_info *info)
+static bool lv5207lp_backlight_controls_device(struct backlight_device *backlight,
+					       struct device *display_dev)
 {
 	struct lv5207lp *lv = bl_get_data(backlight);
 
-	return !lv->pdata->dev || lv->pdata->dev == info->device;
+	return !lv->pdata->dev || lv->pdata->dev == display_dev;
 }
 
 static const struct backlight_ops lv5207lp_backlight_ops = {
-	.options	= BL_CORE_SUSPENDRESUME,
-	.update_status	= lv5207lp_backlight_update_status,
-	.check_fb	= lv5207lp_backlight_check_fb,
+	.options	 = BL_CORE_SUSPENDRESUME,
+	.update_status	 = lv5207lp_backlight_update_status,
+	.controls_device = lv5207lp_backlight_controls_device,
 };
 
 static int lv5207lp_probe(struct i2c_client *client)
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a8..2db4c70053c46 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -13,6 +13,7 @@
 #include <linux/fb.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/types.h>
 
 /**
  * enum backlight_update_reason - what method was used to update backlight
@@ -110,7 +111,6 @@ enum backlight_scale {
 };
 
 struct backlight_device;
-struct fb_info;
 
 /**
  * struct backlight_ops - backlight operations
@@ -160,18 +160,18 @@ struct backlight_ops {
 	int (*get_brightness)(struct backlight_device *);
 
 	/**
-	 * @check_fb: Check the framebuffer device.
+	 * @controls_device: Check against the display device
 	 *
-	 * Check if given framebuffer device is the one bound to this backlight.
-	 * This operation is optional and if not implemented it is assumed that the
-	 * fbdev is always the one bound to the backlight.
+	 * Check if the backlight controls the given display device. This
+	 * operation is optional and if not implemented it is assumed that
+	 * the display is always the one controlled by the backlight.
 	 *
 	 * RETURNS:
 	 *
-	 * If info is NULL or the info matches the fbdev bound to the backlight return true.
-	 * If info does not match the fbdev bound to the backlight return false.
+	 * If display_dev is NULL or display_dev matches the device controlled by
+	 * the backlight, return true. Otherwise return false.
 	 */
-	int (*check_fb)(struct backlight_device *bd, struct fb_info *info);
+	bool (*controls_device)(struct backlight_device *bd, struct device *display_dev);
 };
 
 /**
-- 
2.43.0

