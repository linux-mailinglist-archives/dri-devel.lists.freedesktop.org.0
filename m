Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732874AED7F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85610E49E;
	Wed,  9 Feb 2022 09:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DB610E5AC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644397413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1b7Bf0CVql46bfS8nFUUPEriioGV0kBypsdQVsEfh4=;
 b=h8osMgFYsL9xMcMz6E8Cd8ycS8Q03ABU0X00SCtGtrNcDpBAnxUc/0Ci8aFV7TLAcpkfcH
 HXdLg34eN494xhzHOraVi6EKQHWM+zzST7Dy8z68C30UCAn8Bhdo1euJbX4ZINMWw2bE8d
 B9AMARADocWRBkslvhzD2Pw4Rc7jyrY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-aVqRmEqmPxeJzBDzYP1gOg-1; Wed, 09 Feb 2022 04:03:31 -0500
X-MC-Unique: aVqRmEqmPxeJzBDzYP1gOg-1
Received: by mail-wr1-f70.google.com with SMTP id
 b8-20020adfc748000000b001e333edbe40so841183wrh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1b7Bf0CVql46bfS8nFUUPEriioGV0kBypsdQVsEfh4=;
 b=A4yvqRZ0b9KCHNtAZ0yMwgVnQPiZVkbO4LDcqfWomqCf9sTn/lF4pXeUura8Mxhvg7
 9Flp/X95Jyz2tXDXYECAsmG3TKhvhSLaLwx5s05KANS/9djCGUFZz66phTWYx4sYlHLp
 ka09Xqe3OGhMGun6HnJf6rnJ9JuqrQN9SsLCFPmC2alqSPtR7ovZ+xF9+aXWqeAG0yLg
 JUxC8GPOjS3jf+XcxLCKSXPDCzKuS3TODOfEpLWS2donrijU1BlFbZnznlOwOCPFXCip
 KONmKxFrRhk91P5UexXibZJoIHzXJCGQJgrBhCqyfoF1cUowZN8O5119I5O9Qjhdc0Pu
 YRMg==
X-Gm-Message-State: AOAM532jOD3g+VDaK2MglqI7cVm1U13d3zWtMVhsEp2/jkEikY8jZbDh
 aQ4N7aPhccqTXDDwQoytwY0xpgaDxkYgLBYRyT2B6Fq6BzqMnA6slb48em46PFUn0yjLyb3Q6+s
 vzLEShLqAmOVMgDq6056FzAXJEXUH
X-Received: by 2002:a5d:5985:: with SMTP id n5mr1297993wri.238.1644397409537; 
 Wed, 09 Feb 2022 01:03:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAHnrZmcBzwCz4xzqz4k4l60NnNnoiIBc8I5MrcUIhoaVtBSyy0tFerkmoa7MjLKxbwyFrnQ==
X-Received: by 2002:a5d:5985:: with SMTP id n5mr1297949wri.238.1644397409064; 
 Wed, 09 Feb 2022 01:03:29 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id z1sm4058866wmk.32.2022.02.09.01.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:03:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Date: Wed,  9 Feb 2022 10:03:10 +0100
Message-Id: <20220209090314.2511959-4-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209090314.2511959-1-javierm@redhat.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
OLED display controllers.

It's only the core part of the driver and a bus specific driver is needed
for each transport interface supported by the display controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Move driver from tiny sub-dir to drivers/gpu/drm/solomon (Sam Ravnborg)
- Split driver in a bus agnostic core and bus specific (Andy Shevchenko)
- Use regmap to access the chip registers (Andy Shevchenko)
- Remove unnecessary blank lines (Andy Shevchenko)
- Remove unneeded inline specifier in functions (Andy Shevchenko)
- Add a comment about always returning a single mode (Andy Shevchenko)
- Change write command logic to use do while loop (Andy Shevchenko)
- Use "firmware description" instead of "device tree" (Andy Shevchenko)
- Use return foo() instead of returning the return value (Andy Shevchenko)
- Don't split lines longer than 80 chars if makes less readable (Andy Shevchenko)
- Remove redundant else statements in .mode_valid callback (Andy Shevchenko)
- Rename powero{n,ff}() functions to power_o{n,ff)() (Andy Shevchenko)
- Use dev_err_probe() to prevent spam logs on probe deferral (Andy Shevchenko)
- Remove ',' after sentinel terminator in array (Andy Shevchenko)
- Fix a bug when doing partial updates (Geert Uytterhoeven)

