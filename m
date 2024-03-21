Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D48861DA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B624A112101;
	Thu, 21 Mar 2024 20:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M0f0x8LB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B491120FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYYEuWQ1L2Z7zE44bLzRALGQ9V0ZPi2UG+TTSoSfu/7G74Pi0TsD1ekp5lOnohL5DWaty96YodzWkjE1AyMS0pHOZEKoJ+R5kF58TgCrX/AUOyYnQBLO8XSKpPWqYrXz+pPttur2k6hjIsW7WMOalKkuEPIQLq/dR57S+080ATr5w18yZjeXdxZ3B6PO0gQ4cUVXqin5D7DQ0mXSmj4XTAm5ibXfKhSZNXZzqrlEBBCx2lbH3fvzku+waTL9eFRge0PlXM9HVHg1JHegvpn3iBwZIj+6ELkmdwPqXfx224nD3DoSZ8vIdVyAsTL2kfyA4wmR4h3LgDfAyB0HqcTNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP4EV/pG2As/itVcnlKhw4oWiqWoz0FtggQhdNxJwso=;
 b=L30m8KULZLU2w7J3btUecK9pXaDVzkCm2z2D4JMsR9cpS2wwHsd9AOPXj/8z9FLNcx7JJzD+LEFf3no+Vxa4W3g8jVM2bz9Oz0AtXqWgKay3wfTyF10JWLPyR+K/k2vffd3SmTiLottVxgsJlhF9lxNXcTvsmo2Ijy/PuumsDYFmOaJ4wLJ7RaKuo85OuffknnLaChe6lE+kDqLSFWd9jVFqYqR2fEkApiMikVPfM2WVxdSV0n4iHimxOXDjmat1tzKl0Zn/9PJMwbjDhLpejQtAaFehqH4E3jGDPpLn6ABAAKFjCb2SwtF8E43BlE7ITy83jTF9FRojRpMcVQl/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP4EV/pG2As/itVcnlKhw4oWiqWoz0FtggQhdNxJwso=;
 b=M0f0x8LBujRIxp9qp/zKEggTpTcvRPRMr1V64DA3oNnyGYnvV9tgAvQWNTAa8Gdelt2VOxHMhcfifToa2r+H1VKcHvGYuqkIn2+M/xtFA/7DwFyWKwPYrYejxM/nxQ0cGqU/ptY9s55/5/8Pad1kM67WqE0J3MtZAgg+L5jJ88o=
