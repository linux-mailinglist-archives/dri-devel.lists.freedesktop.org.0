Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016424F2C2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A777D6EC64;
	Mon, 24 Aug 2020 06:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080D36E49F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598113992; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PRTP+GttRbJXj9uz8wD1O1UnEM1+wUPJ8xznVdIxxk=;
 b=BriWF3t3gW5FkF2IqXWbsYeCpqQ/5n0rASe4pX7rDxQEKZW+mVDt+O8OtdJgkak105fOag
 kWLVuTMcGVJpsL7V6dSOOI0cUc2L52UAQwWQh9l6Zhi0luER5v56qeC3XoHKYZgRY45nOL
 tUsLPw0hdK5PPZ2QLFnyJK+tjB2Op8A=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Noralf Tronnes <noralf@tronnes.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 4/6] drm/tiny: Add TinyDRM for DSI/DBI panels
Date: Sat, 22 Aug 2020 18:32:48 +0200
Message-Id: <20200822163250.63664-5-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-1-paul@crapouillou.net>
References: <20200822163250.63664-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new API function mipi_dsi_maybe_register_tiny_driver() is supposed
to be called by DSI/DBI panel drivers at the end of their probe.

If it is detected that the panel is not connected to any controller,
because it has no port #0 node in Device Tree that points back to it,
then a TinyDRM driver is registered with it.

This TinyDRM driver expects that a DCS-compliant protocol is used by the
DSI/DBI panel and can only be used with these.

v2: No change

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/tiny/Kconfig    |   8 +
 drivers/gpu/drm/tiny/Makefile   |   1 +
 drivers/gpu/drm/tiny/tiny-dsi.c | 266 ++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h      |  19 +++
 4 files changed, 294 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/tiny-dsi.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 2b6414f0fa75..b62427b88dfe 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -28,6 +28,14 @@ config DRM_GM12U320
 	 This is a KMS driver for projectors which use the GM12U320 chipset
 	 for video transfer over USB2/3, such as the Acer C120 mini projector.
 
+config TINYDRM_DSI
+	tristate "DRM support for generic DBI/DSI display panels"
+	depends on DRM && DRM_MIPI_DSI
+	select DRM_MIPI_DBI
+	select DRM_KMS_CMA_HELPER
+	help
+	  DRM driver for generic DBI/DSI display panels
+
 config TINYDRM_HX8357D
 	tristate "DRM support for HX8357D display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 6ae4e9e5a35f..2bfee13347a5 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
+obj-$(CONFIG_TINYDRM_DSI)		+= tiny-dsi.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
 obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
