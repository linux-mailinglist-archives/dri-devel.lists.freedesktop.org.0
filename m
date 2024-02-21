Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCF85D3FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF5610E494;
	Wed, 21 Feb 2024 09:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="we6kFgkA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B9nLsGvD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VW3d1jGj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fRYzmhj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88A910E693
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:43:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 749031FB50;
 Wed, 21 Feb 2024 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708508609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cavlvMvX53yvycI8hdkIGQzWjA/A2JtxVQIXxU8e+nY=;
 b=we6kFgkA2wxdqpQf90Oskg507cXRFMSCY39eDu+Q8F9CpyY/lCTOcIzDD4SrXH5FzMprU7
 noTJepXGRldAaqW5IuvggvO1VZdztoMVxXWvETkmNWo98yjlL89jPJgILhok3CSeFrk34h
 xK7XZgjahBGB1EzhVQEIFyTRnLucRdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708508609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cavlvMvX53yvycI8hdkIGQzWjA/A2JtxVQIXxU8e+nY=;
 b=B9nLsGvDLXZ6HVJTI0TyF6xncf2YmdZtpDa3XH2RZ9Z1/cP+aVh68ApKoGdK68u8lsXwoQ
 KV92M7YSwbwYVmDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708508607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cavlvMvX53yvycI8hdkIGQzWjA/A2JtxVQIXxU8e+nY=;
 b=VW3d1jGjiUVrZrLMHnykCiYqZ3qOuCuOuXlAqFytxFk0wVKTadAuVq/Hd1FZruKQpUSOP4
 KQxC2rjQ5uKTaIpTCd0MY9w3AfmtziVqHFNvDLs3XrQOfnei0CpKwqEiepZs0+UjMKiKUO
 1j6+RTwFieyAOGfkt+XGVKetM3VqRG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708508607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cavlvMvX53yvycI8hdkIGQzWjA/A2JtxVQIXxU8e+nY=;
 b=fRYzmhj7n+FqPdBocNVvlKsGZXrb5H3liZk569qyQkuG1cInPowDdrNYb66RNmkVQqVLNo
 loB+7s3sYTDWOMBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1655F13A42;
 Wed, 21 Feb 2024 09:43:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ECD+A7/F1WUpCwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 09:43:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, andy@kernel.org, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
Date: Wed, 21 Feb 2024 10:41:28 +0100
Message-ID: <20240221094324.27436-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221094324.27436-1-tzimmermann@suse.de>
References: <20240221094324.27436-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.31
X-Spamd-Result: default: False [-0.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLbrmj4aennmrpd7btm9n9zy3k)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:email];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.01)[50.25%]
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

Framebuffer drivers for devices with dedicated backlight are supposed
to set struct fb_info.bl_dev to the backlight's respective device. Use
the value to match backlight and framebuffer in the backlight core code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/backlight/backlight.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 86e1cdc8e3697..48844a4f28ad3 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -98,7 +98,8 @@ static int fb_notifier_callback(struct notifier_block *self,
 {
 	struct backlight_device *bd;
 	struct fb_event *evdata = data;
-	int node = evdata->info->node;
+	struct fb_info *info = evdata->info;
+	int node = info->node;
 	int fb_blank = 0;
 
 	/* If we aren't interested in this event, skip it immediately ... */
@@ -110,8 +111,12 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!bd->ops)
 		goto out;
-	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
+	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
 		goto out;
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	else if (info->bl_dev && info->bl_dev != bd)
+		goto out;
+#endif
 
 	fb_blank = *(int *)evdata->data;
 	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
-- 
2.43.0

