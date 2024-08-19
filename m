Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66595761E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A79510E3E6;
	Mon, 19 Aug 2024 20:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xkS2Si/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CDF10E3D3;
 Mon, 19 Aug 2024 20:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSxcFk+jAZ7aiznRqrVrqi3FgtfNZQnISmwSJVvs8ZtQC5e9NK+v/yHZQ/I37qgfyGrNBWsLGClZ7AnOyTN9a6EU2ILEKZLhUUqM/sr31Yl5Grj7mtHMP+YHTXGTZOkGaEIL/RRYt2TVoFGAs+KuZQfDnd1ZrO0OKzgon1tBVwswdI6GVja1yaKzmbheeurrY7KpWGpbTvbkUUZkM2iL9/YW8/9zA9ljNrvJebqN/FqaiPBBvm2wjPN3fXbwkoPYMmnRWYTECkuHbxHPjfg1PAbNHawaz4w/arsEgf7yd3KS17MpJBf7wyPOWjDEtZYM31uk3cxIgAno5YZMCA4PKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrOnjN98j7mBKFa6kZP/PCqp7Un0WHLU9I3UpzAmdBQ=;
 b=lMwGJ7ouyv1e4eT0+kAekK9w1HwY7yjNzHpDkZw8kL2P8SSzbt1sv9ssQW/gkZKxTJdh1b7IpwNENekHM98ALG2B74bSqSxbQC5pQ7L398l7wa3kHub47aeCALdvhvDv7zQhy4VpgC3zLfWCPBSn7fvhdhFqDWX9Ww838Yu5s04EmgKhWJEsChAtUTFYURaSmFu/r9WHP4llBhaHtSKRVY12I9Nuyjvzp3ovwiMiCCPACnTNpPcnFy6RQsQAwwJ/nZHn2fDrGm8YNmu/gEC6XfaDCJAb6ipEyb5JsF9YnPS/GrXw5/6ioBYPO9lXZE0uQk9lUpsBlVGMR7Wh/lrrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrOnjN98j7mBKFa6kZP/PCqp7Un0WHLU9I3UpzAmdBQ=;
 b=xkS2Si/ZLSvaiLItCNld+yHTszw48+4r9Rxw+iN26UEYGHsDpIjZczzhYLUHje4dn2QVQP6LKP9RR9WwHh02dOagPuuKS7hZkIxtD2U+eUh5i+QFHv8FJg4HSvXQrwxzOSxNv0VeC3kYZwZCmhOc5EOSGeNE2EqLUui4DNmWjk8=
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:38 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::91) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 29/44] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Mon, 19 Aug 2024 16:56:56 -0400
Message-ID: <20240819205714.316380-30-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb70e33-d5ee-43f9-10e5-08dcc0918f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d/iETarhAUjec0aqDzoR0vEPwGsgS3FtOYhcB8S6D4PhVsvbzJO6fyhkrmX8?=
 =?us-ascii?Q?hvn+NDuBVDGogItx5qUobcoRRXzO7dPmerETnOv4LOvKfsK7vs5zU7fXbBYq?=
 =?us-ascii?Q?MP6Brfa5cuel8+RZZYc4ip/LOzUCdiv/WhPUW5wz8IAte9j7sXObv2UG770P?=
 =?us-ascii?Q?YlY2kgKij414dc9IYqDV5uD/SgMLlfcBJ4OHfAQMxviGgSBcg0UuxH2CwIok?=
 =?us-ascii?Q?HBPmPZYCdboC7pNx4sH7oyl+YAMoYuNz8G5g9WFvEEZFJNwf9B2Qe+xfsHIz?=
 =?us-ascii?Q?XATfp/kkcUzHLvkXuZViT5PEWkxN/vs997ABcEaMnfHzB1MaG66dmBwUxbWC?=
 =?us-ascii?Q?4TYTNiztJsaBgZtaSgB2EGOqrH2ME7Blbn07HoxOzyftf/hNKJhcqt55fB2F?=
 =?us-ascii?Q?hmFpW5ZswQCe4WXFscbJIAAJ+ISXl2g2RpRtpcoHaea4gg7KMgip1zJopPyn?=
 =?us-ascii?Q?KZzn8NyN4ygxR4I8B3VOC79Lxof8KqEyQCTYBOyJ+LrRaHqzcy9bquvzZQu6?=
 =?us-ascii?Q?4hbIW4gDmLrmodBt8pLUDaymlKVb5gDT9c0RkUo1vxvpjkd/wImNhiQ93VvY?=
 =?us-ascii?Q?zaOAoavuBku2eGM08Ygirz+hYLk5RHvdyqlhHTxlKpUN+sXpB79s6ed6oSxX?=
 =?us-ascii?Q?E+Wg+xuBWlr0v63tpSsy8QBhnXa8a+Nh1f0/orI9T0l6ulkS4XrMurspbMT8?=
 =?us-ascii?Q?72igYpclC9+6omQWJ6Mb9Apg4lXyY9AmqxgRwqKc0w7446+89RDfXAODigEC?=
 =?us-ascii?Q?vkgAZcGyQi1C2OYsdYdlv8P0S/rdDklD6/TouXYHoIuLGGbcTHA5I3Gh20jO?=
 =?us-ascii?Q?YVK0J6PBeOTFXszAhh0a1maXmSclFT6GboihiPp/mLXEo6/eXkzVJmK2dAOu?=
 =?us-ascii?Q?Q0tNflntnYMdoVuJvlFWATzdmgVPrqyFHBpbWG0xKmE82zYbM6skAJB5WSsF?=
 =?us-ascii?Q?zry/6GXgyjrspWlNXohSSHtWIvX1QRq5loPx/3exJ/8ivQssItgI3Ut0I5zM?=
 =?us-ascii?Q?P/TI9Za38km3q3L8SECKoSZshchXk+GrtI4grAmAWHOk52ZtIdQmXcCq5uLb?=
 =?us-ascii?Q?z6LCWHA8veRya+hh6su5OS10xIuGydVY80IoxKlY9RJQI9pV7jPZuJQzU3Av?=
 =?us-ascii?Q?QUA6nzsBG3/P6D1vocWzmAX6VKnlSqP7D764XHyiPYBSOcJIztN2Bg9bdyXV?=
 =?us-ascii?Q?U2llBweIjNg2wTWMR+50To2pWuPqzxQ5v/PkfAYd2MLPP6NEx64FUBoxuyyG?=
 =?us-ascii?Q?v99xyC1wM0Ih0JtHWU0V1QAHhRcdlMBg3TRXNCV3VaTiAJgfpO4GbmAaj6it?=
 =?us-ascii?Q?skwcmhaUqW/D40gr96bOlgGJJiN3ls77NSw8VM9tOVvI/9YGS/YArL8ZFX80?=
 =?us-ascii?Q?j4jJpxhc8xzkwhaXOezG6pTTUE39p3j0POXQ63YRsZhOlDpowUO5kEytMvuJ?=
 =?us-ascii?Q?rWyQLNWW8gVS1km8XADO0s+BKA1TVA4D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:38.2496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb70e33-d5ee-43f9-10e5-08dcc0918f18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
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
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 58a996090509..4009895c3b6d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1267,6 +1267,72 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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
@@ -1345,6 +1411,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 0d1626abf577..449a2ad6a184 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -37,6 +37,9 @@ const u64 amdgpu_dm_supported_degam_tfs =
  const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
 
+const u64 amdgpu_dm_supported_blnd_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *op, *prev_op;
@@ -72,5 +75,20 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(prev_op, op);
 
+	prev_op = op;
+
+	/* 1D curve - BLND TF */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_blnd_tfs);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
 	return 0;
 }
\ No newline at end of file
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
2.46.0

