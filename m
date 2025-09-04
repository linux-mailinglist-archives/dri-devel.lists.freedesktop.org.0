Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A16B43B49
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4510EA17;
	Thu,  4 Sep 2025 12:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0C38sndk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VQ78s17d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0C38sndk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VQ78s17d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB95510EA13
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:14:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62EA25D75E;
 Thu,  4 Sep 2025 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756988087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=f1TMzeTO/WN6jFlN1OKtolHqtCnZq2+21VM1rSzyPbA=;
 b=0C38sndkOjoeCV2yDVyDwg3RvBMFnZte4mTGf/lr3FfhP6YEYE7BkzjxeNyP9rR5OH9bXF
 hFSgVMMU6Tz7odgln34DL5or8Xlmnwplp2CGbnaoRjN3RTbhK1v4f0lK5dJwltbyHlUK7h
 8QB9FDy9t9lQtPL6aANQv/QyOZ3lmWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756988087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=f1TMzeTO/WN6jFlN1OKtolHqtCnZq2+21VM1rSzyPbA=;
 b=VQ78s17deLpkBNR/P2xbh0FSrRm/JboSRa+35xbxG+nFti3ZdryXkpNuuweJ3VDWxYeInk
 DlotN37NF3cigyAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756988087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=f1TMzeTO/WN6jFlN1OKtolHqtCnZq2+21VM1rSzyPbA=;
 b=0C38sndkOjoeCV2yDVyDwg3RvBMFnZte4mTGf/lr3FfhP6YEYE7BkzjxeNyP9rR5OH9bXF
 hFSgVMMU6Tz7odgln34DL5or8Xlmnwplp2CGbnaoRjN3RTbhK1v4f0lK5dJwltbyHlUK7h
 8QB9FDy9t9lQtPL6aANQv/QyOZ3lmWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756988087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=f1TMzeTO/WN6jFlN1OKtolHqtCnZq2+21VM1rSzyPbA=;
 b=VQ78s17deLpkBNR/P2xbh0FSrRm/JboSRa+35xbxG+nFti3ZdryXkpNuuweJ3VDWxYeInk
 DlotN37NF3cigyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D78C13675;
 Thu,  4 Sep 2025 12:14:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7p3PCbeCuWjcTwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Sep 2025 12:14:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gma500: Do not clear framebuffer GEM objects during
 cleanup
Date: Thu,  4 Sep 2025 14:09:38 +0200
Message-ID: <20250904121157.395128-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30
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

Gma500 unnecessarily clears the framebuffer's GEM-object pointer
before calling drm_framebuffer_cleanup(). Remove this code to make
gma500 consistent with the rest of the drivers.

The change is cosmetic, as drm_framebuffer_cleanup() does not
touch the object pointer on gma500.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
This change was first tested and submitted as part of the patch at
https://lore.kernel.org/dri-devel/20250704085541.28165-1-tzimmermann@suse.de/ .
It didn't get merged because it wasn't strictly required for that fix.
---
 drivers/gpu/drm/gma500/fbdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 4a37136f90f4..32d31e5f5f1a 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -120,7 +120,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
 	drm_fb_helper_fini(fb_helper);
 
 	drm_framebuffer_unregister_private(fb);
-	fb->obj[0] = NULL;
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
 
@@ -245,7 +244,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 err_drm_framebuffer_unregister_private:
 	drm_framebuffer_unregister_private(fb);
-	fb->obj[0] = NULL;
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
 err_drm_gem_object_put:
-- 
2.50.1

