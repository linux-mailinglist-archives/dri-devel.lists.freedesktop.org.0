Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E86C5FB73
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253F310ED2C;
	Sat, 15 Nov 2025 00:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XT1eNmHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013006.outbound.protection.outlook.com
 [40.93.196.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B08D10ED1E;
 Sat, 15 Nov 2025 00:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMNV4I56iacnrmcCSv/WyZzejQNqF8imRag3vbjHZCC/IvKuzqmztryZiPrAyw5aU9/DQTo6bA6yEGJ940cOC2glk0nWeeKCHb5CCACn4UX6ZiabSd2CrnL9KXcalDZlMIiKp4l2DtirtLJK3xWCJ/E3SxJA4PKYQRdxcVbyJAlrnxl4/gfxb9cz8OVlDPXU8rQ9CmXILWwPlP4vMLhIuuDzvy85FlqnpmSnSIBRadZiMJOgn4PqkKsqoySNyw4fseqmtCKnVWDg5k2VywFVbbfzAzoDY27K78TRChet1PouZr9KlDzh33XSKTKq/B2AYfSdQe17nm2G5qKQ4Vu3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdvUcRZvSplcvYYNU8FbS4g9kRehVJySGLng/yQCi64=;
 b=BGFcTL+2oec0O1pCHJww1h4YXU6DtYoaTI5n2lu5aiYmkjzYvaer9jeoefxNrM9h7xNAuszcjP3pEcgOV0MpJXkkml7Co7pO0Ms2bBj4q89waKu0u3ropEEMPcXFwG8NiLh6uSMaZHKnRPaTJRFeuNV2RtBXngwaTFLRfuAeffdVBSfM+ite7BWgZnojYnob0AhYJhiGQPn6/Em6n3cRCg/oE6D0TnEOKhuHijgC1bXFE2KjqjtbFgwuHbX+OmP771SareOBahRsHNYC6Am+3bRp0y9DmpSV/a9QdkpZZOJnyOlJWmWDkibb5ifzBdESpKdHxzH4yA88vUn0sXAtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdvUcRZvSplcvYYNU8FbS4g9kRehVJySGLng/yQCi64=;
 b=XT1eNmHd3Mm/YSnZTdS9Pu9VYnt0qqJgJ4HBMbz2U4mPRo9dPYUIO3hesRkcVw89PMBKjGznpwQ8giBxh0e7lIBzPOQDYkLMf0Qh0/3hWQeGSDey/9SWHdk5DDtffCdsHyGN6qoBSwr39yLb2Lv4u82QPV8FzOcTjhdzLsxsUDY=
Received: from CH2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:610:50::13)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:14:17 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::e8) by CH2PR16CA0003.outlook.office365.com
 (2603:10b6:610:50::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:14:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:14:13 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 44/51] drm/colorop: allow non-bypass colorops
