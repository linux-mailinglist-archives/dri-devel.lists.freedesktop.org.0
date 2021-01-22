Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977A7301446
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3C66EAE1;
	Sat, 23 Jan 2021 09:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370389CCE;
 Fri, 22 Jan 2021 11:38:59 +0000 (UTC)
IronPort-SDR: fHPIvlzYNVYFyRnGEu3tQZk0yRcw8HuT4UPywmNOWO6Zh3BshmAB1pnCIIjCam80UGRadGHU3N
 VO/pMb/uJ5Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198188215"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="198188215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 03:38:59 -0800
IronPort-SDR: EjC6KjBwVaQyoMjaeDCrouPPae06u46rynLTaC2y0Hk03YOBuDhxhGUkJS9m7zY+Ftymbenuxl
 2Sv9KOol+Wxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="385728931"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 22 Jan 2021 03:38:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9584814F; Fri, 22 Jan 2021 13:38:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm/gma500: Convert to use new SCU IPC API
Date: Fri, 22 Jan 2021 13:38:54 +0200
Message-Id: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the GMA500 driver to use the new SCU IPC API. This allows us
to get rid of the duplicate PMC IPC implementation which is now covered
in SCU IPC driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/gma500/Kconfig             |  1 +
 drivers/gpu/drm/gma500/mdfld_device.c      |  2 --
 drivers/gpu/drm/gma500/mdfld_dsi_output.c  |  2 --
 drivers/gpu/drm/gma500/mdfld_output.c      |  8 ++++++--
 drivers/gpu/drm/gma500/oaktrail_device.c   |  3 ---
 drivers/gpu/drm/gma500/psb_drv.h           |  3 +++
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c | 12 +++++++-----
 7 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 0e23c93a1094..1ef2cda5b5c2 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -30,6 +30,7 @@ config DRM_GMA3600
 config DRM_MEDFIELD
 	bool "Intel Medfield support (Experimental)"
 	depends on DRM_GMA500 && X86_INTEL_MID
+	select INTEL_SCU_IPC
 	help
 	  Say yes to include support for the Intel Medfield platform.
 
diff --git a/drivers/gpu/drm/gma500/mdfld_device.c b/drivers/gpu/drm/gma500/mdfld_device.c
index b83d59b21de5..12193e591327 100644
--- a/drivers/gpu/drm/gma500/mdfld_device.c
+++ b/drivers/gpu/drm/gma500/mdfld_device.c
@@ -8,8 +8,6 @@
 #include <linux/delay.h>
 #include <linux/gpio/machine.h>
 
-#include <asm/intel_scu_ipc.h>
-
 #include "mdfld_dsi_output.h"
 #include "mdfld_output.h"
 #include "mid_bios.h"
diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
index 4aab76613bd9..38ec49b71499 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
@@ -30,8 +30,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
-#include <asm/intel_scu_ipc.h>
-
 #include "mdfld_dsi_dpi.h"
 #include "mdfld_dsi_output.h"
 #include "mdfld_dsi_pkg_sender.h"
diff --git a/drivers/gpu/drm/gma500/mdfld_output.c b/drivers/gpu/drm/gma500/mdfld_output.c
index c95966bb0c96..518417f49be8 100644
--- a/drivers/gpu/drm/gma500/mdfld_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_output.c
@@ -25,6 +25,8 @@
  * Scott Rowe <scott.m.rowe@intel.com>
 */
 
+#include <asm/intel_scu_ipc.h>
+
 #include "mdfld_output.h"
 #include "mdfld_dsi_dpi.h"
 #include "mdfld_dsi_output.h"
@@ -58,11 +60,14 @@ static void mdfld_init_panel(struct drm_device *dev, int mipi_pipe,
 	}
 }
 
-
 int mdfld_output_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 
+	dev_priv->scu = devm_intel_scu_ipc_dev_get(&dev->pdev->dev);
+	if (!dev_priv->scu)
+		return -EPROBE_DEFER;
+
 	/* FIXME: hardcoded for now */
 	dev_priv->mdfld_panel_id = TC35876X;
 	/* MIPI panel 1 */
@@ -71,4 +76,3 @@ int mdfld_output_init(struct drm_device *dev)
 	mdfld_init_panel(dev, 1, HDMI);
 	return 0;
 }
