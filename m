Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486AAA4063
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EECA10E65C;
	Wed, 30 Apr 2025 01:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h6+w1R09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC4310E659;
 Wed, 30 Apr 2025 01:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZ96mR0NMJsGO/8TgNFK31oFjHXHnH0Y+2jkKNfpSh2aAfnQ9wlRhZFngj70u6iklytnb/OZeidU/oA9OQZAb20CfditqCUN/1xL2xrkeVnd0MBa9eL6faYZ8O2tAA6uSK6ixentMZ0+D+HYF/5fM95unUwkFnnVBFkkv1d2Bi32ZqTz9JKAu0cIqF5On3zx8BYYpNb6CB27KWfeG++vjCdeoNP2a2uSHGVU/xjc3hzksHfySo1YE+vJ5kUC2o+eDEQPjz8iVAJOMjMTOcr9qTpOu0oSs0vPdgBBsRyNRHYiexwGw9Nqkx0uje6pOQ8Pu4CbWA/MjUkvwF4fIwjurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVen4pVPej5pqIYAqgtJLrgD+0sbShEuvQDJR8c8aMA=;
 b=r7ShRT+MehT70pG6egqAmfFSrc710JKwBqDoJfEd+2c1AyuCpbeleBmMwjizdqSN0uqhOtGkR/DBCZZ/54Lf8wjNISGMG85v8HQccPtANMbv37MpbSZWbZCYEekTjHO+THnQJEK1n7ZLcUQ1+NiyHCa7aNfwjBim4eVdbpNfcnOnP9A+QvfCeEMpuHBHtJEM86c4JhvvHgbSXXKhZqzPQhMWvOtsvuaNDUgzwomZwePLdmlCFug9Ihgm1KJQO+jf46VbtArqK1wv+WiLBRM+6rVaUBzENva3SU3wi1GTqC8tEYUPX0Ff/Jaf0bXSshh0wC+069Vi/EUTc+fxKBzAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVen4pVPej5pqIYAqgtJLrgD+0sbShEuvQDJR8c8aMA=;
 b=h6+w1R093NIAd282q7dtFFltuwZ6NnlSqoyxvEmdC0FbG2b69SN7zSsUAdtOtR7qfNEKC1Y0L+me4cmu9haLQr4fsKbDeWjlpi56xcR5NZ5B03B8QsgsCQLB/cr5dqRzHEfF6SaI6GSP/jqRTHB9oNg3Z4eH2lsXjluwa/E/7g8=
