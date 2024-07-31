Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A9942E94
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2BE10E613;
	Wed, 31 Jul 2024 12:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JYFURrmU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="orkpKw6U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYFURrmU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="orkpKw6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A110E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 12:35:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D64F21B69;
 Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jToARh6esMDbtb7iM/FS4jc6A/Wsn42b20irI/JitXc=;
 b=JYFURrmUjpzF6IHQ/BPoo6MBIzsgjtjs7+dgLT+TCrrYLcX6h1oLDF1ckqgennyEELuLhy
 RVAJyaieZz6H3NHL2GselGGxcbues9pKbvMv6zC6H42en7I7+SOVsqHVLfyzgbWRrSCZgA
 DDjcVmrTQTAYK3n9buT5uijSzUbAneQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429307;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jToARh6esMDbtb7iM/FS4jc6A/Wsn42b20irI/JitXc=;
 b=orkpKw6UU4+vThLV8dhqxV4cgZ5EyLuFmFf9ftpr9SU+oOeI5VglGobi0YGjwpfRz9Zt0Z
 T3QnKNyBA2t7D+Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jToARh6esMDbtb7iM/FS4jc6A/Wsn42b20irI/JitXc=;
 b=JYFURrmUjpzF6IHQ/BPoo6MBIzsgjtjs7+dgLT+TCrrYLcX6h1oLDF1ckqgennyEELuLhy
 RVAJyaieZz6H3NHL2GselGGxcbues9pKbvMv6zC6H42en7I7+SOVsqHVLfyzgbWRrSCZgA
 DDjcVmrTQTAYK3n9buT5uijSzUbAneQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429307;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jToARh6esMDbtb7iM/FS4jc6A/Wsn42b20irI/JitXc=;
 b=orkpKw6UU4+vThLV8dhqxV4cgZ5EyLuFmFf9ftpr9SU+oOeI5VglGobi0YGjwpfRz9Zt0Z
 T3QnKNyBA2t7D+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F4C113AD8;
 Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AP/1GXsvqmYiUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] fbdev: sh_mobile_lcdc_fb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:50 +0200
Message-ID: <20240731123502.1145082-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmx.de]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 73c69e39a68d..fcc1446ae746 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1049,7 +1049,7 @@ static int sh_mobile_lcdc_start(struct sh_mobile_lcdc_priv *priv)
 		sh_mobile_lcdc_display_on(ch);
 
 		if (ch->bl) {
-			ch->bl->props.power = FB_BLANK_UNBLANK;
+			ch->bl->props.power = BACKLIGHT_POWER_ON;
 			backlight_update_status(ch->bl);
 		}
 	}
@@ -1082,7 +1082,7 @@ static void sh_mobile_lcdc_stop(struct sh_mobile_lcdc_priv *priv)
 		}
 
 		if (ch->bl) {
-			ch->bl->props.power = FB_BLANK_POWERDOWN;
+			ch->bl->props.power = BACKLIGHT_POWER_OFF;
 			backlight_update_status(ch->bl);
 		}
 
@@ -2125,7 +2125,7 @@ static int sh_mobile_lcdc_update_bl(struct backlight_device *bdev)
 	struct sh_mobile_lcdc_chan *ch = bl_get_data(bdev);
 	int brightness = bdev->props.brightness;
 
-	if (bdev->props.power != FB_BLANK_UNBLANK ||
+	if (bdev->props.power != BACKLIGHT_POWER_ON ||
 	    bdev->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
 		brightness = 0;
 
-- 
2.45.2

