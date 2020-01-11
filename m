Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9A138664
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286046E52C;
	Sun, 12 Jan 2020 12:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (unknown [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE756E175
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 01:07:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id EB408DFDFD;
 Sat, 11 Jan 2020 01:07:47 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 32PAmGpAMnwp; Sat, 11 Jan 2020 01:07:46 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 4AAAEDFE00;
 Sat, 11 Jan 2020 01:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Pjq_2cWuQb2N; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 9DBFFDFDFA;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 3/3] drm/armada: add mmp2 and mmp3 support
Date: Sat, 11 Jan 2020 02:07:34 +0100
Message-Id: <20200111010734.286836-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111010734.286836-1-lkundrak@v3.sk>
References: <20200111010734.286836-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, Lubomir Rintel <lkundrak@v3.sk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MMP2 and MMP3 are mostly the same apart from MMP3 having the clock
select shifted one bit to the right, with an extra option to choose PLL3
as a clock source.

Data sheet for neither variant is available. James Cameron of OLPC kindly
provided some details about the LCD_SCLK_DIV register for MMP2.

MMP2 support was tested on with the internal panel on a OLPC XO 1.75
laptop, while the MMP3 support was tested on a Dell Wyse 3020 with a
Chrontel 7033 encoder driving a VGA and DVI display.

Link: https://lists.freedesktop.org/archives/dri-devel/2018-December/201021.html
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v2:
- Added Armada 620 (MMP3) support

Changes since v1:
- Aligned with more recent Armada 510 support: using the same clock
  names and allowing for more flexible pixel clock source selection.

 drivers/gpu/drm/armada/Makefile      |   1 +
 drivers/gpu/drm/armada/armada_6x0.c  | 178 +++++++++++++++++++++++++++
 drivers/gpu/drm/armada/armada_crtc.c |   8 ++
 drivers/gpu/drm/armada/armada_drm.h  |   2 +
 drivers/gpu/drm/armada/armada_hw.h   |  17 +++
 5 files changed, 206 insertions(+)
 create mode 100644 drivers/gpu/drm/armada/armada_6x0.c

diff --git a/drivers/gpu/drm/armada/Makefile b/drivers/gpu/drm/armada/Makefile
index 9bc3c32137248..80f7315bb6d20 100644
--- a/drivers/gpu/drm/armada/Makefile
+++ b/drivers/gpu/drm/armada/Makefile
@@ -2,6 +2,7 @@
 armada-y	:= armada_crtc.o armada_drv.o armada_fb.o armada_fbdev.o \
 		   armada_gem.o armada_overlay.o armada_plane.o armada_trace.o
 armada-y	+= armada_510.o
+armada-y	+= armada_6x0.o
 armada-$(CONFIG_DEBUG_FS) += armada_debugfs.o
 
 obj-$(CONFIG_DRM_ARMADA) := armada.o
diff --git a/drivers/gpu/drm/armada/armada_6x0.c b/drivers/gpu/drm/armada/armada_6x0.c
new file mode 100644
index 0000000000000..2053da32abea6
--- /dev/null
+++ b/drivers/gpu/drm/armada/armada_6x0.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2012 Russell King
+ * Copyright (C) 2018,2019,2020 Lubomir Rintel
+ *  Largely based on Armada 510 support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Support for Armada MMP2 and MMP3 variants
+ */
+#include <linux/clk.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_crtc.h>
+#include "armada_crtc.h"
+#include "armada_drm.h"
+#include "armada_hw.h"
+
+struct armada6x0_variant_data {
+	struct clk *clks[5];
+	struct clk *sel_clk;
+};
+
+static int armada6x0_crtc_init(struct armada_crtc *dcrtc, struct device *dev)
+{
+	struct armada6x0_variant_data *v;
+	struct property *prop;
+	struct clk *clk;
+	const char *s;
+	int idx;
+
+	v = devm_kzalloc(dev, sizeof(*v), GFP_KERNEL);
+	if (!v)
+		return -ENOMEM;
+
+	dcrtc->variant_data = v;
+
+	of_property_for_each_string(dev->of_node, "clock-names", prop, s) {
+		if (!strcmp(s, "ext_ref_clk0"))
+			idx = 0;
+		else if (!strcmp(s, "ext_ref_clk1"))
+			idx = 1;
+		else if (!strcmp(s, "plldivider"))
+			idx = 2;
+		else if (!strcmp(s, "axibus"))
+			idx = 3;
+		else if (!strcmp(s, "pll3"))
+			idx = 4;
+		else
+			continue;
+
+		clk = devm_clk_get(dev, s);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk) == -ENOENT ? -EPROBE_DEFER :
+				PTR_ERR(clk);
+		v->clks[idx] = clk;
+	}
+
+	return 0;
+}
+
+static const struct armada_clocking_params armada6x0_clocking = {
+	/* HDMI requires -0.6%..+0.5% */
+	.permillage_min = 0,
+	.permillage_max = 2000,
+	.settable = BIT(0) | BIT(1) | BIT(2),
+	.div_max = SCLK_610_INT_DIV_MASK,
+};
+
+/*
+ * This gets called with sclk = NULL to test whether the mode is
+ * supportable, and again with sclk != NULL to set the clocks up for
+ * that.  The former can return an error, but the latter is expected
+ * not to.
+ */
+static int armada6x0_crtc_compute_clock(struct armada_crtc *dcrtc,
+	const struct drm_display_mode *mode, uint32_t *sclk,
+	const u32 clk_sels[], size_t num_clk_sels)
+{
+	struct armada6x0_variant_data *v = dcrtc->variant_data;
+	unsigned long desired_khz = mode->crtc_clock;
+	struct armada_clk_result res;
+	int ret, idx;
+
+	idx = armada_crtc_select_clock(dcrtc, &res, &armada6x0_clocking,
+				       v->clks, ARRAY_SIZE(v->clks),
+				       desired_khz);
+	if (idx < 0)
+		return idx;
+	if (idx >= num_clk_sels)
+		return -EINVAL;
+
+	ret = clk_prepare_enable(res.clk);
+	if (ret)
+		return ret;
+
+	if (sclk) {
+		clk_set_rate(res.clk, res.desired_clk_hz);
+
+		*sclk = 0x00001000;	/* No idea */
+		*sclk |= 1 << 8;	/* MIPI clock bypass */
+		*sclk |= clk_sels[idx];
+		*sclk |= res.div;
+
+		/* We are now using this clock */
+		v->sel_clk = res.clk;
+		swap(dcrtc->clk, res.clk);
+	}
+
+	clk_disable_unprepare(res.clk);
+
+	return 0;
+}
+
+static const u32 armada610_clk_sels[] = {
+	SCLK_610_DISP0,
+	SCLK_610_DISP1,
+	SCLK_610_HDMI_PLL,
+	SCLK_610_AXI,
+};
+
+static int armada610_crtc_compute_clock(struct armada_crtc *dcrtc,
+	const struct drm_display_mode *mode, uint32_t *sclk)
+{
+	return armada6x0_crtc_compute_clock(dcrtc, mode, sclk,
+					    armada610_clk_sels,
+					    ARRAY_SIZE(armada610_clk_sels));
+}
+
+static const u32 armada620_clk_sels[] = {
+	SCLK_620_DISP0,
+	SCLK_620_DISP1,
+	SCLK_620_HDMI_PLL,
+	SCLK_620_AXI,
+	SCLK_620_PLL3,
+};
+
+static int armada620_crtc_compute_clock(struct armada_crtc *dcrtc,
+	const struct drm_display_mode *mode, uint32_t *sclk)
+{
+	return armada6x0_crtc_compute_clock(dcrtc, mode, sclk,
+					    armada620_clk_sels,
+					    ARRAY_SIZE(armada620_clk_sels));
+}
+
+static void armada6x0_crtc_disable(struct armada_crtc *dcrtc)
+{
+	if (dcrtc->clk) {
+		clk_disable_unprepare(dcrtc->clk);
+		dcrtc->clk = NULL;
+	}
+}
+
+static void armada6x0_crtc_enable(struct armada_crtc *dcrtc,
+	const struct drm_display_mode *mode)
+{
+	struct armada6x0_variant_data *v = dcrtc->variant_data;
+
+	if (!dcrtc->clk && v->sel_clk) {
+		if (!WARN_ON(clk_prepare_enable(v->sel_clk)))
+			dcrtc->clk = v->sel_clk;
+	}
+}
+
+const struct armada_variant armada610_ops = {
+	.init = armada6x0_crtc_init,
+	.compute_clock = armada610_crtc_compute_clock,
+	.disable = armada6x0_crtc_disable,
+	.enable = armada6x0_crtc_enable,
+};
+
+const struct armada_variant armada620_ops = {
+	.init = armada6x0_crtc_init,
+	.compute_clock = armada620_crtc_compute_clock,
+	.disable = armada6x0_crtc_disable,
+	.enable = armada6x0_crtc_enable,
+};
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 0f343bf584c8c..3ac1363933097 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -1101,6 +1101,14 @@ static const struct of_device_id armada_lcd_of_match[] = {
 		.compatible	= "marvell,dove-lcd",
 		.data		= &armada510_ops,
 	},