-
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index 8754290b0e23..0c1a66b20f27 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -10,9 +10,6 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 
-#include <asm/intel-mid.h>
-#include <asm/intel_scu_ipc.h>
-
 #include <drm/drm.h>
 
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 5b7f7a312d53..938efdddc27c 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -428,6 +428,8 @@ struct psb_ops;
 
 #define PSB_NUM_PIPE		3
 
+struct intel_scu_ipc_dev;
+
 struct drm_psb_private {
 	struct drm_device *dev;
 	struct pci_dev *aux_pdev; /* Currently only used by mrst */
@@ -567,6 +569,7 @@ struct drm_psb_private {
 	 * Used for modifying backlight from
 	 * xrandr -- consider removing and using HAL instead
 	 */
+	struct intel_scu_ipc_dev *scu;
 	struct backlight_device *backlight_device;
 	struct drm_property *backlight_property;
 	bool backlight_enabled;
diff --git a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
index e5bdd99ad453..7d012db6352b 100644
--- a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
+++ b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
@@ -444,6 +444,7 @@ static inline u16 calc_clkdiv(unsigned long baseclk, unsigned int f)
 
 static void tc35876x_brightness_init(struct drm_device *dev)
 {
+	struct drm_psb_private *dev_priv = dev->dev_private;
 	int ret;
 	u8 pwmctrl;
 	u16 clkdiv;
@@ -451,23 +452,23 @@ static void tc35876x_brightness_init(struct drm_device *dev)
 	/* Make sure the PWM reference is the 19.2 MHz system clock. Read first
 	 * instead of setting directly to catch potential conflicts between PWM
 	 * users. */
-	ret = intel_scu_ipc_ioread8(GPIOPWMCTRL, &pwmctrl);
+	ret = intel_scu_ipc_dev_ioread8(dev_priv->scu, GPIOPWMCTRL, &pwmctrl);
 	if (ret || pwmctrl != 0x01) {
 		if (ret)
 			dev_err(&dev->pdev->dev, "GPIOPWMCTRL read failed\n");
 		else
 			dev_warn(&dev->pdev->dev, "GPIOPWMCTRL was not set to system clock (pwmctrl = 0x%02x)\n", pwmctrl);
 
-		ret = intel_scu_ipc_iowrite8(GPIOPWMCTRL, 0x01);
+		ret = intel_scu_ipc_dev_iowrite8(dev_priv->scu, GPIOPWMCTRL, 0x01);
 		if (ret)
 			dev_err(&dev->pdev->dev, "GPIOPWMCTRL set failed\n");
 	}
 
 	clkdiv = calc_clkdiv(SYSTEMCLK, PWM_FREQUENCY);
 
-	ret = intel_scu_ipc_iowrite8(PWM0CLKDIV1, (clkdiv >> 8) & 0xff);
+	ret = intel_scu_ipc_dev_iowrite8(dev_priv->scu, PWM0CLKDIV1, (clkdiv >> 8) & 0xff);
 	if (!ret)
-		ret = intel_scu_ipc_iowrite8(PWM0CLKDIV0, clkdiv & 0xff);
+		ret = intel_scu_ipc_dev_iowrite8(dev_priv->scu, PWM0CLKDIV0, clkdiv & 0xff);
 
 	if (ret)
 		dev_err(&dev->pdev->dev, "PWM0CLKDIV set failed\n");
@@ -480,6 +481,7 @@ static void tc35876x_brightness_init(struct drm_device *dev)
 
 void tc35876x_brightness_control(struct drm_device *dev, int level)
 {
+	struct drm_psb_private *dev_priv = dev->dev_private;
 	int ret;
 	u8 duty_val;
 	u8 panel_duty_val;
@@ -495,7 +497,7 @@ void tc35876x_brightness_control(struct drm_device *dev, int level)
 	panel_duty_val = (2 * level - 100) * 0xA9 /
 			 MDFLD_DSI_BRIGHTNESS_MAX_LEVEL + 0x56;
 
-	ret = intel_scu_ipc_iowrite8(PWM0DUTYCYCLE, duty_val);
+	ret = intel_scu_ipc_dev_iowrite8(dev_priv->scu, PWM0DUTYCYCLE, duty_val);
 	if (ret)
 		dev_err(&tc35876x_client->dev, "%s: ipc write fail\n",
 			__func__);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
