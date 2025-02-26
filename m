Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624CA45A40
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A9110E8AB;
	Wed, 26 Feb 2025 09:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="127FUb5x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ip5jV7SB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="127FUb5x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ip5jV7SB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E000210E8A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 09:37:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 688F51F45E;
 Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
 b=127FUb5x+p0NZXXVN55NZZ9HDmycOF/vMFMgsAUYPIE0/yiiw73JfS1+Z5LhSaEeYpnH3c
 O5AuHDOA9ciJ7ux+SHl/2Di6PxiH5aris9gUTNG3e/gjNjor17Qy2vVsmFkTy53Y2XZTbE
 kZEvin2XAlAYg4FEvTy0GI2qhCjwHkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740562665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
 b=Ip5jV7SBtm4fVji8NWX07LHekHLu72ljhlzZ7DYHFBJLN229MXmQvqul96KXZ6qNNDLCbS
 0YXXbdapdf7yhlBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
 b=127FUb5x+p0NZXXVN55NZZ9HDmycOF/vMFMgsAUYPIE0/yiiw73JfS1+Z5LhSaEeYpnH3c
 O5AuHDOA9ciJ7ux+SHl/2Di6PxiH5aris9gUTNG3e/gjNjor17Qy2vVsmFkTy53Y2XZTbE
 kZEvin2XAlAYg4FEvTy0GI2qhCjwHkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740562665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
 b=Ip5jV7SBtm4fVji8NWX07LHekHLu72ljhlzZ7DYHFBJLN229MXmQvqul96KXZ6qNNDLCbS
 0YXXbdapdf7yhlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2112413A82;
 Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wMnEBungvmezXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/11] fbdev: Rework fb_blank()
Date: Wed, 26 Feb 2025 10:31:50 +0100
Message-ID: <20250226093456.147402-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226093456.147402-1-tzimmermann@suse.de>
References: <20250226093456.147402-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.993]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Reimplement fb_blank() to return early on errors. No functional
changes. Prepares the helper for tracking the blanking state in
struct fb_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3c568cff2913..39e2b81473ad 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -339,11 +339,13 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 }
 EXPORT_SYMBOL(fb_set_var);
 
-int
-fb_blank(struct fb_info *info, int blank)
+int fb_blank(struct fb_info *info, int blank)
 {
 	struct fb_event event;
-	int ret = -EINVAL;
+	int ret;
+
+	if (!info->fbops->fb_blank)
+		return -EINVAL;
 
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
@@ -351,13 +353,13 @@ fb_blank(struct fb_info *info, int blank)
 	event.info = info;
 	event.data = &blank;
 
-	if (info->fbops->fb_blank)
-		ret = info->fbops->fb_blank(blank, info);
+	ret = info->fbops->fb_blank(blank, info);
+	if (ret)
+		return ret;
 
-	if (!ret)
-		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
+	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(fb_blank);
 
-- 
2.48.1

