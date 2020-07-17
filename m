Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0D2235B0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9E6ED17;
	Fri, 17 Jul 2020 07:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E266E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594917542; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAb1+xvzI52QV3FiJiQNaDSJzd2P+xFYZ0c0CxG7XiE=;
 b=CaFAtgOwnA9BoZUuvjYUPeDjgWv3pzxhzAzhJW/OzghxggIom8HQfsmW4A32EBkUtOU7nr
 u3xzn8UQiIkceNsJeu6v74+gKKrQiOtlPyb9AiGtGVzipd4MTLgVrABf+TYNsX3DLMK6IG
 MD+vMOT34tPJlCJ/MjxQ1fO8Jb6RmeQ=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 10/12] drm/ingenic: Add support for the IPU
Date: Thu, 16 Jul 2020 18:38:44 +0200
Message-Id: <20200716163846.174790-10-paul@crapouillou.net>
In-Reply-To: <20200716163846.174790-1-paul@crapouillou.net>
References: <20200716163846.174790-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Image Processing Unit (IPU) found in all Ingenic
SoCs.

The IPU can upscale and downscale a source frame of arbitrary size
ranging from 4x4 to 4096x4096 on newer SoCs, with bicubic filtering
on newer SoCs, bilinear filtering on older SoCs. Nearest-neighbour can
also be obtained with proper coefficients.

Starting from the JZ4725B, the IPU supports a mode where its output is
sent directly to the LCDC, without having to be written to RAM first.
This makes it possible to use the IPU as a DRM plane on the compatible
SoCs, and have it convert and scale anything the userspace asks for to
what's available for the display.

Regarding pixel formats, older SoCs support packed YUV 4:2:2 and various
planar YUV formats. Newer SoCs introduced support for RGB.

Since the IPU is a separate hardware block, to make it work properly the
Ingenic DRM driver will now register itself as a component master in
case the IPU driver has been enabled in the config.

When enabled in the config, the CRTC will see the IPU as a second primary
plane. It cannot be enabled at the same time as the regular primary
plane. It has the same priority, which means that it will also display
below the overlay plane.

v2: - ingenic-ipu is no longer its own module. It will be built
      into the ingenic-drm module.
    - If enabled in the config, both the core driver and the IPU
      driver will register as components; otherwise the core
      driver will bypass that and call the ingenic_drm_bind()
      function directly.
    - Since both files now build into the same module, the
      symbols previously exported as GPL are not exported anymore,
      since they are only used internally.
    - Fix SPDX license header in ingenic-ipu.h
    - Avoid using 'for(;;);' loops without trailing statement(s)

v3: - Pass priv structure to IRQ handler; that way we don't hardcode
      the expectation that the IPU plane is at index #0.
    - Rework osd_changed() to account for src_* changes
    - Add multiplanar YUV 4:4:4 support
    - Commit fb addresses to HW at vblank, since addr registers are
      not shadow registers
    - Probe IPU component later so that IPU plane is last
    - Fix driver not working on IPU-less hardware
    - Use IPU driver's name as the IRQ name to avoid having two
      'ingenic-drm' in /proc/interrupts
    - Fix IPU only working for still images on JZ4725B
    - Add a bit more code comments

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/Kconfig           |  11 +
 drivers/gpu/drm/ingenic/Makefile          |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 171 ++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  12 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 852 ++++++++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-ipu.h     | 109 +++
 6 files changed, 1142 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-ipu.c
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-ipu.h

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index d82c3d37ec9c..477d5387e43e 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -14,3 +14,14 @@ config DRM_INGENIC
 	  Choose this option for DRM support for the Ingenic SoCs.
 
 	  If M is selected the module will be called ingenic-drm.
+
+if DRM_INGENIC
+
+config DRM_INGENIC_IPU
+	bool "IPU support for Ingenic SoCs"
+	help
+	  Choose this option to enable support for the IPU found in Ingenic SoCs.
+
+	  The Image Processing Unit (IPU) will appear as a second primary plane.
+
+endif
diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index 9875628dd8bc..d313326bdddb 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
-ingenic-drm-y += ingenic-drm-drv.o
+ingenic-drm-y = ingenic-drm-drv.o
+ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e922b910ad39..296d21d203b8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -6,6 +6,7 @@
 
 #include "ingenic-drm.h"
 
+#include <linux/component.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -54,7 +55,7 @@ struct ingenic_drm {
 	 * f0 (aka. foreground0) can be overlayed. Z-order is fixed in
 	 * hardware and cannot be changed.
 	 */
-	struct drm_plane f0, f1;
+	struct drm_plane f0, f1, *ipu_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 
@@ -190,13 +191,21 @@ static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
 
 	regmap_set_bits(priv->map, JZ_REG_LCD_CTRL,
 			JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
+
+	/*
+	 * IPU restart - specify how much time the LCDC will wait before
+	 * transferring a new frame from the IPU. The value is the one
+	 * suggested in the programming manual.
+	 */
+	regmap_write(priv->map, JZ_REG_LCD_IPUR, JZ_LCD_IPUR_IPUREN |
+		     (ht * vpe / 3) << JZ_LCD_IPUR_IPUR_LSB);
 }
 
 static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 					 struct drm_crtc_state *state)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
-	struct drm_plane_state *f1_state, *f0_state;
+	struct drm_plane_state *f1_state, *f0_state, *ipu_state;
 	long rate;
 
 	if (!drm_atomic_crtc_needs_modeset(state))
@@ -215,13 +224,44 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 		f1_state = drm_atomic_get_plane_state(state->state, &priv->f1);
 		f0_state = drm_atomic_get_plane_state(state->state, &priv->f0);
 
+		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && priv->ipu_plane) {
+			ipu_state = drm_atomic_get_plane_state(state->state, priv->ipu_plane);
+
+			/* IPU and F1 planes cannot be enabled at the same time. */
+			if (f1_state->fb && ipu_state->fb) {
+				dev_dbg(priv->dev, "Cannot enable both F1 and IPU\n");
+				return -EINVAL;
+			}
+		}
+
 		/* If all the planes are disabled, we won't get a VBLANK IRQ */
-		priv->no_vblank = !f1_state->fb && !f0_state->fb;
+		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
+				  !(priv->ipu_plane && ipu_state->fb);
 	}
 
 	return 0;
 }
 
