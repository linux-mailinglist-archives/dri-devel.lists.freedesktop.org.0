Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750485D408
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DD110E6AA;
	Wed, 21 Feb 2024 09:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yUWafFyY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZOKPxJWJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yUWafFyY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZOKPxJWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D2B10E691
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:43:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27EE121ED8;
 Wed, 21 Feb 2024 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708508609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmHOaf1sO3yn0g8TKvW7sjLNXGxLzPU0y2+ebOZCwiE=;
 b=yUWafFyYe/zHZJPfVa1zDU87NchQjeUff6/3bsnjWULTULIyoeTb3ckyw3P/Fk9ShTE6KE
 GnXXrkzoQmB3AbJg8kBv45RtsWUH2z1kuhTIvKaAhJEQiN5cghb2sr4o9dIYexzu1PrLmT
 cCUSM5iZ4lhwKSDV5oE31sHo1iJpyKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708508609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmHOaf1sO3yn0g8TKvW7sjLNXGxLzPU0y2+ebOZCwiE=;
 b=ZOKPxJWJpkV96seqFu1H4WhnunY4KtcFMzc6shwRzYOoIQMpm+ErTNFswMgoZSEjB9DcEG
 H5uDo3OpytT/c7AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708508609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmHOaf1sO3yn0g8TKvW7sjLNXGxLzPU0y2+ebOZCwiE=;
 b=yUWafFyYe/zHZJPfVa1zDU87NchQjeUff6/3bsnjWULTULIyoeTb3ckyw3P/Fk9ShTE6KE
 GnXXrkzoQmB3AbJg8kBv45RtsWUH2z1kuhTIvKaAhJEQiN5cghb2sr4o9dIYexzu1PrLmT
 cCUSM5iZ4lhwKSDV5oE31sHo1iJpyKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708508609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmHOaf1sO3yn0g8TKvW7sjLNXGxLzPU0y2+ebOZCwiE=;
 b=ZOKPxJWJpkV96seqFu1H4WhnunY4KtcFMzc6shwRzYOoIQMpm+ErTNFswMgoZSEjB9DcEG
 H5uDo3OpytT/c7AQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C24B213A6D;
 Wed, 21 Feb 2024 09:43:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SAoMLsDF1WUpCwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 09:43:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, andy@kernel.org, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/10] backlight/aat2870-backlight: Remove struct
 backlight.check_fb
Date: Wed, 21 Feb 2024 10:41:32 +0100
Message-ID: <20240221094324.27436-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221094324.27436-1-tzimmermann@suse.de>
References: <20240221094324.27436-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.80 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLbrmj4aennmrpd7btm9n9zy3k)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,linaro.org:email];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.10)[65.56%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.80
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

The driver's implementation of check_fb always returns true, which
is the default if no implementation has been set. So remove the code
from the driver.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/backlight/aat2870_bl.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 81fde3abb92c4..b4c3354a1a8a6 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/mfd/aat2870.h>
 
@@ -90,15 +89,9 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	return 0;
 }
 
-static int aat2870_bl_check_fb(struct backlight_device *bd, struct fb_info *fi)
-{
-	return 1;
-}
-
 static const struct backlight_ops aat2870_bl_ops = {
 	.options = BL_CORE_SUSPENDRESUME,
 	.update_status = aat2870_bl_update_status,
-	.check_fb = aat2870_bl_check_fb,
 };
 
 static int aat2870_bl_probe(struct platform_device *pdev)
-- 
2.43.0

