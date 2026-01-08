Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D43D038CB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C56C10E78A;
	Thu,  8 Jan 2026 14:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC87910E78A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:51:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBD3734310;
 Thu,  8 Jan 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7366D3EA63;
 Thu,  8 Jan 2026 14:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ADe9GljEX2n0WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/8] drm/sysfb: corebootdrm: Add DRM driver for coreboot
 framebuffers
Date: Thu,  8 Jan 2026 15:19:48 +0100
Message-ID: <20260108145058.56943-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BBD3734310
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
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

Add corebotdrm, a DRM driver for coreboot framebuffers. The driver
supports a pre-initialized framebuffer with various packed RGB formats.
The driver code is fairly small and uses the same logic as the other
sysfb drivers. Most of the implementation comes from existing sysfb
helpers.

Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
output. Removing either leaves a dangling pointer in framebuffer_remove()
after the native graphics driver replaced the sysfb driver. Using the
new corebootdrm driver resolves this problem.

The old coreboot framebuffer code can now only selected if corebootdrm
has been disabled. Using corebootdrm is preferred.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/Kconfig     |   1 +
 drivers/gpu/drm/sysfb/Kconfig       |  16 ++
 drivers/gpu/drm/sysfb/Makefile      |   1 +
 drivers/gpu/drm/sysfb/corebootdrm.c | 402 ++++++++++++++++++++++++++++
 4 files changed, 420 insertions(+)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 41b78f5cb735..b306a0f56061 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -60,6 +60,7 @@ config GOOGLE_MEMCONSOLE_X86_LEGACY
 config GOOGLE_FRAMEBUFFER_COREBOOT
 	tristate "Coreboot Framebuffer"
 	depends on FB_SIMPLE || DRM_SIMPLEDRM
+	depends on DRM_COREBOOTDRM=n
 	depends on GOOGLE_COREBOOT_TABLE
 	help
 	  This option enables the kernel to search for a framebuffer in
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 9c9884c7efc6..e12be823e32b 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -7,6 +7,22 @@ config DRM_SYSFB_HELPER
 	tristate
 	depends on DRM
 
+config DRM_COREBOOTDRM
+	tristate "Coreboot framebuffer driver"
+	depends on DRM && MMU
+	depends on GOOGLE_COREBOOT_TABLE
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select DRM_SYSFB_HELPER
+	help
+	  DRM driver for coreboot-provided framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by coreboot firmware before the kernel boots. Scanout buffer, size,
+	  and display format must be provided via coreboot framebuffer device.
+
 config DRM_EFIDRM
 	tristate "EFI framebuffer driver"
 	depends on DRM && MMU && EFI && (!SYSFB_SIMPLEFB || COMPILE_TEST)
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index a156c496413d..85c9087ab03d 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -6,6 +6,7 @@ drm_sysfb_helper-y := \
 drm_sysfb_helper-$(CONFIG_SCREEN_INFO) += drm_sysfb_screen_info.o
 obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
 
+obj-$(CONFIG_DRM_COREBOOTDRM)	+= corebootdrm.o
 obj-$(CONFIG_DRM_EFIDRM)	+= efidrm.o
 obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
 obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
