Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F8C1E482
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5AD10E97E;
	Thu, 30 Oct 2025 03:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="StD5MoSw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D3010E97E;
 Thu, 30 Oct 2025 03:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WssudIFKmoZi+FZdD/jqolQ358LedG+3lW0IUAyBeTWrNtO71P1p4ktbcwHsUx/cGti/K2pW0QcQtdAfRt+bbuI69cjkCpUMteCRASCHX3tf77mw5cBx7Ysvl+L5W8WlFH+ur6k3vs3c5aRFpqnHfVsleGRuNh9nt5EVW6uIsNhS0e65dn/KYxJSZSh0hyXcfIh2roHPYBMbDOeZ/L4TalxzoiM5guQj65/ofiDH5gRb+4vxx6ieN+MrqLsawuMLdm0GKHAb4pv05vfDv5NHSVMbPdshhBu53X04mJ49QnVOY7UKjtg+RpIoVUJWr4jWFYlh2jXG51V5LWixp8269Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKeGLucilGwchC3d+LDrdhPGLDJizVv5RBPyPTeRBxQ=;
 b=NbEc7zvLyN5sAmxK0YrLMWwlcgSyQDGtuY6IWC3aeKwVXpOs+kIV8rAuAFMUXJQx/pwc/5KLNzr3rI1K9HPxR+SyFdRPqSIqt6UKoOOvw7/9mXIZOQe4m7FueUSqbI3X7VmKopzgg2TWOSiWlEt66zM3qIHlWSiMXq3BZe3utvVxCKW4J27GPkj4IJAQLPVTWqSRJNHA+6vz40LELFdV4wf6wMdMWZfCM4WlTPk93uShbvuz1VNH/521EzQcS9rPApH4VoflvzvDtJ9GX8DTquE5y+pB+chsrw09WOHroa0tT4LXaR0ADdTGJb81KpDEssYAcwCSJNkM5YVGNPtepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKeGLucilGwchC3d+LDrdhPGLDJizVv5RBPyPTeRBxQ=;
 b=StD5MoSwW4ql6r4rr4KpLqy1SGS2buqFwHglaeY/177wAkWUPp9e2j0Sdobceu1piiyjmJWutoeRlsHRs3mjX/+phibkzdDYwwuk7ml/7C9zXkHfHvtmoreeJcNW1j9ujB0p3GmnkF0CnjkuTbEBBNFRfaYOMCwBzPFFBJhFQUg=
