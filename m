Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E17A76B80
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFF410E450;
	Mon, 31 Mar 2025 16:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mf3h6eRg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrnpaOV3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UKxKh/Dc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V3jIkErP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73BA10E451
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2BA61F750;
 Mon, 31 Mar 2025 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743436745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fX/VWuamvTn61szYTEOwSu+E2wJOb1EwFnQd7XAfpc=;
 b=mf3h6eRgdIODkODHjyUjQF/v9AZSGKleVxbcSeyn5oFmnqi/E4hqyxkwX9XoC61XMGv7MV
 /qHLN+mNP646NtoSrgvCHIjn4EZRsuSP08DehDIIIFctpzR9zK16w8MVI301iiaklEY1T5
 DbAfX4b3TqgAkydvuuLVEDiu0amdRXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743436745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fX/VWuamvTn61szYTEOwSu+E2wJOb1EwFnQd7XAfpc=;
 b=PrnpaOV3wGZXiCVsKMwjNQPaDyk0nr/P64U13chBHUhJSG0/i6CtT5CZOFN/yDQLUmU5Dl
 a7iS/tSZqgKav2Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743436744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fX/VWuamvTn61szYTEOwSu+E2wJOb1EwFnQd7XAfpc=;
 b=UKxKh/DcGI177XS8INpJn/v1YYcOhuMkda0F88mUrzdfEFa8Nn1QSxb4n9mCGjeZZPadRJ
 N+RZopKLWV0lg38lVx07OrLHFXkJzVm7baoks4+dvtirSREo/O9XPWsA7IVRSu190bYgW3
 IDdbIM368K3ZYIF5qcYQqKIHGeIV2/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743436744;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fX/VWuamvTn61szYTEOwSu+E2wJOb1EwFnQd7XAfpc=;
 b=V3jIkErPkBanFzFQ8CrtpGy8xh4/HdxQ9eikGEmRXetV+5rtirPJhnIxdKzxHhA2lQYkel
 4eMMzltufga+x1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BBA613A1F;
 Mon, 31 Mar 2025 15:59:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oNm/IMi76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 16/18] drm/sysfb: Add vesadrm for VESA displays
Date: Mon, 31 Mar 2025 17:52:19 +0200
Message-ID: <20250331155538.1173333-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Add support for screen_info setups with VIDEO_TYPE_VLFB. Provide the
minimum functionality of reading modes, updating and clearing the display.

There is existing support for these displays provided by simpledrm with
CONFIG_SYSFB_SIMPLEFB=y. Using vesadrm over simpledrm will allow for the
use of additional functionality provided by VESA, such as EDID information,
gamma correction and palette modes. This enhances the user experience and
adds support for more display configuratons.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/Kconfig   |  16 ++
 drivers/gpu/drm/sysfb/Makefile  |   1 +
 drivers/gpu/drm/sysfb/vesadrm.c | 448 ++++++++++++++++++++++++++++++++
 3 files changed, 465 insertions(+)
 create mode 100644 drivers/gpu/drm/sysfb/vesadrm.c

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 3ffd8da1224cf..008c33eab99a4 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -57,4 +57,20 @@ config DRM_SIMPLEDRM
 	  On x86 BIOS or UEFI systems, you should also select SYSFB_SIMPLEFB
 	  to use UEFI and VESA framebuffers.
 
+config DRM_VESADRM
+	tristate "VESA framebuffer driver"
+	depends on DRM && MMU
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select DRM_SYSFB_HELPER
+	select SYSFB
+	help
+	  DRM driver for VESA framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the firmware or bootloader before the kernel boots. Scanout
+	  buffer, size, and display format must be provided via VBE interfaces.
+
 endmenu
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index 2f96f52842e63..0d2518c971634 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
 obj-$(CONFIG_DRM_EFIDRM)	+= efidrm.o
 obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
 obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
