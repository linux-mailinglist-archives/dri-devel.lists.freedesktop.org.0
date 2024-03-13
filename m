Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F487A054
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13DE10F0D9;
	Wed, 13 Mar 2024 00:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3FibyMc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EFC10E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz1pTOS3uKnzLsRiWwHa49Ua6gRhi/u27LJUMF5wcrhEh//glHn40aMzj9psYg3J2Sopcx14YIzeTlA5z39Kki4mB7cgLh2ZMpBHG7g87FbTtJ499rR6yvQyblt4wyOYEyVf0UBNIVzeLUF/nUL49vAXd2xphqVdj0awvc9EHVGsyLCVb3cYQky6YVnkmGbCI080XGA38LtqvnOQdGqYqnDC0CGXUIBWpH+ijkeyHBdt5Hzc3200ITdvNSKT0dNvWqBonwgUy4oPPILP1p2MZ8kRsPeWBbuqEZkfEgzmu8SRUQxRljnJY6yOl8q6PeRLgq4VGjBNfE6cyzzCyuKMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtTJETse76VkVOtoEGrHnV3EcTQKVCnSp52QBxSmfUg=;
 b=fcch6n6baT07cOYatbPxLCWXU0c5CslHUmojbaEOMaWJ9RoB2Ga4HxdLDTP4hFlaRG6trf+bG9NRRjVjVXIBM6gjq6Xo+yl9E10/KwFF/TyeiYvuBBVID1CGMoFFOzd8F1XFA6ZsB4naYxMpNl/j2hF1pfIQxYu/mYCUrvwhF/Iq0uv9xnfvpe22rNjLhHQJHY24mBsrB2ziTqBoxcn9ezvCsblt9BiBG8Vp1KYdVPixJF/VEOEDRzyMttHv9QcyH+RFmJ0Hi2CzGFoU8pxBvfk3FY+mdyak4G6cagv+H3tBCo4vmpNs9qzeDtBwcDN38LS08WE6Zw+Q14RQuDU48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kwiboo.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtTJETse76VkVOtoEGrHnV3EcTQKVCnSp52QBxSmfUg=;
 b=3FibyMc6JxkugCeW7k+py5FIYinUF0FoDgB7tc6HXsOkmRzVZeHenU2+Td/goMS69pTAgjKWxWyrhMNxIqfqctxNTIL5mT7LgZxjrpkKT6w9w6Ysn0SoYhHBJ0QYRqoCUsZiTV8FpbuALZwV2d6d+1DHp+0GkbIIhcFbLn11Tk8=
Received: from CH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::26)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Wed, 13 Mar
 2024 00:55:11 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::f2) by CH5P222CA0011.outlook.office365.com
 (2603:10b6:610:1ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Wed, 13 Mar 2024 00:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 00:55:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:07 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 12 Mar 2024 19:55:06 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 12 Mar 2024 17:55:00 -0700
Subject: [PATCH v2 3/8] drm: xlnx: zynqmp_dpsub: Anounce supported input
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240312-dp-live-fmt-v2-3-a9c35dc5c50d@amd.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
In-Reply-To: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: b1570f1f-fd00-46db-d68b-08dc42f83c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvASaCuLo2l/hxHhozP9rtyVYWjtm2nSSc01p50bd/bYQCkMAf9LwPZMdS7yZLqLXIOfCIncuviouZieEvI+v7mxWrPDJnvl4EH0xJ/iLDOAiQ6jC+LwAbU4PwGAg6g0SVaViuwb5rzr4EvhwKxElpGnz7R9m0guXnWHE8/h5lez9ycYAuN//6VwEvkJbIaeM+oXp4kbc/YOmV7BbUd+Qc5bxEbHiWnmLfPcZrTnPrajv1rytLwJ8NILNP3R5KxRPJ98MFOGC+obUTYdRfQ9COU7c2Epk7dY5pB4wYdwWBE+BT2ltinx6hg/Jsk0FO08lHwQnaJ5FgdE9H0T9M78QPL6iWGsLCXahPj11T+a6beI2OTHQSPMbkx+l7w/wrDqnI/n3Y49CW5FzxBpngkUdkrbLc+hVrWNymS0eVVbKhhSXF/7ratZNT1EeW2koJXofQ0gSvb+nqkRSQZd/E5bLT22M4Nw+xV7PYQi9SN5rjFs/wpyBsIRj6bp2o4Zmzvd7AD5nyMa95JVeAwi8b/vPf37ky+Ck2yIB3PWmDgbRfvJDhaE0OA4ktOSY3Ayh1oHLVLf5J6m/24xMN15CL+BbU6nhtnCrWboxhMwl0dhET4po5tNqt3P5CPw6Z2JgEttUtSlRXfA1rEZTUnYTmND7Cv2skaV+3OqTM0dcm1PZtRp2syDBrO5jglQxp8fg3jY4Wn37BNWPJmFuJiN0tAlWAMM+wLwrQ+icLuSg7w0/grW7+kUDc7xcjuO6b12vbASQbCKEuvABY+64ANdddP/Vg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(7416005)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 00:55:10.9675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1570f1f-fd00-46db-d68b-08dc42f83c45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919
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

DPSUB in bridge mode supports multiple input media bus formats.

Announce the list of supported input media bus formats via
drm_bridge.atomic_get_input_bus_fmts callback.
Introduce a set of live input formats, supported by DPSUB.
Rename zynqmp_disp_layer_drm_formats() to zynqmp_disp_layer_formats() to
reflect semantics for both live and non-live layer format lists.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 67 +++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xlnx/zynqmp_disp.h |  4 +--
 drivers/gpu/drm/xlnx/zynqmp_dp.c   | 26 +++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
 4 files changed, 88 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index e6d26ef60e89..af851190f447 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -18,6 +18,7 @@
 #include <linux/dma/xilinx_dpdma.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -77,12 +78,16 @@ enum zynqmp_dpsub_layer_mode {
 /**
  * struct zynqmp_disp_format - Display subsystem format information
  * @drm_fmt: DRM format (4CC)
+ * @bus_fmt: Media bus format
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
@@ -182,6 +187,12 @@ static const u32 scaling_factors_565[] = {
 	ZYNQMP_DISP_AV_BUF_5BIT_SF,
 };
 
+static const u32 scaling_factors_666[] = {
+	ZYNQMP_DISP_AV_BUF_6BIT_SF,
+	ZYNQMP_DISP_AV_BUF_6BIT_SF,
+	ZYNQMP_DISP_AV_BUF_6BIT_SF,
+};
+
 static const u32 scaling_factors_888[] = {
 	ZYNQMP_DISP_AV_BUF_8BIT_SF,
 	ZYNQMP_DISP_AV_BUF_8BIT_SF,
@@ -364,6 +375,36 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
 	},
 };
 
+/* List of live video layer formats */
+static const struct zynqmp_disp_format avbuf_live_fmts[] = {
+	{
+		.bus_fmt	= MEDIA_BUS_FMT_RGB666_1X18,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_6 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
+		.sf		= scaling_factors_666,
+	}, {
+		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X24,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
+		.sf		= scaling_factors_888,
+	}, {
+		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
+		.sf		= scaling_factors_888,
+	}, {
+		.bus_fmt	= MEDIA_BUS_FMT_VUY8_1X24,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444,
+		.sf		= scaling_factors_888,
+	}, {
+		.bus_fmt	= MEDIA_BUS_FMT_UYVY10_1X20,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
+		.sf		= scaling_factors_101010,
+	},
+};
+
 static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
 {
 	return readl(disp->avbuf.base + reg);
@@ -883,16 +924,17 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
 }
 
 /**
- * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
+ * zynqmp_disp_layer_formats - Return DRM or media bus formats supported by
+ * the layer
  * @layer: The layer
  * @num_formats: Pointer to the returned number of formats
  *
- * Return: A newly allocated u32 array that stores all the DRM formats
+ * Return: A newly allocated u32 array that stores all DRM or media bus formats
  * supported by the layer. The number of formats in the array is returned
  * through the num_formats argument.
  */
-u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
-				   unsigned int *num_formats)
+u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
+			       unsigned int *num_formats)
 {
 	unsigned int i;
 	u32 *formats;
@@ -1131,6 +1173,11 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 			.num_channels = 1,
 		},
 	};
