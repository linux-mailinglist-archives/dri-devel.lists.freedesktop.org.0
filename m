Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8886A6F94
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 16:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9BE10E26C;
	Wed,  1 Mar 2023 15:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581EB10E060
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 15:31:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5A4D1FE15;
 Wed,  1 Mar 2023 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677684665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKivnNihIXUBhjlAHuw8tit2yC4XqzlG4+MuWHaFWVo=;
 b=dI8KhvUHI6Z8xaDcwet/Ve7WXkZF4Q1yrpm5W7NDCdB3R63rkNaSTEYOWEv/UwikTUUAR7
 uPrsjlcpDSh40h3TKYDBeUlrFDSscmIBbaaqVGBWh9REPuKUMgpUqlunEUuvkroDsZAmF3
 NnvGGN0CwqO3epyWtXi9blIbMxZg89w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677684665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKivnNihIXUBhjlAHuw8tit2yC4XqzlG4+MuWHaFWVo=;
 b=ANWvbhqNLwjbuK6GTigd0IlF0pci7yy20mUULc4BVkqHgJXBG9M3RP+rlmIpewVIZQcjAw
 BkQR1JvQ99WHc2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52D3813A64;
 Wed,  1 Mar 2023 15:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AOl2E7lv/2OAXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Mar 2023 15:31:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH 01/22] drm/fbdev-dma: Implement fbdev emulation for GEM DMA
 helpers
Date: Wed,  1 Mar 2023 16:30:40 +0100
Message-Id: <20230301153101.4282-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement fbdev emulation that is optimized for drivers that use
DMA helpers. The buffers may no tbe moveable, may not require damage
handling and have to be located in system memory. This allows fbdev
emulation to operate directly on the buffer and mmap it to userspace.

Besides those constraints, the emulation works like in the generic
code. As an internal DRM client provides, it receives hotplug, restore
and unregister events. The DRM client is independent from the fbdev
probing, which runs on the first successful hotplug event.

The emulation is part of the DMA helper module and not build unless
DMA helpers and fbdev emulation has been configured.

Tested with vc4.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/drm_fbdev_dma.c | 275 ++++++++++++++++++++++++++++++++
 include/drm/drm_fbdev_dma.h     |  15 ++
 3 files changed, 291 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_fbdev_dma.c
 create mode 100644 include/drm/drm_fbdev_dma.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ab4460fcd63f..0d53d0c265f8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
+drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
 drm_dma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
 obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
 
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
new file mode 100644
index 000000000000..cf553ac12a0f
--- /dev/null
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
+
+#include <drm/drm_fbdev_dma.h>
+
+/*
+ * struct fb_ops
+ */
+
+static int drm_fbdev_dma_fb_open(struct fb_info *info, int user)
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
+static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (user)
+		module_put(fb_helper->dev->driver->fops->owner);
+
+	return 0;
+}
+
+static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (!fb_helper->dev)
+		return;
+
+	drm_fb_helper_fini(fb_helper);
+
+	drm_client_buffer_vunmap(fb_helper->buffer);
+	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_release(&fb_helper->client);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+}
+
+static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_device *dev = fb_helper->dev;
+
+	if (drm_WARN_ON_ONCE(dev, !fb_helper->dev->driver->gem_prime_mmap))
+		return -ENODEV;
+
+	return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
+}
+
+static const struct fb_ops drm_fbdev_dma_fb_ops = {
+	.owner = THIS_MODULE,
+	.fb_open = drm_fbdev_dma_fb_open,
+	.fb_release = drm_fbdev_dma_fb_release,
+	.fb_read = drm_fb_helper_sys_read,
+	.fb_write = drm_fb_helper_sys_write,
+	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_fillrect = drm_fb_helper_sys_fillrect,
+	.fb_copyarea = drm_fb_helper_sys_copyarea,
+	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	.fb_destroy = drm_fbdev_dma_fb_destroy,
+	.fb_mmap = drm_fbdev_dma_fb_mmap,
+};
+
+/*
+ * struct drm_fb_helper
+ */
+
+static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
+					 struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_client_buffer *buffer;
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_framebuffer *fb;
+	struct fb_info *info;
+	u32 format;
+	struct iosys_map map;
+	int ret;
+
+	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		    sizes->surface_width, sizes->surface_height,
+		    sizes->surface_bpp);
+
+	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+					       sizes->surface_height, format);
+	if (IS_ERR(buffer))
+		return PTR_ERR(buffer);
+	dma_obj = to_drm_gem_dma_obj(buffer->gem);
+
+	fb = buffer->fb;
+	if (drm_WARN_ON(dev, fb->funcs->dirty)) {
+		ret = -ENODEV; /* damage handling not supported; use generic emulation */
+		goto err_drm_client_buffer_delete;
+	}
+
+	ret = drm_client_buffer_vmap(buffer, &map);
+	if (ret) {
+		goto err_drm_client_buffer_delete;
+	} else if (drm_WARN_ON(dev, map.is_iomem)) {
+		ret = -ENODEV; /* I/O memory not supported; use generic emulation */
+		goto err_drm_client_buffer_delete;
+	}
+
+	fb_helper->buffer = buffer;
+	fb_helper->fb = buffer->fb;
+
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info)) {
+		ret = PTR_ERR(info);
+		goto err_drm_client_buffer_vunmap;
+	}
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
+
+	info->fbops = &drm_fbdev_dma_fb_ops;
+	info->flags = FBINFO_DEFAULT;
+
+	/* screen */
+	info->flags |= FBINFO_VIRTFB; /* system memory */
+	if (dma_obj->map_noncoherent)
+		info->flags |= FBINFO_READS_FAST; /* signal caching */
+	info->screen_size = sizes->surface_height * fb->pitches[0];
+	info->screen_buffer = map.vaddr;
+	info->fix.smem_len = info->screen_size;
+
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+	/*
+	 * Shamelessly leak the physical address to user-space.
+	 */
+	if (fb_helper->hint_leak_smem_start && !info->fix.smem_start)
+		info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
+#endif
+
+	return 0;
+
+err_drm_client_buffer_vunmap:
+	fb_helper->fb = NULL;
+	fb_helper->buffer = NULL;
+	drm_client_buffer_vunmap(buffer);
+err_drm_client_buffer_delete:
+	drm_client_framebuffer_delete(buffer);
+	return ret;
+}
+
+static const struct drm_fb_helper_funcs drm_fbdev_dma_helper_funcs = {
+	.fb_probe = drm_fbdev_dma_helper_fb_probe,
+};
+
+/*
+ * struct drm_client_funcs
+ */
+
+static void drm_fbdev_dma_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info) {
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
+
+static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
+
+	return 0;
+}
+
+static int drm_fbdev_dma_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
+	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "fbdev-dma: Failed to setup generic emulation (ret=%d)\n", ret);
+	return ret;
+}
+
+static const struct drm_client_funcs drm_fbdev_dma_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= drm_fbdev_dma_client_unregister,
+	.restore	= drm_fbdev_dma_client_restore,
+	.hotplug	= drm_fbdev_dma_client_hotplug,
+};
+
+/**
+ * drm_fbdev_dma_setup() - Setup fbdev emulation for GEM DMA helpers
+ * @dev: DRM device
+ * @preferred_bpp: Preferred bits per pixel for the device.
+ *                 @dev->mode_config.preferred_depth is used if this is zero.
+ *
+ * This function sets up fbdev emulation for GEM DMA drivers that support
+ * dumb buffers with a virtual address and that can be mmap'ed.
+ * drm_fbdev_dma_setup() shall be called after the DRM driver registered
+ * the new DRM device with drm_dev_register().
+ *
+ * Restore, hotplug events and teardown are all taken care of. Drivers that do
+ * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
+ * Simple drivers might use drm_mode_config_helper_suspend().
+ *
+ * This function is safe to call even when there are no connectors present.
+ * Setup will be retried on the next hotplug event.
+ *
+ * The fbdev is destroyed by drm_dev_unregister().
+ */
+void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
+{
+	struct drm_fb_helper *fb_helper;
+	int ret;
+
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
+
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return;
+	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
+
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
+	if (ret) {
+		drm_err(dev, "Failed to register client: %d\n", ret);
+		goto err_drm_client_init;
+	}
+
+	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
+	if (ret)
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
+
+	drm_client_register(&fb_helper->client);
+
+	return;
+
+err_drm_client_init:
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+}
+EXPORT_SYMBOL(drm_fbdev_dma_setup);
diff --git a/include/drm/drm_fbdev_dma.h b/include/drm/drm_fbdev_dma.h
new file mode 100644
index 000000000000..2da7ee784133
--- /dev/null
+++ b/include/drm/drm_fbdev_dma.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_FBDEV_DMA_H
+#define DRM_FBDEV_DMA_H
+
+struct drm_device;
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp);
+#else
+static inline void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
+{ }
+#endif
+
+#endif
-- 
2.39.2

