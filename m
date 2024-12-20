Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E021C9F8B86
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E22C10EEC3;
	Fri, 20 Dec 2024 04:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZQI8C24k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDFA10EEC3;
 Fri, 20 Dec 2024 04:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO9eCUAp2Iudnby79GC0tiucyS8ZEOmct5TVV8zZdM+r83HzW4n2SuAiBJCqs4gIiQIAx5s4kV/GDFX86j5FOjl3xdjLa4f7zwSPFmZfT/TnlIjaRc5kIE3f6DOIGyGYc8jal1wMYUslNSUqMYXnGPRZ97wb3PPlt+hkUi8ErMYGLXCwYtgfblpjTAQy8qPZL3Sb3C6f+GKnGWWb95w3vgt9+dngjnSJQVvwPrY/fj7NdODAC5Lyca+AjH2J583QcIy8cK7KJhldXjZH+IT3LU9wtbGR88GA/xK8C9y/CHBj/f0cBo0mHaZATx0ovqiifNo4T3Kt57I+rTkcYPl1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAVBZsd23BCgpSx5sdeir24JUkThGzfrMTXajUaKXbM=;
 b=jfz/VrLf4B76Ue3q4KKaNac+UBn3z7Utqf03AuAMsByQlO5lnsEaUPrk1rF0nj4FBDN7i5GVcpdffXeIr0EDewXQ4Ba/yaiWTvkAoXb/wMf4F2QYGonEyFcI3T5bUYhajVF/JuD8e5fB9xPrMlDfjeCqEP7CXy+ty5BGAJv1+1TUSZ9RsF0dPEhubC7W84yeKCJptTdzokpAiHjIOWlfti/PtYSwTV1eH0AxA54LPolbvTRsDt/yj4NJB/Xg4cyNx4oMOAfQ8m2IPdmcIXK2XBMAYdhZu+fe/gJDzv8FnQRaRI1Do9M6Vpp1KVzfr7T0wt2/hqJPiAlA3l/5zi/jwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAVBZsd23BCgpSx5sdeir24JUkThGzfrMTXajUaKXbM=;
 b=ZQI8C24kEhKv0vXzjKquztibrs0CXBiLQNAtUmw1nLxH0iT9PVrn3ueFB2gllBCMlGTQTgnFRbwR1M+mqi2r+MIgE9kOfOi/OLYu+yumH4jVsuI2Y9cWSS+WyCIWC81dWCnymFKCNEGRIvKnEg7K6emkWKDuGaNMv4d2WXHVuE8=
Received: from BY3PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:217::34)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:43:25 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::f0) by BY3PR04CA0029.outlook.office365.com
 (2603:10b6:a03:217::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:43:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:43:03 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 30/45] drm/amd/display: Enable support for PQ 125 EOTF and Inverse