Received: from BN0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:408:e4::34)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Thu, 21 Mar
 2024 20:44:00 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::b2) by BN0PR02CA0029.outlook.office365.com
 (2603:10b6:408:e4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Thu, 21 Mar 2024 20:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 20:43:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:43:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:43:58 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:43:57 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 21 Mar 2024 13:43:39 -0700
Subject: [PATCH v3 1/9] drm: xlnx: zynqmp_dpsub: Set layer mode during creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240321-dp-live-fmt-v3-1-d5090d796b7e@amd.com>
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
Received-SPF: None (SATLEXMB05.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 51db50f9-707e-4b18-a560-08dc49e7a2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5SSDbj1jiGQPHtkNYSohWOqvZMLWvQWPsDF//mAhtdmWp0oK3C4iTMqtdCjUWOxKg7iI6ZSrkelg3FUzoRb3vfLpm/WuYEBEq2WRRPPde2FACgYt+lbH086gNbiXHxP2Cyib9cDa1WUoSjVlK567g/ACjvzKFfHnpOj/cj1g1jkxSf6+GTq1z0tdPWq8NKBY57yhIaK0IA3RrKBsjIl4NSc5+WEojHvrvtuCJ4W9Txd9VD5XbyUEObisPk7oh1mLspFFz+cQUIC9peCSnGXfkFdrj5d3vtujuO4fHFwcSDVnhtm7nSdX5bxPd55i3xXp485hnFQBHbdDI/n0YGZ6XBvkS31G7MVBEDIDDzFLHizPdiw9EC3P344ei803yEKKAUK1CE/29PBx/Ns4Y3zzMBx7bdY+uh2SLn3G60T3iF1lmgoPae5y4XiytZW5Yx8QPEDTKxy2KhIxxNuoVwF1ObiaMfrMHUBrY04eg5ssMzNuiYb6mjvFA38mxPLIqQZ+H/RHNP1FgUuDekv56U+7XffWFpCjfGS2npGyhpZpket7kxMZmR1lREGjfEjkepGT3MnIqF79VaFioYaL1vZWF/+2h1r6Xzi5XAuZbihIZZm9RtZaZ0JMWP4hp7VQszCOtpU2Y3lTdlYYS9Tuu694uQSuGN+EOeijV34OD7d4kmQO+j2kA70bIT184ev+T9Au0dS0gVS3zcewNT2u7N/jPvrBYr66jGaI6X+grosseFBoQ9YBJA2bnR6pBJobIiVujuV4Olp4ktkEEVDhCTHxPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(7416005)(82310400014)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:43:59.5844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51db50f9-707e-4b18-a560-08dc49e7a2db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362
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

Set layer mode of operation (live or dma-based) during layer creation.

Each DPSUB layer mode of operation is defined by corresponding DT node port
connection, so it is possible to assign it during layer object creation.
Previously it was set in layer enable functions, although it is too late
as setting layer format depends on layer mode, and should be done before
given layer enabled.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 20 ++++++++++++++++----
 drivers/gpu/drm/xlnx/zynqmp_disp.h | 13 +------------
 drivers/gpu/drm/xlnx/zynqmp_dp.c   |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 8a39b3accce5..e6d26ef60e89 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -64,6 +64,16 @@
 
 #define ZYNQMP_DISP_MAX_NUM_SUB_PLANES			3
 
+/**
+ * enum zynqmp_dpsub_layer_mode - Layer mode
+ * @ZYNQMP_DPSUB_LAYER_NONLIVE: non-live (memory) mode
+ * @ZYNQMP_DPSUB_LAYER_LIVE: live (stream) mode
+ */
+enum zynqmp_dpsub_layer_mode {
+	ZYNQMP_DPSUB_LAYER_NONLIVE,
+	ZYNQMP_DPSUB_LAYER_LIVE,
+};
+
 /**
  * struct zynqmp_disp_format - Display subsystem format information
  * @drm_fmt: DRM format (4CC)
@@ -902,15 +912,12 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
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
@@ -1134,6 +1141,11 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 		layer->id = i;
 		layer->disp = disp;
 		layer->info = &layer_info[i];
+		/* For now assume dpsub works in either live or non-live mode for both layers.
+		 * Hybrid mode is not supported yet.
+		 */
+		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
+						       : ZYNQMP_DPSUB_LAYER_LIVE;
 
 		ret = zynqmp_disp_layer_request_dma(disp, layer);
 		if (ret)
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 123cffac08be..9b8b202224d9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -42,16 +42,6 @@ enum zynqmp_dpsub_layer_id {
 	ZYNQMP_DPSUB_LAYER_GFX,
 };
 
-/**
- * enum zynqmp_dpsub_layer_mode - Layer mode
- * @ZYNQMP_DPSUB_LAYER_NONLIVE: non-live (memory) mode
- * @ZYNQMP_DPSUB_LAYER_LIVE: live (stream) mode
- */
-enum zynqmp_dpsub_layer_mode {
-	ZYNQMP_DPSUB_LAYER_NONLIVE,
-	ZYNQMP_DPSUB_LAYER_LIVE,
-};
-
 void zynqmp_disp_enable(struct zynqmp_disp *disp);
 void zynqmp_disp_disable(struct zynqmp_disp *disp);
 int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
@@ -62,8 +52,7 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
 
 u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 				   unsigned int *num_formats);
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
-			      enum zynqmp_dpsub_layer_mode mode);
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 				  const struct drm_format_info *info);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 1846c4971fd8..04b6bcac3b07 100644
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

