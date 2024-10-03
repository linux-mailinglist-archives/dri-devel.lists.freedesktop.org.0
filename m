Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532F98F7D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBA410E92B;
	Thu,  3 Oct 2024 20:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qG7H8w5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243310E999;
 Thu,  3 Oct 2024 20:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnohC1gyFIlXSmALGaMbv8SAdKX0mQievQYaOaNFuX8rfIS9zLYfbmHEfyHkuOgXYuNAvYCGUPSW9UI5ygZ/uxUuIl8z7vNmDy0MgnSqJwInSDT+6YGzxf2lQrif+VVzp6uGJXVxilM3qkdubssEzjAZRpYP/L6Lk3Vzx6Ki+HN6fYiXhYPZPYiZW1TVBDQnmruhWty4Z7r9ezYsHNr81bEe7+IrpRwY9qhXsR1W1kYC2ORG00/V9cTStg1hwEf5LVCbKB+WXPm6pH1O/ehu93MzWSqAt6RhBTsHzMQV9ccoy0HiI7h2hwea0TLO6QR6iv34krtAzcilMeTt0bioYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMZ3u+T7x38oaJ2wsoNIKpL3tRsotwfPOYjDt9F40wk=;
 b=q4QZQi+ucORDn6DxpfrnKaji7qf7LnITaWM5e+AroxIILatfHX2hExr9nIKYkKm+Cs0DFMBkPKWOf62Hl9XpqOfcXV2eXqW39iH8Isu9d58BlP+x6oEfNZQKY0qABxmDblbMf6UwYJGd0yEHiKOdn4N8JwrIBejtmH3wVOA5+hNS4hKOSdwPyTckN0z1H2HwPGkJdMhp4+o0DhLMIw2GmjachwXjGTt806OR8Mo26w4pCmHp4frOlEUudZPkE72z8fk9VaALUeSdAHLvg4AJ5FjauH5o2ygtRDgHTgY1rrFbB62MI/NW/5kifDIRFL1LHnitGQV/gWPcQ42BCKZQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMZ3u+T7x38oaJ2wsoNIKpL3tRsotwfPOYjDt9F40wk=;
 b=qG7H8w5ZtF+PIYgS1YJ5EfhKGSJc/mfDpKDRVGPw3X4GgNqxTJts7RFyKte6TKYw2mj6soVOo06nkopK/2IsP0g1gvG3t+ni0cWjR4RdtPrbPScM2vqdHW9gZh8rJ2SPQPeg/usLLDPpTx2AHlGVBdejc57oco6jwfH6jYLObR4=
Received: from DM6PR04CA0013.namprd04.prod.outlook.com (2603:10b6:5:334::18)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Thu, 3 Oct
 2024 20:02:03 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::26) by DM6PR04CA0013.outlook.office365.com
 (2603:10b6:5:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:02:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:58 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:58 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 43/44] drm/amd/display: add 3D LUT colorop
