Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC1960A156
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8D10E515;
	Mon, 24 Oct 2022 11:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9625610E399;
 Mon, 24 Oct 2022 11:20:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C77922168;
 Mon, 24 Oct 2022 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666610407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w964RYRLg+qwnS/g6KVEEcEwa/6mstU5PwBtTCJBPk8=;
 b=zTrP7NDVJUQ0MdUMGFAU2nz8/UPcAsrFx6r4+K5C+zW28q8W0cy+c6EbqBMHAkSX0FMYZQ
 pM9uFmNGTzr2AZzEy7yJvmTVlEjETGIxmhjjKXtKQIz8pswHVBE6WkBfHJusPsGj+L3gpa
 BLLxoe/q3QCyevKvxgQc5OuyEoFIGjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666610407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w964RYRLg+qwnS/g6KVEEcEwa/6mstU5PwBtTCJBPk8=;
 b=jHzgZhQ3P33R3No3y1jsyQCfALIvmkXfFKe9/YojJYrYukG7p6CQ6isywIZMj6FaW2zvyL
 65qQ+fT8fnD+O6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9AC913357;
 Mon, 24 Oct 2022 11:20:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cKFYLOZ0VmOYMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the same
 implementation
Date: Mon, 24 Oct 2022 13:19:49 +0200
Message-Id: <20221024111953.24307-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the fbdev's read/write helpers with the same functions. Use
the generic fbdev's code as template. Convert all drivers.

DRM's fb helpers must implement regular I/O functionality in struct
fb_ops and possibly perform a damage update. Handle all this in the
same functions and convert drivers. The functionality has been used
as part of the generic fbdev code for some time. The drivers don't
set struct drm_fb_helper.fb_dirty, so they will not be affected by
damage handling.

For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
drm_fb_helper_cfb_write(). Several drivers require these. Until now
tegra used I/O read and write, although the memory buffer appears to
be in system memory. So use _sys_ helpers now.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_fbdev.c      |   2 +
 drivers/gpu/drm/drm_fb_helper.c            | 383 ++++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   2 +
 drivers/gpu/drm/gma500/framebuffer.c       |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c |   2 +
 drivers/gpu/drm/radeon/radeon_fb.c         |   2 +
 drivers/gpu/drm/tegra/fb.c                 |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c         |   3 +
 include/drm/drm_fb_helper.h                |  17 +
 9 files changed, 257 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index f02f6a5ba8320..584cee123bd8e 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -19,6 +19,8 @@
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_read	= drm_fb_helper_cfb_read,
+	.fb_write	= drm_fb_helper_cfb_write,
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
 	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
 	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 379e0d2f67198..836523aef6a27 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -747,30 +747,132 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
+typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
+					     size_t count, loff_t pos);
+
+static ssize_t __drm_fb_helper_read(struct fb_info *info, char __user *buf, size_t count,
+				    loff_t *ppos, drm_fb_helper_read_screen read_screen)
+{
+	loff_t pos = *ppos;
+	size_t total_size;
+	ssize_t ret;
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
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	ret = read_screen(info, buf, count, pos);
+	if (ret > 0)
+		*ppos += ret;
+
+	return ret;
+}
+
+typedef ssize_t (*drm_fb_helper_write_screen)(struct fb_info *info, const char __user *buf,
+					      size_t count, loff_t pos);
+
+static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
+				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
+{
+	loff_t pos = *ppos;
+	size_t total_size;
+	ssize_t ret;
+	int err = 0;
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
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	/*
+	 * Copy to framebuffer even if we already logged an error. Emulates
+	 * the behavior of the original fbdev implementation.
+	 */
+	ret = write_screen(info, buf, count, pos);
+	if (ret < 0)
+		return ret; /* return last error, if any */
+	else if (!ret)
+		return err; /* return previous error, if any */
+
+	*ppos += ret;
+
+	return ret;
+}
+
+static ssize_t drm_fb_helper_read_screen_buffer(struct fb_info *info, char __user *buf,
+						size_t count, loff_t pos)
+{
+	const char *src = info->screen_buffer + pos;
+
+	if (copy_to_user(buf, src, count))
+		return -EFAULT;
+
+	return count;
+}
+
 /**
- * drm_fb_helper_sys_read - wrapper around fb_sys_read
+ * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
  * @info: fb_info struct pointer
  * @buf: userspace buffer to read from framebuffer memory
  * @count: number of bytes to read from framebuffer memory
  * @ppos: read offset within framebuffer memory
  *
- * A wrapper around fb_sys_read implemented by fbdev core
+ * Returns:
+ * The number of read bytes on success, or an error code otherwise.
  */
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	return fb_sys_read(info, buf, count, ppos);
+	return __drm_fb_helper_read(info, buf, count, ppos, drm_fb_helper_read_screen_buffer);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_read);
 