diff --git a/drivers/gpu/drm/tiny/tiny-dsi.c b/drivers/gpu/drm/tiny/tiny-dsi.c
new file mode 100644
index 000000000000..b24d49836125
--- /dev/null
+++ b/drivers/gpu/drm/tiny/tiny-dsi.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * TinyDRM driver for standard DSI/DBI panels
+ *
+ * Copyright 2020 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/mipi_display.h>
+
+struct tiny_dsi {
+	struct drm_device drm;
+	struct drm_connector connector;
+	struct drm_simple_display_pipe pipe;
+
+	struct mipi_dsi_device *dsi;
+	struct drm_panel *panel;
+};
+
+#define mipi_dcs_command(dsi, cmd, seq...) \
+({ \
+	u8 d[] = { seq }; \
+	mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d)); \
+})
+
+static inline struct tiny_dsi *drm_to_tiny_dsi(struct drm_device *drm)
+{
+	return container_of(drm, struct tiny_dsi, drm);
+}
+
+static void tiny_dsi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
+{
+	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
+	struct tiny_dsi *priv = drm_to_tiny_dsi(fb->dev);
+	unsigned int height = rect->y2 - rect->y1;
+	unsigned int width = rect->x2 - rect->x1;
+	bool fb_convert;
+	int idx, ret;
+	void *tr;
+
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
+
+	fb_convert = width != fb->width || height != fb->height
+		|| fb->format->format == DRM_FORMAT_XRGB8888;
+	if (fb_convert) {
+		tr = kzalloc(width * height * 2, GFP_KERNEL);
+
+		/* TODO: swap pixels if needed */
+		ret = mipi_dbi_buf_copy(tr, fb, rect, false);
+		if (ret)
+			goto err_msg;
+	} else {
+		tr = cma_obj->vaddr;
+	}
+
+	mipi_dcs_command(priv->dsi, MIPI_DCS_SET_COLUMN_ADDRESS,
+			 (rect->x1 >> 8) & 0xff, rect->x1 & 0xff,
+			 (rect->x2 >> 8) & 0xff, rect->x2 & 0xff);
+	mipi_dcs_command(priv->dsi, MIPI_DCS_SET_PAGE_ADDRESS,
+			 (rect->y1 >> 8) & 0xff, rect->y1 & 0xff,
+			 (rect->y2 >> 8) & 0xff, rect->y2 & 0xff);
+
+	ret = mipi_dsi_dcs_write(priv->dsi, MIPI_DCS_WRITE_MEMORY_START,
+				 tr, width * height * 2);
+err_msg:
+	if (ret)
+		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+
+	if (fb_convert)
+		kfree(tr);
+	drm_dev_exit(idx);
+}
+
+static void tiny_dsi_enable(struct drm_simple_display_pipe *pipe,
+			    struct drm_crtc_state *crtc_state,
+			    struct drm_plane_state *plane_state)
+{
+	struct tiny_dsi *priv = drm_to_tiny_dsi(pipe->crtc.dev);
+
+	drm_panel_enable(priv->panel);
+}
+
+static void tiny_dsi_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct tiny_dsi *priv = drm_to_tiny_dsi(pipe->crtc.dev);
+
+	drm_panel_disable(priv->panel);
+}
+
+static void tiny_dsi_update(struct drm_simple_display_pipe *pipe,
+			    struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_rect rect;
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+		tiny_dsi_fb_dirty(state->fb, &rect);
+}
+
+static const struct drm_simple_display_pipe_funcs tiny_dsi_pipe_funcs = {
+	.enable = tiny_dsi_enable,
+	.disable = tiny_dsi_disable,
+	.update = tiny_dsi_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static int tiny_dsi_connector_get_modes(struct drm_connector *connector)
+{
+	struct tiny_dsi *priv = drm_to_tiny_dsi(connector->dev);
+
+	return drm_panel_get_modes(priv->panel, connector);
+}
+
+static const struct drm_connector_helper_funcs tiny_dsi_connector_hfuncs = {
+	.get_modes = tiny_dsi_connector_get_modes,
+};
+
+static const struct drm_connector_funcs tiny_dsi_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const uint32_t tiny_dsi_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_mode_config_funcs tiny_dsi_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(tiny_dsi_fops);
+
+static struct drm_driver tiny_dsi_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.name			= "tiny-dsi",
+	.desc			= "Tiny DSI",
+	.date			= "20200605",
+	.major			= 1,
+	.minor			= 0,
+
+	.fops			= &tiny_dsi_fops,
+	DRM_GEM_CMA_DRIVER_OPS,
+};
+
+static void tiny_dsi_remove(void *drm)
+{
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+int mipi_dsi_register_tiny_driver(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct drm_device *drm;
+	struct tiny_dsi *priv;
+	static const uint64_t modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID
+	};
+	int ret;
+
+	/*
+	 * Even though it's not the SPI device that does DMA (the master does),
+	 * the dma mask is necessary for the dma_alloc_wc() in
+	 * drm_gem_cma_create(). The dma_addr returned will be a physical
+	 * address which might be different from the bus address, but this is
+	 * not a problem since the address will not be used.
+	 * The virtual address is used in the transfer and the SPI core
+	 * re-maps it on the SPI master device using the DMA streaming API
+	 * (spi_map_buf()).
+	 */
+	if (!dev->coherent_dma_mask) {
+		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_warn(dev, "Failed to set dma mask %d\n", ret);
+			return ret;
+		}
+	}
+
+	priv = devm_drm_dev_alloc(dev, &tiny_dsi_driver, struct tiny_dsi, drm);
+	if (!priv)
+		return ret;
+
+	priv->dsi = dsi;
+	drm = &priv->drm;
+
+	priv->panel = of_drm_find_panel(dev->of_node);
+	if (IS_ERR(priv->panel)) {
+		dev_err(dev, "Unable to find panel\n");
+		return PTR_ERR(priv->panel);
+	}
+
+	drm_mode_config_init(drm);
+
+	drm->mode_config.preferred_depth = 16;
+
+	drm->mode_config.funcs = &tiny_dsi_mode_config_funcs;
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = 4096;
+	drm->mode_config.max_height = 4096;
+
+	drm_connector_helper_add(&priv->connector, &tiny_dsi_connector_hfuncs);
+	ret = drm_connector_init(drm, &priv->connector, &tiny_dsi_connector_funcs,
+				 DRM_MODE_CONNECTOR_DSI);
+	if (ret) {
+		dev_err(dev, "Unable to init connector\n");
+		return ret;
+	}
+
+	ret = drm_simple_display_pipe_init(drm, &priv->pipe, &tiny_dsi_pipe_funcs,
+					   tiny_dsi_formats, ARRAY_SIZE(tiny_dsi_formats),
+					   modifiers, &priv->connector);
+	if (ret) {
+		dev_err(dev, "Unable to init display pipe\n");
+		return ret;
+	}
+
+	drm_plane_enable_fb_damage_clips(&priv->pipe.plane);
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		dev_err(dev, "Failed to register DRM driver\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, tiny_dsi_remove, drm);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mipi_dsi_register_tiny_driver);
+
+MODULE_DESCRIPTION("DSI/DBI TinyDRM driver");
+MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 802644c4c0c4..ee9538633943 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -10,6 +10,7 @@
 #define __DRM_MIPI_DSI_H__
 
 #include <linux/device.h>
+#include <linux/of_graph.h>
 
 struct mipi_dsi_host;
 struct mipi_dsi_device;
@@ -350,4 +351,22 @@ void mipi_dsi_driver_unregister(struct mipi_dsi_driver *driver);
 	module_driver(__mipi_dsi_driver, mipi_dsi_driver_register, \
 			mipi_dsi_driver_unregister)
 
+#if IS_ENABLED(CONFIG_TINYDRM_DSI)
+int mipi_dsi_register_tiny_driver(struct mipi_dsi_device *dsi);
+#else
+static inline int mipi_dsi_register_tiny_driver(struct mipi_dsi_device *dsi)
+{
+	return 0;
+}
+#endif
+
+static inline int mipi_dsi_maybe_register_tiny_driver(struct mipi_dsi_device *dsi)
+{
+	/* Register the TinyDRM DSI/DBI driver if the panel has no controller */
+	if (!of_graph_get_port_by_id(dsi->dev.of_node, 0))
+		return mipi_dsi_register_tiny_driver(dsi);
+
+	return 0;
+}
+
 #endif /* __DRM_MIPI_DSI__ */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
