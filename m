Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18929D1EC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 20:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75406E33F;
	Wed, 28 Oct 2020 19:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D830A6E59F;
 Wed, 28 Oct 2020 19:35:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A806B920;
 Wed, 28 Oct 2020 19:35:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v6 10/10] drm/fb_helper: Support framebuffers in I/O memory
Date: Wed, 28 Oct 2020 20:35:21 +0100
Message-Id: <20201028193521.2489-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028193521.2489-1-tzimmermann@suse.de>
References: <20201028193521.2489-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least sparc64 requires I/O-specific access to framebuffers. This
patch updates the fbdev console accordingly.

For drivers with direct access to the framebuffer memory, the callback
functions in struct fb_ops test for the type of memory and call the rsp
fb_sys_ of fb_cfb_ functions. Read and write operations are implemented
internally by DRM's fbdev helper.

For drivers that employ a shadow buffer, fbdev's blit function retrieves
the framebuffer address as struct dma_buf_map, and uses dma_buf_map
interfaces to access the buffer.

The bochs driver on sparc64 uses a workaround to flag the framebuffer as
I/O memory and avoid a HW exception. With the introduction of struct
dma_buf_map, this is not required any longer. The patch removes the rsp
code from both, bochs and fbdev.

v5:
	* implement fb_read/fb_write internally (Daniel, Sam)
v4:
	* move dma_buf_map changes into separate patch (Daniel)
	* TODO list: comment on fbdev updates (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/gpu/todo.rst        |  19 ++-
 drivers/gpu/drm/bochs/bochs_kms.c |   1 -
 drivers/gpu/drm/drm_fb_helper.c   | 227 ++++++++++++++++++++++++++++--
 include/drm/drm_mode_config.h     |  12 --
 4 files changed, 230 insertions(+), 29 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7e6fc3c04add..638b7f704339 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
 ------------------------------------------------
 
 Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
-atomic modesetting and GEM vmap support. Current generic fbdev emulation
-expects the framebuffer in system memory (or system-like memory).
+atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
+expected the framebuffer in system memory or system-like memory. By employing
+struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
+as well.
 
 Contact: Maintainer of the driver you plan to convert
 
 Level: Intermediate
 
+Reimplement functions in drm_fbdev_fb_ops without fbdev
+-------------------------------------------------------
+
+A number of callback functions in drm_fbdev_fb_ops could benefit from
+being rewritten without dependencies on the fbdev module. Some of the
+helpers could further benefit from using struct dma_buf_map instead of
+raw pointers.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
+
+Level: Advanced
+
+
 drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
 -----------------------------------------------------------------
 
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
index 6ce0b9119ef2..714ce3bd6221 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 }
 
 static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
-					  struct drm_clip_rect *clip)
+					  struct drm_clip_rect *clip,
+					  struct dma_buf_map *dst)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
 	unsigned int cpp = fb->format->cpp[0];
 	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
 	void *src = fb_helper->fbdev->screen_buffer + offset;
-	void *dst = fb_helper->buffer->map.vaddr + offset;
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y;
 
-	for (y = clip->y1; y < clip->y2; y++) {
-		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
-			memcpy(dst, src, len);
-		else
-			memcpy_toio((void __iomem *)dst, src, len);
+	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
 
+	for (y = clip->y1; y < clip->y2; y++) {
+		dma_buf_map_memcpy_to(dst, src, len);
+		dma_buf_map_incr(dst, fb->pitches[0]);
 		src += fb->pitches[0];
-		dst += fb->pitches[0];
 	}
 }
 
@@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 			ret = drm_client_buffer_vmap(helper->buffer, &map);
 			if (ret)
 				return;
-			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
+			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
 		}
+
 		if (helper->fb->funcs->dirty)
 			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
 						 &clip_copy, 1);
@@ -2027,6 +2026,206 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		return -ENODEV;
 }
 
