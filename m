Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43FC91521D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CE310E4CB;
	Mon, 24 Jun 2024 15:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iX6YeF3X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Eq3vzRa6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iX6YeF3X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Eq3vzRa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020D10E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:20:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0616A21AB4;
 Mon, 24 Jun 2024 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719242447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wEc5/T6q6gu4EuBZrlJYWrG3bGXxPSbfxMZQIpG9es=;
 b=iX6YeF3X3tCTkQxSW//aO+yOVyIlpOtQ0FZz77Lf2EDhVvvKkImla/qYRFNGgzm3ZEhmEi
 S9zhanQLDuc13uWXzsBSGz3o1jkmuG8154aL2bdErespPkMxo19XgtjXc2snMwXj4P3u/v
 xJ1Uu8BZQBrMocxmtQSeg3XDJj0J8G8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719242447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wEc5/T6q6gu4EuBZrlJYWrG3bGXxPSbfxMZQIpG9es=;
 b=Eq3vzRa6QoUGa/W4aVWvX0ZpClc//7AIdS2D8CpDvV6SG1OUO5ebTZ7ScqhSjxfNxTLGQj
 DAQpMMR5eFRWoACA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719242447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wEc5/T6q6gu4EuBZrlJYWrG3bGXxPSbfxMZQIpG9es=;
 b=iX6YeF3X3tCTkQxSW//aO+yOVyIlpOtQ0FZz77Lf2EDhVvvKkImla/qYRFNGgzm3ZEhmEi
 S9zhanQLDuc13uWXzsBSGz3o1jkmuG8154aL2bdErespPkMxo19XgtjXc2snMwXj4P3u/v
 xJ1Uu8BZQBrMocxmtQSeg3XDJj0J8G8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719242447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wEc5/T6q6gu4EuBZrlJYWrG3bGXxPSbfxMZQIpG9es=;
 b=Eq3vzRa6QoUGa/W4aVWvX0ZpClc//7AIdS2D8CpDvV6SG1OUO5ebTZ7ScqhSjxfNxTLGQj
 DAQpMMR5eFRWoACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AABBE13AA4;
 Mon, 24 Jun 2024 15:20:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eNBhKM6OeWbqGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 15:20:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org,
 jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org,
 f.suligoi@asem.it, ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 17/17] backlight: sky81452-backlight: Use backlight power
 constants
Date: Mon, 24 Jun 2024 17:20:12 +0200
Message-ID: <20240624152033.25016-18-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
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
 drivers/video/backlight/sky81452-backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 19f9f84a9fd6..935043b67786 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -315,7 +315,7 @@ static void sky81452_bl_remove(struct platform_device *pdev)
 
 	sysfs_remove_group(&bd->dev.kobj, &sky81452_bl_attr_group);
 
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	bd->props.brightness = 0;
 	backlight_update_status(bd);
 
-- 
2.45.2

