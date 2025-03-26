Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD163A72781
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FAC10E7FD;
	Wed, 26 Mar 2025 23:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RQBT3ux2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C5E10E7FD;
 Wed, 26 Mar 2025 23:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3A4lbrd3mlCvdwqr29hHF5mqAD+dlqpU32VPWbJqNs/0ZjQCnBkyLXN3aG2Z0QjXcNasv2yROjQjAFr9DX8hLTDTn42G5NovbSr7RPDJCt2G4IbFEMmtSekwmlINAJv32hSL4vXI1near+61CLzwOOJ9doO1OqZQxXLsWwqe4AsegLb5M1b8EdUbIRZaBEizU4UmRzI3zMBawK0p3EnmxZNMU/0q4LbaWmkKa75jcfGw9xkzZ2GbBdSLmIjKyJrlv9ApWyosJb0XrUxV8KOCAze+uI6lzqX/ZRnWJER0IOwo2JcDTvh4H4GD3lX1OEM4nHjrMJ6D3X9+8kf5HNE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVdIDA0JktNTAECzipE2utsSHoK5hNuScHwmaSPyh3Y=;
 b=SgT9XboxRy6r0zzSkM4yyML3PQ3S7Z/8LoGfNGkF7njnvx1isfYhY6JAQKVaTMIbJHpk1oL/z07fjK8DyTCQDm8+ns1RVT3xDIJ7KRUGWzyfUC64D3XPLigf/yP+TgHY6U52NqpKZKS7j1g0S0jpRE1TcBuNESlBDA9vrNjdDDaEwZNT1IOvF0ddg8T9hZ43iYWq0r835KCJ5ci4tH++LVe5Eys+UmmJOOGnc8DyTDyRg7F3Nu2F1c4Jkekbcox6RwPX57GTqCLEhizj3hPi0JyzdIAkOa+ri9/bjkZR34fm/0HyfLl9xxxQPdQGDFDieUmtz3aPfysAwvzmo3dRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVdIDA0JktNTAECzipE2utsSHoK5hNuScHwmaSPyh3Y=;
 b=RQBT3ux2hfhZyfSh2c3Yg/swXMCAktpI3RLft8L30MwIzgZf0hT0hG8ezbc7nVUNkpQnxOsvyD2kDe6jmtA93Luc8eMiY/UBEiF9W5P8n5w1hYmZs6AkM0ecGwdKzjxgRvOshYorZYJOlc8fIoiu9O3g9KFyRYMi293n7AULQkA=
Received: from BL1PR13CA0304.namprd13.prod.outlook.com (2603:10b6:208:2c1::9)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:55:26 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::cd) by BL1PR13CA0304.outlook.office365.com
 (2603:10b6:208:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:55:25 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:55:22 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 29/43] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Wed, 26 Mar 2025 17:47:10 -0600
