Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE150FC76
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D3C10F386;
	Tue, 26 Apr 2022 12:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8795710F383
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:04:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29C271F388;
 Tue, 26 Apr 2022 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650974642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBLdX1jqqa+2Z6TNaBncgClrJGGDc9hRtavGSJmQoEk=;
 b=JjP4AYWrnSqcD2njYMIWzm7s9vQePFP+8P8GgHzN2iniHoGdtsgrjeWrMAEnEl8W1JJmJy
 tDaTNH3ko8Oq2qHiZ8ZK+fjc6IUyzwgDgGdgyL5rVTNU6Qg8CJir1hiAwjWJccDom/39wX
 NygDeSRHuJ390HHu2RK2VVghhy497fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650974642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBLdX1jqqa+2Z6TNaBncgClrJGGDc9hRtavGSJmQoEk=;
 b=rl6TGLU/aXh0k7dxGov21t6XtWGhduL++4NZzhKeMjQk/7X+rUsYAFb+Lzj07967dcgeRm
 N2WAAo7W6pTa9ZBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E75A213223;
 Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8Id4N7HfZ2KqBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 12:04:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 4/5] fbdev: Rename pagelist to pagereflist for deferred I/O
Date: Tue, 26 Apr 2022 14:03:58 +0200
Message-Id: <20220426120359.17437-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426120359.17437-1-tzimmermann@suse.de>
References: <20220426120359.17437-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename various instances of pagelist to pagereflist. The list now
stores pageref structures, so the new name is more appropriate.

In their write-back helpers, several fbdev drivers refer to the
pageref list in struct fb_deferred_io instead of using the one
supplied as argument to the function. Convert them over to the
supplied one. It's the same instance, so no change of behavior
occurs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_fb_helper.c        |  7 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  5 ++---
 drivers/hid/hid-picolcd_fb.c           |  2 +-
 drivers/staging/fbtft/fbtft-core.c     | 10 +++++-----
 drivers/video/fbdev/broadsheetfb.c     | 12 +++++-------
 drivers/video/fbdev/core/fb_defio.c    | 18 +++++++++---------
 drivers/video/fbdev/hecubafb.c         |  3 +--
 drivers/video/fbdev/hyperv_fb.c        |  5 ++---
 drivers/video/fbdev/metronomefb.c      | 12 +++++-------
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 16 +++++++---------
 drivers/video/fbdev/smscufx.c          |  8 +++-----
 drivers/video/fbdev/ssd1307fb.c        |  3 +--
 drivers/video/fbdev/udlfb.c            |  8 +++-----
 drivers/video/fbdev/xen-fbfront.c      |  5 ++---
 include/drm/drm_fb_helper.h            |  3 +--
 include/linux/fb.h                     |  6 +++---
 16 files changed, 53 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index dd1d72d58b35..5ad2b6a2778c 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -708,13 +708,12 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
- * @pagelist: list of mmap framebuffer pages that have to be flushed
+ * @pagereflist: list of mmap framebuffer pages that have to be flushed
  *
  * This function is used as the &fb_deferred_io.deferred_io
  * callback function for flushing the fbdev mmap writes.
  */
-void drm_fb_helper_deferred_io(struct fb_info *info,
-			       struct list_head *pagelist)
+void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	unsigned long start, end, min, max;
 	struct fb_deferred_io_pageref *pageref;
@@ -722,7 +721,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 
 	min = ULONG_MAX;
 	max = 0;
