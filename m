Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E271A72785
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047CE10E803;
	Wed, 26 Mar 2025 23:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HPBTTA7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FC910E803;
 Wed, 26 Mar 2025 23:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPFz7kG0/fjMMmuzN2skG17yxA0PNFTAPdCNqGwpK7SO7RUJashDDXVGgKYs0lHxv2il/0ctwPLxJn5VWX5t6UMu90npuaJTJS2m7HazjgjcwNXBSTgsPHwLdYbc2vhix/bjrDThOpzwqonuCc0yXBA8VJJ7bffBkiwjFai3Wzt9eMRREi7IHhWI98dTF7/Q3O6OZiLHwnVaDC6Ptw1s/dkVtzGMKplNNKvY3HeeBA1tOJ4eYUAGI2hN2nhhWrlVm3gwZOwwJVR/JY9upsQaGAhocrOFUn7crRpeGVfq+6oNq4/GJIRPOvAJVhFZOKqll3vbjcKkwWk1rzT214mRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmfgStxgV4uVYQ/Wzlfw0YEyEeZZNE6RLvlf6rHmqv8=;
 b=Z8mRKiGYt+MhiKvxpLIjhwJeWgDYhrELfWXi1nVIFTmLROWTibxppHEl3JlntbeyQyHJDne36YXYK8oA54S0ISeYe0imw0cSTzCyK4d/ALMOkUYz9ekNDjGz1//kwy7N177/K1qzpEK+dTfZ6t4BRT56qNh46hBX4dugRA10UGyRDJv+zIK9dXyQ/MygJcrDawiw98yQwOWpXbxTOM1PTpZzqY5ugQOZf4UvgXP/EBPdCYHBXvhJhfwC4PLBiOr/YI0hden4uPf3eC6eJCPKCNhHsu75VxqMNKDUCGYh1tpYFSWS2GSDk1oZ9VUqIVJbTB4nCHRfZl6Ay2wK043Ygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmfgStxgV4uVYQ/Wzlfw0YEyEeZZNE6RLvlf6rHmqv8=;
 b=HPBTTA7gr5kbtDzvpb9ZFJLPozcxwSm37GsIzDyAuq+NiuW5+cwF89OHRsbxy3HNiu9/VjJTCdZN24WACMHnT+NmW2uiAvWZ3qrArFDHcxn60V9Fk1GD2K9EEUpXRidQKw+FMe9nSkTEvvymJKUGmqBCVi2dRdKMJcJXgQ1CjlI=
