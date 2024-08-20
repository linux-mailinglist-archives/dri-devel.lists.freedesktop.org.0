Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C66595827E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D4A10E625;
	Tue, 20 Aug 2024 09:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="A/xBNwpy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UvDHIO93";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A/xBNwpy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UvDHIO93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8723A10E5A2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D5551FFD3;
 Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yeqJo8xTifZVRDeElarBREsdwkqwrL7OT0CCQj2jWI=;
 b=A/xBNwpykrA18NPiXNZhKkSdj916sQX+u30Hzz5lD3ryagfz2SQ8//9OeCjK8r6Lw7s0IC
 O6LUOWmWX8NfnZGHjIC6acw+WKA9MUSUqBkOEU9/079+695eglKDvPEu3tBz8kmBOqe0K9
 Qj3vePgKey2O+f9ljHXbAFrgO0uJxBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yeqJo8xTifZVRDeElarBREsdwkqwrL7OT0CCQj2jWI=;
 b=UvDHIO93kz7eBRn+Us0mbUXVHagfxxuieGLcrIfk3xONAuR/fWRoCSLxxRs9m3bmVEIAb+
 8oWNPoVMs0Yc7ECQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yeqJo8xTifZVRDeElarBREsdwkqwrL7OT0CCQj2jWI=;
 b=A/xBNwpykrA18NPiXNZhKkSdj916sQX+u30Hzz5lD3ryagfz2SQ8//9OeCjK8r6Lw7s0IC
 O6LUOWmWX8NfnZGHjIC6acw+WKA9MUSUqBkOEU9/079+695eglKDvPEu3tBz8kmBOqe0K9
 Qj3vePgKey2O+f9ljHXbAFrgO0uJxBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yeqJo8xTifZVRDeElarBREsdwkqwrL7OT0CCQj2jWI=;
 b=UvDHIO93kz7eBRn+Us0mbUXVHagfxxuieGLcrIfk3xONAuR/fWRoCSLxxRs9m3bmVEIAb+
 8oWNPoVMs0Yc7ECQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8EB813770;
 Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oJLBM0pjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/28] backlight: platform_lcd: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:56 +0200
Message-ID: <20240820093452.68270-19-tzimmermann@suse.de>
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

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/platform_lcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 8b89d2f47df7..69a22d1a8a35 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -41,7 +41,7 @@ static int platform_lcd_set_power(struct lcd_device *lcd, int power)
 	struct platform_lcd *plcd = to_our_lcd(lcd);
 	int lcd_power = 1;
 
-	if (power == FB_BLANK_POWERDOWN || plcd->suspended)
+	if (power == LCD_POWER_OFF || plcd->suspended)
 		lcd_power = 0;
 
 	plcd->pdata->set_power(plcd->pdata, lcd_power);
@@ -97,7 +97,7 @@ static int platform_lcd_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, plcd);
-	platform_lcd_set_power(plcd->lcd, FB_BLANK_NORMAL);
+	platform_lcd_set_power(plcd->lcd, LCD_POWER_REDUCED);
 
 	return 0;
 }
-- 
2.46.0

