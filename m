Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960EA7277C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEFA10E7F6;
	Wed, 26 Mar 2025 23:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tdCsqyIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A53210E7F3;
 Wed, 26 Mar 2025 23:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sszwT6xd2omrIm8tp/KgTT5+Tr3kLmBFy7KPBzs9L59GavmEvTgHgnmnQVmFVEGnYCmZlKS9U6z/VFR1jcJ5l0Bf8S4tT2EYecSjsCqIxWQo22CkD9SOF58s/0kE25NuIyLPRZd8qEf7XOqJPIqR537UVU0x7dXlYctSj6e/PmipivKeQ/JzdH9sf3meDjGjUzTNoBTXajZCyu3sCX7VhE/+ZuU/nuotEK5IoU5A4s+2KGtbIp0zeW6y+pPXxk5Ilr/ORFtzzLodrXtC2s9n9+1nLVN/EHwx7BsDhCRKXJlWhZ7p0ZyXlIq+pzDrHcPCmCBp8pwUUP0iMdol639u5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltyZz0/YE1LPWigtPmRrJTB+O76WVKeNFq2rK1eOPYI=;
 b=SCfBKllySFG+bQgbgMm9lFChWQKSRDwAOGrjleJGKHJ7WFzrMoi1sns6rsKQERwNsmdEpeJMipjVznyV/iWKGtSa428b6WpGtc86J2lq+fS+Rz9Ci05O6Mt+RwmkAFu02owqY62OVhBRheIOU6Pwa+dPSSqQW/DYHyFbEwysN5Mu8PnRPw0lX/ctXFgjzhGE5XqFAtRaQklH6WeiKwPxlg0zbNoogFyU6nXFekVca7mBG8tb1huzlGtrNAc9ylaPURwOaxVay5U562HsJQ1LpHxoDBBogqRvFLqHb7pWdGFZiqWTqaJjLFcQ965t6qQERZcHRTtrlzlNhn7Nd7ENqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltyZz0/YE1LPWigtPmRrJTB+O76WVKeNFq2rK1eOPYI=;
 b=tdCsqyIlcDfg0RaIX/85Xs4Rf8lveh7wop4OLINS91z8TaK98onhdeyzLVVCOvAY33GEbz+oNbgZOHW0gJdXh4F0+c8OeGLbtVe+uUnQ4o3fhPSaIwrYMTkAvyZMF9kcaXlu9b8e3VlYxqDAEkbMQRutvNke5RbWNioiPL6B6Cc=
