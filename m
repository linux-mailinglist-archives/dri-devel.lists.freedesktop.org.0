Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9818861DD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A87B112107;
	Thu, 21 Mar 2024 20:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y/7qRhfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A23B112106
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXE9cK7y0YTNTY03z38ikZpihLXvyGTXxu8VcnwGS82qWL5xdh6UO889l+vGCqnPgAFP94n6ifBHQWvVcYM46Mpi9YKZcG94SfQwUJh9gF/O2KJyahxVybjz0RlUvd9ay1mnt6wy4JKr/COkvnkTyeVIwH9fwTGGsRyosVc5bE1bRb/nBYHTRs6D6gyribRT26V63x4db5a0RWZ4PpHA93oJuISjQeN0SqBw109vLQnVPwArojbu3mIC+PcxyICi0LWeX4YxZ0SILbcd3hLxB6NJTgadBai0HEveLGgPdOJkFiBwpazxDvPKfbdymJkQqkfmP+zVZaf08fug7Sl83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjKa660Fh8XIC5VWjeV/p1RJCfTdPanwEzPrEQM6c2k=;
 b=O82HwBEzrV7rbgQk4zS4LGqOE2JerHd7HdpZWVUV6FngTyfK+SUhH7daJ/dH3nuo79nQ0+8lBaGcUWGGJsKoE9YS6pkEwqSwAFKre/GTOFocdEQa7hEO7CeNYweNXKX13qZC8llrAXr1V7kptVY0fU/ET6mxJs3cWtBhPAjFUl/G3ZiYIW+oneAVntCZuLc8fkp1mc4CWltT7DTRt7s+CB+DV5gH3VYufkHLPB2gkQ4nsi9ZrbTrYAcQ+1BSXxTQtWuRidMIwWGMxM+kHYSlgvzIO3RA+8iB9xtEtmih3StWU9xokU2et4UMpj08iUPbe0PR76bLHnzncz857K5zUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjKa660Fh8XIC5VWjeV/p1RJCfTdPanwEzPrEQM6c2k=;
 b=y/7qRhfPekksjFaE5U0cF+GaEQJOy1BdZgvFtxUDhpyt+4nP7su43W3ffTgqeXSGhAycVHO42yK78mY/HT8jPGSC24SwBS7HZru4c2cNiAed530NUwSkU7TlYQMiZBFFcGjWBOjGBmJeZWcINAffzGDzW2V9Q2MqPPqvVFtM83E=
Received: from BN9PR03CA0153.namprd03.prod.outlook.com (2603:10b6:408:f4::8)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Thu, 21 Mar
 2024 20:44:07 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::2b) by BN9PR03CA0153.outlook.office365.com
 (2603:10b6:408:f4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 20:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 20:44:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:44:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 13:44:04 -0700
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:44:03 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 21 Mar 2024 13:43:43 -0700
Subject: [PATCH v3 5/9] drm: xlnx: zynqmp_dpsub: Minimize usage of global flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240321-dp-live-fmt-v3-5-d5090d796b7e@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e663a4-36e3-4297-63fa-08dc49e7a769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7i9EWg510ChJ7cgLQc1jgJtp6LIRVdQKnt1/SwbA7VCtSaX2zfDThabg92HPnHRYh66+e+LwpU3Oyl/0pzm3u9qcv4thNxHzeIibXv9LOGBm42Xdo/CMMr7K6NQ3JcRwYCu7TYqdL/u1l8INGf+oZvOrAewrKSKoy4MsYUVKWRf9/nJ74VkoCqHDwfkK03EGtKDetT3Uy3ZEQk6wKSgbzrbqYwnojx1LQzZMz0++TEppFSoHaTYgfkZvQ2J4hfPoQjmtqqRtBvCit7WrqSropZ2Y4RQsIJm07rsb/G1kq8d9eaDfJlNkBIdzGbcVg3+2/4pKBx3js3Rj/Sj7PuZEYPNTvaEBY0NXdld3R6kx3C5CvkVb34ht6dJLFLXVrqqcxH6/v47Svvq5N0TJQtQqGXDaxli+piGWI76ddnrTV4aRX3OYANB++r2GsitV0azzoBZs2dEgiRNIK/q0dPscJzR50vQDoFbMVrU2Z3ocZfI2WliSWzB7+vnP4g0MCsaBF+EyBP54jYRPmslMD2C9gsz1nwots6IiMQre3PiD85Dq6DgNnRiGhY1Kua9ZKm//c6l1y+aEOXhFo//6IN50HgYmCAA3/gcR1MYLA5v5FrbCnsJ1jK5rOlt1AbnGRS/Hh34TA04Fm5hOpw37s3ip2R+v7tcbyeyh45sn/HYE3Eq7hY6GMlnskKby3jL837QY8POl9f5Mgv2Bhg1a4fUDPGWTOTqH4Q0LGy6OeWi0y4wdxwEo5vy6gXiJgPWSFDmEnZ05WyTAaXtizhejqfOZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(82310400014)(36860700004)(1800799015)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:44:07.2399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e663a4-36e3-4297-63fa-08dc49e7a769
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
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

Avoid usage of global zynqmp_dpsub.dma_enabled flag in DPSUB layer
context. This flag signals whether the driver runs in DRM CRTC or DRM
bridge mode, assuming that all display layers share the same live or
non-live mode of operation. Using per-layer mode instead of global flag
will simplify future support of the hybrid scenario.

Remove redundant checks in DMA request/release contexts as
zynqmp_disp_layer.info is well-defined for all layer types, including the
correct number of DMA channels required for each particular layer.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index abdc3971b193..0c2b3f4bffa6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -980,7 +980,7 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 {
 	unsigned int i;
 
-	if (layer->disp->dpsub->dma_enabled) {
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
 		for (i = 0; i < layer->drm_fmt->num_planes; i++)
 			dmaengine_terminate_sync(layer->dmas[i].chan);
 	}
@@ -1006,7 +1006,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 
 	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
 
-	if (!layer->disp->dpsub->dma_enabled)
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return;
 
 	/*
@@ -1044,7 +1044,7 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 	const struct drm_format_info *info = layer->drm_fmt;
 	unsigned int i;
 
-	if (!layer->disp->dpsub->dma_enabled)
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return 0;
 
 	for (i = 0; i < info->num_planes; i++) {
@@ -1094,9 +1094,6 @@ static void zynqmp_disp_layer_release_dma(struct zynqmp_disp *disp,
 {
 	unsigned int i;
 
-	if (!layer->info || !disp->dpsub->dma_enabled)
-		return;
-
 	for (i = 0; i < layer->info->num_channels; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 
@@ -1137,9 +1134,6 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 	unsigned int i;
 	int ret;
 
-	if (!disp->dpsub->dma_enabled)
-		return 0;
-
 	for (i = 0; i < layer->info->num_channels; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		char dma_channel_name[16];

-- 
2.25.1

