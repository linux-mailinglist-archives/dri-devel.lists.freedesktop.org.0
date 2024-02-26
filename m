Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC628682AC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643AA10F147;
	Mon, 26 Feb 2024 21:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QIIKI512";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A2D10F049;
 Mon, 26 Feb 2024 21:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMPlTfYWpVxvNKlZxp3MGmlrPjW+BVz1yjfLwNJpJmQWIJ+tAPvbxEcAm4X/l6PhopsiHOk6BAn5y1MFbBYnMvOOy9BtXcTMjj+x0DcX334t2N7+x4pe8sBqCZja/+swkYBHO7an+yz7c3/YKltLeCHj93DXviAKsFD2hT6Kssg0dC+bBlpEQhNCnjjYzLXE/EDYGKopTAG6SS3Ikcvn2NA8/27T07XrM/+huy5P/WlRqbgeZ0Z00+Mg7EXf+KS9FU/oXT+s3d4YWrmyjxTvh3zOrhCuKcnNeMdilsYwLtvQnYqOARl9OUd648DtVxOIQk7cCaubZLCdmHBX5CBlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7PEe/59I6Xllep6GuwAvwmZOoFZqI0nRcYun8tnMnQ=;
 b=YlNUHjGC11J1U1MSCdROmDVGxvaEZzZUY667Kltuiqk5171dtWB6ba2crT6jV3h7NyHEGGquoit4CSfGgL3WsTyepd0rDt9Vvl+hU7fOaDTc83gKXikaq7z56LcRHZYSm8I1tDTsqxiOfatDStH5Bz3VKT474weWLHfFhG9kIlMsHmx+blmskOBuDoRRgiSI+PWIueIUyI0qX6jjCHCQ0IAWbm6IDAT+AR+x2qnsH4+WaQKgrtjSbvTRErD4nGIv8TWQHA/XQDygflyO0ekFKlnbmqwBlcEv2o6H1vMVjxC8/afazisXjspVfpowbFRj/e1Og9pUFBlVjeNPnPnI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7PEe/59I6Xllep6GuwAvwmZOoFZqI0nRcYun8tnMnQ=;
 b=QIIKI512297Q7kn6wgyuQ/B2yICSzqPAH2dmi/Ku1VG4F6TwMAhjcT2f5rztjvGcY/dhUgyN4xlr4f93I2bj7UOEDeKqIt8R9kq333R4BtmwpYmq50mHKNkLpthBxYggIVNcGbtjg54pzwb6Qigwilox0j0oyCnH5t89uU+6Nb4=
Received: from BL1PR13CA0308.namprd13.prod.outlook.com (2603:10b6:208:2c1::13)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:31 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::1d) by BL1PR13CA0308.outlook.office365.com
 (2603:10b6:208:2c1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:30 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:30 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v4 39/42] drm/amd/display: add shaper and blend colorops
 for 1D Curve Custom LUT
Date: Mon, 26 Feb 2024 16:10:53 -0500
Message-ID: <20240226211100.100108-40-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CY5PR12MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bb1a17-4b59-4c25-0fcd-08dc370f814e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pbZ2jkKSOQJ/lMKaKyTbJXW3Ts2a4zF7Gp0XZBHLaNQbgwR3cM4DJq1BLareASwBh5DcscrXTX/Tl+NsceUzG8N9RteriDAg7cYSnHOM6dI3SBUft4VsN18jFiGCMqaWCt2HmD0aEcWjkbMH8PRpQVc0lOJ4jGr2zZAkBU4SwBCIVf1dMWcbhT4V+Uf3emDOlGTEX+88l7wTspGxRMBtfDSC0oJ1Lj4+AvBa6cQBzRnFA0xczQ7JHDEHs/+GrJAGKp/e2VO037CKs8y06Y+VKPFEg3RhimMT6mGc9sw0WjmbGdGyVSLktvbYpFeR1OZd6Nsl6nGzcwh8F9OdwVv1ZS7AHvTwXmi3KWEu3BSK9d65YWDvzzG98QEeMGq7ZryTLC4dw14XmTZkYe+zogaHl31cY0Qn7PjT4QOaplIJoGXcWUab8Phx828FtU2Riq6d8dWn3RC8Ln06mpWCr41C6cX4lqTi42uB50oskmrRGNdYQBGMTgn3MMzgeqE+iVbSEErhYk1uJiJqQvZeVSm0gZWi6SH6ZGcR5HxC6K/UcmpVLsAO3N/aHbD7ucSlKj8y+6BYUqtsPiG5+THtD2CLT3Xt+AateaacPR2+PUyyU2IkK11LLvufQ35eyMumHRjvotIfcpSm0AQKdyTrYPnE8+HceOPBG0FqyYiWqsUlmZHmVBDnOnvi7bFptgvs20rAdGZIYbEKkNi1HSxxla8jif/0ptDNgKr8jHglYWRC8fs6PGP+OMGIrc/JayzmTZD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:31.2712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bb1a17-4b59-4c25-0fcd-08dc370f814e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
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

