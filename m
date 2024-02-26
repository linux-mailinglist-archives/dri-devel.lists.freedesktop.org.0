Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABE8682C5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BDE10EE83;
	Mon, 26 Feb 2024 21:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bbsyL9Px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299CA10F232;
 Mon, 26 Feb 2024 21:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv/sBKDjlAHDEY3G/Rm/3fxQbg7wuKpxEcfEl1dR3UI2uxl36mUP6E/DbJuUyesSJB31fEkyzc4XMCcVtnHSMi310anx083HRKb/cHzZ57lzAgzZGl4ST54mIziA3AiEri5AwNNwhVRZu0Oluwvul7QBQEHJMwqGafnFD6aFwl4qsdBecDZ9jp21Jx1oIXy87+nxdwYqyYTdPno9N2i8Ao31IJdXwzErL3DUt9VK6fR7Nhl5TEHbGhArC8c+swDaDvK0Bs145Pwz6XU+qB3o0a3KWx8Hk+bQyssrf+Jc3bgAxx1G/66VGXlUewst6nSzWwGB0lLfBhg6aqtLhCHksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R588rDnSfU6REBrGyjn/mAv9kth3vYNcFXYcBWYKS+8=;
 b=J4d9i59mjR43E47qm5q5MCg853venFu4aLvy9g9x5n5JM9AkzjwQNIuD+/36mrvTRa4xivhAbb4nmt0djNCk5/RtRIIgdvMpncU2tqkDqXsLCHBBYKcefOAsgN23/HYN4NOIUV0tiexGBqAJsOWiyV+Lr0wPO7Zax3nJG1ZyWSk/sZV9QzE4IeQQzeHPzEEjt3Ksdnl7auLb+bzwN5+ZStOUDF0NlGd5Lh83o9Ui2UKJJTWFv3J49MLCHGoKeTLVTHNsdoBPk1brGjL+lzS1yrHCjfwn8nxJd4rTrz6YZpFlWU21/rDH2szYFXLdBuNi7+UKHwUoGeKG/K2FGuF8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R588rDnSfU6REBrGyjn/mAv9kth3vYNcFXYcBWYKS+8=;
 b=bbsyL9Px52F4TJfy/OY4wPWsrF9aU04+LiGT0z2oEt47G9j6FjcpA6XfOmVWpZe8aQxaz33kGtudLD0DwswVl0H1jhZrth8UJ2d7ztGwJltpXNhGZvmX01ws8hTpoBBbzjWq6BlxB94cJlmNIzPPF8e9LhRLfPUydkElutPJQjU=
Received: from BLAPR03CA0068.namprd03.prod.outlook.com (2603:10b6:208:329::13)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:27 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::28) by BLAPR03CA0068.outlook.office365.com
 (2603:10b6:208:329::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:26 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:25 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v4 32/42] drm/amd/display: Add support for sRGB Inverse
 EOTF in SHAPER block
Date: Mon, 26 Feb 2024 16:10:46 -0500
Message-ID: <20240226211100.100108-33-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 76afa40c-68cf-4ef3-7317-08dc370f7e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDLelFUmrNRNjXnLD6oNUFRoBUly2A5/O9yN7ocVl9q6pFyyT/RMqQPvwi//NZCXrOODIq3UtCxu8tlBX7gJIPMp2MLo37sWKdUadBr0HzAX8sd3SzmpOXInnieOxCPE3+Mzo5yXStJv5bvzb99egXY1XwIJgu0lcZb4n/PuvUQm++zJonGvDAnvfZShlf9CI1aNYa59TsmbVXQzOTlhP04r03n6v6gnMskMyCTmXDxZQFI1VvvXPs2f7GKCXZHkfxkWDaaPgNlyLDFVs6Sr5dtT0FdEUiHjhLjIM1x+ikxKxR61nFkNEcD8YQK5bb3Pb9FBs/JHVnG0V1K+wiJF6d9qVLFoF3gd4YuXwZ93vPDOtUb91+Qh7pTNFgHrFCsCdrbXdHjFMchIbF/a3sQbPgdDR3j3yakhMMGeKOaclT2wVXaxBPWc2Z/yleu6wL5OMjd0SfYi6YV8N8MERlpKqPp/9Xv/2Ay+UkUblAar5dqwEW5/41tqJqHOm12Iy1cK0hoUyJxBrxe8//juzIERcg9B/czBBoesVaFoiir08jML/s1kWGCcSS/UrNF2DEICjF/FJ+fS1jU+UoQJmsPs1oIM/QoAPq45OJgdTjWMw68vtove5fb+VWucbusti7QBbivcG9lVLm1LQXQmeotFMNAN2ZlEV4SRkqI/NH6IJmT7wjcx1jAcZoiwcj1JI+zDW1bJUxltkjUqwAYIl2zFjRC7YKg//C0gFXPQ6DD5K+TljSfkCs3JvKWgdY2Itp2u
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:26.6797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76afa40c-68cf-4ef3-7317-08dc370f7e91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798
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

Expose a 2nd curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF and program HW to
perform the sRGB Inverse EOTF on the shaper block
when the colorop is not in bypass.

With this change the follow IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 76 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 20 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 3ec759934669..8788cfd26abd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1203,6 +1203,70 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+	const struct drm_color_lut *shaper_lut;
+	uint32_t shaper_size;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_output_tf(tf, shaper_lut, shaper_size, false);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 2nd op: 1d curve - shaper */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
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
+	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1258,6 +1322,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1269,6 +1334,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - SHAPER TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index e8b7fc8bb0f1..0d1626abf577 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,9 +34,12 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
 
+ const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
-	struct drm_colorop *op;
+	struct drm_colorop *op, *prev_op;
 	struct drm_device *dev = plane->dev;
 	int ret;
 
@@ -54,5 +57,20 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = op->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
 
+	prev_op = op;
+
+	/* 1D curve - SHAPER TF */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
 	return 0;
 }
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index f16de6a9fbde..c4b1b187e9bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.44.0

