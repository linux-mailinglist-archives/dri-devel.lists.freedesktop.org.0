Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C93C1E4E8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31D910EA95;
	Thu, 30 Oct 2025 03:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mg5DcDA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3FC10EA8B;
 Thu, 30 Oct 2025 03:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4EmmL3PdlYaBN8M5BOBb+vzQrxnYIFbPQONwWhqJDp6cnM+EF/yTKp3Yc+l2s6wpoKLvGVQD+PTnA2/F/XYKvsXKScwnCD+7bVz+eA/deTZEi29bSpXGsIxBOns2I218GqoGyPFcDmnGbhuOZ6xYWgKLldAWc8wGVay48V8hycWUI4E2nc2UZbLVh11ivih9XI6XfAj6MzOqs356HBOI4mAUAuQKmZ6blokA15h55fmxs4iyXD8lRUvbveE9bKcC3UueFDOo+p6OV4V41GvphtkgVgVy0SdB7lWGtSst1e6fETJ3RJOrTgrkdRK51xtripIU8qZaI30tsO+GipJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZnOvKYBcPcAr49Of5iNZP79GAuUZnTuCvwO+9e/JnI=;
 b=uQv4FtbguuZXs0T3jbG5hUiIeenIedj7Kb22qDiz7C3kao6T1f7Qb0kQrR6v6KPzBGpxfqcQfWAOOTU6ExTfnmY1b/ujlIUH+RTDDV9WkD8/eib4esXzQTMWkofHWtORWizoj9PXJIW2Xh4xCv0d/PVedpYu7zXD8UUON01T+8jNz5JgTjMn1w6E9YxEtjPugVejTzCjHK12Mj+ML29Y20wuWNE6p+VTU2Yc8GPUYTxb4u/H6z8A98t+drNxp0gAP8aEa1JaJvg1WpkJ8AeWvPiZozNHpl1YbD7rpapXNb5n3K1Q1iYqMvax0jjC9sV/Wg2PS5bONYU+dwOH27XP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZnOvKYBcPcAr49Of5iNZP79GAuUZnTuCvwO+9e/JnI=;
 b=Mg5DcDA4Cmuo0vVh5PfkpHUWTD+9BLTrFMpY3eSJjSpTaW4XoLtNTR7ZRfDSA4/2G28FPKnzS4G95q+NrIspYG3t1qi+uPd76+ltM8OQ6DhYi5y218+Ao5CCZlIDhWICNX9pVsdWS3JFvR7MmTjB4BWx6ev+3YnJpZxmUaYoAOQ=
Received: from SJ0PR13CA0211.namprd13.prod.outlook.com (2603:10b6:a03:2c1::6)
 by DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:56:14 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::42) by SJ0PR13CA0211.outlook.office365.com
 (2603:10b6:a03:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:56:13 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:56:09 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V12 46/49] drm/amd/display: Ensure 3D LUT for color pipeline
