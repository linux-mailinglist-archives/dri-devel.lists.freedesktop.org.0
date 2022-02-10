Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D284B0FE3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 15:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226F210E8E4;
	Thu, 10 Feb 2022 14:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAE010E8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 14:11:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD1A021114;
 Thu, 10 Feb 2022 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644502294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3S4RvJdlP5BIh8B4OhTvpSZaUM6LEPYp7U56LaQG7I=;
 b=xWJ4PK0MiulEMPfYU/6DM7Ecy99FQj6f4dEkSoi088vMDrvTcM1nKceMuXjAO6SGuueQ3V
 qedkd72SUgQCoEo67E5GHGJuL3vMl4pn+omSMt5KRVgbw6TYzYtneSWAU3uryhXFFbfI+q
 9BnfuVDehOAV+4HndxR4xcJ2CeOuyQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644502294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3S4RvJdlP5BIh8B4OhTvpSZaUM6LEPYp7U56LaQG7I=;
 b=RbYaO040hRZcViS8llm9DihB/x6+aIeyZmFNUhh0lbSR8PxTbqcXSsJO7lmV4BfEMmT6Rk
 QSAhlzBaKRbfeODg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6981D13B9E;
 Thu, 10 Feb 2022 14:11:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MrNGBYdBWIPaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 14:11:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, deller@gmx.de, bernie@plugable.com,
 jayalk@intworks.biz
Subject: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
Date: Thu, 10 Feb 2022 15:11:13 +0100
Message-Id: <20220210141111.5231-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210141111.5231-1-tzimmermann@suse.de>
References: <20220210141111.5231-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
significant overhead. Make the sorting step optional and update the few
drivers that require it. Use a FIFO list by default.

Sorting pages by memory offset for deferred I/O performs an implicit
bubble-sort step on the list of dirty pages. The algorithm goes through
the list of dirty pages and inserts each new page according to its
index field. Even worse, list traversal always starts at the first
entry. As video memory is most likely updated scanline by scanline, the
algorithm traverses through the complete list for each updated page.

For example, with 1024x768x32bpp a page covers exactly one scanline.
Writing a single screen update from top to bottom requires updating
768 pages. With an average list length of 384 entries, a screen update
creates (768 * 384 =) 294912 compare operation.

Fix this by making the sorting step opt-in and update the few drivers
that require it. All other drivers work with unsorted page lists. Pages
are appended to the list. Therefore, in the common case of writing the
framebuffer top to bottom, pages are still sorted by offset, which may
have a positive effect on performance.

Playing a video [1] in mplayer's benchmark mode shows the difference
(i7-4790, FullHD, simpledrm, kernel with debugging).

  mplayer -benchmark -nosound -vo fbdev ./big_buck_bunny_720p_stereo.ogg

With sorted page lists:

  BENCHMARKs: VC:  32.960s VO:  73.068s A:   0.000s Sys:   2.413s =  108.441s
  BENCHMARK%: VC: 30.3947% VO: 67.3802% A:  0.0000% Sys:  2.2251% = 100.0000%

With unsorted page lists:

  BENCHMARKs: VC:  31.005s VO:  42.889s A:   0.000s Sys:   2.256s =   76.150s
  BENCHMARK%: VC: 40.7156% VO: 56.3219% A:  0.0000% Sys:  2.9625% = 100.0000%

VC shows the overhead of video decoding, VO shows the overhead of the
video output. Using unsorted page lists reduces the benchmark's run time
by ~32s/~25%.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_stereo.ogg # [1]
---
 drivers/staging/fbtft/fbtft-core.c  |  1 +
 drivers/video/fbdev/broadsheetfb.c  |  1 +
 drivers/video/fbdev/core/fb_defio.c | 19 ++++++++++++-------
 drivers/video/fbdev/metronomefb.c   |  1 +
 drivers/video/fbdev/udlfb.c         |  1 +
 include/linux/fb.h                  |  1 +
 6 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f2684d2d6851..4a35347b3020 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -654,6 +654,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbops->fb_blank     =      fbtft_fb_blank;
 
 	fbdefio->delay =           HZ / fps;
+	fbdefio->sort_pagelist =   true;
 	fbdefio->deferred_io =     fbtft_deferred_io;
 	fb_deferred_io_init(info);
 
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index fd66f4d4a621..b9054f658838 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1059,6 +1059,7 @@ static const struct fb_ops broadsheetfb_ops = {
 
 static struct fb_deferred_io broadsheetfb_defio = {
 	.delay		= HZ/4,
+	.sort_pagelist	= true,
 	.deferred_io	= broadsheetfb_dpy_deferred_io,
 };
 
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 3727b1ca87b1..1f672cf253b2 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -132,15 +132,20 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	if (!list_empty(&page->lru))
 		goto page_already_added;
 
-	/* we loop through the pagelist before adding in order
-	to keep the pagelist sorted */
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
-		if (cur->index > page->index)
-			break;
+	if (fbdefio->sort_pagelist) {
+		/*
+		 * We loop through the pagelist before adding in order
+		 * to keep the pagelist sorted.
+		 */
+		list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+			if (cur->index > page->index)
+				break;
+		}
+		list_add_tail(&page->lru, &cur->lru);
+	} else {
+		list_add_tail(&page->lru, &fbdefio->pagelist);
 	}
 
-	list_add_tail(&page->lru, &cur->lru);
-
 page_already_added:
 	mutex_unlock(&fbdefio->lock);
 
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 952826557a0c..af858dd23ea6 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -568,6 +568,7 @@ static const struct fb_ops metronomefb_ops = {
 
 static struct fb_deferred_io metronomefb_defio = {
 	.delay		= HZ,
+	.sort_pagelist	= true,
 	.deferred_io	= metronomefb_dpy_deferred_io,
 };
 
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b9cdd02c1000..184bb8433b78 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -980,6 +980,7 @@ static int dlfb_ops_open(struct fb_info *info, int user)
 
 		if (fbdefio) {
 			fbdefio->delay = DL_DEFIO_WRITE_DELAY;
+			fbdefio->sort_pagelist = true;
 			fbdefio->deferred_io = dlfb_dpy_deferred_io;
 		}
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3d7306c9a706..9a77ab615c36 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -204,6 +204,7 @@ struct fb_pixmap {
 struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
 	unsigned long delay;
+	bool sort_pagelist; /* sort pagelist by offset */
 	struct mutex lock; /* mutex that protects the page list */
 	struct list_head pagelist; /* list of touched pages */
 	/* callback */
-- 
2.34.1

