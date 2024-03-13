Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0687A052
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E67F10EE8F;
	Wed, 13 Mar 2024 00:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZIQfL0wX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010D10EE8F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp2KDrFUpgZAMyjMHPIGK2ihRYZdRKJ2tvW5NhfgpiPHf72iJ9ZJ1kr8VawRl/Rwa0DjDwVhNU/ZRTD3eFTTaq8A0ArolD78P7Bt5rOk440cYi9tky50IdWeADMMxSI+iS0yDUgL4P8+p7W5iAT/SPgJtu0yBGwM002FvI14gLlloRSlW4Ux+3U8F6fYLytyGweNSyoiI4shB0HOPshnvvTUJCSv68aOIlOS5VLYvE3SkS+Mdypf0CWzXFxos0OBjIPD0C9K5eK8+cxFzhK/BiFq67PmsBm8yBvmzPViEv60jkm1k9RkGHK4g+FfeB0+W73RbAhOx5oKLKfsRbVnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WlbACMWvZ+9+FRirS97cUDs7MvRYC/pSMlBp0MphFo=;
 b=Tp3xf6rJKpYKZ6owHO7Th28v+2YYCKZAo9H/Z43/w3HAm0vijn8h2fYyoV4el6O0qV6b/YHXuyzMtXEfJv7F7ORiYsJQaHjzmUZwZ4Hbvd+qVf6TxRA7eMArktCNElKzufxkeroj/bBqlXpQvYY0REX3ybN2T96w2xF1Q50i6CIeGJfZzmUmzgfP0xKhGV5qfdRP3NZCNJXBcoh6KUAjbpqpA81y5zsaPHcBRoB4u8vX2crj110L+gKqfU9e2JwKsxB5cKTXWK8jnYUHgF65RDzpS1GD92q3BG9QBtqLxeisGFcxHvKgVxopF0VJEcOqNvjlR1MKNF8jy13Ks1rdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kwiboo.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WlbACMWvZ+9+FRirS97cUDs7MvRYC/pSMlBp0MphFo=;
 b=ZIQfL0wXrXCNrBVxjAgxLzksAGGrHQPb1HbvC12q8xZXjggbf539JenOPvW8TY0bt8IQ7yIaZuVj8AV41NeZ3AQP/kVQBjmjLKfHGe3bQHDmVouuBolv2SU27jfwYwJU2Atp0seKC9FIguWXfeXk3bNAV6uu7V4gJBmNmDegL7o=
Received: from CH2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:610:57::34)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 00:55:11 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::dc) by CH2PR12CA0024.outlook.office365.com
 (2603:10b6:610:57::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Wed, 13 Mar 2024 00:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 00:55:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:10 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 12 Mar 2024 19:55:09 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 12 Mar 2024 17:55:02 -0700
Subject: [PATCH v2 5/8] drm: xlnx: zynqmp_dpsub: Set input live format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240312-dp-live-fmt-v2-5-a9c35dc5c50d@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CH3PR12MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b2752b-022f-485b-1234-08dc42f83cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: REaYDGl7V4AaVFWQmd53faKmpLBUeoL6awJL9yscGXEB6WMa/3a31BuaAal9vcfuQLQdLACIbuAvL79ewu9M5zvXbJzJDGdQgK8rvca1GLlAGz4HpB+xBNwPDlrqlyLrJWcpOqrhFQn4rEnU6/3K3y6z7N4rwTGxVZNxhT93Bmg+lqybP4YdKNyXMEZ+o0zaooDVJx2rZFOPBJOppVZNyWMx/64s/qBGf6R0DezKtUnlgIEyECzMkfqP/BmZ9H24PPCJBytmvcFN2uXOxusL+dDiDtspqafUsxcsbgamTg6gbiqj8yq13Gj7kULWodz8WjI8uYoMXqIc6uAvLwmkJupSySDn2cRiE6+MsuhDk+64QaPW1rEylxn0+OuvrPX7W1CWMC1Cg4GIgFXK9fVx9PbG3HsIR6Y/YBiFDV8tE+Q3eTvw8/FGhIR6jYbk8C1tyfE3RyczEeOvDyVSpLrC14DSkKRdnVwiIpFwyP0NgDjy4qAq+sJLvxBAFkFpum61mswa6yvxZiPbOugoqWQfPxYTHa5/sTk7eMxLLaOjor3wKvg9Fb7mJ8suhxub9cPlRdRcgyT82PwWBGkSHRBrXB/yVTJZxjCt61jmOScUnuD3m6/6W+4QaBhZ4UCwJar8TvLqleFMIhiSZD1JZ0MX+iC2uwUcrkg16dyZRCKRP9JndWXr61/2xbKrshRtbCWJNcnXugFU2VO0nALHl/c5LEjZJSadBe2ZSpXj38YEo/9rhGtKMe+FkGKBUebq7V3Q1S5vzCAjuXQV6Cc8Zt/ekw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(36860700004)(82310400014)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 00:55:11.7423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b2752b-022f-485b-1234-08dc42f83cbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
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

Program live video input format according to selected media bus format.

In the bridge mode of operation, DPSUB is connected to FPGA CRTC which
almost certainly supports a single media bus format as its output. Expect
this to be delivered via the new bridge atomic state. Program DPSUB
registers accordingly.
Update zynqmp_disp_layer_set_format() API to fit both live and non-live
layer types.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 93 +++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xlnx/zynqmp_disp.h |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c   | 13 ++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
 4 files changed, 87 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index dd48fa60fa9a..0cacd597f4b8 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -383,7 +383,7 @@ static const struct zynqmp_disp_format avbuf_live_fmts[] = {
 				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
 		.sf		= scaling_factors_666,
 	}, {
-		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X24,
+		.bus_fmt	= MEDIA_BUS_FMT_RBG888_1X24,
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
 				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
 		.sf		= scaling_factors_888,
@@ -433,19 +433,28 @@ static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp *disp,
 					 const struct zynqmp_disp_format *fmt)
 {
 	unsigned int i;
-	u32 val;
+	u32 val, reg;
 
-	val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
-	val &= zynqmp_disp_layer_is_video(layer)
-	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
-	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
-	val |= fmt->buf_fmt;
-	zynqmp_disp_avbuf_write(disp, ZYNQMP_DISP_AV_BUF_FMT, val);
+	layer->disp_fmt = fmt;
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
+		reg = ZYNQMP_DISP_AV_BUF_FMT;
+		val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
+		val &= zynqmp_disp_layer_is_video(layer)
+		    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
+		    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
+		val |= fmt->buf_fmt;
+	} else {
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
+		    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
+		val = fmt->buf_fmt;
+	}
+	zynqmp_disp_avbuf_write(disp, reg, val);
 
 	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
-		unsigned int reg = zynqmp_disp_layer_is_video(layer)
-				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
-				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
+		    : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
 
 		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
 	}