+	{
+		.compatible	= "marvell,mmp2-lcd",
+		.data		= &armada610_ops,
+	},
+	{
+		.compatible	= "marvell,mmp3-lcd",
+		.data		= &armada620_ops,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, armada_lcd_of_match);
diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
index a11bdaccbb336..33ed772449268 100644
--- a/drivers/gpu/drm/armada/armada_drm.h
+++ b/drivers/gpu/drm/armada/armada_drm.h
@@ -52,6 +52,8 @@ struct armada_variant {
 
 /* Variant ops */
 extern const struct armada_variant armada510_ops;
+extern const struct armada_variant armada610_ops;
+extern const struct armada_variant armada620_ops;
 
 struct armada_private {
 	struct drm_device	drm;
diff --git a/drivers/gpu/drm/armada/armada_hw.h b/drivers/gpu/drm/armada/armada_hw.h
index 9c88b38a40039..6eb6ab6d8416c 100644
--- a/drivers/gpu/drm/armada/armada_hw.h
+++ b/drivers/gpu/drm/armada/armada_hw.h
@@ -216,6 +216,23 @@ enum {
 	SCLK_510_FRAC_DIV_MASK	= 0xfff << 16,
 	SCLK_510_INT_DIV_MASK	= 0xffff << 0,
 
+	/* Armada 610 */
+	SCLK_610_AXI		= 0x0 << 30,
+	SCLK_610_DISP0		= 0x1 << 30,	/* LCD Display 1 */
+	SCLK_610_DISP1		= 0x2 << 30,	/* LCD Display 2 */
+	SCLK_610_HDMI_PLL	= 0x3 << 30,	/* HDMI PLL clock */
+	SCLK_610_PANEL_CLK_DIS	= 0x1 << 28,	/* 1 = panel clock disabled */
+	SCLK_610_FRAC_DIV_MASK	= 0xfff << 16,
+	SCLK_610_MIPI_DIV_MASK	= 0xf << 8,	/* 0 = off, 1 = bypass, ... */
+	SCLK_610_INT_DIV_MASK	= 0xff << 0,
+
+	/* Armada 620 */
+	SCLK_620_AXI		= 0x0 << 29,
+	SCLK_620_DISP0		= 0x1 << 29,	/* LCD Display 1 */
+	SCLK_620_DISP1		= 0x2 << 29,	/* LCD Display 2 */
+	SCLK_620_HDMI_PLL	= 0x3 << 29,	/* HDMI PLL clock */
+	SCLK_620_PLL3		= 0x7 << 29,	/* HDMI PLL clock */
+
 	/* Armada 16x */
 	SCLK_16X_AHB		= 0x0 << 28,
 	SCLK_16X_PCLK		= 0x1 << 28,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
