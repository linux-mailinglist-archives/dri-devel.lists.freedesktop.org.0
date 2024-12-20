Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9B9F8B8F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EBF10EED8;
	Fri, 20 Dec 2024 04:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0M2CVyzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B9910EED7;
 Fri, 20 Dec 2024 04:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5bzN7HXmZrIxQpuFgurYSBYjryLAvqD7qBfF+ncVVbl8yFMKPJG+eN9WTjlaJLCEOiJV0Zr27lps577R5DXKXHcKXh6bfcSH3WqLFLRgelBoKiSVY3+TYkuOXpdMxgc8QALdLPGxazJLAdK7VYAPp0KZ7TYexb7BfTXBq0LdGFVzfiEvQ6iIiKeWz9bzQfAEoFY+tPImXXyiFtGEQEFwUTJbyFAL/As3o6kY/kdwUXvGcVvc8vJkoKGPULVHjWdUedZW0YIbXPbCD8oLAf0NkYgBq7vMeikaUXtPRRfRxzmPN57R3UJK+oZl+6xmMF+avOB9ugW9IMW5bWdrWy43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da/zUieZnLY14gUIZxDh/TFrefLzBf6gqkgmbQG/lPo=;
 b=r4gzz3ncvGB79bXzo8PQFROcaYkz/fTArbXdB94eWQmIle+ZB2hvABWWfOERoHBmJOLLyGV+eRa4HL0OZ7F4lfHUuUv6sbIX/QKeNKMXplegruKWBureJxqNx5Nq8sDbzO4zg32oS7KBh+EXBWTdoU40tQxjdjP057Wwu6KBb0m0ECKBZPSvcaWOo4IYQuUqfj3GXk7W7HdC3uioYgQ1dtJmuh16jFje6iylBi6oSLkt0XALnKU4aNx6AUwvo0xz/9pGRn4oPvvUCJRy1C0sEhAffgpA1ThZ/ohWd46J00IL7A8ZGH72zjtLYbhj94tjs5s0Et3vRWQbJztiJ4rA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da/zUieZnLY14gUIZxDh/TFrefLzBf6gqkgmbQG/lPo=;
 b=0M2CVyzKFohtzV37Bx5H+DgR5Q1cclr0OvijdHmxq5x4BRm0goqzeJpY9FcC51D0rHuWX1OgV2MEKFFMdJwAoZ0M9IrAsJfOu+kqQcNkp0cmE6dapz+7nrMsuatAdERloRbSJFYAXLhV+lPqKJXin5L2V0iSKAzcYFKb0PH0rOg=
Received: from BYAPR05CA0074.namprd05.prod.outlook.com (2603:10b6:a03:e0::15)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:44:56 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::bc) by BYAPR05CA0074.outlook.office365.com
 (2603:10b6:a03:e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.13 via Frontend Transport; Fri,
 20 Dec 2024 04:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:44:55 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:44:53 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 34/45] drm/amd/display: add shaper and blend colorops for 1D
 Curve Custom LUT
