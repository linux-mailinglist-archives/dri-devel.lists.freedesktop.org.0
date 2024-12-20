Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F59F8B82
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60F910EEBE;
	Fri, 20 Dec 2024 04:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uk8EX9DM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7010EEBD;
 Fri, 20 Dec 2024 04:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfRU1toCoEPQl0g1Yhol+msMYkWJye4bF298iIj0Lvz8CNKdNubQwQVuvaF3ycorS1DDgtmguyQ5cjXkt24J190qg3xeaN3sDF/+3jXDI8uAB+xxLDbBF7P5UMheLu7xecxXP4EpQPeUbs3GkLoQPIAK0q2qBq7GmMToIqGJ1E0Hz7Ggcqv+O5aRPLpDYjdkT7KkSve+0CFrtQpwUx1TSG9Qa8I7iMcJYK/s1qfkReAiX99wB6zz6F+FGMbMUpPrZ+35I6zqKZtMPqWg7RpJilpx6QkF27Wu9O+KaBR8GFWV2wNgxZ2NCXheamYUBqFRLx3itDA9VBi5mCU61yAOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SQ+pLSU80UAEFj5EJXWLBEvI1xA5sWnwBV8oSwmYOg=;
 b=F6hxg06QpUM8IekFNb6jt3pU11BRT8TPix+j8yAhmOu/dnATzOjMxd7akjd/BinRPKkbqmmjGBCzQXRS4WvsBZyUqO0oCbwbeVXfnkx0y85E5TsbGhiIr2zEAQ84+HEp5bkkcaPRPiWddPl9kmj1B8JaSiX2+opL/EDq1a4/dfetntwsduZQ8mnlfmHjXtzSFHoUovPadz3XOfgkMWLrm0Dt6Vrqc85wNTJjYMS/CDXsoXk5xa2w1M/cyTh98znG1qegztDbnW6O0tsO9gQNtTHv0qLw9vG0bcrVoNfngssbLuG3P+BGbjm/GS99ACMH42x8kdpfuRyw6v+9zNaThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SQ+pLSU80UAEFj5EJXWLBEvI1xA5sWnwBV8oSwmYOg=;
 b=Uk8EX9DMoU2Ns6ab4ThH/Dc3f9wyPJf/YIFlRu8KN/PUBi1SRLgIIQ1dpzc/XUR4EO7rx8GniXKXRdPLNprxxxfzFVVQaYfFO0gWbzQVmOydBQP24q6DVs+IbrR1mvgMiP7lihrvI9LT+Dk41+21d0sBi8O1gwa51XYBtPdpsX4=
Received: from BY3PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:217::28)
 by SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:42:40 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::da) by BY3PR04CA0023.outlook.office365.com
 (2603:10b6:a03:217::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 04:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:42:39 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:42:13 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 28/45] drm/amd/display: Add support for sRGB EOTF in BLND block
