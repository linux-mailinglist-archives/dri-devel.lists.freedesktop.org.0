Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB7A76B7B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869A510E467;
	Mon, 31 Mar 2025 15:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B4510E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 479131F74D;
 Mon, 31 Mar 2025 15:59:04 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E51413A1F;
 Mon, 31 Mar 2025 15:59:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GEtPAsi76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 14/18] drm/sysfb: Add efidrm for EFI displays
Date: Mon, 31 Mar 2025 17:52:17 +0200
Message-ID: <20250331155538.1173333-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 479131F74D
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Add support for screen_info setups with VIDEO_TYPE_EFI. Provide the
minimum functionality of reading modes, updating and clearing the display.

There is existing support for these displays provided by simpledrm with
CONFIG_SYSFB_SIMPLEFB=y. Using efidrm over simpledrm will allows for the
mapping of video memory with correct caching. Simpledrm always assumes WC
caching, while fully cached memory is possible with efidrm. Efidrm will
also allow for the use of additional functionality provided by EFI, such
as EDID information.

In addition to efidrm, add struct pixel_format plus initializer macros.
The type and macros describe pixel formats in a generic way on order to
find the DRM format from the screen_info settings. Similar existing code
in SIMPLEFB_FORMATS and fbdev is not really what is needed in efidrm,
but SIMPLEFB_FORMATS can later be converted to struct pixel_format.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/Kconfig  |  16 ++
 drivers/gpu/drm/sysfb/Makefile |   1 +
 drivers/gpu/drm/sysfb/efidrm.c | 487 +++++++++++++++++++++++++++++++++
 include/video/pixel_format.h   |  41 +++
 4 files changed, 545 insertions(+)
 create mode 100644 drivers/gpu/drm/sysfb/efidrm.c
 create mode 100644 include/video/pixel_format.h

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 87094da417f69..3ffd8da1224cf 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -7,6 +7,22 @@ config DRM_SYSFB_HELPER
 	tristate
 	depends on DRM
 
+config DRM_EFIDRM
+	tristate "EFI framebuffer driver"
+	depends on DRM && MMU
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select DRM_SYSFB_HELPER
+	select SYSFB
+	help
+	  DRM driver for EFI framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the firmware or bootloader before the kernel boots. Scanout
+	  buffer, size, and display format must be provided via EFI interfaces.
+
 config DRM_OFDRM
 	tristate "Open Firmware display driver"
 	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index f1e8700c3e357..2f96f52842e63 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
 
+obj-$(CONFIG_DRM_EFIDRM)	+= efidrm.o
 obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
 obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
