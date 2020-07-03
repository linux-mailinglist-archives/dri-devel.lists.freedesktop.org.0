Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D8213A76
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 15:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1584F6EB85;
	Fri,  3 Jul 2020 13:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEB56EB85
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 13:01:09 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m26so18413260lfo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VO6d6wRYq+mQyztnVGBhlJ6RTV8OO7D3TWYRLireVw=;
 b=fTQQ6cCxVa5y9mzQ+dG9kzRI+/Ak7OXMjhYAcAGQ+gXs0K81ViwwglaOOcx7C51YKw
 Aa5/YweB32Dbxe60UDKrd5Kcs7QB1WETBLRHlTVvuHqp98OtiyZCUwmPipiG7Y0+jlHn
 IAKb8pze+PVdq1OeYEpHGBJzVmy9ZbBM+8iJmn19hFaTo9YWOWxB+b+EeSpuDWrHKsHZ
 KWxyH/t9XLvmjsq0Zne4gwQljrnqfi/hxfnpSGJoI0ns4Ie3AIK3GvBTdYrCxPrOPdLP
 Gaf7oLC85gPvwEJhwgT/0ZIXKYBwUDrNdMJPVaxxILv9w5i8lmuNfKnsQpS55VJlu7X2
 4W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VO6d6wRYq+mQyztnVGBhlJ6RTV8OO7D3TWYRLireVw=;
 b=YhlvKivPKc3jGnEvgcwQ1Y7FIyj4LQYy6ejf6cE6QFaTfdi67pPeFtgvzSXPD7q6J2
 fm61vZrgxZvs4b9IebJI+LNKb18myoU67zTIfy4bFjqpRsBdi/d/dcigzD+n++VDrIA8
 +lekW2GCjpe8aaa/UBm8SwDxqRADZYS/qeNbIOVZxYpHjnptiR87ssIS3gelK7a4kYcN
 ZcrEsAX2tIzyNeELboyBj4tiOCoZTB5Dzh6VbFkAdc0MFizH5B6V3iJEeMVLd2m4nPD4
 ofBTFU3SkSaKxbPeAo3+cPwDU1OycQ1Uz0Tnjtt/Sjk3c1chpF0AycVjMsnA0SAWwIRU
 2bLA==
X-Gm-Message-State: AOAM531o2aeaUF5zAwXCiUn16ojfCO4UfMggtaKIWXOeHodnJwSxOevx
 5Oaci78cRqqkQPNQOmLjlk1ut4kd4EIn8w==
X-Google-Smtp-Source: ABdhPJxCgsO4rgdve84jMCcPkX6Fd7is8uNVBaR2UNxS3HF+9tfQoFFzbS/IgUyjSVKlv6dvsVEHwA==
X-Received: by 2002:a19:ca48:: with SMTP id h8mr21829508lfj.161.1593781266021; 
 Fri, 03 Jul 2020 06:01:06 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id a22sm4618221lfg.96.2020.07.03.06.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 06:01:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3] drm: gma500: Convert to GPIO descriptors
Date: Fri,  3 Jul 2020 14:59:01 +0200
Message-Id: <20200703125901.513476-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finalize he conversion of GMA500 to use only GPIO descriptors.
The GPIO look-up-table is associated with the device directly
in the GMA500 Medfield chip driver since no explicit platform
type device (such as in x86/platform/intel-mid) exists: the
GMA500 probes directly from the PCI device. Apparently GPIOs
128 and 34 are used on all of these so just go ahead and
register those for resetting the DSI pipes.

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Actually commit the last comment fix.
---
 drivers/gpu/drm/gma500/mdfld_device.c     | 20 +++++++++
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c    |  2 +-
 drivers/gpu/drm/gma500/mdfld_dsi_output.c | 51 ++++++++++++-----------
 drivers/gpu/drm/gma500/mdfld_dsi_output.h |  2 +-
 drivers/gpu/drm/gma500/mdfld_output.h     |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h    |  1 -
 6 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_device.c b/drivers/gpu/drm/gma500/mdfld_device.c
index b718efccdcf2..be9cf6b1e3b3 100644
--- a/drivers/gpu/drm/gma500/mdfld_device.c
+++ b/drivers/gpu/drm/gma500/mdfld_device.c
@@ -6,6 +6,7 @@
  **************************************************************************/
 
 #include <linux/delay.h>
+#include <linux/gpio/machine.h>
 
 #include <asm/intel_scu_ipc.h>
 
@@ -505,12 +506,31 @@ static const struct psb_offset mdfld_regmap[3] = {
 	},
 };
 
