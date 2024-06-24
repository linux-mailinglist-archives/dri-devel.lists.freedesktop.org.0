Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C59151EE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFDC10E4B6;
	Mon, 24 Jun 2024 15:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BAB10E4C2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:20:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DA60219D4;
 Mon, 24 Jun 2024 15:20:44 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9298F13ACD;
 Mon, 24 Jun 2024 15:20:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MD5YIMuOeWbqGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 15:20:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org,
 jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org,
 f.suligoi@asem.it, ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/17] backlight: led-backlight: Use backlight power
 constants
Date: Mon, 24 Jun 2024 17:20:05 +0200
Message-ID: <20240624152033.25016-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>
References: <20240624152033.25016-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 1DA60219D4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/led_bl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 032f8bddf872..c7aefcd6e4e3 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = priv->max_brightness;
 	props.brightness = priv->default_brightness;
-	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
-		      FB_BLANK_UNBLANK;
+	props.power = (priv->default_brightness > 0) ? BACKLIGHT_POWER_OFF :
+		      BACKLIGHT_POWER_ON;
 	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
 			&pdev->dev, priv, &led_bl_ops, &props);
 	if (IS_ERR(priv->bl_dev)) {
-- 
2.45.2

