Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC2D20C4D3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 01:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EDF6E195;
	Sat, 27 Jun 2020 23:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78806E195
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 23:29:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q7so800847ljm.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AS4roLWc588NrDVBWwvtIDKxmiE/S4XwzoTaolYHArw=;
 b=yybUkKnhAtdRe02WbJgs7OH9wQgBQq+o0KmmEWxnxvlYYkzuBiBNKB468kW3V8qwdy
 lMZWlSwT/kHvKn+gYTMqvch59xsen0hbX3Q3M4g1UI6Ava7tE8XXqsZ6PX9CbtCU4xke
 WkSsFV1Bf79RDvlCMt+gsbkcdQJ+jzG3cPMRiPaEYAJoSn8hEQb5HbC+cCc7mzR2uw4J
 8wzQAuUlnXsdKap1+7LhMXbtHTrD9N9HRAan/wyirmPHEu+j3DXnWV9XniwVhXsO4rvy
 KY3wOsp81J0TFX/TT3AQHvuY+KegxmCh0VXSREYLk53PsTrCkuosDejQTieQcqNJqQE+
 KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AS4roLWc588NrDVBWwvtIDKxmiE/S4XwzoTaolYHArw=;
 b=rfyF6Qye23RCD5sserZe/vgQqhrc1Oe+UuSTcXIdR1h8cpAC0uuAtux8+TMjJoDK8F
 wFzDFX6lTM0pHmUR8LaEgJcMCMNkX/3AyC69jLulUtJ6dNLf1CCJKU3Xv2s1NtwBIZUM
 X56BobgQ3e+k/Jy2NP7cpsTOkEWwUpSORDI4UpXab0Sapu8ydE9s/xuQ4xl0qR4RiHLi
 lVX+bZTNhZ7Msq0wvVF5ib3rP+asxJXxgNb+YWaswoGjEs0pCbwDtDqlGLlIV25X+PkW
 EHCblV6LRBTRgR7SkQc3FdIBnuvKZgrDlxO+wvm98KTSjUAWP/pCalUmef/SbBriyJmi
 jQxw==
X-Gm-Message-State: AOAM530GzqjQaNE8RAKOTH4mN9SL7Z252SmcTlerBib//EKdkWbzoRZh
 /a3LpMt3QmIrp6/TvNjwe8B3AiCG8i0=
X-Google-Smtp-Source: ABdhPJxyDq0FC/uON4/JkCV1P7PxA6j4JcrqRVTceAc8Cvdj+JJAzgZ6KkcPKzaPnPZr0tISUPPQSQ==
X-Received: by 2002:a2e:9c95:: with SMTP id x21mr4855969lji.435.1593300573887; 
 Sat, 27 Jun 2020 16:29:33 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id m14sm9151041lfp.18.2020.06.27.16.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 16:29:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: gma500: Convert to GPIO descriptors
Date: Sun, 28 Jun 2020 01:29:28 +0200
Message-Id: <20200627232928.696195-1-linus.walleij@linaro.org>
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
88 and 34 are used on all of these so just go ahead and
register those for resetting the DSI pipes.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
