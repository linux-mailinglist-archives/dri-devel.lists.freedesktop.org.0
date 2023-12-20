Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B787681A021
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19210E59C;
	Wed, 20 Dec 2023 13:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7326E10E58F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:46:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 121DB1F833;
 Wed, 20 Dec 2023 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZHFG9n39YamI3wDgAPvpsSAtHsaelK95dDBu7E/CLY=;
 b=OpN/fXuzsNCLHbSPfIm/K6pTlJHrpKlh0Jej2hzGMcE+EuC0jNBnYdLT8tOkcda41DUjpP
 guz2EpRkU6dRt8B7lxeQs6PNp+HUjSf+RHWDDDdov79ISG0soJMO9cNsb05b+F6AptIpcB
 D6LK6j8j/2r9fYSwynUkdLTrhFJ07nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZHFG9n39YamI3wDgAPvpsSAtHsaelK95dDBu7E/CLY=;
 b=Hhkt8mNsJeDOYIZmEnPliVnGPL+34SFz/vnmUkQr2iFh6eylIgjNBQibrSizLTXEZ2K2WD
 lGzztGcmZ3zm+WBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZHFG9n39YamI3wDgAPvpsSAtHsaelK95dDBu7E/CLY=;
 b=OpN/fXuzsNCLHbSPfIm/K6pTlJHrpKlh0Jej2hzGMcE+EuC0jNBnYdLT8tOkcda41DUjpP
 guz2EpRkU6dRt8B7lxeQs6PNp+HUjSf+RHWDDDdov79ISG0soJMO9cNsb05b+F6AptIpcB
 D6LK6j8j/2r9fYSwynUkdLTrhFJ07nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZHFG9n39YamI3wDgAPvpsSAtHsaelK95dDBu7E/CLY=;
 b=Hhkt8mNsJeDOYIZmEnPliVnGPL+34SFz/vnmUkQr2iFh6eylIgjNBQibrSizLTXEZ2K2WD
 lGzztGcmZ3zm+WBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D54AD13BA9;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mETwMkfwgmWZJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Dec 2023 13:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH 4/4] video/sticore: Remove info field from STI struct
Date: Wed, 20 Dec 2023 14:22:57 +0100
Message-ID: <20231220134639.8190-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134639.8190-1-tzimmermann@suse.de>
References: <20231220134639.8190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 4.90
X-Spamd-Result: default: False [4.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[15.97%]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The info field in struct sti_struct was used to detect the default
display device. That test is now done with the respective Linux device
and the info field is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/stifb.c | 3 ---
 include/video/sticore.h     | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 36e6bcab83aa..2de0e675fd15 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1389,7 +1389,6 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	}
 
 	/* save for primary gfx device detection & unregister_framebuffer() */
-	sti->info = info;
 	if (register_framebuffer(fb->info) < 0)
 		goto out_err4;
 
@@ -1417,7 +1416,6 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	iounmap(info->screen_base);
 out_err0:
 	framebuffer_release(info);
-	sti->info = NULL;
 	return -ENXIO;
 }
 
@@ -1496,7 +1494,6 @@ stifb_cleanup(void)
 		        framebuffer_release(info);
 			dev_set_drvdata(sti->dev, NULL);
 		}
-		sti->info = NULL;
 	}
 }
 
diff --git a/include/video/sticore.h b/include/video/sticore.h
index 9d993e22805d..823666af1871 100644
--- a/include/video/sticore.h
+++ b/include/video/sticore.h
@@ -3,7 +3,6 @@
 #define STICORE_H
 
 struct device;
-struct fb_info;
 
 /* generic STI structures & functions */
 
@@ -368,9 +367,6 @@ struct sti_struct {
 	/* PCI data structures (pg. 17ff from sti.pdf) */
 	u8 rm_entry[16]; /* pci region mapper array == pci config space offset */
 
-	/* pointer to the fb_info where this STI device is used */
-	struct fb_info *info;
-
 	/* pointer to the parent device */
 	struct device *dev;
 
-- 
2.43.0

