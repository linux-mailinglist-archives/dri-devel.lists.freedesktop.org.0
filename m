Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA17F9EAC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD8810E24C;
	Mon, 27 Nov 2023 11:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92C0810E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:34:51 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id A5AE624E254;
 Mon, 27 Nov 2023 19:34:40 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Nov
 2023 19:34:40 +0800
Received: from yang-virtual-machine.localdomain (113.72.144.198) by
 EXMBX171.cuchost.com (172.16.6.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 27 Nov 2023 19:34:39 +0800
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 2/2] gpu: drm: bridge: cadence: Add a driver and platform
 ops for StarFive JH7110 SoC
Date: Mon, 27 Nov 2023 19:34:36 +0800
Message-ID: <20231127113436.57361-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231127113436.57361-1-shengyang.chen@starfivetech.com>
References: <20231127113436.57361-1-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.198]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, shengyang.chen@starfivetech.com,
 conor+dt@kernel.org, jonas@kwiboo.se, mripard@kernel.org, robh+dt@kernel.org,
 neil.armstrong@linaro.org, keith.zhao@starfivetech.com, bbrezillon@kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com,
 tzimmermann@suse.de, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Keith Zhao <keith.zhao@starfivetech.com>

In order to fit CDNS DSI module in StarFive JH7110 SoC,
The mainly modification is followed:

1.Add driver for StarFive JH7110 SoC to drive its CDNS DSI module.
2.Add platform ops in cdns-dsi.c for StarFive JH7110 SoC probing.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  28 +-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  19 +
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 386 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  | 186 +++++++++
 7 files changed, 634 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..e3c8e81c7656 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6868,6 +6868,14 @@ F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
+DRM DRIVERS FOR STARFIVE
+M:	Keith Zhao <keith.zhao@starfivetech.com>
+M:	Shengyang Chen <shengyang.chen@starfivetech.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110*
+
 DRM DRIVER FOR ST-ERICSSON MCDE
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddc..ad9f572f4720 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -19,6 +19,13 @@ config DRM_CDNS_DSI_J721E
 	help
 	  Support J721E Cadence DSI wrapper. The wrapper manages
 	  the routing of the DSS DPI signal to the Cadence DSI.
+
+config DRM_CDNS_DSI_JH7110
+	bool "JH7110 SOC Cadence DSI support"
+	default n
+	help
+	  Cadence DPI to DSI bridge which is embedded in the
+	  StarFive JH7110 SoC.
 endif
 
 config DRM_CDNS_MHDP8546
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d13..87f603a9f4ad 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
+cdns-dsi-$(CONFIG_DRM_CDNS_DSI_JH7110) += cdns-dsi-jh7110.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..114385890dd1 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -27,6 +27,10 @@
 #include "cdns-dsi-j721e.h"
 #endif
 
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+#include "cdns-dsi-jh7110.h"
+#endif
+
 #define IP_CONF				0x0
 #define SP_HS_FIFO_DEPTH(x)		(((x) & GENMASK(30, 26)) >> 26)
 #define SP_LP_FIFO_DEPTH(x)		(((x) & GENMASK(25, 21)) >> 21)
@@ -586,6 +590,9 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
+	if (dsi->platform_ops && dsi->platform_ops->update)
+		dsi->platform_ops->update(dsi, dsi_cfg, mode);
+
 	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
 	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
@@ -683,7 +690,7 @@ static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put(dsi->base.dev);
 }
 
-static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
+void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	u32 status;
@@ -1026,6 +1033,14 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
 
 	cdns_dsi_init_link(dsi);
 
+	/*
+	 * on Jh7110 soc , when transfer dsi command ,
+	 * cdns_dsi_hs_init is needed.
+	 * or the final ret will be error value.
+	 */
+	if (dsi->platform_ops && dsi->platform_ops->transfer)
+		dsi->platform_ops->transfer(dsi);
+
 	ret = mipi_dsi_create_packet(&packet, msg);
 	if (ret)
 		goto out;
@@ -1142,6 +1157,9 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	clk_prepare_enable(dsi->dsi_p_clk);
 	clk_prepare_enable(dsi->dsi_sys_clk);
 
