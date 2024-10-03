Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF398F7C5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146F610E983;
	Thu,  3 Oct 2024 20:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WtlAvcN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02310E981;
 Thu,  3 Oct 2024 20:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oe+l9dXcSVYEHrZvNXSIG+tvgrRbu3rZcEC//8aW44AK+++LwL+Wqp5V3pTkcaUYOtqVoNSGRTGoqIy9LMnM0utWj8eXGuUr0q5oyfJHA4ChsgHEdhEdNejKPe9j9zp21vx6ardtf9gpxO/D9ckw871APpNCAbnNrvqwwFnpnWu+DDuHA/WjsvjJ6ZkJ+Bq923vS1h+vWeTqagg4WZqv2yWQAVPJy5hVN3rDjrJHCo9KGMACa923pZ+yzryMxJIbKq/Khf+4u5561q4Xp7/XJIh6B4y2c4tMNQOmZrrOGejDuk3wbRoW52HvWyhcssfdWCrfMkWd/3594bm7xG/BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW+eYB/q20ibVF7FuqCMOpFx+H8xWnOLKbtz4TnIkeg=;
 b=sYYlUBR5dfMn7R+cQFISqMSJjmbYGsJQ2vSN4rprcflLJR0oDHRERfa/rOvTDpsjpEi3HfvwGr7wQPEP/E2FSAxM+Vbjo+JLkwY+Q/RsOQLbjPx+1GmFI+puGppCctyZBejuPdEwsvf11PmKAkzrLwrAcwBAVMCe3ZZvtaYnTJIyRNU7FompCiwpcYVdknlZtsg02FeOOeQD4k6qR+R7mmcXXhpgfaa/kv8nRRFn8IKsTbJhBR7I/FfeBWJhMVIr+BPJEWM3sCYt3aEDpgxzgRYHeZcDse7OnZ3XOt4fqbOm0exkxg9OeaGjYT07Sm+zkK2qVM81/uBD+qRiBYv1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW+eYB/q20ibVF7FuqCMOpFx+H8xWnOLKbtz4TnIkeg=;
 b=WtlAvcN4/GmxdxSn2y4rNPM6p9Ujs9kJGV950SW4AcyB2i1IBz0jllZkVmDeEo9BgvEoRF8682q9c8UOySbh6DvntH8GJtp3nU8SMWfGHbAQpbmTUHKxDc4fmffJrctmHMn4nkYwl+bxZ2Fsb9Xq0g5w2iz9HUiU1K7LhZuAiCs=
Received: from CH2PR14CA0049.namprd14.prod.outlook.com (2603:10b6:610:56::29)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:59 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::27) by CH2PR14CA0049.outlook.office365.com
 (2603:10b6:610:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:57 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:56 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 40/44] drm/colorop: Define LUT_1D interpolation
