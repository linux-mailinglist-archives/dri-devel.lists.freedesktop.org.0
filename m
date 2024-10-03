Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBDC98F7AC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592C510E95B;
	Thu,  3 Oct 2024 20:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0BQCL7RL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B05910E931;
 Thu,  3 Oct 2024 20:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmiWVaZMFS+NpcdRbel0cXdqBrqjj42so9Jqo7fxSp6IuiphCFgUs4em+P16eUcQKW7PcVLexNRlc1BIZ5ZXnqIfA50gF9eiqeyed0UKCx52oFvm43Bl5GS8K8tw7KDUpZnhXaG/PoNQTFwtMBXnLjn5gPlmHgLbe895L1QD3ioYUOaZyDe/WCEIEdlh3fxKADtZyybDTRTVoniMyXXs++VGwZSDtlgHUqYgb93Dt1CHhugooFVrhmed9zdpIza9h/0bOv0nB3AMOyUdxDzh3T2Q1Il5yj7AECr2PlKC4O2lH4LdajCIwQMPQAw7wdjaQfyrd45Z/2pJ2gSsdID1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uuj3Gq5I+T1RYlsQduEeBUffN6lFLBUibY92Flsr38=;
 b=l0rbIckzd5WnCyue3DQpm/Qpx/VIRHsk4w709qHczK1sg2zUmihYKQQSzgHyBJZ3+VSBBzr/vpLtuuxqdztpdz2Nnj3VTGF8k4zlIrdEmFY+JIgTVEf6w//ONasGIyAuml6xdejavFYb+gwA+eAHe5MTjZ1rVyHKEXPUE3FzQpRCjDTbTRKNp5jiK2p0R1GwG4OyGUZ4NDIQ2y1gNk2Wx3pMQ2+JTuaF/8uo8Ip1ALJPtWLNFQjg0yre13jzlY/aAxdu1aA2rrfwguadVTIS2YOewmLOJj2bQ7lvpjkuT46xiL0awiMraxX8qZFuaRpr1JjYJwibOUsGUdBJxFrEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uuj3Gq5I+T1RYlsQduEeBUffN6lFLBUibY92Flsr38=;
 b=0BQCL7RL4uhIv4ZTLKkuZ4DeLs6ieTnQ3/tITY6QQ32uDtqLcEij4XV95F5oXkI2gjMeuiRP1Hh/MSmPYPMIeYUSKwCnBUiDiRPhFPo647nruIcGthf0axa7KpwYjnpEOdc5pbtGT0A2Ka3yZsh81EHj5591a6IDi1LNYhHGCrM=
Received: from DM6PR04CA0029.namprd04.prod.outlook.com (2603:10b6:5:334::34)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:50 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::19) by DM6PR04CA0029.outlook.office365.com
 (2603:10b6:5:334::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
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
 2024 15:01:48 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v6 28/44] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Thu, 3 Oct 2024 16:01:10 -0400
