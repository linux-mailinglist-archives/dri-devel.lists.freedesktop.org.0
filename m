Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6C957646
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC02510E44F;
	Mon, 19 Aug 2024 20:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rZtbpHqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06D510E3D1;
 Mon, 19 Aug 2024 20:57:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT7Yaxp1aVMfklanrmqRhce1JuXzo+I7AoRtzM6dHHrWT7kpaSHyusBfGtNqy7Gd09Dz9jiFMKdoHEPXDTdzIcKrvMaxmBvM6bcnvWw2cchQPwghX5vfvkpvS4EMOxYmARMkYAfebZFNYzB5n+igOGVAwmDP13epF/FOSPF42dFzSCDxzhAYLT2O/GmPsl8xKIdxquYoc6NdEEuueeiE4z3sNZqcbFnmcOBJETzP1Onkk3i0B9XnslnH1KTNxTf8quWvfOKfQfL0VPQVvggRLhlOvKgY1QD6OQ9XKRy9GmafU6bEUJ0YsqOr/7NnaIacT3XgpnkfjlAJzWRQ+n3kSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/V/0uHTEY+/605ODH4no38YrNyer2g9T7b8S88DPVc=;
 b=LWKKITMH1+anLho1BbkdJvgvBJwMkC0QVhYpij/GI/1QVpyELpvZv3HWdOQtn5H7DCAFLYLAJWYwzZH+CVnIT4lLKl/gQR3AoC3trHahWhvmhT+aliAkHGDO3Su8HZm1vy2e4aMqhwNsSLtP95losXG6Q/7snk4MSOHDuxw6AzYouuAPgwNpdTQAlFxVBXUkJAPDCbczasaHxFi6kslOr60FzzCOnsmBC6MgCsEx9S0Z6t8YTvpZcQZjKmXDjZB3NuVBdTdL3E3DT6UbpHqHMlirp8rpb+6yL/drqlCNCBGhFACKzqXueOzWJTh+/EUChzFgnGlHcyWWQjjieRxiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/V/0uHTEY+/605ODH4no38YrNyer2g9T7b8S88DPVc=;
 b=rZtbpHqIXWHia/Qtnruaj25d3c07xYJty/o3Ja99NVhtQkxALA16zMiV14yYrMHOXtfg/6yhfTAOtwnEpdrTlQzz8IFvx1rhxbEtYVhANCbjxSN2DQlc3ORLhqIvG1eqwLZxFyBmNOPMrRhyq8Pxf0qxP64bbdt/4yYmjXKP7PU=
Received: from BN9PR03CA0528.namprd03.prod.outlook.com (2603:10b6:408:131::23)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:47 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::63) by BN9PR03CA0528.outlook.office365.com
 (2603:10b6:408:131::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:46 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 43/44] drm/amd/display: add 3D LUT colorop
