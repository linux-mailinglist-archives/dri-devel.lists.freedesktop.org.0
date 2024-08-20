Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CF958273
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC18A10E5FC;
	Tue, 20 Aug 2024 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SfevEho4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HqJVtlhl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D50kxF66";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OReGM9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FA810E5A2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49AAB225B1;
 Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
 b=SfevEho4RhY30Ogb/UxdpHUfufeUG/zooxyS2kgYx4TB5QRBCez3DalNCCjiiHcG/Z21WI
 f/mYu3ZXvdq+qZZswST4XXunBtwFI1DBBkf0rVFKqLBWDPfZCOn2ofNexXZ39KiJcg0/dP
 8savuj5uRl6XZEpAaAXNgyH3NK8i6aI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
 b=HqJVtlhllsrOzMxYMHtMwM633QSGnvHgTZ78E8rRTlr/JOQKXVuk+D+H3UnXTs1N8yzDT4
 7y3MH2xPfBZI7uCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
 b=D50kxF66cthK0W/9Vao+RiQPZLq/rcXF1UkbqVZo65Ml0hJgMyARZ6m/Rl2fQkU2CG7L+/
 EvcqrXkNXUcInF0IazgQJ/N3jXoitRR0LCGljN62Werq0ndQxM2aXYZGkMMW3eh7gLuOmJ
 jOfbToProX4nKh+bArwFdHyBT7IYAYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
 b=7OReGM9gLvrmYTmjH5DRAtHXYBb0o3/Q8/z7Xa40fRvhLo1ZjQ5aiLQp+z1NgtU/Ufx8so
 Z4a3f8YzJtCVr3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1C4C13AFE;
 Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YJrtNUxjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 23/28] fbdev: imxfb: Use lcd power constants
Date: Tue, 20 Aug 2024 11:23:01 +0200
Message-ID: <20240820093452.68270-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
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
 drivers/video/fbdev/imxfb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 88c117f29f7f..97466e0c5877 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -814,9 +814,9 @@ static int imxfb_lcd_get_power(struct lcd_device *lcddev)
 
 	if (!IS_ERR(fbi->lcd_pwr) &&
 	    !regulator_is_enabled(fbi->lcd_pwr))
-		return FB_BLANK_POWERDOWN;
+		return LCD_POWER_OFF;
 
-	return FB_BLANK_UNBLANK;
+	return LCD_POWER_ON;
 }
 
 static int imxfb_regulator_set(struct imxfb_info *fbi, int enable)
@@ -842,7 +842,7 @@ static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
 
 	if (!IS_ERR(fbi->lcd_pwr))
-		return imxfb_regulator_set(fbi, power == FB_BLANK_UNBLANK);
+		return imxfb_regulator_set(fbi, power == LCD_POWER_ON);
 
 	return 0;
 }
-- 
2.46.0

