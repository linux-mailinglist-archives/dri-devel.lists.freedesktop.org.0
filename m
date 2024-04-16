Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DB8A75A2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272F9112E55;
	Tue, 16 Apr 2024 20:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HPzXMUro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6CD112E51
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gADZ7wfsFzF9QnieQD0WKuCmp56dTnKi+sWm0luf1E8yoItgVtylg91xw931Vo4Xep3xTcJuhh2BWsi+fnHlJhMSqD2Ug8BF0xMD0+8jCNuGSTY1v9z1q2uGfFdjsnj7NvOSbp9kqvVK0u0ytvFWYaUQYZOB+bHypszaIdyNaEFsDHXAxe2rva21ZUv3lGqw7eCHfHZsCB8O13/17IrXkSsWtTdlvlmDt/TFLJSo+ytiRhH+l+ggbxCvrxycSahH3uD+i/hf7a+r8IA9L4BXDjo+O1icsGmA2S1vGB+ylFHFcr6z5dGv+BIEv73zWg3cEcbaji2u0zd3qVIdoDhVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwSfwu+mLADPdCZDXGU6Dt5Ba6S34HX3cnX0JXk+hpU=;
 b=ajdPIjScZq+iiYMlkK8UqIIZUQJqP88Q0wzs7BdVNC6ej80MvQB8RRtGx231H/ZcxIp00ymAyI+rLN7tLKxj1e+FoaqobAHFObAe+8MNy9YNjSXpLaVw8/P3hujGBH3MO4detZq5pOTjsp6kvj+51+7+w847PWYrklAbpIa8yfOyPdEqChj9J1nOKouGth0zBo9FEFGMNssxHy0nHg6UeEDMJ9SIxrYjvpUsjM26cKcQSYJS1UlU6TWMa9iccCKZaua5IMBYw/V52gEIE6RLnRi/gFJNrXFR2D7NeQjmFY5bxuFgaxTca66NdGKgiCLitVt8gqZctW5oUbRiwu17+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwSfwu+mLADPdCZDXGU6Dt5Ba6S34HX3cnX0JXk+hpU=;
 b=HPzXMUroPY9gs/8yY0kL1tIm5XqvKehCmoeF/hWPZPoYeJ2mCSr4vOPQVJZnhc8rdQfzRQ5jVUUFByVDhuS75bCH2WZnYZDKh20ImspUrcpUvievydQzJYDWwICMNamM3tNaDlpsictw17bMdqAWwMo6Uplqqi5Pv1oB7dkmhYo=
Received: from CH2PR10CA0010.namprd10.prod.outlook.com (2603:10b6:610:4c::20)
 by CYXPR12MB9386.namprd12.prod.outlook.com (2603:10b6:930:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:31:56 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::17) by CH2PR10CA0010.outlook.office365.com
 (2603:10b6:610:4c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 16 Apr 2024 20:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 20:31:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 15:31:55 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 16 Apr 2024 15:31:54 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 16 Apr 2024 13:31:38 -0700
Subject: [PATCH v4 3/7] drm: xlnx: zynqmp_dpsub: Add connected live layer
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240416-dp-live-fmt-v4-3-c7f379b7168e@amd.com>
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
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Tomi Valkeinen <tomi.valkainen@ideasonboard.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB04.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|CYXPR12MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c41dcce-124a-49ed-4c68-08dc5e5442a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+3lSBZHv44eqHItZ7JrikSq7+38vZ3InvjXQ9pnZNCSb32SBmouOpyP18UjQC9UvLrvUCCiOb7Ap4JIYQewrdp/HwbZ/xVPFyvwDh9xAX1n1LPSTL5UP68R+aiAVFNwmFTyCiVcGKif3+IQwrAHRPBcIQLoh5viIrZ/I+XLEMWo9eRdPSFic+SWeGnee4e/LqiiQXhWJn6Cnlj/mFOZnUocH+UdecYbtYp7JGNlyuB/vYxYCjGFzCNoPmMT+TxAlUr+oc1LQ6++v9LId3hWh74VQ2UInCcuIpK7JNwfb7fRX60iu98pEoqv55arevPYy+JRRpDdsbERQ5ElFpqB9pd0cMWBgjIQrIEVwV03FfPfemaL0ecMhjcZCRydrT9uBbIjXjCAoCEYkUL9POSbeLzUjGWXDn3G9OeF9iUGpRM7pTVt4hFQWhg1K8wke+mLoRNhyHqZ4sRfy/1jm9l5vM8mXvPSKaTKHLOI8RLIUCKjxWEZrcBLoLwt9k+4lM/NMFLKtK56z4rjqSqVHWiURf8t72C5u47FDdHJQufWiBtVt5OWjZz/BdtQIOcvElSW4LZbHckWUPOKQ/t/4cPcoo+Bu+WDlnYL+Fhe+JVDdTYNLqHG7yoXqp72sViA7t1qHgpUvSiAlX3RwMFXBZrqxVb3acqtMjxJZfVwhh2jv0Q4eNzEEzQ6TrEfAaVMCaiQraiBKajoOxUr88YFmv6YSr+f72lHy4lupOqLyRlEguVOYbbXdkFPsb3Z7g6KiFyGgpelhG25+r+LN5TWH1nYEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(36860700004)(82310400014)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:31:56.7339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c41dcce-124a-49ed-4c68-08dc5e5442a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9386
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

Add a helper function capturing the first connected live display layer
discovery logic.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Reviewed-by: Tomi Valkeinen <tomi.valkainen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 04b6bcac3b07..7faeb010e1ae 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1276,28 +1276,40 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
  * DISP Configuration
  */
 
+/**
+ * zynqmp_dp_disp_connected_live_layer - Return the first connected live layer
+ * @dp: DisplayPort IP core structure
+ *
+ * Return: The first connected live display layer or NULL if none of the live
+ * layers are connected.
+ */
+static struct zynqmp_disp_layer *
+zynqmp_dp_disp_connected_live_layer(struct zynqmp_dp *dp)
+{
+	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
+		return dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_VID];
+	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
+		return dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX];
+	else
+		return NULL;
+}
+
 static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 				  struct drm_bridge_state *old_bridge_state)
 {
-	enum zynqmp_dpsub_layer_id layer_id;
 	struct zynqmp_disp_layer *layer;
 	const struct drm_format_info *info;
 
-	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
-		layer_id = ZYNQMP_DPSUB_LAYER_VID;
-	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
-		layer_id = ZYNQMP_DPSUB_LAYER_GFX;
-	else
+	layer = zynqmp_dp_disp_connected_live_layer(dp);
+	if (!layer)
 		return;
 
-	layer = dp->dpsub->layers[layer_id];
-
 	/* TODO: Make the format configurable. */
 	info = drm_format_info(DRM_FORMAT_YUV422);
 	zynqmp_disp_layer_set_format(layer, info);
 	zynqmp_disp_layer_enable(layer);
 
-	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
+	if (layer == dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX])
 		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, true, 255);
 	else
 		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, false, 0);
@@ -1310,11 +1322,8 @@ static void zynqmp_dp_disp_disable(struct zynqmp_dp *dp,
 {
 	struct zynqmp_disp_layer *layer;
 
-	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
-		layer = dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_VID];
-	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
-		layer = dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX];
-	else
+	layer = zynqmp_dp_disp_connected_live_layer(dp);
+	if (!layer)
 		return;
 
 	zynqmp_disp_disable(dp->dpsub->disp);

-- 
2.25.1

