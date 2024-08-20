Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70275958263
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069B10E5D0;
	Tue, 20 Aug 2024 09:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VyqKBazJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="06+SThGR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VyqKBazJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="06+SThGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4779F10E595
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D41A31FFD2;
 Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
 b=VyqKBazJ1u4YZIFva+8W+eXYAeYlNGZpvuZRf1Ksa8KloldRtwCuv4q2rkFIgexv4em81R
 VhS6+IvZP0qHntLINo6xvq6ep1nSljliRmku3bRKvMnn2IKFnEGoAuEJQMMtLcSyqTJ/JF
 obyq1VME9Vk5o/jnlfqCgdPl14bWqgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
 b=06+SThGRd3PJqkSXit0WDixVbD9jD8O7IwGYC6xII8HpBPW9zykD5CVPKz0xai2eiTaEtW
 RY0ubH7Qd8NYYiCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
 b=VyqKBazJ1u4YZIFva+8W+eXYAeYlNGZpvuZRf1Ksa8KloldRtwCuv4q2rkFIgexv4em81R
 VhS6+IvZP0qHntLINo6xvq6ep1nSljliRmku3bRKvMnn2IKFnEGoAuEJQMMtLcSyqTJ/JF
 obyq1VME9Vk5o/jnlfqCgdPl14bWqgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
 b=06+SThGRd3PJqkSXit0WDixVbD9jD8O7IwGYC6xII8HpBPW9zykD5CVPKz0xai2eiTaEtW
 RY0ubH7Qd8NYYiCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76E7113AFE;
 Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4LWAG0pjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 17/28] backlight: platform_lcd: Remove match_fb from struct
 plat_lcd_data
Date: Tue, 20 Aug 2024 11:22:55 +0200
Message-ID: <20240820093452.68270-18-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
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

The match_fb callback in struct plat_lcd_data is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/platform_lcd.c | 4 ----
 include/video/platform_lcd.h           | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 08d0ff400d88..8b89d2f47df7 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -53,10 +53,6 @@ static int platform_lcd_set_power(struct lcd_device *lcd, int power)
 static int platform_lcd_match(struct lcd_device *lcd, struct fb_info *info)
 {
 	struct platform_lcd *plcd = to_our_lcd(lcd);
-	struct plat_lcd_data *pdata = plcd->pdata;
-
-	if (pdata->match_fb)
-		return pdata->match_fb(pdata, info);
 
 	return plcd->us->parent == info->device;
 }
diff --git a/include/video/platform_lcd.h b/include/video/platform_lcd.h
index 6a95184a28c1..2bdf46519298 100644
--- a/include/video/platform_lcd.h
+++ b/include/video/platform_lcd.h
@@ -8,11 +8,8 @@
 */
 
 struct plat_lcd_data;
-struct fb_info;
 
 struct plat_lcd_data {
 	int	(*probe)(struct plat_lcd_data *);
 	void	(*set_power)(struct plat_lcd_data *, unsigned int power);
-	int	(*match_fb)(struct plat_lcd_data *, struct fb_info *);
 };
-
-- 
2.46.0

