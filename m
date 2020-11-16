Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CEC2B51DC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1552689C3F;
	Mon, 16 Nov 2020 20:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE0F89C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:04:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8926AEAB;
 Mon, 16 Nov 2020 20:04:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com
Subject: [PATCH 04/10] drm/fb-helper: Rename dirty worker to damage worker
Date: Mon, 16 Nov 2020 21:04:31 +0100
Message-Id: <20201116200437.17977-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116200437.17977-1-tzimmermann@suse.de>
References: <20201116200437.17977-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dirty worker handles all damage updates, instead of just calling
the framebuffer's dirty callback. Rename it to damage worker. Also
rename related variables accordingly. No functional changes are made.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 65 +++++++++++++++------------------
 include/drm/drm_fb_helper.h     | 14 +++----
 2 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index bdc6c9382f8c..58db64cdbfa1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -371,9 +371,9 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 	console_unlock();
 }
 
-static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
-					  struct drm_clip_rect *clip,
-					  struct dma_buf_map *dst)
+static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
+					   struct drm_clip_rect *clip,
+					   struct dma_buf_map *dst)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
 	unsigned int cpp = fb->format->cpp[0];
@@ -391,21 +391,21 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	}
 }
 
-static void drm_fb_helper_dirty_work(struct work_struct *work)
+static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
-						    dirty_work);
-	struct drm_clip_rect *clip = &helper->dirty_clip;
+						    damage_work);
+	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
 	struct dma_buf_map map;
 	int ret;
 
-	spin_lock_irqsave(&helper->dirty_lock, flags);
+	spin_lock_irqsave(&helper->damage_lock, flags);
 	clip_copy = *clip;
 	clip->x1 = clip->y1 = ~0;
 	clip->x2 = clip->y2 = 0;
-	spin_unlock_irqrestore(&helper->dirty_lock, flags);
+	spin_unlock_irqrestore(&helper->damage_lock, flags);
 
 	/* call dirty callback only when it has been really touched */
 	if (clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2) {
@@ -415,7 +415,7 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 			ret = drm_client_buffer_vmap(helper->buffer, &map);
 			if (ret)
 				return;
-			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
+			drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
 		}
 
 		if (helper->fb->funcs->dirty)
@@ -440,10 +440,10 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 			   const struct drm_fb_helper_funcs *funcs)
 {
 	INIT_LIST_HEAD(&helper->kernel_fb_list);
-	spin_lock_init(&helper->dirty_lock);
+	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
-	INIT_WORK(&helper->dirty_work, drm_fb_helper_dirty_work);
-	helper->dirty_clip.x1 = helper->dirty_clip.y1 = ~0;
+	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
+	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
 	helper->dev = dev;
@@ -579,7 +579,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 		return;
 
 	cancel_work_sync(&fb_helper->resume_work);
-	cancel_work_sync(&fb_helper->dirty_work);
+	cancel_work_sync(&fb_helper->damage_work);
 
 	info = fb_helper->fbdev;
 	if (info) {
@@ -614,30 +614,30 @@ static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
 	       fb->funcs->dirty;
 }
 
-static void drm_fb_helper_dirty(struct fb_info *info, u32 x, u32 y,
-				u32 width, u32 height)
+static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
+				 u32 width, u32 height)
 {
 	struct drm_fb_helper *helper = info->par;
-	struct drm_clip_rect *clip = &helper->dirty_clip;
+	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
 
 	if (!drm_fbdev_use_shadow_fb(helper))
 		return;
 
-	spin_lock_irqsave(&helper->dirty_lock, flags);
+	spin_lock_irqsave(&helper->damage_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, x);
 	clip->y1 = min_t(u32, clip->y1, y);
 	clip->x2 = max_t(u32, clip->x2, x + width);
 	clip->y2 = max_t(u32, clip->y2, y + height);
-	spin_unlock_irqrestore(&helper->dirty_lock, flags);
+	spin_unlock_irqrestore(&helper->damage_lock, flags);
 
-	schedule_work(&helper->dirty_work);
+	schedule_work(&helper->damage_work);
 }
 
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
- * @pagelist: list of dirty mmap framebuffer pages
+ * @pagelist: list of mmap framebuffer pages that have to be flushed
  *
  * This function is used as the &fb_deferred_io.deferred_io
  * callback function for flushing the fbdev mmap writes.