Date: Thu, 19 Dec 2024 21:33:40 -0700
Message-ID: <20241220043410.416867-35-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee64cd4-66ce-4859-5ace-08dd20b10d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/qFHyWcfZ4JhOOLW7Rk9n4ayZd9ntYnXHw29pTSSdpkfs4GjuzXQUr+MGJ1w?=
 =?us-ascii?Q?xoCuwMMxtihyDbKS1orxzIkvnojtEZsQA9KHZGN7FaQd9f2yQ5ykpcNqNCrp?=
 =?us-ascii?Q?HDUVq+VpCGMJtysgmmgXIiSqnRFRiGMiikH5Tq54YYeO9mpiGAqtBPjVxgci?=
 =?us-ascii?Q?zAtNDlJ4ekfrrpbXN/Sb3RpKLbCs7fNyqrszsYwRwGR2bkaB6vfl/6luwfOH?=
 =?us-ascii?Q?/qSGWNsPNwTuCXWh0iHHXkm4IzOXY9y5KOBTMiqBtI1xOnpvPBstbxf9GKpb?=
 =?us-ascii?Q?wu5DoDS1ktAKJQ5SkIWjeNH/RJfZkQOW0QSSADzEk7Y6TM65+kr/bpIBr/Tc?=
 =?us-ascii?Q?aqyKKoW2cw+ocupJz+UaWa6d98tQhT9BmhE5S8x2tVKz+wNJLQ7I6DF0M026?=
 =?us-ascii?Q?o6Pwarha39kCTJx09AHNMRZC1QMn71XE2fVF0RFWTOiRVBx7qtTXGZD7NR9O?=
 =?us-ascii?Q?8CDZbaq+aXpsHZdlGq3It54gwsL1wW6qt6et9VoII0VxXS+dL+zaZDugf1Hi?=
 =?us-ascii?Q?Lnmoz5f7TpXH5BkOOQ/ZH59hcmMuLtOB4QAr+P8pPcYrPGStAiSbGaJR5VZS?=
 =?us-ascii?Q?tgI0X+8gFmKLq2AJW8futW7GyW2aIyqUFR+ti3jXl5Kr4NjhzL4DRhpejVP/?=
 =?us-ascii?Q?LEiU4oc1I+rBjvZPRDJgv25RVhtpk9oJNzaRelqcbzHWk56dOdUWtQFsoL0V?=
 =?us-ascii?Q?H+lSoURA1JHCllgq110JXATsGHXHsln+Z5OdJ14kYVYgQzu+asf2I9n7rOXf?=
 =?us-ascii?Q?KtzoCSUF7mm4mrbKJf/5qnp9vhuA1IYgGLvJpX3R9KqF32ghrU7Q1URJzEaX?=
 =?us-ascii?Q?i3VZ8dge+Rn/sIMGxSU2oZ5lbTvtqVcH/QB+7G7lKC2CQzlq4yeF1M4WWcAF?=
 =?us-ascii?Q?V2flHb1ZVQu2zTrC3ERyePr7ZjEF4/hYTq1akksqgegQplAR9wHo6pxyAobt?=
 =?us-ascii?Q?vAjXbm50NxYjn6svvkQEVLT+qAN7QREwh8vjYV5P57YI2P+D+ymUXRmn76r+?=
 =?us-ascii?Q?5IDwaEIG8/AYET/d1xl2Nqi+7gfGJHljfdGjGAgcDvM/6RwfWKXpUbfSbKpW?=
 =?us-ascii?Q?TtaHdWbO+0paZSRMGyHAf4yaHlhAVYIJQld9rPHgtkjY3bqSFrytVcWDMww6?=
 =?us-ascii?Q?dg7TlWkAYo3PvZt6QIsJIhKeFa6/1/wwkXbCE2y8ouysp3qNPMUjmskyTXpd?=
 =?us-ascii?Q?i2ZdxXrToRrTFUbjJ++dWJsUUnC7EBSuj8jUQblFIzF+L+zzYvxZeGnkIq34?=
 =?us-ascii?Q?LTGyMmPejPpQ4oYp8+7DwEJho4+cmg41lkcZ5ciXQqzbcbnT3Mw6deLHyYU7?=
 =?us-ascii?Q?NM8rmLPXANXD9LYAWWTSvhHsjtJDYH6YnaVHq70+JW65vNiavxNqOI85FGml?=
 =?us-ascii?Q?IfcE4/pe5bOUNER+HcmwpYRS9Qr6kxMuDpowFiVKlH4ft1jS+fXYfEyWwEjZ?=
 =?us-ascii?Q?+QsRL58qeB/A517Y4Tud8TFzchUVNFmVK3MwcTxyg/UQyMZadACAlypEPlUd?=
 =?us-ascii?Q?I15FJDlXMFk4fss=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:44:55.9707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee64cd4-66ce-4859-5ace-08dd20b10d59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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

