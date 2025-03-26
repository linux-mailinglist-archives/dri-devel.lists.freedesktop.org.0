Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB3A72797
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24D10E821;
	Wed, 26 Mar 2025 23:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YQ6Ly0Ob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EEA10E81F;
 Wed, 26 Mar 2025 23:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtXRNDGMRwhaQEFfhpJCA6zuEJxpLQwFrYQCddz+NwFo0fUrjmE9AVdSHyUPm2h92okT0Jm4MKzFZbnea/hzKRGYQohrMK/2e6RjWb4UcanbtrseZRFjv/E5q8TaPrnie9RzucRAKAfRtivxzh6Mlrm/HdyzGqTmB+St+qILwMakrIbYcCXrOOSwCTT7vDScKwHKfrJ/WoCBPVpsOqQwfQpDiXNT/ZRJCQVLDD39xT+1UlC03OZ7WW2OmU17ZsZGKAmAVnZmmoHnjXYDxUpW/yC6L7b6zdJ4340P8W2b3H9dC5C3DGavtPoOCS+VeGXkrDTrLqZ7Ljd6/M26K3t2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PHB9kGNq9CKT+OdgpL1sH4ywNJiV/Lp2Fqq0mQ7kH4=;
 b=aBEPx+c6AtN85P5VEt02f0ZnqQ4ydn/VjrFixt8jopr6C1Zu68sFiRVjmDXjTpa+4x078pqO/jNWkYSwDbiXESDq7q9xsLBL1FmO9cvGFGk+mANJ9iRd28YGe1Hpn+4aQ/JmYjTnXWciJjKJoJ0fKb7HUJy0GZmG+AhKW8UjJb9rWV3EsbRytdplwBe13HEFVGvHjq+4tCORR3KecgZp1ISB4EkgReYFHXcGvjn9prIS0y4eNFbHk1M9JdJzGX9yqEe3Eo5BrW76QMuebUYlMmDykt2VNDhM/5AAe+MOeWKEGsOprP3fOi+O+bpb6NUe265ZCe+izgzT3rF9UAyatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PHB9kGNq9CKT+OdgpL1sH4ywNJiV/Lp2Fqq0mQ7kH4=;
 b=YQ6Ly0ObKVD7WGdziHCBCOD4YgFuFbRLtpXlK2BnIqZ9OWOopOdIA+DMBprX/jOLogRbUaYYxawwTJV/I7MyWxuRZt9WCYcOCSE4rU8ae8PXCuIfj09yZEDwvK4ZHcETQIT4fpfl1eONCvjs1sTY4gY0TxPO0QmALPvB7xIcwmM=