Message-ID: <20241003200129.1732122-29-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: d13f9ccc-bd3a-4315-21e3-08dce3e63801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?72CGCKh5oX0kiEiBUCFEvM0K6LafCWP2tG1+KOa9bJQ3nul6Tkr1DYQfJ5Et?=
 =?us-ascii?Q?F+uc/VkYh9OmDKNFB3MpDrxLFlm1XgpUuyCl3r/ohx+/445z8L+s0xheuare?=
 =?us-ascii?Q?9ff5vur9fTVmnqIqxM2zGDlucr34VO7d3rr6Ej6Qkxm4KNxPAOjIwzMENtbo?=
 =?us-ascii?Q?WIPy9rOZEiigknxMW0kP112fTY1eYF7H7X6t5ALWMI2MRNK80amCfkKXFhVe?=
 =?us-ascii?Q?QSZMPonK/0CU0o7yvNFjPul/hdis4HCHfxQ8k9sOiLuuAWiEQt6SC4h7kF8F?=
 =?us-ascii?Q?iavsRNnT7uVeMVaH+mzJEtI3ECqoU1SoUs/j9+x8UwQX55SiwpivTqxtGRbg?=
 =?us-ascii?Q?yPVJDjoULZyZvlLLGPgl21u67mD/x3A5Y6se7L1dBXS6fD2TgjO1xB7u6xp1?=
 =?us-ascii?Q?9e9Vooskln8c3BBmRU0g+MNO4AwshzyhmrRJqCMiO7KUjC9BdJbb2zVbJciF?=
 =?us-ascii?Q?R3J4xSaPyjnMdy07ucN653eThCJv/K3NUxZ1q7h1QMfHSww2oh+SylZ47bSI?=
 =?us-ascii?Q?oJJT8H4FGOE/W5XG806CcpS6l4uEQ9oXWosQp/j/aPDDOhNdLY2iCjr1m8vG?=
 =?us-ascii?Q?gxETpqWKjgh8LGH9hZ+inhbBhHz3QER3aUB9og38Sbv4t36EsQindbtz+xri?=
 =?us-ascii?Q?57ewiMDtmhmiNYxW/SS6XeY8g33p1BtKLse6PO1re+V3zDLh15vsgVvdn/YO?=
 =?us-ascii?Q?j4BWxYS8v8ANUtmH7RvhaV085BEb1siQMYR9TTngp5LFOxbmaxAzcX+3mWGG?=
 =?us-ascii?Q?TXaEC8apqrAZf3APSkRHjCZYJ68XWlWQM2AeaMTYmXR3XYbbZqEhzxGSMyC3?=
 =?us-ascii?Q?Ur06OQ/99GDwrT+zMY2gQmBesBCSZfQRN276bNUobBh6sTjhelcwxstlnP7f?=
 =?us-ascii?Q?hkQFOPhyoeHGd5S56QAqDvSu35fIzWK1OeYPcaci+qgPHnJdyAvenS9gwnHV?=
 =?us-ascii?Q?nN1aZH7XE3qhINJRnLtDgUC7Zhe0bm0XCap6vAzGrxmRAa35GOLq6RCS6PF/?=
 =?us-ascii?Q?SjeH6LcFRQdwrjf6c4WeGRH1lEywIzDC3LnfvhBxUpGIzPkIwR1tWc81S83h?=
 =?us-ascii?Q?+h3pjcBkmY4A5/gtHpwO3xh4rqtkbvA5N19siZN8o27ie4/IrzSCc21IxOCA?=
 =?us-ascii?Q?czabyEmqwLRDnVU7rz8Kf4AtFFIwvy1DXWPIJAUvL+TfYEp1Ig2j51h6aPGe?=
 =?us-ascii?Q?I0X4RzcphEiNMJikWpEJpU+q86nvwRGB5bh+wxrsnUJtLA+fXnW3iUEER2EW?=
 =?us-ascii?Q?RJUn7sBiqkqgluYIix+bDCrjAdx5TVooiMG0Rd/FbdNoh7GYZfxYo2d5zEBs?=
 =?us-ascii?Q?WaBJeJWSzeZNFHTE5R1Ua1Vo01OckzrenRwMAB9ED0jBPLVZyCUUnRzKdz2V?=
 =?us-ascii?Q?wz0ahWC1JhAgtVCXr74v5Fgq7aiu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:50.0099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d13f9ccc-bd3a-4315-21e3-08dce3e63801
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865
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

v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index adb1e4b3522d..d67f88340b6b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1203,6 +1203,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }

+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
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
+		return __set_output_tf(tf, 0, 0, false);
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
@@ -1258,6 +1320,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;

 	/* 1D Curve - DEGAM TF */
@@ -1269,6 +1332,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index c0134e8cf2e5..3afbac6c4e2d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,6 +34,9 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);

+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10

 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -60,6 +63,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = ops[i]->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);

+	i++;
+
+	/* 1D curve - SHAPER TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;

 cleanup:
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
2.46.2

