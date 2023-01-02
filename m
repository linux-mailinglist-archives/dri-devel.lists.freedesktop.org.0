Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431B65AF70
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8324610E2F2;
	Mon,  2 Jan 2023 10:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 535 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 10:19:00 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360F10E2F2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:19:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 302A9wxJ020619;
 Mon, 2 Jan 2023 04:09:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1672654198;
 bh=jpJ+k/TQqNqd5dVmv5r9MCmlVeYh5PtHoXH1JVJlU6E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TAPqOvndmtCUs/2XL5xTCdNsmCmVTQhxw7aQuJyug8BhJPETAJYf/zgK+ZtnZhYN6
 T5rR35B8nadiNj4BNOVvqcsCgErna9VEydTy787ro4RTN4Po7UWSS6ZYbBrUR5x3/E
 1Eu6oxpXlJ8A+E2wvyXYVySy1saaAw84UOTM9IHI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 302A9wGn025646
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Jan 2023 04:09:58 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 2
 Jan 2023 04:09:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 2 Jan 2023 04:09:58 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 302A9uT7127554;
 Mon, 2 Jan 2023 04:09:57 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 5/5] drm/bridge: cdns-dsi: Add support for J721E wrapper
Date: Mon, 2 Jan 2023 15:39:42 +0530
Message-ID: <20230102100942.1828-6-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102100942.1828-1-r-ravikumar@ti.com>
References: <20230102100942.1828-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 jpawar@cadence.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, vigneshr@ti.com, devicetree@vger.kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, sjakhade@cadence.com,
 lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for wrapper settings for DSI bridge on
j721e. Also enable DPI0

---------------      -----------------------
|      -------|      |-------              |
| DSS  | DPI2 |----->| DPI0 |  DSI Wrapper |
|      -------|      |-------              |
---------------      -----------------------

As shown above DPI2 output of DSS is connected
to DPI0 input of DSI Wrapper, DSI wrapper
gives control wheather to enable/disable DPI0
input. In j721e above is the only configuration
supported

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        | 10 ++++
 drivers/gpu/drm/bridge/cadence/Makefile       |  1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 35 ++++++++++++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    | 13 +++++
 .../gpu/drm/bridge/cadence/cdns-dsi-j721e.c   | 51 +++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-j721e.h   | 16 ++++++
 6 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 8fbb46c66094..f8ea0393fe8a 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -36,3 +36,13 @@ config DRM_CDNS_DSI
 	help
 	  Support Cadence DPI to DSI bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
+
+if DRM_CDNS_DSI
+
+config DRM_CDNS_DSI_J721E
+	bool "J721E Cadence DSI wrapper support"
+	default y
+	help
+	  Support J721E Cadence DSI wrapper. The wrapper manages
+	  the routing of the DSS DPI signal to the Cadence DSI.
+endif
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index e3d8e9a40784..4cffc8ff71c4 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -4,3 +4,4 @@ cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
+cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index cba91247ab26..a5b5dfbf09a0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -15,12 +15,16 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include "cdns-dsi-core.h"
+#ifdef CONFIG_DRM_CDNS_DSI_J721E
+#include "cdns-dsi-j721e.h"
+#endif
 
 static inline struct cdns_dsi *input_to_dsi(struct cdns_dsi_input *input)
 {
@@ -265,6 +269,10 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
 
 	val = readl(dsi->regs + MCTL_MAIN_EN) & ~IF_EN(input->id);
 	writel(val, dsi->regs + MCTL_MAIN_EN);
+
+	if (dsi->platform_ops && dsi->platform_ops->disable)
+		dsi->platform_ops->disable(dsi);
+
 	pm_runtime_put(dsi->base.dev);
 }
 
@@ -360,6 +368,9 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
 		return;
 
+	if (dsi->platform_ops && dsi->platform_ops->enable)
+		dsi->platform_ops->enable(dsi);
+
 	mode = &bridge->encoder->crtc->state->adjusted_mode;
 	nlanes = output->dev->lanes;
 
@@ -800,6 +811,8 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 		goto err_disable_pclk;
 	}
 
+	dsi->platform_ops = of_device_get_match_data(&pdev->dev);
+
 	val = readl(dsi->regs + IP_CONF);
 	dsi->direct_cmd_fifo_depth = 1 << (DIRCMD_FIFO_DEPTH(val) + 2);
 	dsi->rx_fifo_depth = RX_FIFO_DEPTH(val);
@@ -835,14 +848,27 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 	dsi->base.dev = &pdev->dev;
 	dsi->base.ops = &cdns_dsi_ops;
 
+	if (dsi->platform_ops && dsi->platform_ops->init) {
+		ret = dsi->platform_ops->init(dsi);
+		if (ret != 0) {
+			dev_err(&pdev->dev, "platform initialization failed: %d\n",
+				ret);
+			goto err_disable_runtime_pm;
+		}
+	}
+
 	ret = mipi_dsi_host_register(&dsi->base);
 	if (ret)
