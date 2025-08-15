Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7039B27798
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039CF10EBDA;
	Fri, 15 Aug 2025 04:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZJLiHwbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B494810EBB3;
 Fri, 15 Aug 2025 04:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW/RAlqsTgLEImRjpc0FnjINq+Rhh6n6hjla4991cIakgfiTeGaWbkFl6znjeXDc4NF8VIK6AqQH9SyvMDg9S9N7VpYb7ogcM4NNnLRfYo8+wZ2HdkZDYlRfI+GE7AaOHaK6XMUjBKPl8tPOSyxMYvdTj1VMHun2sV5z4c9fobEwJ88TEdColfgNGNo6U/qKgk+n/xxH6yrErMV3c0KMvWXogU+m/LxTyCnrfK3SXeu2mlM4iPOSvI0CB+x6rgGuQbnE6s87fz64fzXPzvsvAqSB+jTYofc+jY6dxFDPhAo1TNlpuY6sPJ5fssigrFCxPp8y0Hc+u2dwPSBUUdT3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNyPhwH3zDxDowkyjDjwgVnNL6OpBcPOJSKcpmsUxYo=;
 b=CC4HmRxGDETR+Di/Jqrlt4Bdw9cfJY+rRvoTyOKU/0JWe+6If+PBM7KPdt1pP9w23rUUusO5XU2IHG8XJMIHRS63+0eVbYBxZHdaiWlL+VMfYgZ/v71d5RjWgQYe5GOT9cFmYkPsaWtEudCqr3Wa2vdH22hrjjaeHAH+57T1GpjBPD7XhD9JxzIpXvTlP3qxkAYXO88idq2T22Yc7A6OKCfoA8BpPQiIkqopg9RRpuWnndJg6ZlbfZYQ9y2lUOBsoSaUaehL3nzH45fo0tH6d/HtYnE8utfiJx4/xjwLjfvsVm0ONtC9kDLl8bgAydjh+6DONZojM0oiUo5/jS+Fjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNyPhwH3zDxDowkyjDjwgVnNL6OpBcPOJSKcpmsUxYo=;
 b=ZJLiHwbPUHgYZF73DzV8EQNvgkme1Iy63mN+kFufxWo4UbwaQXq9fUMx3xOcnxHG4LCiNJOIYtPqHRELV1Sr7BfZaujPNUHe70rerT5K9jDycMcGwf00OiI/a/WEPG+Qbma+f9WEng+MCW6uGAD8kvPwkmnvw1m4Q6uXe9L9CLA=