-	list_for_each_entry(pageref, pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		start = pageref->offset;
 		end = start + PAGE_SIZE;
 		min = min(min, start);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index db02e17e12b6..9a3dc5c4eec8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -316,8 +316,7 @@ static int vmw_fb_pan_display(struct fb_var_screeninfo *var,
 	return 0;
 }
 
-static void vmw_deferred_io(struct fb_info *info,
-			    struct list_head *pagelist)
+static void vmw_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct vmw_fb_par *par = info->par;
 	unsigned long start, end, min, max;
@@ -327,7 +326,7 @@ static void vmw_deferred_io(struct fb_info *info,
 
 	min = ULONG_MAX;
 	max = 0;
-	list_for_each_entry(pageref, pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *page = pageref->page;
 		start = page->index << PAGE_SHIFT;
 		end = start + PAGE_SIZE - 1;
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 78515e6bacf0..de61c08fabea 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -433,7 +433,7 @@ static const struct fb_ops picolcdfb_ops = {
 
 
 /* Callback from deferred IO workqueue */
-static void picolcd_fb_deferred_io(struct fb_info *info, struct list_head *pagelist)
+static void picolcd_fb_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	picolcd_fb_update(info);
 }
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index e9662822e1ef..8774bffe94cc 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -322,7 +322,7 @@ static void fbtft_mkdirty(struct fb_info *info, int y, int height)
 	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
 }
 
-static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagelist)
+static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct fbtft_par *par = info->par;
 	unsigned int dirty_lines_start, dirty_lines_end;
@@ -340,7 +340,7 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagelist)
 	spin_unlock(&par->dirty_lock);
 
 	/* Mark display lines as dirty */
-	list_for_each_entry(pageref, pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *page = pageref->page;
 		count++;
 		index = page->index << PAGE_SHIFT;
@@ -655,9 +655,9 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbops->fb_blank     =      fbtft_fb_blank;
 	fbops->fb_mmap      =      fb_deferred_io_mmap;
 
-	fbdefio->delay =           HZ / fps;
-	fbdefio->sort_pagelist =   true;
-	fbdefio->deferred_io =     fbtft_deferred_io;
+	fbdefio->delay =            HZ / fps;
+	fbdefio->sort_pagereflist = true;
+	fbdefio->deferred_io =      fbtft_deferred_io;
 	fb_deferred_io_init(info);
 
 	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 6afc6ef4cb5e..883a3ac03189 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -929,13 +929,11 @@ static void broadsheetfb_dpy_update(struct broadsheetfb_par *par)
 }
 
 /* this is called back from the deferred io workqueue */
-static void broadsheetfb_dpy_deferred_io(struct fb_info *info,
-				struct list_head *pagelist)
+static void broadsheetfb_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	u16 y1 = 0, h = 0;
 	int prev_index = -1;
 	struct fb_deferred_io_pageref *pageref;
-	struct fb_deferred_io *fbdefio = info->fbdefio;
 	int h_inc;
 	u16 yres = info->var.yres;
 	u16 xres = info->var.xres;