+	static const struct zynqmp_disp_layer_info live_layer_info = {
+		.formats = avbuf_live_fmts,
+		.num_formats = ARRAY_SIZE(avbuf_live_fmts),
+		.num_channels = 0,
+	};
 
 	unsigned int i;
 	int ret;
@@ -1140,12 +1187,16 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 
 		layer->id = i;
 		layer->disp = disp;
-		layer->info = &layer_info[i];
 		/* For now assume dpsub works in either live or non-live mode for both layers.
 		 * Hybrid mode is not supported yet.
 		 */
-		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
-						       : ZYNQMP_DPSUB_LAYER_LIVE;
+		if (disp->dpsub->dma_enabled) {
+			layer->mode = ZYNQMP_DPSUB_LAYER_NONLIVE;
+			layer->info = &layer_info[i];
+		} else {
+			layer->mode = ZYNQMP_DPSUB_LAYER_LIVE;
+			layer->info = &live_layer_info;
+		}
 
 		ret = zynqmp_disp_layer_request_dma(disp, layer);
 		if (ret)
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 9b8b202224d9..88c285a12e23 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -50,8 +50,8 @@ int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
 void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
 					bool enable, u32 alpha);
 
-u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
-				   unsigned int *num_formats);
+u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
+			       unsigned int *num_formats);
 void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 04b6bcac3b07..a0d169ac48c0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1568,6 +1568,31 @@ static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_ddc(connector, &dp->aux.ddc);
 }
 
+static u32 *
+zynqmp_dp_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
+				    struct drm_bridge_state *bridge_state,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state,
+				    u32 output_fmt,
+				    unsigned int *num_input_fmts)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+	struct zynqmp_disp_layer *layer;
+	enum zynqmp_dpsub_layer_id layer_id;
+
+	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
+		layer_id = ZYNQMP_DPSUB_LAYER_VID;
+	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
+		layer_id = ZYNQMP_DPSUB_LAYER_GFX;
+	else {
+		*num_input_fmts = 0;
+		return NULL;
+	}
+	layer = dp->dpsub->layers[layer_id];
+
+	return zynqmp_disp_layer_formats(layer, num_input_fmts);
+}
+
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.attach = zynqmp_dp_bridge_attach,
 	.detach = zynqmp_dp_bridge_detach,
@@ -1580,6 +1605,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.atomic_check = zynqmp_dp_bridge_atomic_check,
 	.detect = zynqmp_dp_bridge_detect,
 	.edid_read = zynqmp_dp_bridge_edid_read,
+	.atomic_get_input_bus_fmts = zynqmp_dp_bridge_get_input_bus_fmts,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 43bf416b33d5..bf9fba01df0e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -152,7 +152,7 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 		unsigned int num_formats;
 		u32 *formats;
 
-		formats = zynqmp_disp_layer_drm_formats(layer, &num_formats);
+		formats = zynqmp_disp_layer_formats(layer, &num_formats);
 		if (!formats)
 			return -ENOMEM;
 

-- 
2.25.1