@@ -662,7 +662,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 		y1 = min / info->fix.line_length;
 		y2 = min_t(u32, DIV_ROUND_UP(max, info->fix.line_length),
 			   info->var.yres);
-		drm_fb_helper_dirty(info, 0, y1, info->var.xres, y2 - y1);
+		drm_fb_helper_damage(info, 0, y1, info->var.xres, y2 - y1);
 	}
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
@@ -699,8 +699,7 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 
 	ret = fb_sys_write(info, buf, count, ppos);
 	if (ret > 0)
-		drm_fb_helper_dirty(info, 0, 0, info->var.xres,
-				    info->var.yres);
+		drm_fb_helper_damage(info, 0, 0, info->var.xres, info->var.yres);
 
 	return ret;
 }
@@ -717,8 +716,7 @@ void drm_fb_helper_sys_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
 	sys_fillrect(info, rect);
-	drm_fb_helper_dirty(info, rect->dx, rect->dy,
-			    rect->width, rect->height);
+	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 
@@ -733,8 +731,7 @@ void drm_fb_helper_sys_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
 	sys_copyarea(info, area);
-	drm_fb_helper_dirty(info, area->dx, area->dy,
-			    area->width, area->height);
+	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 
@@ -749,8 +746,7 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
 	sys_imageblit(info, image);
-	drm_fb_helper_dirty(info, image->dx, image->dy,
-			    image->width, image->height);
+	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
@@ -765,8 +761,7 @@ void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
 	cfb_fillrect(info, rect);
-	drm_fb_helper_dirty(info, rect->dx, rect->dy,
-			    rect->width, rect->height);
+	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 
@@ -781,8 +776,7 @@ void drm_fb_helper_cfb_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
 	cfb_copyarea(info, area);
-	drm_fb_helper_dirty(info, area->dx, area->dy,
-			    area->width, area->height);
+	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 
@@ -797,8 +791,7 @@ void drm_fb_helper_cfb_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
 	cfb_imageblit(info, image);
-	drm_fb_helper_dirty(info, image->dx, image->dy,
-			    image->width, image->height);
+	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
 
@@ -2195,7 +2188,7 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 		*ppos += ret;
 
 	if (ret > 0)
-		drm_fb_helper_dirty(info, 0, 0, info->var.xres, info->var.yres);
+		drm_fb_helper_damage(info, 0, 0, info->var.xres, info->var.yres);
 
 	return ret ? ret : err;
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 306aa3a60be9..3b273f9ca39a 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -100,10 +100,10 @@ struct drm_fb_helper_funcs {
  * @funcs: driver callbacks for fb helper
  * @fbdev: emulated fbdev device info struct
  * @pseudo_palette: fake palette of 16 colors
- * @dirty_clip: clip rectangle used with deferred_io to accumulate damage to
- *              the screen buffer
- * @dirty_lock: spinlock protecting @dirty_clip
- * @dirty_work: worker used to flush the framebuffer
+ * @damage_clip: clip rectangle used with deferred_io to accumulate damage to
+ *                the screen buffer
+ * @damage_lock: spinlock protecting @damage_clip
+ * @damage_work: worker used to flush the framebuffer
  * @resume_work: worker used during resume if the console lock is already taken
  *
  * This is the main structure used by the fbdev helpers. Drivers supporting
@@ -131,9 +131,9 @@ struct drm_fb_helper {
 	const struct drm_fb_helper_funcs *funcs;
 	struct fb_info *fbdev;
 	u32 pseudo_palette[17];
-	struct drm_clip_rect dirty_clip;
-	spinlock_t dirty_lock;
-	struct work_struct dirty_work;
+	struct drm_clip_rect damage_clip;
+	spinlock_t damage_lock;
+	struct work_struct damage_work;
 	struct work_struct resume_work;
 
 	/**
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
