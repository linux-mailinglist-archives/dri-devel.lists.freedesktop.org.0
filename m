Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EA62F64A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DBA10E740;
	Fri, 18 Nov 2022 13:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365C010E73E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:35:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4949322812;
 Fri, 18 Nov 2022 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668778538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgLgPOvU/Hm/9QcCKxn26bZABYsGNvmRwXV+gQ8r7eU=;
 b=G9/D8ofDrXQIqJALlBoIk1hPGgauEnxoqQ8gxJk8Wo2NyaEnsDN2Y0omBc3l+38mfB5air
 KXzO5v7wUKGcHF4RzPhMZEzZLDDZ8TIo9z9YyDQSwpR5D2Pn4vCuphM1tlfWT0rRMISJ9R
 nQklE32BejmH3ZeBiBStjK0AnPvlHBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668778538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgLgPOvU/Hm/9QcCKxn26bZABYsGNvmRwXV+gQ8r7eU=;
 b=usuoRozPh2rm3mnONVpTGt5KrFHGS0xi7b8a25sAZ4US6F8sfPKuBcASM+M2uyFRamSShP
 r5/5xI6f2fTZytAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2593613AA1;
 Fri, 18 Nov 2022 13:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QDI1CCqKd2PHLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:35:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 2/3] Revert "drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer"
Date: Fri, 18 Nov 2022 14:35:34 +0100
Message-Id: <20221118133535.9739-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118133535.9739-1-tzimmermann@suse.de>
References: <20221118133535.9739-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 7f5cc4a3e5e4c5a38e5748defc952e45278f7a70.

Needed to restore the fbdev damage worker. There have been bug reports
about locking order [1] and incorrectly takens branches. [2] Restore
the damage worker until these problems have been resovled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://intel-gfx-ci.01.org/tree/drm-tip/fi-kbl-8809g.html # 1
Link: https://lore.kernel.org/dri-devel/20221115115819.23088-6-tzimmermann@suse.de/T/#m06eedc0a468940e4cbbd14ca026733b639bc445a # 2
---
 drivers/gpu/drm/drm_fb_helper.c     |  9 +--------
 drivers/video/fbdev/core/fb_defio.c | 16 ----------------
 include/linux/fb.h                  |  1 -
 3 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index c0e9a977a3b3c..cdbf03e941b2b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -599,16 +599,9 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
-	struct fb_info *info = helper->info;
-
 	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
-	/*
-	 * The current fbdev emulation only flushes buffers if a damage
-	 * update is necessary. And we can assume that deferred I/O has
-	 * been enabled as damage updates require deferred I/O for mmap.
-	 */
-	fb_deferred_io_schedule_flush(info);
+	schedule_work(&helper->damage_work);
 }
 
 /*
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index dec678f72a42f..c730253ab85ce 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -332,19 +332,3 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 	mutex_destroy(&fbdefio->lock);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
-
-void fb_deferred_io_schedule_flush(struct fb_info *info)
-{
-	struct fb_deferred_io *fbdefio = info->fbdefio;
-
-	if (WARN_ON_ONCE(!fbdefio))
-		return; /* bug in driver logic */
-
-	/*
-	 * There's no requirement from callers to schedule the
-	 * flush immediately. Rather schedule the worker with a
-	 * delay and let a few more writes pile up.
-	 */
-	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
-}
-EXPORT_SYMBOL_GPL(fb_deferred_io_schedule_flush);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3a822e4357b12..e6b8e7ad7ac80 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -663,7 +663,6 @@ extern void fb_deferred_io_open(struct fb_info *info,
 				struct inode *inode,
 				struct file *file);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
-extern void fb_deferred_io_schedule_flush(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
 
-- 
2.38.1

