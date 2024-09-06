Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A396ECBA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB4010E989;
	Fri,  6 Sep 2024 07:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LbbKMY8J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eCmHKYcg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbbKMY8J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eCmHKYcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5894B10E983
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B13721AC3;
 Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=El/h1RCa7JrERwAkoosI+2pklNO0RLiLLnIhB5C9qIo=;
 b=LbbKMY8JKL9ZL5EPpTfn19yg4T9FhGAPrDRLItdcwe6MbZGx6uKFzUeVeU6E0/KtJcq2mE
 jG/l4ba+lEr0uU2cKj7VTZTnwYbMA0OgfFcgIOIwbZpfoiRbfeY6Gsdv9iuSYfO2cv+UFr
 OnUcjB4NfqT2A4UXvG3hDCwzvPyTslw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=El/h1RCa7JrERwAkoosI+2pklNO0RLiLLnIhB5C9qIo=;
 b=eCmHKYcg/2Am3YmPK1sUPQGV8p9BgPR6jLwzXTEH8mDcDfM5+fijizVdWqVpr7FzVMM3Fq
 RQM3yf9RzuXZnSCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=El/h1RCa7JrERwAkoosI+2pklNO0RLiLLnIhB5C9qIo=;
 b=LbbKMY8JKL9ZL5EPpTfn19yg4T9FhGAPrDRLItdcwe6MbZGx6uKFzUeVeU6E0/KtJcq2mE
 jG/l4ba+lEr0uU2cKj7VTZTnwYbMA0OgfFcgIOIwbZpfoiRbfeY6Gsdv9iuSYfO2cv+UFr
 OnUcjB4NfqT2A4UXvG3hDCwzvPyTslw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=El/h1RCa7JrERwAkoosI+2pklNO0RLiLLnIhB5C9qIo=;
 b=eCmHKYcg/2Am3YmPK1sUPQGV8p9BgPR6jLwzXTEH8mDcDfM5+fijizVdWqVpr7FzVMM3Fq
 RQM3yf9RzuXZnSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE620136A8;
 Fri,  6 Sep 2024 07:54:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qIdRKU+12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v2 25/28] HID: picoLCD: Replace check_fb in favor of struct
 fb_info.lcd_dev
Date: Fri,  6 Sep 2024 09:52:39 +0200
Message-ID: <20240906075439.98476-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
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

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in picolcd_lcdops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-picolcd_fb.c  | 4 ++++
 drivers/hid/hid-picolcd_lcd.c | 6 ------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 83e3409d170c..22188acfcbb0 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -497,6 +497,10 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
 #endif
 #endif
 
+#ifdef CONFIG_HID_PICOLCD_LCD
+	info->lcd_dev = data->lcd;
+#endif
+
 	fbdata = info->par;
 	spin_lock_init(&fbdata->lock);
 	fbdata->picolcd = data;
diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
index 061a33ba7b1d..318f19eac0e7 100644
--- a/drivers/hid/hid-picolcd_lcd.c
+++ b/drivers/hid/hid-picolcd_lcd.c
@@ -41,15 +41,9 @@ static int picolcd_set_contrast(struct lcd_device *ldev, int contrast)
 	return 0;
 }
 
-static int picolcd_check_lcd_fb(struct lcd_device *ldev, struct fb_info *fb)
-{
-	return fb && fb == picolcd_fbinfo((struct picolcd_data *)lcd_get_data(ldev));
-}
-
 static const struct lcd_ops picolcd_lcdops = {
 	.get_contrast   = picolcd_get_contrast,
 	.set_contrast   = picolcd_set_contrast,
-	.check_fb       = picolcd_check_lcd_fb,
 };
 
 int picolcd_init_lcd(struct picolcd_data *data, struct hid_report *report)
-- 
2.46.0

