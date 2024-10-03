Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BC398F7A9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6E310E951;
	Thu,  3 Oct 2024 20:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PSvV6vuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC67210E93B;
 Thu,  3 Oct 2024 20:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUZb/o+9ru/wL+j1lKzooPWrchdvKyR9jsG01O4hW+v9SpK17/vzqay2K8zp4q6jWGIX9c7jSRJGvwudAhZTjauUv/Za7wGu7mmlGOHf3cfMuAdwftQzGjvScp0sFChn/Sfk/ouBbo3vhIobsOnX9Xi9LLEH5Soiwsc2XWA3NH3zVf8jg00tRs0r9HmpZNXCFGsRZ37ZRsVKTEVnWVhtLbv/WMRxWky2PGHX8TpZQSYhATBxg0NibGNJOyDMyEqcP7azXecZeH4xvwqvmVL4WptmmlW+OqtrHzjf8wC6XJZJ9H+ZSMKeMYRddRRr3VZUq3EQcztJQXzpSEK1Q95+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDkUYRoAqeIJo9/Es++RfVl+aH+7XQLZdy5BOhRlaXI=;
 b=eHsBPtyVVHsZ+FT+bpeI/8L83RNdQkuvPRMq4BfozcIS3Bf0x2Wx9NSp50DsCQ6j7udmCjHGeQw5uUNJ62vHzydnQzvT82tsVFi+YAka3uZ9xphA0ORtF9xoffi3kCXDiJUqfZHgMLKSke4MK4e4QlYw0C0sLquNoUYGDqoxGThBANavxVahZrFSM6RMNKJztM04lhDbXWT349LUxR2fjpaOT98Y/xDtN3eLtD2oJ0xn9u+V4eDJ5njBOh8ZWRGeE2SLi+82XVtbwbRqsd/6Paqh9QjU3P7dz4kOi0bzRBmhMPmvyKNhKNpf/mQl7Rvxtb9YHtGbiXwZELifE2+PtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDkUYRoAqeIJo9/Es++RfVl+aH+7XQLZdy5BOhRlaXI=;
 b=PSvV6vukW/gqk+Af2bbiM1LaSP18ZW/hpbXbPw+hk7cgy9J2/OCJI4A2aHwvJa3n8/5YmXuhDAaWZSTb3sF2NTzDsNXPQo8OAlMzlVt5McbsdSrVWXloNywFNvPoEC+nen0JLI6XBiXtINJ0EVr1p/Z1hGmu3A9YYFnar2xQ6tg=
Received: from DM6PR04CA0006.namprd04.prod.outlook.com (2603:10b6:5:334::11)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:01:50 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::67) by DM6PR04CA0006.outlook.office365.com
 (2603:10b6:5:334::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:49 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:49 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v6 29/44] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Thu, 3 Oct 2024 16:01:11 -0400
