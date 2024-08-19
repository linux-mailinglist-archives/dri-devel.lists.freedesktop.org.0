Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC380957622
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0CE10E3F1;
	Mon, 19 Aug 2024 20:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="budLuK9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C4910E3DD;
 Mon, 19 Aug 2024 20:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0oBRzLbh/zwA6y0nDAdmy5dCP9O8AgO7kOU7YBEh2Qhkl+ouFG7BUyOCVVp6e5sPLsrXXfwKFecjOUfKneF6RLnaOFJ5VybrKmONYcPDzKmPfUxuwb5YwStsOecrEabH0lja7DKTgVj87bQY+sidVQgK6jEZtUIohcuvfgB2ovPsMPMjidwa26xxaKWdMxiytOGI6BWghIgFe4EN32qT1WlDp/5RcXLfQgd4eFpfKap788OZ7c6+eytm2CmosuPwfIrDHKSpkjMmPnrgkBY+efZOee/Mf9AITT3XdKDZ8nAS0kUifAvPtwPBrTcBHhg0O6bqf32JqP9JvotS4IAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIdEDPh5+IChD+dib3hV3Ie5um7+WOOW58HR6p17Tvc=;
 b=AUQzNMmLTdCkGyg7trrK8axxnxZ8kCZkFSUqZywxkiyL5c1/mz893Iben3SwKygKxIrYzA7bmsHYPrCEFeZ0o6SduG4kPStelwv/aVzXOIcIlPhf9QWiaw/V15/0NTAvfOV1vcX8O++nxC2NNFKkFLtAUtlG012hZy5S51y+5zsZR8XFV5XeHSK+YEqq2/1ebvSrQnD8OLGz8dfFIZpRs1/I9KW7kYeqyIHZNRpzVDja9leQZB8qXXfa9gqpavk54juH26o4fOBCoCN6FXFpb+QDm+JyDTeioz8cvYvVWo67UklwHmqr+IWWO/0DjMqdAHeLadTR4rsdK6Vtj6+l6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIdEDPh5+IChD+dib3hV3Ie5um7+WOOW58HR6p17Tvc=;
 b=budLuK9gh+Dn4WPH5seH28uqDQ6S1h0Str8wrovzAMStvJu7Bkbgg4wx6hFQHFchUWJd+h/FuILNWjJk37d/V6X9njQUxRwTPOtGj0wFnFhyn7OEz/9qbqYR99WMNWiIn5y5EHETTbj/i7UwXkXfFNBjHoKiu9Yg/9hvqhp3Jhw=
Received: from BN9PR03CA0532.namprd03.prod.outlook.com (2603:10b6:408:131::27)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 20:57:40 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::de) by BN9PR03CA0532.outlook.office365.com
 (2603:10b6:408:131::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 31/44] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Mon, 19 Aug 2024 16:56:58 -0400
Message-ID: <20240819205714.316380-32-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 58947d48-d3a9-4ae8-a0fe-08dcc091904b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xM8LbK5KhwcTICT5f1eQSqZ4gqfAbSxpOfzY1DaDLKhoqlSYB/SNE9BXvrx7?=
 =?us-ascii?Q?O5SinfWdi0W2uhr5tRMb9YxJIwZXV3i8vZeAy1DEBPGCrSmUKuIRJHTpwyvm?=
 =?us-ascii?Q?cv1l1dODcfVjkSV6nQoMlG5r0tTYt9b0bckSreeuO1Eyr1RI2sHiQdQokiRk?=
 =?us-ascii?Q?T5thP/qFxvl/vj3vVDCGVZGU9hw0+7/xqBKLB7ZG/MBrRYgxgcM8qjJA6mgl?=
 =?us-ascii?Q?8H+R7Bq3jzMH0BEG8+E3HtM41k/K254ZPOWCDXYdGrOqAEqk0oaYISPgxKiG?=
 =?us-ascii?Q?A7/8GCMCI1lBY+k0AY+h8sO++ElqIJ9YpS4mYe3IZEvt7gM4mHPr8QYrrJG3?=
 =?us-ascii?Q?73tNNIVgWD1CpfDi+ZpQxtERNTpc9KNsFnh7bTEWho/ci8Hwvz7PfyYwp0wB?=
 =?us-ascii?Q?5BCDiUWy2ULYt7oS8dowcGztHtjQfzfrbj0HVodbNW8aVAMqI1u6WUDl7Vnk?=
 =?us-ascii?Q?8I2EJxHAPTgmdPNPmswmAehvICWn5O+0zhlirkfZ5ry+lkOVJwbfjR5mUwV/?=
 =?us-ascii?Q?QfQLBXnvpAANBBML7bZDwVd4QgQex/gEa5RNci902R0Qlitd59M94XpfUcK7?=
 =?us-ascii?Q?O3d9qmUEA0gCE/R+O4YxQ8ja0b1wcKj2+430NlB9Oeq+zeZSM5qWg09aPfz4?=
 =?us-ascii?Q?fVp94Z3EyYluv0fQVWybE5XSCYjo2APGKE5+EUS2KWF3vC0pAbZf39i1CAoH?=
 =?us-ascii?Q?B47z9oSkC/xHNukoF4Wr+5fGHzZIDeDe1Xa824ABHwh439mTSvjPANLa9xoO?=
 =?us-ascii?Q?vtLh7KB1chkF6kpMCT2QdLcoalWnDv9JQIxbUl4/d6FfkOFfbB0BSAEmY6bL?=
 =?us-ascii?Q?0tgsvUfCc0feRKj5ExUY2FHMfexlhCB275Od3ZhTNszc0yd3BFJyx6UPjmMM?=
 =?us-ascii?Q?hPIwUNo/wy3ct0wlqAorK71cFwpV3WefJqPfaucpVOEjseOKo8RO0u6LFJip?=
 =?us-ascii?Q?SSLxQxEtWRsW09qhSQ4AvRe8SPH2CKLLwcYzg6621tLtXIHm39c44I/mLuvk?=
 =?us-ascii?Q?qiDtbFrF/VzOJ4fTXsC9QJDSReCFA1CVmcfegJpKCwMqjfEGxc1DiwPa8gzj?=
 =?us-ascii?Q?Z5T5z4FCsq12Y7/Mn+9ESDFe8nrLmEntC17hZZvQr8F3vBIejxYt0Ynu4di9?=
 =?us-ascii?Q?eEQkbXXK3DI57GqXQtrEzyHgv+zy2zCHhDsXgO1ZDHxlEJhuGQDln4ObOlv0?=
 =?us-ascii?Q?fHGG4N93iG+SBjOq9nWgD5IsZClHK9R7Txlao2gDmfHpp6jded+LXBVmieuH?=
 =?us-ascii?Q?pkjk6fgzfov+sz4NpY7bL/WEjuEt7TdGwlCd71vIdvs+CgueXJboaNVI1ClK?=
 =?us-ascii?Q?hRFMG8i5/JB2ly02iUwaI8mNfkBPIOeOORb5t56CoXjZnxH+1w6HEE1q/rO8?=
 =?us-ascii?Q?I/w8CLcRDyuN4fqizBA5vBNd9rDnX/WdTyzXO0UMzAatolLbG4Gnm2mIKr52?=
 =?us-ascii?Q?5D/Tn7G8lk8enyCEWJjgxe2Xjz95005m?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:40.2809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58947d48-d3a9-4ae8-a0fe-08dcc091904b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216
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
index 4009895c3b6d..a1299ca83bac 100644
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
2.46.0

