Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A62487AAAE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 16:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1308510EE5A;
	Wed, 13 Mar 2024 15:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F9B10E421
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 15:49:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FC9921C97;
 Wed, 13 Mar 2024 15:49:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAF9D1397F;
 Wed, 13 Mar 2024 15:49:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KCtELO3K8WUhfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 15:49:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] staging/fbtft: Remove reference to fb_blank
Date: Wed, 13 Mar 2024 16:45:04 +0100
Message-ID: <20240313154857.12949-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313154857.12949-1-tzimmermann@suse.de>
References: <20240313154857.12949-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0FC9921C97
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The field fb_blank in struct backlight_properties is deprecated and
should not be used. Don't output its value in the driver's debug print.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/staging/fbtft/fb_ssd1351.c | 4 +---
 drivers/staging/fbtft/fbtft-core.c | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 72172e870007e..ca2cba2185ae3 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -194,9 +194,7 @@ static int update_onboard_backlight(struct backlight_device *bd)
 	struct fbtft_par *par = bl_get_data(bd);
 	bool on;
 
-	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-		      "%s: power=%d, fb_blank=%d\n",
-		      __func__, bd->props.power, bd->props.fb_blank);
+	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: power=%d\n", __func__, bd->props.power);
 
 	on = !backlight_is_blank(bd);
 	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3626f429b002c..5ca150c409c3c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -133,9 +133,8 @@ static int fbtft_backlight_update_status(struct backlight_device *bd)
 	struct fbtft_par *par = bl_get_data(bd);
 	bool polarity = par->polarity;
 
-	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-		      "%s: polarity=%d, power=%d, fb_blank=%d\n",
-		      __func__, polarity, bd->props.power, bd->props.fb_blank);
+	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: polarity=%d, power=%d\n", __func__,
+		      polarity, bd->props.power);
 
 	if (!backlight_is_blank(bd))
 		gpiod_set_value(par->gpio.led[0], polarity);
-- 
2.44.0

