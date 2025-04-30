Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF72AA406B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D2D10E675;
	Wed, 30 Apr 2025 01:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N94ZVejv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4969510E675;
 Wed, 30 Apr 2025 01:19:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbp6UfE3Q4iDE0JZP5GnBxDz3DnrsrKd173pvz6KQw/PdEtoTkFNikM4V/ChGICI35qEAgNVJy7eA6jOQXInH1N5EDvzawOxt2TZa8r1Xe05JCRgzVgo4VuLZ946G7L9dbVDr46DaHNFh6Z2Hog7LO6whgVdFh6hXmQhxqBd1TxB7mBZ54xjyaJ7ND1eNpJX7Iv1sGv8UYoNny53BFYizwZZ1SqNNZ5zDAk9FI2kSEpGSyDHxOlFw0/StQuFIwIO25F2KEBSoASEaux+UClxeCSH4/fUh3YCZhS2pvzyMOG4D1MeKlwj7+5T5u/lkEkAWLOhqZERQCswGAVExNtHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sektRwsEiRyXogD8n/pZ8eIYhGlsvlGNqdQ0fS9ytnM=;
 b=UYsbJLCE+dQPlZ3fScRh0tWKW+hnFem6iCr2XQbOicMqfgRwly0SibHnS0uj4lR/pdEG3pUC4phVn4r23EWpOe3J5mizm+EB5V6vXkBcNSxR22NCLgt/nsRNXw4Sk2sE6XVraOgXoH5B0ti1is0KFCPUbqSlUR6Wnozq66jrx5ji+NfZ/O1uQw56kLlU0cBg2HQ4tshdcBIHYot9T8LmBMnvWKjV9V3E2L87WgV3Fa68lZxXclJUPCajcw8JrRH07XEFFaYonDW/sxtlL4gbs9MP5CfaE//5M/8KSZunp/F4Z5adVMfGwW5Y4N6YHjWcri14d7GRxdX2G6Eb+Em0MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sektRwsEiRyXogD8n/pZ8eIYhGlsvlGNqdQ0fS9ytnM=;
 b=N94ZVejvSmI+b7N/Q3K/Ie8YVUKE7gknWLJrD5KdtrO+bsTGnEPQosfcBwyIUhU6PRN13eIzfqptJLRoKtCVquYZQyTTEFxbjOgTk+2DnZ7R+NKQZl5hHd0ss+kYm3bq3GauktfiSvgQnl4KjUXaHB2YHWl53wiLlvPDZ2Q5cts=
