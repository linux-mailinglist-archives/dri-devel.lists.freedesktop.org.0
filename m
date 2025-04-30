Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E2AA4066
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576DD10E668;
	Wed, 30 Apr 2025 01:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZGtxulHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1F310E65B;
 Wed, 30 Apr 2025 01:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAgTXw6BIG3uvzaMSNSgji67DsMK35bmkGT7bJhyStBVy5SyYenWvga4DqiKDOHbhYUHNWi6DOEdoEJE19TPKjZ7lqtMYuEVk2Lxl6z6n6wQ/UuhxfgsP1a3NxNIVZU+2Trc9l6fXeWmNDww2CRnshNiiipT3fCwm0rosdLu3tGKmSkzFdn+ZLuyHCZyb4071tI2L38U/klGenFB6fTCVhhBQ9uHtrVt+vqDa9k2WF+YH8TM0Hp34dsQNmy1Sa0UjoqDLBf3i/KA4Irhf2MZpSH0TCYJVYFIXshm8Ueo8Y4cGpoLPtlgAv2Wf+/uMsxP4Ly97FqBHnZh8xi8p8qBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib1VLUDH2ScKD8gIzgGOxvz8TfdqVmwswpyY9NIvQfc=;
 b=qPEsGLwNv2EZ+vXkZLP3Hujn7oDRsnROnXdgHAWVRTxx3GQ/zXrGPnc17JXLmYCrwcLp0HsOqWNvjyDdpM+gyWC8NNBprIe3Y9TLB0In/HgGcwDVyEufBzUU5Vs863dLYF5jiA20W+mj0Efxr/d75VsbnHNinTFQtCxd3EaYtNn+xwZ8iN70lBPYhf2WvqRZA0Y9vTBC90wN+SUHD02YYB36l/eOnMbH/VVdflsALi0/S/FwbpoyC8igSwqhvrDD3v4fyZptnGw/PVQ1rMgb6pj53rv2UoBkf2mECbKyZb6LSDo2GRpvR3eSwhXqwYYSDyzKuEmu2SCW5zMW/dfP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib1VLUDH2ScKD8gIzgGOxvz8TfdqVmwswpyY9NIvQfc=;
 b=ZGtxulHhkCiz+Q0Yy8gQ0dyN0O6s/tajVC3tNFRp+9D+3WxyrAhHuYIQZy+UGBcnsAu2iFJLrX6kMJYCgKTlV7QOEeBp4zk3IsXwjlmKNufRzB7zC3TmrvgCrJoYR6G6750KbqaG8hRoaYM223h5+P6grMbBBz8U4hb/xw3bT6I=
Received: from BN7PR02CA0006.namprd02.prod.outlook.com (2603:10b6:408:20::19)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:19:15 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:20:cafe::12) by BN7PR02CA0006.outlook.office365.com
 (2603:10b6:408:20::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 01:19:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:19:15 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:19:12 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 30/43] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Tue, 29 Apr 2025 19:11:00 -0600