Date: Mon, 19 Aug 2024 16:57:10 -0400
Message-ID: <20240819205714.316380-44-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3b6066-34e9-40a4-3a4c-08dcc091944f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IvezwRDTn2sEKxdbif3hEZvro3yROUnEgebobmk48CjHvLqYR6DZmeEmdHCm?=
 =?us-ascii?Q?vrn1O5R2BzzpQIFw0D09W+ztfiMf6w2V8PbS52ZnxrMS8rbuSVSR2kZSK+ps?=
 =?us-ascii?Q?foTMTgmDz8N1EY0t+u8501utelfPhDhSsPiREX7ziC+zJa/xBAvdH9XR39N1?=
 =?us-ascii?Q?12Fd3PygYRkH/Sn2FrMj+u4B7N/GhFqh45kmwAgXQfDWqjFuWlW20uMeN98s?=
 =?us-ascii?Q?2FAhM9j3CFY5qibHxU44sZxSsLWvZQZQpE3+PrOEXNGq38vBMIdhp0Xrmz/p?=
 =?us-ascii?Q?DevTHtdfhp+0aMdhwhpP68WgbFJLLA/aPDSiDLTYV/FAQ9kOtDZYwH6xrjCg?=
 =?us-ascii?Q?NuyV6WX3ywEghJeQucZ02mvM5f+xiMfCCazmtjEjRUPlhuv764vXGVY+zy2e?=
 =?us-ascii?Q?32vHjsjmhzNRjkewB0zdMNg7spM7Wiurw/QmSMSg7WHzXvIZwKCUh+fh98mo?=
 =?us-ascii?Q?8HL1T2wG4IkBPYJbNU0gc8qTFaeYU7OySUkQkfRrLMM9sFAVL7RSIiTSez5H?=
 =?us-ascii?Q?VMqRxfEIleqB3bX0uYNzShsMa2AGsVASeX1RGxsjMWOkEdKhLTVFr3StP0te?=
 =?us-ascii?Q?uUvyONQO96QzecVRFdXMHL7effDeUdS3dF9Tlb+uVoqx9p6c3MF9xaBBzK8O?=
 =?us-ascii?Q?f3tr+GBDDzDmf/3rxbcJ7JdBVP1FvaShx4XRf4/kH6d6Jn6R/uXPSpjWb09C?=
 =?us-ascii?Q?7lbJZBtAwoeFcv76vbWSavKJI5XM3/LNLJEYTdSwWPSxWaip4Ub+yyLwZ5rf?=
 =?us-ascii?Q?nCfMljCCEik37VaLCzRL3WLhVK8FoeXyWEmIYnWB1IcYQ3VsHF/5AuHmrAlY?=
 =?us-ascii?Q?NYG8u8tsMZg/j6FrzRwLjwY2021t4fe7GR0+dULnrGSuKKFQkt5f/5Ff965d?=
 =?us-ascii?Q?l+g1nFgbiLk11Q4qOKu8DVR1VQtJ76hzE+XzdTPr9NhEnHukz16HApuat6J8?=
 =?us-ascii?Q?z2H5KbHjkCeGSln8pKNQhSsY7JsdIjvmu2ddXfMi5c6SXTmHmAmODqN7PhsO?=
 =?us-ascii?Q?UXWn3ijYfcJ/hmbT+92IIE5lYCQlAje4zqvc/yuQqlfPVo7viito9tzruiUF?=
 =?us-ascii?Q?HVR20xcyves2gmSOxGEtxfD49NMlHfX+hZPDjmci7cDZZ4eWWlDVZBzDuJCs?=
 =?us-ascii?Q?rnoBYh/hTCx3AFKnIsqT94jpsLeb2tU9gJH+wTixgbZMtQ16ukmiYie0YjKi?=
 =?us-ascii?Q?yuW+Okm7QTaj1o5Aqa8wNu39IB3WyAU9vZ57cpXviwa4jCPknoi4bikMj+bl?=
 =?us-ascii?Q?yg+sTkolvYI7THFg3nOJ7pPJQJziBqF67TFJZlAxigBalmoiPIwmcD/pILrH?=
 =?us-ascii?Q?0+2y4FWelW3eYOtaTLPs1FAG22nn6AUNkHuJLlWb641Ik8wfah5FLQba6Gev?=
 =?us-ascii?Q?mEJIWwPPbgzFGHQg12S7NNNdsiXESCcsqK06nGaRLd+Gfg77V3BvpW4ggclk?=
 =?us-ascii?Q?6CXjmCtUHQ3cXwn5XA0Iy7ZaqVOt/vng?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:47.0153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3b6066-34e9-40a4-3a4c-08dcc091944f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599
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

From: Alex Hung <alex.hung@amd.com>

This adds support for a 3D LUT.

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. Multiplier
3. 3x4 CTM
4. 1D curve colorop
5. 1D LUT
6. 3D LUT
7. 1D curve colorop
8. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 113 +++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  26 ++++
 2 files changed, 136 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 2f0b06fb5f81..cc3d68d1386f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1283,7 +1283,8 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
