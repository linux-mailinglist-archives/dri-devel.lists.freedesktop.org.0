Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1C82C80E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FBC10EBB0;
	Fri, 12 Jan 2024 23:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908CB10EBAF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:42:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJ1SLptHso8gIVN3L1ngq/3WvIT0oAAK4wN7aS+NwPBD5To2J6BKgOuOoB9m9Br2X+AbxCFPNEU6JJfvUAzk3S7Rak1E3Qmr12pVRfptRlByHxynIVTDWC+PaGFt4IiwPQoTnBIExSKI9FRApuFZDfRPxIGajjM/VYztcB7jCtjErL0rwx+GecP1yol3yp103UHv9GYcJBZ8C+JIAWNLDOem8H6gBf1qSOARIN0GlTb2ThJcYkYPeBBCZ3wYA3KPCWSwTYSWqn9NcQiA4iSrjOLEXeOmJaQpQ9eagMf+X5EhZDnWv+VDYiD9h8lV+1vdbqJz7fFnX+SIwwM0IoMGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfsYhXNsUCFCNTTYOFqudqAYleJl/Yb/KBCNQ7oDDks=;
 b=kpf0D0YSBrEBMxHjQxfMS0o8COO8aIMh2iExpv2CizNPp2fYqNbB/PB10Ox0JsxOUIVTzmygSqOegQOWyrexNuQBFW7/0sqpww4yDw5W8kLHnp8hUWMq17AmH/j34LUDXtc7Kk3b37gsrzwU1nc64QiKGbPE20gI6oYQUghlsRBk60y2pOWdqBjLR7HTk7ogEbsBuLGELRTU+dFIm9eLQqJMImf/3OEFVUoZBr3EFT/EBHAtkJwImAI+vHf9ynpncnZFMnnLitqX5Rwa+Ggjz6hZUn9g1eflf9VmGXZW+Qwg7RhXnPyY4xB8QBsvHleOVhDFWQGlDhIG7ZjBNcx+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfsYhXNsUCFCNTTYOFqudqAYleJl/Yb/KBCNQ7oDDks=;
 b=zFWZFLPHyghOj16LVUFdZaRuAguWHOBlewjfxpVUY8mKmhF7rHZh8y301a0HGN6FpgcSL0hhwpomjkIGoQSIeuml+chEZYTUhu1HAguJbKcoALqxEAnfmT/kZybMmuqx2rNkYcLW3OvW0OJuv9Y/gO7wNerNuNptrTukmRRPwMQ=
