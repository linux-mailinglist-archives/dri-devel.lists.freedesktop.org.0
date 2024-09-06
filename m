Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F0996ECCF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD80710E996;
	Fri,  6 Sep 2024 07:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCE810E97D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1FB9321AAC;
 Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1BB9136A8;
 Fri,  6 Sep 2024 07:54:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yJy2OUu12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 20/28] fbdev: clps711x-fb: Replace check_fb in favor of
 struct fb_info.lcd_dev
Date: Fri,  6 Sep 2024 09:52:34 +0200
Message-ID: <20240906075439.98476-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1FB9321AAC
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/fbdev/clps711x-fb.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index 6171a98a48fd..4340ea3b9660 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -162,13 +162,6 @@ static const struct fb_ops clps711x_fb_ops = {
 	.fb_blank	= clps711x_fb_blank,
 };
 
-static int clps711x_lcd_check_fb(struct lcd_device *lcddev, struct fb_info *fi)
-{
-	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
-
-	return (!fi || fi->par == cfb) ? 1 : 0;
-}
-
 static int clps711x_lcd_get_power(struct lcd_device *lcddev)
 {
 	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
@@ -198,7 +191,6 @@ static int clps711x_lcd_set_power(struct lcd_device *lcddev, int blank)
 }
 
 static const struct lcd_ops clps711x_lcd_ops = {
-	.check_fb	= clps711x_lcd_check_fb,
 	.get_power	= clps711x_lcd_get_power,
 	.set_power	= clps711x_lcd_set_power,
 };
@@ -325,16 +317,21 @@ static int clps711x_fb_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_fb_dealloc_cmap;
 
+	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
+				       &clps711x_lcd_ops);
+	if (IS_ERR(lcd)) {
+		ret = PTR_ERR(lcd);
+		goto out_fb_dealloc_cmap;
+	}
+
+	info->lcd_dev = lcd;
+
 	ret = register_framebuffer(info);
 	if (ret)
 		goto out_fb_dealloc_cmap;
 
-	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
-				       &clps711x_lcd_ops);
-	if (!IS_ERR(lcd))
-		return 0;
+	return 0;
 
-	ret = PTR_ERR(lcd);
 	unregister_framebuffer(info);
 
 out_fb_dealloc_cmap:
-- 
2.46.0