+static void ingenic_drm_crtc_atomic_begin(struct drm_crtc *crtc,
+					  struct drm_crtc_state *oldstate)
+{
+	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	u32 ctrl = 0;
+
+	if (priv->soc_info->has_osd &&
+	    drm_atomic_crtc_needs_modeset(crtc->state)) {
+		/*
+		 * If IPU plane is enabled, enable IPU as source for the F1
+		 * plane; otherwise use regular DMA.
+		 */
+		if (priv->ipu_plane && priv->ipu_plane->state->fb)
+			ctrl |= JZ_LCD_OSDCTRL_IPU;
+
+		regmap_update_bits(priv->map, JZ_REG_LCD_OSDCTRL,
+				   JZ_LCD_OSDCTRL_IPU, ctrl);
+	}
+}
+
 static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 					  struct drm_crtc_state *oldstate)
 {
@@ -311,10 +351,9 @@ static void ingenic_drm_plane_enable(struct ingenic_drm *priv,
 	}
 }
 
-static void ingenic_drm_plane_atomic_disable(struct drm_plane *plane,
-					     struct drm_plane_state *old_state)
+void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm *priv = dev_get_drvdata(dev);
 	unsigned int en_bit;
 
 	if (priv->soc_info->has_osd) {
@@ -327,9 +366,18 @@ static void ingenic_drm_plane_atomic_disable(struct drm_plane *plane,
 	}
 }
 
-static void ingenic_drm_plane_config(struct ingenic_drm *priv,
-				     struct drm_plane *plane, u32 fourcc)
+static void ingenic_drm_plane_atomic_disable(struct drm_plane *plane,
+					     struct drm_plane_state *old_state)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+
+	ingenic_drm_plane_disable(priv->dev, plane);
+}
+
+void ingenic_drm_plane_config(struct device *dev,
+			      struct drm_plane *plane, u32 fourcc)
 {
+	struct ingenic_drm *priv = dev_get_drvdata(dev);
 	struct drm_plane_state *state = plane->state;
 	unsigned int xy_reg, size_reg;
 	unsigned int ctrl = 0;
@@ -411,7 +459,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
 
 		if (drm_atomic_crtc_needs_modeset(state->crtc->state))
-			ingenic_drm_plane_config(priv, plane,
+			ingenic_drm_plane_config(priv->dev, plane,
 						 state->fb->format->format);
 	}
 }
@@ -604,6 +652,7 @@ static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
 static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
 	.atomic_enable		= ingenic_drm_crtc_atomic_enable,
 	.atomic_disable		= ingenic_drm_crtc_atomic_disable,
+	.atomic_begin		= ingenic_drm_crtc_atomic_begin,
 	.atomic_flush		= ingenic_drm_crtc_atomic_flush,
 	.atomic_check		= ingenic_drm_crtc_atomic_check,
 };
@@ -624,10 +673,17 @@ static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
 };
 
-static int ingenic_drm_probe(struct platform_device *pdev)
+static void ingenic_drm_unbind_all(void *d)
 {
+	struct ingenic_drm *priv = d;
+
+	component_unbind_all(priv->dev, &priv->drm);
+}
+
+static int ingenic_drm_bind(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
 	const struct jz_soc_info *soc_info;
-	struct device *dev = &pdev->dev;
 	struct ingenic_drm *priv;
 	struct clk *parent_clk;
 	struct drm_bridge *bridge;
@@ -728,6 +784,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		priv->dma_hwdesc_f0->id = 0xf0;
 	}
 
+	if (soc_info->has_osd)
+		priv->ipu_plane = drm_plane_from_index(drm, 0);
+
 	drm_plane_helper_add(&priv->f1, &ingenic_drm_plane_helper_funcs);
 
 	ret = drm_universal_plane_init(drm, &priv->f1, 1,
@@ -736,7 +795,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 				       ARRAY_SIZE(ingenic_drm_primary_formats),
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
-		dev_err(dev, "Failed to register primary plane: %i\n", ret);
+		dev_err(dev, "Failed to register plane: %i\n", ret);
 		return ret;
 	}
 
@@ -764,6 +823,25 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 				ret);
 			return ret;
 		}
+
+		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
+			ret = component_bind_all(dev, drm);
+			if (ret) {
+				if (ret != -EPROBE_DEFER)
+					dev_err(dev, "Failed to bind components: %i\n", ret);
+				return ret;
+			}
+
+			ret = devm_add_action_or_reset(dev, ingenic_drm_unbind_all, priv);
+			if (ret)
+				return ret;
+
+			priv->ipu_plane = drm_plane_from_index(drm, 2);
+			if (!priv->ipu_plane) {
+				dev_err(dev, "Failed to retrieve IPU plane\n");
+				return -EINVAL;
+			}
+		}
 	}
 
 	priv->encoder.possible_crtcs = 1;
@@ -852,9 +930,14 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ingenic_drm_remove(struct platform_device *pdev)
+static int compare_of(struct device *dev, void *data)
 {
-	struct ingenic_drm *priv = platform_get_drvdata(pdev);
+	return dev->of_node == data;
+}
+
+static void ingenic_drm_unbind(struct device *dev)
+{
+	struct ingenic_drm *priv = dev_get_drvdata(dev);
 
 	if (priv->lcd_clk)
 		clk_disable_unprepare(priv->lcd_clk);
@@ -862,6 +945,42 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(&priv->drm);
 	drm_atomic_helper_shutdown(&priv->drm);
+}
+
+static const struct component_master_ops ingenic_master_ops = {
+	.bind = ingenic_drm_bind,
+	.unbind = ingenic_drm_unbind,
+};
+
+static int ingenic_drm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct component_match *match = NULL;
+	struct device_node *np;
+
+	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
+		return ingenic_drm_bind(dev);
+
+	/* IPU is at port address 8 */
+	np = of_graph_get_remote_node(dev->of_node, 8, 0);
+	if (!np) {
+		dev_err(dev, "Unable to get IPU node\n");
+		return -EINVAL;
+	}
+
+	drm_of_component_match_add(dev, &match, compare_of, np);
+
+	return component_master_add_with_match(dev, &ingenic_master_ops, match);
+}
+
+static int ingenic_drm_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
+		ingenic_drm_unbind(dev);
+	else
+		component_master_del(dev, &ingenic_master_ops);
 
 	return 0;
 }
@@ -903,7 +1022,29 @@ static struct platform_driver ingenic_drm_driver = {
 	.probe = ingenic_drm_probe,
 	.remove = ingenic_drm_remove,
 };
-module_platform_driver(ingenic_drm_driver);
+
+static int ingenic_drm_init(void)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
+		err = platform_driver_register(ingenic_ipu_driver_ptr);
+		if (err)
+			return err;
+	}
+
+	return platform_driver_register(&ingenic_drm_driver);
+}
+module_init(ingenic_drm_init);
+
+static void ingenic_drm_exit(void)
+{
+	platform_driver_unregister(&ingenic_drm_driver);
+
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
+		platform_driver_unregister(ingenic_ipu_driver_ptr);
+}
+module_exit(ingenic_drm_exit);
 
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
 MODULE_DESCRIPTION("DRM driver for the Ingenic SoCs\n");
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index d0b827a9fe83..43f7d959cff7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -8,6 +8,7 @@
 #define DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H
 
 #include <linux/bitops.h>
