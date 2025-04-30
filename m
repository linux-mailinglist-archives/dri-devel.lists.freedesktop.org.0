Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F1AA407A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8460410E69C;
	Wed, 30 Apr 2025 01:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U1grf+nk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD0F10E69A;
 Wed, 30 Apr 2025 01:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrSs1dmK6LNP9QBG0v0zRyVlfMo6bxmwDuUASizZCuwTQX0qRHHPMul46g5ktNAl3p5mcJe0i0zVC1UiwiJ39eFKc0yU0AyDxvvZLtF4aI97xMmRgSY9L/S7IVGXy7qzMSuiuRZ1TILSWGxxNSfaUqJEET+KGWqVJUhJYtOT9AbxVX8ftA168kGdIl14iL6N5FCFPtxyTrUsBUCOoVnbuvV8b1syk03OP1WtOt8nWZtSpF8TMJ2rk5x7xD9EXu7jVvZljolanQdKqGprVRr50jDfidIJInZd2coDsvHMpai1tMwDe3U+/Eg1fUMnp7Z4t4yLpDh1pCCCjwJqCOuICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZzECc5UXWDq9rgwkfcwvK+XR7PjPcJGGULSGb+NhTk=;
 b=MbgyCFCr1TSXgQDTB1Jw/uSVFC7cXL6BDiSqB9C+b+UcdYy2wrdYkZLGn/oboHHXZFms3OOY11VrvkvXfZu55WxytxY4Alhk61H9+Sm9uRHRwDJu/yRBuQPXsy3QJl6zb5kogcEbfI3enX0Fa0JUd4eSpNhlRRrxoLqPH2uCGZ1M7vwP9I8bEmSlApqOn/iMiTtzTxc6HqMAwXhEuBn+SeLQCW6ZriYvP/0HOJZvwq81JI/Yz+PStUrRne+SFNZC4LElHX6DYn74fxAoIzbJ+o4aqKqnrbbH01XYuMnMYz6g/Xsd7ap6sNzeU4oqZi6kUiXb8GxKwOPEACfR+uH9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZzECc5UXWDq9rgwkfcwvK+XR7PjPcJGGULSGb+NhTk=;
 b=U1grf+nkWY58iJ3kgwmDh/Pf7Vuw5tJJHJ9b6SjYSvJYyjX8KZH6xjiei09gSv1KTfqGd+Ff8Ftfa1Xh8J3YcHwBLCGkB8VRtZv5mRbQuJXH6K/TF/v811hc1ADrHIXNfxlM1N/gGtb/uNNHJ1OBNWBQ7CAFPpKPZVIBdXHs1tc=
