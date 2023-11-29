Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362637FDAA2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515AC10E223;
	Wed, 29 Nov 2023 14:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB110E576
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:39:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 78011CAA97
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:29:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C9F8FF80D;
 Wed, 29 Nov 2023 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1701268156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9cjw9jacJb4sQ3F7HewWk5K4/rPIhlFSrNIQ3jaELM=;
 b=Eoob8LGXdbu4WTht138nff3MM5yWgmoq53LUp2sVLMKrTI0GfATlgZApUZ9yVu2yhYn3dJ
 WpJ02ev0caZDiAAL7XV0OwcwTUWKyMNrzEeWTYNv2m/HtFwaS0sb99RofPvcVSyYUjB9lr
 GXz37n6dMPeoO6o6xxRngsXI45WvBHTUT5731aw6zZ1SceYD9X00bnXDBsr6J4GkKgFQYA
 /81w9ND7IMq8aPLcuYSzNXgMz/WZnVOvfg2G8dPxQ/U7mZXjDGpGdOVBJJUhN9y6xySg70
 rDGYZmrkf+X56HmjCbtnBD52h0y6HZEHivYF0u1ThMUmqboVWH6fbRBFjxR49g==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org
Subject: [PATCH 2/2] drm/tiny: Add driver for the sharp LS027B7DH01 Memory LCD
Date: Wed, 29 Nov 2023 15:29:10 +0100
Message-ID: <71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701267411.git.mehdi.djait@bootlin.com>
References: <cover.1701267411.git.mehdi.djait@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com
X-Mailman-Approved-At: Wed, 29 Nov 2023 14:58:47 +0000
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
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul.kocialkowski@bootlin.com, geert@linux-m68k.org,
 thomas.petazzoni@bootlin.com, Mehdi Djait <mehdi.djait@bootlin.com>,
 luca.ceresoli@bootlin.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a DRM driver for the sharp LS027B7DH01 Memory LCD.

LS027B7DH01 is a 2.7" 400x240 monochrome display connected to a SPI bus.
The drivers implements the Multiple Lines Data Update Mode.
External COM inversion is enabled using a PWM signal as input.

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
---
 MAINTAINERS                              |   7 +
 drivers/gpu/drm/tiny/Kconfig             |   8 +
 drivers/gpu/drm/tiny/Makefile            |   1 +
 drivers/gpu/drm/tiny/sharp-ls027b7dh01.c | 411 +++++++++++++++++++++++
 4 files changed, 427 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/sharp-ls027b7dh01.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 012df8ccf34e..fb859698bd3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6832,6 +6832,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SHARP LS027B7DH01 Memory LCD
+M:	Mehdi Djait <mehdi.djait@bootlin.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/sharp,ls027b7dh01.yaml
+F:	drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..a2ade06403ca 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -186,6 +186,14 @@ config TINYDRM_REPAPER
 
 	  If M is selected the module will be called repaper.
 
+config TINYDRM_SHARP_LS027B7DH01
+	tristate "DRM support for SHARP LS027B7DH01 display"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	help
+	  DRM driver for the SHARP LS027B7DD01 LCD display.
+
 config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a044b..b05df3afb231 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
