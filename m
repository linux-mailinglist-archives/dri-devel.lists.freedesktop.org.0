Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9523D82C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235726E89A;
	Thu,  6 Aug 2020 08:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E227E6E899
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:52:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE671B621;
 Thu,  6 Aug 2020 08:53:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, emil.l.velikov@gmail.com,
 lyude@redhat.com, noralf@tronnes.org, zou_wei@huawei.com
Subject: [PATCH v2 4/4] drm/fb_helper: Access framebuffer as I/O memory,
 if required
Date: Thu,  6 Aug 2020 10:52:39 +0200
Message-Id: <20200806085239.4606-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200806085239.4606-1-tzimmermann@suse.de>
References: <20200806085239.4606-1-tzimmermann@suse.de>
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

At least sparc64 requires I/O-specific access to framebuffers. This
patch updates the fbdev console accordingly.

For drivers with direct access to the framebuffer memory, the callback
functions test for the type of memory and call the rsp fb_sys_ of fb_cfb_
functions. For drivers that employ a shadow buffer, fbdev's blit function
maps the framebuffer as either I/O or system memory, and uses the correct
memcpy function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bochs/bochs_kms.c |   1 -
 drivers/gpu/drm/drm_fb_helper.c   | 240 +++++++++++++++++++++++++++---
 include/drm/drm_mode_config.h     |  12 --
 3 files changed, 221 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 13d0d04c4457..853081d186d5 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
 	bochs->dev->mode_config.preferred_depth = 24;
 	bochs->dev->mode_config.prefer_shadow = 0;
 	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
-	bochs->dev->mode_config.fbdev_use_iomem = true;
 	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index da24874247e7..a832672e83c5 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -394,18 +394,31 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	unsigned int cpp = fb->format->cpp[0];
 	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
 	void *src = fb_helper->fbdev->screen_buffer + offset;
-	void *dst = fb_helper->buffer->membuf.vaddr + offset;
 	size_t len = (clip->x2 - clip->x1) * cpp;
+	const struct drm_gem_membuf *buf;
 	unsigned int y;
 
-	for (y = clip->y1; y < clip->y2; y++) {
-		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
-			memcpy(dst, src, len);
-		else
+	buf = drm_client_buffer_vmap(fb_helper->buffer);
+	if (IS_ERR(buf))
+		return;
+
+	if (buf->is_iomem) {
+		void __iomem *dst =
+			fb_helper->buffer->membuf.vaddr_iomem + offset;
+
+		for (y = clip->y1; y < clip->y2; y++) {
 			memcpy_toio((void __iomem *)dst, src, len);
+			src += fb->pitches[0];
+			dst += fb->pitches[0];
+		}
+	} else {
+		void *dst = fb_helper->buffer->membuf.vaddr + offset;
 
-		src += fb->pitches[0];
-		dst += fb->pitches[0];
+		for (y = clip->y1; y < clip->y2; y++) {
+			memcpy(dst, src, len);
+			src += fb->pitches[0];
+			dst += fb->pitches[0];
+		}
 	}
 }
 
@@ -416,7 +429,6 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 	struct drm_clip_rect *clip = &helper->dirty_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
-	const struct drm_gem_membuf *buf;
 
 	spin_lock_irqsave(&helper->dirty_lock, flags);
 	clip_copy = *clip;
@@ -428,12 +440,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 	if (clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2) {
 
 		/* Generic fbdev uses a shadow buffer */
-		if (helper->buffer) {
-			buf = drm_client_buffer_vmap(helper->buffer);
-			if (IS_ERR(buf))
-				return;
+		if (helper->buffer)
 			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
-		}
+
 		if (helper->fb->funcs->dirty)
 			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
 						 &clip_copy, 1);