Date: Thu, 3 Oct 2024 16:01:25 -0400
Message-ID: <20241003200129.1732122-44-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f07f55-e9ad-4133-6434-08dce3e63f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zWYbEb0KMoF7XJJ81qb4qyaljtyKxGfBLqnICZOmoiD0+6LGE9y/zT61BwNa?=
 =?us-ascii?Q?6+RQbiIJCyPIgoENh953XikUHZvQJflIBPEG2HgU5HplF0JY6PCWRmP0dAn/?=
 =?us-ascii?Q?OYmqulUAu6x+4XNaF8VBCJG3mAIxuB82VYECjhil5LZl7A1t60liPbSglizl?=
 =?us-ascii?Q?2f6TTtf4z90U1SGGrkEXrLrxsj3i3qlL2LJQUZpbsk6PTRhumW0SHreozTCN?=
 =?us-ascii?Q?0BRHgwB7Tcv0yVTLqmqHd44LBiJKDu8Jo8Hd2G2XbdAbHCA2r1zZqazbKaJM?=
 =?us-ascii?Q?bWHxdnSv4P3naRm8d/56VSHZ1DayAdZW3p5PM8yjr5E45lZlWP0rYypnlb8V?=
 =?us-ascii?Q?Vw0ykC6LPDtC9slbtblYoIDipdvRo+OLA3ZTbjgv3Fj8KlzExW2vddE6WxE+?=
 =?us-ascii?Q?EEcDmBzAe2fNCkKxl+u87C+kOjhx1/RqrOtSBYS70AzZRRWQ0JbWxM7PZhDU?=
 =?us-ascii?Q?rJjxV4wlrPdLNUgbX1NQ/GoACYcuz9A+p7yTtsS/3edY9XLX2ZqlCW3B5NOD?=
 =?us-ascii?Q?cq87QQexVsZv+xMCNUY+GpN9etV0OYEZ5zqtRUd2Ow88lglVTj0qvtA2VEpM?=
 =?us-ascii?Q?zWiXBge7Cd9wtte9IA4MhdsdFxDwwBPf13Hlt9vxw8UwWI3bur2r2RV4B8hQ?=
 =?us-ascii?Q?4h71Vx/2G+v6h1h8ulWb+9zmO3ACO95bMuAqEBtdQPZeFXYbtmmoLOXLV/l7?=
 =?us-ascii?Q?//wB0wiaMNA8hbzOR/zHp9GWR3KXY8lmL77TTMcYXgcmlo3cEKOPGVKYT9MQ?=
 =?us-ascii?Q?crQMMqFZMv0vjqOg/60T8IaGU6TwRtoYbdmVQJCgZJ8zYXmk5zoLNGpPwyIv?=
 =?us-ascii?Q?rCmE8WvTsHzrOli6gxJDJV2p3e4EIMr9TuZOgMz4j5VlYFGR00iLyGeXX+iZ?=
 =?us-ascii?Q?c6Xpn/k3Z25Qy41JYABocFTBryldUVlTg7AXw6r77Tim/jU+UMmmgdEjRTKB?=
 =?us-ascii?Q?wl002PWg+0xby3uVJZok3obUVFar9aMI+Zi7n8yyt1Lo6KUFYJHx9jyi8gIx?=
 =?us-ascii?Q?KD81TP+2NzyuWxBTrIoX0O8jh/JsOyHCTzEwpGenkL+O9kU3v5vcQL0E3Crc?=
 =?us-ascii?Q?WNbaFWOeLUWsbNRHkeHgsmwjAYV+lMkdmBlQIBpHwQcL/PzaFz9dgq9oEv3m?=
 =?us-ascii?Q?9A1DXeDYMUuw//fZ3U+S9J4jlmEujshbQpqVvnhqY3SnvkYsKgi8+iVEpfu1?=
 =?us-ascii?Q?lR2JvSm0ewdTHbc1om0HSlcC4wSKXQazV+NBySjooQKsWqIg8vZy8YEyY0x/?=
 =?us-ascii?Q?ApYXNfqb/ri9wgrT5XTQqDUqfzmyGg3NPh60UZWl5Ci5WpfOGUwxKOx14PYe?=
 =?us-ascii?Q?MjqvzBD41jY6QjPaqymvOD1qsrtQ+ejqIBWORQmAwC3bgvQOLfhA/FQwO3lo?=
 =?us-ascii?Q?TxfqfVNTewY9yBfGN/vC3k1cI1ei?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:02:02.7911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f07f55-e9ad-4133-6434-08dce3e63f9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266
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
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  27 +++++
 2 files changed, 137 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e41329cffd9e..3814f6fce4a2 100644
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
 		__set_output_tf(tf, 0, 0, false);
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
index 22bddb45043a..645b7a28445e 100644
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
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -145,6 +156,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3D LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_3dlut_init(dev, ops[i], plane, lut3d_modes, ARRAY_SIZE(lut3d_modes), true);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.46.2

