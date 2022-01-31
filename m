Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77A4A501C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268E210E43B;
	Mon, 31 Jan 2022 20:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8110E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643660972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+2g0otjXwOqLTEuTDhkNGJDtDYRKNXUs5KMHfhyu5S8=;
 b=FkL0bUE8wgp3suPAHKCLm8HQQpCM1mBhFya3l/mJAT93EdBYXbX5MWArZSOr9oPWcR97c9
 fKRZd60a0F+rRhO+S0bYCScVVNViMD+bE6LxAsDAhLC++xwtdSo6fWO/abrmmEAEP+JVvo
 EYagSzULoaVB8P596UMSVd+Hc8Z9lbc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-SLTvv_cUPJSe7G5WbkCL5g-1; Mon, 31 Jan 2022 15:29:28 -0500
X-MC-Unique: SLTvv_cUPJSe7G5WbkCL5g-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso143839wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+2g0otjXwOqLTEuTDhkNGJDtDYRKNXUs5KMHfhyu5S8=;
 b=qVGnPvOKuAz4MyO8jlgcn51BPSOE/xGJDfBHcd869+fnMacT3CNUijoCeRVJd/I8Wh
 YwGDrNk92Fb/pZm2pWnDHzC0HvI4AdsCcDyc4o98U9fupFif7p/TPsp7ft0uItywxTBy
 JRQw464oPWKCGo2bwI9NMdElD3fJLB78Vh+TVPD7bv3Km9KWpn4dn/p4D+uMDi1lfUe1
 xxc4tqJ02dLEPieP1S+dtyGxI9Fw+mtDISSvVx6JRKn0dp3746MVibBPWcoKlJZvfpj6
 DgBuWGXurD2RokBXUVjQL8kFbkfRntUppTNfU+vPYZybLZXEstC5dt/vMKTVxBVF1jVx
 vukw==
X-Gm-Message-State: AOAM531/a++T/IyReJH1+SoPRQMHKWejQ7ysq7iD5RqUh/ljcq0YjQjS
 b4Jr5Yp/5Lj2lYjy+nD3I/vkD0A4EAc2MryueyDzAarR0kZ52s3l6IPacsP87jozdNBbdEorN+6
 YBgTM+Ts+fm1KZe9WD6BzbsRQTQjU
X-Received: by 2002:a5d:664f:: with SMTP id f15mr18480049wrw.452.1643660966850; 
 Mon, 31 Jan 2022 12:29:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwX7ot0YeZZFcaflBssKWSZAvm0dMeEBHwhv2Hg94wwfOIq+tcCEL78EmelluFYdbL5+OnDjQ==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr18480029wrw.452.1643660966491; 
 Mon, 31 Jan 2022 12:29:26 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p7sm309262wmq.20.2022.01.31.12.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:29:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Date: Mon, 31 Jan 2022 21:29:16 +0100
Message-Id: <20220131202916.2374502-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon OLED
controllers that can be programmed via an I2C interface. This is a port
of the ssd1307fb driver that already supports these devices.

A Device Tree binding is not added because the DRM driver is compatible
with the existing binding for the ssd1307fb driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/tiny/Kconfig   |  12 +
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/ssd1307.c | 976 +++++++++++++++++++++++++++++++++
 3 files changed, 989 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ssd1307.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 712e0004e96e..25c9c013bcda 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -157,6 +157,18 @@ config TINYDRM_REPAPER
 
 	  If M is selected the module will be called repaper.
 
+config TINYDRM_SSD1307
+	tristate "DRM support for Solomon SSD1307 OLED displays"
+	depends on DRM && I2C
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
+	  OLED controllers that can be programmed via an I2C interface.
+
+	  If M is selected the module will be called ssd1307.
+
 config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 5d5505d40e7b..38c4c1111e96 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -12,5 +12,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