Received: from PH0PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:5::20)
 by CH0PR12MB5218.namprd12.prod.outlook.com (2603:10b6:610:d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Fri, 12 Jan
 2024 23:42:29 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::d4) by PH0PR07CA0015.outlook.office365.com
 (2603:10b6:510:5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 23:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 23:42:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 17:42:27 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 12 Jan 2024 17:42:26 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: xlnx: zynqmp_dpsub: Set live video in format
Date: Fri, 12 Jan 2024 15:42:22 -0800
Message-ID: <20240112234222.913138-5-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH0PR12MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1528c3-6861-4456-d660-08dc13c822fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGC4qWbBwyws/+3rpKUGCtNUjMh1gpMnNDThrFhcUwNYrXBhF5uy7B1Gw7HW0k8tN7YqXD+/XCLmlPYzSarwpGwZr6oV+tAFh2Uirp/X+j4IW5Uw5K9rlIxSWDhgx2+S51yH0CK6wqgMG0YG+L+epnnQ+Dy4KS/W0tfGHMmcHxMVc3CObF60gEOB6wOa+4r1LTGSzPHg4I/OLmOnD+9TJmzQf6T/TngDPVZp5kkbRBItU7g63mhns308EE+7qELZt4TpQJQvvCppLSw+cCtMVTUkTkb8q06cm4MI8m/zRkbXpedQEt9aZdJVHrOw1kM5fKBH+H0KrW8Z9OedDtmIF1PE5iAYR5+vYbS1AR0QyDaw98dTclCi9QN53RueuBUckX8VQ94A5cMS3Nll0zD5j0oEmsTaIp+zBHpCxZypovpixItPiuOSVeINa12jHJUZGZdbnhMbIfAkek3Mk2VegEZMJe3FHiOEC0SQ64sKEtDryML6/8eH7NWF336/jp/hnDQzRjouukZWpumLaHkUuVTg/jQGG5O3IudzTXOfslK7VlSNrifusMOANbkb3f4iybzjyCRauxkW/uY3aGgEWvvkjulUpr4r8HRH/Tl/VX1HJ7iwuI1RkQktv5en8Hw97Ghbc4EczjAfA7SkAg6KD8AUYKNXijCZaJs37vfdMJHsvQG6cNERX3Wtin6opIAy9veZZjdSUdSM8Kgtptsf0D+b2XsOlNpHE5oqo17x2l1eTPmZGATgayK977l1OpFXwSvWi3b0eVypiotqJWxTTY+tkf1CUNnUucw5v1ndHkM/8gP8+0LjfjlvtxSuI98TbXSBjD1/dKV0LS5bVJqGEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(40460700003)(40480700001)(426003)(6666004)(36860700001)(1076003)(2616005)(336012)(26005)(81166007)(36756003)(86362001)(82740400003)(356005)(2906002)(44832011)(8936002)(8676002)(83380400001)(47076005)(5660300002)(921011)(41300700001)(70586007)(316002)(478600001)(70206006)(110136005)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:42:28.0393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1528c3-6861-4456-d660-08dc13c822fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5218
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

Live video input format is expected to be set as
"bus-format" property in connected remote endpoint.
Program live video input format DPSUB registers.
Set display layer mode in layer creation context.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 109 ++++++++++++++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c        |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
 5 files changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 8a39b3accce5..83af3ad9cdb5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -20,8 +20,10 @@
 #include <linux/dmaengine.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/media-bus-format.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_disp_regs.h"
@@ -67,12 +69,16 @@
 /**
  * struct zynqmp_disp_format - Display subsystem format information
  * @drm_fmt: DRM format (4CC)
+ * @bus_fmt: Live video media bus format
  * @buf_fmt: AV buffer format
  * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
  * @sf: Scaling factors for color components
  */
 struct zynqmp_disp_format {
-	u32 drm_fmt;
+	union {
+		u32 drm_fmt;
+		u32 bus_fmt;
+	};
 	u32 buf_fmt;
 	bool swap;
 	const u32 *sf;
@@ -354,6 +360,16 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
 	},
 };
 
+/* TODO: add support for different formats */
+static const struct zynqmp_disp_format avbuf_live_vid_fmts[] = {
+	{
+		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
+		.sf		= scaling_factors_888,
+	}
+};
+
 static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
 {
 	return readl(disp->avbuf.base + reg);
@@ -369,6 +385,34 @@ static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
 	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
 }
 
+/**
+ * zynqmp_disp_avbuf_set_live_format - Set live input format for a layer
+ * @disp: Display controller
+ * @layer: The layer
+ * @fmt: The format information
+ *
+ * Set the live video input format for @layer to @fmt.
+ */
+static void zynqmp_disp_avbuf_set_live_format(struct zynqmp_disp *disp,
+					      struct zynqmp_disp_layer *layer,
+					      const struct zynqmp_disp_format *fmt)
+{
+	u32 reg, i;
+
+	reg = zynqmp_disp_layer_is_video(layer)
+	    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
+	    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
+	zynqmp_disp_avbuf_write(disp, reg, fmt->buf_fmt);
+
+	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; ++i) {
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(i)
+		    : ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(i);
+		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
+	}
+	layer->disp_fmt = fmt;
+}
+
 /**
  * zynqmp_disp_avbuf_set_format - Set the input format for a layer
  * @disp: Display controller
@@ -902,15 +946,12 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 /**
  * zynqmp_disp_layer_enable - Enable a layer
  * @layer: The layer
- * @mode: Operating mode of layer
  *
  * Enable the @layer in the audio/video buffer manager and the blender. DMA
  * channels are started separately by zynqmp_disp_layer_update().
  */
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
-			      enum zynqmp_dpsub_layer_mode mode)
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
 {
-	layer->mode = mode;
 	zynqmp_disp_avbuf_enable_video(layer->disp, layer);
 	zynqmp_disp_blend_layer_enable(layer->disp, layer);
 }