Date: Wed, 29 Oct 2025 21:42:51 -0600
Message-ID: <20251030034349.2309829-47-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: e90be3e4-b9bf-4cbf-f18a-08de1768451d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7YnRZVdP/+rrWsZzGUPjVIaKUy+lgIRpuPrzPyc8Gg1Vn3oKU/WNBzzvnhn1?=
 =?us-ascii?Q?jEuorLV8MCIZFlAjgGImjYTflfRw+FrNXOHmwEbymS02GrBCAXwOnXxQl0U8?=
 =?us-ascii?Q?Wj2akBus/wUzwCNq8W4kBd5s9ZOWcNMIvKeGdN8APuo5zvTS9q/EMaBhWUPU?=
 =?us-ascii?Q?eVfOs2JdXj9ZbO92xLfsY8l2Jh8jOcfsBhPfe3oGBV0cubn4K//OybjpVnhx?=
 =?us-ascii?Q?VRn207Geh6O0Wq8o0m116I/NY7s3P3/JOFgz9UJE4MtAALjsWBbAECjM/Yvq?=
 =?us-ascii?Q?B/EEURnOf1jQLvvuF1UVs6fak9nPaBh6YMX0MlMgwurFq2h6xE8qbCOrj3sx?=
 =?us-ascii?Q?bjc8Cq22pnIlLz/ziuG12KgZbqr6yfz5pO2WqT4rtoN8iGB5WDTkWxiqCAOZ?=
 =?us-ascii?Q?V8c11XfGbcGlkuv21cZbFY2FNEKMK0nuqOFkO9B6Z3jwng70OjhxOMI5c/UA?=
 =?us-ascii?Q?iOcZUoC4Byd5ai/bdZ3yAX7JrzbrJ2F7UNeOl4WejTLrPlZkMrzv3lNXof/y?=
 =?us-ascii?Q?H/5THRkB7nS8bfvN5Luny1dNzMSJQgCi0ZGDhCU04nuw77MZiyabw5T+PrvB?=
 =?us-ascii?Q?zJ7PcN4Y8aAzM1XIjlRXXHSTUUHXM2rt39xZ8LzdyEPhF/tEPD9iRZ4WrqMn?=
 =?us-ascii?Q?UV/6EsKv+epiQRMS1DZ41yan6o42JvQLTghhDFSIfZmLiQ4qVQSsNRLLDFFU?=
 =?us-ascii?Q?XJGGk5SQOSqdrKBi3d7uOQhHBcoZi6vXsJJDcfX2/PHDsLMx2TBl+0P1HwHe?=
 =?us-ascii?Q?rQI6O7YpEyBhNPdFPWnK8lOwg5KCAIEIMEvttqvJdfp7F4EoQ30wiDywNrEu?=
 =?us-ascii?Q?iFZoXq2cuCU8fBC7wg5aKtO3nUXyoxSPRWIg6HyuV6WmFa7wLjUniQMnZzCN?=
 =?us-ascii?Q?JGFDKl5uaJutFLvQ9c0tTITNUu2ftRgIfKZTUyKAwWrLp2zW/P3eRvOeFfVW?=
 =?us-ascii?Q?xxHnWOprhtwWRBStPwmpmiy0sHhlC60cqN5TtLWinuHpjQ/PrcDkYoKBL3VD?=
 =?us-ascii?Q?PNcFXsYWXFUReeIjFGWaR8sesZUJJ+SkFdwVVqDmLTprFagTPdThL6WnUkja?=
 =?us-ascii?Q?wsUypuFj0nFjSbI4Jgvpr0h8M/bgZloKNBLmz3f0ubScMzg2f4IhNtLIcWDp?=
 =?us-ascii?Q?VOfv2Mwazd6jzdkEvOUZKIJGRPjVOaY9CFnryoCriqN3RJ4gKi8CDvsoz/cj?=
 =?us-ascii?Q?vhy2Xq6AIcQAGCirPJr+ubkYLePP8ytIQkT733kJZtTsyNYiM1Bl5pXRCmjK?=
 =?us-ascii?Q?YTu9jXWM3Lw5AYzlxBALSVWW97wqWdJhG83zNlbrft/XjaqE6r99mwGyIl/2?=
 =?us-ascii?Q?RAVFsi5DtC/bjun6+Fm60mMIxpKN2wLtMrFkyNd5Ld4J/sBzRI4dK5mnYZRC?=
 =?us-ascii?Q?2UA5YGfRrXze2aoM+GLZr4OWj3RWh8cyZJodcY15BWrFBhrL7D973SQK8U2J?=
 =?us-ascii?Q?PuxLIvVQh7ED624Yoby0OwTPVpT+XAdMU/CWMJEiYi7YiF45aBZi36DKjQnc?=
 =?us-ascii?Q?Aup7c6lOjCWfMH3eB0KkKgDV4DTlUHxkEX7hHDfG4yYDAYCxRgRhYOpQqPOI?=
 =?us-ascii?Q?7g3CS1aiDIkr5ISFsNY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:56:13.5471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e90be3e4-b9bf-4cbf-f18a-08de1768451d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573
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
v10:
 - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops
   (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  47 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 103 +++++++++---------
 2 files changed, 78 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e6da42e7fcb3..c3ddf136dbc8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1868,6 +1868,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
 	struct drm_device *dev = plane_state->plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1900,32 +1901,34 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index f89a887c6b14..f205f3c31f6a 100644
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

