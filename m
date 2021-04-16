Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A2361C66
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14506EB51;
	Fri, 16 Apr 2021 09:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE3A6EB3A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:00:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EEBAAF03;
 Fri, 16 Apr 2021 09:00:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v4 4/9] drm: Add simpledrm driver
Date: Fri, 16 Apr 2021 11:00:43 +0200
Message-Id: <20210416090048.11492-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416090048.11492-1-tzimmermann@suse.de>
References: <20210416090048.11492-1-tzimmermann@suse.de>
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simpledrm driver is a DRM driver for simple-framebuffer framebuffers
as provided by the kernel's boot code. This driver enables basic
graphical output on many different graphics devices that are provided
by the platform (e.g., EFI, VESA, embedded framebuffers).

With the kernel's simple-framebuffer infrastructure, the kernel receives
a pre-configured framebuffer from the system (i.e., firmware, boot
loader). It creates a platform device to which simpledrm attaches.
The system's framebuffer consists of a memory range, size and format.
Based on these values, simpledrm creates a DRM devices. No actual
modesetting is possible.

v4:
	* disable simplefb if simpledrm has been selected (Maxime)
v3:
	* add disable function that clears screen to black (Daniel)
	* set shadow buffering only for fbdev emulation
	* set platform-driver data during device creation
v2:
	* rename driver to simpledrm
	* add dri-devel to MAINTAINERS entry
	* put native format first in primary-plane format list (Daniel)
	* inline simplekms_device_cleanup() (Daniel)
	* use helpers for shadow-buffered planes
	* fix whitespace errors

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 MAINTAINERS                      |   7 +
 drivers/gpu/drm/tiny/Kconfig     |  16 +
 drivers/gpu/drm/tiny/Makefile    |   1 +
 drivers/gpu/drm/tiny/simpledrm.c | 545 +++++++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig      |   2 +-
 5 files changed, 570 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tiny/simpledrm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c45120759e6..4935776250e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5765,6 +5765,13 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/savage/
 F:	include/uapi/drm/savage_drm.h
 
+DRM DRIVER FOR SIMPLE FRAMEBUFFERS
+M:	Thomas Zimmermann <tzimmermann@suse.de>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/tiny/simplekms.c
+
 DRM DRIVER FOR SIS VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/sis/
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 9bbaa1a69050..d46f95d9196d 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -38,6 +38,22 @@ config DRM_GM12U320
 	 This is a KMS driver for projectors which use the GM12U320 chipset
 	 for video transfer over USB2/3, such as the Acer C120 mini projector.
 
+config DRM_SIMPLEDRM
+	tristate "Simple framebuffer driver"
+	depends on DRM
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  DRM driver for simple platform-provided framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the firmware or bootloader before the kernel boots. Scanout
+	  buffer, size, and display format must be provided via device tree,
+	  UEFI, VESA, etc.
+
+	  On x86 and compatible, you should also select CONFIG_X86_SYSFB to
+	  use UEFI and VESA framebuffers.
+
 config TINYDRM_HX8357D
 	tristate "DRM support for HX8357D display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index bef6780bdd6f..9cc847e756da 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
+obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
 obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