new file mode 100644
index 0000000000000..5c1876e34a047
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/aperture.h>
+#include <linux/efi.h>
+#include <linux/limits.h>
+#include <linux/platform_device.h>
+#include <linux/screen_info.h>
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
+#include <drm/drm_probe_helper.h>
+
+#include <video/pixel_format.h>
+
+#include "drm_sysfb_helper.h"
+
+#define DRIVER_NAME	"efidrm"
+#define DRIVER_DESC	"DRM driver for EFI platform devices"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static int efidrm_get_validated_int(struct drm_device *dev, const char *name,
+				    u64 value, u32 max)
+{
+	if (max > INT_MAX)
+		max = INT_MAX;
+	if (value > max) {
+		drm_err(dev, "%s of %llu exceeds maximum of %u\n", name, value, max);
+		return -EINVAL;
+	}
+	return value;
+}
+
+static int efidrm_get_validated_int0(struct drm_device *dev, const char *name,
+				     u64 value, u32 max)
+{
+	if (!value) {
+		drm_err(dev, "%s of 0 not allowed\n", name);
+		return -EINVAL;
+	}
+	return efidrm_get_validated_int(dev, name, value, max);
+}
+
+static s64 efidrm_get_validated_size0(struct drm_device *dev, const char *name,
+				      u64 value, u64 max)
+{
+	if (!value) {
+		drm_err(dev, "%s of 0 not allowed\n", name);
+		return -EINVAL;
+	} else if (value > max) {
+		drm_err(dev, "%s of %llu exceeds maximum of %llu\n", name, value, max);
+		return -EINVAL;
+	}
+	return value;
+}
+
+static int efidrm_get_width_si(struct drm_device *dev, const struct screen_info *si)
+{
+	return efidrm_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
+}
+
+static int efidrm_get_height_si(struct drm_device *dev, const struct screen_info *si)
+{
+	return efidrm_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
+}
+
+static struct resource *efidrm_get_memory_si(struct drm_device *dev,
+					     const struct screen_info *si,
+					     struct resource *res)
+{
+	ssize_t	num;
+
+	num = screen_info_resources(si, res, 1);
+	if (!num) {
+		drm_err(dev, "memory resource not found\n");
+		return NULL;
+	}
+
+	return res;
+}
+
+static int efidrm_get_stride_si(struct drm_device *dev, const struct screen_info *si,
+				const struct drm_format_info *format,
+				unsigned int width, unsigned int height, u64 size)
+{
+	u64 lfb_linelength = si->lfb_linelength;
+
+	if (!lfb_linelength)
+		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
+
+	return efidrm_get_validated_int0(dev, "stride", lfb_linelength, div64_u64(size, height));
+}
+
+static u64 efidrm_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
+				      unsigned int height, unsigned int stride, u64 size)
+{
+	u64 vsize = PAGE_ALIGN(height * stride);
+
+	return efidrm_get_validated_size0(dev, "visible size", vsize, size);
+}
+
+static const struct drm_format_info *efidrm_get_format_si(struct drm_device *dev,
+							  const struct screen_info *si)
+{
+	static const struct {
+		struct pixel_format pixel;
+		u32 fourcc;
+	} efi_formats[] = {
+		{ PIXEL_FORMAT_XRGB1555, DRM_FORMAT_XRGB1555, },
+		{ PIXEL_FORMAT_RGB565, DRM_FORMAT_RGB565, },
+		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
+		{ PIXEL_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, },
+		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
+		{ PIXEL_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, },
+	};
+	const struct drm_format_info *format = NULL;
+	u32 bits_per_pixel;
+	size_t i;
+
+	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
+
+	for (i = 0; i < ARRAY_SIZE(efi_formats); ++i) {
+		const struct pixel_format *f = &efi_formats[i].pixel;
+
+		if (bits_per_pixel == f->bits_per_pixel &&
+		    si->red_size == f->red.length &&
+		    si->red_pos == f->red.offset &&
+		    si->green_size == f->green.length &&
+		    si->green_pos == f->green.offset &&
+		    si->blue_size == f->blue.length &&
+		    si->blue_pos == f->blue.offset) {
+			format = drm_format_info(efi_formats[i].fourcc);
+			break;
+		}
+	}
+
+	if (!format)
+		return ERR_PTR(-EINVAL);
+	if (format->is_color_indexed)
+		return ERR_PTR(-EINVAL);
+
+	return format;
+}
+
+static u64 efidrm_get_mem_flags(struct drm_device *dev, resource_size_t start,
+				resource_size_t len)
+{
+	u64 attribute = EFI_MEMORY_UC | EFI_MEMORY_WC |
+			EFI_MEMORY_WT | EFI_MEMORY_WB;
+	u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
+	resource_size_t end = start + len;
+	efi_memory_desc_t md;
+	u64 md_end;
+
+	if (!efi_enabled(EFI_MEMMAP) || efi_mem_desc_lookup(start, &md))
+		goto out;
+
+	md_end = md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT);
+	if (end > md_end)
+		goto out;
+
+	attribute &= md.attribute;
+	if (attribute) {
+		mem_flags |= EFI_MEMORY_WT | EFI_MEMORY_WB;
+		mem_flags &= attribute;
+	}
+
+out:
+	return mem_flags;
+}
+
+/*
+ * EFI device
+ */
+
+struct efidrm_device {
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
+static const u64 efidrm_primary_plane_format_modifiers[] = {
+	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
+};
+
+static const struct drm_plane_helper_funcs efidrm_primary_plane_helper_funcs = {
+	DRM_SYSFB_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs efidrm_primary_plane_funcs = {
+	DRM_SYSFB_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static const struct drm_crtc_helper_funcs efidrm_crtc_helper_funcs = {
+	DRM_SYSFB_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs efidrm_crtc_funcs = {
+	DRM_SYSFB_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs efidrm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs efidrm_connector_helper_funcs = {
+	DRM_SYSFB_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs efidrm_connector_funcs = {
+	DRM_SYSFB_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_funcs efidrm_mode_config_funcs = {
+	DRM_SYSFB_MODE_CONFIG_FUNCS,
+};
+
+/*
+ * Init / Cleanup
+ */
+
+static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
+						  struct platform_device *pdev)
+{
+	const struct screen_info *si;
+	const struct drm_format_info *format;
+	int width, height, stride;
+	u64 vsize, mem_flags;
+	struct resource resbuf;
+	struct resource *res;
+	struct efidrm_device *efi;
+	struct drm_sysfb_device *sysfb;
+	struct drm_device *dev;
+	struct resource *mem = NULL;
+	void __iomem *screen_base;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	unsigned long max_width, max_height;
+	size_t nformats;
+	int ret;
+
+	si = dev_get_platdata(&pdev->dev);
+	if (!si)
+		return ERR_PTR(-ENODEV);
+	if (screen_info_video_type(si) != VIDEO_TYPE_EFI)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * EFI DRM driver
+	 */
+
+	efi = devm_drm_dev_alloc(&pdev->dev, drv, struct efidrm_device, sysfb.dev);
+	if (IS_ERR(efi))
+		return ERR_CAST(efi);
+	sysfb = &efi->sysfb;
+	dev = &sysfb->dev;
+	platform_set_drvdata(pdev, dev);
+
+	/*
+	 * Hardware settings
+	 */
+
+	format = efidrm_get_format_si(dev, si);
+	if (IS_ERR(format))
+		return ERR_CAST(format);
+	width = efidrm_get_width_si(dev, si);
+	if (width < 0)
+		return ERR_PTR(width);
+	height = efidrm_get_height_si(dev, si);
+	if (height < 0)
+		return ERR_PTR(height);
+	res = efidrm_get_memory_si(dev, si, &resbuf);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+	stride = efidrm_get_stride_si(dev, si, format, width, height, resource_size(res));
+	if (stride < 0)
+		return ERR_PTR(stride);
+	vsize = efidrm_get_visible_size_si(dev, si, height, stride, resource_size(res));
+	if (!vsize)
+		return ERR_PTR(-EINVAL);
+
+	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d bytes\n",
+		&format->format, width, height, stride);
+
+	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
+	sysfb->fb_format = format;
+	sysfb->fb_pitch = stride;
+
+	/*
+	 * Memory management
+	 */
+
+	ret = devm_aperture_acquire_for_platform_device(pdev, res->start, vsize);
+	if (ret) {
+		drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
+		return ERR_PTR(ret);
+	}
+
+	drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
+
+	mem = devm_request_mem_region(&pdev->dev, res->start, vsize, drv->name);
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
+	mem_flags = efidrm_get_mem_flags(dev, res->start, vsize);
+
+	if (mem_flags & EFI_MEMORY_WC)
+		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
+	else if (mem_flags & EFI_MEMORY_UC)
+		screen_base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	else if (mem_flags & EFI_MEMORY_WT)
+		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
+					    MEMREMAP_WT);
+	else if (mem_flags & EFI_MEMORY_WB)
+		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
+					    MEMREMAP_WB);
+	if (!screen_base)
+		return ERR_PTR(-ENOMEM);
+	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
+
+	/*
+	 * Modesetting
+	 */
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
+
+	dev->mode_config.min_width = width;
+	dev->mode_config.max_width = max_width;
+	dev->mode_config.min_height = height;
+	dev->mode_config.max_height = max_height;
+	dev->mode_config.preferred_depth = format->depth;
+	dev->mode_config.funcs = &efidrm_mode_config_funcs;
+
+	/* Primary plane */
+
+	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
+					    efi->formats, ARRAY_SIZE(efi->formats));
+
+	primary_plane = &efi->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0, &efidrm_primary_plane_funcs,
+				       efi->formats, nformats,
+				       efidrm_primary_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_plane_helper_add(primary_plane, &efidrm_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &efi->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&efidrm_crtc_funcs, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_crtc_helper_add(crtc, &efidrm_crtc_helper_funcs);
+
+	/* Encoder */
+
+	encoder = &efi->encoder;
+	ret = drm_encoder_init(dev, encoder, &efidrm_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
+	connector = &efi->connector;
+	ret = drm_connector_init(dev, connector, &efidrm_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_connector_helper_add(connector, &efidrm_connector_helper_funcs);
+	drm_connector_set_panel_orientation_with_quirk(connector,
+						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+						       width, height);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
+	return efi;
+}
+
+/*
+ * DRM driver
+ */
+
+DEFINE_DRM_GEM_FOPS(efidrm_fops);
+
+static struct drm_driver efidrm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &efidrm_fops,
+};
+
+/*
+ * Platform driver
+ */
+
+static int efidrm_probe(struct platform_device *pdev)
+{
+	struct efidrm_device *efi;
+	struct drm_sysfb_device *sysfb;
+	struct drm_device *dev;
+	int ret;
+
+	efi = efidrm_device_create(&efidrm_driver, pdev);
+	if (IS_ERR(efi))
+		return PTR_ERR(efi);
+	sysfb = &efi->sysfb;
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
+static void efidrm_remove(struct platform_device *pdev)
+{
+	struct drm_device *dev = platform_get_drvdata(pdev);
+
+	drm_dev_unplug(dev);
+}
+
+static struct platform_driver efidrm_platform_driver = {
+	.driver = {
+		.name = "efi-framebuffer",
+	},
+	.probe = efidrm_probe,
+	.remove = efidrm_remove,
+};
+
+module_platform_driver(efidrm_platform_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
diff --git a/include/video/pixel_format.h b/include/video/pixel_format.h
new file mode 100644
index 0000000000000..b5104b2a3a13e
--- /dev/null
+++ b/include/video/pixel_format.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef VIDEO_PIXEL_FORMAT_H
+#define VIDEO_PIXEL_FORMAT_H
+
+struct pixel_format {
+	unsigned char bits_per_pixel;
+	bool indexed;
+	union {
+		struct {
+			struct {
+				unsigned char offset;
+				unsigned char length;
+			} alpha, red, green, blue;
+		};
+		struct {
+			unsigned char offset;
+			unsigned char length;
+		} index;
+	};
+};
+
+#define PIXEL_FORMAT_XRGB1555 \
+	{ 16, false, { .alpha = {0, 0}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
+
+#define PIXEL_FORMAT_RGB565 \
+	{ 16, false, { .alpha = {0, 0}, .red = {11, 5}, .green = {5, 6}, .blue = {0, 5} } }
+
+#define PIXEL_FORMAT_RGB888 \
+	{ 24, false, { .alpha = {0, 0}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
+
+#define PIXEL_FORMAT_XRGB8888 \
+	{ 32, false, { .alpha = {0, 0}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
+
+#define PIXEL_FORMAT_XBGR8888 \
+	{ 32, false, { .alpha = {0, 0}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
+
+#define PIXEL_FORMAT_XRGB2101010 \
+	{ 32, false, { .alpha = {0, 0}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
+
+#endif
-- 
2.49.0

