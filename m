Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AAADC074
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668C010E600;
	Tue, 17 Jun 2025 04:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2ArMjBgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E10A10E5F5;
 Tue, 17 Jun 2025 04:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSZ82sje7IfiDkQ04LbFZCVMS4ICGmOn9guazWUPeFqFCNd+xfRs6WK1vTBJEigUWrw1/r6xe0UErdQSv40dTRkWnwsi1MAHMobL6k517VKd1oA3alyS7hcez+cnF/4KkCCT9GH3Sz9HossIm/aRZ319wrOLCkBeYgBrzmOF/4A/kAD6zWRq0i+IAa0jsJnAEDI7q7rvt92FLkCwFEC+jLHWIZBwTqhC3r/z9yroroDc60Pl9/ij8njcgUav29CZmacvo50jWKLWKwlB3w1F0lVPTO6W+H3V8WsSx70Nv9R1HvsdDfWBiPyG72iXIbhTQarlFQhzWJZkeptL+WJDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSHfMKEiQvHf+NXKgZiXjZw3T5xzmCKBjltuCWFaBJo=;
 b=W5U2Zm0QmvTFRjFMjEd/L6JC08xfk733hePuaPko02VgpkCADkr5j3RIs5YGJVz7XlA5gB/ZJ0+s/5Im07BFWH/aRv81XYJOV0TwX+pZ6KFc5tSjdo6l5XQVOo3C/EtQwcro0BVcDuzqjVpgz0QzWFFVAnvsP6XmmKIrrfcDMLvKGfeO/r6EMQCbJYZT//Pcn5yNmShYTrvaW+DDaC3bB2IAdxZTCkejxvjHMkl4np9/q7J38ZahH1bk2XpJtrQaZz9HZurnW5i+j5M7qHpdYF32WeIZitsMp5Zr1kr4P0bMJTtbOnss+IRgYAMORTLKQ2NX9oKkrLxzFm+JNo/drQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSHfMKEiQvHf+NXKgZiXjZw3T5xzmCKBjltuCWFaBJo=;
 b=2ArMjBgsAEsf31tHuCkuRem4QO+OyIoMrSf6xfHTWWnIdjvgqYgoYgJZ+4NWVX5KiIRVMZZ7hp3TbmpRy0MrfOHub327ClEahuB9ZT7BnE/V5O5u4ky+QYZX7LVE/CYFYJfEdNWROPoeDtGgkRkW3mt5zgvFtN4ivLnkWzMV+UM=
Received: from MN0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:208:52d::7)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:25:45 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::10) by MN0PR04CA0011.outlook.office365.com
 (2603:10b6:208:52d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 04:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:25:45 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:25:18 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 30/46] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Mon, 16 Jun 2025 22:17:12 -0600
