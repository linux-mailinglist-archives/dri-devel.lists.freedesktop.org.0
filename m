Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43AD9151FC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5B710E4C7;
	Mon, 24 Jun 2024 15:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HOrfX2By";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AgYmPt5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HOrfX2By";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AgYmPt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E626D10E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:20:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A448E21AC2;
 Mon, 24 Jun 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719242444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG9Arpf6LMy9QXcypvzf0GeWM8+A5ZTWVogpaAkn96Y=;
 b=HOrfX2ByP+PSf+KgmkvBZu71ZgCEjN6533VjraojTjUCMCin1RQjmUUJ00U/HwKK0wW0UZ
 v6nIK30CU3t3RKWpni2L3nL2uBmkNLqGNDKelQ+9iwwxX7RZvT+R4g5yXsF6/3mvYmJClK
 kTp3ZXxAaIUMeojcGMYAzEmj7p5qLqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719242444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG9Arpf6LMy9QXcypvzf0GeWM8+A5ZTWVogpaAkn96Y=;
 b=2AgYmPt5bCmZOwDdGUIYD0FPWO1t0ySVReChcQfiX1iNOE/QNmbgv7XRiEjVyYCqskyZsv
 CjRhbUm1tJfwtfCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719242444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG9Arpf6LMy9QXcypvzf0GeWM8+A5ZTWVogpaAkn96Y=;
 b=HOrfX2ByP+PSf+KgmkvBZu71ZgCEjN6533VjraojTjUCMCin1RQjmUUJ00U/HwKK0wW0UZ
 v6nIK30CU3t3RKWpni2L3nL2uBmkNLqGNDKelQ+9iwwxX7RZvT+R4g5yXsF6/3mvYmJClK
 kTp3ZXxAaIUMeojcGMYAzEmj7p5qLqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719242444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG9Arpf6LMy9QXcypvzf0GeWM8+A5ZTWVogpaAkn96Y=;
 b=2AgYmPt5bCmZOwDdGUIYD0FPWO1t0ySVReChcQfiX1iNOE/QNmbgv7XRiEjVyYCqskyZsv
 CjRhbUm1tJfwtfCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AF5913AA4;
 Mon, 24 Jun 2024 15:20:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EP7BB8yOeWbqGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 15:20:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org,
 jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org,
 f.suligoi@asem.it, ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/17] backlight: lm3533-backlight: Use backlight power
 constants
Date: Mon, 24 Jun 2024 17:20:06 +0200
Message-ID: <20240624152033.25016-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>
References: <20240624152033.25016-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,ravnborg.org,gmail.com,gmx.de,asem.it];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLbaz54pzrc9psah3tsaj8ddaq)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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
 drivers/video/backlight/lm3533_bl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 3e10d480cb7f..5d06f8ca976c 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/backlight.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/lm3533.h>
@@ -344,7 +343,7 @@ static void lm3533_bl_remove(struct platform_device *pdev)
 
 	dev_dbg(&bd->dev, "%s\n", __func__);
 
-	bd->props.power = FB_BLANK_POWERDOWN;
+	bd->props.power = BACKLIGHT_POWER_OFF;
 	bd->props.brightness = 0;
 
 	lm3533_ctrlbank_disable(&bl->cb);
-- 
2.45.2