Received: from DS7PR03CA0159.namprd03.prod.outlook.com (2603:10b6:5:3b2::14)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 04:02:45 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:3b2:cafe::37) by DS7PR03CA0159.outlook.office365.com
 (2603:10b6:5:3b2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 04:02:44 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:02:40 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>
Subject: [PATCH V11 46/47] drm/amd/display: Ensure 3D LUT for color pipeline
Date: Thu, 14 Aug 2025 21:50:35 -0600
Message-ID: <20250815035047.3319284-47-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: be58fc6d-6eb1-490a-d8f7-08dddbb096af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ovOjBTPNjtRDiNF2Buy8IUWUSoOcogCwX69Cti21eJBMUM4eD0xs7eytH6F?=
 =?us-ascii?Q?z4/Ti2I7r+SWY0y2Fpx1j5nPwky3c5mAfTn6ySW6jktAsNy4u9+kPCiJV12X?=
 =?us-ascii?Q?Yd+6sP+DnaEN990U/h+aChNpaQ3JOP8BrveqKxctn5LhZo6YD4M+/zbq+h3V?=
 =?us-ascii?Q?KB/q+DtrJzrXvmrcQJHNp7Jrpe03RNQ4Lny60gZoLCzwKloVXrbr7azp1/6p?=
 =?us-ascii?Q?G3z70ZTnY3alaZEBKtJ3nG3Jee3EWhVNaqBlOqpJwueqL/yKJPIiSlSGxH7+?=
 =?us-ascii?Q?xVUbGKQ4J8Ud6FXKoWG1l0nUcyvkZCdA1kLvS37jKXkjGSjH+D4VzvtV+5Ci?=
 =?us-ascii?Q?EVKaVgFKcVPE9UtfjCZ8O/KJym6WGXh476z7NkPFWs7jFT03wMLSnNFxhiWh?=
 =?us-ascii?Q?VLcPMmUE5rSex39862//q/zcBkwoddjS2p5weY8uhHzXj/OAs5zxj5xcTSP8?=
 =?us-ascii?Q?EzjvJmm4gOmzm0rg/xvSXY9BEqnlysEG7CbYvF7gqQuUqhwGwZS9RkwxcXsG?=
 =?us-ascii?Q?dNgEY1g1KsYo2TOKXBM8Li6YagbAYk+VPdHDTXE2Vo7l99efO3211n3FKyFb?=
 =?us-ascii?Q?QdleQmo94WGuYEQVwW9ATMUrwppr4VoSSXxtE/+nSiBqT/Bt4JqE7Vp2WsUq?=
 =?us-ascii?Q?5loWkwffhNuycEN9s1b2wmMtwdo73SUVy9RBHNrG5dKnA9T87M92cNTPYmhU?=
 =?us-ascii?Q?6DPJ2PZLtLI2Fos/dtJ/EDhfft8birCsRhaQ7kDyRx1dR3n9s50T7Fd4v9QR?=
 =?us-ascii?Q?Ik5aUcE3daTqiy2sy0QMZYxWVAtsdMDKwe90q+C3kVJNg/zIs8lIKWcA2UIp?=
 =?us-ascii?Q?rOxsIg84iRf6YlzdazONrT1/mi8W3jQt/EA1Z4Co3GJ85xMCegDl4dMIN3Ib?=
 =?us-ascii?Q?daKTF/grMMxbhovRDky0YnMsEGv9uOHa8iZ9B0UdwM+QRlZND6NRND+/f2CC?=
 =?us-ascii?Q?GYPnIPCFT2LSQAYW50DkUbfIfPOXtqvA/qw2Tp7JZmRDGPJ3YdUUCBn1792k?=
 =?us-ascii?Q?e315Y7NjEkrdOSYi7YYoGrCVOvPfsvyvDUJLCAqRbL8BpppDWV4xoxeSh3yt?=
 =?us-ascii?Q?753U3wos7NDpNsxnGHwpLSaYss4rOut+hGwh3jF2OWAmB/F6LAykDQoH+2Vo?=
 =?us-ascii?Q?3lov1adhRyPgi7+tanypNAdt1NjFAMpbwpe2pH1zhTtlMVjsk7985TwYThmD?=
 =?us-ascii?Q?U2pCKUeBW4qnYSE7LynTvZ7UFEhFtZwgxQvc46O72+JEWU3M2/lzhji/GdYo?=
 =?us-ascii?Q?4t8WTTNn5Nrf7YfXCrh/6LffvoHynztTt5VL1QlmvYbcPPdP6D7zQJazaFef?=
 =?us-ascii?Q?wJUuTJ+EwKOx7WNv/utjPrXzuKq+L8vmaht1cnQ/da/vRYtjQ5/D6RSjtzPO?=
 =?us-ascii?Q?8IsegZoRnJWGB68nqOo4L73FpIbpdYli+at9uBHuZwDX12MBuWf59o9q7Xgj?=
 =?us-ascii?Q?SbZxGT6O3wmebv2C5AyZZ+1fESzm0NI09OblbqiMvtdQGlSGS3LTXNAp6Xrd?=
 =?us-ascii?Q?KFqw0klh4iFP8UAm36u4f5hBOfvlXJ0xIMBN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:02:44.4748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be58fc6d-6eb1-490a-d8f7-08dddbb096af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700
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

Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops in
colorpipeline and handling these colorops.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v10:
 - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops
   (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  47 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 103 +++++++++---------
 2 files changed, 78 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a91ca66d2f56..d6434472f486 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1828,6 +1828,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
 	struct drm_device *dev = plane_state->plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1860,32 +1861,34 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve & LUT - SHAPER TF & LUT */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no Shaper TF colorop found\n");
-		return -EINVAL;
-	}
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D Curve & LUT - SHAPER TF & LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no Shaper TF colorop found\n");
+			return -EINVAL;
+		}
 
-	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
+		ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
 
-	/* Shaper LUT colorop is already handled, just skip here */
-	colorop = colorop->next;
-	if (!colorop)
-		return -EINVAL;
+		/* Shaper LUT colorop is already handled, just skip here */
+		colorop = colorop->next;
+		if (!colorop)
+			return -EINVAL;
 
-	/* 3D LUT */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no 3D LUT colorop found\n");
-		return -EINVAL;
-	}
+		/* 3D LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no 3D LUT colorop found\n");
+			return -EINVAL;
+		}
 
-	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
+		ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
+	}
 
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f89a887c6b14..f205f3c31f6a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -31,6 +31,7 @@
 
 #include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
+#include "dc.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
@@ -55,6 +56,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 	int i = 0;
 
@@ -108,57 +110,58 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 1D curve - SHAPER TF */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
-					      amdgpu_dm_supported_shaper_tfs,
-					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
-	/* 1D LUT - SHAPER LUT */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D curve - SHAPER TF */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+						amdgpu_dm_supported_shaper_tfs,
+						DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 1D LUT - SHAPER LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 3D LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+					DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
 	}
-
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
-						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
-	/* 3D LUT */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
-				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
-				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

