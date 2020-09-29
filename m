Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B798E27D278
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D216E20A;
	Tue, 29 Sep 2020 15:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531B86E243;
 Tue, 29 Sep 2020 15:14:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9C44B276;
 Tue, 29 Sep 2020 15:14:45 +0000 (UTC)
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
Subject: [PATCH v3 6/7] drm/fb_helper: Support framebuffers in I/O memory
Date: Tue, 29 Sep 2020 17:14:36 +0200
Message-Id: <20200929151437.19717-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929151437.19717-1-tzimmermann@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
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
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least sparc64 requires I/O-specific access to framebuffers. This
patch updates the fbdev console accordingly.

For drivers with direct access to the framebuffer memory, the callback
functions in struct fb_ops test for the type of memory and call the rsp
fb_sys_ of fb_cfb_ functions.

For drivers that employ a shadow buffer, fbdev's blit function retrieves
the framebuffer address as struct dma_buf_map, and uses dma_buf_map
interfaces to access the buffer.

The bochs driver on sparc64 uses a workaround to flag the framebuffer as
I/O memory and avoid a HW exception. With the introduction of struct
dma_buf_map, this is not required any longer. The patch removes the rsp
code from both, bochs and fbdev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bochs/bochs_kms.c |   1 -
 drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++--
 include/drm/drm_mode_config.h     |  12 --
 include/linux/dma-buf-map.h       |  72 ++++++++--
 4 files changed, 265 insertions(+), 37 deletions(-)

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
index 343a292f2c7c..f345a314a437 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -388,24 +388,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
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
 
@@ -433,8 +431,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
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
@@ -771,6 +770,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
+static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+				      size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *dst;
+	u8 __iomem *src;
+	int c, err = 0;
+	unsigned long total_size;
+	unsigned long alloc_size;
+	ssize_t ret = 0;
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
+		ret += c;
+		count -= c;
+	}
+
+	kfree(dst);
+
+	if (err)
+		return err;
+
+	return ret;
+}
+
+static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *src;
+	u8 __iomem *dst;
+	int c, err = 0;
+	unsigned long total_size;
+	unsigned long alloc_size;
+	ssize_t ret = 0;
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
+		ret += c;
+		count -= c;
+	}
+
+	kfree(src);
+
+	if (err)
+		return err;
+
+	return ret;
+}
+
 /**
  * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
  * @info: fbdev registered by the helper
@@ -2043,6 +2172,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		return -ENODEV;
 }
 
+static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
+		return drm_fb_helper_sys_read(info, buf, count, ppos);
+	else
+		return drm_fb_helper_cfb_read(info, buf, count, ppos);
+}
+
+static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
+		return drm_fb_helper_sys_write(info, buf, count, ppos);
+	else
+		return drm_fb_helper_cfb_write(info, buf, count, ppos);
+}
+
+static void drm_fbdev_fb_fillrect(struct fb_info *info,
+				  const struct fb_fillrect *rect)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
+		drm_fb_helper_sys_fillrect(info, rect);
+	else
+		drm_fb_helper_cfb_fillrect(info, rect);
+}
+
+static void drm_fbdev_fb_copyarea(struct fb_info *info,
+				  const struct fb_copyarea *area)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
+		drm_fb_helper_sys_copyarea(info, area);
+	else
+		drm_fb_helper_cfb_copyarea(info, area);
+}
+
+static void drm_fbdev_fb_imageblit(struct fb_info *info,
+				   const struct fb_image *image)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+
+	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
+		drm_fb_helper_sys_imageblit(info, image);
+	else
+		drm_fb_helper_cfb_imageblit(info, image);
+}
+
 static const struct fb_ops drm_fbdev_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -2050,11 +2239,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
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
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 2e8bbecb5091..6ca0f304dda2 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -32,6 +32,14 @@
  * accessing the buffer. Use the returned instance and the helper functions
  * to access the buffer's memory in the correct way.
  *
+ * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
+ * actually independent from the dma-buf infrastructure. When sharing buffers
+ * among devices, drivers have to know the location of the memory to access
+ * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
+ * solves this problem for dma-buf and its users. If other drivers or
+ * sub-systems require similar functionality, the type could be generalized
+ * and moved to a more prominent header file.
+ *
  * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
  * considered bad style. Rather then accessing its fields directly, use one
  * of the provided helper functions, or implement your own. For example,
@@ -51,6 +59,14 @@
  *
  *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
  *
+ * Instances of struct dma_buf_map do not have to be cleaned up, but
+ * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
+ * always refer to system memory.
+ *
+ * .. code-block:: c
+ *
+ *	dma_buf_map_clear(&map);
+ *
  * Test if a mapping is valid with either dma_buf_map_is_set() or
  * dma_buf_map_is_null().
  *
@@ -73,17 +89,19 @@
  *	if (dma_buf_map_is_equal(&sys_map, &io_map))
  *		// always false
  *
- * Instances of struct dma_buf_map do not have to be cleaned up, but
- * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
- * always refer to system memory.
+ * A set up instance of struct dma_buf_map can be used to access or manipulate
+ * the buffer memory. Depending on the location of the memory, the provided
+ * helpers will pick the correct operations. Data can be copied into the memory
+ * with dma_buf_map_memcpy_to(). The address can be manipulated with
+ * dma_buf_map_incr().
  *
- * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
- * actually independent from the dma-buf infrastructure. When sharing buffers
- * among devices, drivers have to know the location of the memory to access
- * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
- * solves this problem for dma-buf and its users. If other drivers or
- * sub-systems require similar functionality, the type could be generalized
- * and moved to a more prominent header file.
+ * .. code-block:: c
+ *
+ *	const void *src = ...; // source buffer
+ *	size_t len = ...; // length of src
+ *
+ *	dma_buf_map_memcpy_to(&map, src, len);
+ *	dma_buf_map_incr(&map, len); // go to first byte after the memcpy
  */
 
 /**
@@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
 	}
 }
 
+/**
+ * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
+ * @dst:	The dma-buf mapping structure
+ * @src:	The source buffer
+ * @len:	The number of byte in src
+ *
+ * Copies data into a dma-buf mapping. The source buffer is in system
+ * memory. Depending on the buffer's location, the helper picks the correct
+ * method of accessing the memory.
+ */
+static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
+{
+	if (dst->is_iomem)
+		memcpy_toio(dst->vaddr_iomem, src, len);
+	else
+		memcpy(dst->vaddr, src, len);
+}
+
+/**
+ * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
+ * @map:	The dma-buf mapping structure
+ * @incr:	The number of bytes to increment
+ *
+ * Increments the address stored in a dma-buf mapping. Depending on the
+ * buffer's location, the correct value will be updated.
+ */
+static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
+{
+	if (map->is_iomem)
+		map->vaddr_iomem += incr;
+	else
+		map->vaddr += incr;
+}
+
 #endif /* __DMA_BUF_MAP_H__ */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