Received: from MN2PR16CA0007.namprd16.prod.outlook.com (2603:10b6:208:134::20)
 by MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:54:43 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:134:cafe::c4) by MN2PR16CA0007.outlook.office365.com
 (2603:10b6:208:134::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:54:43 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:54:40 -0500
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
Subject: [PATCH V8 26/43] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Wed, 26 Mar 2025 17:47:07 -0600
Message-ID: <20250326234748.2982010-27-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MW4PR12MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c3db28-b464-4195-1a60-08dd6cc19497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qmRFIvZL1nlfj9gxRikXWSYPTPA1RLdF9TJqKRyjgzkXhzKiyHhe23Oj+ZIl?=
 =?us-ascii?Q?+k838PeUgHXlZt8qeMqCFP3LA03nNoYpHpuGoVNuAbP2TW3anqze9fZ/dyiJ?=
 =?us-ascii?Q?Uzc15GoIdIliRb/ix+BJo2O/TdokE5YF1KuTcH55CO3x6uYytzLaaCbuwCw/?=
 =?us-ascii?Q?S2PealN9BPihJNzKHOEY7NZ+hDFq8xKIGqy3S0tzO6RvKzFHsny1CzBoKrpK?=
 =?us-ascii?Q?U3io1EC3liTkjyTZlg/9MGeEA7ZR+yZAeGcwdlzj9U3c6SmbNcS3+bjHcX61?=
 =?us-ascii?Q?oNiwrHp7rUkn137gzqXQWXG3u4fPYXUW7173Ga0iIro+6PIZB0nlDLE+JEkJ?=
 =?us-ascii?Q?gFYLUp0O1qJUn6kIbOy1pv9844f/0S+u+3vcTHtMzORix88SjGjewX9wnz0v?=
 =?us-ascii?Q?awO8E/gy83WG56JoxQYdbogD23aaBIR7/u9RNEZkFGthP91LkJMNkTMyPBJa?=
 =?us-ascii?Q?8ayZdx2whzFpIwKBRPBwwthEpcn7UFIduBjQJPHrsAFcBKFPV1hMamvj8H2L?=
 =?us-ascii?Q?IZF3obu6O3S5q+CNJPObtlpgn1Xx/5BrvHmDCnDLU+UUh0hxU3r2Q0tYUOV3?=
 =?us-ascii?Q?a7TiGkmPiBRJcGdomoOhBRlQBsY06X5rLQ+sdLfwtUu7ALnmS/m5mCsi4ptw?=
 =?us-ascii?Q?PoYlFXDRltFjOJM/iqM8COfSJy3guaTIixnFAwjmQ7mEbgjTQ6p4ZHlG92yE?=
 =?us-ascii?Q?6ciMX1+j7KXshAaidp8Iln2sViLbJFcrsLHIFbfg8UNtDJpqay0jW/Lc1dha?=
 =?us-ascii?Q?vStLHKOdbsRnhGYou41oNKICvjEmsylgXwwpa5nJAdiobpmG5GvqDbqlu9+e?=
 =?us-ascii?Q?yuPEaxUHfEC5sg+IcCZ4Q0PN8B8MDJwCkvD2A0w1vj+SbjuftCae7IdOerYm?=
 =?us-ascii?Q?hgldBzPFzSa7HzSrR1f9B+w2q3NjNMTBoxH7fdE7LlWBpjBmoE/573NU6jhv?=
 =?us-ascii?Q?B9kL9w1+JqYkHXPRbAqp1qFFUh0Z46tDx6u6QZ9m9rw4TX3Qd0WHoWSu5xLc?=
 =?us-ascii?Q?jwVn/Lc0V3aPQFSsTbVYLDClw0NXzOweDHLkcR03RcyGg71XANzZll+Sjf45?=
 =?us-ascii?Q?NmaBlTz02Il9bjTOrcUjP2xI/UbaOo/qqsISPj/7DswzdU485Vc9DJVUysiw?=
 =?us-ascii?Q?+2RryPb3KM1k7Hhau9hRZL4XpPUf1c3U3YtQYBQ6rnHdB5+SjKkZ/GNbEK1a?=
 =?us-ascii?Q?1WaGxzRdTnJ7j6WYqG8h8qySSfFXeGcMOyxlVxltroaiF0/1OS3Zm+k8E105?=
 =?us-ascii?Q?Uft8gSpklwDM6fNHkdt9XsdflHNCL/5ZdMEZbXZyhQrfulFF6SRxg5+M5/kx?=
 =?us-ascii?Q?ZfEhufmxdrpYGWPQ84251zFeLDV7Au1zun0cuXIsnzstjTvNLGFcFuab0I0q?=
 =?us-ascii?Q?dVGAJPC+Jk43Lv86/UNcNAdkDwsoixbL50VYy4LO+y5YgpATg6/go4OjxVVF?=
 =?us-ascii?Q?nIrS2D8g0c/hEHHZOXiItxfzEDgptzFqExzGg1Peh/XAamtkMxuNbskgG4B0?=
 =?us-ascii?Q?XOnCYjcCKAG/HIw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:54:43.3584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c3db28-b464-4195-1a60-08dd6cc19497
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358
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
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0b513ab5050f..4662d88885de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1202,6 +1202,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
@@ -1257,6 +1319,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1267,6 +1330,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 3be0cb19ebc7..718544b11863 100644
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
index 3324e2a66079..71cd27994528 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