This patch adds colorops for custom 1D LUTs in the SHAPER and
BLND HW blocks.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 1D curve colorop
3. 1D LUT
4. 1D curve colorop
5. 1D LUT

The 1D curve colorops support sRGB, BT2020, and PQ scaled to 125.0.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 170 +++++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  30 ++++
 2 files changed, 119 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index d5d356cf9fc6..e7b51b29cc04 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1212,40 +1212,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
-static int
-__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
-		       struct drm_colorop_state *colorop_state)
-{
-	struct dc_transfer_func *tf = dc_plane_state->in_shaper_func;
-	struct drm_colorop *colorop = colorop_state->colorop;
-	struct drm_device *drm = colorop->dev;
-	const struct drm_color_lut *shaper_lut;
-	uint32_t shaper_size;
-
-	if (colorop->type != DRM_COLOROP_1D_CURVE)
-		return -EINVAL;
-
-	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
-		return -EINVAL;
-
-	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
-		return 0;
-	}
-
-	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
-
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
-		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
-		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		return __set_output_tf(tf, shaper_lut, shaper_size, false);
-	}
-
-	return -EINVAL;
-}
-
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1254,64 +1220,61 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = dc_plane_state->in_shaper_func;
+	const struct drm_color_lut *shaper_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t shaper_size;
 	int i = 0;
 
+	/* 1D Curve - SHAPER TF */
 	old_colorop = colorop;
-
-	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
 		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
+	}
 
-		if (new_colorop_state->colorop == old_colorop) {
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
+		drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_output_tf(tf, shaper_lut, shaper_size, false);
+	}
+
+	/* 1D LUT - SHAPER LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
 			colorop_state = new_colorop_state;
 			break;
 		}
 	}
 
-	if (!colorop_state)
-		return -EINVAL;
-
-	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
-}
-
-
-static int
-__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
-				  struct drm_colorop_state *colorop_state)
-{
-
-	struct dc_transfer_func *tf = dc_plane_state->blend_tf;
-	struct drm_colorop *colorop = colorop_state->colorop;
-	struct drm_device *drm = colorop->dev;
-	const struct drm_color_lut *blend_lut;
-	uint32_t blend_size;
-
-	if (colorop->type != DRM_COLOROP_1D_CURVE)
-		return -EINVAL;
-
-	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
-		return -EINVAL;
-
-	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
-		return 0;
-	}
-
-	drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
-
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
+		drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->tf = default_tf;
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		return __set_input_tf(NULL, tf, blend_lut, blend_size);
+		shaper_lut = __extract_blob_lut(colorop_state->data, &shaper_size);
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (shaper_size == colorop_state->size)
+			__set_output_tf(tf, shaper_lut, shaper_size, false);
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int
@@ -1322,28 +1285,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = dc_plane_state->blend_tf;
+	const struct drm_color_lut *blend_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t blend_size;
 	int i = 0;
 
+	/* 1D Curve - BLND TF */
 	old_colorop = colorop;
-
-	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
 		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
+	}
 
-		if (new_colorop_state->colorop == old_colorop) {
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
+
+	/* 1D Curve - BLND LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
 			colorop_state = new_colorop_state;
 			break;
 		}
 	}
 
-	if (!colorop_state)
-		return -EINVAL;
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf;
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		blend_lut = __extract_blob_lut(colorop_state->data, &blend_size);
+		blend_size = blend_lut != NULL ? blend_size : 0;
 
-	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+		/* Custom LUT size must be the same as supported size */
+		if (blend_size == colorop_state->size)
+			__set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
+
+	return 0;
 }
 
 static int
@@ -1413,7 +1411,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - SHAPER TF */
+	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper TF colorop found\n");
@@ -1424,7 +1422,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - BLND TF */
+	/* Shaper LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
+	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Blend TF colorop found\n");
@@ -1435,6 +1438,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* BLND LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index bc66bd4f9fdd..08480bf61dc5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -29,6 +29,7 @@
 #include <drm/drm_property.h>
 #include <drm/drm_colorop.h>
 
+#include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
@@ -83,6 +84,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	prev_op = op;
 
+	/* 1D LUT - SHAPER LUT */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
 	/* 1D curve - BLND TF */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
@@ -96,5 +112,19 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(prev_op, op);
 
+	prev_op = op;
+
+	/* 1D LUT - BLND LUT */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
 	return 0;
 }
\ No newline at end of file
-- 
2.44.0

