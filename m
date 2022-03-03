Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916754CC772
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1C10E7DB;
	Thu,  3 Mar 2022 20:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E857E10E797
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:58:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 316621F382;
 Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646341122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfEpk50UyT3t2wwY9lhdn3YpUW2SV41uStI58pIzNqU=;
 b=al74VehcdlZHORvrbqQF/Tr1udMVAKRTJoLCTnm/1L3q7uZbfeBwKBbv08DPFcoynMURXe
 PNiqcEq0i9RSUaZ5XZ4hinDKOtRMOI3m4tQ9YgXbiMsRdTiPFVPxWIhQZNjR6HS0alY3kz
 TehrIQiEow3w7lI6fc9OsJfKy52p7vU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646341122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfEpk50UyT3t2wwY9lhdn3YpUW2SV41uStI58pIzNqU=;
 b=YX1bb7vvHYjN65pkussmAq+cpI9E1X6CT3+CWhIY8WMRJuPoIxNndj0aIr24tIRxzuRqyQ
 fkXmUXbX6KrC4XBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8D9713AEE;
 Thu,  3 Mar 2022 20:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6BLmNwEsIWJoHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, deller@gmx.de, javierm@redhat.com
Subject: [PATCH 3/9] fbdev: Track deferred-I/O pages in pageref struct
Date: Thu,  3 Mar 2022 21:58:33 +0100
Message-Id: <20220303205839.28484-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the per-page state for fbdev's deferred I/O in struct
fb_deferred_io_pageref. Maintain a list of pagerefs for the pages
that have to be flushed out to video memory. Update all affected
drivers.

Like with pages before, fbdev acquires a pageref when an mmaped page
of the framebuffer is being written to. It holds the pageref in a
list of all currently written pagerefs until it flushes the written
pages to video memory. Writeback occurs periodically. After writeback
fbdev releases all pagerefs and builds up a new dirty list until the
next writeback occurs.

Using pagerefs has a number of benefits.

