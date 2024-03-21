Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208F8861DC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10231112105;
	Thu, 21 Mar 2024 20:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BodKRS2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E94D112105
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMTdeDsZWtQ1GPRTtzRsgPDF0iukcqvwB0lgxKw/h4N349BDizrHejnNr09cQu6otJtd4VACs/ApJx5Ly8Jz3V1GjzGplkCq0ZrjlJFfG7JYs4b0nSL8sXjm5CuiHH40oU5+T5l0ldUd4c+Tbb+wIAmubXCQa2NSVcL8xzurwS5t+Tt/fmGWIWeMfKYcAEbXhMHIdNe1GOHOaQBEAYkpiyGG3ki6G/8cJ6Czo87H0X5Rc5sSrhPrvtGa8uOZ0riFw1+KijYa116DVVwA7NPxu0vwyz4NZlFBUdA/+DD8OW11UtPA98sgIIC0/Ii3ZGf60/nAm+mrUEBus1woLTveHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah/6LdEJZTf4BK470vQw33mSmDi9MvVlPOfTcjV6iRg=;
 b=WNgnp7JeyPIHNEqFRiExkwdT/VwZl3nkvmdy7PUhPFNAiuZFtCGbsDk2EOD/+A/qYhP3ur5RCXNhlR3GthXjzeEZu2qp51Ve5B5Eex0BMDZ/4oIWZ7PjHPLelEU9KXTtdmnrd85mbCiKOxKWn8kzIlonaJHbQhZWWF+EqPRlyJEQ36aHeZADqUHDVSFl174RlKQbFUJxn2dq/vHM2Py1UtpdyfCUAn0ANtb4qNvtkbdYSNjH4AFuOkpsPXhKGcSEaXbM7GgIVCKXTxJDF5iKX+WXB9Ms9FHXECx+abiJ1Bk2JV+VTqoJfYPbFNjlPMzV/+GaUCA37gK3FT/1XnpKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah/6LdEJZTf4BK470vQw33mSmDi9MvVlPOfTcjV6iRg=;
 b=BodKRS2CSzKefWn2OeWELAFBbff/0TBdUF/wAAxeXotnphMtNQXoHyho/bgZGfe+rpoLEA1fFAYipird0vfnkFLmQmrChWhzzAhyZaOipWYCoCLzE/hld5+EogZdQHgNNpjMiybcT+57hqvlJWnzEObK5C6Uw63sNbNVpgx+YnY=