+static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const char __user *buf,
+						 size_t count, loff_t pos)
+{
+	char *dst = info->screen_buffer + pos;
+
+	if (copy_from_user(dst, buf, count))
+		return -EFAULT;
+
+	return count;
+}
+
 /**
- * drm_fb_helper_sys_write - wrapper around fb_sys_write
+ * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
  * @info: fb_info struct pointer
  * @buf: userspace buffer to write to framebuffer memory
  * @count: number of bytes to write to framebuffer memory
  * @ppos: write offset within framebuffer memory
  *
- * A wrapper around fb_sys_write implemented by fbdev core
+ * Returns:
+ * The number of written bytes on success, or an error code otherwise.
  */
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
@@ -779,7 +881,7 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 	ssize_t ret;
 	struct drm_rect damage_area;
 
-	ret = fb_sys_write(info, buf, count, ppos);
+	ret = __drm_fb_helper_write(info, buf, count, ppos, drm_fb_helper_write_screen_buffer);
 	if (ret <= 0)
 		return ret;
 
@@ -837,6 +939,119 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
+static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
+				   loff_t pos)
+{
+	const char __iomem *src = info->screen_base + pos;
+	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
+	ssize_t ret = 0;
+	int err = 0;
+	char *tmp;
+
+	tmp = kmalloc(alloc_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	while (count) {
+		size_t c = min_t(size_t, count, alloc_size);
+
+		memcpy_fromio(tmp, src, c);
+		if (copy_to_user(buf, tmp, c)) {
+			err = -EFAULT;
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
+	return ret ? ret : err;
+}
+
+/**
+ * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
+ * @info: fb_info struct pointer
+ * @buf: userspace buffer to read from framebuffer memory
+ * @count: number of bytes to read from framebuffer memory
+ * @ppos: read offset within framebuffer memory
+ *
+ * Returns:
+ * The number of read bytes on success, or an error code otherwise.
+ */
+ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+			       size_t count, loff_t *ppos)
+{
+	return __drm_fb_helper_read(info, buf, count, ppos, fb_read_screen_base);
+}
+EXPORT_SYMBOL(drm_fb_helper_cfb_read);
+
+static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
+				    loff_t pos)
+{
+	char __iomem *dst = info->screen_base + pos;
+	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
+	ssize_t ret = 0;
+	int err = 0;
+	u8 *tmp;
+
+	tmp = kmalloc(alloc_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	while (count) {
+		size_t c = min_t(size_t, count, alloc_size);
+
+		if (copy_from_user(tmp, buf, c)) {
+			err = -EFAULT;
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
+	return ret ? ret : err;
+}
+
+/**
+ * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
+ * @info: fb_info struct pointer
+ * @buf: userspace buffer to write to framebuffer memory
+ * @count: number of bytes to write to framebuffer memory
+ * @ppos: write offset within framebuffer memory
+ *
+ * Returns:
+ * The number of written bytes on success, or an error code otherwise.
+ */
+ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	loff_t pos = *ppos;
+	ssize_t ret;
+	struct drm_rect damage_area;
+
+	ret = __drm_fb_helper_write(info, buf, count, ppos, fb_write_screen_base);
+	if (ret <= 0)
+		return ret;
+
+	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_fb_helper_cfb_write);
+
 /**
  * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
  * @info: fbdev registered by the helper
@@ -2183,176 +2398,28 @@ static bool drm_fbdev_use_iomem(struct fb_info *info)
 	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
 }
 
-static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
-				   loff_t pos)
-{
-	const char __iomem *src = info->screen_base + pos;
-	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
-	ssize_t ret = 0;
-	int err = 0;
-	char *tmp;
-
-	tmp = kmalloc(alloc_size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	while (count) {
-		size_t c = min_t(size_t, count, alloc_size);
-
-		memcpy_fromio(tmp, src, c);
-		if (copy_to_user(buf, tmp, c)) {
-			err = -EFAULT;
-			break;
-		}
-
-		src += c;
-		buf += c;
-		ret += c;
-		count -= c;
-	}
-
-	kfree(tmp);
-
-	return ret ? ret : err;
-}
-
-static ssize_t fb_read_screen_buffer(struct fb_info *info, char __user *buf, size_t count,
-				     loff_t pos)
-{
-	const char *src = info->screen_buffer + pos;
-
-	if (copy_to_user(buf, src, count))
-		return -EFAULT;
-
-	return count;
-}
-
 static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
 				 size_t count, loff_t *ppos)
 {
-	loff_t pos = *ppos;
-	size_t total_size;
 	ssize_t ret;
 
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
-
-	if (pos >= total_size)
-		return 0;
-	if (count >= total_size)
-		count = total_size;
-	if (total_size - count < pos)
-		count = total_size - pos;
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
 	if (drm_fbdev_use_iomem(info))
-		ret = fb_read_screen_base(info, buf, count, pos);
+		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
 	else
-		ret = fb_read_screen_buffer(info, buf, count, pos);
-
-	if (ret > 0)
-		*ppos += ret;
+		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
 
 	return ret;
 }
 
-static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
-				    loff_t pos)
-{
-	char __iomem *dst = info->screen_base + pos;
-	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
-	ssize_t ret = 0;
-	int err = 0;
-	u8 *tmp;
-
-	tmp = kmalloc(alloc_size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	while (count) {
-		size_t c = min_t(size_t, count, alloc_size);
-
-		if (copy_from_user(tmp, buf, c)) {
-			err = -EFAULT;
-			break;
-		}
-		memcpy_toio(dst, tmp, c);
-
-		dst += c;
-		buf += c;
-		ret += c;
-		count -= c;
-	}
-
-	kfree(tmp);
-
-	return ret ? ret : err;
-}
-
-static ssize_t fb_write_screen_buffer(struct fb_info *info, const char __user *buf, size_t count,
-				      loff_t pos)
-{
-	char *dst = info->screen_buffer + pos;
-
-	if (copy_from_user(dst, buf, count))
-		return -EFAULT;
-
-	return count;
-}
-
 static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 				  size_t count, loff_t *ppos)
 {
-	loff_t pos = *ppos;
-	size_t total_size;
 	ssize_t ret;
-	struct drm_rect damage_area;
-	int err = 0;
 
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
-
-	if (pos > total_size)
-		return -EFBIG;
-	if (count > total_size) {
-		err = -EFBIG;
-		count = total_size;
-	}
-	if (total_size - count < pos) {
-		if (!err)
-			err = -ENOSPC;
-		count = total_size - pos;
-	}
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	/*
-	 * Copy to framebuffer even if we already logged an error. Emulates
-	 * the behavior of the original fbdev implementation.
-	 */
 	if (drm_fbdev_use_iomem(info))
-		ret = fb_write_screen_base(info, buf, count, pos);
+		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
 	else
-		ret = fb_write_screen_buffer(info, buf, count, pos);
-
-	if (ret < 0)
-		return ret; /* return last error, if any */
-	else if (!ret)
-		return err; /* return previous error, if any */
-
-	*ppos += ret;
-
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 86c489d945849..55c92372fca04 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -49,6 +49,8 @@ static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_mmap        = exynos_drm_fb_mmap,
+	.fb_read	= drm_fb_helper_cfb_read,
+	.fb_write	= drm_fb_helper_cfb_write,
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
 	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
 	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 6098d936e44b6..8d5a37b8f1100 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -147,6 +147,8 @@ static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psbfb_setcolreg,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 1b576c859837b..5575d7abdc092 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -124,6 +124,8 @@ static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_set_par = intel_fbdev_set_par,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index f06fed2030a89..c1710ed1cab83 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -80,6 +80,8 @@ static const struct fb_ops radeonfb_ops = {
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = radeonfb_open,
 	.fb_release = radeonfb_release,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 84b7f1dd9fb57..a900300ae5bdc 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -206,6 +206,8 @@ static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static const struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_read = drm_fb_helper_sys_read,
+	.fb_write = drm_fb_helper_sys_write,
 	.fb_fillrect = drm_fb_helper_sys_fillrect,
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 5b85b477e4c69..0f2e3e6e97864 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -29,6 +29,7 @@
 #include <linux/fb.h>
 #include <linux/pci.h>
 
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/ttm/ttm_placement.h>
 
@@ -611,6 +612,8 @@ static int vmw_fb_set_par(struct fb_info *info)
 
 static const struct fb_ops vmw_fb_ops = {
 	.owner = THIS_MODULE,
+	.fb_read = drm_fb_helper_sys_read,
+	.fb_write = drm_fb_helper_sys_write,
 	.fb_check_var = vmw_fb_check_var,
 	.fb_set_par = vmw_fb_set_par,
 	.fb_setcolreg = vmw_fb_setcolreg,
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3d7a3d68dab8a..6581183618b89 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -257,6 +257,11 @@ void drm_fb_helper_sys_copyarea(struct fb_info *info,
 void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image);
 
+ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+			       size_t count, loff_t *ppos);
+ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				size_t count, loff_t *ppos);
+
 void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect);
 void drm_fb_helper_cfb_copyarea(struct fb_info *info,
@@ -402,6 +407,18 @@ static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
 {
 }
 
+static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+					     size_t count, loff_t *ppos)
+{
+	return -ENODEV;
+}
+
+static inline ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+					      size_t count, loff_t *ppos)
+{
+	return -ENODEV;
+}
+
 static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 					      const struct fb_fillrect *rect)
 {
-- 
2.38.0

