Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52418861E4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F4F11210D;
	Thu, 21 Mar 2024 20:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JJAol3Z7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE49112106
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b68qf90bGeZDFJ9HRT1Q6gpWZi5uUJpFN6DPz5E0DoKI5WJZiHsxboSK12bMjCyhRmODwlQ2IFVAs2Jy95tY9Bzysw2i+MNF47Foea+pMV297+4nzYKFzi4p7N9tTzpN29EBveizVgajKWSvICpPoPpQFy0KFihPZ3vu8phCM5KBsGiebCbTc2yuULZv2h5BH7j14z6CFrDY4MuUi3PNBPgAouV+CfJ1G/ubchJXFxzu8mMc7Ith369WpD0NcAKLxaCS3UzfEiZV13B9fiXEAi6ne8XEA01egOZbUt2cFuecB0IXPvhzvQtMbPf+n59BWQfmrfiG+Nr8MjH7Wf084w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z94ce+/n0RvmiJVtVAbri9i36FVONgDviQgEhnE5AwI=;
 b=RObg36cKncE7Or377GUlA/TXYIUwmycPiD/mAoQCTkXe8PQd/Xg25qScjqLfnRavktgobvDr/fyIuJawyptJh8qC6FZ36Xvr+hvF2z+iykWcyoSNm0pFDYdLDDo27tHJyvEkYuD8ahmOdjmhxkZHoQrcb4tXJ9JWBbokx2uksjqg4rk0ZOzhGlK5QGwUluuUIJHyAsZqpbtuqpoNsYVmxP6eECHfd9rgpoaZLwG40OHqVHOISCNpjxGwtYvPACWb9z2xTNYQ6XmNvr+xAPdQhkL3LKWjOKBg+P7V06cuQcuvbATvdwef3NjU3dquFl8tLdH/ZEioWCfiIPGaAwsNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z94ce+/n0RvmiJVtVAbri9i36FVONgDviQgEhnE5AwI=;
 b=JJAol3Z7AjeDc3Qos+xm4KzXZGPCstSdJjcEYtnHSAQ93s+ZLaBlFrg7srTp4qm4I8DgDCGCLZwmVXLrA0IObGgRyYh/DRq/q0jQdR2bZc6fw3CwPAJ5paJ598oJ0RyOvRr3pjGCbEN0XyeyGsUa3FOmV+G4IdQp/b9x48rr+aM=
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Thu, 21 Mar
 2024 20:44:19 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::49) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 20:44:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 20:44:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:44:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 13:44:11 -0700
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:44:10 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 21 Mar 2024 13:43:47 -0700
Subject: [PATCH v3 9/9] drm: xlnx: Intoduce TPG CRTC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240321-dp-live-fmt-v3-9-d5090d796b7e@amd.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
In-Reply-To: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: b333e939-0510-436e-8325-08dc49e7ad02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEUKuwlrz8Tj7KA+noOmz+tsRIuA+hnCGhCjx70hpHDUuW4KX0rwlF0X+BzjYTIpMJtR0ozSzeLCHB+yrtOIZEB7SZX48FkeKuyYRpSZXSQ0LVy5ktlKui9jnoon3z6rZkvy0go1Nfd/k2Gpvsn0/pFqDf/oXTeStxoGeJGLpYjRKf7MYzc/DjILzdU0BtBea8XBMdNlWZQmrda8PasOd+E7p0r79ahdOb2vNrn9yCbjZVu2a/l1quTK0WR0uq8NSqlEx4B/hwdXwFRLINvSIG+pq3VD6uy546K+5ObBDs6M4LFzD1WYqKTwd3kVerRdJCbjGP+H+M/qilAHKqbOfnvQOwH+qwxvUorMpdLsxiUKG6RFxKKaUqAWK5itoSGo99cmkOx3eGncu+hoDRWpE1YVfQNFpK7FmuVpyRLbyGRKg6t4kRDO1sUT86PbatgGHfOYvMVkmxGt/26Tf9udbG7CU1dPvuiT4IblejBo6ymGWVlLbSxbEgIASlkTuywJhX0bcPoM4gPL0sBTVcZa8da/WBS29nn/LOFePo9K68AUIOzINTbZlW9q0zCkjIj/pjbA7MyY8qglwuwbsAR3cInorNjJAuhSJyage1QOtLKQ6sT9jqCBjBtE2ko98Ws4aVMoMmp4uJ6RrUSst2+W4YERXmCjsEz4uoajfw8GAxOzLBM4ma3bIgBlnq9EEUcvM/jj3vYPEfELsaQAYS7bGNxt4kSbWzNCGh5kUMeIvjo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(36860700004)(82310400014)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:44:16.6788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b333e939-0510-436e-8325-08dc49e7ad02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DO NOT MERGE. REFERENCE ONLY.

Add CRTC driver based on AMD/Xilinx Video Test Pattern Generator IP. TPG
based FPGA design represents minimalistic harness useful for testing links
between FPGA based CRTC and external DRM encoders, both FPGA and hardened
IP based.

Add driver for AMD/Xilinx Video Timing Controller. The VTC, working in
generator mode, suplements TPG with video timing signals.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/Kconfig         |  21 +
 drivers/gpu/drm/xlnx/Makefile        |   4 +
 drivers/gpu/drm/xlnx/xlnx_tpg.c      | 846 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_vtc.c      | 452 +++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_vtc.h      | 101 +++++
 drivers/gpu/drm/xlnx/xlnx_vtc_list.c | 160 +++++++
 6 files changed, 1584 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 68ee897de9d7..c40e98c1a5e6 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -15,3 +15,24 @@ config DRM_ZYNQMP_DPSUB
 	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
 	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
 	  subsystem.
+
+config DRM_XLNX_BRIDGE_VTC
+	bool "Xilinx DRM VTC Driver"
+	depends on OF
+	help
+	  DRM brige driver for Xilinx Video Timing Controller. Choose
+	  this option to make VTC a part of the CRTC in display pipeline.
+	  Currently the support is added to the Xilinx Video Mixer and
+	  Xilinx PL display CRTC drivers. This driver provides ability
+	  to generate timings through the bridge layer.
+
+config DRM_XLNX_TPG
+	bool "Xilinx DRM TPG Driver"
+	depends on DRM && OF
+	select DRM_XLNX_BRIDGE_VTC
+	select VIDEOMODE_HELPERS
+	help
+	  CRTC driver based on AMD/Xilinx Test Pattern Generator IP. Choose
+	  this driver to enable Test Pattern Generator CRTC. This driver
+	  implements simplistic CRTC with the single plane and is perfect for
+	  testing PL to PS and PL to PL display output pipelines.
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index ea1422a39502..26fb3ad21fa9 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,6 @@
 zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o zynqmp_kms.o
 obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
