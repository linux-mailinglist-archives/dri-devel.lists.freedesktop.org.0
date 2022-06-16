Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC54E338
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FB110E3FC;
	Thu, 16 Jun 2022 14:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001BD10E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip7oWt7dIC5tfoWrohUgY81g5TsL054YjX35v13uhMAh4W49GqE+MztJ1DxokPStlcOxzI9FgM7M9DTcGsioP5YhOiLGhtP8wFPYUNYXQbHIX+KrOb2vOkMZJn1OyWRhb4BXERZPylwhby5ObPjzRiYJtBFZTAiUXq92UDP6PRaWw/Adi0uwolsrG8zvWGxx7re56NeS22eIcCPigj4q0fMZ1Vme3dxyZrR2B8K/N0dvoUnsB09CFbebPmKUJ+2ZXJoLd17hB3rWYDGJ2cIiZZMfvEVjT1ZTkncakV07nek0Ezq1vPd9RC2AhXB+ZS43lJncE4yvjfgS5V5wt+X52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC9tZt55jSoKN9pT8zHy37T9xPpzLiIb1YuRbfIAkrA=;
 b=nRyfoU9Z0kCac231VsFWkL/nih3w0hMFFTPAuRUABFVHlizTfcQ98Y9bJSQKE/yeVZNtzKb1QkGR8+WsncDwGhdtp8qG1Hf3kCXmkzNGQteVd1MxLiVjARu68ccqoKyQLsoo3AmAcEi5PDQOnQHlDz7+GlfEbfeGohzAgVSdaGVz0lh0XHPgr96+QfdViVXQYKnb98rk17NyGNNZLFw26nvN5nNVb3y5ACMwdMSesCaO7+L67Ourcu4U7x5G9b6b/sugjxCNISxSBm6CSe8su79MuCubBfHnH18K81A9QU4wTcB5sIN1R6xjAbG9GDFovwFSZ31UVWOsFOOoknzSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC9tZt55jSoKN9pT8zHy37T9xPpzLiIb1YuRbfIAkrA=;
 b=Xf0quW2PCGeUOCCYT57qqWxCeumIymPZgBlfdWtHQAhbNmKU/z/5Dl1tgFiLYp4NXCzWvDKDt7K45sGq8moZVQ6PecYe7X6z7JBElNET3NFCo7jeNbW6mVZ3ODLxv0+cLltWGoc08v87qnu4Kyt0fCqnw92OV/C7KZSWgNXDwG8=
