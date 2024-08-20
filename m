Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F6958270
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C84910E5F4;
	Tue, 20 Aug 2024 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0EpemxFd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yGNJ8GmU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0EpemxFd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yGNJ8GmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164210E595
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBCFB225AD;
 Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
 b=0EpemxFdlGKUUk39hAGITZGYhIt75m4RD6j1l95olajrZ93Lp8GEvEFN0kTCahfqG7A4Y0
 P0K4bgM8Jx+CgjWYqhO5EveJ4Wb06SclH0S+QExL/YLd0JA8q0E1BjBi52eIwWBsSzq5rd
 qaw9u8WlGuj34M3I60aJUb28J+x8LqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146508;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
 b=yGNJ8GmUjbEqx+hooWQN1hsWQcNczKU4A2iV4Ef1aO7/6ZPSWpgHvD9I3OGeo+t5H9nS5H
 AYqw9p8EV+nW9jDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
 b=0EpemxFdlGKUUk39hAGITZGYhIt75m4RD6j1l95olajrZ93Lp8GEvEFN0kTCahfqG7A4Y0
 P0K4bgM8Jx+CgjWYqhO5EveJ4Wb06SclH0S+QExL/YLd0JA8q0E1BjBi52eIwWBsSzq5rd
 qaw9u8WlGuj34M3I60aJUb28J+x8LqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146508;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
 b=yGNJ8GmUjbEqx+hooWQN1hsWQcNczKU4A2iV4Ef1aO7/6ZPSWpgHvD9I3OGeo+t5H9nS5H
 AYqw9p8EV+nW9jDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D10513770;
 Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uEZXHUxjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 22/28] fbdev: imxfb: Replace check_fb in favor of struct
 fb_info.lcd_dev
Date: Tue, 20 Aug 2024 11:23:00 +0200
Message-ID: <20240820093452.68270-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
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

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in imxfb_lcd_ops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/imxfb.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 4ebfe9b9df60..88c117f29f7f 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -782,16 +782,6 @@ static int imxfb_of_read_mode(struct device *dev, struct device_node *np,
 	return 0;
 }
 
-static int imxfb_lcd_check_fb(struct lcd_device *lcddev, struct fb_info *fi)
-{
-	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
-
-	if (!fi || fi->par == fbi)
-		return 1;
-
-	return 0;
-}
-
 static int imxfb_lcd_get_contrast(struct lcd_device *lcddev)
 {
 	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
@@ -858,7 +848,6 @@ static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 }
 
 static const struct lcd_ops imxfb_lcd_ops = {
-	.check_fb	= imxfb_lcd_check_fb,
 	.get_contrast	= imxfb_lcd_get_contrast,
 	.set_contrast	= imxfb_lcd_set_contrast,
 	.get_power	= imxfb_lcd_get_power,
@@ -1025,11 +1014,6 @@ static int imxfb_probe(struct platform_device *pdev)
 		goto failed_cmap;
 
 	imxfb_set_par(info);
-	ret = register_framebuffer(info);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register framebuffer\n");
-		goto failed_register;
-	}
 
 	fbi->lcd_pwr = devm_regulator_get(&pdev->dev, "lcd");
 	if (PTR_ERR(fbi->lcd_pwr) == -EPROBE_DEFER) {
@@ -1046,13 +1030,19 @@ static int imxfb_probe(struct platform_device *pdev)
 
 	lcd->props.max_contrast = 0xff;
 
+	info->lcd_dev = lcd;
+
+	ret = register_framebuffer(info);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register framebuffer\n");
+		goto failed_lcd;
+	}
+
 	imxfb_enable_controller(fbi);
 
 	return 0;
 
 failed_lcd:
-	unregister_framebuffer(info);
-failed_register:
 	fb_dealloc_cmap(&info->cmap);
 failed_cmap:
 	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
-- 
2.46.0

