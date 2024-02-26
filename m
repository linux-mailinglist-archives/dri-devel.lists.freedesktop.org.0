Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F44868295
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42D110F246;
	Mon, 26 Feb 2024 21:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xV8AQhV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7DB10F224;
 Mon, 26 Feb 2024 21:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cs++cR61n7gS4X9xGkqfHOQKTCB9JO02EoCgBOUmv5l8Aat9MNmVGecxKIS10Z4ZDtdLu/qoK8K/podRh0XQRcrdqw9Cwoqo4LI2Qd8kcFOLdZFsUAQBegVkH4nG/ANGxIjxA+4Nn6BROu7Q+aQfNt72AU4Y9kIAWRVFvfyzM1oWbO0zMqrL2zM52XMn9MPvRAG6lFUsK0Ym9wwAfWTFKG7nG239jJsJ413Mv9KHmZKzO9WVKsWqbURKGCo4xN2FZH0RMlSxK3mzF9mcSWxZoFKcRXPM/9N+7ANuJuDdKA0MFIVFYuqzVOagS0PiXShqfjCjdtguo6gVJsL6rGE2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KglUGeWoieDkKzSh0cKSYkbaGcgdRpmsnxVm5Gh6YU=;
 b=nHyntqDAV/tfVl+cfHwDfhNK4TgY+dgh8IxO64jO22QEuqe93yFqlJNd1KxkwEZH/i2eYMTqMgiueUYEyoPepEIelYuR/Eu4IgcqUNPb0XSMmguepoFAU41z3zMY3NmYVi16HP11PY+IEAJToQxaVcY9kck8pHzYl1XFizF+5A14GsmdZCMgnfSFFX6gfP9POEcVbKK59x2OhF2H2xaxhKwLvJ5g3jvxpIxHrVwDd90+uD2mejTt/P+WSoblB0k/zbIsGN/VWLqNZ4eHum3mKgKnTYnKJAapZkwbV/abZc2HqKYt1oOtO1K0zeIAZ4Sqph9hShPL/d8HNFn5sRflHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KglUGeWoieDkKzSh0cKSYkbaGcgdRpmsnxVm5Gh6YU=;
 b=xV8AQhV9rfaiG+x0xsX4Doc3YCMA5gBW9ZwlJNmaVyP6FCyfxbvdgTcUrCxcYU7fZ1uzgfHBsPgwI/jfEFIO0sJ6Lqfb0vNJMuGlZZpmhoRzqjt5cmLvmGLDJN7Cb5gZs2fRfAIX8sbdjL36M+97V/rq9ktlojmhMWXRfLrlrKQ=
Received: from BL0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:2d::45)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:28 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2d:cafe::ac) by BL0PR03CA0032.outlook.office365.com
 (2603:10b6:208:2d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:27 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:27 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 35/42] drm/amd/display: Enable support for PQ 125 EOTF
 and Inverse
Date: Mon, 26 Feb 2024 16:10:49 -0500
Message-ID: <20240226211100.100108-36-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: e548fb96-962b-4798-d024-08dc370f7fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYKxJ/hj68cXmgJ1vppYSXJ1Vhp5Sb43XxmguX+Akby7js3CF8EgVhbHDdhjBLGwJhyl+jL+40BdmjLpXJ+TjgaAdUFKvHZTuXRmjtNM2w80OOo1ZSiSuheLF0YXSSSaLihfEg/wfwCdR8oROQnFpuFtyOUzAmP+K0RGvnhWkoaGdzlAKUGw/ZIslZp6tdppUVBNNnzK1HkPv6f3Z2uybrgdU4uI70kdr87CsCgWgLHbY88inBbxj871VKGuHIuGjDXlKkC3DPzLjls4vT2gQDa1Ec3nPdksIP7+f9Gsy6v7rIMReziaskN3E7HxW2EFWX+y2v/kcR0iJhCJfbyIRrb57XYJW8WUQpx0VPnK9CzowKBNwRoSG6QegmP1cPqb5BjJZcs+ygpDhwFOs3eDBa2uo2pl0G0Jav6O9QzoXwWUT7tB+J2fE2MHJTvRADoMlgSPqBS0aUsv4DCLOL8cr09HjkjI2mxpC58bgc1xzy5pBJxXpXGa4yPa2eQel35+IJwscrIkM4p7VVrVYTw6WzQkNZWXa7PtnSRk9Ve34UDNP2lhyhjmBN8K/HTPQ2EYRI5/2Y5DiY+mg+/Mwr4GC0KC+7o6xDd0k2p5B4rSI+Vzto+EuCdQSfl8Oqcc3OXrIODkbx06StdxHINEx/o4Lv+twxIj2resHo3NEWtOSkbCr7CT4rgscKU5IvSJxLwoi3eeiI6IXTE3oW+DCkjWpx7PiikPat7coe7eDEkzTtJrlsLcu5iF3BC5ALZ+mB57
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:28.6048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e548fb96-962b-4798-d024-08dc370f7fb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
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

This patchset enables support for the PQ_125 EOTF and its inverse
on all existing plane 1D curve colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this patchset the following IGT subtests are passing:
kms_colorop --run plane-XR30-XR30-pq_125_eotf
kms_colorop --run plane-XR30-XR30-pq_125_inv_eotf
kms_colorop --run plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf
kms_colorop --run plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 20 +++++++++++++------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  8 +++++---
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 3e3ae2b58b06..20b7eb47388c 100644
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
@@ -676,6 +677,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
 	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
 		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+		return TRANSFER_FUNCTION_PQ;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;;
 	}
@@ -1158,8 +1162,10 @@ __set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
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
@@ -1191,7 +1197,7 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	/* 1st op: 1d curve - degamma */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
@@ -1213,8 +1219,10 @@ __set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
 	const struct drm_color_lut *shaper_lut;
 	uint32_t shaper_size;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1250,7 +1258,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 449a2ad6a184..f99d8e09d89b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -32,10 +32,12 @@
 #include "amdgpu_dm_colorop.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
 
- const u64 amdgpu_dm_supported_shaper_tfs =
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
-- 
2.44.0