+obj-$(CONFIG_TINYDRM_SHARP_LS027B7DH01)	+= sharp-ls027b7dh01.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c b/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
new file mode 100644
index 000000000000..2f58865a5c78
--- /dev/null
+++ b/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sharp LS027B7DH01 Memory Display Driver
+ *
+ * Copyright (C) 2023 Andrew D'Angelo
+ * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
+ *
+ * The Sharp Memory LCD requires an alternating signal to prevent the buildup of
+ * a DC bias that would result in a Display that no longer can be updated. Two
+ * modes for the generation of this signal are supported:
+ *
+ * Software, EXTMODE = Low: toggling the BIT(1) of the Command and writing it at
+ * least once a second to the display.
+ *
+ * Hardware, EXTMODE = High: the alternating signal should be supplied on the
+ * EXTCOMIN pin.
+ *
+ * In this driver the Hardware mode is implemented with a PWM signal.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/pwm.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#define CMD_WRITE BIT(0)
+#define CMD_CLEAR BIT(2)
+
+struct sharp_ls027b7dh01 {
+	struct spi_device *spi;
+
+	struct drm_device drm;
+	struct drm_connector connector;
+	struct drm_simple_display_pipe pipe;
+	const struct drm_display_mode *display_mode;
+
+	struct gpio_desc *enable_gpio;
+	struct pwm_device *extcomin_pwm;
+
+	u8 *write_buf;
+};
+
+static inline struct sharp_ls027b7dh01 *drm_to_priv(struct drm_device *drm)
+{
+	return container_of(drm, struct sharp_ls027b7dh01, drm);
+}
+
+/**
+ * sharp_ls027b7dh01_add_headers - Add the Sharp LS027B7DH01 specific headers
+ * @write_buf: Buffer to write
+ * @clip: DRM clip rectangle area to write
+ * @dst_pitch: Pitch of the write buffer
+ *
+ * This function adds the SHARP LS027B7DH01 specific headers to the buffer for
+ * the Multiple Lines Write Mode:
+ * - The first byte will contain the write command.
+ * - Every line data starts with the line number and ends with a dummy zero
+ *   trailer byte. It should be noted here that the line numbers are indexed
+ *   from 1.
+ *
+ * Returns the size of the buffer to write to the display.
+ */
+static size_t sharp_ls027b7dh01_add_headers(u8 *write_buf,
+					    const struct drm_rect *clip,
+					    const unsigned int dst_pitch)
+{
+	u8 line_num = clip->y1 + 1;
+	unsigned int lines = drm_rect_height(clip);
+	unsigned int y;
+
+	write_buf[0] = CMD_WRITE;
+	write_buf[1] = line_num++;
+
+	for (y = 1; y < lines; y++) {
+		write_buf[y * dst_pitch] = 0;
+		write_buf[y * dst_pitch + 1] = line_num++;
+	}
+
+	write_buf[lines * dst_pitch] = 0;
+	write_buf[lines * dst_pitch + 1] = 0;
+
+	return lines * dst_pitch + 2;
+}
+
+static int sharp_ls027b7dh01_prepare_buf(struct sharp_ls027b7dh01 *priv,
+					 u8 *write_buf,
+					 size_t *data_len,
+					 struct drm_framebuffer *fb,
+					 const struct drm_rect *clip)
+{
+	struct drm_gem_dma_object *dma_obj;
+	struct iosys_map dst, vmap;
+	unsigned int dst_pitch;
+	int ret;
+
+	/* Leave 2 bytes to hold the line number and the trailer dummy byte. */
+	dst_pitch = (drm_rect_width(clip) / 8) + 2;
+
+	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	iosys_map_set_vaddr(&dst, &write_buf[2]);
+	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
+
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, clip);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+	*data_len = sharp_ls027b7dh01_add_headers(write_buf, clip, dst_pitch);
+
+	return 0;
+}
+
+static int sharp_ls027b7dh01_fb_damaged(struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct drm_rect clip;
+	struct sharp_ls027b7dh01 *priv;
+	size_t data_len;
+	int drm_index;
+	int ret;
+
+	clip.x1 = 0;
+	clip.x2 = fb->width;
+	clip.y1 = rect->y1;
+	clip.y2 = rect->y2;
+
+	priv = drm_to_priv(fb->dev);
+
+	if (!drm_dev_enter(fb->dev, &drm_index))
+		return -ENODEV;
+
+	ret = sharp_ls027b7dh01_prepare_buf(priv, priv->write_buf, &data_len, fb, &clip);
+	if (ret)
+		goto exit;
+
+	ret = spi_write(priv->spi, priv->write_buf, data_len);
+
+exit:
+	drm_dev_exit(drm_index);
+
+	return ret;
+}
+
+static void sharp_ls027b7dh01_pipe_update(struct drm_simple_display_pipe *pipe,
+					  struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_rect rect;
+
+	if (!pipe->crtc.state->active)
+		return;
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+		sharp_ls027b7dh01_fb_damaged(state->fb, &rect);
+}
+
+static void sharp_ls027b7dh01_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct sharp_ls027b7dh01 *priv;
+
+	priv = drm_to_priv(pipe->crtc.dev);
+	gpiod_set_value(priv->enable_gpio, 0);
+}
+
+static int sharp_ls027b7dh01_clear_display(struct sharp_ls027b7dh01 *priv)
+{
+	u8 clear_buf[2] = { CMD_CLEAR, 0 };
+
+	return spi_write(priv->spi, clear_buf, sizeof(clear_buf));
+}
+
+static int sharp_ls027b7dh01_pwm_enable(struct sharp_ls027b7dh01 *priv)
+{
+	struct device *dev = &priv->spi->dev;
+	struct pwm_state pwmstate;
+
+	priv->extcomin_pwm = devm_pwm_get(dev, NULL);
+	if (IS_ERR(priv->extcomin_pwm)) {
+		dev_err(dev, "Could not get EXTCOMIN pwm\n");
+		return PTR_ERR(priv->extcomin_pwm);
+	}
+
+	pwm_init_state(priv->extcomin_pwm, &pwmstate);
+	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
+	pwm_apply_state(priv->extcomin_pwm, &pwmstate);
+
+	pwm_enable(priv->extcomin_pwm);
+
+	return 0;
+}
+
+static void sharp_ls027b7dh01_pipe_enable(struct drm_simple_display_pipe *pipe,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_plane_state *plane_state)
+{
+	struct sharp_ls027b7dh01 *priv;
+	int ret, drm_idx;
+
+	priv = drm_to_priv(pipe->crtc.dev);
+
+	if (!drm_dev_enter(pipe->crtc.dev, &drm_idx))
+		return;
+
+	gpiod_set_value(priv->enable_gpio, 1);
+
+	ret = sharp_ls027b7dh01_clear_display(priv);
+	if (ret)
+		goto exit;
+
+	sharp_ls027b7dh01_pwm_enable(priv);
+
+exit:
+	drm_dev_exit(drm_idx);
+}
+
+static const struct drm_simple_display_pipe_funcs sharp_ls027b7dh01_pipe_funcs = {
+	.enable = sharp_ls027b7dh01_pipe_enable,
+	.disable = sharp_ls027b7dh01_pipe_disable,
+	.update = sharp_ls027b7dh01_pipe_update,
+};
+
+static int sharp_ls027b7dh01_connector_get_modes(struct drm_connector *connector)
+{
+	struct sharp_ls027b7dh01 *priv = drm_to_priv(connector->dev);
+
+	return drm_connector_helper_get_modes_fixed(connector, priv->display_mode);
+}
+
+static const struct drm_connector_helper_funcs sharp_ls027b7dh01_connector_hfuncs = {
+	.get_modes = sharp_ls027b7dh01_connector_get_modes,
+};
+
+static const struct drm_connector_funcs sharp_ls027b7dh01_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_mode_config_funcs sharp_ls027b7dh01_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint32_t sharp_ls027b7dh01_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_display_mode sharp_ls027b7dh01_mode = {
+	DRM_SIMPLE_MODE(400, 240, 59, 35),
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(sharp_ls027b7dh01_fops);
+
+static const struct drm_driver sharp_ls027b7dh01_drm_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &sharp_ls027b7dh01_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	.name			= "sharp_ls027b7dh01",
+	.desc			= "Sharp ls027b7dh01 Memory LCD",
+	.date			= "20231129",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static int sharp_ls027b7dh01_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct sharp_ls027b7dh01 *priv;
+	struct drm_device *drm;
+	unsigned int write_buf_size;
+	int ret;
+
+	if (!dev->coherent_dma_mask) {
+		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to set dma mask\n");
+	}
+
+	priv = devm_drm_dev_alloc(dev, &sharp_ls027b7dh01_drm_driver,
+				  struct sharp_ls027b7dh01, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	spi_set_drvdata(spi, priv);
+	priv->spi = spi;
+
+	priv->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->enable_gpio),
+				     "Failed to get GPIO 'enable'\n");
+
+	drm = &priv->drm;
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.funcs = &sharp_ls027b7dh01_mode_config_funcs;
+	priv->display_mode = &sharp_ls027b7dh01_mode;
+
+	/*
+	 * write_buf_size:
+	 *
+	 * hdisplay * vdisplay / 8 => 1 bit per Pixel.
+	 * 2 * vdisplay => line number byte + trailer dummy byte for every line.
+	 * 2 => write command byte + final trailer dummy byte.
+	 */
+	write_buf_size = priv->display_mode->hdisplay * priv->display_mode->vdisplay / 8
+			 + 2 * priv->display_mode->vdisplay + 2;
+
+	priv->write_buf = devm_kzalloc(dev, write_buf_size, GFP_KERNEL);
+	if (!priv->write_buf)
+		return -ENOMEM;
+
+	drm->mode_config.min_width = priv->display_mode->hdisplay;
+	drm->mode_config.max_width = priv->display_mode->hdisplay;
+	drm->mode_config.min_height = priv->display_mode->vdisplay;
+	drm->mode_config.max_height = priv->display_mode->vdisplay;
+
+	ret = drm_connector_init(drm, &priv->connector,
+				 &sharp_ls027b7dh01_connector_funcs,
+				 DRM_MODE_CONNECTOR_SPI);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(&priv->connector,
+				 &sharp_ls027b7dh01_connector_hfuncs);
+
+	ret = drm_simple_display_pipe_init(drm, &priv->pipe,
+					   &sharp_ls027b7dh01_pipe_funcs,
+					   sharp_ls027b7dh01_formats,
+					   ARRAY_SIZE(sharp_ls027b7dh01_formats),
+					   NULL, &priv->connector);
+	if (ret)
+		return ret;
+
+	drm_plane_enable_fb_damage_clips(&priv->pipe.plane);
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static void sharp_ls027b7dh01_remove(struct spi_device *spi)
+{
+	struct sharp_ls027b7dh01 *priv = spi_get_drvdata(spi);
+
+	drm_dev_unplug(&priv->drm);
+	drm_atomic_helper_shutdown(&priv->drm);
+}
+
+static void sharp_ls027b7dh01_shutdown(struct spi_device *spi)
+{
+	struct sharp_ls027b7dh01 *priv = spi_get_drvdata(spi);
+
+	drm_atomic_helper_shutdown(&priv->drm);
+}
+
+static const struct spi_device_id sharp_ls027b7dh01_ids[] = {
+	{ "ls027b7dh01" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, sharp_ls027b7dh01_ids);
+
+static const struct of_device_id sharp_ls027b7dh01_of_match[] = {
+	{ .compatible = "sharp,ls027b7dh01", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sharp_ls027b7dh01_of_match);
+
+static struct spi_driver sharp_ls027b7dh01_spi_driver = {
+	.probe = sharp_ls027b7dh01_probe,
+	.remove = sharp_ls027b7dh01_remove,
+	.shutdown = sharp_ls027b7dh01_shutdown,
+	.id_table = sharp_ls027b7dh01_ids,
+	.driver = {
+		.name = "sharp-ls027b7dh01",
+		.of_match_table = sharp_ls027b7dh01_of_match,
+	},
+};
+module_spi_driver(sharp_ls027b7dh01_spi_driver);
+
+MODULE_AUTHOR("Andrew D'Angelo");
+MODULE_AUTHOR("Mehdi Djait <mehdi.djait@bootlin.com>");
+MODULE_DESCRIPTION("Sharp LS027B7DH01 Driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0