Received: from BN9PR03CA0480.namprd03.prod.outlook.com (2603:10b6:408:139::35)
 by BN6PR02MB3249.namprd02.prod.outlook.com (2603:10b6:405:64::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Thu, 16 Jun
 2022 14:18:50 +0000
Received: from BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::f1) by BN9PR03CA0480.outlook.office365.com
 (2603:10b6:408:139::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16 via Frontend
 Transport; Thu, 16 Jun 2022 14:18:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT043.mail.protection.outlook.com (10.13.2.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 14:18:49 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Jun 2022 07:17:56 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Jun 2022 07:17:56 -0700
Envelope-to: laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org
Received: from [172.23.135.119] (port=58106 helo=xhdvgannava41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1o1qJm-000507-SL; Thu, 16 Jun 2022 07:17:56 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: <laurent.pinchart@ideasonboard.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH V2 2/2] drm: xlnx: dsi: Add Xilinx MIPI DSI-Tx subsystem driver
Date: Thu, 16 Jun 2022 19:47:36 +0530
Message-ID: <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
References: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72419778-38eb-4a86-88d4-08da4fa32233
X-MS-TrafficTypeDiagnostic: BN6PR02MB3249:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB32490A8EC39D22119FB964ADB1AC9@BN6PR02MB3249.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XAivFNAskUEKUvl/aUpfLdZTQtn+oinEZoRrOxLhnGACYVOtMLqdU4mAiu087fBrLGyYbtULDyMYuW+qyZLDPzW00oVd7h2xj73zzJujfpwRQlJyogj8H+fcTaBJZzI8BSqztBkEqqeMWVVwFBOTdHQioCVUVpto6FP2zEnC4gDrfcT1oBiJ/kAY5OLbMciXBC0VtOuBlWeGzJOBdymulBrqZV4KnNwE6axi3Fsq/8HFPW3EYz9eBjM8fgxY3ATareNnyoFBdS9dFzFoF+1RfyTc5sul39eFQUOiLOAnctO/uCERCuiDj+EqqymX38wm1KauvkCWyuFT/GM+SEcv/vJK7ZUv1DjAv1TYFGEmSD2rguNvcINMg3BieI43puBXcQ58mouyoRqIa6IlfEiUcf9wHwMzpHg2cNAvtfI2qRcUOoTpo986Ka5OiaBzIcb3K3cmwBIG+scinRF8x8sLFaCazav3ThtvBZoSYaOwSzqDy6uGLtRGfaEqfM05e6iNRQN8r+BZswlgYOw4wG/2E7sFnQQM9f4wgBuMZ8SHIyjCCF111zd4KeXag4BShxyWvEiQPFP9jV7krFL5Y4gCkPxyXW8tn440Dcc7CX/e4Dz/bREmqL1EOuAcxYtlaLbvIOGO/roEj2NkifyDeXSKI3E/oHHhxEfysULlWppT5q6fKz1zurnD0MqCwpWcM8EPs35CfQfPJ71XeTqreeGpA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(47076005)(82310400005)(6666004)(7636003)(7696005)(36756003)(356005)(2906002)(426003)(54906003)(336012)(316002)(508600001)(110136005)(4326008)(5660300002)(70586007)(8676002)(9786002)(26005)(8936002)(70206006)(40460700003)(186003)(2616005)(107886003)(83380400001)(30864003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 14:18:49.7006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72419778-38eb-4a86-88d4-08da4fa32233
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3249
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
Cc: airlied@linux.ie, vgannava@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
data from AXI-4 stream interface.

It supports upto 4 lanes, optional register interface for the DPHY
and multiple RGB color formats.
This is a MIPI-DSI host driver and provides DSI bus for panels.
This driver also helps to communicate with its panel using panel
framework.

Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
---
 drivers/gpu/drm/xlnx/Kconfig    |  12 ++
 drivers/gpu/drm/xlnx/Makefile   |   1 +
 drivers/gpu/drm/xlnx/xlnx_dsi.c | 429 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 442 insertions(+)
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c

diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index f9cf93c..a75bd76 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -1,3 +1,15 @@
+config DRM_XLNX_DSI
+	tristate "Xilinx DRM DSI Subsystem Driver"
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
+	help
+	  DRM bridge driver for Xilinx programmable DSI subsystem controller.
+	  choose this option if you hava a Xilinx MIPI-DSI Tx subsytem in
+	  video pipeline.
+
 config DRM_ZYNQMP_DPSUB
 	tristate "ZynqMP DisplayPort Controller Driver"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index 51c24b7..f90849b 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,3 @@
+obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
 zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
 obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
new file mode 100644
index 0000000..39d8947
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx FPGA MIPI DSI Tx Controller driver.
+ *
+ * Copyright (C) 2022 Xilinx, Inc.
+ *
+ * Author: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+/* DSI Tx IP registers */
+#define XDSI_CCR			0x00
+#define XDSI_CCR_COREENB		BIT(0)
+#define XDSI_CCR_SOFTRST		BIT(1)
+#define XDSI_CCR_CRREADY		BIT(2)
+#define XDSI_CCR_CMDMODE		BIT(3)
+#define XDSI_CCR_DFIFORST		BIT(4)
+#define XDSI_CCR_CMDFIFORST		BIT(5)
+#define XDSI_PCR			0x04
+#define XDSI_PCR_LANES_MASK		3
+#define XDSI_PCR_VIDEOMODE(x)		(((x) & 0x3) << 3)
+#define XDSI_PCR_VIDEOMODE_MASK	GENMASK(4, 3)
+#define XDSI_PCR_VIDEOMODE_SHIFT	3
+#define XDSI_PCR_BLLPTYPE(x)		((x) << 5)
+#define XDSI_PCR_BLLPMODE(x)		((x) << 6)
+#define XDSI_PCR_PIXELFORMAT_MASK	GENMASK(12, 11)
+#define XDSI_PCR_PIXELFORMAT_SHIFT	11
+#define XDSI_PCR_EOTPENABLE(x)		((x) << 13)
+#define XDSI_GIER			0x20
+#define XDSI_ISR			0x24
+#define XDSI_IER			0x28
+#define XDSI_STR			0x2C
+#define XDSI_STR_RDY_SHPKT		BIT(6)
+#define XDSI_STR_RDY_LNGPKT		BIT(7)
+#define XDSI_STR_DFIFO_FULL		BIT(8)
+#define XDSI_STR_DFIFO_EMPTY		BIT(9)
+#define XDSI_STR_WAITFR_DATA		BIT(10)
+#define XDSI_STR_CMD_EXE_PGS		BIT(11)
+#define XDSI_STR_CCMD_PROC		BIT(12)
+#define XDSI_CMD			0x30
+#define XDSI_CMD_QUEUE_PACKET(x)	((x) & GENMASK(23, 0))
+#define XDSI_DFR			0x34
+#define XDSI_TIME1			0x50
+#define XDSI_TIME1_BLLP_BURST(x)	((x) & GENMASK(15, 0))
+#define XDSI_TIME1_HSA(x)		(((x) & GENMASK(15, 0)) << 16)
+#define XDSI_TIME2			0x54
+#define XDSI_TIME2_VACT(x)		((x) & GENMASK(15, 0))
+#define XDSI_TIME2_HACT(x)		(((x) & GENMASK(15, 0)) << 16)
+#define XDSI_HACT_MULTIPLIER		GENMASK(1, 0)
+#define XDSI_TIME3			0x58
+#define XDSI_TIME3_HFP(x)		((x) & GENMASK(15, 0))
+#define XDSI_TIME3_HBP(x)		(((x) & GENMASK(15, 0)) << 16)
+#define XDSI_TIME4			0x5c
+#define XDSI_TIME4_VFP(x)		((x) & GENMASK(7, 0))
+#define XDSI_TIME4_VBP(x)		(((x) & GENMASK(7, 0)) << 8)
+#define XDSI_TIME4_VSA(x)		(((x) & GENMASK(7, 0)) << 16)
+#define XDSI_NUM_DATA_T		4
+
+/**
+ * struct xlnx_dsi - Xilinx DSI-TX core
+ * @bridge: DRM bridge structure
+ * @dsi_host: DSI host device
+ * @next_bridge: bridge structure
+ * @dev: device structure
+ * @clks: clock source structure
+ * @iomem: Base address of DSI subsystem
+ * @mode_flags: DSI operation mode related flags
+ * @lanes: number of active data lanes supported by DSI controller
+ * @mul_factor: multiplication factor for HACT timing
+ * @format: pixel format for video mode of DSI controller
+ * @device_found: Flag to indicate device presence
+ */
+struct xlnx_dsi {
+	struct drm_bridge bridge;
+	struct mipi_dsi_host dsi_host;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct clk_bulk_data *clks;
+	void __iomem *iomem;
+	unsigned long mode_flags;
+	u32 lanes;
+	u32 mul_factor;
+	enum mipi_dsi_pixel_format format;
+	bool device_found;
+};
+
+static const struct clk_bulk_data xdsi_clks[] = {
+	{ .id = "s_axis_aclk" },
+	{ .id = "dphy_clk_200M" },
+};
+
+static inline struct xlnx_dsi *host_to_dsi(struct mipi_dsi_host *host)
+{
+	return container_of(host, struct xlnx_dsi, dsi_host);
+}
+
+static inline struct xlnx_dsi *bridge_to_dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct xlnx_dsi, bridge);
+}
+
+static inline void xlnx_dsi_write(struct xlnx_dsi *dsi, int offset, u32 val)
+{
+	writel(val, dsi->iomem + offset);
+}
+
+static inline u32 xlnx_dsi_read(struct xlnx_dsi *dsi, int offset)
+{
+	return readl(dsi->iomem + offset);
+}
+
+static int xlnx_dsi_host_attach(struct mipi_dsi_host *host,
+				struct mipi_dsi_device *device)
+{
+	struct xlnx_dsi *dsi = host_to_dsi(host);
+	struct device *dev = host->dev;
+
+	dsi->mode_flags = device->mode_flags;
+
+	if (dsi->lanes != device->lanes) {
+		dev_err(dsi->dev, "Mismatch of lanes. panel = %d, DSI = %d\n",
+			device->lanes, dsi->lanes);
+		return -EINVAL;
+	}
+
+	if (dsi->format != device->format) {
+		dev_err(dsi->dev, "Mismatch of format. panel = %d, DSI = %d\n",
+			device->format, dsi->format);
+		return -EINVAL;
+	}
+
+	if (!dsi->device_found) {
+		dsi->next_bridge = devm_drm_of_get_bridge(dev,
+							  dev->of_node, 0, 0);
+		if (IS_ERR(dsi->next_bridge))
+			return PTR_ERR(dsi->next_bridge);
+		drm_bridge_add(&dsi->bridge);
+		dsi->device_found = true;
+	}
+
+	return 0;
+}
+
+static int xlnx_dsi_host_detach(struct mipi_dsi_host *host,
+				struct mipi_dsi_device *device)
+{
+	struct xlnx_dsi *dsi = host_to_dsi(host);
+
+	drm_bridge_remove(&dsi->bridge);
+	return 0;
+}
+
+static const struct mipi_dsi_host_ops xlnx_dsi_ops = {
+	.attach = xlnx_dsi_host_attach,
+	.detach	= xlnx_dsi_host_detach,
+};
+
+static void
+xlnx_dsi_bridge_disable(struct drm_bridge *bridge,
+			struct drm_bridge_state *old_bridge_state)
+{
+	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
+	u32 reg = xlnx_dsi_read(dsi, XDSI_CCR);
+
+	reg &= ~XDSI_CCR_COREENB;
+	xlnx_dsi_write(dsi, XDSI_CCR, reg);
+}
+
+static void
+xlnx_dsi_bridge_enable(struct drm_bridge *bridge,
+		       struct drm_bridge_state *old_bridge_state)
+{
+	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
+	const struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	u32 reg, video_mode;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	reg = xlnx_dsi_read(dsi, XDSI_PCR);
+	video_mode = (reg & XDSI_PCR_VIDEOMODE_MASK) >> XDSI_PCR_VIDEOMODE_SHIFT;
+
+	if (!video_mode && (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)) {
+		reg = XDSI_TIME1_HSA(mode->hsync_end -
+				     mode->hsync_start);
+		xlnx_dsi_write(dsi, XDSI_TIME1, reg);
+	}
+
+	reg = XDSI_TIME4_VFP(mode->vsync_start - mode->vdisplay) |
+		XDSI_TIME4_VBP(mode->vtotal - mode->vsync_end) |
+		XDSI_TIME4_VSA(mode->vsync_end - mode->vsync_start);
+	xlnx_dsi_write(dsi, XDSI_TIME4, reg);
+
+	reg = XDSI_TIME3_HFP(mode->hsync_start - mode->hdisplay) |
+		XDSI_TIME3_HBP(mode->htotal - mode->hsync_end);
+	xlnx_dsi_write(dsi, XDSI_TIME3, reg);
+
+	reg = XDSI_TIME2_HACT(mode->hdisplay * dsi->mul_factor / 100) |
+		XDSI_TIME2_VACT(mode->vdisplay);
+	xlnx_dsi_write(dsi->iomem, XDSI_TIME2, reg);
+
+	xlnx_dsi_write(dsi, XDSI_PCR, XDSI_PCR_VIDEOMODE(BIT(0)));
+
+	/* Enable Core */
+	reg = xlnx_dsi_read(dsi, XDSI_CCR);
+	reg |= XDSI_CCR_COREENB;
+	xlnx_dsi_write(dsi, XDSI_CCR, reg);
+}
+
+#define MAX_INPUT_SEL_FORMATS   3
+static u32
+*xlnx_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state,
+					   u32 output_fmt,
+					   unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+	unsigned int i = 0;
+
+	*num_input_fmts = 0;
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+	default: /* define */
+	}
+
+	*num_input_fmts = i;
+	if (*num_input_fmts == 0) {
+		kfree(input_fmts);
+		input_fmts = NULL;
+	}
+
+	return input_fmts;
+}
+
+static int xlnx_dsi_bridge_attach(struct drm_bridge *bridge,
+				  enum drm_bridge_attach_flags flags)
+{
+	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
+
+	if (!dsi->next_bridge)
+		return 0;
+
+	/* Attach the next bridge */
+	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
+				 flags);
+}
+
+static void xlnx_dsi_bridge_detach(struct drm_bridge *bridge)
+{
+	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
+
+	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
+}
+
+static enum drm_mode_status
+xlnx_dsi_bridge_mode_valid(struct drm_bridge *bridge,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
+{
+	if ((mode->hdisplay & XDSI_HACT_MULTIPLIER) != 0)
+		return MODE_BAD_WIDTH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs xlnx_dsi_bridge_funcs = {
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_disable                 = xlnx_dsi_bridge_disable,
+	.atomic_enable			= xlnx_dsi_bridge_enable,
+	.atomic_get_input_bus_fmts      = xlnx_dsi_bridge_atomic_get_input_bus_fmts,
+	.attach				= xlnx_dsi_bridge_attach,
+	.detach				= xlnx_dsi_bridge_detach,
+	.mode_valid			= xlnx_dsi_bridge_mode_valid,
+};
+
+static int xlnx_dsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct xlnx_dsi *dsi;
+	int ret;
+	const int xdsi_mul_fact[XDSI_NUM_DATA_T] = {300, 225, 225, 200};
+	u32 reg;
+
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+
+	dsi->dev = dev;
+	dsi->clks = devm_kmemdup(dev, xdsi_clks, sizeof(xdsi_clks),
+				 GFP_KERNEL);
+	if (!dsi->clks)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dsi->iomem = devm_ioremap_resource(dev, res);
+	if (IS_ERR(dsi->iomem))
+		return PTR_ERR(dsi->iomem);
+
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(xdsi_clks), dsi->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(xdsi_clks), dsi->clks);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, dsi);
+	dsi->dsi_host.ops = &xlnx_dsi_ops;
+	dsi->dsi_host.dev = dev;
+
+	ret = mipi_dsi_host_register(&dsi->dsi_host);
+	if (ret) {
+		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
+		goto err_clk_put;
+	}
+
+	dsi->bridge.driver_private = dsi;
+	dsi->bridge.funcs = &xlnx_dsi_bridge_funcs;
+	dsi->bridge.of_node = pdev->dev.of_node;
+
+	reg = xlnx_dsi_read(dsi, XDSI_PCR);
+	dsi->lanes = reg & XDSI_PCR_LANES_MASK;
+	dsi->format = (reg & XDSI_PCR_PIXELFORMAT_MASK) >>
+		XDSI_PCR_PIXELFORMAT_SHIFT;
+
+	if (dsi->lanes > 4 || dsi->lanes < 1) {
+		dev_err(dsi->dev, "%d invalid lanes\n",	dsi->lanes);
+		return -EINVAL;
+	}
+
+	if (dsi->format > MIPI_DSI_FMT_RGB565) {
+		dev_err(dsi->dev, "Invalid xlnx,dsi-data-type string\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Used as a multiplication factor for HACT based on used
+	 * DSI data type.
+	 *
+	 * e.g. for RGB666_L datatype and 1920x1080 resolution,
+	 * the Hact (WC) would be as follows -
+	 * 1920 pixels * 18 bits per pixel / 8 bits per byte
+	 * = 1920 pixels * 2.25 bytes per pixel = 4320 bytes.
+	 *
+	 * Data Type - Multiplication factor
+	 * RGB888    - 3
+	 * RGB666_L  - 2.25
+-	 * RGB666_P  - 2.25
+	 * RGB565    - 2
+	 *
+	 * Since the multiplication factor is a floating number,
+	 * a 100x multiplication factor is used.
+	 */
+	dsi->mul_factor = xdsi_mul_fact[dsi->format];
+
+	dev_dbg(dsi->dev, "DSI controller num lanes = %d\n", dsi->lanes);
+	dev_dbg(dsi->dev, "DSI controller format = %d\n", dsi->format);
+
+err_clk_put:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(xdsi_clks), dsi->clks);
+
+	return ret;
+}
+
+static int xlnx_dsi_remove(struct platform_device *pdev)
+{
+	struct xlnx_dsi *dsi = platform_get_drvdata(pdev);
+
+	mipi_dsi_host_unregister(&dsi->dsi_host);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(xdsi_clks), dsi->clks);
+
+	return 0;
+}
+
+static const struct of_device_id xlnx_dsi_of_match[] = {
+	{ .compatible = "xlnx,dsi-tx-v2.0"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, xlnx_dsi_of_match);
+
+static struct platform_driver dsi_driver = {
+	.probe = xlnx_dsi_probe,
+	.remove = xlnx_dsi_remove,
+	.driver = {
+		.name = "xlnx-dsi",
+		.of_match_table = xlnx_dsi_of_match,
+	},
+};
+
+module_platform_driver(dsi_driver);
+
+MODULE_AUTHOR("Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>");
+MODULE_DESCRIPTION("Xilinx MIPI DSI host controller driver");
+MODULE_LICENSE("GPL");
--
1.8.3.1