@@ -984,23 +993,73 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 	zynqmp_disp_blend_layer_disable(layer->disp, layer);
 }
 
+struct zynqmp_disp_bus_to_drm {
+	u32 bus_fmt;
+	u32 drm_fmt;
+};
+
+/**
+ * zynqmp_disp_reference_drm_format - Get reference DRM format corresponding
+ * to the given media bus format.
+ * @bus_format: Media bus format
+ *
+ * Map media bus format to some DRM format that represents the same color space
+ * and chroma subsampling as the @bus_format video signal. These DRM format
+ * properties are required to program the blender.
+ *
+ * Return: DRM format code corresponding to @bus_format
+ */
+static u32 zynqmp_disp_reference_drm_format(u32 bus_format)
+{
+	static const struct zynqmp_disp_bus_to_drm format_map[] = {
+		{
+			.bus_fmt = MEDIA_BUS_FMT_RGB666_1X18,
+			.drm_fmt = DRM_FORMAT_RGB565,
+		}, {
+			.bus_fmt = MEDIA_BUS_FMT_RBG888_1X24,
+			.drm_fmt = DRM_FORMAT_RGB888,
+		}, {
+			.bus_fmt = MEDIA_BUS_FMT_UYVY8_1X16,
+			.drm_fmt = DRM_FORMAT_YUV422,
+		}, {
+			.bus_fmt = MEDIA_BUS_FMT_VUY8_1X24,
+			.drm_fmt = DRM_FORMAT_YUV444,
+		}, {
+			.bus_fmt = MEDIA_BUS_FMT_UYVY10_1X20,
+			.drm_fmt = DRM_FORMAT_P210,
+		},
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(format_map); ++i)
+		if (format_map[i].bus_fmt == bus_format)
+			return format_map[i].drm_fmt;
+
+	return DRM_FORMAT_INVALID;
+}
+
 /**
  * zynqmp_disp_layer_set_format - Set the layer format
  * @layer: The layer
- * @info: The format info
+ * @drm_or_bus_format: DRM or media bus format
  *
  * Set the format for @layer to @info. The layer must be disabled.
  */
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
-				  const struct drm_format_info *info)
+				  u32 drm_or_bus_format)
 {
 	unsigned int i;
 
-	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
-	layer->drm_fmt = info;
-
+	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, drm_or_bus_format);
 	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
 
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
+		drm_or_bus_format = zynqmp_disp_reference_drm_format(drm_or_bus_format);
+
+	layer->drm_fmt = drm_format_info(drm_or_bus_format);
+	if (!layer->drm_fmt)
+		return;
+
 	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return;
 
@@ -1008,7 +1067,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
 	 */
-	for (i = 0; i < info->num_planes; i++) {
+	for (i = 0; i < layer->drm_fmt->num_planes; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct xilinx_dpdma_peripheral_config pconfig = {
 			.video_group = true,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 88c285a12e23..9f9a5f50ffbc 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -55,7 +55,7 @@ u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
 void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
-				  const struct drm_format_info *info);
+				  u32 drm_or_bus_format);
 int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 			     struct drm_plane_state *state);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0d169ac48c0..fc6b1d783c28 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1281,7 +1281,8 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 {
 	enum zynqmp_dpsub_layer_id layer_id;
 	struct zynqmp_disp_layer *layer;
-	const struct drm_format_info *info;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_fmt;
 
 	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
 		layer_id = ZYNQMP_DPSUB_LAYER_VID;
@@ -1291,10 +1292,14 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 		return;
 
 	layer = dp->dpsub->layers[layer_id];
+	bridge_state = drm_atomic_get_new_bridge_state(old_bridge_state->base.state,
+						       old_bridge_state->bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
+	bus_fmt = bridge_state->input_bus_cfg.format;
+	zynqmp_disp_layer_set_format(layer, bus_fmt);
 
-	/* TODO: Make the format configurable. */
-	info = drm_format_info(DRM_FORMAT_YUV422);
-	zynqmp_disp_layer_set_format(layer, info);
 	zynqmp_disp_layer_enable(layer);
 
 	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index bf9fba01df0e..d96b3f3f2e3a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -111,7 +111,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 		if (old_state->fb)
 			zynqmp_disp_layer_disable(layer);
 
-		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
+		zynqmp_disp_layer_set_format(layer, new_state->fb->format->format);
 	}
 
 	zynqmp_disp_layer_update(layer, new_state);

-- 
2.25.1