Received: from BY3PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:39a::28)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:55:54 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::f7) by BY3PR03CA0023.outlook.office365.com
 (2603:10b6:a03:39a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:55:54 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:55:51 -0500
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
Subject: [PATCH V8 31/43] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Wed, 26 Mar 2025 17:47:12 -0600
Message-ID: <20250326234748.2982010-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 0327153c-65e7-4327-1ad8-08dd6cc1bef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vb2+MReUdIVAVGGruTm9/4Zg2U6RA6dxdxd1wp8BKSa872v44S0DhJnuuvbr?=
 =?us-ascii?Q?zY2HnOzrFwP8BLlycGWCUROFpxqalpCEVMnvcvvj9rLuFms939s/NRyJIBDL?=
 =?us-ascii?Q?jUzHVYcZdad8bAL3sW44ZRfq77/jZrijHJCYm7f134xfeHffMsRUYbpRQmjv?=
 =?us-ascii?Q?jduBPkZ3HL3ym9sQzC190nqAA8o9oAcbGxjQdXA5HzPPsLrvcJ30wxM2WJtB?=
 =?us-ascii?Q?p5eyWgCoTxj7W/Oq6yY1dhkb/ymwMqPBiMXS2HOtjMwJSmD8ErMRg7CmCmEX?=
 =?us-ascii?Q?4USf1N3ewpdTdwNBqbAGTqpx5fTDlbDTR+Au7VBEM8xJjqLp6IS95eiefG2o?=
 =?us-ascii?Q?NFO6SniTItbwCW3ZOTLSiVAu1TWJhrLO/mYR8bHToPphhsv5X4/Dps9U7ohN?=
 =?us-ascii?Q?oZb7BIuhFHYvR1CT08DlWx10TEgeMm8fo1iJNL/+4tiT0GJ61V4VeU+2o1o7?=
 =?us-ascii?Q?9ZdxmxjQfpQBJGTdnfn3n1k8zPgE0SnE+7X2S9lOu7y/RLTiLY279cyU3YZZ?=
 =?us-ascii?Q?6xeZwqAQjKb1NuuVXjo6sw6khTUxhykwJOwW5GZ8e00ry0GIQhJu4XbTe/JH?=
 =?us-ascii?Q?I4ImDQ4tK6OCDzeDi/6GUKfnF75/UP1KQg1vfQjkhdVK16k9jlTLHY/lrsm0?=
 =?us-ascii?Q?XKriSOGNBEeaD81kPP5XlTX+53+ljtsgovXsClPganJ1LccJIUqCLDlC3oVY?=
 =?us-ascii?Q?htZMCsaqBA3WaqgkFBeWElt+sXOy1bawqYr/4FkjmdYlvQbmH2IxjRDxOr/H?=
 =?us-ascii?Q?O6IgA0t6b5PN7r+BKCf7SDwgRAJiuWRntmK7nLB9bko3yIOJC4i/PeAOFXJk?=
 =?us-ascii?Q?XZLGn5Isfk1xyvwqzbt4vxuQJwaHKz1qji3rpaAulksMRBUmH+aEJFXts79g?=
 =?us-ascii?Q?Pw2w4aQRbC9jWbwNc+k3sFCN2TW1Jy1ok0orupFTueTF++PDPDoWXwja81vy?=
 =?us-ascii?Q?NKspX6Cst+wev2y9CTpFUYAayWcf8oo5xW1B6qlLPVTKSbo4tYAfKmtK1wzp?=
 =?us-ascii?Q?hNcd5dKtYLz3qm/VXoOTVlt1Bhh1R51B0ByPlfcmiTp5raahDyDzOLNpGBzr?=
 =?us-ascii?Q?A3BrM7HuOr3mReOJTBGfllpVKxvGblNdR/TYqwY+oLi3VXZyBNfUMqchNd6K?=
 =?us-ascii?Q?hAePabyet5PanKw3JxYn+kpW70wKgunK6tdLh84WWfYjZIfPXNRFk/7m0do6?=
 =?us-ascii?Q?0dlgAz/Mrags8L/IQTTLpUSujhJgglT3PeiIUKzT7o+yFUJh3n1mEWXiVRQF?=
 =?us-ascii?Q?lPPHPwUhr0SalTPDC8BcVoJ3QgBNjdDcw1CmAgKK8QpvBHnBihkOLp/J1sPf?=
 =?us-ascii?Q?nhxZB9N1mDana4J6nRHtQdQEmsciMvEN40CjVgL14h40jAwMNKty2zp4LNMW?=
 =?us-ascii?Q?0ld7LBTWOeT6irNFf/tHAdzamj7zGioCm3/453NfviM7/vlCU+GtOKl+kE9+?=
 =?us-ascii?Q?87vZS7UxGbCvqyhhgL6rKwbjSlyPTfHecSLMIAJ25qARhVnhV1idbMeRxxDa?=
 =?us-ascii?Q?htFAR1typbP6vNs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:55:54.3647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0327153c-65e7-4327-1ad8-08dd6cc1bef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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

This adds support for the BT.709/BT.2020 transfer functions
on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this change the following IGT subtests pass:
kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
kms_colorop --run plane-XR30-XR30-bt2020_oetf

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   to "drm/amd/display: Enable support for PQ 125 EOTF and Inverse" (Leo Li)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 63044e0296cb..1765402bc122 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -676,6 +676,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
 	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
 		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
@@ -1284,8 +1287,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
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
@@ -1321,7 +1326,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 581f41907c79..ff5828a1e8cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -33,15 +33,18 @@
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