+/*
+ * The GPIO lines for resetting DSI pipe 0 and 2 are available in the
+ * PCI device 0000:00:0c.0 on the Medfield.
+ */
+static struct gpiod_lookup_table mdfld_dsi_pipe_gpio_table = {
+	.table  = {
+		GPIO_LOOKUP("0000:00:0c.0", 128, "dsi-pipe0-reset",
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("0000:00:0c.0", 34, "dsi-pipe2-reset",
+			    GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static int mdfld_chip_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	if (pci_enable_msi(dev->pdev))
 		dev_warn(dev->dev, "Enabling MSI failed!\n");
 	dev_priv->regmap = mdfld_regmap;
+
+	/* Associate the GPIO lines with the DRM device */
+	mdfld_dsi_pipe_gpio_table.dev_id = dev_name(dev->dev);
+	gpiod_add_lookup_table(&mdfld_dsi_pipe_gpio_table);
+
 	return mid_chip_setup(dev);
 }
 
diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
index c976a9dd9240..ae1223f631a7 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
@@ -955,7 +955,7 @@ struct mdfld_dsi_encoder *mdfld_dsi_dpi_init(struct drm_device *dev,
 
 		/* panel hard-reset */
 		if (p_funcs->reset) {
-			ret = p_funcs->reset(pipe);
+			ret = p_funcs->reset(dev, pipe);
 			if (ret) {
 				DRM_ERROR("Panel %d hard-reset failed\n", pipe);
 				return NULL;
diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
index f350ac1ead18..6473290126f2 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
@@ -28,6 +28,7 @@
 #include <linux/delay.h>
 #include <linux/moduleparam.h>
 #include <linux/pm_runtime.h>
+#include <linux/gpio/consumer.h>
 
 #include <asm/intel_scu_ipc.h>
 
@@ -432,42 +433,42 @@ static int mdfld_dsi_get_default_config(struct drm_device *dev,
 	return 0;
 }
 
-int mdfld_dsi_panel_reset(int pipe)
+int mdfld_dsi_panel_reset(struct drm_device *ddev, int pipe)
 {
-	unsigned gpio;
-	int ret = 0;
-
+	struct device *dev = ddev->dev;
+	struct gpio_desc *gpiod;
+
+	/*
+	 * Raise the GPIO reset line for the corresponding pipe to HIGH,
+	 * this is probably because it is active low so this takes the
+	 * respective pipe out of reset. (We have no code to put it back
+	 * into reset in this driver.)
+	 */
 	switch (pipe) {
 	case 0:
-		gpio = 128;
+		gpiod = gpiod_get(dev, "dsi-pipe0-reset", GPIOD_OUT_HIGH);
+		if (IS_ERR(gpiod))
+			return PTR_ERR(gpiod);
 		break;
 	case 2:
-		gpio = 34;
+		gpiod = gpiod_get(dev, "dsi-pipe2-reset", GPIOD_OUT_HIGH);
+		if (IS_ERR(gpiod))
+			return PTR_ERR(gpiod);
 		break;
 	default:
-		DRM_ERROR("Invalid output\n");
+		DRM_DEV_ERROR(dev, "Invalid output pipe\n");
 		return -EINVAL;
 	}
+	gpiod_put(gpiod);
 
-	ret = gpio_request(gpio, "gfx");
-	if (ret) {
-		DRM_ERROR("gpio_rqueset failed\n");
-		return ret;
-	}
-
-	ret = gpio_direction_output(gpio, 1);
-	if (ret) {
-		DRM_ERROR("gpio_direction_output failed\n");
-		goto gpio_error;
-	}
+	/* Flush posted writes on the device */
+	gpiod = gpiod_get(dev, "dsi-pipe0-reset", GPIOD_ASIS);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+	gpiod_get_value(gpiod);
+	gpiod_put(gpiod);
 
-	gpio_get_value(128);
-
-gpio_error:
-	if (gpio_is_valid(gpio))
-		gpio_free(gpio);
-
-	return ret;
+	return 0;
 }
 
 /*
diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.h b/drivers/gpu/drm/gma500/mdfld_dsi_output.h
index 0cccfe400a98..5c0db3c2903f 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.h
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.h
@@ -372,6 +372,6 @@ extern void mdfld_dsi_controller_init(struct mdfld_dsi_config *dsi_config,
 
 extern int mdfld_dsi_get_power_mode(struct mdfld_dsi_config *dsi_config,
 					u32 *mode, bool hs);
-extern int mdfld_dsi_panel_reset(int pipe);
+extern int mdfld_dsi_panel_reset(struct drm_device *dev, int pipe);
 
 #endif /*__MDFLD_DSI_OUTPUT_H__*/
diff --git a/drivers/gpu/drm/gma500/mdfld_output.h b/drivers/gpu/drm/gma500/mdfld_output.h
index 17a944d70add..37a516cc56be 100644
--- a/drivers/gpu/drm/gma500/mdfld_output.h
+++ b/drivers/gpu/drm/gma500/mdfld_output.h
@@ -54,7 +54,7 @@ struct panel_funcs {
 	const struct drm_encoder_helper_funcs *encoder_helper_funcs;
 	struct drm_display_mode * (*get_config_mode)(struct drm_device *);
 	int (*get_panel_info)(struct drm_device *, int, struct panel_info *);
-	int (*reset)(int pipe);
+	int (*reset)(struct drm_device *, int);
 	void (*drv_ic_init)(struct mdfld_dsi_config *dsi_config, int pipe);
 };
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index fb601983cef0..9221d1f545b0 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -13,7 +13,6 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-#include <linux/gpio.h>
 #include "gma_display.h"
 
 /*
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