diff --git a/drivers/gpu/drm/sysfb/corebootdrm.c b/drivers/gpu/drm/sysfb/corebootdrm.c
new file mode 100644
index 000000000000..242e668c98f1
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/corebootdrm.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/aperture.h>
+#include <linux/coreboot.h>
+#include <linux/minmax.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "drm_sysfb_helper.h"
+
+#define DRIVER_NAME	"corebootdrm"
+#define DRIVER_DESC	"DRM driver for Coreboot framebuffers"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static const struct drm_format_info *
+corebootdrm_get_format_fb(struct drm_device *dev, const struct lb_framebuffer *fb)
+{
+	static const struct drm_sysfb_format formats[] = {
+		{ PIXEL_FORMAT_XRGB1555, DRM_FORMAT_XRGB1555, },
+		{ PIXEL_FORMAT_RGB565, DRM_FORMAT_RGB565, },
+		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
+		{ PIXEL_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, },
+		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
+		{ PIXEL_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, },
+	};
+	const struct pixel_format pixel = {
+		.bits_per_pixel = fb->bits_per_pixel,
+		.indexed  = false,
+		.alpha = {
+			.offset = 0,
+			.length = 0,
+		},
+		.red = {
+			.offset = fb->red_mask_pos,
+			.length = fb->red_mask_size,
+		},
+		.green = {
+			.offset = fb->green_mask_pos,
+			.length = fb->green_mask_size,
+		},
+		.blue = {
+			.offset = fb->blue_mask_pos,
+			.length = fb->blue_mask_size,
+		},
+	};
+
+	return drm_sysfb_get_format(dev, formats, ARRAY_SIZE(formats), &pixel);
+}
+
+static int corebootdrm_get_width_fb(struct drm_device *dev, const struct lb_framebuffer *fb)
+{
+	return drm_sysfb_get_validated_int0(dev, "width", fb->x_resolution, INT_MAX);
+}
+
+static int corebootdrm_get_height_fb(struct drm_device *dev, const struct lb_framebuffer *fb)
+{
+	return drm_sysfb_get_validated_int0(dev, "height", fb->y_resolution, INT_MAX);
+}
+
+static int corebootdrm_get_pitch_fb(struct drm_device *dev, const struct drm_format_info *format,
+				    unsigned int width, const struct lb_framebuffer *fb)
+{
+	u64 bytes_per_line = fb->bytes_per_line;
+
+	if (!bytes_per_line)
+		bytes_per_line = drm_format_info_min_pitch(format, 0, width);
+
+	return drm_sysfb_get_validated_int0(dev, "pitch", bytes_per_line, INT_MAX);
+}
+
+static u64 corebootdrm_get_address_fb(struct drm_device *dev, unsigned int height,
+				      unsigned int pitch, const struct lb_framebuffer *fb)
+{
+	u64 visible_size, size;
+
+	if (!fb->physical_address)
+		return 0;
+
+	if (check_mul_overflow(height, pitch, &visible_size))
+		return 0;
+	size = PAGE_ALIGN(visible_size);
+
+	if (fb->physical_address > (U64_MAX - size))
+		return 0;
+
+	return fb->physical_address;
+}
+
+/*
+ * Simple Framebuffer device
+ */
+
+struct corebootdrm_device {
+	struct drm_sysfb_device sysfb;
+
+	/* modesetting */
+	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+/*
+ * Modesetting
+ */
+
+static const u64 corebootdrm_primary_plane_format_modifiers[] = {
+	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
+};
+
+static const struct drm_plane_helper_funcs corebootdrm_primary_plane_helper_funcs = {
+	DRM_SYSFB_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs corebootdrm_primary_plane_funcs = {
+	DRM_SYSFB_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static const struct drm_crtc_helper_funcs corebootdrm_crtc_helper_funcs = {
+	DRM_SYSFB_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs corebootdrm_crtc_funcs = {
+	DRM_SYSFB_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs corebootdrm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs corebootdrm_connector_helper_funcs = {
+	DRM_SYSFB_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs corebootdrm_connector_funcs = {
+	DRM_SYSFB_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_funcs corebootdrm_mode_config_funcs = {
+	DRM_SYSFB_MODE_CONFIG_FUNCS,
+};
+
+/*
+ * Init / Cleanup
+ */
+
+static int corebootdrm_device_init(struct corebootdrm_device *cdev, struct coreboot_device *cbdev)
+{
+	const struct lb_framebuffer *fb = &cbdev->framebuffer;
+	struct drm_sysfb_device *sysfb = &cdev->sysfb;
+	struct drm_device *dev = &sysfb->dev;
+	const struct drm_format_info *format;
+	int width, height, pitch;
+	u64 address;
+	int width_mm = 0, height_mm = 0;
+	resource_size_t fb_size, fb_base, fb_pgbase, fb_pgsize;
+	struct resource *res, *mem = NULL;
+	void __iomem *screen_base;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	unsigned long max_width, max_height;
+	size_t nformats;
+	int ret;
+
+	/*
+	 * Hardware settings
+	 */
+
+	format = corebootdrm_get_format_fb(dev, fb);
+	if (!format)
+		return -EINVAL;
+	width = corebootdrm_get_width_fb(dev, fb);
+	if (width < 0)
+		return width;
+	height = corebootdrm_get_height_fb(dev, fb);
+	if (height < 0)
+		return height;
+	pitch = corebootdrm_get_pitch_fb(dev, format, width, fb);
+	if (pitch < 0)
+		return pitch;
+	address = corebootdrm_get_address_fb(dev, height, pitch, fb);
+	if (!address)
+		return -EINVAL;
+
+	sysfb->fb_mode = drm_sysfb_mode(width, height, width_mm, height_mm);
+	sysfb->fb_format = format;
+	sysfb->fb_pitch = pitch;
+
+	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
+	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, pitch=%d byte\n",
+		&format->format, width, height, pitch);
+
+	/*
+	 * Memory management
+	 */
+
+	fb_base = address;
+	fb_size = pitch * height;
+
+	fb_pgbase = round_down(fb_base, PAGE_SIZE);
+	fb_pgsize = fb_base - fb_pgbase + round_up(fb_size, PAGE_SIZE);
+
+	ret = devm_aperture_acquire_for_coreboot_device(cbdev, fb_pgbase, fb_pgsize);
+	if (ret) {
+		drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
+		return ret;
+	}
+
+	drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
+
+	mem = devm_request_mem_region(&cbdev->dev, fb_pgbase, fb_pgsize, dev_name(&cbdev->dev));
+	if (!mem) {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about. Use
+		 * the I/O-memory resource as-is and try to map that instead.
+		 */
+		drm_warn(dev, "could not acquire memory region %pr\n", res);
+		mem = res;
+	}
+
+	screen_base = devm_ioremap_wc(&cbdev->dev, fb_pgbase, fb_pgsize);
+	if (!screen_base)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
+
+	/*
+	 * Modesetting
+	 */
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
+
+	dev->mode_config.min_width = width;
+	dev->mode_config.max_width = max_width;
+	dev->mode_config.min_height = height;
+	dev->mode_config.max_height = max_height;
+	dev->mode_config.preferred_depth = format->depth;
+	dev->mode_config.funcs = &corebootdrm_mode_config_funcs;
+
+	/* Primary plane */
+
+	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
+					       cdev->formats, ARRAY_SIZE(cdev->formats));
+
+	primary_plane = &cdev->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0, &corebootdrm_primary_plane_funcs,
+				       cdev->formats, nformats,
+				       corebootdrm_primary_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(primary_plane, &corebootdrm_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &cdev->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&corebootdrm_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &corebootdrm_crtc_helper_funcs);
+
+	/* Encoder */
+
+	encoder = &cdev->encoder;
+	ret = drm_encoder_init(dev, encoder, &corebootdrm_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
+	connector = &cdev->connector;
+	ret = drm_connector_init(dev, connector, &corebootdrm_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &corebootdrm_connector_helper_funcs);
+	drm_connector_set_panel_orientation_with_quirk(connector,
+						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+						       width, height);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(dev);
+
+	return 0;
+}
+
+/*
+ * DRM driver
+ */
+
+DEFINE_DRM_GEM_FOPS(corebootdrm_fops);
+
+static struct drm_driver corebootdrm_drm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &corebootdrm_fops,
+};
+
+/*
+ * Coreboot driver
+ */
+
+static int corebootdrm_probe(struct coreboot_device *cbdev)
+{
+	const struct lb_framebuffer *fb = &cbdev->framebuffer;
+	struct corebootdrm_device *cdev;
+	struct drm_sysfb_device *sysfb;
+	struct drm_device *dev;
+	int ret;
+
+	if (fb->size < sizeof(*fb)) {
+		drm_err(dev, "coreboot framebuffer entry too small\n");
+		return -EINVAL;
+	}
+
+	cdev = devm_drm_dev_alloc(&cbdev->dev, &corebootdrm_drm_driver,
+				  struct corebootdrm_device, sysfb.dev);
+	if (IS_ERR(cdev))
+		return PTR_ERR(cdev);
+	dev_set_drvdata(&cbdev->dev, cdev);
+
+	ret = corebootdrm_device_init(cdev, cbdev);
+	if (ret)
+		return ret;
+	sysfb = &cdev->sysfb;
+	dev = &sysfb->dev;
+
+	ret = drm_dev_register(dev, 0);
+	if (ret)
+		return ret;
+
+	drm_client_setup(dev, sysfb->fb_format);
+
+	return 0;
+}
+
+static void corebootdrm_remove(struct coreboot_device *cbdev)
+{
+	struct corebootdrm_device *cdev = dev_get_drvdata(&cbdev->dev);
+	struct drm_device *dev = &cdev->sysfb.dev;
+
+	drm_dev_unplug(dev);
+}
+
+static const struct coreboot_device_id corebootdrm_id_table[] = {
+	{ .tag = CB_TAG_FRAMEBUFFER },
+	{ },
+};
+MODULE_DEVICE_TABLE(coreboot, corebootdrm_id_table);
+
+static struct coreboot_driver corebootdrm_driver = {
+	.probe = corebootdrm_probe,
+	.remove = corebootdrm_remove,
+	.drv = {
+		.name = "corebootdrm",
+	},
+	.id_table = corebootdrm_id_table,
+};
+module_coreboot_driver(corebootdrm_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
-- 
2.52.0

