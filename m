Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E3942F8E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 15:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A644C10E617;
	Wed, 31 Jul 2024 13:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4610E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:01:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFE8B21B70;
 Wed, 31 Jul 2024 13:01:35 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9135913AD8;
 Wed, 31 Jul 2024 13:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SMQ1Iq81qmYzWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 13:01:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] staging: fbtft: Use backlight power constants
Date: Wed, 31 Jul 2024 14:58:51 +0200
Message-ID: <20240731130130.1148153-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731130130.1148153-1-tzimmermann@suse.de>
References: <20240731130130.1148153-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BFE8B21B70
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/fbtft/fb_ssd1351.c | 2 +-
 drivers/staging/fbtft/fbtft-core.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index ca2cba2185ae..cee4cecb23a5 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -213,7 +213,7 @@ static void register_onboard_backlight(struct fbtft_par *par)
 	struct backlight_properties bl_props = { 0, };
 
 	bl_props.type = BACKLIGHT_RAW;
-	bl_props.power = FB_BLANK_POWERDOWN;
+	bl_props.power = BACKLIGHT_POWER_OFF;
 
 	bd = backlight_device_register(dev_driver_string(par->info->device),
 				       par->info->device, par, &bl_ops,
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8e2fd0c0fee2..ab53698dae32 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -152,7 +152,7 @@ static int fbtft_backlight_get_brightness(struct backlight_device *bd)
 void fbtft_unregister_backlight(struct fbtft_par *par)
 {
 	if (par->info->bl_dev) {
-		par->info->bl_dev->props.power = FB_BLANK_POWERDOWN;
+		par->info->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 		backlight_update_status(par->info->bl_dev);
 		backlight_device_unregister(par->info->bl_dev);
 		par->info->bl_dev = NULL;
@@ -178,7 +178,7 @@ void fbtft_register_backlight(struct fbtft_par *par)
 
 	bl_props.type = BACKLIGHT_RAW;
 	/* Assume backlight is off, get polarity from current state of pin */
-	bl_props.power = FB_BLANK_POWERDOWN;
+	bl_props.power = BACKLIGHT_POWER_OFF;
 	if (!gpiod_get_value(par->gpio.led[0]))
 		par->polarity = true;
 
@@ -801,7 +801,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-		fb_info->bl_dev->props.power = FB_BLANK_UNBLANK;
+		fb_info->bl_dev->props.power = BACKLIGHT_POWER_ON;
 		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
 	}
 
-- 
2.45.2

