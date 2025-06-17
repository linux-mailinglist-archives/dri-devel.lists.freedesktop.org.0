Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86812ADC070
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1010E63A;
	Tue, 17 Jun 2025 04:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j4l8eCp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D6110E5B8;
 Tue, 17 Jun 2025 04:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7Spk9IvuyEb+MQNy4YWWu4/iFHmWoZRJuvkZkukCdxdfant7xTy/9rirbxqIyEpHfbJposcvLTNnL6UoBImpp0lfGkykEctjV2/1CUbDNTj4lUnIzXPTLdhMZy2TYTrkfkE+CYQECRLTXWtFbhYZZswhseIBNdauEpfmapysDwtEzheQUk5NhG99xqMB+yAHhQ2lb7GlHdTCs3X7TnlAKSwotcEqdx0x9HNehBwYCeWnismJrmYQqRx2o58nHxJFxfA2Pho75TQcpGBUTwhKzzgr9SgBlbBk+C76MWxiSVsGwKNV8+skPQ7anwltGTcuxjWOLq42OA5/OnTuftyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO8V8nbMsG8M+ag8xN33ttYCf67TAHUuSMJleHrtX7E=;
 b=R801uc9+fhKguSCt6gQQr5qTsjGFXg402ycrk7MJMkuS7zS0lpGk7e9WWI2p93lcTnN8O/NVIvZmUJi9Gvsi2XorS5WOlwF4CjuPEV4TT3nUw/qMdZVtweN6fdsiFXsYScliDKwwZzjq2St0WP8ApIaS32qh91LPUZgG3UzUjKAiSej6t0QZg1w++gjQs4dXA30yknhOQ1G467uHeMRKTvhhtY6TsrMmjMDEePGh6ZfXLoNQZzP3tkO/a1SBw6uO+KuRYObpGf65xc8Wl7UitmW211f7EDw9i9heEO7oQzZpXgehoaGgjnDF17Ov4LXEv1WVgYCSqwVfE9Aczxukew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO8V8nbMsG8M+ag8xN33ttYCf67TAHUuSMJleHrtX7E=;
 b=j4l8eCp+JGtjJvhcPBoI/oScCAdWMbQ+HWyPetz9F0YOL6PprLYbpFfFeI6GeDaGjbKUiQTYsR7savqv9oOuorVZ4SozgyKNxHUe5sikB2ztJT635bQSUOCn3fU/5uVgdXaw4fBCTjqKQHHHuR2ox8t+bCfn0D2la8KaadYzXtI=
Received: from CH0P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::29)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:24:57 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::11) by CH0P221CA0048.outlook.office365.com
 (2603:10b6:610:11d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:24:57 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:24:21 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 26/46] drm/amd/display: Add support for sRGB EOTF in DEGAM
 block
Date: Mon, 16 Jun 2025 22:17:08 -0600
Message-ID: <20250617041746.2884343-27-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 290e21ce-949e-475b-2970-08ddad56ead0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EX+efTSDeTfyVVtAgydzlhFHULMj7C3v4massCWqF4fPFTZBavZjIPs+r+as?=
 =?us-ascii?Q?l4f2Z1EbkInhj2pMm0C5WVKswHZKB27gXUW1gAii97RxfxvI1bFCMGjErNFF?=
 =?us-ascii?Q?R8Ra1pBSykGmPGxCCttb6Yoz1JdDaia9Fv7Btag+ed81UCQLmlHeIZbp4Aui?=
 =?us-ascii?Q?vJHzSNmVxRsPQZ75U3dQ6Nm20W62/dLcjXIypdO3x+1MseHxtaceUaDHRHzW?=
 =?us-ascii?Q?oAHgTlFf/AmNBfRVTJ3mdcByXP0DKplLCMYRQmJLtNj02BidJ+QhFcJ6Gmup?=
 =?us-ascii?Q?6HSYHwaOUVQktkdQPNU/gmqBsHiLAza9gx4zg29mDKH/pCPzvOt84QrE7DF8?=
 =?us-ascii?Q?DiXJet+cE47hHOBaLKsLGqE0+FnGyLTOqgyl6CJv5pbe62gjAMczE5eRLZI7?=
 =?us-ascii?Q?jADR2pKOtqk9wj1FtpyEQDB/NYVT8F653jnsTie8GLIz8Sk8l1rgdFPvSK8K?=
 =?us-ascii?Q?q7DxOX0UgmULTIHH5DnB5JiY9wQfRf6zSiFZMtYh7RMxPD0mglsMIFXQBlAn?=
 =?us-ascii?Q?GNKtoJtV83jpt4guRG5hb6A2qQHFebgK7hcVR/RdVGjtwLSAamG6vRe1Kgkn?=
 =?us-ascii?Q?S9aJPZFGdl/DPPFfxQgWmKOrbS+XxoXMGLu0Fjrz1AQZFO2SeV4WkcnsObpr?=
 =?us-ascii?Q?bsk+uRa/6iC8XYuVcNUuC3/KbtqZLpcQaR8Zs8QM7mw8XP9UhCtBOL5VW2ZQ?=
 =?us-ascii?Q?qmoegDRwf2jOZCq/kmhLEhNqlBZOfEbwiNaUYM/DJuh730B65gLD1OWeb5SB?=
 =?us-ascii?Q?/n+z6Ham+0eQNBjFA+dIYsv83F1uwDrkXyiAr0ZRPED2IoVbj+3kmtRGVtMY?=
 =?us-ascii?Q?7/J6sH+fKosFnpT71YVlr636tVvQjvuT2Fu/BrmL6M7+TqfE0/LmzuBxeic8?=
 =?us-ascii?Q?eokS6HKKCMjJb5N7+PZdl2NIhPdWTM96nDow65XYLjxH9BL/qyD4L6tGLD62?=
 =?us-ascii?Q?8RwJ4Vfa/cfeIyUqjo8N0exeh0lfyC3jP7WkSna3tjWw4/x0tSLsgRfueG1h?=
 =?us-ascii?Q?aG8OV7DzjNasTMF0z5HB6SlRGUscXXRWfcRG7ENdvh4cq10ULV6O7i8TumAf?=
 =?us-ascii?Q?SOAGohr9aU0Gxwjkm4uMXOR/k27Jip/hbT9hDfD9eKQv8T9siTDBr7JoWTmi?=
 =?us-ascii?Q?h2kKYxSZpU79s1FZSysry/8M28KKLj+L7VqmSgaMwqToZ6E7FzSdD1Xna7oe?=
 =?us-ascii?Q?V+HwQNu6vYIwOZwCo9KnNSv7BSzYwYNXl0QYzyKi2bfepSCwX3UxwE6AfRrw?=
 =?us-ascii?Q?f/h646fdJFH3McakiACtkBk+iv1LELP79DlXfw0vUv5nU89ZfgxR3N02etpp?=
 =?us-ascii?Q?wIwGSMShx6QsUdcv15I/39SKackvE/dOtzcFskOK/hCP8DAMla7V+38gmQLI?=
 =?us-ascii?Q?Kui6ItDEagqNKxBB220KNkB651DoAIgN8pUB07VtoaKNj870suwoKZ3HbwiZ?=
 =?us-ascii?Q?pTkr/vSWlj7dFIXaFKP3a8zFVmhb/yfqTnIib1t2wlCZKDg4A2xYJSXjmOSD?=
 =?us-ascii?Q?iXQ5D8ckhHrUg3S6ChOrg6ZcsBazBCgCUelb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:24:57.4223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 290e21ce-949e-475b-2970-08ddad56ead0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664
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

