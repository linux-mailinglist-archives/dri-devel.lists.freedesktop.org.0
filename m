Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CE231F7A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 15:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F225D6E51A;
	Wed, 29 Jul 2020 13:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8706E514
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 13:41:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 722D0AF9F;
 Wed, 29 Jul 2020 13:42:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 b.zolnierkie@samsung.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@intel.com, peda@axentia.se,
 dan.carpenter@oracle.com, natechancellor@gmail.com
Subject: [PATCH 4/5] drm/fb_helper: Use I/O-memory mappings if available
Date: Wed, 29 Jul 2020 15:41:47 +0200
Message-Id: <20200729134148.6855-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729134148.6855-1-tzimmermann@suse.de>
References: <20200729134148.6855-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least sparc64 requires I/O-specific access to framebuffers. This
patch prepares the fbdev console accordingly.

For drivers with direct access to the framebuffer memory, the callback
functions test for the type of memory and call the rsp fb_sys_ of fb_cfb_
functions. For drivers that employ a shadow buffer, fbdev's blit function
maps the framebuffer as either I/O or system memory, and uses the correct
memcpy function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 132 ++++++++++++++++++++++++++++----
 1 file changed, 116 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 88146f7245c5..7d928f92cba7 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -394,14 +394,25 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	unsigned int cpp = fb->format->cpp[0];
 	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
 	void *src = fb_helper->fbdev->screen_buffer + offset;
-	void *dst = fb_helper->buffer->vaddr + offset;
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y;
 
-	for (y = clip->y1; y < clip->y2; y++) {
-		memcpy(dst, src, len);
-		src += fb->pitches[0];
-		dst += fb->pitches[0];
+	if (fb_helper->buffer->vaddr_iomem) {
+		void __iomem *dst = fb_helper->buffer->vaddr_iomem + offset;
+
+		for (y = clip->y1; y < clip->y2; y++) {
+			memcpy_toio(dst, src, len);
+			src += fb->pitches[0];
+			dst += fb->pitches[0];
+		}
+	} else {
+		void *dst = fb_helper->buffer->vaddr + offset;
+
+		for (y = clip->y1; y < clip->y2; y++) {
+			memcpy(dst, src, len);
+			src += fb->pitches[0];
+			dst += fb->pitches[0];
+		}
 	}
 }
 
@@ -412,6 +423,7 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 	struct drm_clip_rect *clip = &helper->dirty_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
+	void __iomem *vaddr_iomem;
 	void *vaddr;
 
 	spin_lock_irqsave(&helper->dirty_lock, flags);
@@ -425,9 +437,15 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 
 		/* Generic fbdev uses a shadow buffer */
 		if (helper->buffer) {
-			vaddr = drm_client_buffer_vmap(helper->buffer);
-			if (IS_ERR(vaddr))
+			vaddr_iomem =
+				drm_client_buffer_vmap_iomem(helper->buffer);
+			if (IS_ERR(vaddr_iomem)) {
 				return;
+			} else if (!vaddr_iomem) {
+				vaddr = drm_client_buffer_vmap(helper->buffer);
+				if (IS_ERR(vaddr))
+					return;
+			}
 			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
 		}
 		if (helper->fb->funcs->dirty)
@@ -766,6 +784,25 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
+static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+				      size_t count, loff_t *ppos)
+{
+	return fb_cfb_read(info, buf, count, ppos);
+}
+
+static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	ssize_t ret;
+
+	ret = fb_cfb_write(info, buf, count, ppos);
+	if (ret > 0)
+		drm_fb_helper_dirty(info, 0, 0, info->var.xres,
+				    info->var.yres);
+
+	return ret;
+}
+
 /**
  * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
  * @info: fbdev registered by the helper
@@ -2038,6 +2075,61 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		return -ENODEV;
 }
 
+static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (fb_helper->buffer->vaddr_iomem)
+		return drm_fb_helper_cfb_read(info, buf, count, ppos);
+	else
+		return drm_fb_helper_sys_read(info, buf, count, ppos);
+}
+
+static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (fb_helper->buffer->vaddr_iomem)
+		return drm_fb_helper_cfb_write(info, buf, count, ppos);
+	else
+		return drm_fb_helper_sys_write(info, buf, count, ppos);
+}
+
+static void drm_fbdev_fb_fillrect(struct fb_info *info,
+				  const struct fb_fillrect *rect)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (fb_helper->buffer->vaddr_iomem)
+		drm_fb_helper_cfb_fillrect(info, rect);
+	else
+		drm_fb_helper_sys_fillrect(info, rect);
+}
+
+static void drm_fbdev_fb_copyarea(struct fb_info *info,
+				  const struct fb_copyarea *area)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (fb_helper->buffer->vaddr_iomem)
+		drm_fb_helper_cfb_copyarea(info, area);
+	else
+		drm_fb_helper_sys_copyarea(info, area);
+}
+
+static void drm_fbdev_fb_imageblit(struct fb_info *info,
+				   const struct fb_image *image)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (fb_helper->buffer->vaddr_iomem)
+		drm_fb_helper_cfb_imageblit(info, image);
+	else
+		drm_fb_helper_sys_imageblit(info, image);
+}
+
 static const struct fb_ops drm_fbdev_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -2045,11 +2137,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
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
@@ -2072,6 +2164,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	struct drm_framebuffer *fb;
 	struct fb_info *fbi;
 	u32 format;
+	void __iomem *vaddr_iomem;
 	void *vaddr;
 
 	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
@@ -2108,11 +2201,18 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		fb_deferred_io_init(fbi);
 	} else {
 		/* buffer is mapped for HW framebuffer */
-		vaddr = drm_client_buffer_vmap(fb_helper->buffer);
-		if (IS_ERR(vaddr))
-			return PTR_ERR(vaddr);
+		vaddr_iomem = drm_client_buffer_vmap_iomem(fb_helper->buffer);
+		if (IS_ERR(vaddr_iomem)) {
+			return PTR_ERR(vaddr_iomem);
+		} else if (!vaddr_iomem) {
+			vaddr = drm_client_buffer_vmap(fb_helper->buffer);
+			if (IS_ERR(vaddr))
+				return PTR_ERR(vaddr);
+			fbi->screen_buffer = vaddr;
+		} else {
+			fbi->screen_buffer = vaddr_iomem;
+		}
 
-		fbi->screen_buffer = vaddr;
 		/* Shamelessly leak the physical address to user-space */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