Message-ID: <20241003200129.1732122-30-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e308b7f-b55f-4b0b-1d88-08dce3e6385e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KN8ph+b0natfeBE0zaTNxGIXodnmjBg0/+ow6ZU5lwO83gLbsP1XHzYbaQE7?=
 =?us-ascii?Q?yeDh49ENbwoT8X3KsXFSEjAHlIXbmFJdOnvCQstXgNpphHoP5QX0+fj4ktx8?=
 =?us-ascii?Q?LhYgy2hSTZqVhL51vLH3HNmCemMK5VBtN/PAZDklgtFe1oxCOgFjfkDg3F+y?=
 =?us-ascii?Q?ks5BohRXF1fpIcSuuiVCnz8samDLw+JbnMDkMt400sKLDvLFEQVlhkHS6Wcj?=
 =?us-ascii?Q?vhbJ754Hxy5a7xv/5gv0d7d6EJdY4XSwC6CKwFe3PKsmG0ZHLScN9u53W2eT?=
 =?us-ascii?Q?PVtGStvMZ3ID4b1+w1n8Q+FLNeE/HbJ/PDxsQ9vVHFCHVPPhta48npPOxziV?=
 =?us-ascii?Q?oP5TDh5sVsjmZ1HdWStP1dcXbXnQDL9VBbmRrcwL6dznoIItSjDN0Ng3donI?=
 =?us-ascii?Q?e6QcD5OcchcueVYzFHtXp+KTcyN7wNr/e6uZNcHCD/U4Fvl/1eM+l2lsixi3?=
 =?us-ascii?Q?fdxBpol1ypklXKlk8ieQ5sk77VtQ0TYohluGbDmUlqSRWHOe9uVGt0L0C7n/?=
 =?us-ascii?Q?Ubkb34QC76mWWL14cwASMGk5XgUi27vP+ZzbETKaN8DjKF3WZA9qcZy94+Rr?=
 =?us-ascii?Q?XFCYq6DkZK43q8brL1jRjH4X8BBOR8JJ0apIn8Tl93fjnuOogtwnDGh/tAlo?=
 =?us-ascii?Q?rz7qbvvVwxE8l+3ZX+D1DP77LCv0SJSRJpSv/1GcTKc6X6p/a3jmLm1tvN5U?=
 =?us-ascii?Q?Aq3lj+jmJSf3c1Qw0gG+aouOev3X4q54lqPIU5UI5udOOtgBTvz+NmZwW7QU?=
 =?us-ascii?Q?mbmYWxqMeTVFSR3+BU/jAVqiAqc929GymAI/LHab2d+gV2/eagt62g+lEyqs?=
 =?us-ascii?Q?9AIUqC7JzhBsCj97KwPLn3e9XZ1BOknpt+ULokwQxRVnyB18Vdi2reXL30yj?=
 =?us-ascii?Q?RqiAhSufQODFJh4htOJb2ptCpr46/S/s6xYQNgNuIGAhwsFnz1FDSr82dNNp?=
 =?us-ascii?Q?LQ8TBff4QyHWUZ83NzbC6G8xCC3rAzfvB8/hgnzM95AR+R1+WEib9ED/fcm9?=
 =?us-ascii?Q?aZQO+j3A7AwM3CwRoiWENWQT0ZsIFjxR6MTeatwA2/lyCu5ebHTVglDfRz12?=
 =?us-ascii?Q?E1rxzwAGnkl59PcdCUdZh9xqb2FiYJ+XIRn+k0C7E0X08EBaudwH6ybcLDyH?=
 =?us-ascii?Q?YFgpJwOu5P2PS13B/IUjK+oBQEeaZ7jJqORs1aY67H/YiXZkxdCIAdugUDSZ?=
 =?us-ascii?Q?edl/PgZiCbePmdFaiJkLKlduqdGn9huahzFH/7WLOXxcHozgwcD6eUYLR8QO?=
 =?us-ascii?Q?rCWWUWYfDYO1ixD4wEpx3QjbyoO6vKuY3rO+jZfXC0f6+F9Jxfaj1nZzPFwS?=
 =?us-ascii?Q?iIoP5KbnnrjH0RS68C4zbh094oru1hCM0wfvG2/n7z0dZjsIWmmp3tpJcMgl?=
 =?us-ascii?Q?sCIzdj1OKzIMJvNXAiCP+0XTrYtX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:50.6193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e308b7f-b55f-4b0b-1d88-08dce3e6385e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781
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

From: Alex Hung <alex.hung@amd.com>

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
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 77 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index d67f88340b6b..f0dac44d97b3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1265,6 +1265,72 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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
+	uint32_t blend_size;
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
@@ -1343,6 +1409,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 3afbac6c4e2d..7f58c7b6a1e0 100644
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
index c4b1b187e9bf..a342c096f406 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -29,6 +29,7 @@
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
 extern const u64 amdgpu_dm_supported_shaper_tfs;
+extern const u64 amdgpu_dm_supported_blnd_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.46.2

