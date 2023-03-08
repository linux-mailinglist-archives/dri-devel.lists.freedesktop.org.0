Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF66AFEFC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 07:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BE510E580;
	Wed,  8 Mar 2023 06:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFD510E580
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 06:36:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A06F41FE35;
 Wed,  8 Mar 2023 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678257395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3h4YnW3SI7kDxrFZgy/I5e5nc2hFg1fRCOVnjuFOR5s=;
 b=fPX9DEKvn90FUOVp/Nv3gfbbh9B0O41ZMRb4O3Fv4ncTlmPR7N6fR52LcDXL5UzEw8FCw+
 ZxvkABlDnarvk1eb7sucVSPkIAnd2If61vC8AYCQW6N9GnvFDYfjouDA7zv17THJImep25
 AzaiG/xDCfvhVrtefyhH8j+MS3auWJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678257395;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3h4YnW3SI7kDxrFZgy/I5e5nc2hFg1fRCOVnjuFOR5s=;
 b=+TNtLndF9vaeJXeXb0MPUjA9YGoTL4KAFoltv1+Za7Mws6lphC72cM7RAphviMU1t6S83B
 iVC4m3m8XBB+uMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 754621348D;
 Wed,  8 Mar 2023 06:36:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wsflG/MsCGS/WgAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 08 Mar 2023 06:36:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] fbdev: Fix incorrect page mapping clearance at
 fb_deferred_io_release()
Date: Wed,  8 Mar 2023 07:36:28 +0100
Message-Id: <20230308063628.15233-1-tiwai@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Miko Larsson <mikoxyzzz@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The recent fix for the deferred I/O by the commit
  3efc61d95259 ("fbdev: Fix invalid page access after closing deferred I/O devices")
caused a regression when the same fb device is opened/closed while
it's being used.  It resulted in a frozen screen even if something
is redrawn there after the close.  The breakage is because the patch
was made under a wrong assumption of a single open; in the current
code, fb_deferred_io_release() cleans up the page mapping of the
pageref list and it calls cancel_delayed_work_sync() unconditionally,
where both are no correct behavior for multiple opens.

This patch adds a refcount for the opens of the device, and applies
the cleanup only when all files get closed.

Fixes: 3efc61d95259 ("fbdev: Fix invalid page access after closing deferred I/O devices")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 16 +++++++++++++---
 include/linux/fb.h                  |  1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index aa5f059d0222..9dcec9e020b6 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -305,17 +305,19 @@ void fb_deferred_io_open(struct fb_info *info,
 			 struct inode *inode,
 			 struct file *file)
 {
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
+	fbdefio->opens++;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
-void fb_deferred_io_release(struct fb_info *info)
+static void fb_deferred_io_release_internal(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct page *page;
 	int i;
 
-	BUG_ON(!fbdefio);
 	cancel_delayed_work_sync(&info->deferred_work);
 
 	/* clear out the mapping that we setup */
@@ -324,13 +326,21 @@ void fb_deferred_io_release(struct fb_info *info)
 		page->mapping = NULL;
 	}
 }
+
+void fb_deferred_io_release(struct fb_info *info)
+{
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+
+	if (!--fbdefio->opens)
+		fb_deferred_io_release_internal(info);
+}
 EXPORT_SYMBOL_GPL(fb_deferred_io_release);
 
 void fb_deferred_io_cleanup(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
-	fb_deferred_io_release(info);
+	fb_deferred_io_release_internal(info);
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index d8d20514ea05..29674a29d1c4 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -212,6 +212,7 @@ struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
 	unsigned long delay;
 	bool sort_pagereflist; /* sort pagelist by offset */
+	int opens; /* number of opened files */
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
 	/* callback */
-- 
2.35.3

