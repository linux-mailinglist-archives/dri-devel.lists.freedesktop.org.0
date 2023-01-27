Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348767EBC3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 17:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42D310E9B8;
	Fri, 27 Jan 2023 16:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014010E9AF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 16:58:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 707D91F8A4;
 Fri, 27 Jan 2023 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674838724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ALfBJc/TQnM76erXqx3WFS5RKW2U4RiO2owBZHKVCn8=;
 b=eKjVXY6L2bTaysy2dxZYGumxEmgbJgFFV9dWbg2XycKTSNuEReJucdlSDTY4AMPBhorrlL
 ym3HZYuEHB8Np2ZCFuyBNkUOQ0ktCSNEwFFQhsuygKWszcutdYTfvyXwROWRawcYnBzjEY
 ExQGRPzh4knFK7qzICuuvSWW3mFTehs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674838724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ALfBJc/TQnM76erXqx3WFS5RKW2U4RiO2owBZHKVCn8=;
 b=e0DErOEVvhfTZTI2/NwXWSWXpgYrK2/+9f6tnnXm8Yx6D8A5qtYNTf9vFajXiffEiZNcV3
 nE8f0OOcl67HZYDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 466AD1336F;
 Fri, 27 Jan 2023 16:58:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GyqPEMQC1GO1FwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 27 Jan 2023 16:58:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: Fix invalid page access after closing deferred I/O
 devices
Date: Fri, 27 Jan 2023 17:58:34 +0100
Message-Id: <20230127165834.11387-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a fbdev with deferred I/O is once opened and closed, the dirty
pages still remain queued in the pageref list, and eventually later
those may be processed in the delayed work.  This may lead to a
corruption of pages, hitting an Oops.

This patch makes sure to cancel the delayed work and clean up the
pageref list at closing the device for addressing the bug.  A part of
the cleanup code is factored out as a new helper function that is
called from the common fb_release().

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 10 +++++++++-
 drivers/video/fbdev/core/fbmem.c    |  2 ++
 include/linux/fb.h                  |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index c730253ab85c..583cbcf09446 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -313,7 +313,7 @@ void fb_deferred_io_open(struct fb_info *info,
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
-void fb_deferred_io_cleanup(struct fb_info *info)
+void fb_deferred_io_release(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct page *page;
@@ -327,6 +327,14 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 		page = fb_deferred_io_page(info, i);
 		page->mapping = NULL;
 	}
+}
+EXPORT_SYMBOL_GPL(fb_deferred_io_release);
+
+void fb_deferred_io_cleanup(struct fb_info *info)
+{
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+
+	fb_deferred_io_release(info);
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3a6c8458eb8d..78c4cb5ee7c9 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1454,6 +1454,8 @@ __releases(&info->lock)
 	struct fb_info * const info = file->private_data;
 
 	lock_fb_info(info);
+	if (info->fbdefio)
+		fb_deferred_io_release(info);
 	if (info->fbops->fb_release)
 		info->fbops->fb_release(info,1);
 	module_put(info->fbops->owner);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 96b96323e9cb..73eb1f85ea8e 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -662,6 +662,7 @@ extern int  fb_deferred_io_init(struct fb_info *info);
 extern void fb_deferred_io_open(struct fb_info *info,
 				struct inode *inode,
 				struct file *file);
+extern void fb_deferred_io_release(struct fb_info *info);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
-- 
2.35.3