Date: Thu, 3 Oct 2024 16:01:22 -0400
Message-ID: <20241003200129.1732122-41-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 742db6bb-3376-4d33-f390-08dce3e63d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3TXVcQiq10jaxr1XU77aLPLno5XjBmrTMFZGDlya7whfH/MPpF60cnwRFkV8?=
 =?us-ascii?Q?ECbt93yEC1PvnLEsWHJ4sPqGeas1l8JPSI8tZy0kQmLYBOZ+TJWrR/LkoCvQ?=
 =?us-ascii?Q?sI5L+AIPLIw6La9YiQyvvZ3dRzDsfQPvdAiVLOLSX9VwAD4OyjbXgqkK3krK?=
 =?us-ascii?Q?viWbhDEF+NR1xZYtROWJZnTtpAKExxsTzP4Cg+bzPdE3yxKs7rIKy978FLoT?=
 =?us-ascii?Q?fcaTx0UGAfbt1slWHtJSNt697FPS38YRliC+qnAceEQxfE4o2r1iuXB3YpLe?=
 =?us-ascii?Q?qJMwTGAXGdh9OkplRlPjmXOVMrhlIZwoTrXGqn7J1EqHgAhXHm9aabrDFgNx?=
 =?us-ascii?Q?e0HX1QjMwIhVN/nVi0FBKvGfXF7mKR13LShT6D3F384foqqPiUZnLqZI5KgF?=
 =?us-ascii?Q?5o+jBICFdO8mIaGfqsmbvlfd8krHmkJs7P/FdsjTJzwx5NGPtKwkiIT9T1sy?=
 =?us-ascii?Q?2cPCqw21zjPERCMDYZ4w64Wzo8HdAgHOdMx/5IS5yd9f2SSg14fGWBim8PEL?=
 =?us-ascii?Q?FsmXGUntj5j3KRZnFsKDdyBBKtECDCjLEYhUqCMvuKHlSr31/q7FEIWxFuwd?=
 =?us-ascii?Q?3DvxR+1VThKzcDWtm4iY9WNWhvFMTuL6iZRO+JxY4MLkIs78mMgGokDeNj3b?=
 =?us-ascii?Q?TCqPqa5LJ8hMc6G2ub4wGNA0vA690yodPTS8BLfBJK0mG8obsxDEdgb7Gszw?=
 =?us-ascii?Q?iE3CyLsFFet+H0Jm2UylgVh6ejkVbli4EX6tg3FlBlz0yvvjBfYDR0qLFHQj?=
 =?us-ascii?Q?aNPwTWb/voPompUuWJjweYHkCuN2FvnZ8AzMUyCI/g9VtWLIjtVXCHkXoo7w?=
 =?us-ascii?Q?8R5Uk++Wpq0Kw2T1odCPGu9DEpF9ORsJ7yM26oGDWmU9UI3msw721JbIGas/?=
 =?us-ascii?Q?V5kzi6FM//ny0auT5Lvsyvn0heMRAoNoahTX1NrK1/Nr0Q3YFNwF8lIbCKm4?=
 =?us-ascii?Q?LVOyQ/gAlu0JfGAF4Mlw49nBLnN+JEDFQwo3T4qLT2ZFaeRt8gl9hfTEwozy?=
 =?us-ascii?Q?2yMsqt31btqN048z0msB2vn8FAW7Y0IQLOhjEdHYbFb8bok8M2UntSIE6enc?=
 =?us-ascii?Q?1kg2UsmaLgr7IAvG+a89e5r1Q6Sg/7GE6gJYB467mAZf7mMo7P99TXXk0GCQ?=
 =?us-ascii?Q?iCo6Qwjw2WtJDpfVPVD4JN9vqrcW746b+7lX7mNzo4eRS1W9Umpkvy665KkD?=
 =?us-ascii?Q?ppTBIajdv2K5rkvLRRyIM17u7Z2V3y7TTbekKv4m6tzPSSmmZCOmZOtiYskK?=
 =?us-ascii?Q?SAlvltcNOF3RFwfmlDWpWGH6Tv3ruGJdyxXxFegpVui3mIUJfxuxPJG8ZwJn?=
 =?us-ascii?Q?o6ongV3NBBu+E0S7bUO3A3EkhMGtmvtbO5OSUi3tt/Js2+1gfA78Xw2ckbQ/?=
 =?us-ascii?Q?iZ5qFKvbl2JiplMsc9YoClwK4qFU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:58.7764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 742db6bb-3376-4d33-f390-08dce3e63d60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374
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

We want to make sure userspace is aware of the 1D LUT
interpolation. While linear interpolation is common it
might not be supported on all HW. Give driver implementers
a way to specify their interpolation.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++--
 drivers/gpu/drm/drm_atomic.c                  |  1 +
 drivers/gpu/drm/drm_colorop.c                 | 36 ++++++++++++++++++-
 include/drm/drm_colorop.h                     | 19 +++++++++-
 include/uapi/drm/drm_mode.h                   | 13 +++++++
 5 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index df82fb14f8ca..f0f7ef6b52a9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -131,7 +131,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
@@ -163,7 +164,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index acd8a2fc0270..e492a06c3a6b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -795,6 +795,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		break;
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", state->size);
+		drm_printf(p, "\tinterpolation=%s\n", drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 41f0ade76b57..3ad3e22d37c2 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -77,6 +77,9 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
 
 /* Init Helpers */
 
@@ -233,10 +236,12 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size)
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
 {
 	struct drm_property *prop;
 	int ret;
@@ -255,6 +260,17 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->size_property = prop;
 	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
 
+	/* Interpolation */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT1D_INTERPOLATION",
+					drm_colorop_lut1d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut1d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut1d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, lut1d_interpolation);
+	colorop->lut1d_interpolation = lut1d_interpolation;
+
 	/* data */
 	ret = drm_colorop_create_data_prop(dev, colorop);
 	if (ret)
@@ -410,6 +426,9 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 {
@@ -427,6 +446,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 	return colorop_curve_1d_type_names[type];
 }
 
+/**
+ * drm_get_colorop_lut1d_interpolation_name: return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lut1d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lut1d_interpolation_name[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index f78ef745887c..d3a00296973d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -252,6 +252,21 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
+	/**
+	 * @lut1d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_1D_LUT
+	 */
+	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
+
+	/**
+	 * @lut1d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_1D_LUT interpolation
+	 */
+	struct drm_property *lut1d_interpolation_property;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
@@ -320,7 +335,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size);
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -374,6 +390,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  * const pointer and hence is threadsafe.
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 96cb32e6980c..5ef87cb5b242 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -915,6 +915,19 @@ enum drm_colorop_type {
 	DRM_COLOROP_MULTIPLIER,
 };
 
+/**
+ * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
+ */
+enum drm_colorop_lut1d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
+	 *
+	 * Linear interpolation. Values between points of the LUT will be
+	 * linearly interpolated.
+	 */
+	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.46.2

