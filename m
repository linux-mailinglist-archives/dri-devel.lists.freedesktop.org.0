Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD055ADC089
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2B10E741;
	Tue, 17 Jun 2025 04:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="urTruOjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046CB10E72D;
 Tue, 17 Jun 2025 04:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzvqWvfWHQikYW+DluC3yQ1HrI2BXnZ0SnA8I01jz3z+bLpskFONOOAdH6YTmrwyBxoebkXwRpzt/82ewP5PO85GWUQpTR61lXkyY8nJYdhYAJHNeUrntCh1B1V6w0xpbmhhWsDjAUNJhXpmpfJ7QrrFOinGta/+NB1Q3BZ8tFABhxsb0VP6pqYm8ooXlrHVXJJtWt94l6q8Iu2pnqmk8GMXBDh4rNs3ldE21QZLydC6EGXkczlh/MfR0NB1LVsm0qZAD53XFPrUBhCZJz8mPpTIJZTjHzXj9tK5+jBxV19Q1QSm3/Da8Jn+QqY0KrpdtsnXwMEyVoPNZm8wkiHF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQlhy583pqDI00iE1wfpJCws4T9W/tJcn3L7xiI6RC8=;
 b=Rh0yeyFFIEai8s5KZ3TgqG/MmxUO0BrUy4FuSVHNEOq/HLtinCPQONzBdAx+e7Uf3cTlsr3OWfvfpC2sJWMB77dZxZdXW1P1GkAUCGAHdP5M85rvCfV3tTaSLULHRQu09m3/E9tHsyXufGq1Oul9CxKbjy9djZcBJmlKSw01zpDQw3QabP8UOrnTxWHdSJl6BnY4v1DKz38U3ByzHyX4Ibsg3d2P/eI/ShXRnE6dyfFYUKPMF1euO9fhxp9DS7MyJfij3JhEZqB9SGyOQdB1xBAL4sytZOBeJI3TM6wzvT+P+Cu0JY8NMyzC79uvXOLV/G6agTVRv00DyT2j7CvI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQlhy583pqDI00iE1wfpJCws4T9W/tJcn3L7xiI6RC8=;
 b=urTruOjL38WOqF7F8nV4Ej09DCaQujKUj1iEb+2kC5OseaoyfhH6m9RgevcvLLZAkf/KHIoHiO3Hb19p4s/4m6t96RDoisU8KbgFYHztoy0pGeHJXrIvehF607QxLhUF8FlHLzsr7mIlquU8RtHY7aAR/8lfM5rXqe+SC/kgMUw=