+xlnx-tpg-objs := xlnx_tpg.o
+xlnx-tpg-$(CONFIG_DRM_XLNX_BRIDGE_VTC) += xlnx_vtc_list.o
+obj-$(CONFIG_DRM_XLNX_TPG) += xlnx-tpg.o
+obj-$(CONFIG_DRM_XLNX_BRIDGE_VTC) += xlnx_vtc.o
diff --git a/drivers/gpu/drm/xlnx/xlnx_tpg.c b/drivers/gpu/drm/xlnx/xlnx_tpg.c
new file mode 100644
index 000000000000..3056bf278414
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_tpg.c
@@ -0,0 +1,846 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx logicore test pattern generator driver
+ *
+ * Copyright (C) 2024 Advanced Micro Devices, Inc.
+ *
+ * Author: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
+ *
+ * This driver introduces support for the test CRTC based on AMD/Xilinx
+ * Test Pattern Generator IP. The main goal of the driver is to enable
+ * simplistic FPGA design that could be used to test FPGA CRTC to external
+ * encoder IP connectivity.
+ * Reference: https://docs.xilinx.com/r/en-US/pg103-v-tpg
+ */
+
+#include "xlnx_vtc.h"
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <linux/media-bus-format.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+#include <linux/component.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <video/videomode.h>
+
+#define DRIVER_NAME	"xlnx-tpg"
+#define DRIVER_DESC	"Xilinx TPG DRM KMS Driver"
+#define DRIVER_DATE	"20240307"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+#define XLNX_TPG_CONTROL		0x0000
+#define XLNX_TPG_GLOBAL_IRQ_EN		0x0004
+#define XLNX_TPG_IP_IRQ_EN		0x0008
+#define XLNX_TPG_IP_IRQ_STATUS		0x000C
+#define XLNX_TPG_ACTIVE_HEIGHT		0x0010
+#define XLNX_TPG_ACTIVE_WIDTH		0x0018
+#define XLNX_TPG_PATTERN_ID		0x0020
+#define XLNX_TPG_COLOR_FORMAT		0x0040
+
+#define XLNX_TPG_IP_IRQ_AP_DONE		BIT(0)
+
+#define XLNX_TPG_START			BIT(0)
+#define XLNX_TPG_AUTO_RESTART		BIT(7)
+
+enum xlnx_tpg_pattern {
+	XTPG_PAT_HORIZONTAL_RAMP = 0x1,
+	XTPG_PAT_VERTICAL_RAMP,
+	XTPG_PAT_TEMPORAL_RAMP,
+	XTPG_PAT_SOLID_RED,
+	XTPG_PAT_SOLID_GREEN,
+	XTPG_PAT_SOLID_BLUE,
+	XTPG_PAT_SOLID_BLACK,
+	XTPG_PAT_SOLID_WHITE,
+	XTPG_PAT_COLOR_BARS,
+	XTPG_PAT_ZONE_PLATE,
+	XTPG_PAT_TARTAN_COLOR_BARS,
+	XTPG_PAT_CROSS_HATCH,
+	XTPG_PAT_COLOR_SWEEP,
+	XTPG_PAT_COMBO_RAMP,
+	XTPG_PAT_CHECKER_BOARD,
+	XTPG_PAT_DP_COLOR_RAMP,
+	XTPG_PAT_DP_VERTICAL_LINES,
+	XTPG_PAT_DP_COLOR_SQUARE,
+};
+
+static const struct drm_prop_enum_list xtpg_pattern_list[] = {
+	{ XTPG_PAT_HORIZONTAL_RAMP, "horizontal-ramp" },
+	{ XTPG_PAT_VERTICAL_RAMP, "vertical-ramp" },
+	{ XTPG_PAT_TEMPORAL_RAMP, "temporal-ramp" },
+	{ XTPG_PAT_SOLID_RED, "red" },
+	{ XTPG_PAT_SOLID_GREEN, "green" },
+	{ XTPG_PAT_SOLID_BLUE, "blue" },
+	{ XTPG_PAT_SOLID_BLACK, "black" },
+	{ XTPG_PAT_SOLID_WHITE, "white" },
+	{ XTPG_PAT_COLOR_BARS, "color-bars" },
+	{ XTPG_PAT_ZONE_PLATE, "zone-plate" },
+	{ XTPG_PAT_TARTAN_COLOR_BARS, "tartan-color-bars" },
+	{ XTPG_PAT_CROSS_HATCH, "cross-hatch" },
+	{ XTPG_PAT_COLOR_SWEEP, "color-sweep" },
+	{ XTPG_PAT_COMBO_RAMP, "combo-ramp" },
+	{ XTPG_PAT_CHECKER_BOARD, "checker-board" },
+	{ XTPG_PAT_DP_COLOR_RAMP, "dp-color-ramp" },
+	{ XTPG_PAT_DP_VERTICAL_LINES, "dp-vertical-lines" },
+	{ XTPG_PAT_DP_COLOR_SQUARE, "dp-color-square" },
+};
+
+enum xlnx_tpg_format {
+	XTPG_FMT_RGB = 0x0,
+	XTPG_FMT_YUV_444,
+	XTPG_FMT_YUV_422,
+	XTPG_FMT_YUV_420,
+	XTPG_FMT_INVALID,
+};
+
+struct xlnx_tpg;
+
+/**
+ * struct xlnx_tpg_drm - TPG CRTC DRM/KMS data
+ * @tpg: Back pointer to parent TPG
+ * @dev: DRM device
+ * @crtc: DRM CRTC
+ * @plane: DRM primary plane
+ * @encoder: DRM encoder
+ * @connector: DRM connector
+ * @pattern_prop: DRM property representing TPG video pattern
+ * @event: Pending DRM VBLANK event
+ */
+struct xlnx_tpg_drm {
+	struct xlnx_tpg *tpg;
+	struct drm_device dev;
+	struct drm_crtc crtc;
+	struct drm_plane plane;
+	struct drm_encoder encoder;
+	struct drm_connector *connector;
+	struct drm_property *pattern_prop;
+	struct drm_pending_vblank_event *event;
+};
+
+/**
+ * struct xlnx_tpg_drm - Test Pattern Generator data
+ * @pdev: Platform device
+ * @drm: TPG DRM data
+ * @vtc: Video timing controller interface
+ * @disp_bridge: DRM display bridge
+ * @regs: Mapped TPG IP register space
+ * @irq: TPG IRQ
+ * @output_bus_format: Chosen TPG output bus format
+ * @color_format: TPG color format
+ */
+struct xlnx_tpg {
+	struct platform_device *pdev;
+	struct xlnx_tpg_drm *drm;
+	struct xlnx_vtc_iface *vtc;
+	struct drm_bridge *disp_bridge;
+	void __iomem *regs;
+	int irq;
+	u32 output_bus_format;
+	enum xlnx_tpg_format color_format;
+};
+
+static inline struct xlnx_tpg *crtc_to_tpg(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct xlnx_tpg_drm, crtc)->tpg;
+}
+
+static inline struct xlnx_tpg *plane_to_tpg(struct drm_plane *plane)
+{
+	return container_of(plane, struct xlnx_tpg_drm, plane)->tpg;
+}
+
+static inline struct xlnx_tpg *encoder_to_tpg(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct xlnx_tpg_drm, encoder)->tpg;
+}
+
+struct xlnx_tpg_format_map {
+	u32 bus_format;
+	enum xlnx_tpg_format color_format;
+};
+
+/**
+ * xlnx_tpg_bus_to_color_format - Map media bus format to TPG color format
+ * @bus_format: Media bus format
+ *
+ * Return: TPG color format that matches @bus_format or XTPG_FMT_INVALID if
+ * input media bus format is not supported
+ */
+static enum xlnx_tpg_format xlnx_tpg_bus_to_color_format(u32 bus_format)
+{
+	static const struct xlnx_tpg_format_map format_map[] = {
+		{
+			.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+			.color_format = XTPG_FMT_RGB,
+		}, {
+			.bus_format = MEDIA_BUS_FMT_RBG888_1X24,
+			.color_format = XTPG_FMT_RGB,
+		}, {
+			.bus_format = MEDIA_BUS_FMT_UYVY8_1X16,
+			.color_format = XTPG_FMT_YUV_422,
+		}, {
+			.bus_format = MEDIA_BUS_FMT_VUY8_1X24,
+			.color_format = XTPG_FMT_YUV_444,
+		}, {
+			.bus_format = MEDIA_BUS_FMT_UYVY10_1X20,
+			.color_format = XTPG_FMT_YUV_422,
+		},
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(format_map); ++i)
+		if (format_map[i].bus_format == bus_format)
+			return format_map[i].color_format;
+
+	return XTPG_FMT_INVALID;
+}
+
+/* -----------------------------------------------------------------------------
+ * TPG IP ops
+ */
+
+static void xlnx_tpg_write(struct xlnx_tpg *tpg, int offset, u32 val)
+{
+	writel(val, tpg->regs + offset);
+}
+
+static u32 xlnx_tpg_read(struct xlnx_tpg *tpg, int offset)
+{
+	return readl(tpg->regs + offset);
+}
+
+/**
+ * xlnx_tpg_set_dimensions - Set TPG output signal dimensions
+ * @tpg: The TPG
+ * @w: Output video frame width
+ * @h: Output video frame height
+ */
+static void xlnx_tpg_set_dimensions(struct xlnx_tpg *tpg, u16 w, u16 h)
+{
+	xlnx_tpg_write(tpg, XLNX_TPG_ACTIVE_WIDTH, w);
+	xlnx_tpg_write(tpg, XLNX_TPG_ACTIVE_HEIGHT, h);
+}
+
+/**
+ * xlnx_tpg_set_pattern - Set TPG output video pattern
+ * @tpg: The TPG
+ * @pattern: The pattern
+ */
+static void xlnx_tpg_set_pattern(struct xlnx_tpg *tpg,  enum xlnx_tpg_pattern pattern)
+{
+	xlnx_tpg_write(tpg, XLNX_TPG_PATTERN_ID, pattern);
+}
+
+/**
+ * xlnx_tpg_get_pattern - Get programmed TPG output video pattern
+ * @tpg: The TPG
+ *
+ * Return: Video signal pattern programmed
+ */
+static enum xlnx_tpg_pattern xlnx_tpg_get_pattern(struct xlnx_tpg *tpg)
+{
+	return xlnx_tpg_read(tpg, XLNX_TPG_PATTERN_ID);
+}
+
+/**
+ * xlnx_tpg_set_format - Set TPG output video color format
+ * @tpg: The TPG
+ * @format: Color format to program
+ */
+static void xlnx_tpg_set_format(struct xlnx_tpg *tpg,  enum xlnx_tpg_format format)
+{
+	xlnx_tpg_write(tpg, XLNX_TPG_COLOR_FORMAT, format);
+}
+
+/**
+ * xlnx_tpg_start - Start generation of the video signal
+ * @tpg: The TPG
+ */
+static void xlnx_tpg_start(struct xlnx_tpg *tpg)
+{
+	xlnx_tpg_write(tpg, XLNX_TPG_CONTROL, XLNX_TPG_START | XLNX_TPG_AUTO_RESTART);
+}
+
+/**
+ * xlnx_tpg_enable_irq - Enable generation of the frame done interrupts
+ * @tpg: The TPG
+ */
+static void xlnx_tpg_enable_irq(struct xlnx_tpg *tpg)
+{
+	xlnx_tpg_write(tpg, XLNX_TPG_GLOBAL_IRQ_EN, 1);
+	xlnx_tpg_write(tpg, XLNX_TPG_IP_IRQ_EN, 1);
+}
+
+/**
+ * xlnx_tpg_disable_irq - Disable generation of the frame done interrupts
+ * @tpg: The TPG
+ */
+static void xlnx_tpg_disable_irq(struct xlnx_tpg *tpg)
+{
+	xlnx_tpg_write(tpg, XLNX_TPG_GLOBAL_IRQ_EN, 0);
+	xlnx_tpg_write(tpg, XLNX_TPG_IP_IRQ_EN, 0);
+}
+
+static irqreturn_t xlnx_tpg_irq_handler(int irq, void *data)
+{
+	struct xlnx_tpg *tpg = data;
+	struct drm_crtc *crtc = &tpg->drm->crtc;
+	struct drm_pending_vblank_event *event;
+	unsigned long flags;
+	u32 status = xlnx_tpg_read(tpg, XLNX_TPG_IP_IRQ_STATUS);
+
+	xlnx_tpg_write(tpg, XLNX_TPG_IP_IRQ_STATUS, status);
+
+	status &= XLNX_TPG_IP_IRQ_AP_DONE;
+	if (!status)
+		return IRQ_NONE;
+
+	drm_crtc_handle_vblank(crtc);
+
+	/* Finish page flip */
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	event = tpg->drm->event;
+	tpg->drm->event = NULL;
+	if (event) {
+		drm_crtc_send_vblank_event(crtc, event);
+		drm_crtc_vblank_put(crtc);
+	}
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * xlnx_tpg_setup_irq - Setup TPG interrupt
+ * @tpg: The TPG
+ *
+ * Return: 0 on success or error code
+ */
+static int xlnx_tpg_setup_irq(struct xlnx_tpg *tpg)
+{
+	struct device_node *node = tpg->pdev->dev.of_node;
+	int ret;
+
+	tpg->irq = irq_of_parse_and_map(node, 0);
+	if (!tpg->irq) {
+		dev_err(&tpg->pdev->dev, "failed to parse irq\n");
+		return -EINVAL;
+	}
+
+	ret = devm_request_irq(&tpg->pdev->dev, tpg->irq, xlnx_tpg_irq_handler,
+			       IRQF_SHARED, "xlnx-tpg", tpg);
+	if (ret < 0) {
+		dev_err(&tpg->pdev->dev, "failed to request irq\n");
+		return ret;
+	}
+
+	xlnx_tpg_enable_irq(tpg);
+
+	return 0;
+}
+
+/**
+ * xlnx_tpg_map_resources - Map TPG register space
+ * @tpg: The TPG
+ *
+ * Return: 0 on success or error code
+ */
+static int xlnx_tpg_map_resources(struct xlnx_tpg *tpg)
+{
+	struct device_node *node = tpg->pdev->dev.of_node;
+	struct resource	res;
+	int ret;
+
+	ret = of_address_to_resource(node, 0, &res);
+	if (ret < 0) {
+		dev_err(&tpg->pdev->dev, "failed to parse resource\n");
+		return ret;
+	}
+
+	tpg->regs = devm_ioremap_resource(&tpg->pdev->dev, &res);
+	if (IS_ERR(tpg->regs)) {
+		ret = PTR_ERR(tpg->regs);
+		dev_err(&tpg->pdev->dev, "failed to map register space\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM plane
+ */
+
+static void xlnx_tpg_plane_atomic_update(struct drm_plane *plane,
+					 struct drm_atomic_state *state)
+{
+	struct xlnx_tpg *tpg = plane_to_tpg(plane);
+	struct drm_crtc *crtc = &tpg->drm->crtc;
+
+	drm_crtc_vblank_on(crtc);
+	if (crtc->state->event) {
+		/* Consume the flip_done event from atomic helper */
+		crtc->state->event->pipe = drm_crtc_index(crtc);
+		drm_crtc_vblank_get(crtc);
+		tpg->drm->event = crtc->state->event;
+		crtc->state->event = NULL;
+	}
+}
+
+static int xlnx_tpg_plane_atomic_check(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct xlnx_tpg *tpg = plane_to_tpg(plane);
+	struct drm_crtc_state *crtc_state;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, &tpg->drm->crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs xlnx_tpg_plane_helper_funcs = {
+	.prepare_fb = drm_gem_plane_helper_prepare_fb,
+	.atomic_check = xlnx_tpg_plane_atomic_check,
+	.atomic_update = xlnx_tpg_plane_atomic_update,
+};
+
+static bool xlnx_tpg_format_mod_supported(struct drm_plane *plane,
+					  uint32_t format,
+					  uint64_t modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
+static int xlnx_tpg_plane_set_property(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				       struct drm_property *property,
+				       u64 val)
+{
+	struct xlnx_tpg *tpg = plane_to_tpg(plane);
+
+	if (property == tpg->drm->pattern_prop)
+		xlnx_tpg_set_pattern(tpg, val);
+	else
+		return -EINVAL;
+	return 0;
+}
+
+static int xlnx_tpg_plane_get_property(struct drm_plane *plane,
+				       const struct drm_plane_state *state,
+				       struct drm_property *property,
+				       uint64_t *val)
+{
+	struct xlnx_tpg *tpg = plane_to_tpg(plane);
+
+	if (property == tpg->drm->pattern_prop)
+		*val = xlnx_tpg_get_pattern(tpg);
+	else
+		return -EINVAL;
+	return 0;
+}
+
+static const struct drm_plane_funcs xlnx_tpg_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported   = xlnx_tpg_format_mod_supported,
+	.atomic_set_property	= xlnx_tpg_plane_set_property,
+	.atomic_get_property	= xlnx_tpg_plane_get_property,
+};
+
+/**
+ * xlnx_tpg_create_properties - Create TPG DRM properties
+ * @tpg: The TPG
+ */
+static void xlnx_tpg_create_properties(struct xlnx_tpg *tpg)
+{
+	struct drm_device *drm = &tpg->drm->dev;
+	struct drm_mode_object *obj = &tpg->drm->plane.base;
+
+	tpg->drm->pattern_prop = drm_property_create_enum(drm, 0, "pattern", xtpg_pattern_list,
+							  ARRAY_SIZE(xtpg_pattern_list));
+	drm_object_attach_property(obj, tpg->drm->pattern_prop, XTPG_PAT_COLOR_BARS);
+	xlnx_tpg_set_pattern(tpg, XTPG_PAT_COLOR_BARS);
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM CRTC
+ */
+
+static enum drm_mode_status xlnx_tpg_crtc_mode_valid(struct drm_crtc *crtc,
+						     const struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static int xlnx_tpg_crtc_check(struct drm_crtc *crtc,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static void xlnx_tpg_crtc_enable(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct videomode vm;
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	struct xlnx_tpg *tpg = crtc_to_tpg(crtc);
+
+	if (tpg->vtc) {
+		drm_display_mode_to_videomode(mode, &vm);
+		xlnx_vtc_iface_set_timing(tpg->vtc, &vm);
+		xlnx_vtc_iface_enable(tpg->vtc);
+	}
+
+	xlnx_tpg_set_dimensions(tpg, mode->hdisplay, mode->vdisplay);
+
+	xlnx_tpg_set_format(tpg, tpg->color_format);
+	xlnx_tpg_start(tpg);
+}
+
+static void xlnx_tpg_crtc_disable(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
+{
+	struct xlnx_tpg *tpg = crtc_to_tpg(crtc);
+
+	if (tpg->vtc)
+		xlnx_vtc_iface_disable(tpg->vtc);
+	if (crtc->state->event) {
+		complete_all(crtc->state->event->base.completion);
+		crtc->state->event = NULL;
+	}
+	drm_crtc_vblank_off(crtc);
+}
+
+static u32 xlnx_tpg_crtc_select_output_bus_format(struct drm_crtc *crtc,
+						  struct drm_crtc_state *crtc_state,
+						  const u32 *in_bus_fmts,
+						  unsigned int num_in_bus_fmts)
+{
+	struct xlnx_tpg *tpg = crtc_to_tpg(crtc);
+	unsigned int i;
+
+	for (i = 0; i < num_in_bus_fmts; ++i)
+		if (in_bus_fmts[i] == tpg->output_bus_format)
+			return tpg->output_bus_format;
+
+	return 0;
+}
+
+static const struct drm_crtc_helper_funcs xlnx_tpg_crtc_helper_funcs = {
+	.mode_valid = xlnx_tpg_crtc_mode_valid,
+	.atomic_check = xlnx_tpg_crtc_check,
+	.atomic_enable = xlnx_tpg_crtc_enable,
+	.atomic_disable = xlnx_tpg_crtc_disable,
+	.select_output_bus_format = xlnx_tpg_crtc_select_output_bus_format,
+};
+
+static int xlnx_tpg_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct xlnx_tpg *tpg = crtc_to_tpg(crtc);
+
+	xlnx_tpg_enable_irq(tpg);
+
+	return 0;
+}
+
+static void xlnx_tpg_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct xlnx_tpg *tpg = crtc_to_tpg(crtc);
+
+	xlnx_tpg_disable_irq(tpg);
+}
+
+static const struct drm_crtc_funcs xlnx_tpg_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank = xlnx_tpg_crtc_enable_vblank,
+	.disable_vblank = xlnx_tpg_crtc_disable_vblank,
+};
+
+/* -----------------------------------------------------------------------------
+ * Setup & Init
+ */
+
+/**
+ * xlnx_tpg_pipeline_init - Initialize DRM pipeline
+ * @drm: DRM device
+ *
+ * Create and link CRTC, plane, and encoder. Attach external DRM bridge.
+ *
+ * Return: 0 on success, or a negative error code otherwise
+ */
+static int xlnx_tpg_pipeline_init(struct drm_device *drm)
+{
+	static const uint32_t xlnx_tpg_formats[] = {
+		DRM_FORMAT_XRGB8888,
+	};
+	static const uint64_t xlnx_tpg_modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID,
+	};
+
+	struct xlnx_tpg *tpg = dev_get_drvdata(drm->dev);
+	struct drm_connector *connector;
+	struct drm_encoder *encoder = &tpg->drm->encoder;
+	struct drm_plane *plane = &tpg->drm->plane;
+	struct drm_crtc *crtc = &tpg->drm->crtc;
+	int ret;
+
+	ret = xlnx_tpg_map_resources(tpg);
+	if (ret < 0)
+		return ret;
+
+	ret = xlnx_tpg_setup_irq(tpg);
+	if (ret < 0)
+		return ret;
+
+	drm_plane_helper_add(plane, &xlnx_tpg_plane_helper_funcs);
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &xlnx_tpg_plane_funcs,
+				       xlnx_tpg_formats,
+				       ARRAY_SIZE(xlnx_tpg_formats),
+				       xlnx_tpg_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		dev_err(drm->dev, "failed to init plane: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &xlnx_tpg_crtc_helper_funcs);
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&xlnx_tpg_crtc_funcs, NULL);
+	if (ret) {
+		dev_err(drm->dev, "failed to init crtc: %d\n", ret);
+		return ret;
+	}
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	if (ret) {
+		dev_err(drm->dev, "failed to init encoder: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_bridge_attach(encoder, tpg->disp_bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0) {
+		dev_err(drm->dev, "failed to attach bridge to encoder: %d\n", ret);
+		return ret;
+	}
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(drm->dev, "failed to init connector: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		dev_err(drm->dev, "failed to attach encoder: %d\n", ret);
+		return ret;
+	}
+
+	xlnx_tpg_create_properties(tpg);
+
+	return 0;
+}
+
+static const struct drm_mode_config_funcs xlnx_tpg_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(xlnx_tpg_gem_dma_fops);
+static struct drm_driver xlnx_tpg_drm_driver = {
+	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
+					  DRIVER_ATOMIC,
+	.fops				= &xlnx_tpg_gem_dma_fops,
+	.name				= DRIVER_NAME,
+	.desc				= DRIVER_DESC,
+	.date				= DRIVER_DATE,
+	.major				= DRIVER_MAJOR,
+	.minor				= DRIVER_MINOR,
+	DRM_GEM_DMA_DRIVER_OPS,
+};
+
+/**
+ * xlnx_tpg_drm_init - Initialize DRM device
+ * @dev: The device
+ *
+ * Allocate and initialize DRM device. Configure mode config and initialize
+ * TPG DRM pipeline.
+ *
+ * Return: 0 on success, or a negative error code otherwise
+ */
+static int xlnx_tpg_drm_init(struct device *dev)
+{
+	struct xlnx_tpg *tpg = dev_get_drvdata(dev);
+	struct drm_device *drm;
+	int ret;
+
+	tpg->drm = devm_drm_dev_alloc(dev, &xlnx_tpg_drm_driver,
+				      struct xlnx_tpg_drm, dev);
+	if (IS_ERR(tpg->drm))
+		return PTR_ERR(tpg->drm);
+	tpg->drm->tpg = tpg;
+	drm = &tpg->drm->dev;
+
+	ret = drm_mode_config_init(drm);
+	if (ret < 0)
+		return ret;
+
+	tpg->drm->dev.mode_config.funcs = &xlnx_tpg_mode_config_funcs;
+	tpg->drm->dev.mode_config.min_width = 0;
+	tpg->drm->dev.mode_config.min_height = 0;
+	tpg->drm->dev.mode_config.max_width = 4096;
+	tpg->drm->dev.mode_config.max_height = 4096;
+
+	ret = drm_vblank_init(drm, 1);
+	if (ret < 0)
+		return ret;
+
+	drm_kms_helper_poll_init(drm);
+
+	ret = xlnx_tpg_pipeline_init(drm);
+	if (ret < 0)
+		goto err_poll_fini;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret < 0)
+		goto err_poll_fini;
+
+	return ret;
+
+err_poll_fini:
+	drm_kms_helper_poll_fini(drm);
+
+	return ret;
+}
+
+/**
+ * xlnx_tpg_drm_fini - Finilize DRM device
+ * @dev: The device
+ */
+static void xlnx_tpg_drm_fini(struct device *dev)
+{
+	struct xlnx_tpg *tpg = dev_get_drvdata(dev);
+
+	drm_kms_helper_poll_fini(&tpg->drm->dev);
+}
+
+static int xlnx_tpg_probe(struct platform_device *pdev)
+{
+	struct xlnx_tpg *tpg;
+	struct device_node *node, *vtc_node;
+	int ret;
+
+	tpg = devm_kzalloc(&pdev->dev, sizeof(*tpg), GFP_KERNEL);
+	if (!tpg)
+		return -ENOMEM;
+
+	tpg->pdev = pdev;
+	platform_set_drvdata(pdev, tpg);
+	node = pdev->dev.of_node;
+
+	tpg->disp_bridge = devm_drm_of_get_bridge(&pdev->dev, node, 0, 0);
+	if (IS_ERR(tpg->disp_bridge)) {
+		ret = PTR_ERR(tpg->disp_bridge);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to discover display bridge\n");
+		return ret;
+	}
+
+	if (of_property_read_u32(node, "bus-format", &tpg->output_bus_format)) {
+		dev_err(&pdev->dev, "required bus-format property undefined\n");
+		return -EINVAL;
+	}
+	tpg->color_format = xlnx_tpg_bus_to_color_format(tpg->output_bus_format);
+
+	vtc_node = of_parse_phandle(node, "xlnx,bridge", 0);
+	if (!vtc_node) {
+		dev_err(&pdev->dev, "required vtc node is missing\n");
+		return -EINVAL;
+	}
+	ret = xlnx_of_find_vtc(vtc_node, &tpg->vtc);
+	if (ret < 0)
+		return ret;
+
+	ret = xlnx_tpg_drm_init(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	dev_info(&pdev->dev, "xlnx-tpg driver probed\n");
+
+	return 0;
+}
+
+static int xlnx_tpg_remove(struct platform_device *pdev)
+{
+	xlnx_tpg_drm_fini(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id xlnx_tpg_of_match[] = {
+	{ .compatible = "xlnx,v-tpg-8.2", },
+	{ .compatible = "xlnx,v-tpg-8.0", },
+	{ /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, xlnx_tpg_of_match);
+
+static struct platform_driver xlnx_tpg_driver = {
+	.probe			= xlnx_tpg_probe,
+	.remove			= xlnx_tpg_remove,
+	.driver			= {
+		.name		= "xlnx-tpg",
+		.of_match_table	= xlnx_tpg_of_match,
+	},
+};
+
+module_platform_driver(xlnx_tpg_driver);
+
+MODULE_AUTHOR("Anatoliy Klymenko");
+MODULE_DESCRIPTION("Xilinx TPG CRTC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/xlnx/xlnx_vtc.c b/drivers/gpu/drm/xlnx/xlnx_vtc.c
new file mode 100644
index 000000000000..351b736706d1
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_vtc.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Video Timing Controller support for Xilinx DRM KMS
+ *
+ * Copyright (C) 2013 - 2024 Advanced Micro Devices, Inc.
+ *
+ * Author: Hyun Woo Kwon <hyunk@xilinx.com>
+ *	   Saurabh Sengar <saurabhs@xilinx.com>
+ *	   Vishal Sagar <vishal.sagar@xilinx.com>
+ *	   Anatoliy Klymenko <anatoliy.klymenko@amd.com>
+ *
+ * This driver adds support to control the Xilinx Video Timing
+ * Controller connected to the CRTC.
+ */
+
+#include "xlnx_vtc.h"
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <video/videomode.h>
+
+/* register offsets */
+#define XVTC_CTL		0x000
+#define XVTC_VER		0x010
+#define XVTC_GASIZE		0x060
+#define XVTC_GENC		0x068
+#define XVTC_GPOL		0x06c
+#define XVTC_GHSIZE		0x070
+#define XVTC_GVSIZE		0x074
+#define XVTC_GHSYNC		0x078
+#define XVTC_GVBHOFF_F0		0x07c
+#define XVTC_GVSYNC_F0		0x080
+#define XVTC_GVSHOFF_F0		0x084
+#define XVTC_GVBHOFF_F1		0x088
+#define XVTC_GVSYNC_F1		0x08C
+#define XVTC_GVSHOFF_F1		0x090
+#define XVTC_GASIZE_F1		0x094
+
+/* vtc control register bits */
+#define XVTC_CTL_SWRESET	BIT(31)
+#define XVTC_CTL_FIPSS		BIT(26)
+#define XVTC_CTL_ACPSS		BIT(25)
+#define XVTC_CTL_AVPSS		BIT(24)
+#define XVTC_CTL_HSPSS		BIT(23)
+#define XVTC_CTL_VSPSS		BIT(22)
+#define XVTC_CTL_HBPSS		BIT(21)
+#define XVTC_CTL_VBPSS		BIT(20)
+#define XVTC_CTL_VCSS		BIT(18)
+#define XVTC_CTL_VASS		BIT(17)
+#define XVTC_CTL_VBSS		BIT(16)
+#define XVTC_CTL_VSSS		BIT(15)
+#define XVTC_CTL_VFSS		BIT(14)
+#define XVTC_CTL_VTSS		BIT(13)
+#define XVTC_CTL_HBSS		BIT(11)
+#define XVTC_CTL_HSSS		BIT(10)
+#define XVTC_CTL_HFSS		BIT(9)
+#define XVTC_CTL_HTSS		BIT(8)
+#define XVTC_CTL_GE		BIT(2)
+#define XVTC_CTL_RU		BIT(1)
+
+/* vtc generator polarity register bits */
+#define XVTC_GPOL_FIP		BIT(6)
+#define XVTC_GPOL_ACP		BIT(5)
+#define XVTC_GPOL_AVP		BIT(4)
+#define XVTC_GPOL_HSP		BIT(3)
+#define XVTC_GPOL_VSP		BIT(2)
+#define XVTC_GPOL_HBP		BIT(1)
+#define XVTC_GPOL_VBP		BIT(0)
+
+/* vtc generator horizontal 1 */
+#define XVTC_GH1_BPSTART_MASK	GENMASK(28, 16)
+#define XVTC_GH1_BPSTART_SHIFT	16
+#define XVTC_GH1_SYNCSTART_MASK GENMASK(12, 0)
+/* vtc generator vertical 1 (field 0) */
+#define XVTC_GV1_BPSTART_MASK	GENMASK(28, 16)
+#define XVTC_GV1_BPSTART_SHIFT	16
+#define XVTC_GV1_SYNCSTART_MASK	GENMASK(12, 0)
+/* vtc generator/detector vblank/vsync horizontal offset registers */
+#define XVTC_XVXHOX_HEND_MASK	GENMASK(28, 16)
+#define XVTC_XVXHOX_HEND_SHIFT	16
+#define XVTC_XVXHOX_HSTART_MASK	GENMASK(12, 0)
+
+#define XVTC_GHFRAME_HSIZE	GENMASK(12, 0)
+#define XVTC_GVFRAME_HSIZE_F1	GENMASK(12, 0)
+#define XVTC_GA_ACTSIZE_MASK	GENMASK(12, 0)
+
+/* vtc generator encoding register bits */
+#define XVTC_GENC_INTERL	BIT(6)
+
+/**
+ * struct xlnx_vtc - Xilinx VTC object
+ *
+ * @list: vtc list entry
+ * @dev: device structure
+ * @base: base addr
+ * @ppc: pixels per clock
+ * @axi_clk: AXI Lite clock
+ * @vid_clk: Video clock
+ */
+struct xlnx_vtc {
+	struct xlnx_vtc_iface iface;
+	struct device *dev;
+	void __iomem *base;
+	u32 ppc;
+	struct clk *axi_clk;
+	struct clk *vid_clk;
+};
+
+#define iface_to_vtc(ptr) container_of(ptr, struct xlnx_vtc, iface)
+
+static inline void xlnx_vtc_writel(void __iomem *base, int offset, u32 val)
+{
+	writel(val, base + offset);
+}
+
+static inline u32 xlnx_vtc_readl(void __iomem *base, int offset)
+{
+	return readl(base + offset);
+}
+
+static void xlnx_vtc_reset(struct xlnx_vtc *vtc)
+{
+	u32 reg;
+
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, XVTC_CTL_SWRESET);
+
+	/* enable register update */
+	reg = xlnx_vtc_readl(vtc->base, XVTC_CTL);
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, reg | XVTC_CTL_RU);
+}
+
+/**
+ * xlnx_vtc_enable - Enable the VTC
+ * @vtc: xilinx vtc structure pointer
+ *
+ * Return:
+ * Zero on success.
+ *
+ * This function enables the VTC
+ */
+static int xlnx_vtc_enable(struct xlnx_vtc_iface *iface)
+{
+	u32 reg;
+	struct xlnx_vtc *vtc = iface_to_vtc(iface);
+
+	/* enable generator */
+	reg = xlnx_vtc_readl(vtc->base, XVTC_CTL);
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, reg | XVTC_CTL_GE);
+	dev_dbg(vtc->dev, "enabled\n");
+	return 0;
+}
+
+/**
+ * xlnx_vtc_disable - Disable the VTC
+ * @bridge: xilinx vtc structure pointer
+ *
+ * This function disables and resets the VTC.
+ */
+static void xlnx_vtc_disable(struct xlnx_vtc_iface *iface)
+{
+	u32 reg;
+	struct xlnx_vtc *vtc = iface_to_vtc(iface);
+
+	/* disable generator and reset */
+	reg = xlnx_vtc_readl(vtc->base, XVTC_CTL);
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, reg & ~XVTC_CTL_GE);
+	xlnx_vtc_reset(vtc);
+	dev_dbg(vtc->dev, "disabled\n");
+}
+
+/**
+ * xlnx_vtc_set_timing - Configures the VTC
+ * @vtc: xilinx vtc structure pointer
+ * @vm: video mode requested
+ *
+ * Return:
+ * Zero on success.
+ *
+ * This function calculates the timing values from the video mode
+ * structure passed from the CRTC and configures the VTC.
+ */
+static int xlnx_vtc_set_timing(struct xlnx_vtc_iface *iface,
+			       struct videomode *vm)
+{
+	int ret;
+	u32 reg;
+	u32 htotal, hactive, hsync_start, hbackporch_start;
+	u32 vtotal, vactive, vsync_start, vbackporch_start;
+	struct xlnx_vtc *vtc = iface_to_vtc(iface);
+
+	/* Make sure video clock is in sync with video timing */
+	ret = clk_set_rate(vtc->vid_clk, vm->pixelclock / vtc->ppc);
+	if (ret) {
+		dev_err(vtc->dev, "failed to set video clock rate: %d\n", ret);
+		return ret;
+	}
+
+	reg = xlnx_vtc_readl(vtc->base, XVTC_CTL);
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, reg & ~XVTC_CTL_RU);
+
+	vm->hactive /= vtc->ppc;
+	vm->hfront_porch /= vtc->ppc;
+	vm->hback_porch /= vtc->ppc;
+	vm->hsync_len /= vtc->ppc;
+
+	htotal = vm->hactive + vm->hfront_porch + vm->hsync_len +
+		 vm->hback_porch;
+	vtotal = vm->vactive + vm->vfront_porch + vm->vsync_len +
+		 vm->vback_porch;
+
+	hactive = vm->hactive;
+	vactive = vm->vactive;
+
+	hsync_start = vm->hactive + vm->hfront_porch;
+	vsync_start = vm->vactive + vm->vfront_porch;
+
+	hbackporch_start = hsync_start + vm->hsync_len;
+	vbackporch_start = vsync_start + vm->vsync_len;
+
+	dev_dbg(vtc->dev, "ha: %d, va: %d\n", hactive, vactive);
+	dev_dbg(vtc->dev, "ht: %d, vt: %d\n", htotal, vtotal);
+	dev_dbg(vtc->dev, "hs: %d, hb: %d\n", hsync_start, hbackporch_start);
+	dev_dbg(vtc->dev, "vs: %d, vb: %d\n", vsync_start, vbackporch_start);
+
+	reg = htotal & XVTC_GHFRAME_HSIZE;
+	xlnx_vtc_writel(vtc->base, XVTC_GHSIZE, reg);
+
+	reg = vtotal & XVTC_GVFRAME_HSIZE_F1;
+	reg |= reg << XVTC_GV1_BPSTART_SHIFT;
+	xlnx_vtc_writel(vtc->base, XVTC_GVSIZE, reg);
+
+	reg = hactive & XVTC_GA_ACTSIZE_MASK;
+	reg |= (vactive & XVTC_GA_ACTSIZE_MASK) << 16;
+	xlnx_vtc_writel(vtc->base, XVTC_GASIZE, reg);
+
+	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
+		xlnx_vtc_writel(vtc->base, XVTC_GASIZE_F1, reg);
+
+	reg = hsync_start & XVTC_GH1_SYNCSTART_MASK;
+	reg |= (hbackporch_start << XVTC_GH1_BPSTART_SHIFT) &
+	       XVTC_GH1_BPSTART_MASK;
+	xlnx_vtc_writel(vtc->base, XVTC_GHSYNC, reg);
+
+	reg = vsync_start & XVTC_GV1_SYNCSTART_MASK;
+	reg |= (vbackporch_start << XVTC_GV1_BPSTART_SHIFT) &
+	       XVTC_GV1_BPSTART_MASK;
+	xlnx_vtc_writel(vtc->base, XVTC_GVSYNC_F0, reg);
+
+	if (vm->flags & DISPLAY_FLAGS_INTERLACED) {
+		xlnx_vtc_writel(vtc->base, XVTC_GVSYNC_F1, reg);
+		reg = xlnx_vtc_readl(vtc->base, XVTC_GENC) | XVTC_GENC_INTERL;
+		xlnx_vtc_writel(vtc->base, XVTC_GENC, reg);
+	} else {
+		reg = xlnx_vtc_readl(vtc->base, XVTC_GENC) & ~XVTC_GENC_INTERL;
+		xlnx_vtc_writel(vtc->base, XVTC_GENC, reg);
+	}
+
+	/* configure horizontal offset */
+	/* Calculate and update Generator VBlank Hori field 0 */
+	reg = hactive & XVTC_XVXHOX_HSTART_MASK;
+	reg |= (hactive << XVTC_XVXHOX_HEND_SHIFT) &
+		XVTC_XVXHOX_HEND_MASK;
+	xlnx_vtc_writel(vtc->base, XVTC_GVBHOFF_F0, reg);
+
+	/* Calculate and update Generator VSync Hori field 0 */
+	reg = hsync_start & XVTC_XVXHOX_HSTART_MASK;
+	reg |= (hsync_start << XVTC_XVXHOX_HEND_SHIFT) &
+		XVTC_XVXHOX_HEND_MASK;
+	xlnx_vtc_writel(vtc->base, XVTC_GVSHOFF_F0, reg);
+
+	/* Calculate and update Generator VBlank Hori field 1 */
+	if (vm->flags & DISPLAY_FLAGS_INTERLACED) {
+		reg = hactive & XVTC_XVXHOX_HSTART_MASK;
+		reg |= (hactive << XVTC_XVXHOX_HEND_SHIFT) &
+			XVTC_XVXHOX_HEND_MASK;
+		xlnx_vtc_writel(vtc->base, XVTC_GVBHOFF_F1, reg);
+	}
+
+	/* Calculate and update Generator VBlank Hori field 1 */
+	if (vm->flags & DISPLAY_FLAGS_INTERLACED) {
+		reg =  (hsync_start - (htotal / 2)) & XVTC_XVXHOX_HSTART_MASK;
+		reg |= ((hsync_start - (htotal / 2)) <<
+			XVTC_XVXHOX_HEND_SHIFT) & XVTC_XVXHOX_HEND_MASK;
+	} else {
+		reg =  hsync_start & XVTC_XVXHOX_HSTART_MASK;
+		reg |= (hsync_start << XVTC_XVXHOX_HEND_SHIFT) &
+			XVTC_XVXHOX_HEND_MASK;
+	}
+
+	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
+		xlnx_vtc_writel(vtc->base, XVTC_GVSHOFF_F1, reg);
+
+	/* configure polarity of signals */
+	reg = 0;
+	reg |= XVTC_GPOL_ACP;
+	reg |= XVTC_GPOL_AVP;
+	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
+		reg |= XVTC_GPOL_FIP;
+	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH) {
+		reg |= XVTC_GPOL_VBP;
+		reg |= XVTC_GPOL_VSP;
+	}
+	if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH) {
+		reg |= XVTC_GPOL_HBP;
+		reg |= XVTC_GPOL_HSP;
+	}
+	xlnx_vtc_writel(vtc->base, XVTC_GPOL, reg);
+
+	/* configure timing source */
+	reg = xlnx_vtc_readl(vtc->base, XVTC_CTL);
+	reg |= XVTC_CTL_VCSS;
+	reg |= XVTC_CTL_VASS;
+	reg |= XVTC_CTL_VBSS;
+	reg |= XVTC_CTL_VSSS;
+	reg |= XVTC_CTL_VFSS;
+	reg |= XVTC_CTL_VTSS;
+	reg |= XVTC_CTL_HBSS;
+	reg |= XVTC_CTL_HSSS;
+	reg |= XVTC_CTL_HFSS;
+	reg |= XVTC_CTL_HTSS;
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, reg);
+
+	reg = xlnx_vtc_readl(vtc->base, XVTC_CTL);
+	xlnx_vtc_writel(vtc->base, XVTC_CTL, reg | XVTC_CTL_RU);
+	dev_dbg(vtc->dev, "set timing done\n");
+
+	return 0;
+}
+
+static int xlnx_vtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct xlnx_vtc *vtc;
+	struct resource *res;
+	int ret;
+
+	vtc = devm_kzalloc(dev, sizeof(*vtc), GFP_KERNEL);
+	if (!vtc)
+		return -ENOMEM;
+
+	vtc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get resource for device\n");
+		return -EFAULT;
+	}
+
+	vtc->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(vtc->base)) {
+		dev_err(dev, "failed to remap io region\n");
+		return PTR_ERR(vtc->base);
+	}
+
+	platform_set_drvdata(pdev, vtc);
+
+	ret = of_property_read_u32(dev->of_node, "xlnx,pixels-per-clock",
+				   &vtc->ppc);
+	if (ret || (vtc->ppc != 1 && vtc->ppc != 2 && vtc->ppc != 4)) {
+		dev_err(dev, "failed to get ppc\n");
+		return ret;
+	}
+	dev_info(dev, "vtc ppc = %d\n", vtc->ppc);
+
+	vtc->axi_clk = devm_clk_get(vtc->dev, "s_axi_aclk");
+	if (IS_ERR(vtc->axi_clk)) {
+		ret = PTR_ERR(vtc->axi_clk);
+		dev_err(dev, "failed to get axi lite clk %d\n", ret);
+		return ret;
+	}
+
+	vtc->vid_clk = devm_clk_get(vtc->dev, "clk");
+	if (IS_ERR(vtc->vid_clk)) {
+		ret = PTR_ERR(vtc->vid_clk);
+		dev_err(dev, "failed to get video clk %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(vtc->axi_clk);
+	if (ret) {
+		dev_err(vtc->dev, "unable to enable axilite clk %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(vtc->vid_clk);
+	if (ret) {
+		dev_err(vtc->dev, "unable to enable video clk %d\n", ret);
+		goto err_axi_clk;
+	}
+
+	xlnx_vtc_reset(vtc);
+
+	vtc->iface.of_node = dev->of_node;
+	vtc->iface.enable = xlnx_vtc_enable;
+	vtc->iface.disable = xlnx_vtc_disable;
+	vtc->iface.set_timing = xlnx_vtc_set_timing;
+
+	xlnx_vtc_register(&vtc->iface);
+
+	dev_info(dev, "Xilinx VTC IP version : 0x%08x\n",
+		 xlnx_vtc_readl(vtc->base, XVTC_VER));
+	dev_info(dev, "Xilinx VTC DRM Bridge driver probed\n");
+	return 0;
+
+err_axi_clk:
+	clk_disable_unprepare(vtc->axi_clk);
+	return ret;
+}
+
+static int xlnx_vtc_remove(struct platform_device *pdev)
+{
+	struct xlnx_vtc *vtc = platform_get_drvdata(pdev);
+
+	xlnx_vtc_unregister(&vtc->iface);
+
+	clk_disable_unprepare(vtc->vid_clk);
+	clk_disable_unprepare(vtc->axi_clk);
+
+	return 0;
+}
+
+static const struct of_device_id xlnx_vtc_of_match[] = {
+	{ .compatible = "xlnx,bridge-v-tc-6.1" },
+	{ /* end of table */ },
+};
+
+MODULE_DEVICE_TABLE(of, xlnx_vtc_of_match);
+
+static struct platform_driver xlnx_vtc_bridge_driver = {
+	.probe = xlnx_vtc_probe,
+	.remove = xlnx_vtc_remove,
+	.driver = {
+		.name = "xlnx,bridge-vtc",
+		.of_match_table = xlnx_vtc_of_match,
+	},
+};
+
+module_init(xlnx_vtc_list_init);
+module_platform_driver(xlnx_vtc_bridge_driver);
+module_exit(xlnx_vtc_list_fini);
+
+MODULE_AUTHOR("Vishal Sagar");
+MODULE_DESCRIPTION("Xilinx VTC Bridge Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/xlnx/xlnx_vtc.h b/drivers/gpu/drm/xlnx/xlnx_vtc.h
new file mode 100644
index 000000000000..8abe01a5d943
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_vtc.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx DRM VTC header
+ *
+ *  Copyright (C) 2024 Advanced Micro Devices, Inc.
+ *
+ *  Author: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
+ */
+
+#ifndef _XLNX_VTC_H_
+#define _XLNX_VTC_H_
+
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/of.h>
+#include <linux/types.h>
+#include <video/videomode.h>
+
+/**
+ * struct xlnx_vtc_iface - Video Timing Controller interface
+ * @list: VTC list entry
+ * @of_node: Device tree node
+ * @enable: Enable VTC callback
+ * @disable: Disable VTC callback
+ * @set_timing: Program VTC timing callback
+ */
+struct xlnx_vtc_iface {
+	struct list_head list;
+	struct device_node *of_node;
+	int (*enable)(struct xlnx_vtc_iface *vtc);
+	void (*disable)(struct xlnx_vtc_iface *vtc);
+	int (*set_timing)(struct xlnx_vtc_iface *vtc, struct videomode *vm);
+};
+
+#if IS_ENABLED(CONFIG_DRM_XLNX_BRIDGE_VTC)
+
+int xlnx_vtc_iface_enable(struct xlnx_vtc_iface *vtc);
+void xlnx_vtc_iface_disable(struct xlnx_vtc_iface *vtc);
+int xlnx_vtc_iface_set_timing(struct xlnx_vtc_iface *vtc,
+			      struct videomode *vm);
+
+int xlnx_vtc_list_init(void) __init;
+void xlnx_vtc_list_fini(void) __exit;
+
+int xlnx_vtc_register(struct xlnx_vtc_iface *vtc);
+void xlnx_vtc_unregister(struct xlnx_vtc_iface *vtc);
+int xlnx_of_find_vtc(const struct device_node *np,
+		     struct xlnx_vtc_iface **vtc);
+
+#else /* CONFIG_DRM_XLNX_BRIDGE_VTC */
+
+static inline int xlnx_vtc_iface_enable(struct xlnx_vtc_iface *vtc)
+{
+	return vtc ? -ENODEV : 0;
+}
+
+static inline xlnx_vtc_iface_disable(struct xlnx_vtc_iface *vtc)
+{
+}
+
+static inline int xlnx_vtc_iface_set_timing(struct xlnx_vtc_iface *vtc,
+					    struct videomode *vm)
+{
+	return vtc ? -ENODEV : 0;
+}
+
+static inline int xlnx_of_find_vtc(const struct device_node *np,
+				   struct xlnx_vtc_iface **vtc)
+{
+	*vtc = NULL;
+	return -ENODEV;
+}
+
+static inline int xlnx_vtc_list_init(void)
+{
+	return 0;
+}
+
+static inline void xlnx_vtc_list_fini(void)
+{
+}
+
+static inline int xlnx_vtc_register(struct xlnx_vtc_iface *vtc)
+{
+	return 0;
+}
+
+static inline void xlnx_vtc_unregister(struct xlnx_vtc_iface *vtc)
+{
+}
+
+static inline int xlnx_of_find_vtc(const struct device_node *np,
+				   struct xlnx_vtc_iface **vtc)
+{
+	*vtc = NULL;
+	return -ENODEV;
+}
+
+#endif /* CONFIG_DRM_XLNX_BRIDGE_VTC */
+
+#endif /* _XLNX_VTC_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_vtc_list.c b/drivers/gpu/drm/xlnx/xlnx_vtc_list.c
new file mode 100644
index 000000000000..fe8d8447a18c
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_vtc_list.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Video Timing Controller List
+ *
+ * Copyright (C) 2024 Advanced Micro Devices, Inc.
+ *
+ * Author: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
+ */
+
+#include "xlnx_vtc.h"
+
+#include <linux/mutex.h>
+
+/**
+ * struct xlnx_vtc_list - List of registered Video Timing Controllers
+ * @head: Head of the list of registered VTC instances
+ * @lock: Mutex protecting the list
+ * @initialized: Initialization flag
+ */
+struct xlnx_vtc_list {
+	struct list_head head;
+	struct mutex lock;
+	bool initialized;
+};
+
+static struct xlnx_vtc_list vtc_list;
+
+/**
+ * xlnx_vtc_list_init - Initialize VTC list
+ *
+ * Return 0 on success, or error code otherwise
+ */
+int xlnx_vtc_list_init(void)
+{
+	if (!vtc_list.initialized) {
+		INIT_LIST_HEAD(&vtc_list.head);
+		mutex_init(&vtc_list.lock);
+		vtc_list.initialized = true;
+	}
+
+	return 0;
+}
+
+/**
+ * xlnx_vtc_list_fini - Deinitialize VTC list, free resources
+ */
+void xlnx_vtc_list_fini(void)
+{
+	if (vtc_list.initialized) {
+		mutex_destroy(&vtc_list.lock);
+		vtc_list.initialized = false;
+	}
+}
+
+/**
+ * xlnx_vtc_register - Register new VTC instance
+ * @vtc: Pointer to VTC interface instance to register
+ *
+ * Return 0 on success, or error code otherwise
+ */
+int xlnx_vtc_register(struct xlnx_vtc_iface *vtc)
+{
+	if (!vtc || !vtc->of_node)
+		return -EINVAL;
+
+	if (!vtc_list.initialized)
+		return -EFAULT;
+
+	mutex_lock(&vtc_list.lock);
+	list_add_tail(&vtc->list, &vtc_list.head);
+	mutex_unlock(&vtc_list.lock);
+
+	return 0;
+}
+
+/**
+ * xlnx_vtc_unregister - Register new VTC instance
+ * @vtc: The VTC interface instance
+ */
+void xlnx_vtc_unregister(struct xlnx_vtc_iface *vtc)
+{
+	if (!vtc || !vtc_list.initialized)
+		return;
+
+	mutex_lock(&vtc_list.lock);
+	list_del(&vtc->list);
+	mutex_unlock(&vtc_list.lock);
+}
+
+/**
+ * xlnx_of_find_vtc - Lookup VTC instance by OF node pointer
+ * @np: Pointer to VTC device node
+ * @vtc: Output vtc instance pointer
+ *
+ * Return 0 on success, or error code otherwise
+ */
+int xlnx_of_find_vtc(const struct device_node *np, struct xlnx_vtc_iface **vtc)
+{
+	struct xlnx_vtc_iface *vtc_pos;
+	int ret = -EPROBE_DEFER;
+
+	*vtc = NULL;
+
+	if (!vtc_list.initialized)
+		return ret;
+
+	mutex_lock(&vtc_list.lock);
+	list_for_each_entry(vtc_pos, &vtc_list.head, list) {
+		if (vtc_pos->of_node == np) {
+			*vtc = vtc_pos;
+			ret = 0;
+			break;
+		}
+	}
+	mutex_unlock(&vtc_list.lock);
+
+	return ret;
+}
+
+/**
+ * xlnx_vtc_iface_enable - Enable VTC
+ * @vtc: The VTC
+ *
+ * Return 0 on success, or error code otherwise
+ */
+int xlnx_vtc_iface_enable(struct xlnx_vtc_iface *vtc)
+{
+	if (!vtc || !vtc->enable)
+		return -EINVAL;
+
+	return vtc->enable(vtc);
+}
+
+/**
+ * xlnx_vtc_iface_disable - Disable VTC
+ * @vtc: The VTC
+ */
+void xlnx_vtc_iface_disable(struct xlnx_vtc_iface *vtc)
+{
+	if (!vtc || !vtc->disable)
+		return;
+
+	vtc->disable(vtc);
+}
+
+/**
+ * xlnx_vtc_iface_set_timing - Program VTC video timing
+ * @vtc: The VTC
+ * @vm: Video mode to program timing for
+ *
+ * Return 0 on success, or error code otherwise
+ */
+int xlnx_vtc_iface_set_timing(struct xlnx_vtc_iface *vtc,
+			      struct videomode *vm)
+{
+	if (!vtc || !vtc->set_timing)
+		return -EINVAL;
+
+	return vtc->set_timing(vtc, vm);
+}

-- 
2.25.1