+obj-$(CONFIG_TINYDRM_SSD1307)		+= ssd1307.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/ssd1307.c b/drivers/gpu/drm/tiny/ssd1307.c
new file mode 100644
index 000000000000..4ea223674587
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ssd1307.c
@@ -0,0 +1,976 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Solomon SSD1307 OLED displays
+ *
+ * Copyright 2022 Red Hat Inc.
+ *
+ * Based on drivers/video/fbdev/ssd1307fb.c
+ * Copyright 2012 Free Electrons
+ *
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/pwm.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_rect.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#define DRIVER_NAME	"ssd1307"
+#define DRIVER_DESC	"DRM driver for Solomon SSD1307 OLED displays"
+#define DRIVER_DATE	"20220131"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+#define SSD1307_DATA				0x40
+#define SSD1307_COMMAND			0x80
+
+#define SSD1307_SET_ADDRESS_MODE		0x20
+#define SSD1307_SET_ADDRESS_MODE_HORIZONTAL	(0x00)
+#define SSD1307_SET_ADDRESS_MODE_VERTICAL	(0x01)
+#define SSD1307_SET_ADDRESS_MODE_PAGE		(0x02)
+#define SSD1307_SET_COL_RANGE			0x21
+#define SSD1307_SET_PAGE_RANGE			0x22
+#define SSD1307_CONTRAST			0x81
+#define SSD1307_SET_LOOKUP_TABLE		0x91
+#define SSD1307_CHARGE_PUMP			0x8d
+#define SSD1307_SEG_REMAP_ON			0xa1
+#define SSD1307_DISPLAY_OFF			0xae
+#define SSD1307_SET_MULTIPLEX_RATIO		0xa8
+#define SSD1307_DISPLAY_ON			0xaf
+#define SSD1307_START_PAGE_ADDRESS		0xb0
+#define SSD1307_SET_DISPLAY_OFFSET		0xd3
+#define SSD1307_SET_CLOCK_FREQ			0xd5
+#define SSD1307_SET_AREA_COLOR_MODE		0xd8
+#define SSD1307_SET_PRECHARGE_PERIOD		0xd9
+#define SSD1307_SET_COM_PINS_CONFIG		0xda
+#define SSD1307_SET_VCOMH			0xdb
+
+#define MAX_CONTRAST 255
+
+struct ssd1307_deviceinfo {
+	u32 default_vcomh;
+	u32 default_dclk_div;
+	u32 default_dclk_frq;
+	int need_pwm;
+	int need_chargepump;
+};
+
+struct ssd1307_device {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	struct drm_display_mode mode;
+	struct drm_connector connector;
+	struct i2c_client *client;
+
+	const struct ssd1307_deviceinfo *device_info;
+
+	unsigned area_color_enable : 1;
+	unsigned com_invdir : 1;
+	unsigned com_lrremap : 1;
+	unsigned com_seq : 1;
+	unsigned lookup_table_set : 1;
+	unsigned low_power : 1;
+	unsigned seg_remap : 1;
+	u32 com_offset;
+	u32 contrast;
+	u32 dclk_div;
+	u32 dclk_frq;
+	u32 height;
+	u8 lookup_table[4];
+	u32 page_offset;
+	u32 col_offset;
+	u32 prechargep1;
+	u32 prechargep2;
+
+	struct backlight_device *bl_dev;
+	struct pwm_device *pwm;
+	struct gpio_desc *reset;
+	struct regulator *vbat_reg;
+	u32 vcomh;
+	u32 width;
+	/* Cached address ranges */
+	u8 col_start;
+	u8 col_end;
+	u8 page_start;
+	u8 page_end;
+};
+
+struct ssd1307_array {
+	u8	type;
+	u8	data[];
+};
+
+static inline struct ssd1307_device *drm_to_ssd1307(struct drm_device *drm)
+{
+	return container_of(drm, struct ssd1307_device, drm);
+}
+
+static struct ssd1307_array *ssd1307_alloc_array(u32 len, u8 type)
+{
+	struct ssd1307_array *array;
+
+	array = kzalloc(sizeof(struct ssd1307_array) + len, GFP_KERNEL);
+	if (!array)
+		return NULL;
+
+	array->type = type;
+
+	return array;
+}
+
+static int ssd1307_write_array(struct i2c_client *client,
+			       struct ssd1307_array *array, u32 len)
+{
+	int ret;
+
+	len += sizeof(struct ssd1307_array);
+
+	ret = i2c_master_send(client, (u8 *)array, len);
+	if (ret != len) {
+		dev_err(&client->dev, "Couldn't send I2C command.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static inline int ssd1307_write_cmd(struct i2c_client *client, u8 cmd)
+{
+	struct ssd1307_array *array;
+	int ret;
+
+	array = ssd1307_alloc_array(1, SSD1307_COMMAND);
+	if (!array)
+		return -ENOMEM;
+
+	array->data[0] = cmd;
+
+	ret = ssd1307_write_array(client, array, 1);
+	kfree(array);
+
+	return ret;
+}
+
+static int ssd1307_set_col_range(struct ssd1307_device *ssd1307,
+				 u8 col_start, u8 cols)
+{
+	u8 col_end = col_start + cols - 1;
+	int ret;
+
+	if (col_start == ssd1307->col_start && col_end == ssd1307->col_end)
+		return 0;
+
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_COL_RANGE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, col_start);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, col_end);
+	if (ret < 0)
+		return ret;
+
+	ssd1307->col_start = col_start;
+	ssd1307->col_end = col_end;
+	return 0;
+}
+
+static int ssd1307_set_page_range(struct ssd1307_device *ssd1307,
+				  u8 page_start, u8 pages)
+{
+	u8 page_end = page_start + pages - 1;
+	int ret;
+
+	if (page_start == ssd1307->page_start && page_end == ssd1307->page_end)
+		return 0;
+
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_PAGE_RANGE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, page_start);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, page_end);
+	if (ret < 0)
+		return ret;
+
+	ssd1307->page_start = page_start;
+	ssd1307->page_end = page_end;
+	return 0;
+}
+
+static int ssd1307_update_display(struct ssd1307_device *ssd1307, u8 *buf,
+				  u32 width, u32 height)
+{
+	struct ssd1307_array *array;
+	unsigned int line_length = DIV_ROUND_UP(width, 8);
+	unsigned int pages = DIV_ROUND_UP(height, 8);
+	u32 array_idx = 0;
+	int ret, i, j, k;
+
+	array = ssd1307_alloc_array(width * pages, SSD1307_DATA);
+	if (!array)
+		return -ENOMEM;
+
+	/*
+	 * The screen is divided in pages, each having a height of 8
+	 * pixels, and the width of the screen. When sending a byte of
+	 * data to the controller, it gives the 8 bits for the current
+	 * column. I.e, the first byte are the 8 bits of the first
+	 * column, then the 8 bits for the second column, etc.
+	 *
+	 *
+	 * Representation of the screen, assuming it is 5 bits
+	 * wide. Each letter-number combination is a bit that controls
+	 * one pixel.
+	 *
+	 * A0 A1 A2 A3 A4
+	 * B0 B1 B2 B3 B4
+	 * C0 C1 C2 C3 C4
+	 * D0 D1 D2 D3 D4
+	 * E0 E1 E2 E3 E4
+	 * F0 F1 F2 F3 F4
+	 * G0 G1 G2 G3 G4
+	 * H0 H1 H2 H3 H4
+	 *
+	 * If you want to update this screen, you need to send 5 bytes:
+	 *  (1) A0 B0 C0 D0 E0 F0 G0 H0
+	 *  (2) A1 B1 C1 D1 E1 F1 G1 H1
+	 *  (3) A2 B2 C2 D2 E2 F2 G2 H2
+	 *  (4) A3 B3 C3 D3 E3 F3 G3 H3
+	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
+	 */
+
+	ret = ssd1307_set_col_range(ssd1307, ssd1307->col_offset, width);
+	if (ret < 0)
+		goto out_free;
+
+	ret = ssd1307_set_page_range(ssd1307, ssd1307->page_offset / 8, pages);
+	if (ret < 0)
+		goto out_free;
+
+	for (i = 0; i < pages; i++) {
+		int m = 8;
+
+		/* Last page may be partial */
+		if (8 * (i + 1) > ssd1307->height)
+			m = ssd1307->height % 8;
+		for (j = 0; j < width; j++) {
+			u8 data = 0;
+
+			for (k = 0; k < m; k++) {
+				u8 byte = buf[(8 * i + k) * line_length +
+					       j / 8];
+				u8 bit = (byte >> (j % 8)) & 1;
+
+				data |= bit << k;
+			}
+			array->data[array_idx++] = data;
+		}
+	}
+
+	ret = ssd1307_write_array(ssd1307->client, array, width * pages);
+
+out_free:
+	kfree(array);
+	return ret;
+}
+
+static void ssd1307_clear_screen(struct ssd1307_device *ssd1307, u32 width, u32 height)
+{
+	u8 *buf = NULL;
+
+	buf = kmalloc_array(width, height, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	/* Clear screen to black if disabled */
+	memset(buf, 0, width * height);
+
+	ssd1307_update_display(ssd1307, buf, width, height);
+}
+
+static int ssd1307_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+				struct drm_rect *rect)
+{
+	struct ssd1307_device *ssd1307 = drm_to_ssd1307(fb->dev);
+	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	int ret = 0;
+	u8 *buf = NULL;
+
+	buf = kmalloc_array(fb->width, fb->height, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out_exit;
+	}
+
+	drm_fb_xrgb8888_to_gray8(buf, 0, vmap, fb, rect);
+
+	drm_fb_gray8_to_mono_reversed(buf, buf, rect);
+
+	ssd1307_update_display(ssd1307, buf, fb->width, fb->height);
+
+	kfree(buf);
+out_exit:
+	return ret;
+}
+
+static int ssd1307_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
+						   const struct drm_display_mode *mode)
+{
+	struct ssd1307_device *ssd1307 = drm_to_ssd1307(pipe->crtc.dev);
+
+	if (mode->hdisplay != ssd1307->mode.hdisplay &&
+	    mode->vdisplay != ssd1307->mode.vdisplay)
+		return MODE_ONE_SIZE;
+	else if (mode->hdisplay != ssd1307->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+	else if (mode->vdisplay != ssd1307->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
+
+	return MODE_OK;
+}
+
+static void ssd1307_display_pipe_enable(struct drm_simple_display_pipe *pipe,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_plane_state *plane_state)
+{
+	struct ssd1307_device *ssd1307 = drm_to_ssd1307(pipe->crtc.dev);
+	struct drm_device *drm = &ssd1307->drm;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	backlight_enable(ssd1307->bl_dev);
+
+	ssd1307_write_cmd(ssd1307->client, SSD1307_DISPLAY_ON);
+
+	drm_dev_exit(idx);
+}
+
+static void ssd1307_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct ssd1307_device *ssd1307 = drm_to_ssd1307(pipe->crtc.dev);
+	struct drm_device *drm = &ssd1307->drm;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	ssd1307_clear_screen(ssd1307, ssd1307->width, ssd1307->height);
+
+	ssd1307_write_cmd(ssd1307->client, SSD1307_DISPLAY_OFF);
+
+	backlight_disable(ssd1307->bl_dev);
+
+	drm_dev_exit(idx);
+}
+
+static void ssd1307_display_pipe_update(struct drm_simple_display_pipe *pipe,
+					struct drm_plane_state *old_plane_state)
+{
+	struct ssd1307_device *ssd1307 = drm_to_ssd1307(pipe->crtc.dev);
+	struct drm_plane_state *plane_state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *drm = &ssd1307->drm;
+	struct drm_rect rect;
+	int idx;
+
+	if (!fb)
+		return;
+
+	if (!pipe->crtc.state->active)
+		return;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
+		ssd1307_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &rect);
+
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs ssd1307_pipe_funcs = {
+	.mode_valid = ssd1307_display_pipe_mode_valid,
+	.enable = ssd1307_display_pipe_enable,
+	.disable = ssd1307_display_pipe_disable,
+	.update = ssd1307_display_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+};
+
+static int ssd1307_connector_get_modes(struct drm_connector *connector)
+{
+	struct ssd1307_device *ssd1307 = drm_to_ssd1307(connector->dev);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ssd1307->mode);
+	if (!mode) {
+		DRM_ERROR("Failed to duplicate mode\n");
+		return 0;
+	}
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bpc = 32;
+
+	drm_mode_set_name(mode);
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs ssd1307_connector_helper_funcs = {
+	.get_modes = ssd1307_connector_get_modes,
+};
+
+static const struct drm_connector_funcs ssd1307_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_mode_config_funcs ssd1307_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint32_t ssd1307_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+DEFINE_DRM_GEM_FOPS(ssd1307_fops);
+
+static const struct drm_driver ssd1307_drm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &ssd1307_fops,
+};
+
+static int ssd1307_pwm_enable(struct ssd1307_device *ssd1307)
+{
+	struct pwm_state pwmstate;
+
+	ssd1307->pwm = pwm_get(&ssd1307->client->dev, NULL);
+	if (IS_ERR(ssd1307->pwm)) {
+		dev_err(&ssd1307->client->dev, "Could not get PWM from device tree!\n");
+		return PTR_ERR(ssd1307->pwm);
+	}
+
+	pwm_init_state(ssd1307->pwm, &pwmstate);
+	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
+	pwm_apply_state(ssd1307->pwm, &pwmstate);
+
+	/* Enable the PWM */
+	pwm_enable(ssd1307->pwm);
+
+	dev_dbg(&ssd1307->client->dev, "Using PWM%d with a %lluns period.\n",
+		ssd1307->pwm->pwm, pwm_get_period(ssd1307->pwm));
+
+	return 0;
+}
+
+static int ssd1307_init(struct ssd1307_device *ssd1307)
+{
+	u32 precharge, dclk, com_invdir, compins;
+	int ret;
+
+	/* Set initial contrast */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_CONTRAST);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, ssd1307->contrast);
+	if (ret < 0)
+		return ret;
+
+	/* Set segment re-map */
+	if (ssd1307->seg_remap) {
+		ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SEG_REMAP_ON);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set COM direction */
+	com_invdir = 0xc0 | ssd1307->com_invdir << 3;
+	ret = ssd1307_write_cmd(ssd1307->client,  com_invdir);
+	if (ret < 0)
+		return ret;
+
+	/* Set multiplex ratio value */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_MULTIPLEX_RATIO);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, ssd1307->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/* set display offset value */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_DISPLAY_OFFSET);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, ssd1307->com_offset);
+	if (ret < 0)
+		return ret;
+
+	/* Set clock frequency */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_CLOCK_FREQ);
+	if (ret < 0)
+		return ret;
+
+	dclk = ((ssd1307->dclk_div - 1) & 0xf) | (ssd1307->dclk_frq & 0xf) << 4;
+	ret = ssd1307_write_cmd(ssd1307->client, dclk);
+	if (ret < 0)
+		return ret;
+
+	/* Set Area Color Mode ON/OFF & Low Power Display Mode */
+	if (ssd1307->area_color_enable || ssd1307->low_power) {
+		u32 mode;
+
+		ret = ssd1307_write_cmd(ssd1307->client,
+					SSD1307_SET_AREA_COLOR_MODE);
+		if (ret < 0)
+			return ret;
+
+		mode = (ssd1307->area_color_enable ? 0x30 : 0) |
+			(ssd1307->low_power ? 5 : 0);
+		ret = ssd1307_write_cmd(ssd1307->client, mode);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set precharge period in number of ticks from the internal clock */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_PRECHARGE_PERIOD);
+	if (ret < 0)
+		return ret;
+
+	precharge = (ssd1307->prechargep1 & 0xf) | (ssd1307->prechargep2 & 0xf) << 4;
+	ret = ssd1307_write_cmd(ssd1307->client, precharge);
+	if (ret < 0)
+		return ret;
+
+	/* Set COM pins configuration */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_COM_PINS_CONFIG);
+	if (ret < 0)
+		return ret;
+
+	compins = 0x02 | !ssd1307->com_seq << 4 | ssd1307->com_lrremap << 5;
+	ret = ssd1307_write_cmd(ssd1307->client, compins);
+	if (ret < 0)
+		return ret;
+
+	/* Set VCOMH */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_VCOMH);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, ssd1307->vcomh);
+	if (ret < 0)
+		return ret;
+
+	/* Turn on the DC-DC Charge Pump */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_CHARGE_PUMP);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client,
+		BIT(4) | (ssd1307->device_info->need_chargepump ? BIT(2) : 0));
+	if (ret < 0)
+		return ret;
+
+	/* Set lookup table */
+	if (ssd1307->lookup_table_set) {
+		int i;
+
+		ret = ssd1307_write_cmd(ssd1307->client,
+					SSD1307_SET_LOOKUP_TABLE);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(ssd1307->lookup_table); ++i) {
+			u8 val = ssd1307->lookup_table[i];
+
+			if (val < 31 || val > 63)
+				dev_warn(&ssd1307->client->dev,
+					 "lookup table index %d value out of range 31 <= %d <= 63\n",
+					 i, val);
+			ret = ssd1307_write_cmd(ssd1307->client, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Switch to horizontal addressing mode */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_ADDRESS_MODE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client,
+				SSD1307_SET_ADDRESS_MODE_HORIZONTAL);
+	if (ret < 0)
+		return ret;
+
+	ssd1307_clear_screen(ssd1307, ssd1307->width, ssd1307->height);
+
+	/* Turn on the display */
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_DISPLAY_ON);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ssd1307_update_bl(struct backlight_device *bdev)
+{
+	struct ssd1307_device *ssd1307 = bl_get_data(bdev);
+	int brightness = bdev->props.brightness;
+	int ret;
+
+	ssd1307->contrast = brightness;
+
+	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_CONTRAST);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307_write_cmd(ssd1307->client, ssd1307->contrast);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ssd1307_get_brightness(struct backlight_device *bdev)
+{
+	struct ssd1307_device *ssd1307 = bl_get_data(bdev);
+
+	return ssd1307->contrast;
+}
+
+static const struct backlight_ops ssd1307fb_bl_ops = {
+	.update_status	= ssd1307_update_bl,
+	.get_brightness	= ssd1307_get_brightness,
+};
+
+static void ssd1307_reset(struct ssd1307_device *ssd1307)
+{
+	/* Reset the screen */
+	gpiod_set_value_cansleep(ssd1307->reset, 1);
+	udelay(4);
+	gpiod_set_value_cansleep(ssd1307->reset, 0);
+	udelay(4);
+}
+
+static void ssd1307_parse_properties(struct ssd1307_device *ssd1307)
+{
+	struct device *dev = &ssd1307->client->dev;
+
+	if (device_property_read_u32(dev, "solomon,width", &ssd1307->width))
+		ssd1307->width = 96;
+
+	if (device_property_read_u32(dev, "solomon,height", &ssd1307->height))
+		ssd1307->height = 16;
+
+	if (device_property_read_u32(dev, "solomon,page-offset", &ssd1307->page_offset))
+		ssd1307->page_offset = 1;
+
+	if (device_property_read_u32(dev, "solomon,col-offset", &ssd1307->col_offset))
+		ssd1307->col_offset = 0;
+
+	if (device_property_read_u32(dev, "solomon,com-offset", &ssd1307->com_offset))
+		ssd1307->com_offset = 0;
+
+	if (device_property_read_u32(dev, "solomon,prechargep1", &ssd1307->prechargep1))
+		ssd1307->prechargep1 = 2;
+
+	if (device_property_read_u32(dev, "solomon,prechargep2", &ssd1307->prechargep2))
+		ssd1307->prechargep2 = 2;
+
+	if (!device_property_read_u8_array(dev, "solomon,lookup-table",
+					   ssd1307->lookup_table,
+					   ARRAY_SIZE(ssd1307->lookup_table)))
+		ssd1307->lookup_table_set = 1;
+
+	ssd1307->seg_remap = !device_property_read_bool(dev, "solomon,segment-no-remap");
+	ssd1307->com_seq = device_property_read_bool(dev, "solomon,com-seq");
+	ssd1307->com_lrremap = device_property_read_bool(dev, "solomon,com-lrremap");
+	ssd1307->com_invdir = device_property_read_bool(dev, "solomon,com-invdir");
+	ssd1307->area_color_enable =
+		device_property_read_bool(dev, "solomon,area-color-enable");
+	ssd1307->low_power = device_property_read_bool(dev, "solomon,low-power");
+
+	ssd1307->contrast = 127;
+	ssd1307->vcomh = ssd1307->device_info->default_vcomh;
+
+	/* Setup display timing */
+	if (device_property_read_u32(dev, "solomon,dclk-div", &ssd1307->dclk_div))
+		ssd1307->dclk_div = ssd1307->device_info->default_dclk_div;
+	if (device_property_read_u32(dev, "solomon,dclk-frq", &ssd1307->dclk_frq))
+		ssd1307->dclk_frq = ssd1307->device_info->default_dclk_frq;
+}
+
+static void ssd1307_set_mode(struct ssd1307_device *ssd1307)
+{
+	struct drm_display_mode *mode = &ssd1307->mode;
+	struct drm_device *drm = &ssd1307->drm;
+
+	mode->type = DRM_MODE_TYPE_DRIVER;
+	mode->clock = 1;
+	mode->hdisplay = mode->htotal = ssd1307->width;
+	mode->hsync_start = mode->hsync_end = ssd1307->width;
+	mode->vdisplay = mode->vtotal = ssd1307->height;
+	mode->vsync_start = mode->vsync_end = ssd1307->height;
+	mode->width_mm = 27;
+	mode->height_mm = 27;
+
+	drm->mode_config.min_width = ssd1307->width;
+	drm->mode_config.max_width = ssd1307->width;
+	drm->mode_config.min_height = ssd1307->height;
+	drm->mode_config.max_height = ssd1307->height;
+	drm->mode_config.preferred_depth = 32;
+	drm->mode_config.funcs = &ssd1307_mode_config_funcs;
+}
+
+static int ssd1307_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ssd1307_device *ssd1307;
+	struct backlight_device *bl;
+	struct drm_device *drm;
+	char bl_name[12];
+	int ret;
+
+	ssd1307 = devm_drm_dev_alloc(dev, &ssd1307_drm_driver,
+				 struct ssd1307_device, drm);
+	if (IS_ERR(ssd1307))
+		return PTR_ERR(ssd1307);
+
+	drm = &ssd1307->drm;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	ssd1307->client = client;
+
+	ssd1307->device_info = device_get_match_data(dev);
+
+	ssd1307_parse_properties(ssd1307);
+
+	ssd1307_set_mode(ssd1307);
+
+	ssd1307->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ssd1307->reset)) {
+		dev_err(dev, "failed to get reset gpio: %ld\n",
+			PTR_ERR(ssd1307->reset));
+		return PTR_ERR(ssd1307->reset);
+	}
+
+	ssd1307->vbat_reg = devm_regulator_get_optional(dev, "vbat");
+	if (IS_ERR(ssd1307->vbat_reg)) {
+		ret = PTR_ERR(ssd1307->vbat_reg);
+		if (ret == -ENODEV) {
+			ssd1307->vbat_reg = NULL;
+		} else {
+			dev_err(dev, "failed to get VBAT regulator: %d\n", ret);
+			return ret;
+		}
+	}
+
+	drm_connector_helper_add(&ssd1307->connector, &ssd1307_connector_helper_funcs);
+	ret = drm_connector_init(drm, &ssd1307->connector, &ssd1307_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, ssd1307);
+
+	if (ssd1307->reset)
+		ssd1307_reset(ssd1307);
+
+	if (ssd1307->vbat_reg) {
+		ret = regulator_enable(ssd1307->vbat_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VBAT: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = ssd1307_init(ssd1307);
+	if (ret)
+		goto regulator_disable;
+
+	if (ssd1307->device_info->need_pwm) {
+		ret = ssd1307_pwm_enable(ssd1307);
+		if (ret)
+			goto regulator_disable;
+	}
+
+	snprintf(bl_name, sizeof(bl_name), "ssd1307%d", drm->primary->index);
+	bl = backlight_device_register(bl_name, dev, ssd1307, &ssd1307fb_bl_ops,
+				       NULL);
+	if (IS_ERR(bl)) {
+		ret = PTR_ERR(bl);
+		dev_err(dev, "unable to register backlight device: %d\n", ret);
+		goto pwm_disable;
+	}
+
+	bl->props.brightness = ssd1307->contrast;
+	bl->props.max_brightness = MAX_CONTRAST;
+	ssd1307->bl_dev = bl;
+
+	ret = drm_simple_display_pipe_init(drm, &ssd1307->pipe, &ssd1307_pipe_funcs,
+					   ssd1307_formats, ARRAY_SIZE(ssd1307_formats),
+					   NULL, &ssd1307->connector);
+	if (ret)
+		goto pwm_disable;
+
+	drm_plane_enable_fb_damage_clips(&ssd1307->pipe.plane);
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		goto backlight_unregister;
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+
+backlight_unregister:
+	backlight_device_unregister(ssd1307->bl_dev);
+pwm_disable:
+	if (ssd1307->device_info->need_pwm) {
+		pwm_disable(ssd1307->pwm);
+		pwm_put(ssd1307->pwm);
+	}
+regulator_disable:
+	if (ssd1307->vbat_reg)
+		regulator_disable(ssd1307->vbat_reg);
+	return ret;
+}
+
+static int ssd1307_remove(struct i2c_client *client)
+{
+	struct ssd1307_device *ssd1307 = i2c_get_clientdata(client);
+
+	drm_dev_unplug(&ssd1307->drm);
+
+	ssd1307_write_cmd(ssd1307->client, SSD1307_DISPLAY_OFF);
+
+	backlight_device_unregister(ssd1307->bl_dev);
+
+	if (ssd1307->device_info->need_pwm) {
+		pwm_disable(ssd1307->pwm);
+		pwm_put(ssd1307->pwm);
+	}
+	if (ssd1307->vbat_reg)
+		regulator_disable(ssd1307->vbat_reg);
+
+	return 0;
+}
+
+static void ssd1307_shutdown(struct i2c_client *client)
+{
+	struct ssd1307_device *ssd1307 = i2c_get_clientdata(client);
+
+	drm_atomic_helper_shutdown(&ssd1307->drm);
+}
+
+static struct ssd1307_deviceinfo ssd1307_ssd1305_deviceinfo = {
+	.default_vcomh = 0x34,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 7,
+};
+
+static struct ssd1307_deviceinfo ssd1307_ssd1306_deviceinfo = {
+	.default_vcomh = 0x20,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 8,
+	.need_chargepump = 1,
+};
+
+static struct ssd1307_deviceinfo ssd1307_ssd1307_deviceinfo = {
+	.default_vcomh = 0x20,
+	.default_dclk_div = 2,
+	.default_dclk_frq = 12,
+	.need_pwm = 1,
+};
+
+static struct ssd1307_deviceinfo ssd1307_ssd1309_deviceinfo = {
+	.default_vcomh = 0x34,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 10,
+};
+
+static const struct of_device_id ssd1307_of_match[] = {
+	{
+		.compatible = "solomon,ssd1305fb-i2c",
+		.data = (void *)&ssd1307_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306fb-i2c",
+		.data = (void *)&ssd1307_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307fb-i2c",
+		.data = (void *)&ssd1307_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309fb-i2c",
+		.data = (void *)&ssd1307_ssd1309_deviceinfo,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ssd1307_of_match);
+
+
+static struct i2c_driver ssd1307_i2c_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = ssd1307_of_match,
+	},
+	.probe_new = ssd1307_probe,
+	.remove = ssd1307_remove,
+	.shutdown = ssd1307_shutdown,
+};
+
+module_i2c_driver(ssd1307_i2c_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

