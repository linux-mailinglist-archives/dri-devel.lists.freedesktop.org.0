Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA5A958266
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9610E5D9;
	Tue, 20 Aug 2024 09:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Qq9IC24/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2CRYBcIF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gPuWUb3n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1bf2YfyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC80910E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEE2B225B4;
 Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anscDirCe0kDkiiMUDqa3Z/9pL9w2iv7UM9kq6z256U=;
 b=Qq9IC24/krLifMdKpRLK02tNDCyK7t6lIlI5f/XVNVzy+3GaDxqNG3PJ+LE2F1qy0xMQyj
 iamkokda7vdApvVm+tK4GtZcID4VKnMX2vsFADdtGrTVz5OM6K/CfI3fJ4cDEyKqvvUIlI
 mmHPWUD7CoJMyH2A73LrJLrRhkC09P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anscDirCe0kDkiiMUDqa3Z/9pL9w2iv7UM9kq6z256U=;
 b=2CRYBcIFakdSTQ2NbI9G35qTHq36zDdYWl5cqsd0T12HNtm5wmwlN4umnLzfWRjXbJTXb6
 Fv6XIQL9f3FEiyDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gPuWUb3n;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1bf2YfyD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anscDirCe0kDkiiMUDqa3Z/9pL9w2iv7UM9kq6z256U=;
 b=gPuWUb3nW5mC/bpvAljkzSIX5ujb7bgwuooVm6WgoLRH5Ksosh90iDRBYiASaO0hXKKkPw
 zEAI46Fst6C47WM69KBE0wy5tuYk5hdz6wwfRLFDxggUwZkY5zQevrC3NadYWd4NYAD7uN
 wqJYnB6kBwjA6Hph07xT1tNUdx6DpVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anscDirCe0kDkiiMUDqa3Z/9pL9w2iv7UM9kq6z256U=;
 b=1bf2YfyD5ph5z3ZQbCfmEfhBIyryj2dDl0lVP6ymeO/nAbsEo+cB50OJPhSsiRKUp6KBX/
 ne2jSKvSNzhdAmDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50E5013770;
 Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qG53Ek1jxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 24/28] fbdev: omap: Use lcd power constants
Date: Tue, 20 Aug 2024 11:23:02 +0200
Message-ID: <20240820093452.68270-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BEE2B225B4
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RLk469idygq4891mojaqehp6ty)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap/lcd_ams_delta.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 97e2b71b64d7..456e6e9e11a9 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -32,7 +32,7 @@ static struct gpio_desc *gpiod_ndisp;
 
 static int ams_delta_lcd_set_power(struct lcd_device *dev, int power)
 {
-	if (power == FB_BLANK_UNBLANK) {
+	if (power == LCD_POWER_ON) {
 		if (!(ams_delta_lcd & AMS_DELTA_LCD_POWER)) {
 			omap_writeb(ams_delta_lcd & AMS_DELTA_MAX_CONTRAST,
 					OMAP_PWL_ENABLE);
@@ -63,9 +63,9 @@ static int ams_delta_lcd_set_contrast(struct lcd_device *dev, int value)
 static int ams_delta_lcd_get_power(struct lcd_device *dev)
 {
 	if (ams_delta_lcd & AMS_DELTA_LCD_POWER)
-		return FB_BLANK_UNBLANK;
+		return LCD_POWER_ON;
 	else
-		return FB_BLANK_POWERDOWN;
+		return LCD_POWER_OFF;
 }
 
 static int ams_delta_lcd_get_contrast(struct lcd_device *dev)
@@ -155,7 +155,7 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
 #endif
 
 	ams_delta_lcd_set_contrast(lcd_device, AMS_DELTA_DEFAULT_CONTRAST);
-	ams_delta_lcd_set_power(lcd_device, FB_BLANK_UNBLANK);
+	ams_delta_lcd_set_power(lcd_device, LCD_POWER_ON);
 
 	omapfb_register_panel(&ams_delta_panel);
 	return 0;
-- 
2.46.0