Received: from BN9PR03CA0459.namprd03.prod.outlook.com (2603:10b6:408:139::14)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Thu, 21 Mar
 2024 20:44:05 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::be) by BN9PR03CA0459.outlook.office365.com
 (2603:10b6:408:139::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Thu, 21 Mar 2024 20:44:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7430.0 via Frontend Transport; Thu, 21 Mar 2024 20:44:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:44:03 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:44:01 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 21 Mar 2024 13:43:42 -0700
Subject: [PATCH v3 4/9] drm: xlnx: zynqmp_dpsub: Anounce supported input
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240321-dp-live-fmt-v3-4-d5090d796b7e@amd.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
In-Reply-To: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
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
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bd1e40-7668-410b-d41f-08dc49e7a63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLD62ZPj0c33drURpmrC9E2rvq88wv+2dUqO2u3oGDQZhk6O/ACxt01AO0XUf2eDS8B8UpdHH7wslZAAYUallM3n9sCCZjGiScXcqTrdHCsBlHBhYq8shP6+narXHE0OMW3L8iuwlIdw7IRXS79El9GBm36qAETD0apOQSt00B2j5Up8u54Hupl6kM1EIMtxr6VZuetp73O8zbw1eXinmdrm1Y1bAKrccU8TJGiPOhc2mK4SRNbo6eAT9ZQAd3nyF5IEykcPMgqmzf/mMy90FfvLFr745xXhDYHXQJiwwV2XVTWLw9pim4F8TJDKa5gmxz1OMgLpsqkH9l04L1mvCilvRvBfVWMksD9yDp09nJB310cTkyy0hImv/JU8ywk+n2Kc19TokmUzPZX6Ffje0xOkrR51VsP/6TqqBEUar9/gHC0mCUy4kzdX+QQqQ6PXDizO0nMQFeW9loXbGxrr9erSafYybuc5KP6BkmfEwfFJ6l1lLiz4piP1gV708s+XaN8ioQfFyY+pFIDhD/OVB4O86AK8PA6EQSYtkUaXLowqI7HHH9i+C9JyHgCnv8DdOS9nixhEzYntV4D0/yh/IYayhTRS1dM5MO9DuPn6ZKc0e94P1Ni39gZtmqR70E+tdkr63FJQQKJAG2gaJgpnO02dliehsyLx2Sy5+bHhcQ0lMfH3pUqXTwr1b77fLCdgVTPEcBuhxyCi+Knjwx2Dynue1ZPe7PkrNO3872kgSKR6/I52/8GrO2eaNp8gaI11enXI0gRNemTs2343L94e1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(82310400014)(36860700004)(1800799015)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:44:05.2570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bd1e40-7668-410b-d41f-08dc49e7a63a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 76 +++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xlnx/zynqmp_disp.h |  4 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c   | 31 ++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
 4 files changed, 101 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index e6d26ef60e89..abdc3971b193 100644
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
@@ -77,12 +78,14 @@ enum zynqmp_dpsub_layer_mode {
 /**
  * struct zynqmp_disp_format - Display subsystem format information
  * @drm_fmt: DRM format (4CC)
+ * @bus_fmt: Media bus format
  * @buf_fmt: AV buffer format
  * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
  * @sf: Scaling factors for color components
  */
 struct zynqmp_disp_format {
 	u32 drm_fmt;
+	u32 bus_fmt;
 	u32 buf_fmt;
 	bool swap;
 	const u32 *sf;
@@ -182,6 +185,12 @@ static const u32 scaling_factors_565[] = {
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
@@ -364,6 +373,41 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
 	},
 };
 
+/* List of live video layer formats */
+static const struct zynqmp_disp_format avbuf_live_fmts[] = {
+	{
+		.drm_fmt	= DRM_FORMAT_RGB565,
+		.bus_fmt	= MEDIA_BUS_FMT_RGB666_1X18,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_6 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
+		.sf		= scaling_factors_666,
+	}, {
+		.drm_fmt	= DRM_FORMAT_RGB888,
+		.bus_fmt	= MEDIA_BUS_FMT_RGB888_1X24,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_YUV422,
+		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_YUV444,
+		.bus_fmt	= MEDIA_BUS_FMT_VUY8_1X24,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_P210,
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
@@ -883,16 +927,17 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
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
@@ -903,7 +948,9 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 		return NULL;
 
 	for (i = 0; i < layer->info->num_formats; ++i)
-		formats[i] = layer->info->formats[i].drm_fmt;
+		formats[i] = layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE
+			   ? layer->info->formats[i].drm_fmt
+			   : layer->info->formats[i].bus_fmt;
 
 	*num_formats = layer->info->num_formats;
 	return formats;
@@ -1131,6 +1178,11 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
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
@@ -1140,12 +1192,18 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 
 		layer->id = i;
 		layer->disp = disp;
-		layer->info = &layer_info[i];
-		/* For now assume dpsub works in either live or non-live mode for both layers.
+
+		/*
+		 * For now assume dpsub works in either live or non-live mode for both layers.
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
index 4faafdd76798..e3b9eb3d9273 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -22,6 +22,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -1577,6 +1578,35 @@ static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_ddc(connector, &dp->aux.ddc);
 }
 
+static u32 *zynqmp_dp_bridge_default_bus_fmts(unsigned int *num_input_fmts)
+{
+	u32 *formats = kzalloc(sizeof(*formats), GFP_KERNEL);
+
+	if (formats)
+		*formats = MEDIA_BUS_FMT_FIXED;
+	*num_input_fmts = !!formats;
+
+	return formats;
+}
+
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
+
+	layer = zynqmp_dp_disp_connected_live_layer(dp);
+	if (layer)
+		return zynqmp_disp_layer_formats(layer, num_input_fmts);
+	else
+		return zynqmp_dp_bridge_default_bus_fmts(num_input_fmts);
+}
+
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.attach = zynqmp_dp_bridge_attach,
 	.detach = zynqmp_dp_bridge_detach,
@@ -1589,6 +1619,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
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