Date: Thu, 19 Dec 2024 21:33:36 -0700
Message-ID: <20241220043410.416867-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: e0746e8e-aad4-4662-8d9a-08dd20b0d6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?soMB5zjyb2jX39mKHF35OkQsqOuG5P4zuwsNlQw1jpJKUC50r+9NaF1Y7Q3J?=
 =?us-ascii?Q?QiCLP6kkWBVEfqOh80Xjc69oYb23ZYkCDoEkkGz0nXcCm4psiIvRzKOT5ral?=
 =?us-ascii?Q?wSSWL54qdyftCRbXN9BIDCIeiBUfCKpNDEZgeP/ZJWAFVj7AX+nnSJDE+q0Z?=
 =?us-ascii?Q?84r1q7ipHdBSEX/6/EylzAVNW2I7iTs/EI1ng4Vi7SVv1MNbDzL4qOE4cl+h?=
 =?us-ascii?Q?/SVjfsEXTjFy4lrjrXIwt31rM3+2NmGQtt/aH+gLjNtCyts3REfuRhGSSEd3?=
 =?us-ascii?Q?nu1EYm4Pu4OoVMIBamy0cc4TvDVD78cSLs3X755PSkvRIcqgGV1OgRwWzD2g?=
 =?us-ascii?Q?0lnGbHH2q71l3InHM0m5ocEpJknV8XecXrPIL7bTkZRExUjQHHStK+DOiLSg?=
 =?us-ascii?Q?eIgFM2x6Jzbaj4FjSTWiD1GjLpvkjx7IuTwRQj7GJnHixyYEq/87MnZl7sz+?=
 =?us-ascii?Q?7SpyK/7LeP/t3Tew+XW3O0jvSdmaUNYKzqzJXIjlvy1O4FPIEt+IMikd9UuD?=
 =?us-ascii?Q?IRylYhjLdWaDYx/KxLHQueEBcgtdT645naYcgZaQCqdVMlbbBNDS53yidg36?=
 =?us-ascii?Q?P9kYsVg3WHpSD6WuG5ubas3TmJiGN5JhFJHvzcmwgVW90Xhrnh3aLneHr1yV?=
 =?us-ascii?Q?Wfy3ZCILqQjZWpIEfY8XPVBXs2XnDX8WR1O4evdwwuThcEf/6CnF3iWeTbip?=
 =?us-ascii?Q?1ZnOGFl3lbKIqXXlScxtQYADRMq/mvOVoJ2xLffyoxIBTL42Qr5hJ80xnhoa?=
 =?us-ascii?Q?jOM/6D6r2NvxFabxExqb/ZjSVo8WE2Ulxc6ICfH3jDt3I1lgCyrkXtccIqAg?=
 =?us-ascii?Q?NI27fSUQuE6c7EGltXch5pkxxEAY/XacWG9rQtojE3vLuaNpOddSph5CtnlJ?=
 =?us-ascii?Q?Elzq/zwEG7ti3lyQQfuHthKo+xTq1BiHSjYAI9y7jAPBjKIto8QKRHeVfNGI?=
 =?us-ascii?Q?wtYec/nbNPl04czm/ACS7ACbtVof4d/aLEKbK9LayXnlqWS6/6cKFKIwqjs5?=
 =?us-ascii?Q?VodxtCevg+XwZdketaKVb9eR0iuwTwXL14oV5Lb97XkU7jJzZrz8IeXhK9RV?=
 =?us-ascii?Q?/GbDplFUcOb2uIC4p8Z9yCWjHpPenIzdBh6sYlZLQLdq0jMmLOV8mYS+NPpy?=
 =?us-ascii?Q?83ZDvM9bY4mYkSsJecMXlJObwQ1s9YOToinzcidgY7u55IAyDf8MO9Jm3JSF?=
 =?us-ascii?Q?/btgSPFOtgwvTN69W7RlfpNGcvvRV4ltFO7MHK5Ef5R2AE5ye16oAqKkMO0K?=
 =?us-ascii?Q?laa27/j1wZnygOOBPPyccObuQ3t9v3+hASQN+gMObZ+PvDV77/Gbs8Ynpiec?=
 =?us-ascii?Q?OpjlyuD7O37IxZILCddN16BuUS/3Vk4A4aIluE7+rLFUsGaoYZixMjU8g1L3?=
 =?us-ascii?Q?xxN6bs23geJs5gtuxdPtkHImGlRKryi36wKlczAxPTVL5zOiFCoByVSLHLJ8?=
 =?us-ascii?Q?l/BTA1/Y2QeobSIycV4t00kMN/JxTSKmCVSV3txPajaVK2OG7IL1LngCPVLc?=
 =?us-ascii?Q?PPxCpvuPWeur+kM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:43:24.6717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0746e8e-aad4-4662-8d9a-08dd20b0d6dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094
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

From: Harry Wentland <harry.wentland@amd.com>

This patchset enables support for the PQ_125 EOTF and its inverse
on all existing plane 1D curve colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this patchset the following IGT subtests are passing:
kms_colorop --run plane-XR30-XR30-pq_125_eotf
kms_colorop --run plane-XR30-XR30-pq_125_inv_eotf
kms_colorop --run plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf
kms_colorop --run plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 20 +++++++++++++------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ddc8318f6201..63044e0296cb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -25,6 +25,7 @@
 #include "amdgpu.h"
 #include "amdgpu_mode.h"
 #include "amdgpu_dm.h"
+#include "amdgpu_dm_colorop.h"
 #include "dc.h"
 #include "modules/color/color_gamma.h"
 #include "basics/conversion.h"
@@ -675,6 +676,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
 	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
 		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+		return TRANSFER_FUNCTION_PQ;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
@@ -1157,8 +1161,10 @@ __set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
 	struct drm_colorop *colorop = colorop_state->colorop;
 	struct drm_device *drm = colorop->dev;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1190,7 +1196,7 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	/* 1st op: 1d curve - degamma */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
@@ -1210,8 +1216,10 @@ __set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
 	struct drm_colorop *colorop = colorop_state->colorop;
 	struct drm_device *drm = colorop->dev;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1247,7 +1255,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index c5154e1430f5..a9d94018a207 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -32,10 +32,12 @@
 #include "amdgpu_dm_colorop.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
-- 
2.43.0