+#include <linux/types.h>
 
 #define JZ_REG_LCD_CFG				0x00
 #define JZ_REG_LCD_VSYNC			0x04
@@ -158,4 +159,15 @@
 #define JZ_LCD_SIZE01_WIDTH_LSB			0
 #define JZ_LCD_SIZE01_HEIGHT_LSB		16
 
+struct device;
+struct drm_plane;
+struct drm_plane_state;
+struct platform_driver;
+
+void ingenic_drm_plane_config(struct device *dev,
+			      struct drm_plane *plane, u32 fourcc);
+void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane);
+
+extern struct platform_driver *ingenic_ipu_driver_ptr;
+
 #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
new file mode 100644
index 000000000000..45095ebf1526
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -0,0 +1,852 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Ingenic JZ47xx IPU driver
+//
+// Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
+
+#include "ingenic-drm.h"
+#include "ingenic-ipu.h"
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/gcd.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/time.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_property.h>
+#include <drm/drm_vblank.h>
+
+struct ingenic_ipu;
+
+struct soc_info {
+	const u32 *formats;
+	size_t num_formats;
+	bool has_bicubic;
+
+	void (*set_coefs)(struct ingenic_ipu *ipu, unsigned int reg,
+			  unsigned int sharpness, bool downscale,
+			  unsigned int weight, unsigned int offset);
+};
+
+struct ingenic_ipu {
+	struct drm_plane plane;
+	struct drm_device *drm;
+	struct device *dev, *master;
+	struct regmap *map;
+	struct clk *clk;
+	const struct soc_info *soc_info;
+
+	unsigned int numW, numH, denomW, denomH;
+
+	dma_addr_t addr_y, addr_u, addr_v;
+
+	struct drm_property *sharpness_prop;
+	unsigned int sharpness;
+};
+
+/* Signed 15.16 fixed-point math (for bicubic scaling coefficients) */
+#define I2F(i) ((s32)(i) * 65536)
+#define F2I(f) ((f) / 65536)
+#define FMUL(fa, fb) ((s32)(((s64)(fa) * (s64)(fb)) / 65536))
+#define SHARPNESS_INCR (I2F(-1) / 8)
+
+static inline struct ingenic_ipu *plane_to_ingenic_ipu(struct drm_plane *plane)
+{
+	return container_of(plane, struct ingenic_ipu, plane);
+}
+
+/*
+ * Apply conventional cubic convolution kernel. Both parameters
+ *  and return value are 15.16 signed fixed-point.
+ *
+ *  @f_a: Sharpness factor, typically in range [-4.0, -0.25].
+ *        A larger magnitude increases perceived sharpness, but going past
+ *        -2.0 might cause ringing artifacts to outweigh any improvement.
+ *        Nice values on a 320x240 LCD are between -0.75 and -2.0.
+ *
+ *  @f_x: Absolute distance in pixels from 'pixel 0' sample position
+ *        along horizontal (or vertical) source axis. Range is [0, +2.0].
+ *
+ *  returns: Weight of this pixel within 4-pixel sample group. Range is
+ *           [-2.0, +2.0]. For moderate (i.e. > -3.0) sharpness factors,
+ *           range is within [-1.0, +1.0].
+ */
+static inline s32 cubic_conv(s32 f_a, s32 f_x)
+{
+	const s32 f_1 = I2F(1);
+	const s32 f_2 = I2F(2);
+	const s32 f_3 = I2F(3);
+	const s32 f_4 = I2F(4);
+	const s32 f_x2 = FMUL(f_x, f_x);
+	const s32 f_x3 = FMUL(f_x, f_x2);
+
+	if (f_x <= f_1)
+		return FMUL((f_a + f_2), f_x3) - FMUL((f_a + f_3), f_x2) + f_1;
+	else if (f_x <= f_2)
+		return FMUL(f_a, (f_x3 - 5 * f_x2 + 8 * f_x - f_4));
+	else
+		return 0;
+}
+
+/*
+ * On entry, "weight" is a coefficient suitable for bilinear mode,
+ *  which is converted to a set of four suitable for bicubic mode.
+ *
+ * "weight 512" means all of pixel 0;
+ * "weight 256" means half of pixel 0 and half of pixel 1;
+ * "weight 0" means all of pixel 1;
+ *
+ * "offset" is increment to next source pixel sample location.
+ */
+static void jz4760_set_coefs(struct ingenic_ipu *ipu, unsigned int reg,
+			     unsigned int sharpness, bool downscale,
+			     unsigned int weight, unsigned int offset)
+{
+	u32 val;
+	s32 w0, w1, w2, w3; /* Pixel weights at X (or Y) offsets -1,0,1,2 */
+
+	weight = clamp_val(weight, 0, 512);
+
+	if (sharpness < 2) {
+		/*
+		 *  When sharpness setting is 0, emulate nearest-neighbor.
+		 *  When sharpness setting is 1, emulate bilinear.
+		 */
+
+		if (sharpness == 0)
+			weight = weight >= 256 ? 512 : 0;
+		w0 = 0;
+		w1 = weight;
+		w2 = 512 - weight;
+		w3 = 0;
+	} else {
+		const s32 f_a = SHARPNESS_INCR * sharpness;
+		const s32 f_h = I2F(1) / 2; /* Round up 0.5 */
+
+		/*
+		 * Note that always rounding towards +infinity here is intended.
+		 * The resulting coefficients match a round-to-nearest-int
+		 * double floating-point implementation.
+		 */
+
+		weight = 512 - weight;
+		w0 = F2I(f_h + 512 * cubic_conv(f_a, I2F(512  + weight) / 512));
+		w1 = F2I(f_h + 512 * cubic_conv(f_a, I2F(0    + weight) / 512));
+		w2 = F2I(f_h + 512 * cubic_conv(f_a, I2F(512  - weight) / 512));
+		w3 = F2I(f_h + 512 * cubic_conv(f_a, I2F(1024 - weight) / 512));
+		w0 = clamp_val(w0, -1024, 1023);
+		w1 = clamp_val(w1, -1024, 1023);
+		w2 = clamp_val(w2, -1024, 1023);
+		w3 = clamp_val(w3, -1024, 1023);
+	}
+
+	val = ((w1 & JZ4760_IPU_RSZ_COEF_MASK) << JZ4760_IPU_RSZ_COEF31_LSB) |
+		((w0 & JZ4760_IPU_RSZ_COEF_MASK) << JZ4760_IPU_RSZ_COEF20_LSB);
+	regmap_write(ipu->map, reg, val);
+
+	val = ((w3 & JZ4760_IPU_RSZ_COEF_MASK) << JZ4760_IPU_RSZ_COEF31_LSB) |
+		((w2 & JZ4760_IPU_RSZ_COEF_MASK) << JZ4760_IPU_RSZ_COEF20_LSB) |
+		((offset & JZ4760_IPU_RSZ_OFFSET_MASK) << JZ4760_IPU_RSZ_OFFSET_LSB);
+	regmap_write(ipu->map, reg, val);
+}
+
+static void jz4725b_set_coefs(struct ingenic_ipu *ipu, unsigned int reg,
+			      unsigned int sharpness, bool downscale,
+			      unsigned int weight, unsigned int offset)
+{
+	u32 val = JZ4725B_IPU_RSZ_LUT_OUT_EN;
+	unsigned int i;
+
+	weight = clamp_val(weight, 0, 512);
+
+	if (sharpness == 0)
+		weight = weight >= 256 ? 512 : 0;
+
+	val |= (weight & JZ4725B_IPU_RSZ_LUT_COEF_MASK) << JZ4725B_IPU_RSZ_LUT_COEF_LSB;
+	if (downscale || !!offset)
+		val |= JZ4725B_IPU_RSZ_LUT_IN_EN;
+
+	regmap_write(ipu->map, reg, val);
+
+	if (downscale) {
+		for (i = 1; i < offset; i++)
+			regmap_write(ipu->map, reg, JZ4725B_IPU_RSZ_LUT_IN_EN);
+	}
+}
+
+static void ingenic_ipu_set_downscale_coefs(struct ingenic_ipu *ipu,
+					    unsigned int reg,
+					    unsigned int num,
+					    unsigned int denom)
+{
+	unsigned int i, offset, weight, weight_num = denom;
+
+	for (i = 0; i < num; i++) {
+		weight_num = num + (weight_num - num) % (num * 2);
+		weight = 512 - 512 * (weight_num - num) / (num * 2);
+		weight_num += denom * 2;
+		offset = (weight_num - num) / (num * 2);
+
+		ipu->soc_info->set_coefs(ipu, reg, ipu->sharpness,
+					 true, weight, offset);
+	}
+}
+
+static void ingenic_ipu_set_integer_upscale_coefs(struct ingenic_ipu *ipu,
+						  unsigned int reg,
+						  unsigned int num)
+{
+	/*
+	 * Force nearest-neighbor scaling and use simple math when upscaling
+	 * by an integer ratio. It looks better, and fixes a few problem cases.
+	 */
+	unsigned int i;
+
+	for (i = 0; i < num; i++)
+		ipu->soc_info->set_coefs(ipu, reg, 0, false, 512, i == num - 1);
+}
+
+static void ingenic_ipu_set_upscale_coefs(struct ingenic_ipu *ipu,
+					  unsigned int reg,
+					  unsigned int num,
+					  unsigned int denom)
+{
+	unsigned int i, offset, weight, weight_num = 0;
+
+	for (i = 0; i < num; i++) {
+		weight = 512 - 512 * weight_num / num;
+		weight_num += denom;
+		offset = weight_num >= num;
+
+		if (offset)
+			weight_num -= num;
+
+		ipu->soc_info->set_coefs(ipu, reg, ipu->sharpness,
+					 false, weight, offset);
+	}
+}
+
+static void ingenic_ipu_set_coefs(struct ingenic_ipu *ipu, unsigned int reg,
+				  unsigned int num, unsigned int denom)
+{
+	/* Begin programming the LUT */
+	regmap_write(ipu->map, reg, -1);
+
+	if (denom > num)
+		ingenic_ipu_set_downscale_coefs(ipu, reg, num, denom);
+	else if (denom == 1)
+		ingenic_ipu_set_integer_upscale_coefs(ipu, reg, num);
+	else
+		ingenic_ipu_set_upscale_coefs(ipu, reg, num, denom);
+}
+
+static int reduce_fraction(unsigned int *num, unsigned int *denom)
+{
+	unsigned long d = gcd(*num, *denom);
+
+	/* The scaling table has only 31 entries */
+	if (*num > 31 * d)
+		return -EINVAL;
+
+	*num /= d;
+	*denom /= d;
+	return 0;
+}
+
+static inline bool osd_changed(struct drm_plane_state *state,
+			       struct drm_plane_state *oldstate)
+{
+	return state->src_x != oldstate->src_x ||
+		state->src_y != oldstate->src_y ||
+		state->src_w != oldstate->src_w ||
+		state->src_h != oldstate->src_h ||
+		state->crtc_x != oldstate->crtc_x ||
+		state->crtc_y != oldstate->crtc_y ||
+		state->crtc_w != oldstate->crtc_w ||
+		state->crtc_h != oldstate->crtc_h;
+}
+
+static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
+					    struct drm_plane_state *oldstate)
+{
+	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *finfo;
+	u32 ctrl, stride = 0, coef_index = 0, format = 0;
+	bool needs_modeset, upscaling_w, upscaling_h;
+
+	if (!state || !state->fb)
+		return;
+
+	finfo = drm_format_info(state->fb->format->format);
+
+	/* Reset all the registers if needed */
+	needs_modeset = drm_atomic_crtc_needs_modeset(state->crtc->state);
+	if (needs_modeset) {
+		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RST);
+
+		/* Enable the chip */
+		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL,
+				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
+	}
+
+	/* New addresses will be committed in vblank handler... */
+	ipu->addr_y = drm_fb_cma_get_gem_addr(state->fb, state, 0);
+	if (finfo->num_planes > 1)
+		ipu->addr_u = drm_fb_cma_get_gem_addr(state->fb, state, 1);
+	if (finfo->num_planes > 2)
+		ipu->addr_v = drm_fb_cma_get_gem_addr(state->fb, state, 2);
+
+	if (!needs_modeset)
+		return;
+
+	/* Or right here if we're doing a full modeset. */
+	regmap_write(ipu->map, JZ_REG_IPU_Y_ADDR, ipu->addr_y);
+	regmap_write(ipu->map, JZ_REG_IPU_U_ADDR, ipu->addr_u);
+	regmap_write(ipu->map, JZ_REG_IPU_V_ADDR, ipu->addr_v);
+
+	if (finfo->num_planes == 1)
+		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_SPKG_SEL);
+
+	ingenic_drm_plane_config(ipu->master, plane, DRM_FORMAT_XRGB8888);
+
+	/* Set the input height/width/strides */
+	if (finfo->num_planes > 2)
+		stride = ((state->src_w >> 16) * finfo->cpp[2] / finfo->hsub)
+			<< JZ_IPU_UV_STRIDE_V_LSB;
+
+	if (finfo->num_planes > 1)
+		stride |= ((state->src_w >> 16) * finfo->cpp[1] / finfo->hsub)
+			<< JZ_IPU_UV_STRIDE_U_LSB;
+
+	regmap_write(ipu->map, JZ_REG_IPU_UV_STRIDE, stride);
+
+	stride = ((state->src_w >> 16) * finfo->cpp[0]) << JZ_IPU_Y_STRIDE_Y_LSB;
+	regmap_write(ipu->map, JZ_REG_IPU_Y_STRIDE, stride);
+
+	regmap_write(ipu->map, JZ_REG_IPU_IN_GS,
+		     (stride << JZ_IPU_IN_GS_W_LSB) |
+		     ((state->src_h >> 16) << JZ_IPU_IN_GS_H_LSB));
+
+	switch (finfo->format) {
+	case DRM_FORMAT_XRGB1555:
+		format = JZ_IPU_D_FMT_IN_FMT_RGB555 |
+			JZ_IPU_D_FMT_RGB_OUT_OFT_RGB;
+		break;
+	case DRM_FORMAT_XBGR1555:
+		format = JZ_IPU_D_FMT_IN_FMT_RGB555 |
+			JZ_IPU_D_FMT_RGB_OUT_OFT_BGR;
+		break;
+	case DRM_FORMAT_RGB565:
+		format = JZ_IPU_D_FMT_IN_FMT_RGB565 |
+			JZ_IPU_D_FMT_RGB_OUT_OFT_RGB;
+		break;
+	case DRM_FORMAT_BGR565:
+		format = JZ_IPU_D_FMT_IN_FMT_RGB565 |
+			JZ_IPU_D_FMT_RGB_OUT_OFT_BGR;
+		break;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XYUV8888:
+		format = JZ_IPU_D_FMT_IN_FMT_RGB888 |
+			JZ_IPU_D_FMT_RGB_OUT_OFT_RGB;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		format = JZ_IPU_D_FMT_IN_FMT_RGB888 |
+			JZ_IPU_D_FMT_RGB_OUT_OFT_BGR;
+		break;
+	case DRM_FORMAT_YUYV:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV422 |
+			JZ_IPU_D_FMT_YUV_VY1UY0;
+		break;
+	case DRM_FORMAT_YVYU:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV422 |
+			JZ_IPU_D_FMT_YUV_UY1VY0;
+		break;
+	case DRM_FORMAT_UYVY:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV422 |
+			JZ_IPU_D_FMT_YUV_Y1VY0U;
+		break;
+	case DRM_FORMAT_VYUY:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV422 |
+			JZ_IPU_D_FMT_YUV_Y1UY0V;
+		break;
+	case DRM_FORMAT_YUV411:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV411;
+		break;
+	case DRM_FORMAT_YUV420:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV420;
+		break;
+	case DRM_FORMAT_YUV422:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV422;
+		break;
+	case DRM_FORMAT_YUV444:
+		format = JZ_IPU_D_FMT_IN_FMT_YUV444;
+		break;
+	default:
+		WARN_ONCE(1, "Unsupported format");
+		break;
+	}
+
+	/* Fix output to RGB888 */
+	format |= JZ_IPU_D_FMT_OUT_FMT_RGB888;
+
+	/* Set pixel format */
+	regmap_write(ipu->map, JZ_REG_IPU_D_FMT, format);
+
+	/* Set the output height/width/stride */
+	regmap_write(ipu->map, JZ_REG_IPU_OUT_GS,
+		     ((state->crtc_w * 4) << JZ_IPU_OUT_GS_W_LSB)
+		     | state->crtc_h << JZ_IPU_OUT_GS_H_LSB);
+	regmap_write(ipu->map, JZ_REG_IPU_OUT_STRIDE, state->crtc_w * 4);
+
+	if (finfo->is_yuv) {
+		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_CSC_EN);
+
+		/*
+		 * Offsets for Chroma/Luma.
+		 * y = source Y - LUMA,
+		 * u = source Cb - CHROMA,
+		 * v = source Cr - CHROMA
+		 */
+		regmap_write(ipu->map, JZ_REG_IPU_CSC_OFFSET,
+			     128 << JZ_IPU_CSC_OFFSET_CHROMA_LSB |
+			     0 << JZ_IPU_CSC_OFFSET_LUMA_LSB);
+
+		/*
+		 * YUV422 to RGB conversion table.
+		 * R = C0 / 0x400 * y + C1 / 0x400 * v
+		 * G = C0 / 0x400 * y - C2 / 0x400 * u - C3 / 0x400 * v
+		 * B = C0 / 0x400 * y + C4 / 0x400 * u
+		 */
+		regmap_write(ipu->map, JZ_REG_IPU_CSC_C0_COEF, 0x4a8);
+		regmap_write(ipu->map, JZ_REG_IPU_CSC_C1_COEF, 0x662);
+		regmap_write(ipu->map, JZ_REG_IPU_CSC_C2_COEF, 0x191);
+		regmap_write(ipu->map, JZ_REG_IPU_CSC_C3_COEF, 0x341);
+		regmap_write(ipu->map, JZ_REG_IPU_CSC_C4_COEF, 0x811);
+	}
+
+	ctrl = 0;
+
+	/*
+	 * Must set ZOOM_SEL before programming bicubic LUTs.
+	 * If the IPU supports bicubic, we enable it unconditionally, since it
+	 * can do anything bilinear can and more.
+	 */
+	if (ipu->soc_info->has_bicubic)
+		ctrl |= JZ_IPU_CTRL_ZOOM_SEL;
+
+	upscaling_w = ipu->numW > ipu->denomW;
+	if (upscaling_w)
+		ctrl |= JZ_IPU_CTRL_HSCALE;
+
+	if (ipu->numW != 1 || ipu->denomW != 1) {
+		if (!ipu->soc_info->has_bicubic && !upscaling_w)
+			coef_index |= (ipu->denomW - 1) << 16;
+		else
+			coef_index |= (ipu->numW - 1) << 16;
+		ctrl |= JZ_IPU_CTRL_HRSZ_EN;
+	}
+
+	upscaling_h = ipu->numH > ipu->denomH;
+	if (upscaling_h)
+		ctrl |= JZ_IPU_CTRL_VSCALE;
+
+	if (ipu->numH != 1 || ipu->denomH != 1) {
+		if (!ipu->soc_info->has_bicubic && !upscaling_h)
+			coef_index |= ipu->denomH - 1;
+		else
+			coef_index |= ipu->numH - 1;
+		ctrl |= JZ_IPU_CTRL_VRSZ_EN;
+	}
+
+	regmap_update_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_ZOOM_SEL |
+			   JZ_IPU_CTRL_HRSZ_EN | JZ_IPU_CTRL_VRSZ_EN |
+			   JZ_IPU_CTRL_HSCALE | JZ_IPU_CTRL_VSCALE, ctrl);
+
+	/* Set the LUT index register */
+	regmap_write(ipu->map, JZ_REG_IPU_RSZ_COEF_INDEX, coef_index);
+
+	if (ipu->numW != 1 || ipu->denomW != 1)
+		ingenic_ipu_set_coefs(ipu, JZ_REG_IPU_HRSZ_COEF_LUT,
+				      ipu->numW, ipu->denomW);
+
+	if (ipu->numH != 1 || ipu->denomH != 1)
+		ingenic_ipu_set_coefs(ipu, JZ_REG_IPU_VRSZ_COEF_LUT,
+				      ipu->numH, ipu->denomH);
+
+	/* Clear STATUS register */
+	regmap_write(ipu->map, JZ_REG_IPU_STATUS, 0);
+
+	/* Start IPU */
+	regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL,
+			JZ_IPU_CTRL_RUN | JZ_IPU_CTRL_FM_IRQ_EN);
+
+	dev_dbg(ipu->dev, "Scaling %ux%u to %ux%u (%u:%u horiz, %u:%u vert)\n",
+		state->src_w >> 16, state->src_h >> 16,
+		state->crtc_w, state->crtc_h,
+		ipu->numW, ipu->denomW, ipu->numH, ipu->denomH);
+}
+
+static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
+					  struct drm_plane_state *state)
+{
+	unsigned int numW, denomW, numH, denomH, xres, yres;
+	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
+	struct drm_crtc *crtc = state->crtc ?: plane->state->crtc;
+	struct drm_crtc_state *crtc_state;
+
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	/* Request a full modeset if we are enabling or disabling the IPU. */
+	if (!plane->state->crtc ^ !state->crtc)
+		crtc_state->mode_changed = true;
+
+	if (!state->crtc ||
+	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
+		return 0;
+
+	/* Plane must be fully visible */
+	if (state->crtc_x < 0 || state->crtc_y < 0 ||
+	    state->crtc_x + state->crtc_w > crtc_state->mode.hdisplay ||
+	    state->crtc_y + state->crtc_h > crtc_state->mode.vdisplay)
+		return -EINVAL;
+
+	/* Minimum size is 4x4 */
+	if ((state->src_w >> 16) < 4 || (state->src_h >> 16) < 4)
+		return -EINVAL;
+
+	/* Input and output lines must have an even number of pixels. */
+	if (((state->src_w >> 16) & 1) || (state->crtc_w & 1))
+		return -EINVAL;
+
+	if (!osd_changed(state, plane->state))
+		return 0;
+
+	crtc_state->mode_changed = true;
+
+	xres = state->src_w >> 16;
+	yres = state->src_h >> 16;
+
+	/* Adjust the coefficients until we find a valid configuration */
+	for (denomW = xres, numW = state->crtc_w;
+	     numW <= crtc_state->mode.hdisplay; numW++)
+		if (!reduce_fraction(&numW, &denomW))
+			break;
+	if (numW > crtc_state->mode.hdisplay)
+		return -EINVAL;
+
+	for (denomH = yres, numH = state->crtc_h;
+	     numH <= crtc_state->mode.vdisplay; numH++)
+		if (!reduce_fraction(&numH, &denomH))
+			break;
+	if (numH > crtc_state->mode.vdisplay)
+		return -EINVAL;
+
+	ipu->numW = numW;
+	ipu->numH = numH;
+	ipu->denomW = denomW;
+	ipu->denomH = denomH;
+
+	return 0;
+}
+
+static void ingenic_ipu_plane_atomic_disable(struct drm_plane *plane,
+					     struct drm_plane_state *old_state)
+{
+	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
+
+	regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_STOP);
+	regmap_clear_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_CHIP_EN);
+
+	ingenic_drm_plane_disable(ipu->master, plane);
+}
+
+static const struct drm_plane_helper_funcs ingenic_ipu_plane_helper_funcs = {
+	.atomic_update		= ingenic_ipu_plane_atomic_update,
+	.atomic_check		= ingenic_ipu_plane_atomic_check,
+	.atomic_disable		= ingenic_ipu_plane_atomic_disable,
+	.prepare_fb		= drm_gem_fb_prepare_fb,
+};
+
+static int
+ingenic_ipu_plane_atomic_get_property(struct drm_plane *plane,
+				      const struct drm_plane_state *state,
+				      struct drm_property *property, u64 *val)
+{
+	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
+
+	if (property != ipu->sharpness_prop)
+		return -EINVAL;
+
+	*val = ipu->sharpness;
+
+	return 0;
+}
+
+static int
+ingenic_ipu_plane_atomic_set_property(struct drm_plane *plane,
+				      struct drm_plane_state *state,
+				      struct drm_property *property, u64 val)
+{
+	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
+	struct drm_crtc_state *crtc_state;
+
+	if (property != ipu->sharpness_prop)
+		return -EINVAL;
+
+	ipu->sharpness = val;
+
+	if (state->crtc) {
+		crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		if (WARN_ON(!crtc_state))
+			return -EINVAL;
+
+		crtc_state->mode_changed = true;
+	}
+
+	return 0;
+}
+
+static const struct drm_plane_funcs ingenic_ipu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.destroy		= drm_plane_cleanup,
+
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+
+	.atomic_get_property	= ingenic_ipu_plane_atomic_get_property,
+	.atomic_set_property	= ingenic_ipu_plane_atomic_set_property,
+};
+
+static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
+{
+	struct ingenic_ipu *ipu = arg;
+	struct drm_crtc *crtc = drm_crtc_from_index(ipu->drm, 0);
+	unsigned int dummy;
+
+	/* dummy read allows CPU to reconfigure IPU */
+	regmap_read(ipu->map, JZ_REG_IPU_STATUS, &dummy);
+
+	/* ACK interrupt */
+	regmap_write(ipu->map, JZ_REG_IPU_STATUS, 0);
+
+	/* Set previously cached addresses */
+	regmap_write(ipu->map, JZ_REG_IPU_Y_ADDR, ipu->addr_y);
+	regmap_write(ipu->map, JZ_REG_IPU_U_ADDR, ipu->addr_u);
+	regmap_write(ipu->map, JZ_REG_IPU_V_ADDR, ipu->addr_v);
+
+	/* Run IPU for the new frame */
+	regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RUN);
+
+	drm_crtc_handle_vblank(crtc);
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_config ingenic_ipu_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+
+	.max_register = JZ_REG_IPU_OUT_PHY_T_ADDR,
+};
+
+static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	const struct soc_info *soc_info;
+	struct drm_device *drm = d;
+	struct drm_plane *plane;
+	struct ingenic_ipu *ipu;
+	void __iomem *base;
+	unsigned int sharpness_max;
+	int err, irq;
+
+	ipu = devm_kzalloc(dev, sizeof(*ipu), GFP_KERNEL);
+	if (!ipu)
+		return -ENOMEM;
+
+	soc_info = of_device_get_match_data(dev);
+	if (!soc_info) {
+		dev_err(dev, "Missing platform data\n");
+		return -EINVAL;
+	}
+
+	ipu->dev = dev;
+	ipu->drm = drm;
+	ipu->master = master;
+	ipu->soc_info = soc_info;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "Failed to get memory resource\n");
+		return PTR_ERR(base);
+	}
+
+	ipu->map = devm_regmap_init_mmio(dev, base, &ingenic_ipu_regmap_config);
+	if (IS_ERR(ipu->map)) {
+		dev_err(dev, "Failed to create regmap\n");
+		return PTR_ERR(ipu->map);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ipu->clk = devm_clk_get(dev, "ipu");
+	if (IS_ERR(ipu->clk)) {
+		dev_err(dev, "Failed to get pixel clock\n");
+		return PTR_ERR(ipu->clk);
+	}
+
+	err = devm_request_irq(dev, irq, ingenic_ipu_irq_handler, 0,
+			       dev_name(dev), ipu);
+	if (err) {
+		dev_err(dev, "Unable to request IRQ\n");
+		return err;
+	}
+
+	plane = &ipu->plane;
+	dev_set_drvdata(dev, plane);
+
+	drm_plane_helper_add(plane, &ingenic_ipu_plane_helper_funcs);
+
+	err = drm_universal_plane_init(drm, plane, 1, &ingenic_ipu_plane_funcs,
+				       soc_info->formats, soc_info->num_formats,
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (err) {
+		dev_err(dev, "Failed to init plane: %i\n", err);
+		return err;
+	}
+
+	/*
+	 * Sharpness settings range is [0,32]
+	 * 0       : nearest-neighbor
+	 * 1       : bilinear
+	 * 2 .. 32 : bicubic (translated to sharpness factor -0.25 .. -4.0)
+	 */
+	sharpness_max = soc_info->has_bicubic ? 32 : 1;
+	ipu->sharpness_prop = drm_property_create_range(drm, 0, "sharpness",
+							0, sharpness_max);
+	if (!ipu->sharpness_prop) {
+		dev_err(dev, "Unable to create sharpness property\n");
+		return -ENOMEM;
+	}
+
+	/* Default sharpness factor: -0.125 * 8 = -1.0 */
+	ipu->sharpness = soc_info->has_bicubic ? 8 : 1;
+	drm_object_attach_property(&plane->base, ipu->sharpness_prop,
+				   ipu->sharpness);
+
+	err = clk_prepare_enable(ipu->clk);
+	if (err) {
+		dev_err(dev, "Unable to enable clock\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static void ingenic_ipu_unbind(struct device *dev,
+			       struct device *master, void *d)
+{
+	struct ingenic_ipu *ipu = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ipu->clk);
+}
+
+static const struct component_ops ingenic_ipu_ops = {
+	.bind = ingenic_ipu_bind,
+	.unbind = ingenic_ipu_unbind,
+};
+
+static int ingenic_ipu_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &ingenic_ipu_ops);
+}
+
+static int ingenic_ipu_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &ingenic_ipu_ops);
+	return 0;
+}
+
+static const u32 jz4725b_ipu_formats[] = {
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_YUV411,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+};
+
+static const struct soc_info jz4725b_soc_info = {
+	.formats	= jz4725b_ipu_formats,
+	.num_formats	= ARRAY_SIZE(jz4725b_ipu_formats),
+	.has_bicubic	= false,
+	.set_coefs	= jz4725b_set_coefs,
+};
+
+static const u32 jz4760_ipu_formats[] = {
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_YUV411,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_XYUV8888,
+};
+
+static const struct soc_info jz4760_soc_info = {
+	.formats	= jz4760_ipu_formats,
+	.num_formats	= ARRAY_SIZE(jz4760_ipu_formats),
+	.has_bicubic	= true,
+	.set_coefs	= jz4760_set_coefs,
+};
+
+static const struct of_device_id ingenic_ipu_of_match[] = {
+	{ .compatible = "ingenic,jz4725b-ipu", .data = &jz4725b_soc_info },
+	{ .compatible = "ingenic,jz4760-ipu", .data = &jz4760_soc_info },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ingenic_ipu_of_match);
+
+static struct platform_driver ingenic_ipu_driver = {
+	.driver = {
+		.name = "ingenic-ipu",
+		.of_match_table = ingenic_ipu_of_match,
+	},
+	.probe = ingenic_ipu_probe,
+	.remove = ingenic_ipu_remove,
+};
+
+struct platform_driver *ingenic_ipu_driver_ptr = &ingenic_ipu_driver;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.h b/drivers/gpu/drm/ingenic/ingenic-ipu.h
new file mode 100644
index 000000000000..eab6fab8c7f6
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// Ingenic JZ47xx IPU - Register definitions and private API
+//
+// Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
+
+#ifndef DRIVERS_GPU_DRM_INGENIC_INGENIC_IPU_H
+#define DRIVERS_GPU_DRM_INGENIC_INGENIC_IPU_H
+
+#include <linux/bitops.h>
+
+#define JZ_REG_IPU_CTRL			0x00
+#define JZ_REG_IPU_STATUS		0x04
+#define JZ_REG_IPU_D_FMT		0x08
+#define JZ_REG_IPU_Y_ADDR		0x0c
+#define JZ_REG_IPU_U_ADDR		0x10
+#define JZ_REG_IPU_V_ADDR		0x14
+#define JZ_REG_IPU_IN_GS		0x18
+#define JZ_REG_IPU_Y_STRIDE		0x1c
+#define JZ_REG_IPU_UV_STRIDE		0x20
+#define JZ_REG_IPU_OUT_ADDR		0x24
+#define JZ_REG_IPU_OUT_GS		0x28
+#define JZ_REG_IPU_OUT_STRIDE		0x2c
+#define JZ_REG_IPU_RSZ_COEF_INDEX	0x30
+#define JZ_REG_IPU_CSC_C0_COEF		0x34
+#define JZ_REG_IPU_CSC_C1_COEF		0x38
+#define JZ_REG_IPU_CSC_C2_COEF		0x3c
+#define JZ_REG_IPU_CSC_C3_COEF		0x40
+#define JZ_REG_IPU_CSC_C4_COEF		0x44
+#define JZ_REG_IPU_HRSZ_COEF_LUT	0x48
+#define JZ_REG_IPU_VRSZ_COEF_LUT	0x4c
+#define JZ_REG_IPU_CSC_OFFSET		0x50
+#define JZ_REG_IPU_Y_PHY_T_ADDR		0x54
+#define JZ_REG_IPU_U_PHY_T_ADDR		0x58
+#define JZ_REG_IPU_V_PHY_T_ADDR		0x5c
+#define JZ_REG_IPU_OUT_PHY_T_ADDR	0x60
+
+#define JZ_IPU_CTRL_ADDR_SEL		BIT(20)
+#define JZ_IPU_CTRL_ZOOM_SEL		BIT(18)
+#define JZ_IPU_CTRL_DFIX_SEL		BIT(17)
+#define JZ_IPU_CTRL_LCDC_SEL		BIT(11)
+#define JZ_IPU_CTRL_SPKG_SEL		BIT(10)
+#define JZ_IPU_CTRL_VSCALE		BIT(9)
+#define JZ_IPU_CTRL_HSCALE		BIT(8)
+#define JZ_IPU_CTRL_STOP		BIT(7)
+#define JZ_IPU_CTRL_RST			BIT(6)
+#define JZ_IPU_CTRL_FM_IRQ_EN		BIT(5)
+#define JZ_IPU_CTRL_CSC_EN		BIT(4)
+#define JZ_IPU_CTRL_VRSZ_EN		BIT(3)
+#define JZ_IPU_CTRL_HRSZ_EN		BIT(2)
+#define JZ_IPU_CTRL_RUN			BIT(1)
+#define JZ_IPU_CTRL_CHIP_EN		BIT(0)
+
+#define JZ_IPU_STATUS_OUT_END		BIT(0)
+
+#define JZ_IPU_IN_GS_H_LSB		0x0
+#define JZ_IPU_IN_GS_W_LSB		0x10
+#define JZ_IPU_OUT_GS_H_LSB		0x0
+#define JZ_IPU_OUT_GS_W_LSB		0x10
+
+#define JZ_IPU_Y_STRIDE_Y_LSB		0
+#define JZ_IPU_UV_STRIDE_U_LSB		16
+#define JZ_IPU_UV_STRIDE_V_LSB		0
+
+#define JZ_IPU_D_FMT_IN_FMT_LSB		0
+#define JZ_IPU_D_FMT_IN_FMT_RGB555	(0x0 << JZ_IPU_D_FMT_IN_FMT_LSB)
+#define JZ_IPU_D_FMT_IN_FMT_YUV420	(0x0 << JZ_IPU_D_FMT_IN_FMT_LSB)
+#define JZ_IPU_D_FMT_IN_FMT_YUV422	(0x1 << JZ_IPU_D_FMT_IN_FMT_LSB)
+#define JZ_IPU_D_FMT_IN_FMT_RGB888	(0x2 << JZ_IPU_D_FMT_IN_FMT_LSB)
+#define JZ_IPU_D_FMT_IN_FMT_YUV444	(0x2 << JZ_IPU_D_FMT_IN_FMT_LSB)
+#define JZ_IPU_D_FMT_IN_FMT_RGB565	(0x3 << JZ_IPU_D_FMT_IN_FMT_LSB)
+
+#define JZ_IPU_D_FMT_YUV_FMT_LSB	2
+#define JZ_IPU_D_FMT_YUV_Y1UY0V		(0x0 << JZ_IPU_D_FMT_YUV_FMT_LSB)
+#define JZ_IPU_D_FMT_YUV_Y1VY0U		(0x1 << JZ_IPU_D_FMT_YUV_FMT_LSB)
+#define JZ_IPU_D_FMT_YUV_UY1VY0		(0x2 << JZ_IPU_D_FMT_YUV_FMT_LSB)
+#define JZ_IPU_D_FMT_YUV_VY1UY0		(0x3 << JZ_IPU_D_FMT_YUV_FMT_LSB)
+#define JZ_IPU_D_FMT_IN_FMT_YUV411	(0x3 << JZ_IPU_D_FMT_IN_FMT_LSB)
+
+#define JZ_IPU_D_FMT_OUT_FMT_LSB	19
+#define JZ_IPU_D_FMT_OUT_FMT_RGB555	(0x0 << JZ_IPU_D_FMT_OUT_FMT_LSB)
+#define JZ_IPU_D_FMT_OUT_FMT_RGB565	(0x1 << JZ_IPU_D_FMT_OUT_FMT_LSB)
+#define JZ_IPU_D_FMT_OUT_FMT_RGB888	(0x2 << JZ_IPU_D_FMT_OUT_FMT_LSB)
+#define JZ_IPU_D_FMT_OUT_FMT_YUV422	(0x3 << JZ_IPU_D_FMT_OUT_FMT_LSB)
+#define JZ_IPU_D_FMT_OUT_FMT_RGBAAA	(0x4 << JZ_IPU_D_FMT_OUT_FMT_LSB)
+
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_LSB	22
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_RGB	(0x0 << JZ_IPU_D_FMT_RGB_OUT_OFT_LSB)
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_RBG	(0x1 << JZ_IPU_D_FMT_RGB_OUT_OFT_LSB)
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_GBR	(0x2 << JZ_IPU_D_FMT_RGB_OUT_OFT_LSB)
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_GRB	(0x3 << JZ_IPU_D_FMT_RGB_OUT_OFT_LSB)
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_BRG	(0x4 << JZ_IPU_D_FMT_RGB_OUT_OFT_LSB)
+#define JZ_IPU_D_FMT_RGB_OUT_OFT_BGR	(0x5 << JZ_IPU_D_FMT_RGB_OUT_OFT_LSB)
+
+#define JZ4725B_IPU_RSZ_LUT_COEF_LSB	2
+#define JZ4725B_IPU_RSZ_LUT_COEF_MASK	0x7ff
+#define JZ4725B_IPU_RSZ_LUT_IN_EN	BIT(1)
+#define JZ4725B_IPU_RSZ_LUT_OUT_EN	BIT(0)
+
+#define JZ4760_IPU_RSZ_COEF20_LSB	6
+#define JZ4760_IPU_RSZ_COEF31_LSB	17
+#define JZ4760_IPU_RSZ_COEF_MASK	0x7ff
+#define JZ4760_IPU_RSZ_OFFSET_LSB	1
+#define JZ4760_IPU_RSZ_OFFSET_MASK	0x1f
+
+#define JZ_IPU_CSC_OFFSET_CHROMA_LSB	16
+#define JZ_IPU_CSC_OFFSET_LUMA_LSB	16
+
+#endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_IPU_H */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
