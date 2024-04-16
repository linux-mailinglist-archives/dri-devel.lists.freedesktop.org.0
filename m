Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF28A75A5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915B112E54;
	Tue, 16 Apr 2024 20:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yUUtqg5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF251112E56
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f63iVdRQsCiR6gvYK5TLhNa4ESzvCVNKosgQkoRhhP2zhahquv2B/osYSC8ArvZZrQd29H8oETmNoqe6K21vWjai4TGn0VMWhcQnSCWRi6l8xGGOzwFE4OE0ylygatynR8oeym48OI+2lse5TIC15c1x+T3mDJxoif53m9PUCDoBcfNPbj9suzlYyLZZxM2vTIHsegctXj5CQdZZmnmY8Dzzce9OvBNz0KY0K1SdhTIDYiIFB24zmvHi2Tr5tv9X4lYeDn+hSbwfd7OSxEuQLw0tlcX9TTZAgTu8L5WuIWIiP0/k33xIAiOzoU/d3wBs8QiP8f1PugxkCkbzGfM2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpIkcxdTRXA26nsXvqwIYuPx84ELyM8Awpl8y7BFccY=;
 b=PjiBQ4GYqB668TSGBbpz3pHI18TNhXoZ5YAQw57GUahD8Vp4jU2qEbKv99sDBv1WXXpdYYY1BzoCz1O1J4Bt5rt1EfCnbpFM2F3KFgoY7XapYH/d5CU1aZNHiAyPzvjBAkxd8uqHZcVF+Rkh85G8y0DPlpMcwyhkESxcgconIacwnmF8eqG6siUChGa7FaEwTJyibjVi7FtspYIK8UMf9e+X3pNMb+xlMSpa/le9oUC81LaGxJb+5gKIZWeZHH8q4M17mJpE9FWq617tvp4moIW//ncFtqsQwDERLPa+TgRNZVAbZEpaZCD3+BSJNWyiYCKWcDH+cOV+c/uI5Y5Mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpIkcxdTRXA26nsXvqwIYuPx84ELyM8Awpl8y7BFccY=;
 b=yUUtqg5gaYYN4ZsV/ASM/Bj+l053N0RM1MZb/x++vft+LnjUjRmFFtbJCNQ2KDlgQFi3AWd4xx1U0NZXZhycl2SfAnXIPbB+zl/53nJgf25Ek4OikDGWMd3AouEATGaa5qSeCemP+E5QTPekA9ilXt8vDLAXVghIgVo+dkb+Mms=