@@ -770,6 +779,134 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
+static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+				      size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *dst;
+	u8 __iomem *src;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size;
+	unsigned long alloc_size;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p >= total_size)
+		return 0;
+
+	if (count >= total_size)
+		count = total_size;
+
+	if (count + p > total_size)
+		count = total_size - p;
+
+	src = (u8 __iomem *)(info->screen_base + p);
+
+	alloc_size = min(count, PAGE_SIZE);
+
+	dst = kmalloc(alloc_size, GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	while (count) {
+		c = min(count, alloc_size);
+
+		memcpy_fromio(dst, src, c);
+		if (copy_to_user(buf, dst, c)) {
+			err = -EFAULT;
+			break;
+		}
+
+		src += c;
+		*ppos += c;
+		buf += c;
+		cnt += c;
+		count -= c;
+	}
+
+	kfree(dst);
+
+	if (err)
+		return err;
+
+	return cnt;
+}
+
+static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *src;
+	u8 __iomem *dst;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size;
+	unsigned long alloc_size;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p > total_size)
+		return -EFBIG;
+
+	if (count > total_size) {
+		err = -EFBIG;
+		count = total_size;
+	}
+
+	if (count + p > total_size) {
+		/*
+		 * The framebuffer is too small. We do the
+		 * copy operation, but return an error code
+		 * afterwards. Taken from fbdev.
+		 */
+		if (!err)
+			err = -ENOSPC;
+		count = total_size - p;
+	}
+
+	alloc_size = min(count, PAGE_SIZE);
+
+	src = kmalloc(alloc_size, GFP_KERNEL);
+	if (!src)
+		return -ENOMEM;
+
+	dst = (u8 __iomem *)(info->screen_base + p);
+
+	while (count) {
+		c = min(count, alloc_size);
+
+		if (copy_from_user(src, buf, c)) {
+			err = -EFAULT;
+			break;
+		}
+		memcpy_toio(dst, src, c);
+
+		dst += c;
+		*ppos += c;
+		buf += c;
+		cnt += c;
+		count -= c;
+	}
+
+	kfree(src);
+
+	if (err)
+		return err;
+
+	return cnt;
+}
+
 /**
  * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
  * @info: fbdev registered by the helper
@@ -2042,6 +2179,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		return -ENODEV;
 }
 
+static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (buffer->membuf.vaddr_iomem)
+		return drm_fb_helper_cfb_read(info, buf, count, ppos);
+	else
+		return drm_fb_helper_sys_read(info, buf, count, ppos);
+}
+
+static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (buffer->membuf.vaddr_iomem)
+		return drm_fb_helper_cfb_write(info, buf, count, ppos);
+	else
+		return drm_fb_helper_sys_write(info, buf, count, ppos);
+}
+
+static void drm_fbdev_fb_fillrect(struct fb_info *info,
+				  const struct fb_fillrect *rect)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (buffer->membuf.vaddr_iomem)
+		drm_fb_helper_cfb_fillrect(info, rect);
+	else
+		drm_fb_helper_sys_fillrect(info, rect);
+}
+
+static void drm_fbdev_fb_copyarea(struct fb_info *info,
+				  const struct fb_copyarea *area)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (buffer->membuf.vaddr_iomem)
+		drm_fb_helper_cfb_copyarea(info, area);
+	else
+		drm_fb_helper_sys_copyarea(info, area);
+}
+
+static void drm_fbdev_fb_imageblit(struct fb_info *info,
+				   const struct fb_image *image)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (buffer->membuf.vaddr_iomem)
+		drm_fb_helper_cfb_imageblit(info, image);
+	else
+		drm_fb_helper_sys_imageblit(info, image);
+}
+
 static const struct fb_ops drm_fbdev_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -2049,11 +2246,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
 	.fb_release	= drm_fbdev_fb_release,
 	.fb_destroy	= drm_fbdev_fb_destroy,
 	.fb_mmap	= drm_fbdev_fb_mmap,
-	.fb_read	= drm_fb_helper_sys_read,
-	.fb_write	= drm_fb_helper_sys_write,
-	.fb_fillrect	= drm_fb_helper_sys_fillrect,
-	.fb_copyarea	= drm_fb_helper_sys_copyarea,
-	.fb_imageblit	= drm_fb_helper_sys_imageblit,
+	.fb_read	= drm_fbdev_fb_read,
+	.fb_write	= drm_fbdev_fb_write,
+	.fb_fillrect	= drm_fbdev_fb_fillrect,
+	.fb_copyarea	= drm_fbdev_fb_copyarea,
+	.fb_imageblit	= drm_fbdev_fb_imageblit,
 };
 
 static struct fb_deferred_io drm_fbdev_defio = {
@@ -2077,6 +2274,8 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	struct fb_info *fbi;
 	u32 format;
 	const struct drm_gem_membuf *membuf;
+	void __iomem *vaddr_iomem;
+	void *vaddr;
 
 	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
 		    sizes->surface_width, sizes->surface_height,
@@ -2115,8 +2314,11 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		membuf = drm_client_buffer_vmap(fb_helper->buffer);
 		if (IS_ERR(membuf))
 			return PTR_ERR(membuf);
+		if (membuf->is_iomem)
+			fbi->screen_buffer = vaddr_iomem;
+		else
+			fbi->screen_buffer = vaddr;
 
-		fbi->screen_buffer = membuf->vaddr;
 		/* Shamelessly leak the physical address to user-space */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index c2d3d71d133c..ffb9852a0638 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -865,18 +865,6 @@ struct drm_mode_config {
 	 */
 	bool prefer_shadow_fbdev;
 
-	/**
-	 * @fbdev_use_iomem:
-	 *
-	 * Set to true if framebuffer reside in iomem.
-	 * When set to true memcpy_toio() is used when copying the framebuffer in
-	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
-	 *
-	 * FIXME: This should be replaced with a per-mapping is_iomem
-	 * flag (like ttm does), and then used everywhere in fbdev code.
-	 */
-	bool fbdev_use_iomem;
-
 	/**
 	 * @quirk_addfb_prefer_xbgr_30bpp:
 	 *
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
