Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E395826B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CABD10E5DD;
	Tue, 20 Aug 2024 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uIYACor3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZPGswT0t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zwUjRPb1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nClKwI/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A56E10E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0D31225B7;
 Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p63KhcGtKnHj155HSsgKo8Nh4/ILHUSpGMU5GB1JHh0=;
 b=uIYACor3QBrASZoCcAYb6l6PsKGxdLQwr+1CQMHh/idyfCaMsWrabGHuPKDWb7gPB9czs3
 gFFgf1JxMetzxExp3M9VlVXUqEdgL1U+uUhKVmSw5jGdEY/GrkrTZgqiqDjAytCBw7OLFo
 X0szJ/YReTc/gNzmqrvHKC9xMAfR5VA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p63KhcGtKnHj155HSsgKo8Nh4/ILHUSpGMU5GB1JHh0=;
 b=ZPGswT0t1zaP+jmg7nxfbOalJMnwXJ5LyUI96IuFvVrUnYZRpf0MaPtfXxcgSiJWpfS+JQ
 T4GAfDY7PXVuXVAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p63KhcGtKnHj155HSsgKo8Nh4/ILHUSpGMU5GB1JHh0=;
 b=zwUjRPb1jsvhci+8cYzCN9MV0MjGTBi5EGxDLEVSVFePJalB6pugVSLPvs9c22b4YyrJBQ
 OHEfcCxWLUjrqg9qhhn2rbxjIRfYeeF05dNhqB37ExKBm/VxBtkXMyWyBKckbZSsF8IXKY
 TgoLRJc/HsstWL1ADZ5ER9rcQl/Zo2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p63KhcGtKnHj155HSsgKo8Nh4/ILHUSpGMU5GB1JHh0=;
 b=nClKwI/9x6dYCEfj3JG10kfXSrQERUPQk4tKn+qGUlkei7x+xCP8NGtzEbPdRhZzV31BF/
 XxpM6mhYnwBmXTDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92D5D13B10;
 Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YBO6Ik5jxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 27/28] backlight: lcd: Remove struct fb_videomode from
 set_mode callback
Date: Tue, 20 Aug 2024 11:23:05 +0200
Message-ID: <20240820093452.68270-28-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe),to(RLr3u6jgwj9sedc854c38mga)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
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

Implementations of struct lcd_ops.set_mode only require the resolution
from struct fb_videomode. Pass the xres and yres fields, but remove the
dependency on the fbdev data structure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index 269ca9061df4..ed2095d54df9 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -66,8 +66,10 @@ static int fb_notifier_callback(struct notifier_block *self,
 		if (ld->ops->set_power)
 			ld->ops->set_power(ld, power);
 	} else {
+		const struct fb_videomode *videomode = evdata->data;
+
 		if (ld->ops->set_mode)
-			ld->ops->set_mode(ld, evdata->data);
+			ld->ops->set_mode(ld, videomode->xres, videomode->yres);
 	}
 
 out:
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