Received: from MN2PR06CA0020.namprd06.prod.outlook.com (2603:10b6:208:23d::25)
 by IA1PR12MB6068.namprd12.prod.outlook.com (2603:10b6:208:3ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:31:58 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::89) by MN2PR06CA0020.outlook.office365.com
 (2603:10b6:208:23d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 20:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 20:31:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 15:31:57 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 16 Apr 2024 15:31:55 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 16 Apr 2024 13:31:39 -0700
Subject: [PATCH v4 4/7] drm: xlnx: zynqmp_dpsub: Anounce supported input
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240416-dp-live-fmt-v4-4-c7f379b7168e@amd.com>
References: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
In-Reply-To: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
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
 <linux-kernel@vger.kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|IA1PR12MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: ba353a0e-0962-4f63-efa5-08dc5e54438e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRX+TBwH21twH1DaCP9Un/eMKKeu8VLzlpYdDxAN8lc52wcjJewWBt/++04DwB5xServFr3m0vlpfCuxwDl4PaaeB+C84GmK7vqkrKLVS10BAZfJsZ6i91fNh6YmjvjeaRtOTalF/8lMAzAgk1uT5e2yKvCg0cuyKV5eWiBN7PkxvREFaFur+EDxcH1y8l6D4FLfuJMBAtxw+OYVQe3jiO8Gw1Zg9DP4qi5HE6wYXvGGy7lpsWS1amPJQWHSub1aSp+/0NnnCLT/UH/KJEEp28pl7uVQ47tpcggiOB+4piWnUb0TFoEAtgFWpHRSIiXZ08O19sPXRlUIz8k6KwQ5Ae/H/bOKmze27k5gAQOidwYArR+0mV2uABGOnXFlPTgVSa/pILy64yZEs00JcBHOgPb+6yKWqL4lO0w8k29R5bAEABxgjiwPBFlYzuFj5ae/WVPqHGXsfhpGHW5YAr7/cu4M1alUP+SJp0jKqRwRnVJLTE9dHz5t9sfMDIjGxiEt55lKD+D3IVrwF8id7p7iqNLS0aGv2Kje/qViphsh2fqr2WMiYeQNgFrLHX4rZ1nBQuapV+XpaWF79596wRW8fzdpYa4dC6CckO7ZK2/apl27VHI8fqOjNmnlfaQhaYpIrRh1Eg1xpfgLpXCAYnbAzPsFXz2CKygkow59awm6XJ9OG0f14aJLwp1yrR7uvwAFZJxhqYkt/A7n9pPyMqbTA5aewFVODPeje6dAbkhshIWu/XsXz84mg1zbEE35puh+fAgF/PWJz8PAySMd6T/8MQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(36860700004)(82310400014)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:31:58.3160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba353a0e-0962-4f63-efa5-08dc5e54438e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6068
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
drm_bridge.atomic_get_input_bus_fmts callback. Introduce a set of live
input formats supported by DPSUB. Add safeguards to format list functions
to prevent their misuse in the different layer modes contexts.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 110 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_disp.h |   2 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c   |  31 +++++++++++
 3 files changed, 139 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 891577475349..24f1f367b1d3 100644
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
@@ -887,6 +931,11 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  * @layer: The layer
  * @num_formats: Pointer to the returned number of formats
  *
+ * NOTE: This function doesn't make sense for live video layers and will
+ * always return an empty list in such cases. zynqmp_disp_live_layer_formats()
+ * should be used to query a list of media bus formats supported by the live
+ * video input layer.
+ *
  * Return: A newly allocated u32 array that stores all the DRM formats
  * supported by the layer. The number of formats in the array is returned
  * through the num_formats argument.
@@ -897,10 +946,17 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 	unsigned int i;
 	u32 *formats;
 
+	if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
+		*num_formats = 0;
+		return NULL;
+	}
+
 	formats = kcalloc(layer->info->num_formats, sizeof(*formats),
 			  GFP_KERNEL);
-	if (!formats)
+	if (!formats) {
+		*num_formats = 0;
 		return NULL;
+	}
 
 	for (i = 0; i < layer->info->num_formats; ++i)
 		formats[i] = layer->info->formats[i].drm_fmt;
@@ -909,6 +965,43 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 	return formats;
 }
 
+/**
+ * zynqmp_disp_live_layer_formats - Return the media bus formats supported by
+ * the live video layer
+ * @layer: The layer
+ * @num_formats: Pointer to the returned number of formats
+ *
+ * NOTE: This function should be used only for live video input layers.
+ *
+ * Return: A newly allocated u32 array of media bus formats supported by the
+ * layer. The number of formats in the array is returned through the
+ * @num_formats argument.
+ */
+u32 *zynqmp_disp_live_layer_formats(struct zynqmp_disp_layer *layer,
+				    unsigned int *num_formats)
+{
+	unsigned int i;
+	u32 *formats;
+
+	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_LIVE)) {
+		*num_formats = 0;
+		return NULL;
+	}
+
+	formats = kcalloc(layer->info->num_formats, sizeof(*formats),
+			  GFP_KERNEL);
+	if (!formats) {
+		*num_formats = 0;
+		return NULL;
+	}
+
+	for (i = 0; i < layer->info->num_formats; ++i)
+		formats[i] = layer->info->formats[i].bus_fmt;
+
+	*num_formats = layer->info->num_formats;
+	return formats;
+}
+
 /**
  * zynqmp_disp_layer_enable - Enable a layer
  * @layer: The layer
@@ -1131,6 +1224,11 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
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
@@ -1140,13 +1238,17 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 
 		layer->id = i;
 		layer->disp = disp;
-		layer->info = &layer_info[i];
 		/*
 		 * For now assume dpsub works in either live or non-live mode for both layers.
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
index 9b8b202224d9..efd1c52c2916 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -52,6 +52,8 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
 
 u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 				   unsigned int *num_formats);
+u32 *zynqmp_disp_live_layer_formats(struct zynqmp_disp_layer *layer,
+				    unsigned int *num_formats);
 void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 7faeb010e1ae..faaeea526970 100644
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
+		return zynqmp_disp_live_layer_formats(layer, num_input_fmts);
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

-- 
2.25.1