Message-ID: <20250326234748.2982010-30-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: ead973ce-5da1-4895-2ef0-08dd6cc1ade5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MtrZ3bknhFDuwsGSQbmc8gSRqEozFjCDVGad6eQG1ahHI7/scAddKwlLjc9C?=
 =?us-ascii?Q?6jcsKvV+SCiKkPsP7vOKB7/c179SiJ4kfWGZiNh7QFvj2lUUkiDFo/umyTV9?=
 =?us-ascii?Q?fHyEjOxtE1JZabEi/jBue5MZ7i20RqhaKV6U+/5gvpW/HTTmnnaw/dyRJREa?=
 =?us-ascii?Q?3kM/588oFg75OHa8mSOdsXGMsN15m5K3fA684O3CSS5Lm1GNODxuwCokiwPJ?=
 =?us-ascii?Q?8hMfdLjnBAHzV66sXeroyh8NX5yQcf/zzdUwgt1GhSqRkyG3cfVmwOrfLZf2?=
 =?us-ascii?Q?8Ql6SuqLjK1/nrIzilhBTakm7i3HkP/fIM8+pKwrkxUqSsX5HFKDDxG4AAet?=
 =?us-ascii?Q?cD5tRnY/w5EciFQxY5It35Butt/L5np+TA3i6ePLizZWNZ5lh/5ETcww0vOT?=
 =?us-ascii?Q?awIzBsue0LETQu77lly3XxcJuY6lbkVZhlpkRHgRqA8XDlm/q4oQxybrDV2k?=
 =?us-ascii?Q?1wQug8LXH0nKtApdCgdvzWkUOFLp0MzBkou6VmfFwQyvQtcCTa4OH77HOPvT?=
 =?us-ascii?Q?MDSCthmmZEnnljRGzSXMfJrTm+Bpf/E4e2tdoVpcCjL14/ZLp4TqP8VtRYnj?=
 =?us-ascii?Q?Nb1oMBvC7h6tGuiUGMJF5iRTCXO8kmSHSugRPaXh0CtZam6KleJBJPmyhiBA?=
 =?us-ascii?Q?kuUGGIT0sRbZ1G5upgOGvcmUI0tdCV3FNfJPUpqlsQqERrV+ahRLmj441XqD?=
 =?us-ascii?Q?twaEk6CSnk+EQdbPBc6u1M3Qzl7EZAg7AItwGoIcgYPHhFs5NaeyDpfm7Rqr?=
 =?us-ascii?Q?6Ga/QAKfBgjLJGBQlgiy/QUNa7EMi5UnCZmaUJ+UWVNVntTh8EzMA1dZ3RlK?=
 =?us-ascii?Q?DKmV6Fo03yeoX7v1pCVMlVqQMjvoRHa0mY8/yK2y0I/hCQPZ7+jvmSV5kXvm?=
 =?us-ascii?Q?SWXtJgDjXkn1jdsUBxmeHdoiJ30dnxAPkeUUtKhrcdGufmiO1XvPFoklbIyt?=
 =?us-ascii?Q?odYjVLDbeOT05VDOKu+sWjc8xjx7pUEfOHCrJkJbcEjE5Rz5qwdHtvSGqCpP?=
 =?us-ascii?Q?eV5s/gffoG0t9dPWj4C0w2Yf20k9z9aMltDGfpKdPyCC7Nf0WR902MEr5HMS?=
 =?us-ascii?Q?Ogw2CxugxrPKruVA4qWImJfVe1FEe54dZxdXcGjXFLmgX5rTedzi8CS/C9Ak?=
 =?us-ascii?Q?QXSf77gA+w5gWcyEogRzZz6sksLPrL3HLOUYIY7Wzzr72eLTLHxHtr9ZkKbw?=
 =?us-ascii?Q?KQ04cZPKsIXXoDARfUIX+9DlXKJA+JUI9AsvERdWwtr87S3RwpaV5o4V/T/s?=
 =?us-ascii?Q?8Ye1P0ONSgz6LEYJXbc6DAIKILPb+REFLB5BW+PAdd0Vgvm/X4u/8l7N+iOi?=
 =?us-ascii?Q?Ua3X9at9ZEwpDh4iBiB2iKrZ58VHzfpnweDipqhwadluSytN2shVoFwlA8XA?=
 =?us-ascii?Q?agOhrRFqY0ukAUx6DHnuczQWOvPFjGyr/ARYZDaFgBDh8K/G/NTmh8MGZloq?=
 =?us-ascii?Q?4MkNZKk2xbpvqstIGBSVB8MzhAA1LfhfesgxR9880fD24oNQ3EJTgpeXu2eg?=
 =?us-ascii?Q?lzBsUwTDR7AvEnyG0MguohQl+zkOwi1MkmNl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:55:25.8132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead973ce-5da1-4895-2ef0-08dd6cc1ade5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
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
v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   from "drm/amd/display: Add support for BT.709 and BT.2020 TFs" (Leo Li)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 20 +++++++++++++------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++++---
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 7ce95ddf3851..63044e0296cb 100644
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
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index c5154e1430f5..581f41907c79 100644
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