@@ -950,11 +991,12 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
 	layer->drm_fmt = info;
 
-	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
-
-	if (!layer->disp->dpsub->dma_enabled)
+	/* Live format set during layer creation */
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return;
 
+	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
+
 	/*
 	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
@@ -1083,7 +1125,7 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 	unsigned int i;
 	int ret;
 
-	if (!disp->dpsub->dma_enabled)
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return 0;
 
 	for (i = 0; i < layer->info->num_channels; i++) {
@@ -1104,6 +1146,43 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 	return 0;
 }
 
+/**
+ * zynqmp_disp_get_live_fmt - Get live video format
+ * @disp: Display controller
+ * @layer: Display layer
+ *
+ * Parse connected remote endpoint and retrieve configured bus-format
+ *
+ * Return: live format pointer on success, NULL otherwise
+ */
+static const struct zynqmp_disp_format *zynqmp_disp_get_live_fmt(struct zynqmp_disp *disp,
+								 struct zynqmp_disp_layer *layer)
+{
+	struct device_node *local, *remote, *dpsub = disp->dev->of_node;
+	int rc, i;
+	u32 fmt;
+
+	local = of_graph_get_endpoint_by_regs(dpsub, layer->id, -1);
+	if (!local)
+		return NULL;
+
+	remote = of_graph_get_remote_endpoint(local);
+	of_node_put(local);
+	if (!remote)
+		return NULL;
+
+	rc = of_property_read_u32_index(remote, "bus-format", 0, &fmt);
+	of_node_put(remote);
+	if (rc)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(avbuf_live_vid_fmts); ++i)
+		if (avbuf_live_vid_fmts[i].bus_fmt == fmt)
+			return &avbuf_live_vid_fmts[i];
+
+	return NULL;
+}
+
 /**
  * zynqmp_disp_create_layers - Create and initialize all layers
  * @disp: Display controller
@@ -1130,9 +1209,15 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
+		const struct zynqmp_disp_format *disp_fmt;
 
 		layer->id = i;
 		layer->disp = disp;
+		/* For now we assume dpsub works in either live or non-live mode for both layers.
+		 * Hybrid mode is not supported yet.
+		 */
+		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
+						       : ZYNQMP_DPSUB_LAYER_LIVE;
 		layer->info = &layer_info[i];
 
 		ret = zynqmp_disp_layer_request_dma(disp, layer);
@@ -1140,6 +1225,12 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 			goto err;
 
 		disp->dpsub->layers[i] = layer;
+
+		if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE) {
+			disp_fmt = zynqmp_disp_get_live_fmt(disp, layer);
+			if (disp_fmt)
+				zynqmp_disp_avbuf_set_live_format(disp, layer, disp_fmt);
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 123cffac08be..f3357b2d5c09 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -62,8 +62,7 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
 
 u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 				   unsigned int *num_formats);
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
-			      enum zynqmp_dpsub_layer_mode mode);
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 				  const struct drm_format_info *info);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..926e07c255bb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -165,10 +165,10 @@
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x00
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x10
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x20
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x30
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
 #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 571c5dbc97e5..59616ed1c3d9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1295,7 +1295,7 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 	/* TODO: Make the format configurable. */
 	info = drm_format_info(DRM_FORMAT_YUV422);
 	zynqmp_disp_layer_set_format(layer, info);
-	zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_LIVE);
+	zynqmp_disp_layer_enable(layer);
 
 	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
 		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, true, 255);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index db3bb4afbfc4..43bf416b33d5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -122,7 +122,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 
 	/* Enable or re-enable the plane if the format has changed. */
 	if (format_changed)
-		zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_NONLIVE);
+		zynqmp_disp_layer_enable(layer);
 }
 
 static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {
-- 
2.25.1