Received: from MN2PR06CA0011.namprd06.prod.outlook.com (2603:10b6:208:23d::16)
 by PH8PR12MB6964.namprd12.prod.outlook.com (2603:10b6:510:1bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:52:15 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::ed) by MN2PR06CA0011.outlook.office365.com
 (2603:10b6:208:23d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:52:14 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:52:10 -0700
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
Subject: [PATCH V12 30/49] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Wed, 29 Oct 2025 21:42:35 -0600
Message-ID: <20251030034349.2309829-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|PH8PR12MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: f574cf33-8a9b-4c7a-86b2-08de1767b6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lu+oa7bx1GE4+BG0toogKoxK+dAUciDjYp7qt2V+VB7q2KuQDbEZyLe2RSoi?=
 =?us-ascii?Q?6xGcNI/nIBVKDG9mhQpvGlP6JZONRlH7T2VSGH69I5JVs+zC4JlEkSCm5RQR?=
 =?us-ascii?Q?rW5wp49KzeI9S4IIAhSFdftfLHM3uCnmHJe0wnEHl5Y/gVkwSAnPiLuDID+B?=
 =?us-ascii?Q?FRfGSfyec/kasOy2afd5m2fF14BSP1AhOWvz0UezwiNCaz+iGcCvGGPveqY9?=
 =?us-ascii?Q?kryerRJ/4XJk52ME+H/vRSb/2lgoukvBBQGcoaiWwx0z8bvgFLSJtkI9SOB5?=
 =?us-ascii?Q?2xceJwdheqHY0YyAOzcqBgXGfJzgOFkfjwx2avxWuTlBR0pkhhI2VSfP8OBW?=
 =?us-ascii?Q?jEgWPg/u4LBTUTGX2qrRGmGELu2feNz1yheaidVo1lkmjyQphCny9voYILn+?=
 =?us-ascii?Q?sw8JfR5jKw94CRUjoW8f8jAwVBuhaYSCInhrH+m/G742ACbalZel8YUUrn4I?=
 =?us-ascii?Q?WoyiqL9X/VcTDY7/6vn32e1P66R06/aniytww9zDbXkVPjr/nPaxF5WiMj5C?=
 =?us-ascii?Q?RRgJrTBQl29DifH+rD1bAbu2+zM8yCCqkaD84o5hCuKi7JDQWtWYzxErSeF+?=
 =?us-ascii?Q?jmd8dxebYQgbcG5fGK2bzfIVuHc1UBl+M3g8i2CJf0Ozl+Q1y+jsCLCkFtwa?=
 =?us-ascii?Q?6sxCLdWsfZiFxfYVVJwbA9Tp51V2AnuSwUMUdiDk6mI9Q0TWC0faP5156WMM?=
 =?us-ascii?Q?M7O2lU4OuZlj65Isq1fsLioqicLikgWzy5nFTdC49YJ156JjtI0z9AavXVNW?=
 =?us-ascii?Q?Qoo3qEQecXrXc2c8vn5rqv0fF+cDwtnxtVy0PH0bkNJ6gwnhk1GeLhiw4WE9?=
 =?us-ascii?Q?GT6aePR5cU3smfxCPqAk64dyKn8Azam+Hu6CPL6Onr0a5XcLrW81ESjtaRgG?=
 =?us-ascii?Q?3abW5Yag4lSvAHNNdI62HYSP7o2LQtAAF8KrxEScG0XFuYnFRHAIVdDwuyMi?=
 =?us-ascii?Q?BJBv78oLEvz8waglAW+PhWtTuYWABSVC30/RRTSQeowySpsvpvUHCXhJlQf/?=
 =?us-ascii?Q?Kp3beeIS4FkKyZTGqogl6LqPXpcEeCMsD4rUdlfHVvzx9eS9qM9rSt+9Gqgh?=
 =?us-ascii?Q?BMz8SwaNu1faOjyg+4KisIvdtwkkcM4uJQtqnkOnG4EyE+NZE4qeli9C8nn+?=
 =?us-ascii?Q?8V0dhbJqdhgOLcwMwmhlu2kWIQs2XHclNOU5xAArD2BiQB+33u/siDkSTpbT?=
 =?us-ascii?Q?tIPd2pbwHKF++NiHqYQ1tiIwHgOWjZYPWh1G71lYFx5no0QY4sjJZQmqBdvP?=
 =?us-ascii?Q?xF7qsapdQ8mfj3NzmBvQHKw+F8/IYzO8RiXBBioj9ArXoXktl5/0EsogLseg?=
 =?us-ascii?Q?ZcxdKMelIiwJ+dEnqczY/Js8byK8i3J9YxtYrg4bPsLohIwNM9OYz4ReNras?=
 =?us-ascii?Q?T+GiAIE0ORNV5DAoGk6GzGQlTTTuwUoXtDys98GiWF7wsUG0Rj7yPE3zhYIQ?=
 =?us-ascii?Q?AQYEK/OCq09ZRrY1wamWFNR+QIbS56HZmg2jto5YUkVZvsXPL3U2jaeqfPMr?=
 =?us-ascii?Q?4RBr0G1yYe8hdJ7kE+RjvL4hqlnmRx1NAzi9Xjulcltd0xL7Rp4E19jb39BV?=
 =?us-ascii?Q?P+XyXyo0xtfAcq6ALLo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:52:14.7740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f574cf33-8a9b-4c7a-86b2-08de1767b6c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6964
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