Changes in v2:
- Drop patch that was adding a DRM_MODE_CONNECTOR_I2C type.
- Invert order of backlight {en,dis}able and display {on,off} (Sam Ravnborg)
- Don't clear the screen and turn on display on probe (Sam Ravnborg)
- Use backlight_get_brightness() macro to get BL brightness (Sam Ravnborg)
- Use dev managed version of devm_backlight_device_register() (Sam Ravnborg)
- Use dev_name(dev) for backlight name instead of an array (Sam Ravnborg)
- Drop the .get_brightness callback since isn't needed  (Sam Ravnborg)
- Rename driver to ssd130x since supports a display family (Thomas Zimmermann)
- Drop the TINY prefix from the Kconfig symbol (Thomas Zimmermann)
- Sort the Kconfig symbol dependencies alphabetically (Thomas Zimmermann)
- Rename struct ssd130x_array to struct ssd130x_i2c_msg (Thomas Zimmermann)
- Rename struct ssd130x_i2c_msg .type member to .cmd (Thomas Zimmermann)
- Use sizeof(*foo) instead of sizeof(struct foo) (Thomas Zimmermann)
- Use struct_size() macro to calculate sizeof(*foo) + len (Thomas Zimmermann)
- Use kcalloc() instead of kmalloc_array() + memset() (Thomas Zimmermann)
- Use shadow plane helpers virtual screen support (Thomas Zimmermann)
- Remove unused goto label in ssd1307_fb_blit_rect() (Thomas Zimmermann)
- Use drm_set_preferred_mode() inset of manually set (Thomas Zimmermann)
- Use shadow plane helpers virtual screen support (Thomas Zimmermann)
- Remove unused goto label in ssd1307_fb_blit_rect() (Thomas Zimmermann)
- Use drm_set_preferred_mode() inset of manually set (Thomas Zimmermann)
- Reorganize code in probe to make it more legible (Thomas Zimmermann)
- ssd130x_write_cmd() uses varargs to simplify I2C code (Thomas Zimmermann)
- Move regulator/pwm init logic to display pipe enable callback.

 drivers/gpu/drm/Kconfig           |   2 +
 drivers/gpu/drm/Makefile          |   1 +
 drivers/gpu/drm/solomon/Kconfig   |  12 +
 drivers/gpu/drm/solomon/Makefile  |   1 +
 drivers/gpu/drm/solomon/ssd130x.c | 823 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h |  76 +++
 6 files changed, 915 insertions(+)
 create mode 100644 drivers/gpu/drm/solomon/Kconfig
 create mode 100644 drivers/gpu/drm/solomon/Makefile
 create mode 100644 drivers/gpu/drm/solomon/ssd130x.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dfdd3ec5f793..c423c920c027 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -405,6 +405,8 @@ source "drivers/gpu/drm/gud/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/solomon/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8675c2af7ae1..a07b777e778a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -133,3 +133,4 @@ obj-y			+= xlnx/
 obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-y			+= solomon/
diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
new file mode 100644
index 000000000000..c969c358a4a7
--- /dev/null
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -0,0 +1,12 @@
+config DRM_SSD130X
+	tristate "DRM support for Solomon SSD130X OLED displays"
+	depends on DRM
+	select BACKLIGHT_CLASS_DEVICE
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  DRM driver for the SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
+	  OLED controllers. This is only for the core driver, a driver for
+	  the appropriate bus transport in your chip also must be selected.
+
+	  If M is selected the module will be called ssd130x.
diff --git a/drivers/gpu/drm/solomon/Makefile b/drivers/gpu/drm/solomon/Makefile
new file mode 100644
index 000000000000..f685addb19fe
--- /dev/null
+++ b/drivers/gpu/drm/solomon/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_SSD130X)	+= ssd130x.o
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
new file mode 100644
index 000000000000..79943f2e73a2
--- /dev/null
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -0,0 +1,823 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Solomon SSD130X OLED displays
+ *
+ * Copyright 2022 Red Hat Inc.
+ * Authors: Javier Martinez Canillas <javierm@redhat.com>
+ *
+ * Based on drivers/video/fbdev/ssd1307fb.c
+ * Copyright 2012 Free Electrons
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/property.h>
+#include <linux/pwm.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
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
+
+#include "ssd130x.h"
+
+#define DRIVER_NAME	"ssd130x"
+#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays"
+#define DRIVER_DATE	"20220131"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+#define SSD130X_DATA				0x40
+#define SSD130X_COMMAND				0x80
+
+#define SSD130X_SET_ADDRESS_MODE		0x20
+#define SSD130X_SET_ADDRESS_MODE_HORIZONTAL	(0x00)
+#define SSD130X_SET_ADDRESS_MODE_VERTICAL	(0x01)
+#define SSD130X_SET_ADDRESS_MODE_PAGE		(0x02)
+#define SSD130X_SET_COL_RANGE			0x21
+#define SSD130X_SET_PAGE_RANGE			0x22
+#define SSD130X_CONTRAST			0x81
+#define SSD130X_SET_LOOKUP_TABLE		0x91
+#define SSD130X_CHARGE_PUMP			0x8d
+#define SSD130X_SEG_REMAP_ON			0xa1
+#define SSD130X_DISPLAY_OFF			0xae
+#define SSD130X_SET_MULTIPLEX_RATIO		0xa8
+#define SSD130X_DISPLAY_ON			0xaf
+#define SSD130X_START_PAGE_ADDRESS		0xb0
+#define SSD130X_SET_DISPLAY_OFFSET		0xd3
+#define SSD130X_SET_CLOCK_FREQ			0xd5
+#define SSD130X_SET_AREA_COLOR_MODE		0xd8
+#define SSD130X_SET_PRECHARGE_PERIOD		0xd9
+#define SSD130X_SET_COM_PINS_CONFIG		0xda
+#define SSD130X_SET_VCOMH			0xdb
+
+#define MAX_CONTRAST 255
+
+static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
+{
+	return container_of(drm, struct ssd130x_device, drm);
+}
+
+/*
+ * Helper to write data (SSD130X_DATA) to the device.
+ */
+static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
+{
+	int ret;
+
+	ret = regmap_bulk_write(ssd130x->regmap, SSD130X_DATA, values, count);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Helper to write command (SSD130X_COMMAND). The fist variadic argument
+ * is the command to write and the following are the command options.
+ */
+static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
+				    /* u8 cmd, u8 option, ... */...)
+{
+	va_list ap;
+	u8 value;
+	int ret;
+
+	va_start(ap, count);
+
+	do {
+		value = va_arg(ap, int);
+		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, (u8)value);
+		if (ret)
+			goto out_end;
+	} while (--count);
+
+out_end:
+	va_end(ap);
+
+	return ret;
+}
+
+static int ssd130x_set_col_range(struct ssd130x_device *ssd130x,
+				 u8 col_start, u8 cols)
+{
+	u8 col_end = col_start + cols - 1;
+	int ret;
+
+	if (col_start == ssd130x->col_start && col_end == ssd130x->col_end)
+		return 0;
+
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD130X_SET_COL_RANGE, col_start, col_end);
+	if (ret < 0)
+		return ret;
+
+	ssd130x->col_start = col_start;
+	ssd130x->col_end = col_end;
+	return 0;
+}
+
+static int ssd130x_set_page_range(struct ssd130x_device *ssd130x,
+				  u8 page_start, u8 pages)
+{
+	u8 page_end = page_start + pages - 1;
+	int ret;
+
+	if (page_start == ssd130x->page_start && page_end == ssd130x->page_end)
+		return 0;
+
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD130X_SET_PAGE_RANGE, page_start, page_end);
+	if (ret < 0)
+		return ret;
+
+	ssd130x->page_start = page_start;
+	ssd130x->page_end = page_end;
+	return 0;
+}
+
+static int ssd130x_pwm_enable(struct ssd130x_device *ssd130x)
+{
+	struct device *dev = ssd130x->dev;
+	struct pwm_state pwmstate;
+
+	ssd130x->pwm = pwm_get(dev, NULL);
+	if (IS_ERR(ssd130x->pwm)) {
+		dev_err(dev, "Could not get PWM from firmware description!\n");
+		return PTR_ERR(ssd130x->pwm);
+	}
+
+	pwm_init_state(ssd130x->pwm, &pwmstate);
+	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
+	pwm_apply_state(ssd130x->pwm, &pwmstate);
+
+	/* Enable the PWM */
+	pwm_enable(ssd130x->pwm);
+
+	dev_dbg(dev, "Using PWM%d with a %lluns period.\n",
+		ssd130x->pwm->pwm, pwm_get_period(ssd130x->pwm));
+
+	return 0;
+}
+
+static void ssd130x_reset(struct ssd130x_device *ssd130x)
+{
+	/* Reset the screen */
+	gpiod_set_value_cansleep(ssd130x->reset, 1);
+	udelay(4);
+	gpiod_set_value_cansleep(ssd130x->reset, 0);
+	udelay(4);
+}
+
+static int ssd130x_power_on(struct ssd130x_device *ssd130x)
+{
+	struct device *dev = ssd130x->dev;
+	int ret;
+
+	if (ssd130x->reset)
+		ssd130x_reset(ssd130x);
+
+	if (ssd130x->vbat_reg) {
+		ret = regulator_enable(ssd130x->vbat_reg);
+		if (ret) {
+			dev_err(dev, "Failed to enable VBAT: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (ssd130x->device_info->need_pwm) {
+		ret = ssd130x_pwm_enable(ssd130x);
+		if (ret) {
+			dev_err(dev, "Failed to enable PWM: %d\n", ret);
+			if (ssd130x->vbat_reg)
+				regulator_disable(ssd130x->vbat_reg);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void ssd130x_power_off(struct ssd130x_device *ssd130x)
+{
+	if (ssd130x->device_info->need_pwm) {
+		pwm_disable(ssd130x->pwm);
+		pwm_put(ssd130x->pwm);
+	}
+
+	if (ssd130x->vbat_reg)
+		regulator_disable(ssd130x->vbat_reg);
+}
+
+static int ssd130x_init(struct ssd130x_device *ssd130x)
+{
+	u32 precharge, dclk, com_invdir, compins, chargepump;
+	int ret;
+
+	/* Set initial contrast */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_CONTRAST, ssd130x->contrast);
+	if (ret < 0)
+		return ret;
+
+	/* Set segment re-map */
+	if (ssd130x->seg_remap) {
+		ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_SEG_REMAP_ON);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set COM direction */
+	com_invdir = 0xc0 | ssd130x->com_invdir << 3;
+	ret = ssd130x_write_cmd(ssd130x,  1, com_invdir);
+	if (ret < 0)
+		return ret;
+
+	/* Set multiplex ratio value */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/* set display offset value */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_DISPLAY_OFFSET, ssd130x->com_offset);
+	if (ret < 0)
+		return ret;
+
+	/* Set clock frequency */
+	dclk = ((ssd130x->dclk_div - 1) & 0xf) | (ssd130x->dclk_frq & 0xf) << 4;
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_CLOCK_FREQ, dclk);
+	if (ret < 0)
+		return ret;
+
+	/* Set Area Color Mode ON/OFF & Low Power Display Mode */
+	if (ssd130x->area_color_enable || ssd130x->low_power) {
+		u32 mode = ((ssd130x->area_color_enable ? 0x30 : 0) |
+			    (ssd130x->low_power ? 5 : 0));
+
+		ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_AREA_COLOR_MODE, mode);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set precharge period in number of ticks from the internal clock */
+	precharge = (ssd130x->prechargep1 & 0xf) | (ssd130x->prechargep2 & 0xf) << 4;
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_PRECHARGE_PERIOD, precharge);
+	if (ret < 0)
+		return ret;
+
+	/* Set COM pins configuration */
+	compins = 0x02 | !ssd130x->com_seq << 4 | ssd130x->com_lrremap << 5;
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_COM_PINS_CONFIG, compins);
+	if (ret < 0)
+		return ret;
+
+
+	/* Set VCOMH */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_VCOMH, ssd130x->vcomh);
+	if (ret < 0)
+		return ret;
+
+	/* Turn on the DC-DC Charge Pump */
+	chargepump = BIT(4) | (ssd130x->device_info->need_chargepump ? BIT(2) : 0);
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_CHARGE_PUMP, chargepump);
+	if (ret < 0)
+		return ret;
+
+	/* Set lookup table */
+	if (ssd130x->lookup_table_set) {
+		int i;
+
+		ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_SET_LOOKUP_TABLE);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(ssd130x->lookup_table); ++i) {
+			u8 val = ssd130x->lookup_table[i];
+
+			if (val < 31 || val > 63)
+				dev_warn(ssd130x->dev,
+					 "lookup table index %d value out of range 31 <= %d <= 63\n",
+					 i, val);
+			ret = ssd130x_write_cmd(ssd130x, 1, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Switch to horizontal addressing mode */
+	return ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_ADDRESS_MODE,
+				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
+}
+
+static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
+			       struct drm_rect *rect)
+{
+	unsigned int x = rect->x1;
+	unsigned int y = rect->y1;
+	unsigned int width = drm_rect_width(rect);
+	unsigned int height = drm_rect_height(rect);
+	unsigned int line_length = DIV_ROUND_UP(width, 8);
+	unsigned int pages = DIV_ROUND_UP(y % 8 + height, 8);
+	u32 array_idx = 0;
+	int ret, i, j, k;
+	u8 *data_array = NULL;
+
+	data_array = kcalloc(width, pages, GFP_KERNEL);
+	if (!data_array)
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
+	ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
+	if (ret < 0)
+		goto out_free;
+
+	ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
+	if (ret < 0)
+		goto out_free;
+
+	for (i = y / 8; i < y / 8 + pages; i++) {
+		int m = 8;
+
+		/* Last page may be partial */
+		if (8 * (i + 1) > ssd130x->height)
+			m = ssd130x->height % 8;
+		for (j = x; j < x + width; j++) {
+			u8 data = 0;
+
+			for (k = 0; k < m; k++) {
+				u8 byte = buf[(8 * i + k) * line_length + j / 8];
+				u8 bit = (byte >> (j % 8)) & 1;
+
+				data |= bit << k;
+			}
+			data_array[array_idx++] = data;
+		}
+	}
+
+	ret = ssd130x_write_data(ssd130x, data_array, width * pages);
+
+out_free:
+	kfree(data_array);
+	return ret;
+}
+
+static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
+{
+	u8 *buf = NULL;
+
+	struct drm_rect fullscreen = {
+		.x1 = 0,
+		.x2 = ssd130x->width,
+		.y1 = 0,
+		.y2 = ssd130x->height,
+	};
+
+	buf = kcalloc(ssd130x->width, ssd130x->height, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	ssd130x_update_rect(ssd130x, buf, &fullscreen);
+
+	kfree(buf);
+}
+
+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+				struct drm_rect *rect)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	int ret = 0;
+	u8 *buf = NULL;
+
+	buf = kcalloc(fb->width, fb->height, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	drm_fb_xrgb8888_to_mono_reversed(buf, 0, vmap, fb, rect);
+
+	ssd130x_update_rect(ssd130x, buf, rect);
+
+	kfree(buf);
+
+	return ret;
+}
+
+static int ssd130x_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
+					   const struct drm_display_mode *mode)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+
+	if (mode->hdisplay != ssd130x->mode.hdisplay &&
+	    mode->vdisplay != ssd130x->mode.vdisplay)
+		return MODE_ONE_SIZE;
+
+	if (mode->hdisplay != ssd130x->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+
+	if (mode->vdisplay != ssd130x->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
+
+	return MODE_OK;
+}
+
+static void ssd130x_display_pipe_enable(struct drm_simple_display_pipe *pipe,
+					struct drm_crtc_state *crtc_state,
+					struct drm_plane_state *plane_state)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+	struct drm_device *drm = &ssd130x->drm;
+	int idx, ret;
+
+	ret = ssd130x_power_on(ssd130x);
+	if (ret)
+		return;
+
+	ret = ssd130x_init(ssd130x);
+	if (ret)
+		goto power_off;
+
+	if (!drm_dev_enter(drm, &idx))
+		goto power_off;
+
+	ssd130x_clear_screen(ssd130x);
+
+	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
+
+	backlight_enable(ssd130x->bl_dev);
+
+	drm_dev_exit(idx);
+
+	return;
+power_off:
+	ssd130x_power_off(ssd130x);
+}
+
+static void ssd130x_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+	struct drm_device *drm = &ssd130x->drm;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	ssd130x_clear_screen(ssd130x);
+
+	backlight_disable(ssd130x->bl_dev);
+
+	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
+
+	ssd130x_power_off(ssd130x);
+
+	drm_dev_exit(idx);
+}
+
+static void ssd130x_display_pipe_update(struct drm_simple_display_pipe *pipe,
+					struct drm_plane_state *old_plane_state)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+	struct drm_plane_state *plane_state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *drm = &ssd130x->drm;
+	struct drm_rect src_clip, dst_clip;
+	int idx;
+
+	if (!fb)
+		return;
+
+	if (!pipe->crtc.state->active)
+		return;
+
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
+		return;
+
+	dst_clip = plane_state->dst;
+	if (!drm_rect_intersect(&dst_clip, &src_clip))
+		return;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
+
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs ssd130x_pipe_funcs = {
+	.mode_valid = ssd130x_display_pipe_mode_valid,
+	.enable = ssd130x_display_pipe_enable,
+	.disable = ssd130x_display_pipe_disable,
+	.update = ssd130x_display_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+};
+
+static int ssd130x_connector_get_modes(struct drm_connector *connector)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
+	struct drm_display_mode *mode = &ssd130x->mode;
+	struct device *dev = ssd130x->dev;
+
+	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
+	if (!mode) {
+		dev_err(dev, "Failed to duplicated mode\n");
+		return 0;
+	}
+
+	drm_mode_probed_add(connector, mode);
+	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
+
+	/* There is only a single mode */
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {
+	.get_modes = ssd130x_connector_get_modes,
+};
+
+static const struct drm_connector_funcs ssd130x_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_mode_config_funcs ssd130x_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint32_t ssd130x_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+DEFINE_DRM_GEM_FOPS(ssd130x_fops);
+
+static const struct drm_driver ssd130x_drm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &ssd130x_fops,
+};
+
+static int ssd130x_update_bl(struct backlight_device *bdev)
+{
+	struct ssd130x_device *ssd130x = bl_get_data(bdev);
+	int brightness = backlight_get_brightness(bdev);
+	int ret;
+
+	ssd130x->contrast = brightness;
+
+	ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_CONTRAST);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x, 1, ssd130x->contrast);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct backlight_ops ssd130xfb_bl_ops = {
+	.update_status	= ssd130x_update_bl,
+};
+
+static void ssd130x_parse_properties(struct ssd130x_device *ssd130x)
+{
+	struct device *dev = ssd130x->dev;
+
+	if (device_property_read_u32(dev, "solomon,width", &ssd130x->width))
+		ssd130x->width = 96;
+
+	if (device_property_read_u32(dev, "solomon,height", &ssd130x->height))
+		ssd130x->height = 16;
+
+	if (device_property_read_u32(dev, "solomon,page-offset", &ssd130x->page_offset))
+		ssd130x->page_offset = 1;
+
+	if (device_property_read_u32(dev, "solomon,col-offset", &ssd130x->col_offset))
+		ssd130x->col_offset = 0;
+
+	if (device_property_read_u32(dev, "solomon,com-offset", &ssd130x->com_offset))
+		ssd130x->com_offset = 0;
+
+	if (device_property_read_u32(dev, "solomon,prechargep1", &ssd130x->prechargep1))
+		ssd130x->prechargep1 = 2;
+
+	if (device_property_read_u32(dev, "solomon,prechargep2", &ssd130x->prechargep2))
+		ssd130x->prechargep2 = 2;
+
+	if (!device_property_read_u8_array(dev, "solomon,lookup-table",
+					   ssd130x->lookup_table,
+					   ARRAY_SIZE(ssd130x->lookup_table)))
+		ssd130x->lookup_table_set = 1;
+
+	ssd130x->seg_remap = !device_property_read_bool(dev, "solomon,segment-no-remap");
+	ssd130x->com_seq = device_property_read_bool(dev, "solomon,com-seq");
+	ssd130x->com_lrremap = device_property_read_bool(dev, "solomon,com-lrremap");
+	ssd130x->com_invdir = device_property_read_bool(dev, "solomon,com-invdir");
+	ssd130x->area_color_enable =
+		device_property_read_bool(dev, "solomon,area-color-enable");
+	ssd130x->low_power = device_property_read_bool(dev, "solomon,low-power");
+
+	ssd130x->contrast = 127;
+	ssd130x->vcomh = ssd130x->device_info->default_vcomh;
+
+	/* Setup display timing */
+	if (device_property_read_u32(dev, "solomon,dclk-div", &ssd130x->dclk_div))
+		ssd130x->dclk_div = ssd130x->device_info->default_dclk_div;
+	if (device_property_read_u32(dev, "solomon,dclk-frq", &ssd130x->dclk_frq))
+		ssd130x->dclk_frq = ssd130x->device_info->default_dclk_frq;
+}
+
+static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
+{
+	struct drm_display_mode *mode = &ssd130x->mode;
+	struct device *dev = ssd130x->dev;
+	struct drm_device *drm = &ssd130x->drm;
+	unsigned long max_width, max_height;
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret) {
+		dev_err(dev, "DRM mode config init failed: %d\n", ret);
+		return ret;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER;
+	mode->clock = 1;
+	mode->hdisplay = mode->htotal = ssd130x->width;
+	mode->hsync_start = mode->hsync_end = ssd130x->width;
+	mode->vdisplay = mode->vtotal = ssd130x->height;
+	mode->vsync_start = mode->vsync_end = ssd130x->height;
+	mode->width_mm = 27;
+	mode->height_mm = 27;
+
+	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
+
+	drm->mode_config.min_width = mode->hdisplay;
+	drm->mode_config.max_width = max_width;
+	drm->mode_config.min_height = mode->vdisplay;
+	drm->mode_config.max_height = max_height;
+	drm->mode_config.preferred_depth = 32;
+	drm->mode_config.funcs = &ssd130x_mode_config_funcs;
+
+	ret = drm_connector_init(drm, &ssd130x->connector, &ssd130x_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret) {
+		dev_err(dev, "DRM connector init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_connector_helper_add(&ssd130x->connector, &ssd130x_connector_helper_funcs);
+
+	ret = drm_simple_display_pipe_init(drm, &ssd130x->pipe, &ssd130x_pipe_funcs,
+					   ssd130x_formats, ARRAY_SIZE(ssd130x_formats),
+					   NULL, &ssd130x->connector);
+	if (ret) {
+		dev_err(dev, "DRM simple display pipeline init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_plane_enable_fb_damage_clips(&ssd130x->pipe.plane);
+
+	drm_mode_config_reset(drm);
+
+	return 0;
+}
+
+static int ssd130x_get_resources(struct ssd130x_device *ssd130x)
+{
+	struct device *dev = ssd130x->dev;
+	int ret;
+
+	ssd130x->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ssd130x->reset))
+		return dev_err_probe(dev, PTR_ERR(ssd130x->reset), "Failed to get reset gpio\n");
+
+	ssd130x->vbat_reg = devm_regulator_get_optional(dev, "vbat");
+	if (IS_ERR(ssd130x->vbat_reg)) {
+		ret = PTR_ERR(ssd130x->vbat_reg);
+		if (ret == -ENODEV)
+			ssd130x->vbat_reg = NULL;
+		else
+			return dev_err_probe(dev, ret, "Failed to get VBAT regulator\n");
+	}
+
+	return 0;
+}
+
+struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
+{
+	struct ssd130x_device *ssd130x;
+	struct backlight_device *bl;
+	struct drm_device *drm;
+	int ret;
+
+	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
+				     struct ssd130x_device, drm);
+	if (IS_ERR(ssd130x)) {
+		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
+		return ssd130x;
+	}
+
+	drm = &ssd130x->drm;
+
+	ssd130x->dev = dev;
+	ssd130x->regmap = regmap;
+	ssd130x->device_info = device_get_match_data(dev);
+
+	ssd130x_parse_properties(ssd130x);
+
+	ret = ssd130x_get_resources(ssd130x);
+	if (ret)
+		return ERR_PTR(ret);
+
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
+					    &ssd130xfb_bl_ops, NULL);
+	if (IS_ERR(bl)) {
+		ret = PTR_ERR(bl);
+		dev_err(dev, "Unable to register backlight device: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	bl->props.brightness = ssd130x->contrast;
+	bl->props.max_brightness = MAX_CONTRAST;
+	ssd130x->bl_dev = bl;
+
+	ret = ssd130x_init_modeset(ssd130x);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		dev_err(dev, "DRM device register failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return ssd130x;
+}
+EXPORT_SYMBOL_GPL(ssd130x_probe);
+
+int ssd130x_remove(struct ssd130x_device *ssd130x)
+{
+	drm_dev_unplug(&ssd130x->drm);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ssd130x_remove);
+
+void ssd130x_shutdown(struct ssd130x_device *ssd130x)
+{
+	drm_atomic_helper_shutdown(&ssd130x->drm);
+}
+EXPORT_SYMBOL_GPL(ssd130x_shutdown);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
new file mode 100644
index 000000000000..bc760fdf0dfe
--- /dev/null
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Header file for:
+ * DRM driver for Solomon SSD130X OLED displays
+ *
+ * Copyright 2022 Red Hat Inc.
+ * Authors: Javier Martinez Canillas <javierm@redhat.com>
+ *
+ * Based on drivers/video/fbdev/ssd1307fb.c
+ * Copyright 2012 Free Electrons
+ */
+
+#ifndef __SSD1307X_H__
+#define __SSD1307X_H__
+
+#include <drm/drm_drv.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include <linux/regmap.h>
+
+struct ssd130x_deviceinfo {
+	u32 default_vcomh;
+	u32 default_dclk_div;
+	u32 default_dclk_frq;
+	int need_pwm;
+	int need_chargepump;
+};
+
+struct ssd130x_device {
+	struct drm_device drm;
+	struct device *dev;
+	struct drm_simple_display_pipe pipe;
+	struct drm_display_mode mode;
+	struct drm_connector connector;
+	struct i2c_client *client;
+
+	struct regmap *regmap;
+
+	const struct ssd130x_deviceinfo *device_info;
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
+struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
+int ssd130x_remove(struct ssd130x_device *ssd130x);
+void ssd130x_shutdown(struct ssd130x_device *ssd130x);
+
+#endif /* __SSD1307X_H__ */
-- 
2.34.1

