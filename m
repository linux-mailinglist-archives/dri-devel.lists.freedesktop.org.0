Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3F1BBDE1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637066E354;
	Tue, 28 Apr 2020 12:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DC96E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:00:48 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F010C0341;
 Mon, 27 Apr 2020 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587996048; bh=UCMLWfN5C9w1mGSx3E4j3bVLT7LwXe2DGiVPSwkAs/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=QV8TO4a2U2ao0BqiDYqgQTdTuFU4iNU5kNWrUgOptD6OLmmAohE0MZ2OVkdj9Uwss
 NdAN5fwUUyGDw9nh8cqyrRmqJ+ZK3XFdwsZtKS2zvtYgIWcJc+0zGKyXsrYQ3NjfE4
 6zLg2ljAJmkt62DrQVT15SMG70AbEEXVPnvV7u5RSVGVmsQCsEwO+AMKt5gtHmsSGf
 wPm3oMNOvtOTWV45uz8jEcVFmve7aNBpfxt5WeNvKOkOaZxrX/Cy1YD5Wa/OqIGqwV
 40pkIfW+d5UtrO1qXgjgm5TFE6BHtRLgw244JuMqcCuL3K+EOvfy3vB5WDUwH6jX8M
 j7IuK9e8aEywg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id E9D2FA0063;
 Mon, 27 Apr 2020 14:00:44 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] drm: ipk: Add DRM driver for DesignWare IPK DSI
Date: Mon, 27 Apr 2020 16:00:34 +0200
Message-Id: <a26d3d452468e8db9fa06e7d78e5bd1d546a174f.1587992776.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, David Airlie <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Synopsys DesignWare VPG (Video Pattern Generator)
and DRM driver for Synopsys DesignWare DSI Host IPK solution.

This patch has to be applied on top of Daniel Vetter's implementation -
devm_drm_dev_alloc https://patchwork.freedesktop.org/patch/359897/ .

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
---
Changes since v3:
  - Changed Makefile to use '+=' instead of '\'.
  - Rearranged headers.
  - Replaced drm_mode_config_init by drmm_mode_config_init.
  - Droped DRM legacy functions.
  - Replaced DRM_xxx by drm_xxx.
  - Changed load function to devm_drm_dev_alloc.
  - Implemented pipeline as a drm_simple_display_pipe.
---
 drivers/gpu/drm/Kconfig      |   2 +
 drivers/gpu/drm/Makefile     |   1 +
 drivers/gpu/drm/ipk/Kconfig  |  13 ++
 drivers/gpu/drm/ipk/Makefile |   4 +
 drivers/gpu/drm/ipk/dw-drv.c | 169 ++++++++++++++++++
 drivers/gpu/drm/ipk/dw-ipk.h |  26 +++
 drivers/gpu/drm/ipk/dw-vpg.c | 412 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ipk/dw-vpg.h |  48 +++++
 8 files changed, 675 insertions(+)
 create mode 100644 drivers/gpu/drm/ipk/Kconfig
 create mode 100644 drivers/gpu/drm/ipk/Makefile
 create mode 100644 drivers/gpu/drm/ipk/dw-drv.c
 create mode 100644 drivers/gpu/drm/ipk/dw-ipk.h
 create mode 100644 drivers/gpu/drm/ipk/dw-vpg.c
 create mode 100644 drivers/gpu/drm/ipk/dw-vpg.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 4359497..29ea1d1 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -388,6 +388,8 @@ source "drivers/gpu/drm/mcde/Kconfig"
 
 source "drivers/gpu/drm/tidss/Kconfig"
 
