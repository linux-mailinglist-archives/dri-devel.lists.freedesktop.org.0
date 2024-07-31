Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC5942E84
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFA910E601;
	Wed, 31 Jul 2024 12:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M09O47Mc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+Csrta4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M09O47Mc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+Csrta4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568D310E5FF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F9F31F833;
 Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1zH7EYyB9FyoHPVOfMAQJ+chXOTxZIqATMGaX1iJSc=;
 b=M09O47McCMxluobGkuYk9zQV51RyIcI7p7s1/IYnXQutcqKOHZQwmnIeJtgvGNHEzP/sst
 zHQd52s7qn7Frt4OjHqr+4js/xqftqpLr0TluDVyvV+ozVcIlxP85n8zZZulBR3dj2Y0cP
 Bzy3lZM5s6fsYxm1lf2A1XCLo1gwTc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1zH7EYyB9FyoHPVOfMAQJ+chXOTxZIqATMGaX1iJSc=;
 b=z+Csrta40XGnpa8wRyz/ouxlj4zScuLXzwoSs5H8vOqgEazYYx6swEl+KKsOwv7czUXyXf
 hlQrnZ7nsnqWNlAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M09O47Mc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z+Csrta4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1zH7EYyB9FyoHPVOfMAQJ+chXOTxZIqATMGaX1iJSc=;
 b=M09O47McCMxluobGkuYk9zQV51RyIcI7p7s1/IYnXQutcqKOHZQwmnIeJtgvGNHEzP/sst
 zHQd52s7qn7Frt4OjHqr+4js/xqftqpLr0TluDVyvV+ozVcIlxP85n8zZZulBR3dj2Y0cP
 Bzy3lZM5s6fsYxm1lf2A1XCLo1gwTc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1zH7EYyB9FyoHPVOfMAQJ+chXOTxZIqATMGaX1iJSc=;
 b=z+Csrta40XGnpa8wRyz/ouxlj4zScuLXzwoSs5H8vOqgEazYYx6swEl+KKsOwv7czUXyXf
 hlQrnZ7nsnqWNlAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D29DB13297;
 Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yFExMnkvqmYiUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] fbdev: aty128fb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:43 +0200
Message-ID: <20240731123502.1145082-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.81 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 0F9F31F833
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
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/aty/aty128fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index f4de11f19235..f55b4c7609a8 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -1299,11 +1299,11 @@ static void aty128_set_lcd_enable(struct aty128fb_par *par, int on)
 		reg &= ~LVDS_DISPLAY_DIS;
 		aty_st_le32(LVDS_GEN_CNTL, reg);
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
-		aty128_bl_set_power(info, FB_BLANK_UNBLANK);
+		aty128_bl_set_power(info, BACKLIGHT_POWER_ON);
 #endif
 	} else {
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
-		aty128_bl_set_power(info, FB_BLANK_POWERDOWN);
+		aty128_bl_set_power(info, BACKLIGHT_POWER_OFF);
 #endif
 		reg = aty_ld_le32(LVDS_GEN_CNTL);
 		reg |= LVDS_DISPLAY_DIS;
@@ -1858,7 +1858,7 @@ static void aty128_bl_init(struct aty128fb_par *par)
 		219 * FB_BACKLIGHT_MAX / MAX_LEVEL);
 
 	bd->props.brightness = bd->props.max_brightness;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	backlight_update_status(bd);
 
 	printk("aty128: Backlight initialized (%s)\n", name);
-- 
2.45.2