Message-ID: <20250430011115.223996-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 16514757-9c13-4275-daa7-08dd878505bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DC0s2LFcO2zO7B9wzr6nQV3t9gX+03o25Hd00VVpX/a+i+EjvB6YEnSQis4q?=
 =?us-ascii?Q?2RW8jlXgVd3vAyi66scdEfZ1tmfqMr7gXBZV2g/m8plkRaTxT442aPj5QHCy?=
 =?us-ascii?Q?aM5V0MXrT6TkSUhhVsDSSHFjVskgWx+o171dfoIey/W8swLeRweiX29NE7Xv?=
 =?us-ascii?Q?CdrjpqjsZVofaQIuGveU5uoSxIvTeBBmsoi6Hx0jNOTpTxLskyhD4LDAWrqV?=
 =?us-ascii?Q?JKEV/rrN1hZuTJ4y8kKnzis1S7MFSxY5Tj5dQbVQn61KKMG6ZiMeYgKRs8qb?=
 =?us-ascii?Q?b1YtGkf+vN8qpjH6KY9hEo3jYmLIEJU9PjC9F/Yca5Vcet6n7iUGxhBVODDa?=
 =?us-ascii?Q?9lNxh8dk+mD8FxTPbgtVD6pDL6dMsiEqqnNyqMoqVT8zQt6i53P2LIuVbasO?=
 =?us-ascii?Q?YA6q0VeANylJ/m54fwaUosHzUylIOC5dB0pE7p4uIwcJ2kp9E8HaK8eia8B0?=
 =?us-ascii?Q?fXO0/yxwaZ3LRDv0emHhENGuu8yJWf47t+ufT9dkHCRbGFFktYlmDDNxCoEu?=
 =?us-ascii?Q?QaHEBLMSKkAny0JXa9/fgzLWjNY8g3ov3xQzB4c1jH1u8csMGCBtFsE0Ayof?=
 =?us-ascii?Q?V22yVpDoFb7zn2k6odMxQPhB88dikmY/VsnmCASJIoe+n3+HAayb2V5hXvNw?=
 =?us-ascii?Q?DhiM3hJWo4eUoMU0wDc4z0aUgP0ENGsFK0QQOiS+hgsYRdv8EyCQiniUx+ol?=
 =?us-ascii?Q?xVqM9u7OuKFBJZChxElXg9SNa8mZlPX6qFJtMGe2d1MFk+Gcjjwj1Mr2VDiw?=
 =?us-ascii?Q?qiLw7wZWOtipjDCqtn4Df1L55kt4RRbnH10jLma/PZRrXOErBPlzUq/s5tmP?=
 =?us-ascii?Q?XjVh0BXt53a2KITTLaedGwlAWV4CVRdyZsRPP7VCXNJ0GbDpBfKpJb0UKDou?=
 =?us-ascii?Q?d3GsiBKO5LL1wcUsHISb2MYUEt8Rwxl1qlrIuh15A3HQwLjAnMpxNcJKnlh8?=
 =?us-ascii?Q?mWVcjJtMm+P4959hweaMpDwYDnOZ2UEV85rhFzmUZl4pdar0NPenKmCHzSAd?=
 =?us-ascii?Q?ETRT7CoskA7JZu2aFzZnPhYDPfo52wUF0VxrKXq/2tWFTpb1VX7IHxwoAuEd?=
 =?us-ascii?Q?yrYVlfErVynxizqpOMaG1FSagt6g4atepmFpDyhtZuQ4BQyNsuMqW/e+ojEu?=
 =?us-ascii?Q?1VJebAjVzRDuGVhJGujh/yFY0CaElRV4o1k+VG4pxoCDd3lVaKxsJo/4RFFg?=
 =?us-ascii?Q?nlTbgTWNdJCveCpgKVCtiasp0KmGHcerLkB3cshV1IFnNrN2ETvnVFHWde3M?=
 =?us-ascii?Q?5Rs0gnbKo8bQfXZ3pzj0u6Uo1hBmatUihSj+lLFDgdtIlovsRHJsbDeJJy6J?=
 =?us-ascii?Q?XwVaF16nrL3bVulpnvLoUNzelhtLKw38qaLjAjb9EfbeTy3gVZMLofBiCP3o?=
 =?us-ascii?Q?86z072ihOcvbKiklhk8dMXHOx+EsozzRxrmIOC7cqvPHYOR/xCaG2V5vcXX1?=
 =?us-ascii?Q?fGMT16RN1FoslVagFOkn7b9PzlpEln2A1eFEQurawQS1vzfjOO43B/hCArTQ?=
 =?us-ascii?Q?9hcFlh4rnNfx58cQSBl2Vac5dqNrfyPWFWL0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:19:15.2906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16514757-9c13-4275-daa7-08dd878505bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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
index 5ea24da088b6..aa753b0d6f13 100644
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