-		goto err_disable_runtime_pm;
+		goto err_deinit_platform;
 
 	clk_disable_unprepare(dsi->dsi_p_clk);
 
 	return 0;
 
+err_deinit_platform:
+	if (dsi->platform_ops && dsi->platform_ops->deinit)
+		dsi->platform_ops->deinit(dsi);
+
 err_disable_runtime_pm:
 	pm_runtime_disable(&pdev->dev);
 
@@ -857,6 +883,10 @@ static int cdns_dsi_drm_remove(struct platform_device *pdev)
 	struct cdns_dsi *dsi = platform_get_drvdata(pdev);
 
 	mipi_dsi_host_unregister(&dsi->base);
+
+	if (dsi->platform_ops && dsi->platform_ops->deinit)
+		dsi->platform_ops->deinit(dsi);
+
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
@@ -864,6 +894,9 @@ static int cdns_dsi_drm_remove(struct platform_device *pdev)
 
 static const struct of_device_id cdns_dsi_of_match[] = {
 	{ .compatible = "cdns,dsi" },
+#ifdef CONFIG_DRM_CDNS_DSI_J721E
+	{ .compatible = "ti,j721e-dsi", .data = &dsi_ti_j721e_ops, },
+#endif
 	{ },
 };
 MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index 65cc77f19b39..2b1e96440c49 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -439,9 +439,22 @@ struct cdns_dsi_input {
 	struct drm_bridge bridge;
 };
 
+struct cdns_dsi;
+
+struct dsi_platform_ops {
+	int (*init)(struct cdns_dsi *dsi);
+	void (*deinit)(struct cdns_dsi *dsi);
+	void (*enable)(struct cdns_dsi *dsi);
+	void (*disable)(struct cdns_dsi *dsi);
+};
+
 struct cdns_dsi {
 	struct mipi_dsi_host base;
 	void __iomem *regs;
+#ifdef CONFIG_DRM_CDNS_DSI_J721E
+	void __iomem *j721e_regs;
+#endif
+	const struct dsi_platform_ops *platform_ops;
 	struct cdns_dsi_input input;
 	struct cdns_dsi_output output;
 	unsigned int direct_cmd_fifo_depth;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
new file mode 100644
index 000000000000..b5216acb333e
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI j721e Cadence DSI wrapper
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Rahul T R <r-ravikumar@ti.com>
+ */
+
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+#include "cdns-dsi-j721e.h"
+
+#define DSI_WRAP_REVISION		0x0
+#define DSI_WRAP_DPI_CONTROL		0x4
+#define DSI_WRAP_DSC_CONTROL		0x8
+#define DSI_WRAP_DPI_SECURE		0xc
+#define DSI_WRAP_DSI_0_ASF_STATUS	0x10
+
+#define DSI_WRAP_DPI_0_EN		BIT(0)
+#define DSI_WRAP_DSI2_MUX_SEL		BIT(4)
+
+static int cdns_dsi_j721e_init(struct cdns_dsi *dsi)
+{
+	struct platform_device *pdev = to_platform_device(dsi->base.dev);
+
+	dsi->j721e_regs = devm_platform_ioremap_resource(pdev, 1);
+	return PTR_ERR_OR_ZERO(dsi->j721e_regs);
+}
+
+static void cdns_dsi_j721e_enable(struct cdns_dsi *dsi)
+{
+	/*
+	 * Enable DPI0 as its input. DSS0 DPI2 is connected
+	 * to DSI DPI0. This is the only supported configuration on
+	 * J721E.
+	 */
+	writel(DSI_WRAP_DPI_0_EN, dsi->j721e_regs + DSI_WRAP_DPI_CONTROL);
+}
+
+static void cdns_dsi_j721e_disable(struct cdns_dsi *dsi)
+{
+	/* Put everything to defaults  */
+	writel(0, dsi->j721e_regs + DSI_WRAP_DPI_CONTROL);
+}
+
+const struct dsi_platform_ops dsi_ti_j721e_ops = {
+	.init = cdns_dsi_j721e_init,
+	.enable = cdns_dsi_j721e_enable,
+	.disable = cdns_dsi_j721e_disable,
+};
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
new file mode 100644
index 000000000000..fd251c1a268b
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI j721e Cadence DSI wrapper
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Rahul T R <r-ravikumar@ti.com>
+ */
+
+#ifndef CDNS_DSI_J721E_H
+#define CDNS_DSI_J721E_H
+
+#include "cdns-dsi-core.h"
+
+extern const struct dsi_platform_ops dsi_ti_j721e_ops;
+
+#endif /* !CDNS_DSI_J721E_H */
-- 
2.39.0