Received: from BN0PR04CA0169.namprd04.prod.outlook.com (2603:10b6:408:eb::24)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:21:40 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::5d) by BN0PR04CA0169.outlook.office365.com
 (2603:10b6:408:eb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Wed,
 30 Apr 2025 01:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:21:40 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:21:36 -0500
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
Subject: [PATCH V9 40/43] drm/colorop: allow non-bypass colorops
Date: Tue, 29 Apr 2025 19:11:10 -0600
Message-ID: <20250430011115.223996-41-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e539192-20c9-439a-1a51-08dd87855c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lg347o/W5ue8MEgnE57/DAVwlIIizA1/vrlizZJPyBuf+UKGDqJimXuIiHSe?=
 =?us-ascii?Q?4HF5f6m1ZZuJX+Mp+RK+CJDVmRdnq7ESb3Nt8/pdeg5p0yF+ebyRclijAdGt?=
 =?us-ascii?Q?l2mg6X5iGLU5ZorU1uSYFm8eGdcGp5NdtLSyD/w6L4PAd1YM3PYyF2jQK0X6?=
 =?us-ascii?Q?Aalt3U2mcoE/74qdH8Ocm7SkpKAY+bstO5HkE05IC0E9rX9S/D8mZofKaOdD?=
 =?us-ascii?Q?7g4NeG9Fw0ElQUDDzO7gAS4wjBJqy3VJVc9JCBsDSW++k4cu/jp9SheoVYdO?=
 =?us-ascii?Q?s2LXQX3kou1QJHbv6Jp+vsuTHKqPDPcScdNmHuS2KrSFVbAQ0s/pzV7d81pu?=
 =?us-ascii?Q?RDd+WWFNxDdK9yYo0YCDbAziSrjsbknBFvcc0FgVCP+pIh+2Lo9lbvVgGIam?=
 =?us-ascii?Q?Z3HHRxfRHLv0DrStdeOnAYvR5FanpJNfKItTNDnqiiOaJT+OVQKDGrL/0gBb?=
 =?us-ascii?Q?6OPs7Xgef7P0b5Lejjs7hsfoasl7e0shnQYgYYGcxGlNXi7ydVYuwfCMJFns?=
 =?us-ascii?Q?2oyikD1gUxqgtsvJnYH8/sTCc2rpEwrLG0IA5CNRKWVfOfHj/4ONpnkxuU3/?=
 =?us-ascii?Q?tRwNtOjHN1CE8qRcZsfXZf7SSm7S4SX0xmBZ2vErqfq5J8eQxCiyFwc5Ts0A?=
 =?us-ascii?Q?k4gUFjI+92gvU2nC/rM6h6c+H7U/qmEBfie7s61bHA8wFEesEoA95FNvrfuc?=
 =?us-ascii?Q?neN/AE2H+DrLh5qnJEV2Udmhad+K8NJciKfmFnyF9UGfVzRKHXwi2duyH4W3?=
 =?us-ascii?Q?k8r2Zb2EpG2bA0pcjiTpnlZuw0Q3M+7zfLVNWlPlpwuUscTgqnUFYN4oEbWV?=
 =?us-ascii?Q?Ab2CNH0YpZkwNzXQJKEU+KKV+HAi6aZV9/7BhWQWBj6upDU+5K3CnoaOMpf6?=
 =?us-ascii?Q?DnRAe7BlaX8cjQBEZMc9ReVWE7gJUqI2bXFdsyBavqUWAcQ8zzMaFTMjrxRW?=
 =?us-ascii?Q?SFInGvh5fZChszwJ41yHefegy0QTx+ADYRh0ZOnhqlfhCZOyDpdK+kUSXUI3?=
 =?us-ascii?Q?/jsF8S53nd8VbY/WxezHDv+9HYMEPNBKz+vNhABrK+4s5MA/RFNsnaA3SbCG?=
 =?us-ascii?Q?9MqIRYgCMRy+YR047EICZmuMzL/SJ/N4DhWwfRuOuC+bk6sLIz38HRyhV8kJ?=
 =?us-ascii?Q?dMdfLsf0s+HTv0AJ/VbnDUcSadYGqCLxCHqXinePotqUAsg2oCmuH6IO1BUP?=
 =?us-ascii?Q?bm7MdEooBLbjJ7bMjRayhAfOHyow54yBBPhKhOFzPdgFry/5+pXgViIeA/zd?=
 =?us-ascii?Q?7X1T87JRROuXj+OsaDNFSwUpC5wn+7D6S0zf9NC3TnIUd6s3TKl4/fxoHF0e?=
 =?us-ascii?Q?vN2fQ6BOO5lnID/e7d+AFnvprQSPOjjBqTnqSdlkUhYP0f70d7bwQKlZhWpg?=
 =?us-ascii?Q?ILm9J3+sihiOc6XOiXQz38qqSOxDOcSzrJnULn9q1XCpUZLCCmwLh00bWqRn?=
 =?us-ascii?Q?XL6NLmhg48IVgyQi6P+Zvw1Dy1RqGjBRM2k5J4ZarHBYki7bv2VB+rEfzwkD?=
 =?us-ascii?Q?cXc0HYQxwEJyTmH+9IKSlojRDuGv4sXsI7sU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:21:40.0772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e539192-20c9-439a-1a51-08dd87855c0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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

Not all HW will be able to do bypass on all color
operations. Introduce an 32 bits 'flags' for all colorop
init functions and DRM_COLOROP_FLAG_ALLOW_BYPASS for creating
the BYPASS property when it's true.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)
 - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 44 +++++++++++--------
 drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++--
 include/drm/drm_colorop.h                     | 11 +++--
 5 files changed, 55 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index ff11cb0603c8..10b3e3906461 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -66,7 +66,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_degam_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -83,7 +85,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -99,7 +101,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -115,7 +117,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_shaper_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -132,7 +136,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -148,7 +153,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_blnd_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -165,7 +172,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 90df638f25d5..41dd6a90e13b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -786,7 +786,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
-	drm_printf(p, "\tbypass=%u\n", state->bypass);
+	if (colorop->bypass_property)
+		drm_printf(p, "\tbypass=%u\n", state->bypass);
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_CURVE:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 125b3e507d6c..38bbe57db348 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -85,7 +85,7 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type)
+			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -121,16 +121,18 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 				   colorop->type_property,
 				   colorop->type);
 
-	/* bypass */
-	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
-					"BYPASS");
-	if (!prop)
-		return -ENOMEM;
-
-	colorop->bypass_property = prop;
-	drm_object_attach_property(&colorop->base,
-				   colorop->bypass_property,
-				   1);
+	if (flags & DRM_COLOROP_FLAG_ALLOW_BYPASS) {
+		/* bypass */
+		prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+						"BYPASS");
+		if (!prop)
+			return -ENOMEM;
+
+		colorop->bypass_property = prop;
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,
+					1);
+	}
 
 	/* next */
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
@@ -195,10 +197,11 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
  * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
  *                 created using BIT(curve_type) and combined with the OR '|'
  *                 operator.
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs)
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
 {
 	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
 	int i, len;
@@ -219,7 +222,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 		return -EINVAL;
 	}
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
 	if (ret)
 		return ret;
 
@@ -279,16 +282,18 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
  * @lut1d_interpolation: 1D LUT interpolation type
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 					struct drm_plane *plane, uint32_t lut_size,
-					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+					uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
 	if (ret)
 		return ret;
 
@@ -326,11 +331,11 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane)
+				   struct drm_plane *plane, uint32_t flags)
 {
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
 	if (ret)
 		return ret;
 
@@ -350,15 +355,16 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-				struct drm_plane *plane)
+				struct drm_plane *plane, uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER, flags);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 70be35804ea9..f61834d2ea30 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -31,7 +31,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -48,7 +49,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -64,7 +65,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -80,7 +81,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 00dbde7e1a92..e79472739d11 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,8 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+/* DRM colorop flags */
+#define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
 
 /**
  * enum drm_colorop_curve_1d_type - type of 1D curve
@@ -354,14 +356,15 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 void drm_colorop_pipeline_destroy(struct drm_plane *plane);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs);
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 					struct drm_plane *plane, uint32_t lut_size,
-					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+					uint32_t flags);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane);
+				   struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-				struct drm_plane *plane);
+				struct drm_plane *plane, uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
-- 
2.43.0

