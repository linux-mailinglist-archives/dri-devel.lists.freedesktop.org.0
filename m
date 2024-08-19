Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B9957648
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898A210E45E;
	Mon, 19 Aug 2024 20:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5N6m8iMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E210E404;
 Mon, 19 Aug 2024 20:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKt7Mu7L4Sslq1mj8myXQHndBZK68FB3GV3hu5gRNm/IPXvAvMtLUVE6Pgp1XpZCK3EolOI9YQkTpOXPfHehB8jetUHNSV9tds82QYrLVHKDVimmhs186/SIW6ZE/4Jo3FIrbK2B0ZJlDsP8Di9BIthoG2RiO62DA4+zNhUy4sIbAQCr8CeIpeBA3pM18YFn6TUeszMp94MpB52BN8lQkR0D7fhsOtR9cl4ptEXs4ZUuJpzDiWm9ZCKcoojf0OkEiy6/CryPS+TGfzTygcwsFjImI32KSb2+DQo88pi2E1qVNCzojo+uRhY1G+8wqvjpjMLfUGGKLtVd/miH4fqRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RI7HmQPAMpUTvEwrvi1GkdUwEjurrsm/FtDBPq01BoU=;
 b=II3Mvamd1rmDNG7MXyo7KZMqpM7DVOf1jlF/c4zRzG9FvdNvO6ELlTJlsJoIuLidlYiKWzWBPvVSP+zC56HcZXG2QGlsbLLYISfSSZWvaVFPdd8INwxxw4BN2ZCVpsniDrcYww74wNImVHeWKgqOUvqVwRLBKgEhIB5ybv7T/wIizt3ie8BmO/XvE3tvQOHu2BFqMzuJmuB+6fHBRirAf3oD7IKJ2NE0V/Z/NEosPzX4h3ib/f7G41IBf5VI8zHuwu22pUPLFnprOBAUaS234durJ7p18Sjqt6KY6hj/Fgi/3zDi0eLRP0qPaRvbiAT47DrV4lXvmPFKcHvPHOuD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI7HmQPAMpUTvEwrvi1GkdUwEjurrsm/FtDBPq01BoU=;
 b=5N6m8iMw0d2Raa+FOzR3t7o0HKLR8PFGJ/tFpgAkQjObKyBTgLIhoSdlUTYPGbMzNxRERhJ54rRpShd2jErOcl0var5rurNsore8rdWGZ3LvHZc4xtJB8bY7ot7AdA8DfcwRdTgI8fGn/hVhwJoXB9PkhHir86oYKyY5MjoYV5g=
Received: from BN9PR03CA0650.namprd03.prod.outlook.com (2603:10b6:408:13b::25)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:46 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::3c) by BN9PR03CA0650.outlook.office365.com
 (2603:10b6:408:13b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 41/44] drm/colorop: allow non-bypass colorops
Date: Mon, 19 Aug 2024 16:57:08 -0400
Message-ID: <20240819205714.316380-42-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a35e8a-6444-4f1e-6d83-08dcc09193b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5t2ssq7KcpeGTvnT6e5J5iYc8tBFudC+0xjd4CwGmK8dfVDy37oMUX96s4cy?=
 =?us-ascii?Q?596ankbhYSoweOh5MOU/ajRZQQ7m5L8Z3xR00tRGUbHPtNhHEcxfiApVVr5P?=
 =?us-ascii?Q?I8DaZLD+ufIbHQTfcoSZzmaBSO07XZc0b0v/ZJRqSya50cmTTO8pzDLocIFi?=
 =?us-ascii?Q?lbBLUurr1IBg2Si1kYX32gSZ6JHYX5tna+vOCiBSRMf9xVGwDd/Ha8Zel6eR?=
 =?us-ascii?Q?/ois08LcGzuAKWVd5qSX8LHfRvp7V1IfgNymGInt6bnF1qvGdh5tkqsdKca2?=
 =?us-ascii?Q?yry9Hz/Y2oPqSeKxPjnZiAsg/HhbfOJGxTqcFNrpCO2WbIYfl5QyLYBwpYBc?=
 =?us-ascii?Q?er01LpUHzZEq86Up51937z9oMUVnz21o35XOmVz+yd1IDkHY/V85fVGqmref?=
 =?us-ascii?Q?Ut/CVM+PAdz+ErRMBf4ycDXCnS16Ta9XghFFPbo8v2ljOxrxA7Z491S9Ldt2?=
 =?us-ascii?Q?QzNieCa9GO3NaEJ+G8Fy8QrJvaTtS/xCr0D835wru3kediO5KWH7lG9exRH2?=
 =?us-ascii?Q?82JS4N79tAkKF/FvbCUdITDbdPzIugwUegVsi2H2HKUg0OQur9USEUqaxB6K?=
 =?us-ascii?Q?6xb3/QV/DLTuiKBsnv6HSA2KibHsxqZz2RsYYCIlUXZpkmZ3im6rVFkKq/7i?=
 =?us-ascii?Q?mbOaTEFm8jO23zrsICVFdDQh/L60rxIvTrnOARhFs1/VYC8jvBBMIrhZI6Q5?=
 =?us-ascii?Q?0ZEh9NEMTJfL0J09Q4/vPhzv4aPD8ewQ/5/5PN86Cli3mJPQZWjVEO7LaPui?=
 =?us-ascii?Q?y9O7cQHKZvUQg33zp7nMTAjb2ba/bNZIfyRja5t270xhu4oaSyTJ5MGAoN8c?=
 =?us-ascii?Q?n4p0O3LIPAbrtX6Ly5jaMXPmAHGb7SGzEJYGPl4GLfvFI+Ao+SZWxvyzuth1?=
 =?us-ascii?Q?I43DVTDUFj4ApWoqZqup1wUEOURsKvUjVL5zoXUXMWSMQwCKKpzx5qGSNSEs?=
 =?us-ascii?Q?0T7CChgR0nBjoUe7PxceB3YUBLkcPkK0w2sFsqHvGbEyQTFiGYYoNCR6r2Mo?=
 =?us-ascii?Q?cMGKG878ROOGVoen00lkYf3NxWoRbaeLLMgrqXF9yrutcqAI8T6PwqfbCDaG?=
 =?us-ascii?Q?wp07/d+upauSoX7ATMkKfEMqSpeEQZWDQYmeHUjEsO+aQPqlX1X/XE6SV5QC?=
 =?us-ascii?Q?oSFPwwHIrPTYqSLjKW/yoIc6BGdt7Id+m3TL6//uhhVHUSRL6YdcrGe1LqQj?=
 =?us-ascii?Q?nSO2zAOCmbV2BzcvnRTTSbSguFZnk8af1t/hQ9I/FVbqGFBgTYn0Yz0vNqTE?=
 =?us-ascii?Q?JTwP/tdhl6dA5dqUT7C/YR5/rE2vGEhtwMHXBmWl8ix5EauXDB2dFCpT3LnS?=
 =?us-ascii?Q?S2c96vTPoo77PGL6Sh3dpyG9zIBJ3JXLsCELTolQgebfFLuLNiZ8oxkFDpzB?=
 =?us-ascii?Q?vI0kt495IYcQaEwA8OXk9lKYWsUxgSE7PnODXZnCLaSbxb2GUv/t5cv46hO7?=
 =?us-ascii?Q?X/oa1qi4cpW76//rjIm4iBlFLvaEV50/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:45.9918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a35e8a-6444-4f1e-6d83-08dcc09193b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982
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