Expose one 1D curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
the sRGB transform when the colorop is not in bypass.

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf

The color pipeline now consists of a single colorop:
1. 1D curve colorop w/ sRGB EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V10:
 - Replace DRM_ERROR by drm_err
 - Creaet color pipeline when >= DCN_VERSION_3_0

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)
 - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)

v8:
 - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)

v7:
 - Fix checkpatch warnings
  - Change switch "{ }" position
  - Delete double ";"
  - Delete "{ }" for single-line if-statement
  - Add a new line at EOF
  - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */

v6:
 - cleanup if colorop alloc or init fails

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 71 +++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 16 ++++
 5 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 7329b8cc2576..8e949fe77312 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -39,7 +39,8 @@ AMDGPUDM = \
 	amdgpu_dm_psr.o \
 	amdgpu_dm_replay.o \
 	amdgpu_dm_quirks.o \
-	amdgpu_dm_wb.o
+	amdgpu_dm_wb.o \
+	amdgpu_dm_colorop.o
 
 ifdef CONFIG_DRM_AMD_DC_FP
 AMDGPUDM += dc_fpu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ebabfe3a512f..0b513ab5050f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
+{
+	switch (tf) {
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	default:
+		return TRANSFER_FUNCTION_LINEAR;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE ||
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
+
+	tf->type = TF_TYPE_PREDEFINED;
+	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
+			       struct dc_plane_state *dc_plane_state,
+			       struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 1st op: 1d curve - degamma */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1187,6 +1252,24 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct drm_colorop *colorop = plane_state->color_pipeline;
+	int ret;
+
+	/* 1D Curve - DEGAM TF */
+	if (!colorop)
+		return -EINVAL;
+
+	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -1283,5 +1366,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
+	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
+		return 0;
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
new file mode 100644
index 000000000000..9d371728b5fd
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_print.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_property.h>
+#include <drm/drm_colorop.h>
+
+#include "amdgpu_dm_colorop.h"
+
+const u64 amdgpu_dm_supported_degam_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
+#define MAX_COLOR_PIPELINE_OPS 10
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1D curve - DEGAM TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	return 0;
+
+cleanup:
+	if (ret == -ENOMEM)
+		drm_err(plane->dev, "KMS: Failed to allocate colorop\n");
+
+	drm_colorop_pipeline_destroy(plane);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
new file mode 100644
index 000000000000..3324e2a66079
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __AMDGPU_DM_COLOROP_H__
+#define __AMDGPU_DM_COLOROP_H__
+
+extern const u64 amdgpu_dm_supported_degam_tfs;
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
+
+#endif /* __AMDGPU_DM_COLOROP_H__*/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 9a5b184e594f..9a56ade18314 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -37,6 +37,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1790,11 +1791,26 @@ static int
 dm_plane_init_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dc *dc = adev->dm.dc;
 	int len = 0;
+	int ret;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return 0;
 
+	/* initialize pipeline */
+	if (dc->ctx->dce_version >= DCN_VERSION_3_0) {
+		ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
+		if (ret) {
+			drm_err(plane->dev, "Failed to create color pipeline for plane %d: %d\n",
+				plane->base.id, ret);
+			return ret;
+		}
+		len++;
+	}
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.43.0

