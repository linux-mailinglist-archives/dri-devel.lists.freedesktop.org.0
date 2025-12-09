Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A6CB024E
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A97510E5D6;
	Tue,  9 Dec 2025 14:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE8E10E5D4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:01:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 066585BE37;
 Tue,  9 Dec 2025 14:01:52 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A45F73EA65;
 Tue,  9 Dec 2025 14:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AKL1Js4rOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/13] drm: Add GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:00 +0100
Message-ID: <20251209140141.94407-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 066585BE37
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Rspamd-Action: no action
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicate the existing GEM-SHMEM helpers to GEM-UMA; including fbdev
emulation and tests.

The new GEM-UMA helpers provide memory management for DRM drivers with
Unified Memory Architecture (UMA) hardware. Here, the CPU and GPU share
use of the system memory. DRM drivers for such hardware currently often
build upon GEM-SHMEM and extend it with additional GTT/MMU functionality
for the graphics chipset.

GEM-SHMEM also serves the different use case of holding the graphics
buffers entirely in system memory and copying their content on pageflips.
This conflicts with the UMA use case and complicates GEM-SHMEM. The most
prominent example is PRIME buffer import, where GEM-SHMEM currently has
to provide two distinct implementations.

By having a separate GEM memory manager for UMA, both implementations,
SHMEM and UMA, can evolve in different directions with each focusng on
their specific use case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-mm.rst             |  12 +
 drivers/gpu/drm/Kconfig                  |   9 +
 drivers/gpu/drm/Kconfig.debug            |   1 +
 drivers/gpu/drm/Makefile                 |   4 +
 drivers/gpu/drm/drm_fbdev_uma.c          | 203 +++++
 drivers/gpu/drm/drm_gem_uma_helper.c     | 898 +++++++++++++++++++++++
 drivers/gpu/drm/tests/Makefile           |   1 +
 drivers/gpu/drm/tests/drm_gem_uma_test.c | 385 ++++++++++
 include/drm/drm_fbdev_uma.h              |  20 +
 include/drm/drm_gem_uma_helper.h         | 309 ++++++++
 10 files changed, 1842 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_fbdev_uma.c
 create mode 100644 drivers/gpu/drm/drm_gem_uma_helper.c
 create mode 100644 drivers/gpu/drm/tests/drm_gem_uma_test.c
 create mode 100644 include/drm/drm_fbdev_uma.h
 create mode 100644 include/drm/drm_gem_uma_helper.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d55751cad67c..225d9d760227 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -379,6 +379,18 @@ GEM SHMEM Helper Function Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
    :export:
 
+GEM UMA Helper Function Reference
+-----------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gem_uma_helper.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_gem_uma_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_gem_uma_helper.c
+   :export:
+
 GEM VRAM Helper Functions Reference
 -----------------------------------
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7e6bc0b3a589..a35fbd9feccb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -257,6 +257,15 @@ config DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this if you need the GEM shmem helper functions
 
+config DRM_GEM_UMA_HELPER
+	tristate
+	depends on DRM && MMU
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
+	help
+	  Choose this if you need the GEM UMA helper functions
+
 config DRM_SUBALLOC_HELPER
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 05dc43c0b8c5..ec791826fca8 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -68,6 +68,7 @@ config DRM_KUNIT_TEST
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
+	select DRM_GEM_UMA_HELPER
 	select DRM_KUNIT_TEST_HELPERS
 	select DRM_LIB_RANDOM
 	select DRM_SYSFB_HELPER
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 33ff76ae52b2..c227523aa693 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -125,6 +125,10 @@ obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
 drm_suballoc_helper-y := drm_suballoc.o
 obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
 