+source "drivers/gpu/drm/ipk/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f34d08c..b15f2ea 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -124,3 +124,4 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
+obj-$(CONFIG_DRM_IPK) += ipk/
diff --git a/drivers/gpu/drm/ipk/Kconfig b/drivers/gpu/drm/ipk/Kconfig
new file mode 100644
index 0000000..1f87444
--- /dev/null
+++ b/drivers/gpu/drm/ipk/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_IPK
+	tristate "DRM Support for Synopsys DesignWare IPK DSI"
+	depends on DRM
+	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_PANEL_BRIDGE
+	select VIDEOMODE_HELPERS
+	help
+	  Enable support for the Synopsys DesignWare DRM DSI.
+	  To compile this driver as a module, choose M here: the module
+	  will be called ipk-drm.
diff --git a/drivers/gpu/drm/ipk/Makefile b/drivers/gpu/drm/ipk/Makefile
new file mode 100644
index 0000000..6a1a911
--- /dev/null
+++ b/drivers/gpu/drm/ipk/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+ipk-drm-y := dw-drv.o dw-vpg.o
+
+obj-$(CONFIG_DRM_IPK) += ipk-drm.o
diff --git a/drivers/gpu/drm/ipk/dw-drv.c b/drivers/gpu/drm/ipk/dw-drv.c
new file mode 100644
index 0000000..5ff6cbf
--- /dev/null
+++ b/drivers/gpu/drm/ipk/dw-drv.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare MIPI DSI DRM driver
+ *
+ * Author: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#include "dw-ipk.h"
+#include "dw-vpg.h"
+
+static const struct drm_mode_config_funcs dw_ipk_drm_modecfg_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int dw_ipk_load(struct drm_device *drm)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+
+	/* To handle orientation */
+	drm->mode_config.max_width = 2048;
+	drm->mode_config.max_height = 2048;
+
+	drm->mode_config.funcs = &dw_ipk_drm_modecfg_funcs;
+
+	/* TODO
+	 * Optional framebuffer memory resources allocation
+	 */
+
+	ret = vpg_load(drm);
+	if (ret)
+		return ret;
+
+	/* Calls all the crtc's, encoder's and connector's reset */
+	drm_mode_config_reset(drm);
+
+	return ret;
+}
+
+static void dw_ipk_unload(struct drm_device *drm)
+{
+	drm_dbg(drm, "\n");
+	vpg_unload(drm);
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(ipk_drm_driver_fops);
+
+static int dw_ipk_gem_cma_dumb_create(struct drm_file *file,
+				      struct drm_device *dev,
+				      struct drm_mode_create_dumb *args)
+{
+	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int err;
+
+	/*
+	 * In order to optimize data transfer, pitch is aligned on
+	 * 128 bytes, height is aligned on 4 bytes
+	 */
+	args->pitch = roundup(min_pitch, 128);
+	args->height = roundup(args->height, 4);
+
+	err = drm_gem_cma_dumb_create_internal(file, dev, args);
+	if (err)
+		drm_err(dev, "dumb_create failed %d\n", err);
+
+	return err;
+}
+
+static struct drm_driver dw_ipk_drm_driver = {
+	.gem_create_object = drm_cma_gem_create_object_default_funcs,
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.dumb_create = dw_ipk_gem_cma_dumb_create,
+
+	.major = 1,
+	.minor = 0,
+	.patchlevel = 0,
+	.name = "dw_ipk",
+	.desc = "DW IPK DSI Host Controller",
+	.date = "20190725",
+
+	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+
+	.fops = &ipk_drm_driver_fops,
+};
+
+static int dw_ipk_drm_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct drm_device *drm;
+	struct ipk_device *ipk;
+	int ret;
+
+	ipk = devm_drm_dev_alloc(dev, &dw_ipk_drm_driver,
+				 struct ipk_device, drm);
+	if (IS_ERR(ipk))
+		return PTR_ERR(ipk);
+
+	ipk->platform = pdev;
+	drm = &ipk->drm;
+
+	platform_set_drvdata(pdev, drm);
+
+	ret = dw_ipk_load(drm);
+	if (ret)
+		return ret;
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(drm, 24);
+
+	return ret;
+}
+
+static int dw_ipk_drm_platform_remove(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	drm_dev_unregister(drm);
+	dw_ipk_unload(drm);
+
+	return 0;
+}
+
+static const struct of_device_id dw_ipk_dt_ids[] = {
+	{.compatible = "snps,dw-ipk-vpg"},
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, dw_ipk_dt_ids);
+
+static struct platform_driver dw_ipk_drm_platform_driver = {
+	.probe = dw_ipk_drm_platform_probe,
+	.remove = dw_ipk_drm_platform_remove,
+	.driver = {
+		.name = "dw-ipk-drm",
+		.of_match_table = dw_ipk_dt_ids,
+	},
+};
+
+module_platform_driver(dw_ipk_drm_platform_driver);
+
+MODULE_DESCRIPTION("Synopsys DesignWare IPK DRM driver");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Angelo Ribeiro <angelo.ribeiro@synopsys.com>");
diff --git a/drivers/gpu/drm/ipk/dw-ipk.h b/drivers/gpu/drm/ipk/dw-ipk.h
new file mode 100644
index 0000000..8d3fd12
--- /dev/null
+++ b/drivers/gpu/drm/ipk/dw-ipk.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare IPK MIPI DSI DRM Driver
+ */
+
+#ifndef _DW_IPK_H
+#define _DW_IPK_H
+
+#include <drm/drm_simple_kms_helper.h>
+
+struct vpg_device;
+
+struct ipk_device {
+	struct drm_device drm;
+	struct platform_device *platform;
+	struct drm_simple_display_pipe pipe;
+	struct vpg_device *vpg;
+};
+
+#define drm_dev_to_ipk_dev(target) \
+	container_of(target, struct ipk_device, drm)
+#define display_pipe_to_ipk_dev(target) \
+	container_of(target, struct ipk_device, pipe)
+
+#endif /* _DW_IPK_H */
diff --git a/drivers/gpu/drm/ipk/dw-vpg.c b/drivers/gpu/drm/ipk/dw-vpg.c
new file mode 100644
index 0000000..b7575fa
--- /dev/null
+++ b/drivers/gpu/drm/ipk/dw-vpg.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare MIPI DSI controller
+ *
+ * Author: Angelo Ribeiro <angelor@synopsys.com>
+ * Author: Luis Oliveira <luis.oliveira@synopsys.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_graph.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <video/videomode.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "dw-ipk.h"
+#include "dw-vpg.h"
+
+struct vpg_device {
+	void __iomem *base;
+	void __iomem *base_mmcm;
+};
+
+enum vpg_pixel_fmt {
+	VIF_COLOR_CODE_16BIT_CONFIG1 = 0,
+	VIF_COLOR_CODE_16BIT_CONFIG2,
+	VIF_COLOR_CODE_16BIT_CONFIG3,
+	VIF_COLOR_CODE_18BIT_CONFIG1,
+	VIF_COLOR_CODE_18BIT_CONFIG2,
+	VIF_COLOR_CODE_24BIT,
+	VIF_COLOR_CODE_MAX
+};
+
+static enum vpg_pixel_fmt to_vpg_pixel_format(u32 drm_fmt)
+{
+	enum vpg_pixel_fmt pf;
+
+	switch (drm_fmt) {
+	case DRM_FORMAT_RGB888:
+		pf = VIF_COLOR_CODE_24BIT;
+		break;
+	case DRM_FORMAT_RGB565:
+		pf = VIF_COLOR_CODE_16BIT_CONFIG1;
+		break;
+	default:
+		pf = VIF_COLOR_CODE_MAX;
+		break;
+	}
+	return pf;
+}
+
+static u32 vpg_read(struct vpg_device *dev, u32 reg)
+{
+	return readl(dev->base + reg);
+}
+
+static void vpg_write(struct vpg_device *dev, u32 reg, u32 val)
+{
+	writel(val, dev->base + reg);
+}
+
+static void vpg_write_part(struct vpg_device *dev, u32 reg,
+			   u32 val, u8 shift, u8 width)
+{
+	u32 mask = (1 << width) - 1;
+
+	vpg_write(dev, reg, (vpg_read(dev, reg) &
+		  ~(mask << shift)) | ((val & mask) << shift));
+}
+
+static u32 mmcm_read(struct vpg_device *dev, u32 reg)
+{
+	return readl(dev->base_mmcm + reg);
+}
+
+static void mmcm_write(struct vpg_device *dev, u32 reg, u32 value)
+{
+	writel(value, dev->base_mmcm + reg);
+}
+
+static void mmcm_configure(struct drm_device *drm,
+			   struct drm_display_mode *mode)
+{
+	struct ipk_device *ipk = drm_dev_to_ipk_dev(drm);
+	int div,  mul, cur_freq, cur_deviat, temp;
+	struct vpg_device *vpg = ipk->vpg;
+	int out_freq = mode->clock;
+	int in_freq = 100000;
+	int deviat = 1000;	/* Deviation from desired master clock */
+	int best_div = 0;	/* Divider for PLL */
+	int best_mul = 0;	/* Multiplier for PLL */
+
+	drm_dbg(drm, "out_freq = %d\n", out_freq);
+
+	for (div = 1; div < 150 && deviat > 50; div++) {
+		for (mul = 1; mul <= 10 && deviat > 50; mul++) {
+			cur_freq = in_freq * mul / div;
+			cur_deviat = abs(out_freq - cur_freq);
+			if (cur_deviat < deviat) {
+				best_div = div;
+				best_mul = mul;
+				deviat = cur_deviat;
+			}
+		}
+	}
+
+	drm_dbg(drm, "deviat = %d\n best_div = %d\n best_mul = %d\n",
+		deviat, best_div, best_mul);
+
+	temp = mmcm_read(vpg, DW_MMCM_CLKOUT0_REG_1) & DW_MMCM_MASK;
+	mmcm_write(vpg, DW_MMCM_CLKOUT0_REG_1, temp | (best_div << 6) |
+		   best_div);
+
+	temp = mmcm_read(vpg, DW_MMCM_CLKFBOUT_REG_1) & DW_MMCM_MASK;
+	mmcm_write(vpg, DW_MMCM_CLKFBOUT_REG_1, temp | (best_mul << 6) |
+		   best_mul);
+}
+
+static void vpg_set_fps(struct vpg_device *vpg,
+			const struct drm_display_mode *mode)
+{
+	/* DW_VPG_FREQ is in KHz */
+	u32 line_time = (1000 * DW_VPG_FREQ) / (mode->vrefresh * mode->vtotal);
+
+	vpg_write(vpg, DW_VPG_LINE_TIME, line_time);
+}
+
+static void vpg_select_pattern(struct vpg_device *vpg, unsigned int value)
+{
+	vpg_write(vpg, DW_VPG_TESTMODE, value);
+}
+
+static void vpg_vertical_set(struct vpg_device *vpg,
+			     struct drm_display_mode *mode)
+{
+	u32 v_sync = mode->vsync_end - mode->vsync_start;
+	u32 v_back_porch = mode->vtotal - mode->vsync_end;
+	u32 v_front_porch = mode->vsync_start - mode->vdisplay;
+
+	vpg_write_part(vpg, DW_VPG_CANVAS, mode->vdisplay, 16, 16);
+	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_sync, 0, 8);
+	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_back_porch, 20, 12);
+	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_front_porch, 8, 11);
+}
+
+static void vpg_horizontal_set(struct vpg_device *vpg,
+			       struct drm_display_mode *mode)
+{
+	u32 h_sync = mode->hsync_end - mode->hsync_start;
+	u32 h_back_porch = mode->htotal - mode->hsync_end;
+
+	vpg_write_part(vpg, DW_VPG_CANVAS, mode->hdisplay, 0, 16);
+	vpg_write_part(vpg, DW_VPG_HBP_HSA, h_sync, 0, 16);
+	vpg_write_part(vpg, DW_VPG_HBP_HSA, h_back_porch, 16, 16);
+}
+
+static ssize_t show_pattern(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ipk_device *ipk = drm_dev_to_ipk_dev(drm);
+	struct vpg_device *vpg = ipk->vpg;
+
+	return sprintf(buf, "%d\n", vpg_read(vpg, DW_VPG_TESTMODE));
+}
+
+static ssize_t store_pattern(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ipk_device *ipk = drm_dev_to_ipk_dev(drm);
+	struct vpg_device *vpg = ipk->vpg;
+	long pattern;
+	int ret;
+
+	ret = kstrtol(buf, 0, &pattern);
+	if (ret < 0)
+		return ret;
+
+	vpg_select_pattern(vpg, pattern);
+
+	return count;
+}
+
+static struct kobj_attribute vpg_pattern = __ATTR(pattern, 0660,
+						  (void *)show_pattern,
+						  (void *)store_pattern);
+
+static struct attribute *vpg_attr[] = {
+	&vpg_pattern.attr,
+	NULL,
+};
+
+static const struct attribute_group vpg_attr_group = {
+	.attrs = vpg_attr,
+};
+
+static int vpg_sysfs_register(struct ipk_device *ipk)
+{
+	struct platform_device *pdev = ipk->platform;
+	int ret;
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &vpg_attr_group);
+	if (ret)
+		drm_err(&ipk->drm, "Failed to create sysfs entries");
+
+	return ret;
+}
+
+static void vpg_sysfs_remove(struct ipk_device *ipk)
+{
+	struct platform_device *pdev = ipk->platform;
+
+	sysfs_remove_group(&pdev->dev.kobj, &vpg_attr_group);
+}
+
+static void vpg_pipe_update(struct drm_simple_display_pipe *pipe,
+			    struct drm_plane_state *old_state)
+{
+	struct ipk_device *ipk = display_pipe_to_ipk_dev(pipe);
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct vpg_device *vpg = ipk->vpg;
+	enum vpg_pixel_fmt pixel_format;
+
+	if (!fb)
+		return;
+
+	pixel_format = to_vpg_pixel_format(fb->format->format);
+
+	vpg_write(vpg, DW_VPG_DPICOLORMODE, pixel_format);
+}
+
+static void vpg_pipe_enable(struct drm_simple_display_pipe *pipe,
+			    struct drm_crtc_state *crtc_state,
+			    struct drm_plane_state *plane_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct ipk_device *ipk = display_pipe_to_ipk_dev(pipe);
+	struct drm_device *drm = &ipk->drm;
+	struct vpg_device *vpg = ipk->vpg;
+
+	drm_dbg(drm, "Video mode: %dx%d\n", mode->hdisplay, mode->vdisplay);
+
+	mmcm_configure(drm, mode);
+
+	vpg_write(vpg, DW_VPG_SEL_DATA, 0x01);
+	vpg_write(vpg, DW_VPG_SEL_DATA, 0x03);
+
+	vpg_horizontal_set(vpg, mode);
+
+	vpg_vertical_set(vpg, mode);
+
+	vpg_set_fps(vpg, mode);
+
+	vpg_select_pattern(vpg, 0);
+}
+
+static const struct drm_simple_display_pipe_funcs drm_display_pipe = {
+	.enable = vpg_pipe_enable,
+	.update = vpg_pipe_update,
+};
+
+static int vpg_init_pipe(struct drm_device *drm, struct drm_panel *panel,
+			 struct drm_bridge *bridge)
+{
+	struct ipk_device *ipk = drm_dev_to_ipk_dev(drm);
+	static const u64 modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID,
+	};
+	static const u32 formats[] = {
+		DRM_FORMAT_RGB565,
+		DRM_FORMAT_RGB888,
+	};
+	int ret;
+
+	ret = drm_simple_display_pipe_init(drm, &ipk->pipe, &drm_display_pipe,
+					   formats, ARRAY_SIZE(formats),
+					   modifiers, NULL);
+	if (ret)
+		return ret;
+
+	if (panel) {
+		bridge = devm_drm_panel_bridge_add_typed(&ipk->platform->dev,
+						 panel, DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	}
+
+	ret = drm_simple_display_pipe_attach_bridge(&ipk->pipe, bridge);
+	if (ret)
+		return ret;
+
+	ret = vpg_sysfs_register(ipk);
+
+	return ret;
+}
+
+int vpg_load(struct drm_device *drm)
+{
+	struct ipk_device *ipk = drm_dev_to_ipk_dev(drm);
+	struct platform_device *pdev = ipk->platform;
+	struct device_node *np = drm->dev->of_node;
+	int ret, endpoint_not_ready = -ENODEV;
+	struct reset_control *vpg_rst, *mmcm_rst;
+	struct drm_bridge *bridge = NULL;
+	struct drm_panel *panel = NULL;
+	struct device *dev = drm->dev;
+	struct vpg_device *vpg;
+	struct resource *res;
+
+	drm_dbg(drm, "\n");
+
+	vpg = devm_kzalloc(&pdev->dev, sizeof(*vpg), GFP_KERNEL);
+	if (!vpg)
+		return -ENOMEM;
+
+	ipk->vpg = vpg;
+
+	/* Get endpoints if any */
+	ret = drm_of_find_panel_or_bridge(np, 0, 0, &panel, &bridge);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	else if (!ret)
+		endpoint_not_ready = 0;
+
+	if (endpoint_not_ready)
+		return endpoint_not_ready;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpg");
+	vpg->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(vpg->base)) {
+		drm_err(drm, "Unable to get VPG registers\n");
+		ret = PTR_ERR(vpg->base);
+		goto err;
+	}
+
+	vpg_rst = devm_reset_control_get_optional_exclusive(dev, "vpg");
+	if (IS_ERR(vpg_rst)) {
+		ret = PTR_ERR(vpg_rst);
+		if (ret != -EPROBE_DEFER)
+			drm_err(drm, "Unable to get reset control: %d\n", ret);
+		goto err;
+	}
+
+	if (vpg_rst) {
+		reset_control_assert(vpg_rst);
+		usleep_range(10, 20);
+		reset_control_deassert(vpg_rst);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mmcm");
+	vpg->base_mmcm = devm_ioremap_resource(dev, res);
+	if (IS_ERR(vpg->base)) {
+		ret = PTR_ERR(vpg->base);
+		goto err;
+	}
+
+	mmcm_rst = devm_reset_control_get_optional_exclusive(dev, "mmcm");
+	if (IS_ERR(mmcm_rst)) {
+		ret = PTR_ERR(mmcm_rst);
+		if (ret != -EPROBE_DEFER)
+			drm_err(drm, "Unable to get reset control: %d\n", ret);
+		goto err;
+	}
+
+	if (mmcm_rst) {
+		reset_control_assert(mmcm_rst);
+		usleep_range(10, 20);
+		reset_control_deassert(mmcm_rst);
+	}
+
+	/* Init DRM Simple Pipeline */
+	ret = vpg_init_pipe(drm, panel, bridge);
+	if (ret) {
+		drm_err(drm, "Failed to init simple pipe\n");
+		goto err;
+	}
+
+	return ret;
+
+err:
+	drm_panel_bridge_remove(bridge);
+	return ret;
+}
+
+void vpg_unload(struct drm_device *drm)
+{
+	struct ipk_device *ipk = drm_dev_to_ipk_dev(drm);
+
+	drm_dbg(drm, "\n");
+	vpg_sysfs_remove(ipk);
+	drm_of_panel_bridge_remove(drm->dev->of_node, 0, 0);
+}
diff --git a/drivers/gpu/drm/ipk/dw-vpg.h b/drivers/gpu/drm/ipk/dw-vpg.h
new file mode 100644
index 0000000..bd1969e
--- /dev/null
+++ b/drivers/gpu/drm/ipk/dw-vpg.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare VPG
+ */
+
+#ifndef _VPG_H_
+#define _VPG_H_
+
+#define DW_VPG_PANX				0x00
+#define DW_VPG_PANY				0x04
+#define DW_VPG_PHASE_SEL			0x08
+#define DW_VPG_SEL_DATA				0x0C
+#define DW_VPG_SWAP_BAY				0x10
+#define DW_VPG_TESTMODE				0x14
+#define DW_VPG_ZOOM_OUT				0x18
+#define DW_VPG_EDPICTRL				0x1C
+#define DW_VPG_CANVAS				0x20
+#define DW_VPG_HBP_HSA				0x24
+#define DW_VPG_LINE_TIME			0x28
+#define DW_VPG_VBP_VFP_VSA			0x2C
+#define DW_VPG_DPICOLORMODE			0x30
+#define DW_VPG_VERSION				0x34
+#define DW_VPG_EXTRNAL_EDPI			0x38
+#define DW_VPG_PVO_CEAVID			0x3C
+#define DW_VPG_PAN_VALID			0x40
+#define DW_VPG_TECONTROL			0x44
+#define DW_VPG_IMAGE_START_POSITION_X		0x4C
+#define DW_VPG_IMAGE_START_POSITION_Y		0x50
+#define DW_VPG_IMAGE_Y				0x54
+#define DW_VPG_IMAGE_WORD_COUNT			0x58
+#define DW_VPG_IMAGE_DATA_TYPE			0x5C
+#define DW_VPG_LINE_PIXS_CNT			0x60
+#define DW_VPG_FRAME_LINES_CNT			0x64
+
+#define DW_MMCM_MASK				0x1000
+#define DW_MMCM_CLKOUT0_REG_1			0x20
+#define DW_MMCM_CLKOUT0_REG_2			0x24
+#define DW_MMCM_CLKFBOUT_REG_1			0x50
+#define DW_MMCM_CLKFBOUT_REG_2			0x54
+#define DW_MMCM_POWER_REG			0xA0
+
+#define DW_VPG_FREQ	25000	/* [KHz] */
+
+int vpg_load(struct drm_device *drm);
+void vpg_unload(struct drm_device *drm);
+
+#endif /* _VPG_H_ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