Received: from BN0PR04CA0202.namprd04.prod.outlook.com (2603:10b6:408:e9::27)
 by CY3PR12MB9578.namprd12.prod.outlook.com (2603:10b6:930:109::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:18:46 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::68) by BN0PR04CA0202.outlook.office365.com
 (2603:10b6:408:e9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 01:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:18:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:18:42 -0500
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
Subject: [PATCH V9 28/43] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Tue, 29 Apr 2025 19:10:58 -0600
Message-ID: <20250430011115.223996-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CY3PR12MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a71a7c-6336-4bb1-4f3b-08dd8784f439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E+jl4d5jdZ68g8NfmWnilHlMCpyvuhi/tjN8Cotc22aKCpLSaC4un3/esUde?=
 =?us-ascii?Q?tygRB9LAl/71WSZ3gngSiDimJRWv1Sq0HJKKuO/IDZTQGXeAr7lY0pCEk/wr?=
 =?us-ascii?Q?9E/1xaDSSkBPsU6rTvZstfDRq8sfj/yWjwS/IeZbAKJ6Ef8hqv99LMDP/UFB?=
 =?us-ascii?Q?X/R1IKsJd3doGphjzpjEq0vD74Bjv5tjxBTnf7wxLqcBuq5wQ6qlSavwPccm?=
 =?us-ascii?Q?00qPGs5DtQFK4XwXwBLEdnkAH27oEUU3Q2yDvw1yAPhiZlWan1bHCzI9ORw5?=
 =?us-ascii?Q?OhxloypjAdVEhr7r6mNL1zSQv6VjS6mlXUKrkC82qx2heMVZkr1tGll+tVHC?=
 =?us-ascii?Q?OKPmAifHXl1B4aHSAO/1hbDO//wUekzWv1kWpIcak4goHHat3lXH7Ew8w3W6?=
 =?us-ascii?Q?zTtJqU+lUBZ5TXSUxaDRS0GMdf6XWlME9cStvodrEGC0xpt+2Spsb801MOG1?=
 =?us-ascii?Q?OcGuhMOjcIbQkVf9s+GsQ9qAcTYw7fznuCx04tXmp/bWbpIh4/maaUwmWkyg?=
 =?us-ascii?Q?EYkyuFMK/dnbKjq8DRZo7E96lG+LSb77fwoa6aAmekKyogeKi+fhmQ6wwxdF?=
 =?us-ascii?Q?5FRUgznCxDjzfuYWPaiJL7MxJe0STPqsegFEKsMoNJA7gyUWfKfL1673m8FR?=
 =?us-ascii?Q?rqth9++kc23SVc4Ji7Im54DV5RtwPTYMZfDchfjMmlf4AhdhUCMwCNIXX6SB?=
 =?us-ascii?Q?MnHbYLp1NCGcgtlb8qEOnsGwaboJH4ePerLmOyYg7qOPioz1nRZ4yY0stqNH?=
 =?us-ascii?Q?zS5wm703vdvTBBk6tdNQV9HWvOaQWiSpQ9d5NBe1xJv3V8+pLsUtZTx6Juzn?=
 =?us-ascii?Q?AsVgEw03QSTVetD+cduhNjfl67iW1X6v8LriVtkEGcM7rdh56YwUuOA/Ylfj?=
 =?us-ascii?Q?Q+aJ4yHXIZTP+qhNEQLn3UFG/EkjIdGgRWRhzOJbrsMOxE0yaJH7MGUBfNAL?=
 =?us-ascii?Q?aB09TNZ/RKZuTyOdsFZcLyytpZ1fsR+Aq4bh4zXe/rBxIW9jlh8fGSrCmeM0?=
 =?us-ascii?Q?5jSQyf1TeF5NtHKCf/PhyJyAhLZvU+t0Ot6edHgzNekv83XttX7FV/QjfBtX?=
 =?us-ascii?Q?lyz513rB4wGyC9QCXc6KW4jYRKah5APSxbjLQ6k7ngxElAP9Xyr+Gcc850UG?=
 =?us-ascii?Q?lERUwp7SPxQrs/PeBsD7XzjAwt6TXmcOMYzg/ADaBZQZyFu3Spe+c4rf7n+Y?=
 =?us-ascii?Q?g88MEtG4iibbfuBTXvx4CIl3sn0aWIetRHsGXWSvu59wb1b91ElnULRSxBDE?=
 =?us-ascii?Q?VUbnUstyLCX1XejulRVmcztfRtNQ1YMQBnkT9FyeSlzASzQqsidm+5LLh4R0?=
 =?us-ascii?Q?oy2YW5ClAQwyHhhU98a50Wf5o97lfxjeUjAodLSnT9B8VNzGuBktQSCMoBVt?=
 =?us-ascii?Q?HtCzjNYCuKVRIdvCbnJST8TJ8IGnEPf7fnaB+bK7DujEHS7p41D8v6kk9Rz1?=
 =?us-ascii?Q?gPNC3L5ZjGkQBBls/Jx9VBJHVG9jmwkogdWZCvhyk6BToqjsF8t1fffCAsMB?=
 =?us-ascii?Q?OiybN+LpsGpBTTgqBPlgSIc0VOZ1n0Daparz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:18:45.9032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a71a7c-6336-4bb1-4f3b-08dd8784f439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9578
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

Expose a 3rd 1D curve colorop, with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program the BLND block
to perform the sRGB transform when the colorop is not in
bypass

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf-srgb_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support
3. 1D curve colorop w/ sRGB EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Initialized uint32_t blend_size = 0 by default (kernel test robot)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 77 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 4662d88885de..7ce95ddf3851 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1264,6 +1264,72 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
 }
 
+
+static int
+__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop_state *colorop_state)
+{
+
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+	const struct drm_color_lut *blend_lut;
+	uint32_t blend_size = 0;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 3nd op: 1d curve - blend */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+
+		if (new_colorop_state->colorop == old_colorop) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1341,6 +1407,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - BLND TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_blend(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 5597a693ed47..5ea24da088b6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -37,6 +37,9 @@ const u64 amdgpu_dm_supported_degam_tfs =
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
 
+const u64 amdgpu_dm_supported_blnd_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -79,6 +82,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
 
+	i++;
+
+	/* 1D curve - BLND TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 71cd27994528..2e1617ffc8ee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -29,6 +29,7 @@
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
 extern const u64 amdgpu_dm_supported_shaper_tfs;
+extern const u64 amdgpu_dm_supported_blnd_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

