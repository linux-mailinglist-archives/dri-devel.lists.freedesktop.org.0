Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0611F8FA7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8284A6E1EE;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8BC6E425
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 14:07:27 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s135so4814823pgs.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dp/+g93fmZ45LcVhHB+ZNuQwi9cW8+b2vd6N12wdyYk=;
 b=ZLlbRwizlWRvyyVPJ3P1ZzeTfRN/98yXeeCR22khn5O+CQmf5Pp8PeBjtUuiuWGhYP
 tSUaEFT0M6TTMjMFjXvLhIk12Fs41XozCcmPXztpg5KxG82VqFCfi0n7onf9+GAlF0L5
 a81ou3moKK7nGdh500BngR7LX4yoxRVddiw5i48/bLZLB8xBcTl6E9NYn9V2Bf/pqYDS
 47io5z7kPo4jU6G9GAHr1fVNHDMVp0dZ8IBqYnera60tl0tKSsCWllxGBUTKE1lWhsCT
 9xAU51PK3ydzSY8HAJjiYG8pjL6awSi0GYhDU11NeI9C2797PRO8uHzBXC3SBaiR502Y
 3rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dp/+g93fmZ45LcVhHB+ZNuQwi9cW8+b2vd6N12wdyYk=;
 b=b/dYSGaX4WxRbfESowpdsl155O2xmTUlrUTWM5A117rhmGE+xGjOMVvgq0OMJ13CTE
 II65Iu7ITyCpogOWk/DM+/jKkK+e/S6nUAwSngy0T/h82YQpWV8FkJdt+qUbAhxH1+07
 kgPuvYhd3a2A+rxbkcEkkN93qF441B1TB8qaCX+rURKg9DZFsSY81IbrZ4XnF08qbJC9
 ljnpHJt/FCUPldCFTxfM3G7iTs7ECE7r+YI5eF0T5dbkpv7OhiOhrtsxthaXIBgHfKSZ
 jxlY4lTB9V7gimHFPpu2fQrOqSVRCkT98CgFtIwpGZWu7WjzwsKZB1M3nrk6KaEvfZse
 OtRw==
X-Gm-Message-State: AOAM531d4w2iJ+Qlk0l4o4Bt9RrF17X4xodDH8N5dDjSPBRLKp/e0BVY
 wx0VCdqvBFcOcgefwSjKZK4=
X-Google-Smtp-Source: ABdhPJyJLTQKb67qMaM2ACOu6TcYkNxL/4WW8ig4jHv2X2iIfk81XTxP4vGezZ4PivGRgaZULt+sVg==
X-Received: by 2002:a63:4106:: with SMTP id o6mr14581499pga.369.1592057246505; 
 Sat, 13 Jun 2020 07:07:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
 by smtp.gmail.com with ESMTPSA id y26sm9220507pff.26.2020.06.13.07.07.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jun 2020 07:07:26 -0700 (PDT)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/tiny: add support for tft displays based on ilitek,
 ili9488
Date: Sat, 13 Jun 2020 19:37:16 +0530
Message-Id: <00719f68aca488a6476b0dda634617606b592823.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support fot ilitek,ili9488 based displays with 4 wire spi
interface. In 4 wire spi mode, ili9488 only supports 18 bit per pixel.

Eastrising,er-tft035-6 is a display based on ilitek,ili9488
with 4 wire spi interface.

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 MAINTAINERS                    |   7 +
 drivers/gpu/drm/tiny/Kconfig   |  13 ++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/ili9488.c | 446 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 467 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ili9488.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d59c5d3..6b062ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5329,6 +5329,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
+DRM DRIVER FOR ILITEK ILI9488 PANELS
+M:	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
+F:	drivers/gpu/drm/tiny/ili9488.c
+
 DRM DRIVER FOR INTEL I810 VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/i810/
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 2b6414f..a380a92 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -80,6 +80,19 @@ config TINYDRM_ILI9486
 
 	  If M is selected the module will be called ili9486.
 
+config TINYDRM_ILI9488
+	tristate "DRM support for ILI9488 display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the following Ilitek ILI9488 panels:
+	  * ER-TFT035-6 3.5" 320x480 TFT (EastRising 3.5")
+
+	  If M is selected the module will be called ili9488.
+
 config TINYDRM_MI0283QT
 	tristate "DRM support for MI0283QT"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 6ae4e9e5..3e40776 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
 obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
