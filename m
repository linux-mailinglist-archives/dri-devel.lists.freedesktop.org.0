Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52E96ECCD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9510E995;
	Fri,  6 Sep 2024 07:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cY26zzZF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uf6hKaPj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cY26zzZF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uf6hKaPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3E510E97D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4424B1F899;
 Fri,  6 Sep 2024 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef0hSIOmGlA16Vu/iua2Jju7jbOxejWdHc/CHjQJoWY=;
 b=cY26zzZF2cWgfcHzNtx/+2JfRtjHAb8osLIOeZcwzxQ3RnOxEpe4e40pKo02qZPPaHWFLV
 XEW3qF6N8iDgQCJRm2tlcytP9GfhWmsTbFR+DRLWpibiqsHA5LxdcSxROdK7RJVZr226Lx
 mqRoH9JOqYfnFxlnBMwTyY1KsD0yXD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef0hSIOmGlA16Vu/iua2Jju7jbOxejWdHc/CHjQJoWY=;
 b=Uf6hKaPj1Ya0wFPrHVav5Vsej1msYxuyWPpIh4lu58Wt0the+Mn08HHzUb6l0YdiYAyH/d
 bWVVY9c5yBZSYfBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef0hSIOmGlA16Vu/iua2Jju7jbOxejWdHc/CHjQJoWY=;
 b=cY26zzZF2cWgfcHzNtx/+2JfRtjHAb8osLIOeZcwzxQ3RnOxEpe4e40pKo02qZPPaHWFLV
 XEW3qF6N8iDgQCJRm2tlcytP9GfhWmsTbFR+DRLWpibiqsHA5LxdcSxROdK7RJVZr226Lx
 mqRoH9JOqYfnFxlnBMwTyY1KsD0yXD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef0hSIOmGlA16Vu/iua2Jju7jbOxejWdHc/CHjQJoWY=;
 b=Uf6hKaPj1Ya0wFPrHVav5Vsej1msYxuyWPpIh4lu58Wt0the+Mn08HHzUb6l0YdiYAyH/d
 bWVVY9c5yBZSYfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B44D136A8;
 Fri,  6 Sep 2024 07:54:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0N2lJE612mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 23/28] fbdev: imxfb: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:37 +0200
Message-ID: <20240906075439.98476-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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