@@ -944,7 +942,7 @@ static void broadsheetfb_dpy_deferred_io(struct fb_info *info,
 	h_inc = DIV_ROUND_UP(PAGE_SIZE , xres);
 
 	/* walk the written page list and swizzle the data */
-	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *cur = pageref->page;
 		if (prev_index < 0) {
 			/* just starting so assign first page */
@@ -1060,9 +1058,9 @@ static const struct fb_ops broadsheetfb_ops = {
 };
 
 static struct fb_deferred_io broadsheetfb_defio = {
-	.delay		= HZ/4,
-	.sort_pagelist	= true,
-	.deferred_io	= broadsheetfb_dpy_deferred_io,
+	.delay			= HZ/4,
+	.sort_pagereflist	= true,
+	.deferred_io		= broadsheetfb_dpy_deferred_io,
 };
 
 static int broadsheetfb_probe(struct platform_device *dev)
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 3f9bb4725119..c730253ab85c 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -41,7 +41,7 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 								 struct page *page)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
-	struct list_head *pos = &fbdefio->pagelist;
+	struct list_head *pos = &fbdefio->pagereflist;
 	unsigned long pgoff = offset >> PAGE_SHIFT;
 	struct fb_deferred_io_pageref *pageref, *cur;
 
@@ -63,7 +63,7 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 	pageref->page = page;
 	pageref->offset = pgoff << PAGE_SHIFT;
 
-	if (unlikely(fbdefio->sort_pagelist)) {
+	if (unlikely(fbdefio->sort_pagereflist)) {
 		/*
 		 * We loop through the list of pagerefs before adding in
 		 * order to keep the pagerefs sorted. This has significant
@@ -71,7 +71,7 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 		 * pages. If possible, drivers should try to work with
 		 * unsorted page lists instead.
 		 */
-		list_for_each_entry(cur, &info->fbdefio->pagelist, list) {
+		list_for_each_entry(cur, &fbdefio->pagereflist, list) {
 			if (cur->offset > pageref->offset)
 				break;
 		}
@@ -158,7 +158,7 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 	mutex_lock(&fbdefio->lock);
 
 	/* first write in this cycle, notify the driver */
-	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
+	if (fbdefio->first_io && list_empty(&fbdefio->pagereflist))
 		fbdefio->first_io(info);
 
 	pageref = fb_deferred_io_pageref_get(info, offset, page);
@@ -249,18 +249,18 @@ static void fb_deferred_io_work(struct work_struct *work)
 
 	/* here we mkclean the pages, then do all deferred IO */
 	mutex_lock(&fbdefio->lock);
-	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
 		struct page *cur = pageref->page;
 		lock_page(cur);
 		page_mkclean(cur);
 		unlock_page(cur);
 	}
 
-	/* driver's callback with pagelist */
-	fbdefio->deferred_io(info, &fbdefio->pagelist);
+	/* driver's callback with pagereflist */
+	fbdefio->deferred_io(info, &fbdefio->pagereflist);
 
 	/* clear the list */
-	list_for_each_entry_safe(pageref, next, &fbdefio->pagelist, list)
+	list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
 		fb_deferred_io_pageref_put(pageref, info);
 
 	mutex_unlock(&fbdefio->lock);
@@ -280,7 +280,7 @@ int fb_deferred_io_init(struct fb_info *info)
 
 	mutex_init(&fbdefio->lock);
 	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
-	INIT_LIST_HEAD(&fbdefio->pagelist);
+	INIT_LIST_HEAD(&fbdefio->pagereflist);
 	if (fbdefio->delay == 0) /* set a default of 1 s */
 		fbdefio->delay = HZ;
 
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index 2c483e2cf9ec..eb1eaadc1bbb 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -115,8 +115,7 @@ static void hecubafb_dpy_update(struct hecubafb_par *par)
 }
 
 /* this is called back from the deferred io workqueue */
-static void hecubafb_dpy_deferred_io(struct fb_info *info,
-				struct list_head *pagelist)
+static void hecubafb_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	hecubafb_dpy_update(info->par);
 }
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 51eb57ea68f7..550cf0990070 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -420,8 +420,7 @@ static void hvfb_docopy(struct hvfb_par *par,
 }
 
 /* Deferred IO callback */
-static void synthvid_deferred_io(struct fb_info *p,
-				 struct list_head *pagelist)
+static void synthvid_deferred_io(struct fb_info *p, struct list_head *pagereflist)
 {
 	struct hvfb_par *par = p->par;
 	struct fb_deferred_io_pageref *pageref;
@@ -437,7 +436,7 @@ static void synthvid_deferred_io(struct fb_info *p,
 	 * in synthvid_update function by clamping the y2
 	 * value to yres.
 	 */
-	list_for_each_entry(pageref, pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *page = pageref->page;
 		start = page->index << PAGE_SHIFT;
 		end = start + PAGE_SIZE - 1;
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 8352fa3f4cef..f581c73d39df 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -465,16 +465,14 @@ static u16 metronomefb_dpy_update_page(struct metronomefb_par *par, int index)
 }
 
 /* this is called back from the deferred io workqueue */
-static void metronomefb_dpy_deferred_io(struct fb_info *info,
-				struct list_head *pagelist)
+static void metronomefb_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	u16 cksum;
 	struct fb_deferred_io_pageref *pageref;
-	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct metronomefb_par *par = info->par;
 
 	/* walk the written page list and swizzle the data */
-	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *cur = pageref->page;
 		cksum = metronomefb_dpy_update_page(par,
 					(cur->index << PAGE_SHIFT));
@@ -569,9 +567,9 @@ static const struct fb_ops metronomefb_ops = {
 };
 
 static struct fb_deferred_io metronomefb_defio = {
-	.delay		= HZ,
-	.sort_pagelist	= true,
-	.deferred_io	= metronomefb_dpy_deferred_io,
+	.delay			= HZ,
+	.sort_pagereflist	= true,
+	.deferred_io		= metronomefb_dpy_deferred_io,
 };
 
 static int metronomefb_probe(struct platform_device *dev)
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 7fcc85352033..d36c2e63f516 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -435,8 +435,7 @@ static struct sh_mobile_lcdc_sys_bus_ops sh_mobile_lcdc_sys_bus_ops = {
 	.read_data	= lcdc_sys_read_data,
 };
 
-static int sh_mobile_lcdc_sginit(struct fb_info *info,
-				  struct list_head *pagelist)
+static int sh_mobile_lcdc_sginit(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct sh_mobile_lcdc_chan *ch = info->par;
 	unsigned int nr_pages_max = ch->fb_size >> PAGE_SHIFT;
@@ -445,7 +444,7 @@ static int sh_mobile_lcdc_sginit(struct fb_info *info,
 
 	sg_init_table(ch->sglist, nr_pages_max);
 
-	list_for_each_entry(pageref, pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *page = pageref->page;
 		sg_set_page(&ch->sglist[nr_pages++], page, PAGE_SIZE, 0);
 	}
@@ -453,8 +452,7 @@ static int sh_mobile_lcdc_sginit(struct fb_info *info,
 	return nr_pages;
 }
 
-static void sh_mobile_lcdc_deferred_io(struct fb_info *info,
-				       struct list_head *pagelist)
+static void sh_mobile_lcdc_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct sh_mobile_lcdc_chan *ch = info->par;
 	const struct sh_mobile_lcdc_panel_cfg *panel = &ch->cfg->panel_cfg;
@@ -463,7 +461,7 @@ static void sh_mobile_lcdc_deferred_io(struct fb_info *info,
 	sh_mobile_lcdc_clk_on(ch->lcdc);
 
 	/*
-	 * It's possible to get here without anything on the pagelist via
+	 * It's possible to get here without anything on the pagereflist via
 	 * sh_mobile_lcdc_deferred_io_touch() or via a userspace fsync()
 	 * invocation. In the former case, the acceleration routines are
 	 * stepped in to when using the framebuffer console causing the
@@ -473,12 +471,12 @@ static void sh_mobile_lcdc_deferred_io(struct fb_info *info,
 	 * acceleration routines have their own methods for writing in
 	 * that still need to be updated.
 	 *
-	 * The fsync() and empty pagelist case could be optimized for,
+	 * The fsync() and empty pagereflist case could be optimized for,
 	 * but we don't bother, as any application exhibiting such
 	 * behaviour is fundamentally broken anyways.
 	 */
-	if (!list_empty(pagelist)) {
-		unsigned int nr_pages = sh_mobile_lcdc_sginit(info, pagelist);
+	if (!list_empty(pagereflist)) {
+		unsigned int nr_pages = sh_mobile_lcdc_sginit(info, pagereflist);
 
 		/* trigger panel update */
 		dma_map_sg(ch->lcdc->dev, ch->sglist, nr_pages, DMA_TO_DEVICE);
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index eb108f56ea04..7f00605bc0d1 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -955,12 +955,10 @@ static void ufx_ops_fillrect(struct fb_info *info,
  *   Touching ANY framebuffer memory that triggers a page fault
  *   in fb_defio will cause a deadlock, when it also tries to
  *   grab the same mutex. */
-static void ufx_dpy_deferred_io(struct fb_info *info,
-				struct list_head *pagelist)
+static void ufx_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
-	struct fb_deferred_io_pageref *pageref;
-	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct ufx_data *dev = info->par;
+	struct fb_deferred_io_pageref *pageref;
 
 	if (!fb_defio)
 		return;
@@ -969,7 +967,7 @@ static void ufx_dpy_deferred_io(struct fb_info *info,
 		return;
 
 	/* walk the written page list and render each to device */
-	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		/* create a rectangle of full screen width that encloses the
 		 * entire dirty framebuffer page */
 		struct page *cur = pageref->page;
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 7547b4628afc..5c765655d000 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -371,8 +371,7 @@ static const struct fb_ops ssd1307fb_ops = {
 	.fb_mmap	= fb_deferred_io_mmap,
 };
 
-static void ssd1307fb_deferred_io(struct fb_info *info,
-				struct list_head *pagelist)
+static void ssd1307fb_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	ssd1307fb_update_display(info->par);
 }
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 8249ed8700d4..c3758613abff 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -781,11 +781,9 @@ static void dlfb_ops_fillrect(struct fb_info *info,
  *   in fb_defio will cause a deadlock, when it also tries to
  *   grab the same mutex.
  */
-static void dlfb_dpy_deferred_io(struct fb_info *info,
-				struct list_head *pagelist)
+static void dlfb_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct fb_deferred_io_pageref *pageref;
-	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct dlfb_data *dlfb = info->par;
 	struct urb *urb;
 	char *cmd;
@@ -811,7 +809,7 @@ static void dlfb_dpy_deferred_io(struct fb_info *info,
 	cmd = urb->transfer_buffer;
 
 	/* walk the written page list and render each to device */
-	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *cur = pageref->page;
 
 		if (dlfb_render_hline(dlfb, &urb, (char *) info->fix.smem_start,
@@ -984,7 +982,7 @@ static int dlfb_ops_open(struct fb_info *info, int user)
 
 		if (fbdefio) {
 			fbdefio->delay = DL_DEFIO_WRITE_DELAY;
-			fbdefio->sort_pagelist = true;
+			fbdefio->sort_pagereflist = true;
 			fbdefio->deferred_io = dlfb_dpy_deferred_io;
 		}
 
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 608fcde767d3..bc8244b9ce03 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -181,8 +181,7 @@ static void xenfb_refresh(struct xenfb_info *info,
 		xenfb_do_update(info, x1, y1, x2 - x1 + 1, y2 - y1 + 1);
 }
 
-static void xenfb_deferred_io(struct fb_info *fb_info,
-			      struct list_head *pagelist)
+static void xenfb_deferred_io(struct fb_info *fb_info, struct list_head *pagereflist)
 {
 	struct xenfb_info *info = fb_info->par;
 	struct fb_deferred_io_pageref *pageref;
@@ -191,7 +190,7 @@ static void xenfb_deferred_io(struct fb_info *fb_info,
 
 	miny = INT_MAX;
 	maxy = 0;
-	list_for_each_entry(pageref, pagelist, list) {
+	list_for_each_entry(pageref, pagereflist, list) {
 		struct page *page = pageref->page;
 		beg = page->index << PAGE_SHIFT;
 		end = beg + PAGE_SIZE - 1;
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3af4624368d8..329607ca65c0 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -229,8 +229,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
 			     struct drm_fb_helper_surface_size *sizes);
 
-void drm_fb_helper_deferred_io(struct fb_info *info,
-			       struct list_head *pagelist);
+void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index a332590c0fae..69c67c70fa78 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -211,9 +211,9 @@ struct fb_deferred_io_pageref {
 struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
 	unsigned long delay;
-	bool sort_pagelist; /* sort pagelist by offset */
-	struct mutex lock; /* mutex that protects the page list */
-	struct list_head pagelist; /* list of touched pages */
+	bool sort_pagereflist; /* sort pagelist by offset */
+	struct mutex lock; /* mutex that protects the pageref list */
+	struct list_head pagereflist; /* list of pagerefs for touched pages */
 	/* callback */
 	void (*first_io)(struct fb_info *info);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
-- 
2.36.0

