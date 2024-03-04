Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5867870721
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF1811231D;
	Mon,  4 Mar 2024 16:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B5811231A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:32:28 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 26DD31FF5D;
 Mon,  4 Mar 2024 16:32:27 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BE682139C6;
 Mon,  4 Mar 2024 16:32:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id GKU4LZr35WVLAQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 16:32:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/10] fbdev/ssd1307fb: Init backlight before registering
 framebuffer
Date: Mon,  4 Mar 2024 17:29:53 +0100
Message-ID: <20240304163220.19144-9-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 26DD31FF5D
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

For drivers that support backlight, LCD and fbdev devices, fbdev has
to be initialized last. See documentation for struct fbinfo.bl_dev.

The backlight name's index number comes from register_framebuffer(),
which now happens after initializing the backlight device. So like
in all other backlight drivers, we now give the backlight device a
generic name without the fbdev index.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/ssd1307fb.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 1a4f90ea7d5a8..0d1590c61eb06 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -594,7 +594,6 @@ static int ssd1307fb_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct backlight_device *bl;
-	char bl_name[12];
 	struct fb_info *info;
 	struct fb_deferred_io *ssd1307fb_defio;
 	u32 vmem_size;
@@ -733,31 +732,30 @@ static int ssd1307fb_probe(struct i2c_client *client)
 	if (ret)
 		goto regulator_enable_error;
 
-	ret = register_framebuffer(info);
-	if (ret) {
-		dev_err(dev, "Couldn't register the framebuffer\n");
-		goto panel_init_error;
-	}
-
-	snprintf(bl_name, sizeof(bl_name), "ssd1307fb%d", info->node);
-	bl = backlight_device_register(bl_name, dev, par, &ssd1307fb_bl_ops,
+	bl = backlight_device_register("ssd1307fb-bl", dev, par, &ssd1307fb_bl_ops,
 				       NULL);
 	if (IS_ERR(bl)) {
 		ret = PTR_ERR(bl);
 		dev_err(dev, "unable to register backlight device: %d\n", ret);
-		goto bl_init_error;
+		goto panel_init_error;
+	}
+	info->bl_dev = bl;
+
+	ret = register_framebuffer(info);
+	if (ret) {
+		dev_err(dev, "Couldn't register the framebuffer\n");
+		goto fb_init_error;
 	}
 
 	bl->props.brightness = par->contrast;
 	bl->props.max_brightness = MAX_CONTRAST;
-	info->bl_dev = bl;
 
 	dev_info(dev, "fb%d: %s framebuffer device registered, using %d bytes of video memory\n", info->node, info->fix.id, vmem_size);
 
 	return 0;
 
-bl_init_error:
-	unregister_framebuffer(info);
+fb_init_error:
+	backlight_device_unregister(bl);
 panel_init_error:
 	pwm_disable(par->pwm);
 	pwm_put(par->pwm);
-- 
2.44.0

