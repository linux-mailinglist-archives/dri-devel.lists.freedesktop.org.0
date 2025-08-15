Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B3B27772
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50C610EA48;
	Fri, 15 Aug 2025 03:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3rgSVVzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E610EA48;
 Fri, 15 Aug 2025 03:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4IzjSVA0QLppdfxrbnOPKwfEagbE5uRFAhFcGIkG+FzyrjbhfSgQ9HpjRbxmw19lI+XvetREJGGEno8idSlQGV7Z+8Z6mLDn7lC3gQ594K6cmFOfMQKrIVEvEuRj3wswHhEmtfRBjgnKPDpuLzlQtARQVXD+fZl7hNm9xqxlWDsspSNn2TE4ohzwR7fPd7YqF3PehqmUQfnNTYFmusVr4EsfpXOFXv7QwlbO8R0VhSz3p/Ju1XqkKcPbQEa/P4VwtkSe5jhhpC6fRLVetC4FiUzY+sPcMBcjq26nfEoQuXT/MDUnhdxQ30LY9sAxV6jDruDpGx1BQKkShJIG23FPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9btBswoXe9B5AaK33yvGz+y9Cmur1c85teQOaeihlU=;
 b=H5DJKBotvHrw7Dv7+c2nMzv/FOkkBsy4n2RONMJjOgjVWWUk/X4MR3h9ydCyU2rflIFs7ICfYLFu1KcfxWUE4ZkUZk62Qorue1fv/eF9STsjsILzcYzIjTy/ibJJV3NIdsKW70rldxmRwbq0J58zNfa5WA/VKWhdDuRysELgQ8661UEVMFluhlAXB/PvKyxHsyCvhGyBuz33l4l1L4OSLCp4HZip1vJmUCBWHj15dbb+UPzqN+NTu0AIhSSKYXfaJ0BW5OvXm4QZLTfuOuyNAKjD3ZM4KGaq38GacbMHPfCbL2ecmFcOPxO2G2yatnr4LHjyY/Zl0MdTt1m0LFSLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9btBswoXe9B5AaK33yvGz+y9Cmur1c85teQOaeihlU=;
 b=3rgSVVzno7h6l+UxeQvOATzCP0eFaKB8u0Qac107Bjz0822HzHiwg8H+rUopbY37POrJCYPob2QfDCs8wM+Mqb0n7tZfCLbmPoAJJvKMnZPzDUfTmzLEsZx9zgL/KZt/P4BEutiRRuSwq4cZlsOx2iY3uP5YEGHKNVdia709MOA=
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 03:58:52 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::83) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Fri,
 15 Aug 2025 03:58:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:58:52 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:58:48 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 30/47] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Thu, 14 Aug 2025 21:50:19 -0600