Not all HW will be able to do bypass on all color
operations. Introduce an 'allow_bypass' boolean for
all colorop init functions and only create the BYPASS
property when it's true.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 51 ++++++++++++-------
 drivers/gpu/drm/vkms/vkms_colorop.c           |  8 +--
 include/drm/drm_colorop.h                     | 10 ++--
 5 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index c85e344eaccb..05fdec7c28ad 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -60,7 +60,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_degam_tfs);
+	ret = drm_colorop_curve_1d_init(dev, op, plane,
+					amdgpu_dm_supported_degam_tfs,
+					true);
 	if (ret)
 		return ret;
 
@@ -76,7 +78,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_mult_init(dev, op, plane);
+	ret = drm_colorop_mult_init(dev, op, plane, true);
 	if (ret)
 		return ret;
 
@@ -91,7 +93,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane, true);
 	if (ret)
 		return ret;
 
@@ -106,7 +108,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_shaper_tfs);
+	ret = drm_colorop_curve_1d_init(dev, op, plane,
+					amdgpu_dm_supported_shaper_tfs,
+					true);
 	if (ret)
 		return ret;
 
@@ -122,7 +126,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES,
-					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+					    true);
 	if (ret)
 		return ret;
 
@@ -137,7 +142,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_blnd_tfs);
+	ret = drm_colorop_curve_1d_init(dev, op, plane,
+					amdgpu_dm_supported_blnd_tfs,
+					true);
 	if (ret)
 		return ret;
 
@@ -153,7 +160,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES,
-					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+					    true);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index dbb8776ae433..02ff576aa7a9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -789,7 +789,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
-	drm_printf(p, "\tbypass=%u\n", state->bypass);
+	if (colorop->bypass_property)
+		drm_printf(p, "\tbypass=%u\n", state->bypass);
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_CURVE:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 47a9877099c3..2b7526c9608e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -84,7 +84,8 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type)
+			    struct drm_plane *plane, enum drm_colorop_type type,
+			    bool allow_bypass)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -120,16 +121,18 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->type_property,
 				   colorop->type);
 
-	/* bypass */
-	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
-					"BYPASS");
-	if (!prop)
-		return -ENOMEM;
+	if (allow_bypass) {
+		/* bypass */
+		prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+						"BYPASS");
+		if (!prop)
+			return -ENOMEM;
 
-	colorop->bypass_property = prop;
-	drm_object_attach_property(&colorop->base,
-				   colorop->bypass_property,
-				   1);
+		colorop->bypass_property = prop;
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,
+					1);
+	}
 
 	/* next */
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
@@ -153,10 +156,13 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
@@ -177,7 +183,8 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 		return -EINVAL;
 	}
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -237,16 +244,20 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
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
 
@@ -284,11 +295,12 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
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
 
@@ -308,15 +320,18 @@ EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
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
index adcb08153a09..0a87cb14b8e6 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -28,7 +28,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, op, plane, supported_tfs);
+	ret = drm_colorop_curve_1d_init(dev, op, plane, supported_tfs, true);
 	if (ret)
 		return ret;
 
@@ -44,7 +44,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane, true);
 	if (ret)
 		return ret;
 
@@ -59,7 +59,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane, true);
 	if (ret)
 		return ret;
 
@@ -74,7 +74,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, op, plane, supported_tfs);
+	ret = drm_colorop_curve_1d_init(dev, op, plane, supported_tfs, true);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1304b19c96b5..044294b498e4 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -319,14 +319,16 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
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
2.46.0