new file mode 100644
index 000000000000..0473a90a4024
--- /dev/null
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -0,0 +1,545 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#define DRIVER_NAME	"simpledrm"
+#define DRIVER_DESC	"DRM driver for simple-framebuffer platform devices"
+#define DRIVER_DATE	"20200625"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+/*
+ * Assume a monitor resolution of 96 dpi to
+ * get a somewhat reasonable screen size.
+ */
+#define RES_MM(d)	\
+	(((d) * 254ul) / (96ul * 10ul))
+
+#define SIMPLEDRM_MODE(hd, vd)	\
+	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
+
+/*
+ * Helpers for simplefb
+ */
+
+static int
+simplefb_get_validated_int(struct drm_device *dev, const char *name,
+			   uint32_t value)
+{
+	if (value > INT_MAX) {
+		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
+			name, value);
+		return -EINVAL;
+	}
+	return (int)value;
+}
+
+static int
+simplefb_get_validated_int0(struct drm_device *dev, const char *name,
+			    uint32_t value)
+{
+	if (!value) {
+		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
+			name, value);
+		return -EINVAL;
+	}
+	return simplefb_get_validated_int(dev, name, value);
+}
+
+static const struct drm_format_info *
+simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
+{
+	static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
+	const struct simplefb_format *fmt = formats;
+	const struct simplefb_format *end = fmt + ARRAY_SIZE(formats);
+
+	if (!format_name) {
+		drm_err(dev, "simplefb: missing framebuffer format\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	while (fmt < end) {
+		if (!strcmp(format_name, fmt->name))
+			return drm_format_info(fmt->fourcc);
+		++fmt;
+	}
+
+	drm_err(dev, "simplefb: unknown framebuffer format %s\n",
+		format_name);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int
+simplefb_get_width_pd(struct drm_device *dev,
+		      const struct simplefb_platform_data *pd)
+{
+	return simplefb_get_validated_int0(dev, "width", pd->width);
+}
+
+static int
+simplefb_get_height_pd(struct drm_device *dev,
+		       const struct simplefb_platform_data *pd)
+{
+	return simplefb_get_validated_int0(dev, "height", pd->height);
+}
+
+static int
+simplefb_get_stride_pd(struct drm_device *dev,
+		       const struct simplefb_platform_data *pd)
+{
+	return simplefb_get_validated_int(dev, "stride", pd->stride);
+}
+
+static const struct drm_format_info *
+simplefb_get_format_pd(struct drm_device *dev,
+		       const struct simplefb_platform_data *pd)
+{
+	return simplefb_get_validated_format(dev, pd->format);
+}
+
+/*
+ * Simple Framebuffer device
+ */
+
+struct simpledrm_device {
+	struct drm_device dev;
+	struct platform_device *pdev;
+
+	/* simplefb settings */
+	struct drm_display_mode mode;
+	const struct drm_format_info *format;
+	unsigned int pitch;
+
+	/* memory management */
+	struct resource *mem;
+	void __iomem *screen_base;
+
+	/* modesetting */
+	uint32_t formats[8];
+	size_t nformats;
+	struct drm_connector connector;
+	struct drm_simple_display_pipe pipe;
+};
+
+static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
+{
+	return container_of(dev, struct simpledrm_device, dev);
+}
+
+/*
+ *  Simplefb settings
+ */
+
+static struct drm_display_mode simpledrm_mode(unsigned int width,
+					      unsigned int height)
+{
+	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
+
+	mode.clock = 60 /* Hz */ * mode.hdisplay * mode.vdisplay;
+	drm_mode_set_name(&mode);
+
+	return mode;
+}
+
+static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
+{
+	int width, height, stride;
+	const struct drm_format_info *format;
+	struct drm_format_name_buf buf;
+	struct drm_device *dev = &sdev->dev;
+	struct platform_device *pdev = sdev->pdev;
+	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
+
+	if (pd) {
+		width = simplefb_get_width_pd(dev, pd);
+		if (width < 0)
+			return width;
+		height = simplefb_get_height_pd(dev, pd);
+		if (height < 0)
+			return height;
+		stride = simplefb_get_stride_pd(dev, pd);
+		if (stride < 0)
+			return stride;
+		format = simplefb_get_format_pd(dev, pd);
+		if (IS_ERR(format))
+			return PTR_ERR(format);
+	} else {
+		drm_err(dev, "no simplefb configuration found\n");
+		return -ENODEV;
+	}
+
+	sdev->mode = simpledrm_mode(width, height);
+	sdev->format = format;
+	sdev->pitch = stride;
+
+	drm_dbg_kms(dev, "display mode={" DRM_MODE_FMT "}\n",
+		    DRM_MODE_ARG(&sdev->mode));
+	drm_dbg_kms(dev,
+		    "framebuffer format=\"%s\", size=%dx%d, stride=%d byte\n",
+		    drm_get_format_name(format->format, &buf), width,
+		    height, stride);
+
+	return 0;
+}
+
+/*
+ * Memory management
+ */
+
+static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
+{
+	struct platform_device *pdev = sdev->pdev;
+	struct resource *mem;
+	void __iomem *screen_base;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem)
+		return -EINVAL;
+
+	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
+				      resource_size(mem));
+	if (!screen_base)
+		return -ENOMEM;
+
+	sdev->mem = mem;
+	sdev->screen_base = screen_base;
+
+	return 0;
+}
+
+/*
+ * Modesetting
+ */
+
+/*
+ * Support all formats of simplefb and maybe more; in order
+ * of preference. The display's update function will do any
+ * conversion necessary.
+ *
+ * TODO: Add blit helpers for remaining formats and uncomment
+ *       constants.
+ */
+static const uint32_t simpledrm_default_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGB565,
+	//DRM_FORMAT_XRGB1555,
+	//DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGB888,
+	//DRM_FORMAT_XRGB2101010,
+	//DRM_FORMAT_ARGB2101010,
+};
+
+static const uint64_t simpledrm_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
+	if (!mode)
+		return 0;
+
+	if (mode->name[0] == '\0')
+		drm_mode_set_name(mode);
+
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	if (mode->width_mm)
+		connector->display_info.width_mm = mode->width_mm;
+	if (mode->height_mm)
+		connector->display_info.height_mm = mode->height_mm;
+
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
+	.get_modes = simpledrm_connector_helper_get_modes,
+};
+
+static const struct drm_connector_funcs simpledrm_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int
+simpledrm_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
+				    const struct drm_display_mode *mode)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
+
+	if (mode->hdisplay != sdev->mode.hdisplay &&
+	    mode->vdisplay != sdev->mode.vdisplay)
+		return MODE_ONE_SIZE;
+	else if (mode->hdisplay != sdev->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+	else if (mode->vdisplay != sdev->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
+
+	return MODE_OK;
+}
+
+static void
+simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_plane_state *plane_state)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
+
+	if (!fb)
+		return;
+
+	drm_fb_blit_dstclip(sdev->screen_base, sdev->pitch,
+			    sdev->format->format, vmap, fb);
+}
+
+static void
+simpledrm_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
+	struct drm_device *dev = &sdev->dev;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	/* Clear screen to black if disabled */
+	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+
+	drm_dev_exit(idx);
+}
+
+static void
+simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
+				     struct drm_plane_state *old_plane_state)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
+	struct drm_plane_state *plane_state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_rect clip;
+
+	if (!fb)
+		return;
+
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
+		return;
+
+	drm_fb_blit_rect_dstclip(sdev->screen_base, sdev->pitch,
+				 sdev->format->format, vmap, fb, &clip);
+}
+
+static const struct drm_simple_display_pipe_funcs
+simpledrm_simple_display_pipe_funcs = {
+	.mode_valid = simpledrm_simple_display_pipe_mode_valid,
+	.enable = simpledrm_simple_display_pipe_enable,
+	.disable = simpledrm_simple_display_pipe_disable,
+	.update = simpledrm_simple_display_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+};
+
+static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
+						size_t *nformats_out)
+{
+	struct drm_device *dev = &sdev->dev;
+	size_t i;
+
+	if (sdev->nformats)
+		goto out; /* don't rebuild list on recurring calls */
+
+	/* native format goes first */
+	sdev->formats[0] = sdev->format->format;
+	sdev->nformats = 1;
+
+	/* default formats go second */
+	for (i = 0; i < ARRAY_SIZE(simpledrm_default_formats); ++i) {
+		if (simpledrm_default_formats[i] == sdev->format->format)
+			continue; /* native format already went first */
+		sdev->formats[sdev->nformats] = simpledrm_default_formats[i];
+		sdev->nformats++;
+	}
+
+	/*
+	 * TODO: The simpledrm driver converts framebuffers to the native
+	 * format when copying them to device memory. If there are more
+	 * formats listed than supported by the driver, the native format
+	 * is not supported by the conversion helpers. Therefore *only*
+	 * support the native format and add a conversion helper ASAP.
+	 */
+	if (drm_WARN_ONCE(dev, i != sdev->nformats,
+			  "format conversion helpers required for %p4cc",
+			  &sdev->format->format)) {
+		sdev->nformats = 1;
+	}
+
+out:
+	*nformats_out = sdev->nformats;
+	return sdev->formats;
+}
+
+static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
+{
+	struct drm_device *dev = &sdev->dev;
+	struct drm_display_mode *mode = &sdev->mode;
+	struct drm_connector *connector = &sdev->connector;
+	struct drm_simple_display_pipe *pipe = &sdev->pipe;
+	const uint32_t *formats;
+	size_t nformats;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = mode->hdisplay;
+	dev->mode_config.max_width = mode->hdisplay;
+	dev->mode_config.min_height = mode->vdisplay;
+	dev->mode_config.max_height = mode->vdisplay;
+	dev->mode_config.prefer_shadow_fbdev = true;
+	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
+	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
+
+	ret = drm_connector_init(dev, connector, &simpledrm_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
+
+	formats = simpledrm_device_formats(sdev, &nformats);
+
+	ret = drm_simple_display_pipe_init(dev, pipe, &simpledrm_simple_display_pipe_funcs,
+					   formats, nformats, simpledrm_format_modifiers,
+					   connector);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(dev);
+
+	return 0;
+}
+
+/*
+ * Init / Cleanup
+ */
+
+static struct simpledrm_device *
+simpledrm_device_create(struct drm_driver *drv, struct platform_device *pdev)
+{
+	struct simpledrm_device *sdev;
+	int ret;
+
+	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device,
+				  dev);
+	if (IS_ERR(sdev))
+		return ERR_CAST(sdev);
+	sdev->pdev = pdev;
+	platform_set_drvdata(pdev, sdev);
+
+	ret = simpledrm_device_init_fb(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_init_mm(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_init_modeset(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return sdev;
+}
+
+/*
+ * DRM driver
+ */
+
+DEFINE_DRM_GEM_FOPS(simpledrm_fops);
+
+static struct drm_driver simpledrm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &simpledrm_fops,
+};
+
+/*
+ * Platform driver
+ */
+
+static int simpledrm_probe(struct platform_device *pdev)
+{
+	struct simpledrm_device *sdev;
+	struct drm_device *dev;
+	int ret;
+
+	sdev = simpledrm_device_create(&simpledrm_driver, pdev);
+	if (IS_ERR(sdev))
+		return PTR_ERR(sdev);
+	dev = &sdev->dev;
+
+	ret = drm_dev_register(dev, 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int simpledrm_remove(struct platform_device *pdev)
+{
+	struct simpledrm_device *sdev = platform_get_drvdata(pdev);
+	struct drm_device *dev = &sdev->dev;
+
+	drm_dev_unregister(dev);
+
+	return 0;
+}
+
+static struct platform_driver simpledrm_platform_driver = {
+	.driver = {
+		.name = "simple-framebuffer", /* connect to sysfb */
+	},
+	.probe = simpledrm_probe,
+	.remove = simpledrm_remove,
+};
+
+module_platform_driver(simpledrm_platform_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4f02db65dede..5e1ad0c92bfc 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2192,7 +2192,7 @@ config FB_HYPERV
 
 config FB_SIMPLE
 	bool "Simple framebuffer support"
-	depends on (FB = y)
+	depends on (FB = y) && !DRM_SIMPLEDRM
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
