Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DEAADC095
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D1110E742;
	Tue, 17 Jun 2025 04:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cF7PFcRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754AD10E742;
 Tue, 17 Jun 2025 04:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRTm2uptWEzuwLbvasJL/75ehlAUhJVj3m3QM4rFiiwN/j6fO4wKfGcNMwSRa5OseSxfZahqGUxQQN3iQtbyCtKil54uGbonO71PWLTnyeF+dIB0fv2iCSw6eRizfDOq660VNYOBMeiFhrG5TDzaTdz4XuJ/z+r+HqyPZBebv+jPpVlARR+RK0NOAIPsYffHuKhl6zpc3cAMxYLu1dVNra3vCwjBbGonILGzuJss8H7fZ5Nm+L8iP/V2A5KdpXgb5pMBANUWlDrsG4mAfJ+KL+K8v1NqcS0tkt8zeiSxB19MEXuczKK2Q1STYIgB8IyOgBTR7kjBQ9gcGZp8ALUYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp8pKGp5w0t9lA6WELKDFaAUxDMlmZbJI8/0m50/y+A=;
 b=AIWlRurlvSpXrQZjL3mJgA0JbPRb6Kr9KwH3Jxzmevs5roMXGYSGHAGUAliv8+V5QGOEbVFrlxnRzwvn62YWKV4mYL3hu+fqj0LzDHyZX+rhCS397QaPEEZg3i0pJIDClem8USs5F04GwRA6Nyy5ejzodEx1diEvrAsL0YJa7gNDXBO5A7LhGvEWcXHqrrwHiGprSE45Wm4eekSHbClHjmiJ6ThcHM7t2c3Tbos9H1UOSslv/Gn5SBx0HOnQ71V5DC1DqbywaeN+NEYnTvADdtskrlui29zP2UDTZIZpFtZCgA4VjycJsPXVu/FpIh8wHYkWLr1Xv+nn7cQKqRvDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp8pKGp5w0t9lA6WELKDFaAUxDMlmZbJI8/0m50/y+A=;
 b=cF7PFcRLkXZr79znx6a2JMzzv0GSrf9i98A2fBfqbgA9XIs7avefU6d91h/bVPXOwHTgqhBYUvVTiqCiZfqEwmHzIgpTmySyunFfJ46EksXzt5Ee3vthI5YR6y2t/HlNgh/+/lx3PonU8dKo4gg60rAuiRNJ29GpFpUBZVfyocI=