Date: Fri, 14 Nov 2025 17:02:09 -0700
Message-ID: <20251115000237.3561250-45-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 99683811-6ee5-4d15-28dd-08de23dbeab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1OiMTnywiYzJmCfNxcJDNCDPVeZAy/0uE/kHWlIg4Oe6FQwFjFzcL+f26F/d?=
 =?us-ascii?Q?tD8Xtgn8C9rrXtoAelsAxE8bU5cGu5gfdyImf/Vo12q5uzFDQei3XE7TjS6l?=
 =?us-ascii?Q?ZJpTFXIcX+tPf72h6REihiQOemP30mpBPkY0Zyq/Y75Qfav+h8Bq19xJ2GkM?=
 =?us-ascii?Q?j1gpH601ZexBpMeRS4wQAJgvqO8esCNDMhJIdeWBLzk+R286sazaj1S9Ek+u?=
 =?us-ascii?Q?xQ1/Sb7GI6vDRcZRxOb18Jy8hk3jUNmbgsLAeqnAXk1IkcLxalHHZGLA8372?=
 =?us-ascii?Q?dgKg7JqBfS/4OkoYjCuaaqkCg0hfw7pnkGpxEN9CVw38pVwv8pZtMb5IPUkT?=
 =?us-ascii?Q?9SGkzS4PfBfQOaz6vZ9kYK2/hwul3IjpQViXZftRfglEwXyl/hEbNY3JuQ0k?=
 =?us-ascii?Q?SjUzvEZRwWKjwSF4agvFYAx5ryP4lhS9I+fyYe+X59r0FQ4ZZQbTNHlklMrw?=
 =?us-ascii?Q?yj3BaRtatFbdBcAfoeUoZaODz8pSmIA9U11z/z497+f1hNhNJ7azN4ajnSKp?=
 =?us-ascii?Q?boKlr634KveXdSrfSpU5z5ZyJo14vx733WW3P5Jy+2croLNHIIequidUmg0y?=
 =?us-ascii?Q?mz1dk9w7bS3jVCk5VpkSBgy8AcxvNCvdE+Dby1Cpp7uPPloErypX3+v1Ks8z?=
 =?us-ascii?Q?ekySUHsepgscQGzUWGod2R2my/g2GEXsGKyP365XMRFE8N+4K7nsihgkViHb?=
 =?us-ascii?Q?f+wmalZ7rIobjcA1QRnGcSeGvwryhDX5avwVfNKXXcusRyufFLUoMUC04+Ym?=
 =?us-ascii?Q?TtnHC0aZB+wVtMH6DTLD5w37lpqI+vEsq6J6l7btvZl0zzY6pkelNkC0r1uI?=
 =?us-ascii?Q?OitKLeq7sRx980hv4ui2PWZHYUotngcJVGQ2EjYbqmtKNnazW6ADQLcsApfx?=
 =?us-ascii?Q?7E1gbS1nQs2YphM+qJLRFfRMSqD4IRlfvWlMozj18kGF++BurlCEVyTSrcyx?=
 =?us-ascii?Q?VyL6tPDSBJa/VLGoV+J5V7891PaO8bOWYzDinUKOELRAdOt3Yh2+OkHI4toK?=
 =?us-ascii?Q?PFdZFP4GTxe4Mz52M/ps6rfsLfKtGw86JTYtNVjVccI+PwUj//aVIMhhdnTX?=
 =?us-ascii?Q?BQ302yYA0EvfjIJVhXYBgGg1IRDkHX/QnGQyZGZrsk3paRBGMuWzxshF0U0G?=
 =?us-ascii?Q?epBb0Llxpv2rpPZPDKr9r/WfW0e9hSLPvOv4IeIN44SJ+HofYCvo++Br5y7y?=
 =?us-ascii?Q?SJtrGue990Rus6Ttl6IVu4/RuNLeEAcMeTDXkJsMt7v5zYEVfgLzdrOhgh11?=
 =?us-ascii?Q?9NMZEh8qG7fBQNRElZ0LtQSCOCNYLURtatKzp7lbKSSVvlj/j6rf8fcngMvb?=
 =?us-ascii?Q?2JC7BYobmsFxdtjcKKGdOM7oPvlvsM7hPH3IHVIJEVdyfktFetcjOtPfyg6m?=
 =?us-ascii?Q?xSI0Hz09/ruZdJEMWJfMw8wh8wfkD09qPtPdMIrn1KGFMHoSMRkU460Z9TII?=
 =?us-ascii?Q?JI2FpvQ0ea4UWCaFpLTRc12WTfDw8zy25cPczWYp1dJt/wStAa5BoetscrAw?=
 =?us-ascii?Q?WxwnVV02s1XgvxzrneOWts/8pxAReQxzVE/8p3lfJBaosQCgmlo8FciBWwGZ?=
 =?us-ascii?Q?SvMwkE+kvWFDjepcGWM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:14:17.4677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99683811-6ee5-4d15-28dd-08de23dbeab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v12:
 - Update comments for bypass_property based on V9's changes

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)
 - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 44 +++++++++++--------
 drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++--
 include/drm/drm_colorop.h                     | 22 ++++++----
 5 files changed, 61 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 8e05f7fd3748..deacc18b8926 100644
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
index ed69c7e76d08..831e0cc1fd15 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -790,7 +790,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
-	drm_printf(p, "\tbypass=%u\n", state->bypass);
+	if (colorop->bypass_property)
+		drm_printf(p, "\tbypass=%u\n", state->bypass);
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_CURVE:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 8ca705e7b22b..425af6e16cc0 100644
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
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
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
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
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
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
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
index 7aceb0813b2d..5c3ffc78aea0 100644
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
index 469db22d73f9..e7587936d2e0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,8 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+/* DRM colorop flags */
+#define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
 
 /**
  * enum drm_colorop_curve_1d_type - type of 1D curve
@@ -258,11 +260,12 @@ struct drm_colorop {
 	 * @bypass_property:
 	 *
 	 * Boolean property to control enablement of the color
-	 * operation. Setting bypass to "true" shall always be supported
-	 * in order to allow compositors to quickly fall back to
-	 * alternate methods of color processing. This is important
-	 * since setting color operations can fail due to unique
-	 * HW constraints.
+	 * operation. Only present if DRM_COLOROP_FLAG_ALLOW_BYPASS
+	 * flag is set. When present, setting bypass to "true" shall
+	 * always be supported to allow compositors to quickly fall
+	 * back to alternate methods of color processing. This is
+	 * important since setting color operations can fail due to
+	 * unique HW constraints.
 	 */
 	struct drm_property *bypass_property;
 
@@ -355,14 +358,15 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);
 void drm_colorop_cleanup(struct drm_colorop *colorop);
 
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