+obj-$(CONFIG_TINYDRM_ILI9488)		+= ili9488.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
diff --git a/drivers/gpu/drm/tiny/ili9488.c b/drivers/gpu/drm/tiny/ili9488.c
new file mode 100644
index 0000000..db3f585
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ili9488.c
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DRM driver for Ilitek ILI9488 panels
+ *
+ * Copyright 2020 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_rect.h>
+
+#define ILI9488_VCOM_CONTROL_1			0xC5
+#define ILI9488_COLUMN_ADDRESS_SET		0x2A
+#define ILI9488_PAGE_ADDRESS_SET		0x2B
+#define ILI9488_MEMORY_WRITE			0x2C
+#define ILI9488_POSITIVE_GAMMA_CORRECTION	0xE0
+#define ILI9488_NEGATIVE_GAMMA_CORRECTION	0xE1
+#define ILI9488_POWER_CONTROL_1			0xC0
+#define ILI9488_POWER_CONTROL_2			0xC1
+
+#define ILI9488_MEMORY_ACCESS_CONTROL		0x36
+#define ILI9488_COLMOD_PIXEL_FORMAT_SET		0x3A
+#define ILI9488_INTERFACE_MODE_CONTROL		0xB0
+#define ILI9488_FRAME_RATE_CONTROL_PARTIAL	0xB3
+#define ILI9488_DISPLAY_INVERSION_CONTROL	0xB4
+#define ILI9488_SET_IMAGE_FUNCTION		0xE9
+#define ILI9488_ADJUST_CONTROL_3		0xF7
+#define ILI9488_ADJUST_CONTROL_3		0xF7
+#define ILI9488_DISPLAY_ON			0x29
+#define ILI9488_DISPLAY_OFF			0x28
+#define ILI9488_ENTER_SLEEP_MODE		0x10
+#define ILI9488_DBI_BPP18			0x06
+#define ILI9488_DPI_BPP18			0x60
+#define ILI9488_FRAME_RATE_CONTROL_NORMAL	0xB1
+#define ILI9488_SLEEP_OUT			0x11
+
+#define ILI9488_MADCTL_BGR	BIT(3)
+#define ILI9488_MADCTL_MV	BIT(5)
+#define ILI9488_MADCTL_MX	BIT(6)
+#define ILI9488_MADCTL_MY	BIT(7)
+
+static void ili9488_rgb565_to_rgb666_line(u8 *dst, u16 *sbuf,
+					  unsigned int pixels)
+{
+	unsigned int x;
+
+	for (x = 0; x < pixels; x++) {
+		*dst++ = ((*sbuf & 0xF800) >> 8);
+		*dst++ = ((*sbuf & 0x07E0) >> 3);
+		*dst++ = ((*sbuf & 0x001F) << 3);
+		sbuf++;
+	}
+}
+
+static void ili9488_rgb565_to_rgb666(u8 *dst, void *vaddr,
+				     struct drm_framebuffer *fb,
+				     struct drm_rect *rect)
+{
+	size_t linepixels = rect->x2 - rect->x1;
+	size_t src_len = linepixels * sizeof(u16);
+	size_t dst_len = linepixels * 3;
+	unsigned int y, lines = rect->y2 - rect->y1;
+	u16 *sbuf;
+
+	/*
+	 * The cma memory is write-combined so reads are uncached.
+	 * Speed up by fetching one line at a time.
+	 */
+	sbuf = kmalloc(src_len, GFP_KERNEL);
+	if (!sbuf)
+		return;
+
+	vaddr += rect->y1 * fb->pitches[0] + rect->x1 * sizeof(u16);
+	for (y = 0; y < lines; y++) {
+		memcpy(sbuf, vaddr, src_len);
+		ili9488_rgb565_to_rgb666_line(dst, sbuf, linepixels);
+		vaddr += fb->pitches[0];
+		dst += dst_len;
+	}
+	kfree(sbuf);
+}
+
+static int ili9488_buf_copy(void *dst, struct drm_framebuffer *fb,
+			    struct drm_rect *rect)
+{
+	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct dma_buf_attachment *import_attach = cma_obj->base.import_attach;
+	struct drm_format_name_buf format_name;
+	void *src = cma_obj->vaddr;
+	int ret = 0;
+
+	if (import_attach) {
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
+					       DMA_FROM_DEVICE);
+		if (ret)
+			return ret;
+	}
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_RGB565:
+		ili9488_rgb565_to_rgb666(dst, src, fb, rect);
+		break;
+	default:
+		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
+			     drm_get_format_name(fb->format->format,
+						 &format_name));
+		return -EINVAL;
+	}
+
+	if (import_attach)
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf,
+					     DMA_FROM_DEVICE);
+	return ret;
+}
+
+static void ili9488_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
+{
+	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	int idx, ret = 0;
+	void *tr;
+	bool full;
+	unsigned int height = rect->y2 - rect->y1;
+	unsigned int width = rect->x2 - rect->x1;
+
+	if (!dbidev->enabled)
+		return;
+
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
+	full = width == fb->width && height == fb->height;
+
+	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id,
+		      DRM_RECT_ARG(rect));
+
+	/* Always invoke copy buffer routine as the display supports
+	 * only RGB666 format which is not implemented in DRM
+	 */
+	if (!dbi->dc || !full ||
+	    fb->format->format == DRM_FORMAT_RGB565) {
+		tr = dbidev->tx_buf;
+		ret = ili9488_buf_copy(dbidev->tx_buf, fb, rect);
+		if (ret)
+			goto err_msg;
+	} else {
+		tr = cma_obj->vaddr;
+	}
+
+	mipi_dbi_command(dbi, ILI9488_COLUMN_ADDRESS_SET,
+			 (rect->x1 >> 8) & 0xFF, rect->x1 & 0xFF,
+			 (rect->x2 >> 8) & 0xFF, (rect->x2 - 1) & 0xFF);
+
+	mipi_dbi_command(dbi, ILI9488_PAGE_ADDRESS_SET,
+			 (rect->y1 >> 8) & 0xFF, rect->y1 & 0xFF,
+			 (rect->y2 >> 8) & 0xFF, (rect->y2 - 1) & 0xFF);
+
+	ret = mipi_dbi_command_buf(dbi, ILI9488_MEMORY_WRITE, tr,
+				   width * height * 3);
+
+ err_msg:
+	if (ret)
+		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+
+	drm_dev_exit(idx);
+}
+
+static void ili9488_pipe_update(struct drm_simple_display_pipe *pipe,
+				struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_rect rect;
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+		ili9488_fb_dirty(state->fb, &rect);
+}
+
+static void ili9488_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	u8 addr_mode;
+	int ret, idx;
+	struct drm_rect rect = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	mipi_dbi_command(dbi, ILI9488_POSITIVE_GAMMA_CORRECTION,
+			 0x00, 0x03, 0x09, 0x08, 0x16,
+			 0x0a, 0x3f, 0x78, 0x4c, 0x09,
+			 0x0a, 0x08, 0x16, 0x1a, 0x0f);
+
+	mipi_dbi_command(dbi, ILI9488_NEGATIVE_GAMMA_CORRECTION,
+			 0x00, 0x16, 0x19, 0x03, 0x0f,
+			 0x05, 0x32, 0x45, 0x46, 0x04,
+			 0x0e, 0x0d, 0x35, 0x37, 0x0f);
+
+	mipi_dbi_command(dbi, ILI9488_POWER_CONTROL_1, 0x17, 0x15);
+
+	mipi_dbi_command(dbi, ILI9488_POWER_CONTROL_2, 0x41);
+
+	mipi_dbi_command(dbi, ILI9488_VCOM_CONTROL_1, 0x00, 0x12, 0x80);
+
+	mipi_dbi_command(dbi, ILI9488_COLMOD_PIXEL_FORMAT_SET,
+			 ILI9488_DBI_BPP18 | ILI9488_DPI_BPP18);
+
+	mipi_dbi_command(dbi, ILI9488_INTERFACE_MODE_CONTROL, 0x80);
+
+	mipi_dbi_command(dbi, ILI9488_FRAME_RATE_CONTROL_NORMAL, 0xa0);
+
+	mipi_dbi_command(dbi, ILI9488_DISPLAY_INVERSION_CONTROL, 0x02);
+
+	mipi_dbi_command(dbi, ILI9488_SET_IMAGE_FUNCTION, 0x00);
+
+	mipi_dbi_command(dbi, ILI9488_ADJUST_CONTROL_3,
+			 0xa9, 0x51, 0x2c, 0x82);
+
+	mipi_dbi_command(dbi, ILI9488_SLEEP_OUT);
+
+	msleep(120);
+
+	mipi_dbi_command(dbi, ILI9488_DISPLAY_ON);
+
+	dbidev->enabled = true;
+	ili9488_fb_dirty(fb, &rect);
+
+ out_enable:
+	switch (dbidev->rotation) {
+	default:
+		addr_mode = ILI9488_MADCTL_MX;
+		break;
+	case 90:
+		addr_mode = ILI9488_MADCTL_MV;
+		break;
+	case 180:
+		addr_mode = ILI9488_MADCTL_MY;
+		break;
+	case 270:
+		addr_mode = ILI9488_MADCTL_MV | ILI9488_MADCTL_MY |
+			ILI9488_MADCTL_MX;
+		break;
+	}
+	addr_mode |= ILI9488_MADCTL_BGR;
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+ out_exit:
+	drm_dev_exit(idx);
+}
+
+static void ili9488_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+
+	/*
+	 * This callback is not protected by drm_dev_enter/exit since we want to
+	 * turn off the display on regular driver unload. It's highly unlikely
+	 * that the underlying SPI controller is gone should this be called
+	 * after unplug.
+	 */
+
+	DRM_DEBUG_KMS("\n");
+
+	if (!dbidev->enabled)
+		return;
+
+	mipi_dbi_command(&dbidev->dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	dbidev->enabled = false;
+}
+
+static const u32 ili9488_formats[] = {
+	DRM_FORMAT_RGB565,
+};
+
+static const struct drm_simple_display_pipe_funcs ili9488_pipe_funcs = {
+	.enable = ili9488_pipe_enable,
+	.disable = ili9488_pipe_disable,
+	.update = ili9488_pipe_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_display_mode ili9488_mode = {
+	DRM_SIMPLE_MODE(320, 480, 49, 73),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(ili9488_fops);
+
+static struct drm_driver ili9488_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &ili9488_fops,
+	DRM_GEM_CMA_DRIVER_OPS_VMAP,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "ili9488",
+	.desc			= "Ilitek ILI9488",
+	.date			= "20200607",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static const struct of_device_id ili9488_of_match[] = {
+	{ .compatible = "eastrising,er-tft035-6" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ili9488_of_match);
+
+static const struct spi_device_id ili9488_id[] = {
+	{ "er-tft035-6", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9488_id);
+
+static int ili9488_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation = 0;
+	size_t bufsize;
+	int ret;
+
+	dbidev = devm_drm_dev_alloc(dev, &ili9488_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	ret = devm_drm_dev_init(dev, drm, &ili9488_driver);
+	if (ret) {
+		kfree(dbidev);
+		return ret;
+	}
+
+	drm_mode_config_init(drm);
+
+	bufsize = ili9488_mode.vdisplay * ili9488_mode.hdisplay * 3;
+
+	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
+		return PTR_ERR(dc);
+	}
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	dbidev->drm.mode_config.preferred_depth = 16;
+
+	ret = mipi_dbi_dev_init_with_formats(dbidev, &ili9488_pipe_funcs,
+					     ili9488_formats,
+					     ARRAY_SIZE(ili9488_formats),
+					     &ili9488_mode, rotation, bufsize);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static int ili9488_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static void ili9488_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver ili9488_spi_driver = {
+	.driver = {
+		.name = "ili9488",
+		.owner = THIS_MODULE,
+		.of_match_table = ili9488_of_match,
+	},
+	.id_table = ili9488_id,
+	.probe = ili9488_probe,
+	.remove = ili9488_remove,
+	.shutdown = ili9488_shutdown,
+};
+module_spi_driver(ili9488_spi_driver);
+
+MODULE_DESCRIPTION("Ilitek ILI9488 DRM driver");
+MODULE_AUTHOR("Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
