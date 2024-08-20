Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7295825D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B110E5BF;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Q0zFiOh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WSGggca";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q0zFiOh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WSGggca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78E10E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 330CB2257F;
 Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
 b=Q0zFiOh6tCoA0Ysf7ZzpQYtqS6kjjzDxZhnx8LxVZFw7kELKn7Rm8tScBxY3dFiez/jb5Q
 5ezjs88hRvjvvCJAljWux2mizBCFHnEXG0taH3GvOW/s4zzz6g1r/awASy0C2OMk2KLKIP
 JJAeSBCEB7wO+Io4UQL7fkLzT89/Y0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
 b=6WSGggcaxsHoSH9BHBYH//Lqi9a3u2ACPOGHEa+fX1fE+1EvHbNFqW4g12IGs4R7WDJ9w9
 4J1K0oIvm81bd/BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
 b=Q0zFiOh6tCoA0Ysf7ZzpQYtqS6kjjzDxZhnx8LxVZFw7kELKn7Rm8tScBxY3dFiez/jb5Q
 5ezjs88hRvjvvCJAljWux2mizBCFHnEXG0taH3GvOW/s4zzz6g1r/awASy0C2OMk2KLKIP
 JJAeSBCEB7wO+Io4UQL7fkLzT89/Y0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
 b=6WSGggcaxsHoSH9BHBYH//Lqi9a3u2ACPOGHEa+fX1fE+1EvHbNFqW4g12IGs4R7WDJ9w9
 4J1K0oIvm81bd/BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C85A313770;
 Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YENkL0VjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/28] backlight: ili922x: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:44 +0200
Message-ID: <20240820093452.68270-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
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
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
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

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/ili922x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index 7683e209ad6b..5e1bf0c5831f 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -8,7 +8,6 @@
  * memory is cyclically updated over the RGB interface.
  */
 
-#include <linux/fb.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -119,7 +118,7 @@
 
 #define CMD_BUFSIZE		16
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 #define set_tx_byte(b)		(tx_invert ? ~(b) : b)
 
@@ -513,7 +512,7 @@ static int ili922x_probe(struct spi_device *spi)
 
 	ili922x_display_init(spi);
 
-	ili->power = FB_BLANK_POWERDOWN;
+	ili->power = LCD_POWER_OFF;
 
 	lcd = devm_lcd_device_register(&spi->dev, "ili922xlcd", &spi->dev, ili,
 					&ili922x_ops);
@@ -525,7 +524,7 @@ static int ili922x_probe(struct spi_device *spi)
 	ili->ld = lcd;
 	spi_set_drvdata(spi, ili);
 
-	ili922x_lcd_power(ili, FB_BLANK_UNBLANK);
+	ili922x_lcd_power(ili, LCD_POWER_ON);
 
 	return 0;
 }
-- 
2.46.0