Date: Thu, 19 Dec 2024 21:33:34 -0700
Message-ID: <20241220043410.416867-29-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1061a3a8-1074-449d-d455-08dd20b0bc03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5+qaGVAm14TWsf1x/H78fQSICXE3/b2gmi0hlh8/MElLgsCe6aIs9miy3Prd?=
 =?us-ascii?Q?k96l8GmFepvQwUHu3MZZ5e1dXtAdfS1WB14YIkOdUKFipKvawcmySdFizW29?=
 =?us-ascii?Q?P798nr8Ou8UuKbkQ2v3x3gatmKIT257IGbEMXgeWTgaCp92xAfaAptxMOuu5?=
 =?us-ascii?Q?My8K+ivmPDk7jHFXYBCL8JJTNvExFCbZiRXLfU1SMmlsJj32rh0kd11XDL72?=
 =?us-ascii?Q?94vOD1++GLwuv6+qgwEEXEaPiCmkrMxAj0z8z5eeYvXsfVRNr5MRGViBH9WC?=
 =?us-ascii?Q?luavxY+vHnFDL9OuDSTriMJWsNVUDrXT7+oHpyaSnRtt4YREadPD2c+5x18i?=
 =?us-ascii?Q?+H2AIlF52+kmCswLikdCNyVf6MeHE/LXxwF3HaCqfE/ha5qg8tuEmHOt/F8x?=
 =?us-ascii?Q?5lUiEc0K5jI/iiX7VNUBgsGLL3MVBkSR/TAYjBCrGma+rLRI+k9OVYHO7lsC?=
 =?us-ascii?Q?1rrGWPQmtq0fhEilpV1fJa3G2lVTRIlqHj9JU9lysU87Hy4+I/NsLNXZ19gP?=
 =?us-ascii?Q?MNHv7a6iXffTa2pBuRUH9XBUepafDllvF80ZQC76pQcBLpFfhBUqwVBTA9Vl?=
 =?us-ascii?Q?E3F48n251NMt7FpaYFaQ6QMFf+F3KZTqd8NOb3rPsyWMFUgpOtNYtyD1Me7O?=
 =?us-ascii?Q?ApLV1NUe13E/DYzltSOJoGtoo7xQBXXg3zL7ECDS+r9uzfxW4UWneKkX7NxK?=
 =?us-ascii?Q?rA9r6KlLbmhxQKf/En/VMx2LmRec9OQLbEn3opl16SegY5FedorYl2dh2kYE?=
 =?us-ascii?Q?mbryTnmLEsxQYqKcMCPpILFjj83qp+DblrYpgQvsXUcLPpPWzi0u69oVgu//?=
 =?us-ascii?Q?Cjm4IJzvfpzM0YJ8FsgbFExMWXcbIzCf5enS2ovh/u5rR7puEyvUhLlZCDLY?=
 =?us-ascii?Q?aCHoj6lexfBoznPJNlPMYVRMwu3vpj6zTGTmPx1B9fr4NBZ/PZFMmznFNNVa?=
 =?us-ascii?Q?9Un/y2vh+c3Qz6bIcb02/iKgAeW9/tlvSl9/FBdxw8z22EULRtpGR/7k3squ?=
 =?us-ascii?Q?6LuEcJiBesbkDw7fukpU+n/Ow/4KkgHXj5hSInU8XcbNDLkog3DqqnZHUkXx?=
 =?us-ascii?Q?2w4+hu9RUCyYdCE+6zhJBQlej6uXdc+RZc7U8vurmGqR0+3+D5h+96kl0sRh?=
 =?us-ascii?Q?33Ci0IEBjK9D4k1+gin9cwj4/ObfzpPpGJn+0IzKVxYrrmnXccztzzhK5F18?=
 =?us-ascii?Q?r3EbfKTCAKISRJRcqyEd4yE46ArFzvI1f1/I79muPr0pakV81rXTV+nwcNkS?=
 =?us-ascii?Q?tga1yLMpltM0cLuMSbc9DXgR+sR6/ufs6u2Ii7bp8VGx5pT5mYfULCsvG0IY?=
 =?us-ascii?Q?/dz0faqBRMHAmd0UHtGskV7AgIoVNZQ7c5SuNvnAw/i5QpKBZknhWkMqs04z?=
 =?us-ascii?Q?aCTZgpq1fvhRG8crJpYIqbwYJnCJdESqwh7qd0CAvkk7gzCJNN/qHEC+EvaB?=
 =?us-ascii?Q?lbVECVLh6TFZS2pqp3bByfl5iIz0T+QnVq8vSyndHbQjQee6TiBLzSQN/lF6?=
 =?us-ascii?Q?vs0Zj9eB0Jme9dE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:42:39.6241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1061a3a8-1074-449d-d455-08dd20b0bc03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180
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
---
v7:
 - Initialized uint32_t blend_size = 0 by default (kernel test robot)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 77 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 65f681b0c31c..ddc8318f6201 100644
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
index 718544b11863..c5154e1430f5 100644
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
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
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