Received: from ROAP284CA0298.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f0::8) by
 LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:28:00 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10d6:10:f0:cafe::1c) by ROAP284CA0298.outlook.office365.com
 (2603:10d6:10:f0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:27:59 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:27:55 -0500
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
Subject: [PATCH V10 41/46] drm/colorop: allow non-bypass colorops
Date: Mon, 16 Jun 2025 22:17:23 -0600
Message-ID: <20250617041746.2884343-42-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9320311e-5f54-44f0-21fa-08ddad575739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4d9EDQNKSJbFmurxcbIGMiUqOqVVxasjRgxUAGp53TN5nmIEikk2we5D1qv0?=
 =?us-ascii?Q?wBB2IBmlUWb3VzlpDQtW7D966AibaJQASS3fWJeXzyrs1NTePgJq98f3Yi7V?=
 =?us-ascii?Q?XGV0MoLe3/vDy355SVJ/yvn2Isu/vMhsIJMRIIbdn23VBIzFnry5jJLioHB6?=
 =?us-ascii?Q?eAHuzA9kMKbpG454W8tS10gpxlSJekaWtmRLK08CrjkAW11w7te/LVLFGQ1k?=
 =?us-ascii?Q?eTN1E3kGqtzhB6WkjLUDL5RUymAZRaZ8iVjz8rmm1cvU8pniimt5mf2T/2oC?=
 =?us-ascii?Q?EwDiHuyfh+2skC2Mgj9ax1J/HsdERs5AEWQMhuE7LlCQdSnVi/10zG2KdFfS?=
 =?us-ascii?Q?/jm7x66s/3bQHDK2NwKCrYaVa4/gRQ/Td1s6kd/c3QQb1zK0x2mA14YdC4Qz?=
 =?us-ascii?Q?8sTllivNn45WSU0om/OSezVcw1aKl0VUIbk4JT/gxBhtNfU9/RQATsh1zR62?=
 =?us-ascii?Q?W0An4FE6GJK34hTK0Tv7l4fFbQfo2RTtNuKTz2kgEnoYFhusd/X/XUGlvqbC?=
 =?us-ascii?Q?it7hDzpIfN/oRFyvrbObAfQbsHroXAmfzivukyO9ruXhTbLDiO1DQoF2BalH?=
 =?us-ascii?Q?/yKKSBZmI115bXIuBiux3n1BlYQt8/HAG7dl2o+Jyq1uGbN58aG3gVYfRGFA?=
 =?us-ascii?Q?fx+cv35/yDOqT7iFsB50nkNDxOZgDZueyWtAcff66n69C9gEF01VLYzmNXTr?=
 =?us-ascii?Q?0esPZz7QyBjiZCp7YombKaR9oDjFI0UNBuer4hr4X+KuPLjLYKAestLm7XEo?=
 =?us-ascii?Q?9ql82LxWJiOxR2NVPZxy2TJFt1vMlzne0KzXpiZC2qsQNsZwFpR9bh0yfM9Z?=
 =?us-ascii?Q?qEDN3FKlKVVYD13PsZ3XqT6RPRJKQB5I6XFr1fxLSU5iIYNQf+qx843F/0g+?=
 =?us-ascii?Q?S73gsD72UIB0ceEycfm1vPId3CCOHUjeDg0Ix///1m7Ojwj5SOYCwO17v37n?=
 =?us-ascii?Q?5dF6U8MYXT3V+mz+J68zHOfRBQVYP/gHMYIgy1ajeURixyOcEtXUGOCqcL7o?=
 =?us-ascii?Q?yraKA3ARKpK3HdObpmZXZT1OdbswM9jRNIKNc5fjh4S+XmIDv4atL+KDELYH?=
 =?us-ascii?Q?ZAlorkKT7d4IC8y31jzvjb+t3vdTtKyEhjS9h8iwpzUdBFilxMXZp6u0jcsa?=
 =?us-ascii?Q?c+P+VVq99qn26M/KJavjcxiiCehl5Jhydcwgf4KQT9WPWNlCV0yw4Jf8BStq?=
 =?us-ascii?Q?rvc202KU32p/nzzL40xClYTpuK3X9WRtZlIwR3mG1Xn4JRtMlcPXK9AIxbu8?=
 =?us-ascii?Q?/UkahgZ9vPsrbNzClZtVsGNiPNQCsuZ9W9wdFzmnOh8FzFN4QReF4vD/VwNT?=
 =?us-ascii?Q?MFdEn/g3eBi0hPca2tHsv0oiDVlq+49XSBU8qKnvI88EF47ApukO/PwWtsSJ?=
 =?us-ascii?Q?lfcUfa6Dr4gHrQV+kkcXAUycI1bYEnSbqScNk3qqwnKfLNwBEdZCW/1U7uXq?=
 =?us-ascii?Q?8f2HxK9BQp/mpdUETh9OWrUNG0zPV0nop6ljDrLL/7wujNqng+yGsL82edzU?=
 =?us-ascii?Q?mg31gz11m90AtLObB/i9A7Xi3sMs8EesG3/y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:27:59.3048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9320311e-5f54-44f0-21fa-08ddad575739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268
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
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Melissa Wen <mwen@igalia.com>
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
index 60a5bfdc2578..868d6bd0a5db 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -65,7 +65,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_degam_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -81,7 +83,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -96,7 +98,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -111,7 +113,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_shaper_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -127,7 +131,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -142,7 +147,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_blnd_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -158,7 +165,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
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
index 1617b2742551..19cb4ecd3033 100644
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