Received: from BN0PR07CA0019.namprd07.prod.outlook.com (2603:10b6:408:141::9)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:19:45 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::61) by BN0PR07CA0019.outlook.office365.com
 (2603:10b6:408:141::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:19:44 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:19:40 -0500
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
Subject: [PATCH V9 32/43] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Tue, 29 Apr 2025 19:11:02 -0600
Message-ID: <20250430011115.223996-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9fe4b1-bfd8-4d9f-8f3d-08dd87851727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AvlINj+R9JtCu1RcAL+cw3TXD/9cgaHtp1vtE1JUhpmCPRLoHeigAiTGGF/O?=
 =?us-ascii?Q?2D4sARjGrVyIJfCjcia2QomCISX213zqWbQ5Jub6+twJ4i2SXnohb9yiAkCW?=
 =?us-ascii?Q?yTZDarNZ65r/bUm4FA+a/nRzEJ6pn6pRE3vgQLRd0Gzbhb8/RBsi1eh8xEs3?=
 =?us-ascii?Q?0Lo67JzrUdac+i4Tz40G0QNCsDi9Zj+2TFoJYSXyKjQYhvqEWzjEdkqauD3Y?=
 =?us-ascii?Q?YutCl4P5hMRsFLFK3+fojz+o6KQUqC7W/NbvYI1PoTNsfwBUWUyXaNiEMHMS?=
 =?us-ascii?Q?gLDeniX2np+V4lppg+MJC5FTfxSY9vKCD5YKWH2N1mVEYmJL6Y+0orBfrRe7?=
 =?us-ascii?Q?QqkvWF6hiLtCoAGnN2myRMZGSSLPFD56n9drMSlpv/hXVdYP4/viUWUjJq2w?=
 =?us-ascii?Q?U6P64MId6kY5W5LlznGE3HMrx/EGjE0GPII7Sygv9nAeyOLp+v6YxlertQQT?=
 =?us-ascii?Q?p830t6Fsb5n3bW5clgnCLLj/QuUig7U8y6sF0MPyrMZT6pY0Xt/zsABF3Z+q?=
 =?us-ascii?Q?77v9jjemEzhvBWnY02qCGGXtUOplNdnR/iUpEZ0WS7YS/Ptqt5ih3o/yyolo?=
 =?us-ascii?Q?/ZGvvcuTCaOM9BFP+FqKmKeEqJbHbERKmHsmBeI9HUfnwMzP/gCh7K8XqLip?=
 =?us-ascii?Q?lf02T4BIPcaIEttPowgxN1Z/pHCHK3ascUNnitg1Z+eBOSIcg0RGUS1yv/1x?=
 =?us-ascii?Q?5lRbLJJqGEgCeHpgomTy8Gqu/pw9XZT/uSQHZbPqx3cHoHlwrLaLG6ZK8T8A?=
 =?us-ascii?Q?Zbq4hQPOeZHX7jcE0uZi8kR253akJ9bN1L1lLNB34S4LagBtVqunvQnVyHzu?=
 =?us-ascii?Q?5j1v1k6M6vWD8FJHt3lZAQbXtiarR0lI/OngzlsCLI4tj97RIQT+ysUoiPLj?=
 =?us-ascii?Q?O84LYW7rNLI5DyWeZ+VeA+0mkF6sVLd27UYHBpw0F1W59BsCASUB0LZ89KTU?=
 =?us-ascii?Q?GL4WCoSw/tg4THtjU7INFABMietRiIQOMJpWdzotDv7gFYcgAS/rALlxpvl/?=
 =?us-ascii?Q?IZjDYEMg30er6fiKqQ8g0Ubx6yv2bOI9klHEoB/ZtETSeQoAnV+t4klKTQHY?=
 =?us-ascii?Q?dkdmmuJWXDl04wjs9ZwWYGdbtDhUeb7WcpW2INlxOBpKOf0djA8VH1xO4RoB?=
 =?us-ascii?Q?oiE5C75O622469JW5Ir1gFDteBxuzeoFyU08Pdf2wvdIN+s37gkpobXkI4Xa?=
 =?us-ascii?Q?7IKPRtbo7eGwd1dZld7zMasxkeF4K+mHBpa479Zt9PwB61TIhjXCVbEwN+Fc?=
 =?us-ascii?Q?FLnX//rjm4iej+/dGy3II7jtzZ45NyOlNvVrSgGMUgAorV82mvu/t2i5BziI?=
 =?us-ascii?Q?8Wuc7T/4+fXo/Sau5T7so6Ehvrnu2kaadWnOrrssH//pGgJpxpUsQjfElZtA?=
 =?us-ascii?Q?6My+SV42BYZLyBRbEFIDjZe5iKPePzdhaqth+7AOuGxyFtFA6MSAJTIgMm+j?=
 =?us-ascii?Q?XjpunGjjNb7M0TVTy3TM+YLYPAsZJXpdiobwbnNw5v6oOfo2Biy7xgjDXBgO?=
 =?us-ascii?Q?YaEI9Lb4kAxHSYnUIj0Qo2lyZs5GgLpiYopK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:19:44.5058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9fe4b1-bfd8-4d9f-8f3d-08dd87851727
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end

v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   to "drm/amd/display: Enable support for PQ 125 EOTF and Inverse" (Leo Li)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 63044e0296cb..f645f9ded95f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -679,6 +679,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
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
index aa753b0d6f13..b989e1ca19e2 100644
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