Received: from SJ0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:a03:2c2::14)
 by DS7PR12MB6358.namprd12.prod.outlook.com (2603:10b6:8:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 04:29:06 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::bd) by SJ0PR13CA0039.outlook.office365.com
 (2603:10b6:a03:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:29:05 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:28:53 -0500
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
 <arthurgrillo@riseup.net>
Subject: [PATCH V10 45/46] drm/amd/display: Ensure 3D LUT for color pipeline
Date: Mon, 16 Jun 2025 22:17:27 -0600
Message-ID: <20250617041746.2884343-46-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DS7PR12MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: b1445c55-31c4-4e46-838e-08ddad577ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?opN7zKdSRNNsCpekmq919lDjSnAhDEN6m8ZtxfQ/YX/kVP/c68EQM7MG5k5R?=
 =?us-ascii?Q?zN7o+0351lctmEirm7Mz9dbt3fxp1X9xfh0T64jLmrgjSIMwG45daKYZSz4e?=
 =?us-ascii?Q?3LJKLQAvC5GYck2Zb5W6w452rXnwZy88xW09km4LY1x/rmpt7CLyZxd17Xq6?=
 =?us-ascii?Q?vIEkD9xCBPZ3hS0BFHPJe6lYBQ0JT3I93afC8sq6qDQJIX6nbykC4fi/BQM0?=
 =?us-ascii?Q?d5UlvG27LaKo8yYbTVo892F3G/u9MjD2pbSQn0Gj2CDUBRL07lGAgwsRF5Hz?=
 =?us-ascii?Q?dURzhA0Lx/WMLAch47jQ5vSzJfB7ZbkbCSozXpF4psuk8pTdNE8WaK7W+tPc?=
 =?us-ascii?Q?LebUAHqzHyGeSA7HJGdJ6nXzqWllCmUzZI6eFbc2/HS9XTQuLbZwiBSogJxj?=
 =?us-ascii?Q?i8sz8MnszP3l6WubzFR6TBAB73ZgC1P54z+dM0AwOf0OxJeC4ePxGQfjJYh7?=
 =?us-ascii?Q?B1qFLFHl9DZliUoigHVOIiU2sqwv6sZw8/HkzIMOVzZ+UmF8n+PSrBnxz0hx?=
 =?us-ascii?Q?+n3ZJUzy/+Ed3MxL15WOOS2LoDqM59MFEOl67FxEhH4++hFmMHQqXAKKBDOV?=
 =?us-ascii?Q?KY/MykPtkh+3Bj6FIn8aJkRo7iXfO/M7xA7nEkB+yvtszFRiCfGCUP9I5+yn?=
 =?us-ascii?Q?yiLhngBckCpKpbRohS/ie2HOPh9YyzjPVVNPoknMm7fUMxb6rApjV2R1tzCy?=
 =?us-ascii?Q?eyX7kC/WOL807ZNpZSUPFrTUKBxDa0PLmAONwteXaz3M9i3OxEbU7vfT4aPD?=
 =?us-ascii?Q?3MRA58KHYAx9sA8TGPVAAjOFknTek/m0+JlLwk0u3xoI9QeUd7Px+nGfhPt1?=
 =?us-ascii?Q?P5l79Iol3bTmPpCLmrDkS1iOdD4RxckqZw0AXykfuFoE4CKb6YwKjaF6oDB+?=
 =?us-ascii?Q?O1zU7zDRQ84KHOU+qsDCHXIivPnHYv0ic0QCTqv1zTH7RgB2SmXRiRx7ndKe?=
 =?us-ascii?Q?rJkKwsm6iVIJNzieFc01JIExL0x9UmPfW45YsQ/wr5EggYEfw052DEQLmsWJ?=
 =?us-ascii?Q?zZeV3y0BdWjHNaCb736bsyzqTag7CL3VEgFcHg7NLM8a37NSWQh5/ZyVqqg5?=
 =?us-ascii?Q?/LcNnhWZqu/7i6uG2syxH1j2tf6zjyarozhyMe9/pk1F6w8iVDEAzYfqh8a2?=
 =?us-ascii?Q?eptppdTvEwYeOnQ3OW+NETLVl3LI+hVSnxt7HdqHwMLwJmnHq1gpqm40+Q+Y?=
 =?us-ascii?Q?5BU2XVBoT57xZ/pG3asL8Nh8NPVhcqLBxQ9N8BT18gO3598MU+VDPPVhm0gU?=
 =?us-ascii?Q?tWYd5JFI75HLmwvRnCeuZpiZQMaFrAKwdFWRx+nldUDZW+h3Tb4fHt/UYLeY?=
 =?us-ascii?Q?obl9RnOsamIbAyUDHQA33l+tmkVrXE+nf05Bsc7jOZmKnjOxLUbZ8wbvR0Wz?=
 =?us-ascii?Q?NUI2StLcdWNEXvrnX2PkGidWwknRSTv2HFbVKJpmVMgfQKsYtDebzW82fovx?=
 =?us-ascii?Q?1KNjDsd+lvRrtGbiwvcVWqRZ3cwBNe2RmQYB8DvGypKdbQM0cizeYInisO9a?=
 =?us-ascii?Q?gt/0hoFAVmTdpIXk6xP479yWZPCQ9x3L3vqr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:29:05.7273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1445c55-31c4-4e46-838e-08ddad577ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6358
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

Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops in
colorpipeline and handling these colorops.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V10:
 - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops
   (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  47 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 103 +++++++++---------
 2 files changed, 78 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index b53aecd1bebc..c6d4a9365c00 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1825,6 +1825,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
 	struct drm_device *dev = plane_state->plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1857,32 +1858,34 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve & LUT - SHAPER TF & LUT */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no Shaper TF colorop found\n");
-		return -EINVAL;
-	}
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D Curve & LUT - SHAPER TF & LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no Shaper TF colorop found\n");
+			return -EINVAL;
+		}
 
-	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
+		ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
 
-	/* Shaper LUT colorop is already handled, just skip here */
-	colorop = colorop->next;
-	if (!colorop)
-		return -EINVAL;
+		/* Shaper LUT colorop is already handled, just skip here */
+		colorop = colorop->next;
+		if (!colorop)
+			return -EINVAL;
 
-	/* 3D LUT */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no 3D LUT colorop found\n");
-		return -EINVAL;
-	}
+		/* 3D LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no 3D LUT colorop found\n");
+			return -EINVAL;
+		}
 
-	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
+		ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
+	}
 
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 680b4e783959..fdb653548c9a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -31,6 +31,7 @@
 
 #include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
+#include "dc.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
@@ -55,6 +56,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 	int i = 0;
 
@@ -108,57 +110,58 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 1D curve - SHAPER TF */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
-					      amdgpu_dm_supported_shaper_tfs,
-					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
-	/* 1D LUT - SHAPER LUT */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D curve - SHAPER TF */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+						amdgpu_dm_supported_shaper_tfs,
+						DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 1D LUT - SHAPER LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 3D LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+					DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
 	}
-
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
-						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
-	/* 3D LUT */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
-				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
-				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

