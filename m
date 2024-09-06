Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5DC96EC9C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A2A10E947;
	Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jVbItLEt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DQxfLG/m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jVbItLEt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DQxfLG/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ED810E947
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C36021AAC;
 Fri,  6 Sep 2024 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0OL/1DGIzFI3eeSHil7+LVlCkFCWkI3H7K0ymxchyc=;
 b=jVbItLEtc/USktcGH/NqUQXcOB+bobtd7iyZzNThC2q6M6UeP9EjzMlelcX8LPjU5m8/Mq
 fAQOonickQzBWHEwvR0T1PllZg4IJPauVHSCYsanCLtJEnOyiI8Lu2S9shTijDBmfTfmjF
 GcyWAS4Zjhj6mzoi15KZ/TkzbPRIJ9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0OL/1DGIzFI3eeSHil7+LVlCkFCWkI3H7K0ymxchyc=;
 b=DQxfLG/m9JuyI4xJw3m2SKBCDdEYy1T6EURH4T3Yi8mRnGUjU9zMRk44JP/sXRzdxF4uD2
 qsV/d2Yx5LysixBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0OL/1DGIzFI3eeSHil7+LVlCkFCWkI3H7K0ymxchyc=;
 b=jVbItLEtc/USktcGH/NqUQXcOB+bobtd7iyZzNThC2q6M6UeP9EjzMlelcX8LPjU5m8/Mq
 fAQOonickQzBWHEwvR0T1PllZg4IJPauVHSCYsanCLtJEnOyiI8Lu2S9shTijDBmfTfmjF
 GcyWAS4Zjhj6mzoi15KZ/TkzbPRIJ9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0OL/1DGIzFI3eeSHil7+LVlCkFCWkI3H7K0ymxchyc=;
 b=DQxfLG/m9JuyI4xJw3m2SKBCDdEYy1T6EURH4T3Yi8mRnGUjU9zMRk44JP/sXRzdxF4uD2
 qsV/d2Yx5LysixBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BD44136A8;
 Fri,  6 Sep 2024 07:54:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +ExTDUK12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/28] backlight: lcd: Test against struct fb_info.lcd_dev
Date: Fri,  6 Sep 2024 09:52:16 +0200
Message-ID: <20240906075439.98476-3-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Add struct fb_info.lcd_dev for fbdev drivers to store a reference to
their lcd device. Update the lcd's fb_notifier_callback() to test for
this field. The lcd module can now detect if an lcd device belongs to
an fbdev device.

This works similar to the bl_dev for backlights and will allow for
the removal of the check_fb callback from several fbdev driver's lcd
devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lcd.c |  3 +++
 include/linux/fb.h            | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 2f57d6867d42..c69407aed296 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -30,6 +30,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 	struct lcd_device *ld = container_of(self, struct lcd_device, fb_notif);
 	struct fb_event *evdata = data;
 	struct fb_info *info = evdata->info;
+	struct lcd_device *fb_lcd = fb_lcd_device(info);
 
 	guard(mutex)(&ld->ops_lock);
 
@@ -37,6 +38,8 @@ static int fb_notifier_callback(struct notifier_block *self,
 		return 0;
 	if (ld->ops->check_fb && !ld->ops->check_fb(ld, info))
 		return 0;
+	if (fb_lcd && fb_lcd != ld)
+		return 0;
 
 	if (event == FB_EVENT_BLANK) {
 		if (ld->ops->set_power)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 865dad03e73e..bf1893616e9c 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -21,6 +21,7 @@ struct fb_info;
 struct file;
 struct i2c_adapter;
 struct inode;
+struct lcd_device;
 struct module;
 struct notifier_block;
 struct page;
@@ -480,6 +481,13 @@ struct fb_info {
 	struct mutex bl_curve_mutex;
 	u8 bl_curve[FB_BACKLIGHT_LEVELS];
 #endif
+
+	/*
+	 * Assigned LCD device; set before framebuffer
+	 * registration, remove after unregister
+	 */
+	struct lcd_device *lcd_dev;
+
 #ifdef CONFIG_FB_DEFERRED_IO
 	struct delayed_work deferred_work;
 	unsigned long npagerefs;
@@ -753,6 +761,11 @@ static inline struct backlight_device *fb_bl_device(struct fb_info *info)
 }
 #endif
 
+static inline struct lcd_device *fb_lcd_device(struct fb_info *info)
+{
+	return info->lcd_dev;
+}
+
 /* fbmon.c */
 #define FB_MAXTIMINGS		0
 #define FB_VSYNCTIMINGS		1
-- 
2.46.0