This patch adds colorops for custom 1D LUTs in the SHAPER and
BLND HW blocks.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 1D curve colorop
3. 1D LUT
4. 1D curve colorop
5. 1D LUT

The 1D curve colorops support sRGB, BT2020, and PQ scaled to 125.0.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Initialize uint32_t blend_size = 0 by default (kernel test robot)
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 166 ++++++++++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  32 ++++
 2 files changed, 120 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 1765402bc122..0bea52eede39 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1211,38 +1211,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
-static int
-__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
-		       struct drm_colorop_state *colorop_state)
-{
-	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
-	struct drm_colorop *colorop = colorop_state->colorop;
-	struct drm_device *drm = colorop->dev;
-
-	if (colorop->type != DRM_COLOROP_1D_CURVE)
-		return -EINVAL;
-
-	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
-		return -EINVAL;
-
-	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
-		return 0;
-	}
-
-	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
-
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
-		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
-		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		return __set_output_tf(tf, 0, 0, false);
-	}
-
-	return -EINVAL;
-}
-
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1251,64 +1219,61 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	const struct drm_color_lut *shaper_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t shaper_size;
 	int i = 0;
 
+	/* 1D Curve - SHAPER TF */
 	old_colorop = colorop;
-
-	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
 		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
-
-		if (new_colorop_state->colorop == old_colorop) {
-			colorop_state = new_colorop_state;
-			break;
-		}
 	}
 
-	if (!colorop_state)
-		return -EINVAL;
-
-	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
-}
-
-
-static int
-__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
-				  struct drm_colorop_state *colorop_state)
-{
-
-	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
-	struct drm_colorop *colorop = colorop_state->colorop;
-	struct drm_device *drm = colorop->dev;
-	const struct drm_color_lut *blend_lut;
-	uint32_t blend_size = 0;
-
-	if (colorop->type != DRM_COLOROP_1D_CURVE)
-		return -EINVAL;
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
+		drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_output_tf(tf, 0, 0, false);
+	}
 
-	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
+	/* 1D LUT - SHAPER LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper LUT colorop found\n");
 		return -EINVAL;
-
-	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
-		return 0;
 	}
 
-	drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
 
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
+		drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->tf = default_tf;
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		return __set_input_tf(NULL, tf, blend_lut, blend_size);
+		shaper_lut = __extract_blob_lut(colorop_state->data, &shaper_size);
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (shaper_size == colorop->lut_size)
+			__set_output_tf(tf, shaper_lut, shaper_size, false);
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int
@@ -1319,28 +1284,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	const struct drm_color_lut *blend_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t blend_size;
 	int i = 0;
 
+	/* 1D Curve - BLND TF */
 	old_colorop = colorop;
-
-	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
 		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
 
-		if (new_colorop_state->colorop == old_colorop) {
+	/* 1D Curve - BLND LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
 			colorop_state = new_colorop_state;
 			break;
 		}
 	}
 
-	if (!colorop_state)
-		return -EINVAL;
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf;
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		blend_lut = __extract_blob_lut(colorop_state->data, &blend_size);
+		blend_size = blend_lut != NULL ? blend_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (blend_size == colorop->lut_size)
+			__set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
 
-	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+	return 0;
 }
 
 static int
@@ -1409,7 +1409,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - SHAPER TF */
+	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper TF colorop found\n");
@@ -1420,7 +1420,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - BLND TF */
+	/* Shaper LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
+	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Blend TF colorop found\n");
@@ -1431,6 +1436,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* BLND LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index ff5828a1e8cd..8a5e15083f11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -29,6 +29,7 @@
 #include <drm/drm_property.h>
 #include <drm/drm_colorop.h>
 
+#include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
@@ -90,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 1D LUT - SHAPER LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
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
@@ -104,6 +121,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
 
+	i++;
+
+	/* 1D LUT - BLND LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	return 0;
 
 cleanup:
-- 
2.43.0

