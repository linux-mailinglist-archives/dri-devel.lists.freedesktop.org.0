Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A154822B4B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BA510E262;
	Wed,  3 Jan 2024 10:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0D110E17A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:26:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F81121FC4;
 Wed,  3 Jan 2024 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704277603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSjY6JJfBEwJxJHNnM5TRKbfR+VWCIL7nuYGfXd6kqk=;
 b=Mt+nl6wtMi/a5lycwHN8eoxEKgu+UTrjp8rB3onWh+NlhzEH8ZDOJAAaWSsmAs1hDRet9C
 vNb4WECK2QZgE6hF+VXh0FIKVpq3osl6LbOZJcY1zlZiHhM2deZ1OZof2W+hntmQ388dFo
 jBhht7X5xgM54HJUZhlqHmkxAhKQ4Zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704277603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSjY6JJfBEwJxJHNnM5TRKbfR+VWCIL7nuYGfXd6kqk=;
 b=mc1m68iShmoN1z/q2w6ZSqQ2lExB8MBCt7ltuxXMZHEonU0dv/OltYsyacAFygxCea/47V
 G5gE3LESTwD1XqCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704277603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSjY6JJfBEwJxJHNnM5TRKbfR+VWCIL7nuYGfXd6kqk=;
 b=Mt+nl6wtMi/a5lycwHN8eoxEKgu+UTrjp8rB3onWh+NlhzEH8ZDOJAAaWSsmAs1hDRet9C
 vNb4WECK2QZgE6hF+VXh0FIKVpq3osl6LbOZJcY1zlZiHhM2deZ1OZof2W+hntmQ388dFo
 jBhht7X5xgM54HJUZhlqHmkxAhKQ4Zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704277603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSjY6JJfBEwJxJHNnM5TRKbfR+VWCIL7nuYGfXd6kqk=;
 b=mc1m68iShmoN1z/q2w6ZSqQ2lExB8MBCt7ltuxXMZHEonU0dv/OltYsyacAFygxCea/47V
 G5gE3LESTwD1XqCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F4BF13C90;
 Wed,  3 Jan 2024 10:26:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ICNFDmM2lWWmfgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jan 2024 10:26:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: drawat.floss@gmail.com, javierm@redhat.com, deller@gmx.de,
 decui@microsoft.com, wei.liu@kernel.org, haiyangz@microsoft.com,
 kys@microsoft.com, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 4/4] fbdev/hyperv_fb: Do not clear global screen_info
Date: Wed,  3 Jan 2024 11:15:12 +0100
Message-ID: <20240103102640.31751-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103102640.31751-1-tzimmermann@suse.de>
References: <20240103102640.31751-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.19
X-Spamd-Result: default: False [1.19 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmail.com,redhat.com,gmx.de,microsoft.com,kernel.org,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.01)[47.53%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not clear the global instance of screen_info. If necessary, clearing
fields in screen_info should be done by architecture or firmware code
that maintains the firmware framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hyperv_fb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 76c956b9a321..7d5717805c0b 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -48,7 +48,6 @@
 #include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/screen_info.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/completion.h>
@@ -1059,14 +1058,8 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	else
 		aperture_remove_all_conflicting_devices(KBUILD_MODNAME);
 
-	if (!gen2vm) {
+	if (!gen2vm)
 		pci_dev_put(pdev);
-	} else if (IS_ENABLED(CONFIG_SYSFB)) {
-		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
-		screen_info.lfb_size = 0;
-		screen_info.lfb_base = 0;
-		screen_info.orig_video_isVGA = 0;
-	}
 
 	return 0;
 
-- 
2.43.0

