Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55888942E86
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF94110E605;
	Wed, 31 Jul 2024 12:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EWYetj7c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ltkFZ/fT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v91YYjAZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7i3U81hE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78710E601
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFD8321297;
 Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
 b=EWYetj7cxiNcEAudl7AaVzA7UAEDID9VQDhykDAdp/e8YpJsc8KeHGLSqrLHJcPNUnU87s
 z2fubdznv2EefbLtLzKrEPvmeXRoVyJz+IkJvm6KzZzVMnSJSidoJZRG8Eo+yeXPO1Utgi
 kF/7yA/jawnSv5UDmzIldKwrwuMqJLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
 b=ltkFZ/fTjFcfA3FGU+HaOYixBMluk0zMv8sR8SNBoKLF+1zyBEzzuAJyx1QeZCHWcLbbMb
 X7k2Dksnd+A4L6CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
 b=v91YYjAZdsWG59O1Xp15MDI28vZZ5dpuDxs1rKDMqSlmfGlToTUop4OhyFaiB2YOzgyjHf
 NCyhI6kbxbK13RAy/wb/Qk6CrO3lKKNH1Fmki7WrWIeoCcvMNzBdEOiF14N+XbAONxu/5x
 UrbHRR8wIJem2Pi8P3OE+gG1w2PDS7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
 b=7i3U81hEkrQYvLhi0gefeMwicywn7NelELTLmkpAUS9ibO4jyoiywbOg7SRpCN9h+wxpbX
 MTiRfm1gdvEuiyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C9B013AD8;
 Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IK8PIXkvqmYiUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 1/9] fbdev: atmel_lcdfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:42 +0200
Message-ID: <20240731123502.1145082-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; FREEMAIL_TO(0.00)[gmx.de];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/video/fbdev/atmel_lcdfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 5574fb0361ee..4da233fb02a8 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -152,7 +152,7 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
 	}
 	sinfo->backlight = bl;
 
-	bl->props.power = FB_BLANK_UNBLANK;
+	bl->props.power = BACKLIGHT_POWER_ON;
 	bl->props.brightness = atmel_bl_get_brightness(bl);
 }
 
@@ -162,7 +162,7 @@ static void exit_backlight(struct atmel_lcdfb_info *sinfo)
 		return;
 
 	if (sinfo->backlight->ops) {
-		sinfo->backlight->props.power = FB_BLANK_POWERDOWN;
+		sinfo->backlight->props.power = BACKLIGHT_POWER_OFF;
 		sinfo->backlight->ops->update_status(sinfo->backlight);
 	}
 	backlight_device_unregister(sinfo->backlight);
-- 
2.45.2

