Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED5213596
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 09:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0EE6E9A3;
	Fri,  3 Jul 2020 07:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236BB6E9A3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 07:59:11 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y13so17948724lfe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 00:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ySw6ja96kmzmy6ukg5tSpLgj5xcKDYU0d1iMpa3wbZU=;
 b=nWNZUtQNbxojdufqYcbUnyWEwxqB4h1CJlOhDgk0U8GutmTFtvSmk9xCB3oec8myhI
 XTxDzu3z8A4RSJXUkuzfcw7ms7OnBpPVYw6N99biXFZ9TK1JdU9x4RJrQkhyPLkNxSB6
 oyV3cXz5T9p8WLpOOcy12FvZfiRp65flMsSXlCHaS3Js2ETpOAVUm4Qbl3xTuK+lnEv1
 qsCmziRzOngmrcpmHWvQtQKTGCYLmdIZMon30eS3sVM8QnsfEuB4HXXn2o7HJegEy0Jq
 FzJi/7rGqej8hqqDAg2TSVnm6hEWyQVShMBn6upPwQLye11LqJ21uAI2EfuL/ygrILHa
 Dq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ySw6ja96kmzmy6ukg5tSpLgj5xcKDYU0d1iMpa3wbZU=;
 b=HoNPTQzxnmwGIYdpjLFCAPOmmzJgSPH7fxnHbffvH//HahUVAbBOEgtIKAxoITZMu+
 yr3BWLDWCWAGPXXvpJuhh1AY5zsDrtTdpOLqvhNVR5tBqH6Ac/CoOGkzQwtwhK9Qqr7K
 se2Y2Fnjg64p0Cq4YFBmOFjibkWXeDAzXaCUqefyds2JgIrxadSnx4m/5ZIMeAi7F+eN
 LWSFLxaUDXtNIN+eT+SggJMiQtWdAoueUwi1nBvPTlJR5FRev5DwVxPlzRzLqz3xqWVg
 t7qg6ScrGaEkc7GZlQLwZavgI6LWQVputtEvRC0YsdMsGQ+obJ3ei+0C7Upewq2FK4Lf
 a5GQ==
X-Gm-Message-State: AOAM5307NZJRJMtYnJxk1mu1ngb22xxJP3rWqMjZonanYe2JMioBEcdN
 A2Jg1+NZSptVcdmGH8aokpfUaJoGjso7uw==
X-Google-Smtp-Source: ABdhPJwFZXfkulDE4wk6Y9iqe2DNlAJ/pUZw3/Nn9vqeUZkHEG2wq6piF/CNhxVO3VZMFj4Ce/OLBg==
X-Received: by 2002:a19:8253:: with SMTP id e80mr21710436lfd.199.1593763149127; 
 Fri, 03 Jul 2020 00:59:09 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id i8sm4368336lja.18.2020.07.03.00.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:59:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm: gma500: Convert to GPIO descriptors
Date: Fri,  3 Jul 2020 09:57:04 +0200
Message-Id: <20200703075704.505849-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Fix comments
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
index f350ac1ead18..c9478261964a 100644
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
+	/* Always read the pipe0 GPIO line, FIXME: explain why! */
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