+	if (dsi->platform_ops && dsi->platform_ops->resume)
+		dsi->platform_ops->resume(dsi);
+
 	return 0;
 }
 
@@ -1152,6 +1170,10 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	clk_disable_unprepare(dsi->dsi_sys_clk);
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
+
+	if (dsi->platform_ops && dsi->platform_ops->suspend)
+		dsi->platform_ops->suspend(dsi);
+
 	dsi->link_initialized = false;
 	return 0;
 }
@@ -1294,6 +1316,10 @@ static const struct of_device_id cdns_dsi_of_match[] = {
 #ifdef CONFIG_DRM_CDNS_DSI_J721E
 	{ .compatible = "ti,j721e-dsi", .data = &dsi_ti_j721e_ops, },
 #endif
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	{ .compatible = "starfive,cdns-dsi", .data = &dsi_ti_jh7110_ops, },
+#endif
+
 	{ },
 };
 MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index ca7ea2da635c..9067703f1e49 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -53,12 +53,20 @@ struct cdns_dsi;
  * @deinit: Called in the CDNS DSI remove
  * @enable: Called at the beginning of CDNS DSI bridge enable
  * @disable: Called at the end of CDNS DSI bridge disable
+ * @resume: Called at the resume of CDNS DSI
+ * @suspend: Called at the suspend of CDNS DSI
+ * @update: Called at the middle of CDNS DSI bridge enable
  */
 struct cdns_dsi_platform_ops {
 	int (*init)(struct cdns_dsi *dsi);
 	void (*deinit)(struct cdns_dsi *dsi);
 	void (*enable)(struct cdns_dsi *dsi);
 	void (*disable)(struct cdns_dsi *dsi);
+	void (*resume)(struct cdns_dsi *dsi);
+	void (*suspend)(struct cdns_dsi *dsi);
+	void (*update)(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
+		       const struct drm_display_mode *mode);
+	void (*transfer)(struct cdns_dsi *dsi);
 };
 
 struct cdns_dsi {
@@ -79,6 +87,17 @@ struct cdns_dsi {
 	bool link_initialized;
 	bool phy_initialized;
 	struct phy *dphy;
+
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	struct clk *apb_clk;
+	struct clk *txesc_clk;
+	struct reset_control *dpi_rst;
+	struct reset_control *apb_rst;
+	struct reset_control *txesc_rst;
+	struct reset_control *txbytehs_rst;
+#endif
 };
 
+void cdns_dsi_hs_init(struct cdns_dsi *dsi);
+
 #endif /* !__CDNS_DSI_H__ */
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
new file mode 100644
index 000000000000..db082eefdf18
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * jh7110 soc Cadence DSI wrapper
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/io.h>
+
+#include "cdns-dsi-jh7110.h"
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/iopoll.h>
+
+static int cdns_dsi_clock_enable(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = clk_prepare_enable(dsi->apb_clk);
+	if (ret) {
+		dev_err(dev, "failed to prepare/enable apb_clk\n");
+		return ret;
+	}
+	ret = clk_prepare_enable(dsi->txesc_clk);
+	if (ret) {
+		dev_err(dev, "failed to prepare/enable txesc_clk\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static void  cdns_dsi_clock_disable(struct cdns_dsi *dsi)
+{
+	clk_disable_unprepare(dsi->apb_clk);
+	clk_disable_unprepare(dsi->txesc_clk);
+}
+
+static int cdns_dsi_resets_deassert(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = reset_control_deassert(dsi->apb_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert apb_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(dsi->txesc_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert txesc_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(dsi->dpi_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert dpi_rst\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int cdns_dsi_resets_assert(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = reset_control_assert(dsi->apb_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert apb_rst\n");
+		return ret;
+	}
+	ret = reset_control_assert(dsi->txesc_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert txesc_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_assert(dsi->dpi_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert dpi_rst\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int cdns_dsi_get_clock(struct device *dev, struct cdns_dsi *dsi)
+{
+	dsi->apb_clk = devm_clk_get(dev, "apb");
+	if (IS_ERR(dsi->apb_clk))
+		return PTR_ERR(dsi->apb_clk);
+
+	dsi->txesc_clk = devm_clk_get(dev, "txesc");
+	if (IS_ERR(dsi->txesc_clk))
+		return PTR_ERR(dsi->txesc_clk);
+
+	return 0;
+}
+
+static int cdns_dsi_get_reset(struct device *dev, struct cdns_dsi *dsi)
+{
+	dsi->dpi_rst = devm_reset_control_get(dev, "dsi_dpi");
+	if (IS_ERR(dsi->dpi_rst))
+		return PTR_ERR(dsi->dpi_rst);
+
+	dsi->apb_rst = devm_reset_control_get(dev, "dsi_apb");
+	if (IS_ERR(dsi->apb_rst))
+		return PTR_ERR(dsi->apb_rst);
+
+	dsi->txesc_rst = devm_reset_control_get(dev, "dsi_txesc");
+	if (IS_ERR(dsi->txesc_rst))
+		return PTR_ERR(dsi->txesc_rst);
+
+	dsi->txbytehs_rst = devm_reset_control_get(dev, "dsi_txbytehs");
+	if (IS_ERR(dsi->txbytehs_rst))
+		return PTR_ERR(dsi->txbytehs_rst);
+
+	return 0;
+}
+
+static int cdns_dsi_jh7110_init(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_get_clock(dsi->base.dev, dsi);
+	if (ret)
+		return ret;
+
+	ret = cdns_dsi_get_reset(dsi->base.dev, dsi);
+	return ret;
+}
+
+static void cdns_dsi_jh7110_resume(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_clock_enable(dsi, dsi->base.dev);
+	if (ret) {
+		dev_err(dsi->base.dev, "failed to enable clock\n");
+		return;
+	}
+	ret = cdns_dsi_resets_deassert(dsi, dsi->base.dev);
+	if (ret < 0) {
+		dev_err(dsi->base.dev, "failed to deassert reset\n");
+		return;
+	}
+}
+
+static void cdns_dsi_jh7110_suspend(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_resets_assert(dsi, dsi->base.dev);
+	if (ret < 0) {
+		dev_err(dsi->base.dev, "failed to deassert reset\n");
+		return;
+	}
+
+	cdns_dsi_clock_disable(dsi);
+}
+
+static void dpi_get_metrics(const struct dpi_params *dpi, struct dpi_metrics *m)
+{
+	unsigned int total_lines = dpi->vsync_len + dpi->vback_porch +
+			       dpi->vactive + dpi->vfront_porch;
+	m->pixels_one_line = dpi->hsync_len + dpi->hback_porch +
+			     dpi->hactive + dpi->hfront_porch;
+	m->fps = (double)dpi->pixelclock / m->pixels_one_line / total_lines;
+	m->pixelclock_period = (unsigned long)NSEC_PER_SEC /
+			       ((unsigned long)dpi->pixelclock / 1000);
+	m->hact_time = m->pixelclock_period * dpi->hactive;
+	m->hfp_time = m->pixelclock_period * dpi->hfront_porch;
+	m->hbp_time = m->pixelclock_period * dpi->hback_porch;
+	m->hsa_time = m->pixelclock_period * dpi->hsync_len;
+	m->one_line_time = m->pixelclock_period * m->pixels_one_line;
+}
+
+static int gen_dsi_timing(const struct dpi_params *dpi, int lanes,
+			  unsigned long bitrate, struct dsi_params *dsi,
+			  const struct calc_ctrl *ctrl)
+{
+	unsigned long pixel_bytes = dpi->bpp / 8;
+	unsigned long pixels_hblk = dpi->hback_porch + dpi->hfront_porch + dpi->hsync_len;
+
+	dsi->dlanes = lanes;
+	dsi->bitrate = bitrate;
+
+	// 1. HACT(WC) = Active pixels per line * Bits per pixel/8
+	//    VACT = Active lines per frame
+	unsigned long hact_wc = dpi->hactive * pixel_bytes;
+	unsigned long vact = dpi->vactive;
+
+	dsi->hact = hact_wc;
+	dsi->vact = vact;
+
+	/* 2. Get total line-time in pixel clock */
+	unsigned long pixelclock_period = NSEC_PER_SEC /
+					  (dpi->pixelclock / 1000);
+	unsigned long pixels_in_one_line = dpi->hactive + pixels_hblk;
+	unsigned long total_line_time = pixelclock_period * pixels_in_one_line;
+
+	/* 3. Calculate blanking time */
+	unsigned long byteclock = bitrate / 8;
+	unsigned long byteclock_period = NSEC_PER_SEC / (byteclock / 1000);
+	unsigned long hact_duration = dpi->hactive * pixel_bytes *
+				      byteclock_period / lanes;
+	unsigned long blanking_time = total_line_time - hact_duration;
+	unsigned long blanking_wc = blanking_time * lanes / byteclock_period;
+
+	/*
+	 * 4. Get timing parameter based on Video mode
+	 * Video mode: Sync Pulses
+	 * One line is composed of HSS +HSA + HSE + HBP + HACT + HFP
+	 * HSS/HSE -> Short packet -> 4 bytes
+	 * HSA/HBP/HACT/HFP -> Long packet -> 4 bytes header + Payload + 2 bytes CRC
+	 * Total of 2*4 + 4*6 = 32 bytes are covered in header and footer
+	 * Available blanking WC = 1210- 32 = 1178
+	 */
+	unsigned long avail_blanking_wc = blanking_wc - 32;
+
+	/*
+	 * 5. Divide the total available WC across available blanking parameters HSA,HBP & HFP.
+	 * The MIPI specification does not define the ratio. However, some
+	 * may have specific requirements. Hence, please consult the data sheet for
+	 * your display.
+	 */
+	struct dsi_hblk_ratio hblk_ratio = {
+	    .den = dpi->hsync_len + dpi->hback_porch + dpi->hfront_porch,
+	    .hsa_num = dpi->hsync_len,
+	    .hbp_num = dpi->hback_porch,
+	    .hfp_num = dpi->hfront_porch,
+	};
+	if (ctrl->r_hsa && ctrl->r_hbp && ctrl->r_hfp) {
+		/* The following is implemented based on
+		 * MIPI DSI Transmitter Subsystem v2.3 Page 30
+		 */
+		hblk_ratio.den = ctrl->r_hsa + ctrl->r_hbp + ctrl->r_hfp;
+		hblk_ratio.hsa_num = ctrl->r_hsa;
+		hblk_ratio.hbp_num = ctrl->r_hbp;
+		hblk_ratio.hfp_num = ctrl->r_hfp;
+
+		dsi->hsa = DIV_ROUND_UP(avail_blanking_wc * hblk_ratio.hsa_num, hblk_ratio.den);
+		dsi->hbp = DIV_ROUND_UP(avail_blanking_wc * hblk_ratio.hbp_num, hblk_ratio.den);
+		dsi->hfp = avail_blanking_wc - dsi->hsa - dsi->hbp;
+
+		dsi->hsa += DSI_HSA_FRAME_OVERHEAD;
+		dsi->hbp += DSI_HBP_FRAME_OVERHEAD;
+		dsi->hfp += DSI_HFP_FRAME_OVERHEAD;
+	} else {
+		/* The following is implemented based on
+		 * MIPI MIPI_DSI_v1.3.1_Host_Controller_User_Guide_v1p09.pdf
+		 * page 95
+		 */
+		dsi->hsa = dpi->hsync_len * dpi->bpp / 8;
+		dsi->hbp = dpi->hback_porch * dpi->bpp / 8;
+		dsi->hfp = blanking_wc - dsi->hsa - dsi->hbp;
+	}
+
+	/* vertical blanking lines */
+	dsi->vbp = dpi->vback_porch;
+	dsi->vfp = dpi->vfront_porch;
+	dsi->vsa = dpi->vsync_len;
+
+	return 0;
+}
+
+static int dsi_get_metrics(const struct dsi_params *dsi, struct dsi_metrics *m)
+{
+	if (!dsi || !m)
+		return -1;
+
+	m->bytes_one_line	= dsi->hsa + dsi->hbp + dsi->hact + dsi->hfp;
+	m->byteclock		= dsi->bitrate / 8;
+	m->byteclock_period	= (unsigned long)NSEC_PER_SEC /
+						  ((unsigned long)m->byteclock / 1000);
+	m->hsa_hbp_time		= DIV_ROUND_UP((dsi->hsa + dsi->hbp), dsi->dlanes) *
+						  m->byteclock_period;
+	m->hact_time		= DIV_ROUND_UP(dsi->hact, dsi->dlanes) *
+						  m->byteclock_period;
+	m->hfp_time			= DIV_ROUND_UP(dsi->hfp, dsi->dlanes) *
+						  m->byteclock_period;
+	m->one_line_time	= DIV_ROUND_UP(m->bytes_one_line, dsi->dlanes) *
+						  m->byteclock_period;
+	return 0;
+}
+
+static unsigned long dphy_adjust_bitrate(unsigned int dlanes,
+					 unsigned long bitrate_alignment,
+					 unsigned long bitrate_want)
+{
+	unsigned long bitrate = bitrate_want;
+
+	/* align to dphy timing */
+	if (bitrate_alignment > 0) {
+		unsigned long reminder = bitrate % bitrate_alignment;
+
+		if (reminder)
+			bitrate += bitrate_alignment - reminder;
+	}
+
+	return bitrate;
+}
+
+static int calc_gen_dsi(const struct calc_ctrl *ctrl, struct dpi_params *dpi,
+			struct dsi_params *dsi)
+{
+	struct dpi_metrics dpi_metrics;
+	unsigned long bitrate_want;
+	unsigned long bitrate;
+	unsigned long abs_line_time_delta;
+	struct dsi_metrics dsi_metrics;
+
+	dpi_get_metrics(dpi, &dpi_metrics);
+
+	bitrate_want = dpi->pixelclock / ctrl->dlanes * dpi->bpp;
+	bitrate = dphy_adjust_bitrate(ctrl->dlanes, ctrl->bitrate_alignment,
+				      bitrate_want);
+
+	do {
+		gen_dsi_timing(dpi, ctrl->dlanes, bitrate, dsi, ctrl);
+		dsi_get_metrics(dsi, &dsi_metrics);
+		abs_line_time_delta = dsi_metrics.one_line_time - dpi_metrics.one_line_time;
+		if (dsi_metrics.one_line_time < dpi_metrics.one_line_time)
+			abs_line_time_delta = dpi_metrics.one_line_time - dsi_metrics.one_line_time;
+
+		if (abs_line_time_delta <= ctrl->line_time_tolerance)
+			return 0;
+
+		bitrate += ctrl->bitrate_alignment;
+	} while (bitrate < ctrl->max_bitrate);
+
+	return -1;
+}
+
+static void cdns_dsi_jh7110_update(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
+				   const struct drm_display_mode *mode)
+{
+	struct calc_ctrl ctrl = {
+		.fps_tolerance       = 0.1f,
+		.max_bitrate         = 1000000000,
+		.min_bitrate         = 370000000,
+		.bitrate_alignment   = 10000000,
+		.dsi_video_mode      = DSI_Video_NonBurstPulse,
+		.line_time_tolerance = 2000,
+		.r_hsa = 2,
+		.r_hbp = 2,
+		.r_hfp = 2,
+	};
+	struct dsi_params dsi_p = {0};
+	struct dpi_params dpi = {0};
+
+	ctrl.dlanes = dsi->output.dev->lanes;
+
+	dpi.bpp = mipi_dsi_pixel_format_to_bpp(dsi->output.dev->format);
+	dpi.pixelclock = mode->clock * 1000;
+	dpi.hactive = mode->hdisplay;
+	dpi.hfront_porch = mode->hsync_start - mode->hdisplay;
+	dpi.hback_porch = mode->htotal - mode->hsync_end;
+	dpi.hsync_len = mode->hsync_end - mode->hsync_start;
+	dpi.vactive = mode->vdisplay;
+	dpi.vfront_porch = mode->vsync_start - mode->vdisplay;
+	dpi.vback_porch = mode->vtotal - mode->vsync_end;
+	dpi.vsync_len = mode->vsync_end - mode->vsync_start;
+
+	if (!calc_gen_dsi(&ctrl, &dpi, &dsi_p)) {
+		dsi_cfg->hbp = dsi_p.hbp - DSI_HBP_FRAME_OVERHEAD;
+		dsi_cfg->hsa = dsi_p.hsa - DSI_HSA_FRAME_OVERHEAD;
+		dsi_cfg->hfp = dsi_p.hfp - DSI_HFP_FRAME_OVERHEAD;
+		dsi->output.phy_opts.mipi_dphy.hs_clk_rate = dsi_p.bitrate;
+	}
+}
+
+static void jh7110_cdns_dsi_hs_init(struct cdns_dsi *dsi)
+{
+	cdns_dsi_hs_init(dsi);
+	reset_control_deassert(dsi->txbytehs_rst);
+}
+
+const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops = {
+	.init = cdns_dsi_jh7110_init,
+	.resume = cdns_dsi_jh7110_resume,
+	.suspend = cdns_dsi_jh7110_suspend,
+	.update = cdns_dsi_jh7110_update,
+	.transfer = jh7110_cdns_dsi_hs_init,
+};
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
new file mode 100644
index 000000000000..77db6cdd503f
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * JH7110 Cadence DSI
+ *
+ * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
+ * Author: keith.zhao <keith.zhao@starfivetech.com>
+ */
+
+#ifndef __CDNS_DSI_JH7110_H__
+#define __CDNS_DSI_JH7110_H__
+
+#include "cdns-dsi-core.h"
+
+#define DSI_HSS     4
+#define DSI_HSE     4
+#define DSI_VSS     4
+#define DSI_VSE     4
+#define DSI_HDR     4
+#define DSI_CRC     2
+
+/*
+ * HBP should be reduced by 12 to account for the header
+ * and footer on the blanking packet (6 bytes) plus
+ * the header/footer on the active data packet (6 bytes)
+ */
+#define DSI_HBP_FRAME_OVERHEAD          12
+
+/*
+ * HSA should be reduced by 14 bytes to account for the HSS short packet (4 bytes),
+ * the long blanking packet
+ * header and CRC footer (4+2 bytes)
+ * and the HSE short packet (4 bytes)
+ */
+#define DSI_HSA_FRAME_OVERHEAD          14
+
+/*
+ * HFP should be reduced by 6 bytes to account
+ * for the long packet header and CRC footer
+ */
+#define DSI_HFP_FRAME_OVERHEAD          6
+
+#define DSI_HSS_VSS_VSE_FRAME_OVERHEAD  4
+#define DSI_BLANKING_FRAME_OVERHEAD     6
+#define DSI_NULL_FRAME_OVERHEAD         6
+#define DSI_EOT_PKT_SIZE                4
+
+#define DSI_REG_HSA_LIMIT				(BIT(10) - 1 + DSI_HSA_FRAME_OVERHEAD)
+#define DSI_REG_HBP_LIMIT				(BIT(16) - 1 + DSI_HBP_FRAME_OVERHEAD)
+#define DSI_REG_HFP_LIMIT				(BIT(11) - 1 + DSI_HFP_FRAME_OVERHEAD)
+#define DSI_REG_VSA_LIMIT				(BIT(6) - 1)
+#define DSI_REG_VBP_LIMIT				(BIT(6) - 1)
+#define DSI_REG_VFP_LIMIT				(BIT(8) - 1)
+
+struct dsi_regval_t {
+	/*
+	 * Active line Pulse Mode:
+	 * |____hsync_____|____hbp_____|________________hact_______________|_______hfp________|
+	 * |_HSS_HSA_HSE__|HDR_HBP_CRC_|HDR_____________HACT____________CRC|HDR____HFP_____CRC|_HSS_
+	 * Active line Event Mode:
+	 * |____hsync_____|____hbp_____|________________hact_______________|_______hfp________|
+	 * |_HSS_|HDR___HSA+HBP____CRC_|HDR_____________HACT____________CRC|HDR____HFP_____CRC|_HSS_
+	 */
+	int hsa_length, hbp_length, hact_length, hfp_length; // register field value
+
+	/*
+	 * Pulse mode Blank line
+	 * |______________|_______________________blkline_pulse_pck___________________________|
+	 * |_HSS_HSA_HSE__|HDR_____________________________________________________________CRC|_HSS_
+	 */
+	unsigned int blkline_pulse_pck;
+
+	// BLKEOL_PCK: packet length (in byte) on end of line if burst mode (reg_blkeol_mode = 0b0x)
+	unsigned int blkeol_pck;
+
+	/*
+	 * Event mode Blank line
+	 * |_____|________________________blkline_event_pck___________________________|
+	 * |_HSS_|HDR______________________________________________________________CRC|_HSS_
+	 */
+	unsigned int blkline_event_pck;
+
+	/* BLKEOL_DURATION: specify the duration in clock cycles
+	 * of the BLLP period (used for burst mode)
+	 * unsigned int blkeol_duration;
+
+	 * REG_LINE_DURATION: duration -in clock cycles - of the blanking area for VSA/VBP
+	 * and VFP lines - considered when reg_blkline_mode = 1b1x
+
+	 * Pulse mode Blank LP line EOT disabled
+	 * |______________|_______________________reg_line_duration_______________________|
+	 * |_HSS_HSA_HSE__|__________________________LP___________________________________|_HSS_
+	 * Pulse mode Blank LP line EOT enabled
+	 * |______________|___|___________________reg_line_duration_______________________|
+	 * |_HSS_HSA_HSE__|EoT|______________________LP___________________________________|_HSS_
+	 * Event mode Blank LP line EOT enabled
+	 * |________|_____________________________reg_line_duration_______________________|
+	 * |_HSS|EoT|________________________________LP___________________________________|_HSS_
+	 */
+	unsigned int reg_line_duration;
+};
+
+enum dsi_video_mode {
+	DSI_Video_Burst,
+	DSI_Video_NonBurstPulse,
+	DSI_Video_NonBurstEvent,
+};
+
+struct dsi_params {
+	unsigned int	dlanes;
+	unsigned long	bitrate;
+	unsigned int	hsa;
+	unsigned int	hbp;
+	unsigned int	hfp;
+	unsigned int	hact;
+	unsigned int	vsa;
+	unsigned int	vbp;
+	unsigned int	vfp;
+	unsigned int	vact;
+};
+
+struct dsi_metrics {
+	unsigned int bytes_one_line;
+	unsigned long byteclock;
+
+	//period and time in ps
+	unsigned long byteclock_period;
+	unsigned long hsa_hbp_time;
+	unsigned long hact_time;
+	unsigned long hfp_time;
+	unsigned long one_line_time;
+};
+
+struct dpi_params {
+	unsigned int bpp;
+	unsigned long   pixelclock;
+	unsigned int hactive;
+	unsigned int hfront_porch;
+	unsigned int hback_porch;
+	unsigned int hsync_len;
+	unsigned int vactive;
+	unsigned int vfront_porch;
+	unsigned int vback_porch;
+	unsigned int vsync_len;
+};
+
+struct dpi_metrics {
+	unsigned int pixels_one_line;
+	double fps;
+
+	unsigned long pixelclock_period;
+	unsigned long hact_time;
+	unsigned long hfp_time;
+	unsigned long hbp_time;
+	unsigned long hsa_time;
+	unsigned long one_line_time;
+};
+
+struct dsi_hblk_ratio {
+	int den;
+	int hsa_num;
+	int hbp_num;
+	int hfp_num;
+};
+
+struct calc_ctrl {
+	unsigned int hactive;
+	unsigned int vactive;
+	unsigned int bpp;
+	unsigned int fps;
+	double   fps_tolerance;
+
+	unsigned int dlanes;
+	unsigned long bitrate_alignment;
+	unsigned long max_bitrate;
+	unsigned long min_bitrate;
+	unsigned int dsi_video_mode;
+
+	unsigned int r_hsa;
+	unsigned int r_hbp;
+	unsigned int r_hfp;
+	unsigned int line_time_tolerance;
+};
+
+extern const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops;
+
+#endif /* !__CDNS_DSI_JH7110_H__ */
-- 
2.17.1