+static bool drm_fbdev_use_iomem(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
+}
+
+static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count, 
+				   loff_t pos)
+{
+	const char __iomem *src = info->screen_base + pos;
+	size_t alloc_size = min(count, PAGE_SIZE);
+	ssize_t ret = 0;
+	char *tmp;
+
+	tmp = kmalloc(alloc_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	while (count) {
+		size_t c = min(count, alloc_size);
+
+		memcpy_fromio(tmp, src, c);
+		if (copy_to_user(buf, tmp, c)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		src += c;
+		buf += c;
+		ret += c;
+		count -= c;
+	}
+
+	kfree(tmp);
+
+	return ret;
+}
+
+static ssize_t fb_read_screen_buffer(struct fb_info *info, char __user *buf, size_t count,
+				     loff_t pos)
+{
+	const char *src = info->screen_buffer + pos;
+
+	if (copy_to_user(buf, src, count))
+		return -EFAULT;
+
+	return count;
+}
+
+static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	loff_t pos = *ppos;
+	size_t total_size;
+	ssize_t ret;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	if (info->screen_size)
+		total_size = info->screen_size;
+	else
+		total_size = info->fix.smem_len;
+
+	if (pos >= total_size)
+		return 0;
+	if (count >= total_size)
+		count = total_size;
+	if (total_size - count < pos)
+		count = total_size - pos;
+
+	if (drm_fbdev_use_iomem(info))
+		ret = fb_read_screen_base(info, buf, count, pos);
+	else
+		ret = fb_read_screen_buffer(info, buf, count, pos);
+
+	if (ret > 0)
+		*ppos = ret;
+
+	return ret;
+}
+
+static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
+				    loff_t pos)
+{
+	char __iomem *dst = info->screen_base + pos;
+	size_t alloc_size = min(count, PAGE_SIZE);
+	ssize_t ret = 0;
+	u8 *tmp;
+
+	tmp = kmalloc(alloc_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	while (count) {
+		size_t c = min(count, alloc_size);
+
+		if (copy_from_user(tmp, buf, c)) {
+			ret = -EFAULT;
+			break;
+		}
+		memcpy_toio(dst, tmp, c);
+
+		dst += c;
+		buf += c;
+		ret += c;
+		count -= c;
+	}
+
+	kfree(tmp);
+
+	return ret;
+}
+
+static ssize_t fb_write_screen_buffer(struct fb_info *info, const char __user *buf, size_t count,
+				      loff_t pos)
+{
+	char *dst = info->screen_buffer + pos;
+
+	if (copy_from_user(dst, buf, count))
+		return -EFAULT;
+
+	return count;
+}
+
+static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	loff_t pos = *ppos;
+	size_t total_size;
+	ssize_t ret;
+	int err;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	if (info->screen_size)
+		total_size = info->screen_size;
+	else
+		total_size = info->fix.smem_len;
+
+	if (pos > total_size)
+		return -EFBIG;
+	if (count > total_size) {
+		err = -EFBIG;
+		count = total_size;
+	}
+	if (total_size - count < pos) {
+		if (!err)
+			err = -ENOSPC;
+		count = total_size - pos;
+	}
+
+	/*
+	 * Copy to framebuffer even if we already logged an error. Emulates
+	 * the behavior of the original fbdev implementation.
+	 */
+	if (drm_fbdev_use_iomem(info))
+		ret = fb_write_screen_base(info, buf, count, pos);
+	else
+		ret = fb_write_screen_buffer(info, buf, count, pos);
+
+	if (ret > 0)
+		*ppos = ret;
+
+	if (err)
+		return err;
+
+	return ret;
+}
+
+static void drm_fbdev_fb_fillrect(struct fb_info *info,
+				  const struct fb_fillrect *rect)
+{
+	if (drm_fbdev_use_iomem(info))
+		drm_fb_helper_cfb_fillrect(info, rect);
+	else
+		drm_fb_helper_sys_fillrect(info, rect);
+}
+
+static void drm_fbdev_fb_copyarea(struct fb_info *info,
+				  const struct fb_copyarea *area)
+{
+	if (drm_fbdev_use_iomem(info))
+		drm_fb_helper_cfb_copyarea(info, area);
+	else
+		drm_fb_helper_sys_copyarea(info, area);
+}
+
+static void drm_fbdev_fb_imageblit(struct fb_info *info,
+				   const struct fb_image *image)
+{
+	if (drm_fbdev_use_iomem(info))
+		drm_fb_helper_cfb_imageblit(info, image);
+	else
+		drm_fb_helper_sys_imageblit(info, image);
+}
+
 static const struct fb_ops drm_fbdev_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -2034,11 +2233,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
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
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 5ffbb4ed5b35..ab424ddd7665 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -877,18 +877,6 @@ struct drm_mode_config {
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
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
