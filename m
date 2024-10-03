Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF9E98F7B8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A0810E968;
	Thu,  3 Oct 2024 20:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LpUdiQ0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5E410E94C;
 Thu,  3 Oct 2024 20:01:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2BCh1EfmbZ1v7BwQl5wnX+afTMZ4vONTBijX88NCZ/UgY9Q/6sInWO4qNBSieWUzUzmeHIj2b2M0+q1TYlY5GTVn6I3XHdKyYDUIc1fyphX//d0gdkLJ9Pc0VDV1xsLiLAOv0aAKRJ5iIhji15Ky9KPe0Wrr7lF/X5taPRK1B9FMVarBRydLj7I5JfZlOIGl7+Ow7Gn7ycM1rEfq/iMIH+b1Hk4k5SnSPRR5e9fb0W3Gg1nOSnwFUgzdRj/hw2PVTR+fa/Xugj99E5aN0690Evxp5LMcadCEG6FnDErMEZkMIQcuLRCpbthUPjGJnmOA/cso3pELEqMq7LW9HWkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRS6B6PJ3nV1gMwzlrwm+6GVeeEJW3l8bpXxMD4eSpc=;
 b=CHIhaxU+0ohgeSXEs4ltPTbP8goM3RbkEKuTx4mKYAc+5dnu+KOojJllDhK9tl5p+weQtaSTzhfVp8EgeTJwPXmw5KtH0rwIFMGLDJBEW7VM1SJmSh83unJfkB9g9Ux5I0le9CKTGLBvnxmLlm+0A8d+2UijiVLML8LXQJ9QoIY3uM5oMJJLpbcts5rFmuYrcJUiODYaIvxgJoLJ5N81QqAYP5UfL/nAm0IjMb2eCwegwMAyD/phyuGxLA/t2Vp04W33mIgzMPwkFCqG/BC8qlWni48byzESDtAQQEFpSSMmTDwpNUER98I0WYHDA7atYn5PBDUYzr5nCuLN0BA2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRS6B6PJ3nV1gMwzlrwm+6GVeeEJW3l8bpXxMD4eSpc=;
 b=LpUdiQ0CrfV6JoJXyii3D/FsxxwYelMrLSsi1o+KdnBVybOyH94QgmhcTkys0D8YwGM+ORfa/vnw+LBJLlTZh+5rLVRkTrnHjBFCrSWtvd5bQv2kvsUCiqo5ic1XwjGlaU9BRx8JCnVytyhZ8VCUX5gzzCBSxzEX+pRUgoivSxY=
Received: from DM6PR04CA0009.namprd04.prod.outlook.com (2603:10b6:5:334::14)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:52 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::d5) by DM6PR04CA0009.outlook.office365.com
 (2603:10b6:5:334::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:50 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 31/44] drm/amd/display: Enable support for PQ 125 EOTF and
 Inverse
Date: Thu, 3 Oct 2024 16:01:13 -0400
Message-ID: <20241003200129.1732122-32-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 776caaa2-c703-4b73-7749-08dce3e6391a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZwR9Bj7CLzaJ64gFafYH3XmAVvWwZ/HZr2MUQSFpw6UIFQJ12wxhZWBeUDv4?=
 =?us-ascii?Q?8220x7dyaTcF9NlZSp5JaKR7DUilD4LLxRzLn66n70+JV14RL/RKy24gAi5A?=
 =?us-ascii?Q?DdFun/pzf+h2NleGYuV5bATYiEabgeSRAWeiFOM58V8s9i2V1CMbDSJUk2Hb?=
 =?us-ascii?Q?k0wrpe+9rgmudZchm8WfoZ1xm6f8Zw6ICd1FavYbzWEYgW7H5XIEERGoeJyQ?=
 =?us-ascii?Q?/Cj/sWhUKGVfcifRchCH+cX+giGbxmsSBjPcko8EL7nLVGt55PpE0a9IUH9R?=
 =?us-ascii?Q?CfAjW0J/7zuJ9QF2nInAcEYMPXESA+/h7S+/tu/gBxKOPpENKIz9j5RCFFle?=
 =?us-ascii?Q?efnc1ICkMdXWGJLW1VRz+TJJtsVZ7vLWS4iZAX7YKITn5H8SXVJJceQiwcl2?=
 =?us-ascii?Q?2hVzlOx+4bWiXBCSF9DsD7U4NrxVN4VGNvPlOkhFgisORCckXPIcAI5EwQNm?=
 =?us-ascii?Q?a832wiJ2bFRuasaIRdzknyCK9QxD7Ts8HXRTwS6/Oxhwt2wVkkl3P1/oS03J?=
 =?us-ascii?Q?N/A3EYHL1TRGv79Ne37Lx4MiUE17LJe4z6F4Puc7poAXIag4eTfMy16nNA/q?=
 =?us-ascii?Q?F/uRHMJvuKcGAW1OOhP5uxoKnjZnr6DAFnA1Bv9OERj/S4WyvgIqGaZNOJuo?=
 =?us-ascii?Q?Pa5YZTy0BVr+Zv4+estSMCwYV/I3WBksgVKUdka9NTNhZqBJJl8VNw2p3ch+?=
 =?us-ascii?Q?bmOdxai0P+Nwuqo820LqqB0PMuHuxohaCbyh67oVuXZT1F9AnHophcwlwfm8?=
 =?us-ascii?Q?ZpJ2iVhzm56KFym3Qw5z9zxoXz5ts+2FAwworJZgJVQXTGWx8BauNH4G570t?=
 =?us-ascii?Q?+lz1SbB9d1tug1ZURq/XHIMgyaGW3PUe67mj5zRgkC94EdEBZneVH28Ae5Ga?=
 =?us-ascii?Q?DJH4C7ZoXL5vGs4bEtyJeXQ7plSth4WmcnOhGe8LQV7UJS/UnnMe6MlQPgNL?=
 =?us-ascii?Q?zYwhqNLJKXNo4RaHP8bnnLNHwqZxjabWu8xWdbHUBIfrwRw5v/1yzJbN6s1e?=
 =?us-ascii?Q?hJmlF27cz1fh0gCorw6d9Cf6aBOvnAgZkCCg/F9ZIKTba0xZyxVdutMihbPq?=
 =?us-ascii?Q?huQO3ZahpYuVCNwCMaZ67bE9/dNdfRPer9PM6VjWZjIZpciFGXSMzZah+dht?=
 =?us-ascii?Q?X70YXHETxwpk8sLBZo0TR6M+BWQBm08Uvfdv0iBYeNo5/rmUjqZEcW084dwx?=
 =?us-ascii?Q?QMFotH/w47ILy/ifuiEAR5m6w+bPob96TpaQbJkNPE19s2nQOiCsHl0hFwZ4?=
 =?us-ascii?Q?k/iku9TrCkyOguTQRxajJuFOhoEiSKjtE7XefDoxZ+0cN2rqY+5xm5Ogh63K?=
 =?us-ascii?Q?RgSfoor5yL82OCa6ppjHDVGCUG2uQVnVmGD80GZPlVeXD3Q0qVFTGVjuiSpf?=
 =?us-ascii?Q?r7TtZbm57b6YNGwphA91m8FYNREb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:51.8536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 776caaa2-c703-4b73-7749-08dce3e6391a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
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
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index f0dac44d97b3..d4ef20bc2be5 100644
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
@@ -1211,8 +1217,10 @@ __set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
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
@@ -1248,7 +1256,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 7f58c7b6a1e0..0578f33c8422 100644
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
2.46.2

