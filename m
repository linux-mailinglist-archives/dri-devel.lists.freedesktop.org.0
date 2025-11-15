Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344CC5FB28
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C191710EC87;
	Sat, 15 Nov 2025 00:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PwyUynxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012001.outbound.protection.outlook.com
 [40.107.200.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56F10EC87;
 Sat, 15 Nov 2025 00:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsPppHu8JHAP6b9HrFcFZYbzJfuYqeHiwyJKPz/5aNSmifdhlcC4WKDidLFUXsuWp0nQGOwc7XQyl9dXdceDDbC8ywzw2251cH7+L31JHmWrqJtsIUxi5AscWIhc33JOE5xBxhZaIM+FmyfCY2Nc3TJq5RIU52VOY9yJwPVuh5KbrMQvuKUB8Uis9SO+Uz55Aq9X7bZiZloUo6bZXYGBFzhHl2ZK+D5H6DZsI9+dLva2Gq2Ajh9k8OQ6cyU3VHq4I1ZCeWJPmRSTYSnn7wGhT8cTf1DL46x4QuYO+MbJmTXLrEoE1GQylI+7RzZ0JqjVhS6cTNsaTSWGIsCqtef7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKeGLucilGwchC3d+LDrdhPGLDJizVv5RBPyPTeRBxQ=;
 b=moX4ju2IxYCyvlX8GtVesP7GS/maJyt7J3TZs9th14V8ymgoL/hzaVwwfxAQJrscpAoVC6DuVNqgZVreyYNTK/59yixUDzAcRYbeE6/y/x1oXORTfkZNjyVhwQPAyD+rEuv+JbVM1CPC5A21R6/HohjAsTC+9rdFZDdnz/R9QJn5qxGkl07qv6zr7KgJTcjV7Zi13Vlo5QLWdCE1N+rim0vm0QsLwea7oe73YpkHBHhcNbxZzBnKxbTbc//sRiLe4AjR7OGWN1qI5LAK5ioQQtlOTlNup/zu3nTrbYb1g5XPtVCopcL+tfKZvXroSfPHhijR128uvcTPZojX3ITgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKeGLucilGwchC3d+LDrdhPGLDJizVv5RBPyPTeRBxQ=;
 b=PwyUynxSTj8yaB/ikOMBbVImXlKr2xWKdw0GJ5lZv2RwHoEIyQh/4VsD0Ar1Gs1eHSganeGoRUGIQbEMvf2lG3A6OXmbiorxnrbLFnoimYS3WB4oiTVeePO0RR2k1KhQ6d34guVJpYazzMuY4LXrpOIZ/JsQ0o1Vrjk1JcBMFV8=
Received: from PH7PR02CA0003.namprd02.prod.outlook.com (2603:10b6:510:33d::31)
 by SA5PPFB29794CA1.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8dd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:11:26 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::96) by PH7PR02CA0003.outlook.office365.com
 (2603:10b6:510:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:11:26 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:11:22 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 32/51] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Fri, 14 Nov 2025 17:01:57 -0700