Received: from BYAPR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:c0::41)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:57:49 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::f6) by BYAPR05CA0028.outlook.office365.com
 (2603:10b6:a03:c0::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.37 via Frontend Transport; Wed,
 26 Mar 2025 23:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:57:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:57:44 -0500
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
Subject: [PATCH V8 39/43] drm/colorop: allow non-bypass colorops
Date: Wed, 26 Mar 2025 17:47:20 -0600
Message-ID: <20250326234748.2982010-40-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 4611c56e-1acc-42c3-cd31-08dd6cc202f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kwL8B5lHJl6sZZ3rPf2Q8RYdjQn83gVzxcBjc5LWRwtzcxbWyRRJj1ZN2DV8?=
 =?us-ascii?Q?0VbxXVgXi1lLy543VLJcKKnNgVQl0mG8yB3PF/J7AGxI+J5KQn/2K7bc8RAh?=
 =?us-ascii?Q?4Z4PjDgh5MO+KNtdFpQdPdRbhMjb5pEANF2zEsQYiPegjWK/LxyjgTJbEjxP?=
 =?us-ascii?Q?j9QShDkazToY5v3NApDtZipgMJzzyc23ngOHZmYqlKqySAI7bPLBRq6F4Bo2?=
 =?us-ascii?Q?SZqJN+rw7+Bm2y/+vo2ev79YjSvkAgiVMkWCuXKypelOTNt15FW6iZR0hHN3?=
 =?us-ascii?Q?FJvnD7BQidGU3/i47errMMHZruTUewOgYhB+yl5ytx0K/2Q3AfsLRfNA6SQu?=
 =?us-ascii?Q?McElgL/4FezNr9othdZK7UEyyfuPOpeX6voETPqZBwhL/E2MKLu0FEIxUAmx?=
 =?us-ascii?Q?CuKPJIXNKRqCHUbg5qJ01cyjxw2iWT4Sp28WMZMoS95w9hbEE3qrAYNfAHBj?=
 =?us-ascii?Q?72jx5L5Ls8wXvFVce3PtdwizWJNvMgdBR1Q1F5n4ejPb4E4/4LxeB3m8yLdA?=
 =?us-ascii?Q?uk0BatXTtxu74l6UQV+Glmt/LFIaV1AF3kzQUetoJ86Qks0/H5fMVVWAZl/U?=
 =?us-ascii?Q?aR/PxXFVr3uC1FREAQ3nFBIvpO7gwSIo8O3OPorQBRxiUDMirvNeO5IdrqMB?=
 =?us-ascii?Q?gfO/lZQvDcLivNt41mOHKB2W/O3UMe21oVSwAyQHuTWVYqphmIPBQ8RJk1zY?=
 =?us-ascii?Q?Cnjl/C8z6DcWdjmJXT5IS/VgOKdpVt+fpBzu4XNntuH/cwaVbY0RvtuyvJB+?=
 =?us-ascii?Q?z1/wzxzO2r7rvwvi7FB6xNo5hJbG3rYDkc0CsU8x36fDViouNIE/DLq/ZobP?=
 =?us-ascii?Q?10lKWsVARqgpGrQcCwT6R/VcltOCOQiRhrOukR7KWr3F9+nGuVM3dF45uCS3?=
 =?us-ascii?Q?eq2cpZ4qNZFDn/vczvbMAlIbkC88zbnS64NnEh36/gabIQSErl748AzgvQph?=
 =?us-ascii?Q?QY8cKMSYwl0Q8k8ylmQV6la6mnI32xYqY2N7SvkxHRCpw+e7iSxZABmsJCV/?=
 =?us-ascii?Q?hQ0BvuxUG2fY96E0HUd4R26TkgxJWzJ4vmpPGHRs2FDkdpMGHC3RlCXgZBDT?=
 =?us-ascii?Q?mFFt5dfb2CKs2p68dYbAsVDaqW2grg60HzAwFrLhPX1UFHlz7rDBR9OmxrzA?=
 =?us-ascii?Q?D8WgkRoogXEe4jzROr5GwDox1SNTR9QwiddfpHCYAcZfxXACFC8DaaLMlH6A?=
 =?us-ascii?Q?td2g9JMpn++wKdjqRKvGz39yHJPWDT9HnskrIbrC3wLPeNb+FITxSCijEpiq?=
 =?us-ascii?Q?H2jDpBTdmsP4tfItj6VzaaHfOdyk1nAkxmcYXLIpC0PhV41Ct5b4ozszI3eK?=
 =?us-ascii?Q?yZCy042h1genOsbaz+z/CFuTtjf37rjer95NkU5sVZEb1TMQ1bB9ho8TZQVl?=
 =?us-ascii?Q?43b/K5lG4mt4pUjV/cCAnsqpO8DFRBUSXa0gQgVnxnq5ykFbECUzSyEOsWxm?=
 =?us-ascii?Q?96DIEyCQqo704f1PSdiRvnxYZCP8BUqOJ4GR8pMcjpqRzOM4rsixnNjlyET8?=
 =?us-ascii?Q?Kp5abhoiL8Xos3UOgQ78Na/Spb41Ul9CrUbv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:57:48.4150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4611c56e-1acc-42c3-cd31-08dd6cc202f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402
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
operations. Introduce an 'allow_bypass' boolean for
all colorop init functions and only create the BYPASS
property when it's true.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 53 ++++++++++++-------
 drivers/gpu/drm/vkms/vkms_colorop.c           |  8 +--
 include/drm/drm_colorop.h                     | 10 ++--
 5 files changed, 61 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 92c9f3fb0254..ec94ff887886 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -66,7 +66,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane,
+					amdgpu_dm_supported_degam_tfs,
+					true);
 	if (ret)
 		goto cleanup;
 
@@ -83,7 +85,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_colorop_mult_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -99,7 +101,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -115,7 +117,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane,
+					amdgpu_dm_supported_shaper_tfs,
+					true);
 	if (ret)
 		goto cleanup;
 
@@ -132,7 +136,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+					    true);
 	if (ret)
 		goto cleanup;
 
@@ -148,7 +153,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane,
+					amdgpu_dm_supported_blnd_tfs,
+					true);
 	if (ret)
 		goto cleanup;
 
@@ -165,7 +172,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+					    true);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9420fb9b8a46..0efb0ead204a 100644
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
index 7360ca4d2325..e03706e7179b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -85,7 +85,8 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type)
+			    struct drm_plane *plane, enum drm_colorop_type type,
+			    bool allow_bypass)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -121,16 +122,18 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
+	if (allow_bypass) {
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
@@ -154,10 +157,13 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
  * @supported_tfs: A bitfield of supported drm_colorop_curve_1d_init enum values,
  *                 created using BIT(curve_type) and combined with the OR '|'
  *                 operator.
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane, u64 supported_tfs)
+			      struct drm_plane *plane, u64 supported_tfs,
+			      bool allow_bypass)
 {
 	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
 	int i, len;
@@ -178,7 +184,8 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 		return -EINVAL;
 	}
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -238,16 +245,20 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
  * @lut1d_interpolation: 1D LUT interpolation type
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 				  struct drm_plane *plane, uint32_t lut_size,
-				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				  bool allow_bypass)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -285,11 +296,12 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
 
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-			     struct drm_plane *plane)
+			     struct drm_plane *plane, bool allow_bypass)
 {
 	int ret;
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -309,15 +321,18 @@ EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
  * @return zero on success, -E value on failure
  */
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane)
+			      struct drm_plane *plane, bool allow_bypass)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 0fbb9262bfc5..a2f548a4b84d 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
 	if (ret)
 		goto cleanup;
 
@@ -48,7 +48,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -64,7 +64,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -80,7 +80,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
 	if (ret)
 		goto cleanup;
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 86694d45d1d1..c89d5eb44856 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -352,14 +352,16 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 }
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane, u64 supported_tfs);
+			      struct drm_plane *plane, u64 supported_tfs,
+			      bool allow_bypass);
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 				  struct drm_plane *plane, uint32_t lut_size,
-				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				  bool allow_bypass);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-			     struct drm_plane *plane);
+			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane);
+			      struct drm_plane *plane, bool allow_bypass);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
-- 
2.43.0

