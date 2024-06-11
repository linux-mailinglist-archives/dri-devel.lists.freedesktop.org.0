Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96112903C51
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A43710E61B;
	Tue, 11 Jun 2024 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GSRUM8Fo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vujDglSB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GSRUM8Fo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vujDglSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F9810E18D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:53:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 47ACA21A85;
 Tue, 11 Jun 2024 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718110405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AY62X9S0/yPV0+VskPf5UGNtp3wqnp143wsfQN22Z0g=;
 b=GSRUM8FoYO3aa71sI+m64V2rV353ggIKeu3FXda7eGUbC9fJ+gkByhuppb6urcPejQApLy
 QLrwqJUNb0K+UHs/omB5vCT68MgLiMR+DnOVvadVxIGc6essYPdNNJd0Q6WT5SgMI7hZ0L
 3O/vU/CeprERS4ZPIkeV5ujGO2ukJHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718110405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AY62X9S0/yPV0+VskPf5UGNtp3wqnp143wsfQN22Z0g=;
 b=vujDglSBJ577DjlTUSznJJrRhsc/Fv9vy9u39BAKmcPb9ybhvIUpmzmgzn03CMb6sirP20
 4FIZbkTvJJhF7OBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718110405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AY62X9S0/yPV0+VskPf5UGNtp3wqnp143wsfQN22Z0g=;
 b=GSRUM8FoYO3aa71sI+m64V2rV353ggIKeu3FXda7eGUbC9fJ+gkByhuppb6urcPejQApLy
 QLrwqJUNb0K+UHs/omB5vCT68MgLiMR+DnOVvadVxIGc6essYPdNNJd0Q6WT5SgMI7hZ0L
 3O/vU/CeprERS4ZPIkeV5ujGO2ukJHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718110405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AY62X9S0/yPV0+VskPf5UGNtp3wqnp143wsfQN22Z0g=;
 b=vujDglSBJ577DjlTUSznJJrRhsc/Fv9vy9u39BAKmcPb9ybhvIUpmzmgzn03CMb6sirP20
 4FIZbkTvJJhF7OBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 021DB137DF;
 Tue, 11 Jun 2024 12:53:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qEvvOsRIaGbxMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jun 2024 12:53:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, linus.walleij@linaro.org, f.suligoi@asem.it,
 ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/17] backlight: corgi-lcd: Use backlight power constants
Date: Tue, 11 Jun 2024 14:41:59 +0200
Message-ID: <20240611125321.6927-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611125321.6927-1-tzimmermann@suse.de>
References: <20240611125321.6927-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,asem.it];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLbaz54pzrc9psah3tsaj8ddaq)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Only change the driver's backlight device, but leave the LCD
device as-is.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/corgi_lcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index aad1680c9075d..b29ee8579b57e 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -526,7 +526,7 @@ static int corgi_lcd_probe(struct spi_device *spi)
 		return PTR_ERR(lcd->bl_dev);
 
 	lcd->bl_dev->props.brightness = pdata->default_intensity;
-	lcd->bl_dev->props.power = FB_BLANK_UNBLANK;
+	lcd->bl_dev->props.power = BL_CORE_UNBLANK;
 
 	ret = setup_gpio_backlight(lcd, pdata);
 	if (ret)
@@ -547,7 +547,7 @@ static void corgi_lcd_remove(struct spi_device *spi)
 {
 	struct corgi_lcd *lcd = spi_get_drvdata(spi);
 
-	lcd->bl_dev->props.power = FB_BLANK_UNBLANK;
+	lcd->bl_dev->props.power = BL_CORE_UNBLANK;
 	lcd->bl_dev->props.brightness = 0;
 	backlight_update_status(lcd->bl_dev);
 	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_POWERDOWN);
-- 
2.45.2