-			      struct drm_colorop *colorop)
+			      struct drm_colorop *colorop,
+			      bool *enabled)
 {
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
@@ -1311,6 +1312,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 		__set_output_tf(tf, shaper_lut, shaper_size, false);
+		*enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1338,8 +1340,101 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		shaper_size = shaper_lut != NULL ? shaper_size : 0;
 
 		/* Custom LUT size must be the same as supported size */
-		if (shaper_size == colorop_state->size)
+		if (shaper_size == colorop_state->size) {
 			__set_output_tf(tf, shaper_lut, shaper_size, false);
+			*enabled = true;
+		}
+	}
+
+	return 0;
+}
+
+/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
+ * @drm_lut3d: user 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @drm_mode_3dlut: drm_mode selected by userspace
+ * @lut3d: DC 3D LUT
+ *
+ * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
+ * on DCN accordingly.
+ */
+static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
+				uint32_t drm_lut3d_size,
+				struct drm_mode_3dlut_mode *drm_mode_3dlut,
+				struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size)
+		return;
+
+	lut->state.bits.initialized = 0;
+
+	/* Only supports 17x17x17 3D LUT (12-bit) now */
+	if (drm_mode_3dlut->color_depth == 12)
+		lut->lut_3d.use_12bits = true;
+	else
+		return;
+
+	if (drm_mode_3dlut->lut_size == 17)
+		lut->lut_3d.use_tetrahedral_9 = false;
+	else
+		return;
+
+	lut->state.bits.initialized = 1;
+	__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				lut->lut_3d.use_tetrahedral_9,
+				drm_mode_3dlut->color_depth);
+
+}
+
+static int
+__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop,
+			     bool shaper_enabled)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
+	const struct drm_device *dev = colorop->dev;
+	struct drm_mode_3dlut_mode *mode;
+	const struct drm_color_lut *lut3d;
+	uint32_t lut3d_size, index;
+	int i = 0;
+
+	/* 3D LUT */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
+		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+			drm_dbg(dev, "3D LUT is not supported by hardware\n");
+			return 0;
+		}
+
+		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
+		mode = (struct drm_mode_3dlut_mode *) colorop_state->lut_3d_modes->data;
+		index = colorop_state->lut_3d_mode_index;
+		lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		__set_colorop_3dlut(lut3d, lut3d_size, &mode[index], &dc_plane_state->lut3d_func);
+
+		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
+		 * with TRANSFER_FUNCTION_LINEAR
+		 */
+		if (!shaper_enabled) {
+			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+			tf->tf = TRANSFER_FUNCTION_LINEAR;
+			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+			__set_output_tf(tf, NULL, 0, false);
+		}
 	}
 
 	return 0;
@@ -1468,6 +1563,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
 	struct drm_device *dev = plane_state->plane->dev;
+	bool shaper_enabled = false;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1508,7 +1604,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop, &shaper_enabled);
 	if (ret)
 		return ret;
 
@@ -1517,6 +1613,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (!colorop)
 		return -EINVAL;
 
+	/* 3D LUT */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3D LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop, shaper_enabled);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 05fdec7c28ad..a81f81240341 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -47,6 +47,17 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
+struct drm_mode_3dlut_mode lut3d_modes[] = {
+	{
+		.lut_size = 17,
+		.lut_stride = {17, 17, 17},
+		.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+		.color_depth = 12,
+		.color_format = DRM_FORMAT_XRGB16161616,
+		.traversal_order = DRM_COLOROP_LUT3D_TRAVERSAL_RGB,
+	},
+};
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *op, *prev_op;
@@ -135,6 +146,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	prev_op = op;
 
+	/* 3D LUT */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_3dlut_init(dev, op, plane, lut3d_modes, ARRAY_SIZE(lut3d_modes), true);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
 	/* 1D curve - BLND TF */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
-- 
2.46.0

