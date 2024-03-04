Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF212870717
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8711231C;
	Mon,  4 Mar 2024 16:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M7QF9IZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q6UmkMeP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yK1s5VZA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W6HctuyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB91C11231B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:32:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DFA64336BB;
 Mon,  4 Mar 2024 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709569945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
 b=M7QF9IZdXpT9ejRtElLd6FHvYCzPM4VPzDiJ7awB4oPCdoMjJKM2fPwkcxCW4PUjBfNhO4
 NqgsprhtUg3TnI38uk3upApyj3hRMueeZ0NQSAH3muc+qMIVvl6RavST6vwshJBGeJZ+9p
 PysyKBNDNG6i6/tbKsQatlP/+M9bXGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709569945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
 b=q6UmkMeP/UzKh+xk09ibc/Je7FzybKuwmbdk8kFlQknE/bZLeO8FRSDtYD7aoK9znJcdR3
 h5B8hh4eXQcfNUDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709569944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
 b=yK1s5VZA/oN38PTRiaWR+bOANmOK8XHYE6Ux1ppC7otzGVz6zePnyP4NgsHQVXtfV7XXop
 gMvvn6zC3rxqW9I7xLmYheA3T3xgbczITW7lu63TYw12PViRr20yBS28DHfGXm6UPuaygK
 TpGhGvxj1XTaXpxeticlmycyMpmJsLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709569944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
 b=W6HctuyRQS+A6NFQ95zgsKaZEOr2M7fCntKwsYh5izj0DzjBFfzHIRXDZ1/M6DNLeiYNc2
 Ahkp16Lh8B77BZAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E659139C6;
 Mon,  4 Mar 2024 16:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 8BFpIZj35WVLAQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 16:32:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/10] auxdisplay/ht16k33: Remove struct
 backlight_ops.check_fb
Date: Mon,  4 Mar 2024 17:29:47 +0100
Message-ID: <20240304163220.19144-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304163220.19144-1-tzimmermann@suse.de>
References: <20240304163220.19144-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.20 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.70)[83.41%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
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

The driver sets struct fb_info.bl_dev to the correct backlight
device. Thus rely on the backlight core code to match backlight
and framebuffer devices, and remove the extra check_fb() function
from struct backlight_ops.

v3:
	* use 'check_fb()' in commit message (Andy)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Robin van der Gracht <robin@protonic.nl>
Acked-by: Robin van der Gracht <robin@protonic.nl>
Acked-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/auxdisplay/ht16k33.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index a90430b7d07ba..0a858db32486b 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -325,16 +325,8 @@ static int ht16k33_bl_update_status(struct backlight_device *bl)
 	return ht16k33_brightness_set(priv, brightness);
 }
 
-static int ht16k33_bl_check_fb(struct backlight_device *bl, struct fb_info *fi)
-{
-	struct ht16k33_priv *priv = bl_get_data(bl);
-
-	return (fi == NULL) || (fi->par == priv);
-}
-
 static const struct backlight_ops ht16k33_bl_ops = {
 	.update_status	= ht16k33_bl_update_status,
-	.check_fb	= ht16k33_bl_check_fb,
 };
 
 /*
-- 
2.44.0