Message-ID: <20250815035047.3319284-31-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aae435b-ced1-4c0d-2668-08dddbb00c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eQjvHiiyIGK8XEM2D8ceuDCkr7veGVn6IAK9xGSmgjfjzIWORRYZUJU6CVRC?=
 =?us-ascii?Q?K0rzlQefP83orgj+cESHwQRcrhj0t4OP+T6KeK2ohi6k/2uOKjAFxrp5XTfL?=
 =?us-ascii?Q?YDZsRnVajAtH/yT0lM9/dCGgYRl71cLLDnRB3HxcB3v4ysvO/2rFlsRoVEzz?=
 =?us-ascii?Q?P9L3/1MSaIpcEX/wbrsSpha6hIq9U70ikpLhjf1g3hnaztQgScu85LxRm1ry?=
 =?us-ascii?Q?LSOrmTcyU70kCO9MhXj7sSgJk15lO4d1m45YgVzZmOmDFHjlCwDkbMpKCFtK?=
 =?us-ascii?Q?mVOWKz4SeyZ8ntNhRfqPDT+gYf737JXmSRb4wuWi5oMAcKyvpyR3+iZepOu7?=
 =?us-ascii?Q?4YKshCxzVmyI5fE7GQFxtGzCIwcN/VZFVrOBvJxNNxI/UCOzW7kCZqM0l6XN?=
 =?us-ascii?Q?0FEBA2hy2Q4wzhEpZongGz/+8QRd5bY1ZII125bMz2l5bCyPhNltZgZXIC1h?=
 =?us-ascii?Q?DplHHEJWm+fO52+TdMHDB3E5gZ/RjEtzS4OdRm7I6zs7UZIB/c6VrBFpf+ey?=
 =?us-ascii?Q?YSqeEpIpcGIP+vEczoUdZHfA/e6tRptoZ/0mnzNNIH+ZG6Yo022F/gJ/t7r3?=
 =?us-ascii?Q?C85wTnzv5bbL9t1ENFx66vFHF9S3TuHHtLT3EXmLK0xyo9TZAd7a5vfqxCQo?=
 =?us-ascii?Q?INyjSuK6iG4q/83YQUrYNx1y3OSgPwKR5fetGxgePmISokfhVkRdJ9ibePRw?=
 =?us-ascii?Q?XERDVe7SFpAU4IzPZg87BpfL4mL2YyTpAVBCeGUEdoHTDjLnaeyLPfgtLfzq?=
 =?us-ascii?Q?wyltGOgS391+uYcUH1JYNryQJVfSzyKMxfJpP8OZAjqaPTEpuiZ2kOsUPNsb?=
 =?us-ascii?Q?DkS29TPpuEPlRqT6kEZ8ZEbXSN+uuJIVkD3X3Vj+P4VS5bfvSMlc3bxkRP6G?=
 =?us-ascii?Q?M/4SFhEooqWvH9Uoq5ChQPTnaZNR3Y4uJijSfcs+CzYxHTIc2gtAwZUiQVVG?=
 =?us-ascii?Q?JM+64G+MaId0dYusFGqsES0Zs3hP/BAqK9EibDJ+vgpvos/P+8c6H0lk2uDZ?=
 =?us-ascii?Q?y2G+21PLtpDmViEoEe5DMNwofSDNTemL0pug7tQhc+RUmvCr03XVXDuLBc1Z?=
 =?us-ascii?Q?FSeKczklnHH8IXU+23d7BfB6NRx26hgtNkEN4WBy7kiLI67wtdZ/L+b/txkF?=
 =?us-ascii?Q?AsXsrX8EPVVHdnOSuo9Fcl8+ulMQ3+nIgWM4+Cpej9wAurkBg0lXNaZvRtZy?=
 =?us-ascii?Q?lcT3F8e2p6+YsYJjKWVSm6gw0N2/mdcEQNry4Gu0XTCZ9ZvgfuNf+Pt6ZaFK?=
 =?us-ascii?Q?2/XJ3P6XripRYETgsCieZpz7Otx6Qb+x7UTzNC4XwS2hdt8+mDcIXOYcuFuh?=
 =?us-ascii?Q?cV7D33hpPKh4opXGdQYG//Qqt2GuqGhJEMWCZyKYu/z+bX/kcO0WAyafgD17?=
 =?us-ascii?Q?3EVVoq39yyUo6zj7OSWWFXZWwhnkcVfB+nBOCtNQfQDmXrQNYb1uivbkSFek?=
 =?us-ascii?Q?bf5BYSlnTFEE1GUwnIEbZC1+E1KezWPznZ+D/GRPaPqaRU0Jf9Dnvwx0Ogq5?=
 =?us-ascii?Q?FTL+Ay0y60ICzcXEXW4vPoHYbOZcaT3RZAjX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:58:52.1194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aae435b-ced1-4c0d-2668-08dddbb00c30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316
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
index 7ce95ddf3851..315a1028cd45 100644
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
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE ||
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
@@ -1276,8 +1284,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
 	const struct drm_color_lut *blend_lut;
 	uint32_t blend_size = 0;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1313,7 +1323,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
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