+obj-$(CONFIG_DRM_VESADRM)	+= vesadrm.o
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
new file mode 100644
index 0000000000000..8a963057ffec9
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/aperture.h>
+#include <linux/ioport.h>
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
+#define DRIVER_NAME	"vesadrm"
+#define DRIVER_DESC	"DRM driver for VESA platform devices"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static int vesadrm_get_validated_int(struct drm_device *dev, const char *name,
+				     u64 value, u32 max)
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
+static int vesadrm_get_validated_int0(struct drm_device *dev, const char *name,
+				      u64 value, u32 max)
+{
+	if (!value) {
+		drm_err(dev, "%s of 0 not allowed\n", name);
+		return -EINVAL;
+	}
+	return vesadrm_get_validated_int(dev, name, value, max);
+}
+
+static s64 vesadrm_get_validated_size0(struct drm_device *dev, const char *name,
+				       u64 value, u64 max)
+{
+	if (!value) {
+		drm_err(dev, "vesadrm: %s of 0 not allowed\n", name);
+		return -EINVAL;
+	} else if (value > max) {
+		drm_err(dev, "vesadrm: %s of %llu exceeds maximum of %llu\n", name, value, max);
+		return -EINVAL;
+	}
+	return value;
+}
+
+static int vesadrm_get_width_si(struct drm_device *dev, const struct screen_info *si)
+{
+	return vesadrm_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
+}
+
+static int vesadrm_get_height_si(struct drm_device *dev, const struct screen_info *si)
+{
+	return vesadrm_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
+}
+
+static struct resource *vesadrm_get_memory_si(struct drm_device *dev,
+					      const struct screen_info *si,
+					      struct resource *res)
+{
+	ssize_t	num;
+
+	num = screen_info_resources(si, res, 1);
+	if (!num) {
+		drm_err(dev, "vesadrm: memory resource not found\n");
+		return NULL;
+	}
+
+	return res;
+}
+
+static int vesadrm_get_stride_si(struct drm_device *dev, const struct screen_info *si,
+				 const struct drm_format_info *format,
+				 unsigned int width, unsigned int height, u64 size)
+{
+	u64 lfb_linelength = si->lfb_linelength;
+
+	if (!lfb_linelength)
+		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
+
+	return vesadrm_get_validated_int0(dev, "stride", lfb_linelength, div64_u64(size, height));
+}
+
+static u64 vesadrm_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
+				       unsigned int height, unsigned int stride, u64 size)
+{
+	u64 vsize = PAGE_ALIGN(height * stride);
+
+	return vesadrm_get_validated_size0(dev, "visible size", vsize, size);
+}
+
+static const struct drm_format_info *vesadrm_get_format_si(struct drm_device *dev,
+							   const struct screen_info *si)
+{
+	static const struct {
+		struct pixel_format pixel;
+		u32 fourcc;
+	} vesa_formats[] = {
+		{ PIXEL_FORMAT_XRGB1555, DRM_FORMAT_XRGB1555, },
+		{ PIXEL_FORMAT_RGB565, DRM_FORMAT_RGB565, },
+		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
+		{ PIXEL_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, },
+		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
+	};
+	const struct drm_format_info *format = NULL;
+	u32 bits_per_pixel;
+	size_t i;
+
+	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
+
+	for (i = 0; i < ARRAY_SIZE(vesa_formats); ++i) {
+		const struct pixel_format *f = &vesa_formats[i].pixel;
+
+		if (bits_per_pixel == f->bits_per_pixel &&
+		    si->red_size == f->red.length &&
+		    si->red_pos == f->red.offset &&
+		    si->green_size == f->green.length &&
+		    si->green_pos == f->green.offset &&
+		    si->blue_size == f->blue.length &&
+		    si->blue_pos == f->blue.offset) {
+			format = drm_format_info(vesa_formats[i].fourcc);
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
+/*
+ * VESA device
+ */
+
+struct vesadrm_device {
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
+static const u64 vesadrm_primary_plane_format_modifiers[] = {
+	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
+};
+
+static const struct drm_plane_helper_funcs vesadrm_primary_plane_helper_funcs = {
+	DRM_SYSFB_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs vesadrm_primary_plane_funcs = {
+	DRM_SYSFB_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static const struct drm_crtc_helper_funcs vesadrm_crtc_helper_funcs = {
+	DRM_SYSFB_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs vesadrm_crtc_funcs = {
+	DRM_SYSFB_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs vesadrm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs vesadrm_connector_helper_funcs = {
+	DRM_SYSFB_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs vesadrm_connector_funcs = {
+	DRM_SYSFB_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_funcs vesadrm_mode_config_funcs = {
+	DRM_SYSFB_MODE_CONFIG_FUNCS,
+};
+
+/*
+ * Init / Cleanup
+ */
+
+static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
+						    struct platform_device *pdev)
+{
+	const struct screen_info *si;
+	const struct drm_format_info *format;
+	int width, height, stride;
+	u64 vsize;
+	struct resource resbuf;
+	struct resource *res;
+	struct vesadrm_device *vesa;
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
+	if (screen_info_video_type(si) != VIDEO_TYPE_VLFB)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * VESA DRM driver
+	 */
+
+	vesa = devm_drm_dev_alloc(&pdev->dev, drv, struct vesadrm_device, sysfb.dev);
+	if (IS_ERR(vesa))
+		return ERR_CAST(vesa);
+	sysfb = &vesa->sysfb;
+	dev = &sysfb->dev;
+	platform_set_drvdata(pdev, dev);
+
+	/*
+	 * Hardware settings
+	 */
+
+	format = vesadrm_get_format_si(dev, si);
+	if (IS_ERR(format))
+		return ERR_CAST(format);
+	width = vesadrm_get_width_si(dev, si);
+	if (width < 0)
+		return ERR_PTR(width);
+	height = vesadrm_get_height_si(dev, si);
+	if (height < 0)
+		return ERR_PTR(height);
+	res = vesadrm_get_memory_si(dev, si, &resbuf);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+	stride = vesadrm_get_stride_si(dev, si, format, width, height, resource_size(res));
+	if (stride < 0)
+		return ERR_PTR(stride);
+	vsize = vesadrm_get_visible_size_si(dev, si, height, stride, resource_size(res));
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
+	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
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
+	dev->mode_config.funcs = &vesadrm_mode_config_funcs;
+
+	/* Primary plane */
+
+	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
+					    vesa->formats, ARRAY_SIZE(vesa->formats));
+
+	primary_plane = &vesa->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0, &vesadrm_primary_plane_funcs,
+				       vesa->formats, nformats,
+				       vesadrm_primary_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_plane_helper_add(primary_plane, &vesadrm_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &vesa->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&vesadrm_crtc_funcs, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_crtc_helper_add(crtc, &vesadrm_crtc_helper_funcs);
+
+	/* Encoder */
+
+	encoder = &vesa->encoder;
+	ret = drm_encoder_init(dev, encoder, &vesadrm_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
+	connector = &vesa->connector;
+	ret = drm_connector_init(dev, connector, &vesadrm_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_connector_helper_add(connector, &vesadrm_connector_helper_funcs);
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
+	return vesa;
+}
+
+/*
+ * DRM driver
+ */
+
+DEFINE_DRM_GEM_FOPS(vesadrm_fops);
+
+static struct drm_driver vesadrm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &vesadrm_fops,
+};
+
+/*
+ * Platform driver
+ */
+
+static int vesadrm_probe(struct platform_device *pdev)
+{
+	struct vesadrm_device *vesa;
+	struct drm_sysfb_device *sysfb;
+	struct drm_device *dev;
+	int ret;
+
+	vesa = vesadrm_device_create(&vesadrm_driver, pdev);
+	if (IS_ERR(vesa))
+		return PTR_ERR(vesa);
+	sysfb = &vesa->sysfb;
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
+static void vesadrm_remove(struct platform_device *pdev)
+{
+	struct drm_device *dev = platform_get_drvdata(pdev);
+
+	drm_dev_unplug(dev);
+}
+
+static struct platform_driver vesadrm_platform_driver = {
+	.driver = {
+		.name = "vesa-framebuffer",
+	},
+	.probe = vesadrm_probe,
+	.remove = vesadrm_remove,
+};
+
+module_platform_driver(vesadrm_platform_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
-- 
2.49.0