For pages of the framebuffer, the deferred I/O code used struct
page.lru as an entry into the list of dirty pages. The lru field is
owned by the page cache, which makes deferred I/O incompatible with
some memory pages (e.g., most notably DRM's GEM SHMEM allocator).
struct fb_deferred_io_pageref now provides an entry into a list of
dirty framebuffer pages, free'ing lru for use with the page cache.

Drivers also assumed that struct page.index is the page offset into
the framebuffer. This is not true for DRM buffers, which are located
at various offset within a mapped area. struct fb_deferred_io_pageref
explicitly stores an offset into the framebuffer. struct page.index
is now only the page offset into the mapped area.

These changes will allow DRM to use fbdev deferred I/O without an
intermediate shadow buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c        |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |   5 +-
 drivers/staging/fbtft/fbtft-core.c     |   5 +-
 drivers/video/fbdev/broadsheetfb.c     |   5 +-
 drivers/video/fbdev/core/fb_defio.c    | 153 +++++++++++++++++--------
 drivers/video/fbdev/hyperv_fb.c        |   5 +-
 drivers/video/fbdev/metronomefb.c      |   5 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c |   6 +-
 drivers/video/fbdev/smscufx.c          |   5 +-
 drivers/video/fbdev/udlfb.c            |   5 +-
 drivers/video/fbdev/xen-fbfront.c      |   5 +-
 include/linux/fb.h                     |  11 +-
 12 files changed, 147 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d06ce0e92d66..dd1d72d58b35 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -717,13 +717,13 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 			       struct list_head *pagelist)
 {
 	unsigned long start, end, min, max;
-	struct page *page;
+	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
 
 	min = ULONG_MAX;
 	max = 0;
-	list_for_each_entry(page, pagelist, lru) {
-		start = page->index << PAGE_SHIFT;
+	list_for_each_entry(pageref, pagelist, list) {
+		start = pageref->offset;
 		end = start + PAGE_SIZE;
 		min = min(min, start);
 		max = max(max, end);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 33f355907fbb..a35f695727c9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -322,12 +322,13 @@ static void vmw_deferred_io(struct fb_info *info,
 	struct vmw_fb_par *par = info->par;
 	unsigned long start, end, min, max;
 	unsigned long flags;
-	struct page *page;
+	struct fb_deferred_io_pageref *pageref;
 	int y1, y2;
 
 	min = ULONG_MAX;
 	max = 0;
-	list_for_each_entry(page, pagelist, lru) {
+	list_for_each_entry(pageref, pagelist, list) {
+		struct page *page = pageref->page;
 		start = page->index << PAGE_SHIFT;
 		end = start + PAGE_SIZE - 1;
 		min = min(min, start);
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 60c55451e414..8c596c7948f5 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -326,7 +326,7 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagelist)
 {
 	struct fbtft_par *par = info->par;
 	unsigned int dirty_lines_start, dirty_lines_end;
-	struct page *page;
+	struct fb_deferred_io_pageref *pageref;
 	unsigned long index;
 	unsigned int y_low = 0, y_high = 0;
 	int count = 0;
@@ -340,7 +340,8 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagelist)
 	spin_unlock(&par->dirty_lock);
 
 	/* Mark display lines as dirty */
-	list_for_each_entry(page, pagelist, lru) {
+	list_for_each_entry(pageref, pagelist, list) {
+		struct page *page = pageref->page;
 		count++;
 		index = page->index << PAGE_SHIFT;
 		y_low = index / info->fix.line_length;
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 528bc0902338..6afc6ef4cb5e 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -934,7 +934,7 @@ static void broadsheetfb_dpy_deferred_io(struct fb_info *info,
 {
 	u16 y1 = 0, h = 0;
 	int prev_index = -1;
-	struct page *cur;
+	struct fb_deferred_io_pageref *pageref;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	int h_inc;
 	u16 yres = info->var.yres;
@@ -944,7 +944,8 @@ static void broadsheetfb_dpy_deferred_io(struct fb_info *info,
 	h_inc = DIV_ROUND_UP(PAGE_SIZE , xres);
 
 	/* walk the written page list and swizzle the data */
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+		struct page *cur = pageref->page;
 		if (prev_index < 0) {
 			/* just starting so assign first page */
 			y1 = (cur->index << PAGE_SHIFT) / xres;
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 662bb5d2b872..20c6eb94a685 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -36,6 +36,60 @@ static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs
 	return page;
 }
 
+static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
+								 unsigned long offset,
+								 struct page *page)
+{
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+	struct list_head *pos = &fbdefio->pagelist;
+	unsigned long pgoff = offset >> PAGE_SHIFT;
+	struct fb_deferred_io_pageref *pageref, *cur;
+
+	if (WARN_ON_ONCE(pgoff >= info->npagerefs))
+		return NULL; /* incorrect allocation size */
+
+	/* 1:1 mapping between pageref and page offset */
+	pageref = &info->pagerefs[pgoff];
+
+	/*
+	 * This check is to catch the case where a new process could start
+	 * writing to the same page through a new PTE. This new access
+	 * can cause a call to .page_mkwrite even if the original process'
+	 * PTE is marked writable.
+	 */
+	if (!list_empty(&pageref->list))
+		goto pageref_already_added;
+
+	pageref->page = page;
+	pageref->offset = pgoff << PAGE_SHIFT;
+
+	if (unlikely(fbdefio->sort_pagelist)) {
+		/*
+		 * We loop through the list of pagerefs before adding, in
+		 * order to keep the pagerefs sorted. This has significant
+		 * overhead of O(n^2) with n being the number of written
+		 * pages. If possible, drivers should try to work with
+		 * unsorted page lists instead.
+		 */
+		list_for_each_entry(cur, &info->fbdefio->pagelist, list) {
+			if (cur > pageref)
+				break;
+		}
+		pos = &cur->list;
+	}
+
+	list_add_tail(&pageref->list, pos);
+
+pageref_already_added:
+	return pageref;
+}
+
+static void fb_deferred_io_pageref_put(struct fb_deferred_io_pageref *pageref,
+				       struct fb_info *info)
+{
+	list_del_init(&pageref->list);
+}
+
 /* this is to find and return the vmalloc-ed fb pages */
 static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 {
@@ -59,8 +113,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 		printk(KERN_ERR "no mapping available\n");
 
 	BUG_ON(!page->mapping);
-	INIT_LIST_HEAD(&page->lru);
-	page->index = vmf->pgoff;
+	page->index = vmf->pgoff; /* for page_mkclean() */
 
 	vmf->page = page;
 	return 0;
@@ -96,7 +149,11 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	struct page *page = vmf->page;
 	struct fb_info *info = vmf->vma->vm_private_data;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
-	struct list_head *pos = &fbdefio->pagelist;
+	struct fb_deferred_io_pageref *pageref;
+	unsigned long offset;
+	vm_fault_t ret;
+
+	offset = (vmf->address - vmf->vma->vm_start);
 
 	/* this is a callback we get when userspace first tries to
 	write to the page. we schedule a workqueue. that workqueue
@@ -113,6 +170,12 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
 		fbdefio->first_io(info);
 
+	pageref = fb_deferred_io_pageref_get(info, offset, page);
+	if (WARN_ON_ONCE(!pageref)) {
+		ret = VM_FAULT_OOM;
+		goto err_mutex_unlock;
+	}
+
 	/*
 	 * We want the page to remain locked from ->page_mkwrite until
 	 * the PTE is marked dirty to avoid page_mkclean() being called
@@ -121,47 +184,17 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	 * Do this by locking the page here and informing the caller
 	 * about it with VM_FAULT_LOCKED.
 	 */
-	lock_page(page);
-
-	/*
-	 * This check is to catch the case where a new process could start
-	 * writing to the same page through a new PTE. This new access
-	 * can cause a call to .page_mkwrite even if the original process'
-	 * PTE is marked writable.
-	 *
-	 * TODO: The lru field is owned by the page cache; hence the name.
-	 *       We dequeue in fb_deferred_io_work() after flushing the
-	 *       page's content into video memory. Instead of lru, fbdefio
-	 *       should have it's own field.
-	 */
-	if (!list_empty(&page->lru))
-		goto page_already_added;
-
-	if (unlikely(fbdefio->sort_pagelist)) {
-		/*
-		 * We loop through the pagelist before adding in order to
-		 * keep the pagelist sorted. This has significant overhead
-		 * of O(n^2) with n being the number of written pages. If
-		 * possible, drivers should try to work with unsorted page
-		 * lists instead.
-		 */
-		struct page *cur;
-
-		list_for_each_entry(cur, &fbdefio->pagelist, lru) {
-			if (cur->index > page->index)
-				break;
-		}
-		pos = &cur->lru;
-	}
-
-	list_add_tail(&page->lru, pos);
+	lock_page(pageref->page);
 
-page_already_added:
 	mutex_unlock(&fbdefio->lock);
 
 	/* come back after delay to process the deferred IO */
 	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
 	return VM_FAULT_LOCKED;
+
+err_mutex_unlock:
+	mutex_unlock(&fbdefio->lock);
+	return ret;
 }
 
 static const struct vm_operations_struct fb_deferred_io_vm_ops = {
@@ -194,15 +227,14 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_mmap);
 /* workqueue callback */
 static void fb_deferred_io_work(struct work_struct *work)
 {
-	struct fb_info *info = container_of(work, struct fb_info,
-						deferred_work.work);
-	struct list_head *node, *next;
-	struct page *cur;
+	struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
+	struct fb_deferred_io_pageref *pageref, *next;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
 	/* here we mkclean the pages, then do all deferred IO */
 	mutex_lock(&fbdefio->lock);
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+		struct page *cur = pageref->page;
 		lock_page(cur);
 		page_mkclean(cur);
 		unlock_page(cur);
@@ -212,22 +244,48 @@ static void fb_deferred_io_work(struct work_struct *work)
 	fbdefio->deferred_io(info, &fbdefio->pagelist);
 
 	/* clear the list */
-	list_for_each_safe(node, next, &fbdefio->pagelist) {
-		list_del_init(node);
-	}
+	list_for_each_entry_safe(pageref, next, &fbdefio->pagelist, list)
+		fb_deferred_io_pageref_put(pageref, info);
+
 	mutex_unlock(&fbdefio->lock);
 }
 
-void fb_deferred_io_init(struct fb_info *info)
+int fb_deferred_io_init(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
+	struct fb_deferred_io_pageref *pagerefs;
+	unsigned long npagerefs, i;
+	int ret;
 
 	BUG_ON(!fbdefio);
+
+	if (WARN_ON(!info->fix.smem_len))
+		return -EINVAL;
+
 	mutex_init(&fbdefio->lock);
 	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
 	INIT_LIST_HEAD(&fbdefio->pagelist);
 	if (fbdefio->delay == 0) /* set a default of 1 s */
 		fbdefio->delay = HZ;
+
+	npagerefs = DIV_ROUND_UP(info->fix.smem_len, PAGE_SIZE);
+
+	/* alloc a page ref for each page of the display memory */
+	pagerefs = kvcalloc(npagerefs, sizeof(*pagerefs), GFP_KERNEL);
+	if (!pagerefs) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	for (i = 0; i < npagerefs; ++i)
+		INIT_LIST_HEAD(&pagerefs[i].list);
+	info->npagerefs = npagerefs;
+	info->pagerefs = pagerefs;
+
+	return 0;
+
+err:
+	mutex_destroy(&fbdefio->lock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_init);
 
@@ -254,6 +312,7 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 		page->mapping = NULL;
 	}
 
+	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index d7f6abf827b9..51eb57ea68f7 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -424,7 +424,7 @@ static void synthvid_deferred_io(struct fb_info *p,
 				 struct list_head *pagelist)
 {
 	struct hvfb_par *par = p->par;
-	struct page *page;
+	struct fb_deferred_io_pageref *pageref;
 	unsigned long start, end;
 	int y1, y2, miny, maxy;
 
@@ -437,7 +437,8 @@ static void synthvid_deferred_io(struct fb_info *p,
 	 * in synthvid_update function by clamping the y2
 	 * value to yres.
 	 */
-	list_for_each_entry(page, pagelist, lru) {
+	list_for_each_entry(pageref, pagelist, list) {
+		struct page *page = pageref->page;
 		start = page->index << PAGE_SHIFT;
 		end = start + PAGE_SIZE - 1;
 		y1 = start / p->fix.line_length;
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 2541f2fe065b..8352fa3f4cef 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -469,12 +469,13 @@ static void metronomefb_dpy_deferred_io(struct fb_info *info,
 				struct list_head *pagelist)
 {
 	u16 cksum;
-	struct page *cur;
+	struct fb_deferred_io_pageref *pageref;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct metronomefb_par *par = info->par;
 
 	/* walk the written page list and swizzle the data */
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+		struct page *cur = pageref->page;
 		cksum = metronomefb_dpy_update_page(par,
 					(cur->index << PAGE_SHIFT));
 		par->metromem_img_csum -= par->csum_table[cur->index];
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 1dc5079e4518..7fcc85352033 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -440,13 +440,15 @@ static int sh_mobile_lcdc_sginit(struct fb_info *info,
 {
 	struct sh_mobile_lcdc_chan *ch = info->par;
 	unsigned int nr_pages_max = ch->fb_size >> PAGE_SHIFT;
-	struct page *page;
+	struct fb_deferred_io_pageref *pageref;
 	int nr_pages = 0;
 
 	sg_init_table(ch->sglist, nr_pages_max);
 
-	list_for_each_entry(page, pagelist, lru)
+	list_for_each_entry(pageref, pagelist, list) {
+		struct page *page = pageref->page;
 		sg_set_page(&ch->sglist[nr_pages++], page, PAGE_SIZE, 0);
+	}
 
 	return nr_pages;
 }
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 10eb56feff0a..cabc3d03897c 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -958,7 +958,7 @@ static void ufx_ops_fillrect(struct fb_info *info,
 static void ufx_dpy_deferred_io(struct fb_info *info,
 				struct list_head *pagelist)
 {
-	struct page *cur;
+	struct fb_deferred_io_pageref *pageref;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct ufx_data *dev = info->par;
 
@@ -969,9 +969,10 @@ static void ufx_dpy_deferred_io(struct fb_info *info,
 		return;
 
 	/* walk the written page list and render each to device */
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
 		/* create a rectangle of full screen width that encloses the
 		 * entire dirty framebuffer page */
+		struct page *cur = pageref->page;
 		const int x = 0;
 		const int width = dev->info->var.xres;
 		const int y = (cur->index << PAGE_SHIFT) / (width * 2);
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index d7f02b935eb2..2d971c45bd93 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -784,7 +784,7 @@ static void dlfb_ops_fillrect(struct fb_info *info,
 static void dlfb_dpy_deferred_io(struct fb_info *info,
 				struct list_head *pagelist)
 {
-	struct page *cur;
+	struct fb_deferred_io_pageref *pageref;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct dlfb_data *dlfb = info->par;
 	struct urb *urb;
@@ -811,7 +811,8 @@ static void dlfb_dpy_deferred_io(struct fb_info *info,
 	cmd = urb->transfer_buffer;
 
 	/* walk the written page list and render each to device */
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
+		struct page *cur = pageref->page;
 
 		if (dlfb_render_hline(dlfb, &urb, (char *) info->fix.smem_start,
 				  &cmd, cur->index << PAGE_SHIFT,
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 6c8846eba2fb..608fcde767d3 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -185,13 +185,14 @@ static void xenfb_deferred_io(struct fb_info *fb_info,
 			      struct list_head *pagelist)
 {
 	struct xenfb_info *info = fb_info->par;
-	struct page *page;
+	struct fb_deferred_io_pageref *pageref;
 	unsigned long beg, end;
 	int y1, y2, miny, maxy;
 
 	miny = INT_MAX;
 	maxy = 0;
-	list_for_each_entry(page, pagelist, lru) {
+	list_for_each_entry(pageref, pagelist, list) {
+		struct page *page = pageref->page;
 		beg = page->index << PAGE_SHIFT;
 		end = beg + PAGE_SIZE - 1;
 		y1 = beg / fb_info->fix.line_length;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 9a77ab615c36..768de6534a82 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -201,6 +201,13 @@ struct fb_pixmap {
 };
 
 #ifdef CONFIG_FB_DEFERRED_IO
+struct fb_deferred_io_pageref {
+	struct page *page;
+	unsigned long offset;
+	/* private */
+	struct list_head list;
+};
+
 struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
 	unsigned long delay;
@@ -469,6 +476,8 @@ struct fb_info {
 #endif
 #ifdef CONFIG_FB_DEFERRED_IO
 	struct delayed_work deferred_work;
+	unsigned long npagerefs;
+	struct fb_deferred_io_pageref *pagerefs;
 	struct fb_deferred_io *fbdefio;
 #endif
 
@@ -662,7 +671,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 
 /* drivers/video/fb_defio.c */
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
-extern void fb_deferred_io_init(struct fb_info *info);
+extern int  fb_deferred_io_init(struct fb_info *info);
 extern void fb_deferred_io_open(struct fb_info *info,
 				struct inode *inode,
 				struct file *file);
-- 
2.35.1