Message-ID: <20251115000237.3561250-33-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SA5PPFB29794CA1:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbea6b2-dc08-4e7e-fb98-08de23db849c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TxvbUZc1YZGZn1hwGxJACPkzK2o5Elmlae0CCDDmy8iiecDDk/Ag+qHDxdpX?=
 =?us-ascii?Q?l4zQa25vRRI/7p8uoyimbZoSr9URa94KitU+rMoHnnIvpQETH9twVSzt78x5?=
 =?us-ascii?Q?VrdmYM9Qv+rIsdpHaxn9x9qOcXhE8bvx6ueo+g1VKyU5qkdXdj4ZG5/ikf2a?=
 =?us-ascii?Q?hn4gQFsoH1Mjly/kHnV4FlP1nGF+ameVpx9JZItwLpHnmQQV2x6jYsOhIPx2?=
 =?us-ascii?Q?BGodK81vlJv6MtYVItsP3BYVID1BTIouK5R0WRFzQ/uj8mIpfvjiHLOtBYQ0?=
 =?us-ascii?Q?EHyjETts/ZXtsLxNs4rTHxZPDLPwcyBgam1wDtkAnrw6Qs9LOI00RvSRLGHg?=
 =?us-ascii?Q?EigcrGp1z3y/8Z2x/CUmQOkCtVWn77LZ4633r96IVuu5fhwpTzWdKp2ASowv?=
 =?us-ascii?Q?3kCjttVtgBk8k/IRcsYDGLILLVd7uLm33FYSGNL4PJGURteVk9bvf07zXjrQ?=
 =?us-ascii?Q?QDKUCGAWvoE4w2P/9bc7vFU5J6bqNXgHpEizhjA9QQ0ycMy7rS+eyVvJxhLP?=
 =?us-ascii?Q?ptV6s0zELMca1QaXX0KscpNPq9S7J0axsWCse5Q8q7NEKLqEALiK4owWSytu?=
 =?us-ascii?Q?7GrSc5r+xbDuGVBEWKvOLCf89+7iF1Uh7FG5VZItL4hpC//t6uYgzdgtiy8z?=
 =?us-ascii?Q?nSGlv98/ITfKWk0vgdNFYFht15UH1dbBaDDAtsOWIorT0c03F2G0+QNTdRGe?=
 =?us-ascii?Q?0sA9KSECXIU0Ay6K+bf76YXjnaUQpD46J3sb0LCXSWal9tk43gzY6T2z6LC/?=
 =?us-ascii?Q?slL3glwRNzKj3T+yi3T17kwmNIetrXG1ODwj2uSiz/zqPnINrrBcN0+O/osX?=
 =?us-ascii?Q?VP8JislBODeU6LqI0RbIQhrUYsM78+Isy5kQQFW7TolhREKle2LDVwudsArn?=
 =?us-ascii?Q?HRikzx3Wg5BbkBqSqWq/uKIkXQR2KrVxgoXiaQGyC1ilwgR1Eh0fSU2z/W1n?=
 =?us-ascii?Q?XNb85uXv7mb/WOLpHYlnovLXhuvqtGP+ChMZ8oH9Z2u4FQTIQw3+w2SZ82tV?=
 =?us-ascii?Q?11Fm4oi2VdRSPZCV3Zki6Wv3Ni8acyIL/6r5WuSPn1binkChjjZI9a/3P3tY?=
 =?us-ascii?Q?nWZRxq63qF8Ph04uriW1o6yht1zONrQjUxr84Nv8oqvCeKpTe1yLZ0u6A6fc?=
 =?us-ascii?Q?nxoTdrvbu5aj6VNiUPvwvI+07GSa6FV++tjnu3tTfssbsU4LECAPa1huvyFN?=
 =?us-ascii?Q?vGGYKao2QzUSAQusL3i0PW5X9mqbQ01TUTiJAnaMdVMjP8D0oNYeHKz7Flev?=
 =?us-ascii?Q?X/G4fKlljeuKGF0Chqlc0sCNmgum+DKvpcsd5EDLD7vfrWLdz9h314gd7daM?=
 =?us-ascii?Q?x3v4weJ3JKxH7uwFOhsQCxDDs/5o1fojF7/dml0AxMtcYguKXZx2IefA3iY5?=
 =?us-ascii?Q?30lj5i/Q9xscvK/u/x6m3v71mfZvV56zesRy6mCs8I67fm3tuvBsyP4EWaX1?=
 =?us-ascii?Q?WjU/Nu/R4vzTUomhgKYGcC8iixbwRAwyPbijtDQ0UtslhQGNSAF36PAyehLX?=
 =?us-ascii?Q?R4xP6EcDCj+4EdLsH2y1x+9JCb7/rZCXxT7oh9UpYapvtXgoRMN53dxh5GUU?=
 =?us-ascii?Q?I1YSX98vEl8N9qzA4OA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:11:26.2000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbea6b2-dc08-4e7e-fb98-08de23db849c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB29794CA1
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - Move amdgpu_dm_supported_*_tfs check here from Patch 32 (Melissa Wen)

v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   from "drm/amd/display: Add support for BT.709 and BT.2020 TFs" (Leo Li)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 28 +++++++++++++------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++--
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 53e1469cb3b9..eb9b1b0d1025 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -26,6 +26,7 @@
 #include "amdgpu.h"
 #include "amdgpu_mode.h"
 #include "amdgpu_dm.h"
+#include "amdgpu_dm_colorop.h"
 #include "dc.h"
 #include "modules/color/color_gamma.h"
 
@@ -674,6 +675,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
 	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
 		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+		return TRANSFER_FUNCTION_PQ;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
@@ -1197,8 +1201,10 @@ __set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
 	struct drm_colorop *colorop = colorop_state->colorop;
 	struct drm_device *drm = colorop->dev;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE ||
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1230,7 +1236,7 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	/* 1st op: 1d curve - degamma */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
@@ -1250,8 +1256,10 @@ __set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
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
@@ -1287,7 +1295,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
@@ -1316,8 +1324,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
 	const struct drm_color_lut *blend_lut = NULL;
 	uint32_t blend_size = 0;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1353,7 +1363,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index e8ba66962ce4..f79b52ef7d5d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -32,13 +32,16 @@
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
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