+drm_uma_helper-y := drm_gem_uma_helper.o
+drm_uma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_uma.o
+obj-$(CONFIG_DRM_GEM_UMA_HELPER) += drm_uma_helper.o
+
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
diff --git a/drivers/gpu/drm/drm_fbdev_uma.c b/drivers/gpu/drm/drm_fbdev_uma.c
new file mode 100644
index 000000000000..76edb7dbc2ca
--- /dev/null
+++ b/drivers/gpu/drm/drm_fbdev_uma.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/export.h>
+#include <linux/fb.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_uma.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_uma_helper.h>
+#include <drm/drm_print.h>
+
+/*
+ * struct fb_ops
+ */
+
+static int drm_fbdev_uma_fb_open(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	/* No need to take a ref for fbcon because it unbinds on unregister */
+	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int drm_fbdev_uma_fb_release(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (user)
+		module_put(fb_helper->dev->driver->fops->owner);
+
+	return 0;
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_uma,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area);
+
+static int drm_fbdev_uma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, 0);
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	if (uma->map_wc)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return fb_deferred_io_mmap(info, vma);
+}
+
+static void drm_fbdev_uma_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (!fb_helper->dev)
+		return;
+
+	fb_deferred_io_cleanup(info);
+	drm_fb_helper_fini(fb_helper);
+
+	drm_client_buffer_vunmap(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
+	drm_client_release(&fb_helper->client);
+}
+
+static const struct fb_ops drm_fbdev_uma_fb_ops = {
+	.owner = THIS_MODULE,
+	.fb_open = drm_fbdev_uma_fb_open,
+	.fb_release = drm_fbdev_uma_fb_release,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_uma),
+	DRM_FB_HELPER_DEFAULT_OPS,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_uma),
+	.fb_mmap = drm_fbdev_uma_fb_mmap,
+	.fb_destroy = drm_fbdev_uma_fb_destroy,
+};
+
+static struct page *drm_fbdev_uma_get_page(struct fb_info *info, unsigned long offset)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, 0);
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+	unsigned int i = offset >> PAGE_SHIFT;
+	struct page *page;
+
+	if (fb_WARN_ON_ONCE(info, offset > obj->size))
+		return NULL;
+
+	page = uma->pages[i]; // protected by active vmap
+	if (page)
+		get_page(page);
+	fb_WARN_ON_ONCE(info, !page);
+
+	return page;
+}
+
+/*
+ * struct drm_fb_helper
+ */
+
+static int drm_fbdev_uma_helper_fb_dirty(struct drm_fb_helper *helper,
+					 struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs drm_fbdev_uma_helper_funcs = {
+	.fb_dirty = drm_fbdev_uma_helper_fb_dirty,
+};
+
+/*
+ * struct drm_driver
+ */
+
+int drm_fbdev_uma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				     struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct fb_info *info = fb_helper->info;
+	struct drm_client_buffer *buffer;
+	struct drm_gem_uma_object *uma;
+	struct drm_framebuffer *fb;
+	u32 format;
+	struct iosys_map map;
+	int ret;
+
+	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		    sizes->surface_width, sizes->surface_height,
+		    sizes->surface_bpp);
+
+	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp, sizes->surface_depth);
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
+					       sizes->surface_height, format);
+	if (IS_ERR(buffer))
+		return PTR_ERR(buffer);
+	uma = to_drm_gem_uma_obj(buffer->gem);
+
+	fb = buffer->fb;
+
+	ret = drm_client_buffer_vmap(buffer, &map);
+	if (ret) {
+		goto err_drm_client_buffer_delete;
+	} else if (drm_WARN_ON(dev, map.is_iomem)) {
+		ret = -ENODEV; /* I/O memory not supported; use generic emulation */
+		goto err_drm_client_buffer_delete;
+	}
+
+	fb_helper->funcs = &drm_fbdev_uma_helper_funcs;
+	fb_helper->buffer = buffer;
+	fb_helper->fb = fb;
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
+
+	info->fbops = &drm_fbdev_uma_fb_ops;
+
+	/* screen */
+	info->flags |= FBINFO_VIRTFB; /* system memory */
+	if (!uma->map_wc)
+		info->flags |= FBINFO_READS_FAST; /* signal caching */
+	info->screen_size = sizes->surface_height * fb->pitches[0];
+	info->screen_buffer = map.vaddr;
+	info->fix.smem_len = info->screen_size;
+
+	/* deferred I/O */
+	fb_helper->fbdefio.delay = HZ / 20;
+	fb_helper->fbdefio.get_page = drm_fbdev_uma_get_page;
+	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	info->fbdefio = &fb_helper->fbdefio;
+	ret = fb_deferred_io_init(info);
+	if (ret)
+		goto err_drm_client_buffer_vunmap;
+
+	return 0;
+
+err_drm_client_buffer_vunmap:
+	fb_helper->fb = NULL;
+	fb_helper->buffer = NULL;
+	drm_client_buffer_vunmap(buffer);
+err_drm_client_buffer_delete:
+	drm_client_buffer_delete(buffer);
+	return ret;
+}
+EXPORT_SYMBOL(drm_fbdev_uma_driver_fbdev_probe);
diff --git a/drivers/gpu/drm/drm_gem_uma_helper.c b/drivers/gpu/drm/drm_gem_uma_helper.c
new file mode 100644
index 000000000000..d617cfd981e1
--- /dev/null
+++ b/drivers/gpu/drm/drm_gem_uma_helper.c
@@ -0,0 +1,898 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2018 Noralf Trønnes
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/shmem_fs.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#ifdef CONFIG_X86
+#include <asm/set_memory.h>
+#endif
+
+#include <drm/drm.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
+#include <drm/drm_gem_uma_helper.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_print.h>
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+/**
+ * DOC: overview
+ *
+ * This library provides helpers for GEM objects on UMA systems. Each
+ * object is backed by shmem buffers allocated using anonymous pageable
+ * memory.
+ *
+ * Functions that operate on the GEM object receive struct &drm_gem_uma_object.
+ * For GEM callback helpers in struct &drm_gem_object functions, see likewise
+ * named functions with an _object_ infix (e.g., drm_gem_uma_object_vmap() wraps
+ * drm_gem_uma_vmap()). These helpers perform the necessary type conversion.
+ */
+
+static const struct drm_gem_object_funcs drm_gem_uma_funcs = {
+	.free = drm_gem_uma_object_free,
+	.print_info = drm_gem_uma_object_print_info,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
+	.vm_ops = &drm_gem_uma_vm_ops,
+};
+
+static int __drm_gem_uma_init(struct drm_device *dev, struct drm_gem_uma_object *uma,
+			      size_t size, bool private, struct vfsmount *gemfs)
+{
+	struct drm_gem_object *obj = &uma->base;
+	int ret = 0;
+
+	if (!obj->funcs)
+		obj->funcs = &drm_gem_uma_funcs;
+
+	if (private) {
+		drm_gem_private_object_init(dev, obj, size);
+		uma->map_wc = false; /* dma-buf mappings use always writecombine */
+	} else {
+		ret = drm_gem_object_init_with_mnt(dev, obj, size, gemfs);
+	}
+	if (ret) {
+		drm_gem_private_object_fini(obj);
+		return ret;
+	}
+
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		goto err_release;
+
+	INIT_LIST_HEAD(&uma->madv_list);
+
+	if (!private) {
+		/*
+		 * Our buffers are kept pinned, so allocating them
+		 * from the MOVABLE zone is a really bad idea, and
+		 * conflicts with CMA. See comments above new_inode()
+		 * why this is required _and_ expected if you're
+		 * going to pin these pages.
+		 */
+		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
+				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	}
+
+	return 0;
+err_release:
+	drm_gem_object_release(obj);
+	return ret;
+}
+
+/**
+ * drm_gem_uma_init - Initialize an allocated object.
+ * @dev: DRM device
+ * @uma: The allocated GEM UMA object.
+ * @size: Buffer size in bytes
+ *
+ * Returns:
+ * 0 on success, or a negative error code on failure.
+ */
+int drm_gem_uma_init(struct drm_device *dev, struct drm_gem_uma_object *uma, size_t size)
+{
+	return __drm_gem_uma_init(dev, uma, size, false, NULL);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_init);
+
+static struct drm_gem_uma_object *
+__drm_gem_uma_create(struct drm_device *dev, size_t size, bool private,
+		     struct vfsmount *gemfs)
+{
+	struct drm_gem_uma_object *uma;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	size = PAGE_ALIGN(size);
+
+	if (dev->driver->gem_create_object) {
+		obj = dev->driver->gem_create_object(dev, size);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+		uma = to_drm_gem_uma_obj(obj);
+	} else {
+		uma = kzalloc(sizeof(*uma), GFP_KERNEL);
+		if (!uma)
+			return ERR_PTR(-ENOMEM);
+		obj = &uma->base;
+	}
+
+	ret = __drm_gem_uma_init(dev, uma, size, private, gemfs);
+	if (ret) {
+		kfree(obj);
+		return ERR_PTR(ret);
+	}
+
+	return uma;
+}
+
+/**
+ * drm_gem_uma_create - Allocate an object with the given size
+ * @dev: DRM device
+ * @size: Size of the object to allocate
+ *
+ * This function creates a GEM UMA object.
+ *
+ * Returns:
+ * A struct drm_gem_uma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_uma_object *drm_gem_uma_create(struct drm_device *dev, size_t size)
+{
+	return __drm_gem_uma_create(dev, size, false, NULL);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_create);
+
+/**
+ * drm_gem_uma_create_with_mnt - Allocate an object with the given size in a
+ * given mountpoint
+ * @dev: DRM device
+ * @size: Size of the object to allocate
+ * @gemfs: tmpfs mount where the GEM object will be created
+ *
+ * This function creates a GEM UMA object in a given tmpfs mountpoint.
+ *
+ * Returns:
+ * A struct drm_gem_uma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_uma_object *drm_gem_uma_create_with_mnt(struct drm_device *dev,
+						       size_t size,
+						       struct vfsmount *gemfs)
+{
+	return __drm_gem_uma_create(dev, size, false, gemfs);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_create_with_mnt);
+
+/**
+ * drm_gem_uma_release - Release resources associated with a GEM UMA object.
+ * @uma: GEM UMA object
+ *
+ * This function cleans up the GEM object state, but does not free the memory used to store the
+ * object itself. This function is meant to be a dedicated helper for the Rust GEM bindings.
+ */
+void drm_gem_uma_release(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+
+	if (drm_gem_is_imported(obj)) {
+		drm_prime_gem_destroy(obj, uma->sgt);
+	} else {
+		dma_resv_lock(uma->base.resv, NULL);
+
+		drm_WARN_ON(obj->dev, refcount_read(&uma->vmap_use_count));
+
+		if (uma->sgt) {
+			dma_unmap_sgtable(obj->dev->dev, uma->sgt,
+					  DMA_BIDIRECTIONAL, 0);
+			sg_free_table(uma->sgt);
+			kfree(uma->sgt);
+		}
+		if (uma->pages)
+			drm_gem_uma_put_pages_locked(uma);
+
+		drm_WARN_ON(obj->dev, refcount_read(&uma->pages_use_count));
+		drm_WARN_ON(obj->dev, refcount_read(&uma->pages_pin_count));
+
+		dma_resv_unlock(uma->base.resv);
+	}
+
+	drm_gem_object_release(obj);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_release);
+
+/**
+ * drm_gem_uma_free - Free resources associated with a GEM UMA object
+ * @uma: GEM UMA object to free
+ *
+ * This function cleans up the GEM object state and frees the memory used to
+ * store the object itself.
+ */
+void drm_gem_uma_free(struct drm_gem_uma_object *uma)
+{
+	drm_gem_uma_release(uma);
+	kfree(uma);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_free);
+
+static int drm_gem_uma_get_pages_locked(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+	struct page **pages;
+
+	dma_resv_assert_held(uma->base.resv);
+
+	if (refcount_inc_not_zero(&uma->pages_use_count))
+		return 0;
+
+	pages = drm_gem_get_pages(obj);
+	if (IS_ERR(pages)) {
+		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
+			    PTR_ERR(pages));
+		return PTR_ERR(pages);
+	}
+
+	/*
+	 * TODO: Allocating WC pages which are correctly flushed is only
+	 * supported on x86. Ideal solution would be a GFP_WC flag, which also
+	 * ttm_pool.c could use.
+	 */
+#ifdef CONFIG_X86
+	if (uma->map_wc)
+		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
+#endif
+
+	uma->pages = pages;
+
+	refcount_set(&uma->pages_use_count, 1);
+
+	return 0;
+}
+
+/*
+ * drm_gem_uma_put_pages_locked - Decrease use count on the backing pages for a GEM UMA object
+ * @uma: GEM UMA object
+ *
+ * This function decreases the use count and puts the backing pages when use drops to zero.
+ */
+void drm_gem_uma_put_pages_locked(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+
+	dma_resv_assert_held(uma->base.resv);
+
+	if (refcount_dec_and_test(&uma->pages_use_count)) {
+#ifdef CONFIG_X86
+		if (uma->map_wc)
+			set_pages_array_wb(uma->pages, obj->size >> PAGE_SHIFT);
+#endif
+
+		drm_gem_put_pages(obj, uma->pages,
+				  uma->pages_mark_dirty_on_put,
+				  uma->pages_mark_accessed_on_put);
+		uma->pages = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_put_pages_locked);
+
+int drm_gem_uma_pin_locked(struct drm_gem_uma_object *uma)
+{
+	int ret;
+
+	dma_resv_assert_held(uma->base.resv);
+
+	drm_WARN_ON(uma->base.dev, drm_gem_is_imported(&uma->base));
+
+	if (refcount_inc_not_zero(&uma->pages_pin_count))
+		return 0;
+
+	ret = drm_gem_uma_get_pages_locked(uma);
+	if (!ret)
+		refcount_set(&uma->pages_pin_count, 1);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_uma_pin_locked);
+
+void drm_gem_uma_unpin_locked(struct drm_gem_uma_object *uma)
+{
+	dma_resv_assert_held(uma->base.resv);
+
+	if (refcount_dec_and_test(&uma->pages_pin_count))
+		drm_gem_uma_put_pages_locked(uma);
+}
+EXPORT_SYMBOL(drm_gem_uma_unpin_locked);
+
+/**
+ * drm_gem_uma_pin - Pin backing pages for a GEM UMA object
+ * @uma: GEM UMA object
+ *
+ * This function makes sure the backing pages are pinned in memory while the
+ * buffer is exported.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_uma_pin(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+	int ret;
+
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
+
+	if (refcount_inc_not_zero(&uma->pages_pin_count))
+		return 0;
+
+	ret = dma_resv_lock_interruptible(uma->base.resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_uma_pin_locked(uma);
+	dma_resv_unlock(uma->base.resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_pin);
+
+/**
+ * drm_gem_uma_unpin - Unpin backing pages for a GEM UMA object
+ * @uma: GEM uma object
+ *
+ * This function removes the requirement that the backing pages are pinned in
+ * memory.
+ */
+void drm_gem_uma_unpin(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
+
+	if (refcount_dec_not_one(&uma->pages_pin_count))
+		return;
+
+	dma_resv_lock(uma->base.resv, NULL);
+	drm_gem_uma_unpin_locked(uma);
+	dma_resv_unlock(uma->base.resv);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_unpin);
+
+/*
+ * drm_gem_uma_vmap_locked - Create a virtual mapping for a GEM UMA object
+ * @uma: GEM UMA object
+ * @map: Returns the kernel virtual address of the GEM-UMA object's backing
+ *       store.
+ *
+ * This function makes sure that a contiguous kernel virtual address mapping
+ * exists for the buffer backing the GEM UMA object. It hides the differences
+ * between dma-buf imported and natively allocated objects.
+ *
+ * Acquired mappings should be cleaned up by calling drm_gem_uma_vunmap_locked().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_uma_vmap_locked(struct drm_gem_uma_object *uma, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = &uma->base;
+	int ret = 0;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (drm_gem_is_imported(obj)) {
+		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
+	} else {
+		pgprot_t prot = PAGE_KERNEL;
+
+		dma_resv_assert_held(uma->base.resv);
+
+		if (refcount_inc_not_zero(&uma->vmap_use_count)) {
+			iosys_map_set_vaddr(map, uma->vaddr);
+			return 0;
+		}
+
+		ret = drm_gem_uma_pin_locked(uma);
+		if (ret)
+			return ret;
+
+		if (uma->map_wc)
+			prot = pgprot_writecombine(prot);
+		uma->vaddr = vmap(uma->pages, obj->size >> PAGE_SHIFT, VM_MAP, prot);
+		if (!uma->vaddr) {
+			ret = -ENOMEM;
+		} else {
+			iosys_map_set_vaddr(map, uma->vaddr);
+			refcount_set(&uma->vmap_use_count, 1);
+		}
+	}
+
+	if (ret) {
+		drm_dbg_kms(obj->dev, "Failed to vmap pages, error %d\n", ret);
+		goto err_put_pages;
+	}
+
+	return 0;
+
+err_put_pages:
+	if (!drm_gem_is_imported(obj))
+		drm_gem_uma_unpin_locked(uma);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_vmap_locked);
+
+/*
+ * drm_gem_uma_vunmap_locked - Unmap a virtual mapping for a GEM UMA object
+ * @uma: GEM UMA object
+ * @map: Kernel virtual address where the GEM-UMA object was mapped
+ *
+ * This function cleans up a kernel virtual address mapping acquired by
+ * drm_gem_uma_vmap_locked(). The mapping is only removed when the use count
+ * drops to zero.
+ *
+ * This function hides the differences between dma-buf imported and natively
+ * allocated objects.
+ */
+void drm_gem_uma_vunmap_locked(struct drm_gem_uma_object *uma, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = &uma->base;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (drm_gem_is_imported(obj)) {
+		dma_buf_vunmap(obj->import_attach->dmabuf, map);
+	} else {
+		dma_resv_assert_held(uma->base.resv);
+
+		if (refcount_dec_and_test(&uma->vmap_use_count)) {
+			vunmap(uma->vaddr);
+			uma->vaddr = NULL;
+
+			drm_gem_uma_unpin_locked(uma);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_vunmap_locked);
+
+static int
+drm_gem_uma_create_with_handle(struct drm_file *file_priv,
+			       struct drm_device *dev, size_t size,
+			       uint32_t *handle)
+{
+	struct drm_gem_uma_object *uma;
+	int ret;
+
+	uma = drm_gem_uma_create(dev, size);
+	if (IS_ERR(uma))
+		return PTR_ERR(uma);
+
+	/*
+	 * Allocate an id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file_priv, &uma->base, handle);
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&uma->base);
+
+	return ret;
+}
+
+/* Update madvise status, returns true if not purged, else
+ * false or -errno.
+ */
+int drm_gem_uma_madvise_locked(struct drm_gem_uma_object *uma, int madv)
+{
+	dma_resv_assert_held(uma->base.resv);
+
+	if (uma->madv >= 0)
+		uma->madv = madv;
+
+	madv = uma->madv;
+
+	return (madv >= 0);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_madvise_locked);
+
+void drm_gem_uma_purge_locked(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+	struct drm_device *dev = obj->dev;
+
+	dma_resv_assert_held(uma->base.resv);
+
+	drm_WARN_ON(obj->dev, !drm_gem_uma_is_purgeable(uma));
+
+	dma_unmap_sgtable(dev->dev, uma->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(uma->sgt);
+	kfree(uma->sgt);
+	uma->sgt = NULL;
+
+	drm_gem_uma_put_pages_locked(uma);
+
+	uma->madv = -1;
+
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+	drm_gem_free_mmap_offset(obj);
+
+	/* Our goal here is to return as much of the memory as
+	 * is possible back to the system as we are called from OOM.
+	 * To do this we must instruct the shmfs to drop all of its
+	 * backing pages, *now*.
+	 */
+	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
+
+	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_purge_locked);
+
+/**
+ * drm_gem_uma_dumb_create - Create a dumb UMA buffer object
+ * @file: DRM file structure to create the dumb buffer for
+ * @dev: DRM device
+ * @args: IOCTL data
+ *
+ * This function computes the pitch of the dumb buffer and rounds it up to an
+ * integer number of bytes per pixel. Drivers for hardware that doesn't have
+ * any additional restrictions on the pitch can directly use this function as
+ * their &drm_driver.dumb_create callback.
+ *
+ * For hardware with additional restrictions, drivers can adjust the fields
+ * set up by userspace before calling into this function.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_uma_dumb_create(struct drm_file *file, struct drm_device *dev,
+			    struct drm_mode_create_dumb *args)
+{
+	int ret;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
+
+	return drm_gem_uma_create_with_handle(file, dev, args->size, &args->handle);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_dumb_create);
+
+static vm_fault_t drm_gem_uma_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+	loff_t num_pages = obj->size >> PAGE_SHIFT;
+	vm_fault_t ret;
+	struct page *page;
+	pgoff_t page_offset;
+
+	/* We don't use vmf->pgoff since that has the fake offset */
+	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+
+	dma_resv_lock(uma->base.resv, NULL);
+
+	if (page_offset >= num_pages ||
+	    drm_WARN_ON_ONCE(obj->dev, !uma->pages) ||
+	    uma->madv < 0) {
+		ret = VM_FAULT_SIGBUS;
+	} else {
+		page = uma->pages[page_offset];
+
+		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
+	}
+
+	dma_resv_unlock(uma->base.resv);
+
+	return ret;
+}
+
+static void drm_gem_uma_vm_open(struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
+
+	dma_resv_lock(uma->base.resv, NULL);
+
+	/*
+	 * We should have already pinned the pages when the buffer was first
+	 * mmap'd, vm_open() just grabs an additional reference for the new
+	 * mm the vma is getting copied into (ie. on fork()).
+	 */
+	drm_WARN_ON_ONCE(obj->dev,
+			 !refcount_inc_not_zero(&uma->pages_use_count));
+
+	dma_resv_unlock(uma->base.resv);
+
+	drm_gem_vm_open(vma);
+}
+
+static void drm_gem_uma_vm_close(struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	dma_resv_lock(uma->base.resv, NULL);
+	drm_gem_uma_put_pages_locked(uma);
+	dma_resv_unlock(uma->base.resv);
+
+	drm_gem_vm_close(vma);
+}
+
+const struct vm_operations_struct drm_gem_uma_vm_ops = {
+	.fault = drm_gem_uma_fault,
+	.open = drm_gem_uma_vm_open,
+	.close = drm_gem_uma_vm_close,
+};
+EXPORT_SYMBOL_GPL(drm_gem_uma_vm_ops);
+
+/**
+ * drm_gem_uma_mmap - Memory-map a GEM UMA object
+ * @uma: GEM UMA object
+ * @vma: VMA for the area to be mapped
+ *
+ * This function implements an augmented version of the GEM DRM file mmap
+ * operation for GEM UMA objects.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_uma_mmap(struct drm_gem_uma_object *uma, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj = &uma->base;
+	int ret;
+
+	if (drm_gem_is_imported(obj)) {
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
+		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;
+	}
+
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
+	dma_resv_lock(uma->base.resv, NULL);
+	ret = drm_gem_uma_get_pages_locked(uma);
+	dma_resv_unlock(uma->base.resv);
+
+	if (ret)
+		return ret;
+
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	if (uma->map_wc)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_mmap);
+
+/**
+ * drm_gem_uma_print_info() - Print &drm_gem_uma_object info for debugfs
+ * @uma: GEM UMA object
+ * @p: DRM printer
+ * @indent: Tab indentation level
+ */
+void drm_gem_uma_print_info(const struct drm_gem_uma_object *uma,
+			    struct drm_printer *p, unsigned int indent)
+{
+	if (drm_gem_is_imported(&uma->base))
+		return;
+
+	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&uma->pages_pin_count));
+	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&uma->pages_use_count));
+	drm_printf_indent(p, indent, "vmap_use_count=%u\n", refcount_read(&uma->vmap_use_count));
+	drm_printf_indent(p, indent, "vaddr=%p\n", uma->vaddr);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_print_info);
+
+/**
+ * drm_gem_uma_get_sg_table - Provide a scatter/gather table of pinned
+ *                            pages for a GEM UMA object
+ * @uma: GEM UMA object
+ *
+ * This function exports a scatter/gather table suitable for PRIME usage by
+ * calling the standard DMA mapping API.
+ *
+ * Drivers who need to acquire an scatter/gather table for objects need to call
+ * drm_gem_uma_get_pages_sgt() instead.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or error pointer on failure.
+ */
+struct sg_table *drm_gem_uma_get_sg_table(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
+
+	return drm_prime_pages_to_sg(obj->dev, uma->pages, obj->size >> PAGE_SHIFT);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_get_sg_table);
+
+static struct sg_table *drm_gem_uma_get_pages_sgt_locked(struct drm_gem_uma_object *uma)
+{
+	struct drm_gem_object *obj = &uma->base;
+	int ret;
+	struct sg_table *sgt;
+
+	if (uma->sgt)
+		return uma->sgt;
+
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
+
+	ret = drm_gem_uma_get_pages_locked(uma);
+	if (ret)
+		return ERR_PTR(ret);
+
+	sgt = drm_gem_uma_get_sg_table(uma);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err_put_pages;
+	}
+	/* Map the pages for use by the h/w. */
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgt;
+
+	uma->sgt = sgt;
+
+	return sgt;
+
+err_free_sgt:
+	sg_free_table(sgt);
+	kfree(sgt);
+err_put_pages:
+	drm_gem_uma_put_pages_locked(uma);
+	return ERR_PTR(ret);
+}
+
+/**
+ * drm_gem_uma_get_pages_sgt - Pin pages, dma map them, and return a
+ *			       scatter/gather table for a GEM UMA object.
+ * @uma: GEM UMA object
+ *
+ * This function returns a scatter/gather table suitable for driver usage. If
+ * the sg table doesn't exist, the pages are pinned, dma-mapped, and a sg
+ * table created.
+ *
+ * This is the main function for drivers to get at backing storage, and it hides
+ * and difference between dma-buf imported and natively allocated objects.
+ * drm_gem_uma_get_sg_table() should not be directly called by drivers.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or errno on failure.
+ */
+struct sg_table *drm_gem_uma_get_pages_sgt(struct drm_gem_uma_object *uma)
+{
+	int ret;
+	struct sg_table *sgt;
+
+	ret = dma_resv_lock_interruptible(uma->base.resv, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	sgt = drm_gem_uma_get_pages_sgt_locked(uma);
+	dma_resv_unlock(uma->base.resv);
+
+	return sgt;
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_get_pages_sgt);
+
+/**
+ * drm_gem_uma_prime_import_sg_table - Produce a GEM UMA object from
+ *                 another driver's scatter/gather table of pinned pages
+ * @dev: Device to import into
+ * @attach: DMA-BUF attachment
+ * @sgt: Scatter/gather table of pinned pages
+ *
+ * This function imports a scatter/gather table exported via DMA-BUF by
+ * another driver. Drivers that use the GEM UMA helpers should set this as
+ * their &drm_driver.gem_prime_import_sg_table callback.
+ *
+ * Returns:
+ * A pointer to a newly created GEM object or an ERR_PTR-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_object *
+drm_gem_uma_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt)
+{
+	size_t size = PAGE_ALIGN(attach->dmabuf->size);
+	struct drm_gem_uma_object *uma;
+
+	uma = __drm_gem_uma_create(dev, size, true, NULL);
+	if (IS_ERR(uma))
+		return ERR_CAST(uma);
+
+	uma->sgt = sgt;
+
+	drm_dbg_prime(dev, "size = %zu\n", size);
+
+	return &uma->base;
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_prime_import_sg_table);
+
+/**
+ * drm_gem_uma_prime_import_no_map - Import dmabuf without mapping its sg_table
+ * @dev: Device to import into
+ * @dma_buf: dma-buf object to import
+ *
+ * Drivers that use the GEM UMA helpers but also wants to import dmabuf without
+ * mapping its sg_table can use this as their &drm_driver.gem_prime_import
+ * implementation.
+ */
+struct drm_gem_object *drm_gem_uma_prime_import_no_map(struct drm_device *dev,
+						       struct dma_buf *dma_buf)
+{
+	struct dma_buf_attachment *attach;
+	struct drm_gem_uma_object *uma;
+	struct drm_gem_object *obj;
+	size_t size;
+	int ret;
+
+	if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
+		/*
+		 * Importing dmabuf exported from our own gem increases
+		 * refcount on gem itself instead of f_count of dmabuf.
+		 */
+		obj = dma_buf->priv;
+		drm_gem_object_get(obj);
+		return obj;
+	}
+
+	attach = dma_buf_attach(dma_buf, dev->dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	size = PAGE_ALIGN(attach->dmabuf->size);
+
+	uma = __drm_gem_uma_create(dev, size, true, NULL);
+	if (IS_ERR(uma)) {
+		ret = PTR_ERR(uma);
+		goto fail_detach;
+	}
+
+	drm_dbg_prime(dev, "size = %zu\n", size);
+
+	uma->base.import_attach = attach;
+	uma->base.resv = dma_buf->resv;
+
+	return &uma->base;
+
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gem_uma_prime_import_no_map);
+
+MODULE_DESCRIPTION("DRM UMA memory-management helpers");
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index c0e952293ad0..801f1c00e3c1 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
 	drm_gem_shmem_test.o \
+	drm_gem_uma_test.o \
 	drm_hdmi_state_helper_test.o \
 	drm_managed_test.o \
 	drm_mm_test.o \
diff --git a/drivers/gpu/drm/tests/drm_gem_uma_test.c b/drivers/gpu/drm/tests/drm_gem_uma_test.c
new file mode 100644
index 000000000000..38f8b17c3d11
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_gem_uma_test.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test suite for GEM objects backed by uma buffers
+ *
+ * Copyright (C) 2023 Red Hat, Inc.
+ *
+ * Author: Marco Pagani <marpagan@redhat.com>
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/iosys-map.h>
+#include <linux/sizes.h>
+
+#include <kunit/test.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_uma_helper.h>
+#include <drm/drm_kunit_helpers.h>
+
+#define TEST_SIZE		SZ_1M
+#define TEST_BYTE		0xae
+
+/*
+ * Wrappers to avoid cast warnings when passing action functions
+ * directly to kunit_add_action().
+ */
+KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
+
+KUNIT_DEFINE_ACTION_WRAPPER(sg_free_table_wrapper, sg_free_table,
+			    struct sg_table *);
+
+KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_uma_free_wrapper, drm_gem_uma_free,
+			    struct drm_gem_uma_object *);
+
+/*
+ * Test creating a uma GEM object backed by uma buffer. The test
+ * case succeeds if the GEM object is successfully allocated with the
+ * uma file node and object functions attributes set, and the size
+ * attribute is equal to the correct size.
+ */
+static void drm_gem_uma_test_obj_create(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+	KUNIT_EXPECT_EQ(test, uma->base.size, TEST_SIZE);
+	KUNIT_EXPECT_NOT_NULL(test, uma->base.filp);
+	KUNIT_EXPECT_NOT_NULL(test, uma->base.funcs);
+
+	drm_gem_uma_free(uma);
+}
+
+/*
+ * Test creating a uma GEM object from a scatter/gather table exported
+ * via a DMA-BUF. The test case succeed if the GEM object is successfully
+ * created with the uma file node attribute equal to NULL and the sgt
+ * attribute pointing to the scatter/gather table that has been imported.
+ */
+static void drm_gem_uma_test_obj_create_private(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	struct drm_gem_object *gem_obj;
+	struct dma_buf buf_mock;
+	struct dma_buf_attachment attach_mock;
+	struct sg_table *sgt;
+	char *buf;
+	int ret;
+
+	/* Create a mock scatter/gather table */
+	buf = kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, sgt);
+
+	ret = kunit_add_action_or_reset(test, kfree_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sg_init_one(sgt->sgl, buf, TEST_SIZE);
+
+	/*
+	 * Set the DMA mask to 64-bits and map the sgtables
+	 * otherwise drm_gem_uma_free will cause a warning
+	 * on debug kernels.
+	 */
+	ret = dma_set_mask(drm_dev->dev, DMA_BIT_MASK(64));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = dma_map_sgtable(drm_dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Init a mock DMA-BUF */
+	buf_mock.size = TEST_SIZE;
+	attach_mock.dmabuf = &buf_mock;
+
+	gem_obj = drm_gem_uma_prime_import_sg_table(drm_dev, &attach_mock, sgt);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
+	KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
+	KUNIT_EXPECT_NULL(test, gem_obj->filp);
+	KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);
+
+	/* The scatter/gather table will be freed by drm_gem_uma_free */
+	kunit_remove_action(test, sg_free_table_wrapper, sgt);
+	kunit_remove_action(test, kfree_wrapper, sgt);
+
+	uma = to_drm_gem_uma_obj(gem_obj);
+	KUNIT_EXPECT_PTR_EQ(test, uma->sgt, sgt);
+
+	drm_gem_uma_free(uma);
+}
+
+/*
+ * Test pinning backing pages for a uma GEM object. The test case
+ * succeeds if a suitable number of backing pages are allocated, and
+ * the pages table counter attribute is increased by one.
+ */
+static void drm_gem_uma_test_pin_pages(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	int i, ret;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+	KUNIT_EXPECT_NULL(test, uma->pages);
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->pages_use_count), 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_uma_free_wrapper, uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_uma_pin(uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NOT_NULL(test, uma->pages);
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->pages_use_count), 1);
+
+	for (i = 0; i < (uma->base.size >> PAGE_SHIFT); i++)
+		KUNIT_ASSERT_NOT_NULL(test, uma->pages[i]);
+
+	drm_gem_uma_unpin(uma);
+	KUNIT_EXPECT_NULL(test, uma->pages);
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->pages_use_count), 0);
+}
+
+/*
+ * Test creating a virtual mapping for a uma GEM object. The test
+ * case succeeds if the backing memory is mapped and the reference
+ * counter for virtual mapping is increased by one. Moreover, the test
+ * case writes and then reads a test pattern over the mapped memory.
+ */
+static void drm_gem_uma_test_vmap(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	struct iosys_map map;
+	int ret, i;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+	KUNIT_EXPECT_NULL(test, uma->vaddr);
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->vmap_use_count), 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_uma_free_wrapper, uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_uma_vmap_locked(uma, &map);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NOT_NULL(test, uma->vaddr);
+	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->vmap_use_count), 1);
+
+	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
+	for (i = 0; i < TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
+
+	drm_gem_uma_vunmap_locked(uma, &map);
+	KUNIT_EXPECT_NULL(test, uma->vaddr);
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->vmap_use_count), 0);
+}
+
+/*
+ * Test exporting a scatter/gather table of pinned pages suitable for
+ * PRIME usage from a uma GEM object. The test case succeeds if a
+ * scatter/gather table large enough to accommodate the backing memory
+ * is successfully exported.
+ */
+static void drm_gem_uma_test_get_pages_sgt(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, len = 0;
+	int ret;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_uma_free_wrapper, uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_uma_pin(uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sgt = drm_gem_uma_get_sg_table(uma);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+	KUNIT_EXPECT_NULL(test, uma->sgt);
+
+	ret = kunit_add_action_or_reset(test, kfree_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		KUNIT_EXPECT_NOT_NULL(test, sg);
+		len += sg->length;
+	}
+
+	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
+}
+
+/*
+ * Test pinning pages and exporting a scatter/gather table suitable for
+ * driver usage from a uma GEM object. The test case succeeds if the
+ * backing pages are pinned and a scatter/gather table large enough to
+ * accommodate the backing memory is successfully exported.
+ */
+static void drm_gem_uma_test_get_sg_table(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, ret, len = 0;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_uma_free_wrapper, uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* The scatter/gather table will be freed by drm_gem_uma_free */
+	sgt = drm_gem_uma_get_pages_sgt(uma);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+	KUNIT_ASSERT_NOT_NULL(test, uma->pages);
+	KUNIT_EXPECT_EQ(test, refcount_read(&uma->pages_use_count), 1);
+	KUNIT_EXPECT_PTR_EQ(test, sgt, uma->sgt);
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		KUNIT_EXPECT_NOT_NULL(test, sg);
+		len += sg->length;
+	}
+
+	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
+}
+
+/*
+ * Test updating the madvise state of a uma GEM object. The test
+ * case checks that the function for setting madv updates it only if
+ * its current value is greater or equal than zero and returns false
+ * if it has a negative value.
+ */
+static void drm_gem_uma_test_madvise(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	int ret;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+	KUNIT_ASSERT_EQ(test, uma->madv, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_uma_free_wrapper, uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_uma_madvise_locked(uma, 1);
+	KUNIT_EXPECT_TRUE(test, ret);
+	KUNIT_ASSERT_EQ(test, uma->madv, 1);
+
+	/* Set madv to a negative value */
+	ret = drm_gem_uma_madvise_locked(uma, -1);
+	KUNIT_EXPECT_FALSE(test, ret);
+	KUNIT_ASSERT_EQ(test, uma->madv, -1);
+
+	/* Check that madv cannot be set back to a positive value */
+	ret = drm_gem_uma_madvise_locked(uma, 0);
+	KUNIT_EXPECT_FALSE(test, ret);
+	KUNIT_ASSERT_EQ(test, uma->madv, -1);
+}
+
+/*
+ * Test purging a uma GEM object. First, assert that a newly created
+ * uma GEM object is not purgeable. Then, set madvise to a positive
+ * value and call drm_gem_uma_get_pages_sgt() to pin and dma-map the
+ * backing pages. Finally, assert that the uma GEM object is now
+ * purgeable and purge it.
+ */
+static void drm_gem_uma_test_purge(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_uma_object *uma;
+	struct sg_table *sgt;
+	int ret;
+
+	uma = drm_gem_uma_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, uma);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_uma_free_wrapper, uma);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_uma_is_purgeable(uma);
+	KUNIT_EXPECT_FALSE(test, ret);
+
+	ret = drm_gem_uma_madvise_locked(uma, 1);
+	KUNIT_EXPECT_TRUE(test, ret);
+
+	/* The scatter/gather table will be freed by drm_gem_uma_free */
+	sgt = drm_gem_uma_get_pages_sgt(uma);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+
+	ret = drm_gem_uma_is_purgeable(uma);
+	KUNIT_EXPECT_TRUE(test, ret);
+
+	drm_gem_uma_purge_locked(uma);
+	KUNIT_EXPECT_NULL(test, uma->pages);
+	KUNIT_EXPECT_NULL(test, uma->sgt);
+	KUNIT_EXPECT_EQ(test, uma->madv, -1);
+}
+
+static int drm_gem_uma_test_init(struct kunit *test)
+{
+	struct device *dev;
+	struct drm_device *drm_dev;
+
+	/* Allocate a parent device */
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	/*
+	 * The DRM core will automatically initialize the GEM core and create
+	 * a DRM Memory Manager object which provides an address space pool
+	 * for GEM objects allocation.
+	 */
+	drm_dev = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm_dev),
+						      0, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm_dev);
+
+	test->priv = drm_dev;
+
+	return 0;
+}
+
+static struct kunit_case drm_gem_uma_test_cases[] = {
+	KUNIT_CASE(drm_gem_uma_test_obj_create),
+	KUNIT_CASE(drm_gem_uma_test_obj_create_private),
+	KUNIT_CASE(drm_gem_uma_test_pin_pages),
+	KUNIT_CASE(drm_gem_uma_test_vmap),
+	KUNIT_CASE(drm_gem_uma_test_get_pages_sgt),
+	KUNIT_CASE(drm_gem_uma_test_get_sg_table),
+	KUNIT_CASE(drm_gem_uma_test_madvise),
+	KUNIT_CASE(drm_gem_uma_test_purge),
+	{}
+};
+
+static struct kunit_suite drm_gem_uma_suite = {
+	.name = "drm_gem_uma",
+	.init = drm_gem_uma_test_init,
+	.test_cases = drm_gem_uma_test_cases
+};
+
+kunit_test_suite(drm_gem_uma_suite);
+
+MODULE_DESCRIPTION("KUnit test suite for GEM objects backed by UMA buffers");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_fbdev_uma.h b/include/drm/drm_fbdev_uma.h
new file mode 100644
index 000000000000..2dd5d47795ea
--- /dev/null
+++ b/include/drm/drm_fbdev_uma.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_FBDEV_UMA_H
+#define DRM_FBDEV_UMA_H
+
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+int drm_fbdev_uma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				     struct drm_fb_helper_surface_size *sizes);
+
+#define DRM_FBDEV_UMA_DRIVER_OPS \
+	.fbdev_probe = drm_fbdev_uma_driver_fbdev_probe
+#else
+#define DRM_FBDEV_UMA_DRIVER_OPS \
+	.fbdev_probe = NULL
+#endif
+
+#endif
diff --git a/include/drm/drm_gem_uma_helper.h b/include/drm/drm_gem_uma_helper.h
new file mode 100644
index 000000000000..e7722c625fab
--- /dev/null
+++ b/include/drm/drm_gem_uma_helper.h
@@ -0,0 +1,309 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DRM_GEM_UMA_HELPER_H__
+#define __DRM_GEM_UMA_HELPER_H__
+
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_prime.h>
+
+struct dma_buf_attachment;
+struct drm_mode_create_dumb;
+struct drm_printer;
+struct sg_table;
+
+/**
+ * struct drm_gem_uma_object - GEM object for UMA systems
+ */
+struct drm_gem_uma_object {
+	/**
+	 * @base: Base GEM object
+	 */
+	struct drm_gem_object base;
+
+	/**
+	 * @pages: Page table
+	 */
+	struct page **pages;
+
+	/**
+	 * @pages_use_count:
+	 *
+	 * Reference count on the pages table.
+	 * The pages are put when the count reaches zero.
+	 */
+	refcount_t pages_use_count;
+
+	/**
+	 * @pages_pin_count:
+	 *
+	 * Reference count on the pinned pages table.
+	 *
+	 * Pages are hard-pinned and reside in memory if count
+	 * greater than zero. Otherwise, when count is zero, the pages are
+	 * allowed to be evicted and purged by memory shrinker.
+	 */
+	refcount_t pages_pin_count;
+
+	/**
+	 * @madv: State for madvise
+	 *
+	 * 0 is active/inuse.
+	 * A negative value is the object is purged.
+	 * Positive values are driver specific and not used by the helpers.
+	 */
+	int madv;
+
+	/**
+	 * @madv_list: List entry for madvise tracking
+	 *
+	 * Typically used by drivers to track purgeable objects
+	 */
+	struct list_head madv_list;
+
+	/**
+	 * @sgt: Scatter/gather table for imported PRIME buffers
+	 */
+	struct sg_table *sgt;
+
+	/**
+	 * @vaddr: Kernel virtual address of the backing memory
+	 */
+	void *vaddr;
+
+	/**
+	 * @vmap_use_count:
+	 *
+	 * Reference count on the virtual address.
+	 * The address are un-mapped when the count reaches zero.
+	 */
+	refcount_t vmap_use_count;
+
+	/**
+	 * @pages_mark_dirty_on_put:
+	 *
+	 * Mark pages as dirty when they are put.
+	 */
+	bool pages_mark_dirty_on_put : 1;
+
+	/**
+	 * @pages_mark_accessed_on_put:
+	 *
+	 * Mark pages as accessed when they are put.
+	 */
+	bool pages_mark_accessed_on_put : 1;
+
+	/**
+	 * @map_wc: map object write-combined (instead of using shmem defaults).
+	 */
+	bool map_wc : 1;
+};
+
+#define to_drm_gem_uma_obj(obj) \
+	container_of(obj, struct drm_gem_uma_object, base)
+
+int drm_gem_uma_init(struct drm_device *dev, struct drm_gem_uma_object *uma, size_t size);
+struct drm_gem_uma_object *drm_gem_uma_create(struct drm_device *dev, size_t size);
+struct drm_gem_uma_object *drm_gem_uma_create_with_mnt(struct drm_device *dev,
+						       size_t size,
+						       struct vfsmount *gemfs);
+void drm_gem_uma_release(struct drm_gem_uma_object *uma);
+void drm_gem_uma_free(struct drm_gem_uma_object *uma);
+
+void drm_gem_uma_put_pages_locked(struct drm_gem_uma_object *uma);
+int drm_gem_uma_pin(struct drm_gem_uma_object *uma);
+void drm_gem_uma_unpin(struct drm_gem_uma_object *uma);
+int drm_gem_uma_vmap_locked(struct drm_gem_uma_object *uma,
+			    struct iosys_map *map);
+void drm_gem_uma_vunmap_locked(struct drm_gem_uma_object *uma,
+			       struct iosys_map *map);
+int drm_gem_uma_mmap(struct drm_gem_uma_object *uma, struct vm_area_struct *vma);
+
+int drm_gem_uma_pin_locked(struct drm_gem_uma_object *uma);
+void drm_gem_uma_unpin_locked(struct drm_gem_uma_object *uma);
+
+int drm_gem_uma_madvise_locked(struct drm_gem_uma_object *uma, int madv);
+
+static inline bool drm_gem_uma_is_purgeable(struct drm_gem_uma_object *uma)
+{
+	return (uma->madv > 0) &&
+		!refcount_read(&uma->pages_pin_count) && uma->sgt &&
+		!uma->base.dma_buf && !drm_gem_is_imported(&uma->base);
+}
+
+void drm_gem_uma_purge_locked(struct drm_gem_uma_object *uma);
+
+struct sg_table *drm_gem_uma_get_sg_table(struct drm_gem_uma_object *uma);
+struct sg_table *drm_gem_uma_get_pages_sgt(struct drm_gem_uma_object *uma);
+
+void drm_gem_uma_print_info(const struct drm_gem_uma_object *uma,
+			    struct drm_printer *p, unsigned int indent);
+
+extern const struct vm_operations_struct drm_gem_uma_vm_ops;
+
+/*
+ * GEM object functions
+ */
+
+/**
+ * drm_gem_uma_object_free - GEM object function for drm_gem_uma_free()
+ * @obj: GEM object to free
+ *
+ * This function wraps drm_gem_uma_free(). Drivers that employ the GEM UMA
+ * helpers should use it as their &drm_gem_object_funcs.free handler.
+ */
+static inline void drm_gem_uma_object_free(struct drm_gem_object *obj)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	drm_gem_uma_free(uma);
+}
+
+/**
+ * drm_gem_uma_object_print_info() - Print &drm_gem_uma_object info for debugfs
+ * @p: DRM printer
+ * @indent: Tab indentation level
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_uma_print_info(). Drivers that employ the GEM
+ * UMA helpers should use this function as their &drm_gem_object_funcs.print_info
+ * handler.
+ */
+static inline void drm_gem_uma_object_print_info(struct drm_printer *p, unsigned int indent,
+						 const struct drm_gem_object *obj)
+{
+	const struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	drm_gem_uma_print_info(uma, p, indent);
+}
+
+/**
+ * drm_gem_uma_object_pin - GEM object function for drm_gem_uma_pin()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_uma_pin(). Drivers that employ the GEM UMA
+ * helpers should use it as their &drm_gem_object_funcs.pin handler.
+ */
+static inline int drm_gem_uma_object_pin(struct drm_gem_object *obj)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	return drm_gem_uma_pin_locked(uma);
+}
+
+/**
+ * drm_gem_uma_object_unpin - GEM object function for drm_gem_uma_unpin()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_uma_unpin(). Drivers that employ the GEM UMA
+ * helpers should use it as their &drm_gem_object_funcs.unpin handler.
+ */
+static inline void drm_gem_uma_object_unpin(struct drm_gem_object *obj)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	drm_gem_uma_unpin_locked(uma);
+}
+
+/**
+ * drm_gem_uma_object_get_sg_table - GEM object function for drm_gem_uma_get_sg_table()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_uma_get_sg_table(). Drivers that employ the
+ * GEM UMA helpers should use it as their &drm_gem_object_funcs.get_sg_table
+ * handler.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or error pointer on failure.
+ */
+static inline struct sg_table *drm_gem_uma_object_get_sg_table(struct drm_gem_object *obj)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	return drm_gem_uma_get_sg_table(uma);
+}
+
+/*
+ * drm_gem_uma_object_vmap - GEM object function for drm_gem_uma_vmap_locked()
+ * @obj: GEM object
+ * @map: Returns the kernel virtual address of the GEM UMA object's backing store.
+ *
+ * This function wraps drm_gem_uma_vmap_locked(). Drivers that employ the
+ * GEM UMA helpers should use it as their &drm_gem_object_funcs.vmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_uma_object_vmap(struct drm_gem_object *obj,
+					  struct iosys_map *map)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	return drm_gem_uma_vmap_locked(uma, map);
+}
+
+/*
+ * drm_gem_uma_object_vunmap - GEM object function for drm_gem_uma_vunmap()
+ * @obj: GEM object
+ * @map: Kernel virtual address where the GEM UMA object was mapped
+ *
+ * This function wraps drm_gem_uma_vunmap_locked(). Drivers that employ
+ * the GEM UMA helpers should use it as their &drm_gem_object_funcs.vunmap
+ * handler.
+ */
+static inline void drm_gem_uma_object_vunmap(struct drm_gem_object *obj,
+					     struct iosys_map *map)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	drm_gem_uma_vunmap_locked(uma, map);
+}
+
+/**
+ * drm_gem_uma_object_mmap - GEM object function for drm_gem_uma_mmap()
+ * @obj: GEM object
+ * @vma: VMA for the area to be mapped
+ *
+ * This function wraps drm_gem_uma_mmap(). Drivers that employ the GEM UMA
+ * helpers should use it as their &drm_gem_object_funcs.mmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_uma_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
+
+	return drm_gem_uma_mmap(uma, vma);
+}
+
+/*
+ * Driver ops
+ */
+
+struct drm_gem_object *
+drm_gem_uma_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt);
+int drm_gem_uma_dumb_create(struct drm_file *file, struct drm_device *dev,
+			    struct drm_mode_create_dumb *args);
+struct drm_gem_object *drm_gem_uma_prime_import_no_map(struct drm_device *dev,
+						       struct dma_buf *buf);
+
+/**
+ * DRM_GEM_UMA_DRIVER_OPS - Default GEM UMA operations
+ *
+ * This macro provides a shortcut for setting the GEM UMA operations
+ * in the &drm_driver structure. Drivers that do not require an s/g table
+ * for imported buffers should use this.
+ */
+#define DRM_GEM_UMA_DRIVER_OPS \
+	.gem_prime_import       = drm_gem_uma_prime_import_no_map, \
+	.dumb_create            = drm_gem_uma_dumb_create
+
+#endif /* __DRM_GEM_UMA_HELPER_H__ */
-- 
2.52.0