Message-ID: <20250617041746.2884343-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca34ab0-b299-49a5-5502-08ddad570770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IW2bmEr05h+hpYRZw/OW5/ou+Icw4NmTmmz5sOcmzUdZHFFdaU8RU1GxqClT?=
 =?us-ascii?Q?oOEz9z6KYs4j6vnKw2a8ox6OGC3QS7a0EJb06xbzAlYnmLuoNv68rhTAW1xn?=
 =?us-ascii?Q?phwJ+GIZa16ShjBVYkVpj75MzwwgoAQmLRdHO6eeBnxuWN3Vz64D4TAj44A0?=
 =?us-ascii?Q?FjFq0Xj+9POH5ZV8rKZnhetu7viHANXMZvHZCP0hR+krUTnG6VUdBdGeTGZb?=
 =?us-ascii?Q?Q6DlN5KTRKT0h/iUOzkes0U2djP2VgAaUPuQZGj9vNfqofKxGBvYDtbXqnvS?=
 =?us-ascii?Q?DN0wGZtpAlevixCBkdov6pSSS/FvuS5ey0hZnmmV7P5w0Jvp1ln2NRm0CuCY?=
 =?us-ascii?Q?xeG+iQ5T8it35WUyRzoV8ChGx4Se38+a0X7Wy6/SUALlT98vntFX9yQK/DtL?=
 =?us-ascii?Q?tvvDtHGSyWPfMM+2WyDE2B7OBfFGd1qRRXg2xy2BYtfSVpDdcaDrhwelz5aF?=
 =?us-ascii?Q?10xKEBmklxxkwy2GD4lATZBw4O0lqyRKRh74oqbjPdP341tOO73gKGR+Pxvo?=
 =?us-ascii?Q?sA+Y87C2Yow6TNdOzlAFBTF+28rE6/gakrQTAnSzwhR1BdHMICfF/PG+8D3b?=
 =?us-ascii?Q?b9yHCWGzqr57omfQfQwRye0e/1jPMUeFAh7awqRCcMktTJI4WByZle0iY98Y?=
 =?us-ascii?Q?cCj2ckYdkg3zD9K5b6K9ckh0M20h1ugmK+uLPoLpJ2yc8ffV/knpVRRczHEB?=
 =?us-ascii?Q?jkZTpt3+wGWUP+4cXuULsI4Ee4GuIj156qeD0kIj/COXb8Vf51vHwfcLhBRS?=
 =?us-ascii?Q?P4LtLODenojwa/59N7vOh+J16yojxwgxBtBRSQyAYHHyTG2JvQrlas3Ng3AP?=
 =?us-ascii?Q?FidJIhWzM+0v4M6e6dm38vDQYoxN7QR77dqZmUCvsF7t+8bRKKe6arnEl5AE?=
 =?us-ascii?Q?jKmK8exVetzl0eDiaskeVh7hZqjYVOPcwNlRYrTABX08bmugMSij3FupWfrc?=
 =?us-ascii?Q?vuVzdAZfkR5xUdp57nLohn3MGZKA5ZzTb7cgQL/ZcIhZ+2CX4P0/Qnj+nEn1?=
 =?us-ascii?Q?iWMQ6mRMawWP62tkaTwTN40yoLpA5jCw0fcz+Ua09T7I4IPhrGI57FjxGFC1?=
 =?us-ascii?Q?Yw+QZHFJTKWDKYPUUgGLACY5WqDEat/ljTHIIO1TwG4a6Gl4LlSyOVWSAbWc?=
 =?us-ascii?Q?bBCsiLngv02laWFLBOtBP8aT2QOWAQSD44ozZtQBjlHIlZ3S8uMcwkGE1265?=
 =?us-ascii?Q?+ESdzvdRtKedRCKHa/+3BK/fFdzAMfPCE/LeNBJSzIk0n7IP/IR4S4ZSxhQp?=
 =?us-ascii?Q?vuza9NrbbOBVFiMZfkJpmeoITZWtJDagTUDRP1cpPEClE7g+tQcVOcehXSl8?=
 =?us-ascii?Q?A9PN4SVsIF0b/1t8hai1ldyoIdHbrPkG38fSvpv+pxpq5OI8OnNepzpTjt9W?=
 =?us-ascii?Q?ldxeR/S+dikDIwSjtBFVS/8j1YwIc0p3IgVTeXsF/m6VycwsrkG11xxXmWoi?=
 =?us-ascii?Q?zxZJCsUordMtpKHzyob4EvYoCoDzO7vWnmZy8bEyYVKg4e6zskUqGqkABGBd?=
 =?us-ascii?Q?WbMdiHRCDcqCH96O8/A72yhYsVTT40kKtEup?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:25:45.4609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca34ab0-b299-49a5-5502-08ddad570770
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
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
V10:
 - Move amdgpu_dm_supported_*_tfs check here from Patch 32 (Melissa Wen)

v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   from "drm/amd/display: Add support for BT.709 and BT.2020 TFs" (Leo Li)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 20 +++++++++++++------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++++---
 2 files changed, 20 insertions(+), 9 deletions(-)

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
index aa6737f2b35e..1675913b3f83 100644
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

