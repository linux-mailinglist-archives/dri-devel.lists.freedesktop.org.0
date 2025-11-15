Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E80C5FB6E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3810ECBF;
	Sat, 15 Nov 2025 00:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P3oRDGXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B0A10ECBF;
 Sat, 15 Nov 2025 00:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXVw6qk0GrdgEO/hoLBJeMur9DtAF4qaxZ4syGml9VFTf1KHQjzIC/Cx7cifshW/pAvDSQchGCuPvS7DIbplj2TkkGph/a68mLDVhF5ZXGm4WPovD4oUecEtZt55QaiG2GTEI8dh8e0YTDS12uv//EDIniIYnJpWVfjcKi8sBei3s1iBXOl0V1Cvqhby6NQNtb0IxpxlS1cOn5S4VsEgrR9DiNHe2mwrGQJI5vThEkgj6uSnW/ml69z/DT7reAVng0yLmnDoiULdFzH4NG0HEq3KFJHZOYKxBTutN/OgUT5n8iDGFBC4D5qmAMjjB3+gXTGXMsC+hiI06GOxLutCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ31I4UF766M/IR/VkQb4rxh53IguuWP9lao+bMm0qk=;
 b=Du5Hmq058YORuCLrHo3k/DYhM3S/eRFb62Ux77ZMOux5KFIyH0bHfYJy/myg5lc9NYZ1mkwcpXwGrC5FDdsymFe9Fa3WftvZHq02Rb6qZcNQ+9G3rjdmC6wV4S7JG1TvcC6z0nJCmhGNKKQZ7nRB4sQOtr1MEj/r6U3zwxtGJWkyYXRtxlourSXfLsdajOQhWn0LxdkJEmjFl4plNTqWFOyBUpUpK5q1HsqSwRCmyMKL9dVa4+eeMgMvbVwYDrC/brLHjnIWIqfAZplnPEKEQLJcsXVmRmHnL2XF4hsq/g2ytFHsTSZhN6eXHgimvcJRVedI7Yy+AQ0aFIfcm1aeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ31I4UF766M/IR/VkQb4rxh53IguuWP9lao+bMm0qk=;
 b=P3oRDGXQkfSdDylsWQK/eNMJjeJ7BKvT1v84mX2HTHZqoIVQaLSVwiYS5qJzwohvp3cTfKAyIpZNsxOsMnsfp9s1MHGhyDNwVWztkXDRpuRnuYUMpQjAA5RD+JcPcQ3mC9Xzm3kqYzpum4rVG+1C006o5eU1zuh65UJYUuOMwXQ=
Received: from CH5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:1f4::9)
 by BN3PR12MB9572.namprd12.prod.outlook.com (2603:10b6:408:2ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:14:06 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::2c) by CH5PR04CA0024.outlook.office365.com
 (2603:10b6:610:1f4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:14:05 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:13:59 -0800
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
Subject: [PATCH V13 43/51] drm/colorop: Define LUT_1D interpolation
Date: Fri, 14 Nov 2025 17:02:08 -0700
Message-ID: <20251115000237.3561250-44-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|BN3PR12MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4be6c1-dedc-4937-bbb0-08de23dbe382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sLLxG7AcuGOJk1quh3Ig+uSQCJgsffz3e58ExxC2LY/rW2nmUgUaYiiVQnGk?=
 =?us-ascii?Q?yV9yJ7g314AUZWzplqgsUV6VZYUh9tYa7uDd4MbT9Qqh/mmJBy8jqk5NxRHP?=
 =?us-ascii?Q?kEr2hw+jStWN9hSXfx8zqmP39CTC6+Kr3FYbnXrWh/09nJ+DOgsdM3wFtIwD?=
 =?us-ascii?Q?8QVKndknI+gPVY3bSmpIrcBUWjnvZyyukxaQh+B7ho5+1LTsv/Ymq6ehxmhZ?=
 =?us-ascii?Q?eeuiuW1gIXagrmq0Tgz7p75zgeyVUn9RMhFWGBOQ58Ov0Bj8oTt2eKKhEd/g?=
 =?us-ascii?Q?/DWUOEmfGSb4YA9OJK2j/GIk6Z45cez/DoLrob7fTpKIx/CGuVvjTDDf0aY+?=
 =?us-ascii?Q?5RTOxtUsaME4b052k3PlK4KugVST1S3+KKYxDGQfhV2iaD1MAuf+1xh/4x+i?=
 =?us-ascii?Q?/1i/U917TnvU/B5+VukigrOyl7uATDj/OkYI0hIdjuPj7I0hFaQPb2mG3CQ2?=
 =?us-ascii?Q?zupbGGjigaMVtWjzZ5zyp5gRIVd/0Gn+mgVh6/MmgK0/POLKGiG5BpeW+bHM?=
 =?us-ascii?Q?5cU8gFPNMxEMVjxPLERVbhxjaMd8gfo1pqehG6u9em4+sXWLol7RbBbIYg7Q?=
 =?us-ascii?Q?LsKytzrx3I1Ujwzi/8NTAOmVN0Lxakpqz/7zJv8SKDVbH0mYMKQfRZbVVLiI?=
 =?us-ascii?Q?4B+HtBuhhgs1JjgA95vO88kpNITWqdgtLJaaLtS64CvUKgkCleHzTXsxWLAi?=
 =?us-ascii?Q?JBFkmvZmXwGzCKHkvFBtjnYF9VO9RjDPM7iC7x78UPVnn9FqGTLcesAsujST?=
 =?us-ascii?Q?g9cGfeTKDXyMBzb820pwo03w9CCuBglt57d9ha7Nsd0YowQzPdXG1q4Evwha?=
 =?us-ascii?Q?kixMYavwvnJBIZMIXhVP+egKoy4MjauNb1cBaWY7hHSKFHj3O9er10AmEqYf?=
 =?us-ascii?Q?J6wZKspv3FYNNbaZkz5/qIIXhjSgyg2HY54EeaLag2AivVPd68mq8ODwGs8Q?=
 =?us-ascii?Q?OyZHI2zUkmydQaHymEVb1x5zsGYlIPRt/4XMjrK18ydr9Dj3nfmE7iDtArtz?=
 =?us-ascii?Q?kbUiCCSX/sVGrsPa92+UWAbfuSq++fwpaNXNHfUs9i7U7vq0xXRmCu5Dll6n?=
 =?us-ascii?Q?M9vb+KEk+IAluO+VW6mjDegQZsAdNFuM9dvrbS2eYN+sF22YIqOcUJfxzqns?=
 =?us-ascii?Q?p19w6YBuKC48Nvqw0ZDGUzg7lp41aZi9MD9n9rAkGUzubxqljnP2DI5I1cgt?=
 =?us-ascii?Q?9GJf56LeXtn8+U2+X3gh/3nZbBrfw5lNB3b1Z1NYrGhXmTsdWgWY0YDUptpY?=
 =?us-ascii?Q?8kM0QrlOWwFBWMg9X4MuK/izT8R/9UDLqRE/E47QdsGUgQ+BzzxV7voMxm6h?=
 =?us-ascii?Q?IktVfVV4BlVs6HImLhheqD3+5fcSYgawFTRJ1b0vQrx5hF6ICoBpHiF+wArj?=
 =?us-ascii?Q?VMa3nlM1LaJGyzOkk1H38rsEplzUmRrBvnXsGaCBMRFAtTJ7dZB3zKp2PoFT?=
 =?us-ascii?Q?7atFtKbltyMmQ2n/TZgGMBUyquLn/aEONfTht03WnacKvG8b3Rn50qMIsdrq?=
 =?us-ascii?Q?F52oPmD05vuNVBVNBYXlSjBYF3GBJ0W9X9YhZMDtqdcLibKtTsK/xMEwEAyL?=
 =?us-ascii?Q?LXWJ+xrXDVTgOjBSXAI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:14:05.4199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4be6c1-dedc-4937-bbb0-08de23dbe382
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9572
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

We want to make sure userspace is aware of the 1D LUT
interpolation. While linear interpolation is common it
might not be supported on all HW. Give driver implementers
a way to specify their interpolation.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v10
 - 1D LUT is no longer immutable (Xaver Hugl)
 - Add setting 1D LUT's property in drm_atomic_colorop_set_property

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Fix a checkpatch long-line warning
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++--
 drivers/gpu/drm/drm_atomic.c                  |  2 ++
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 +++
 drivers/gpu/drm/drm_colorop.c                 | 36 ++++++++++++++++++-
 include/drm/drm_colorop.h                     | 19 +++++++++-
 include/uapi/drm/drm_mode.h                   | 13 +++++++
 6 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 934cbfca0168..8e05f7fd3748 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -126,7 +126,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
@@ -156,7 +157,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 17c553ae9e61..ed69c7e76d08 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -799,6 +799,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		break;
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", colorop->size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b559552d267c..4a354a043593 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -726,6 +726,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->bypass_property) {
 		state->bypass = val;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		colorop->lut1d_interpolation = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
@@ -753,6 +755,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->type;
 	} else if (property == colorop->bypass_property) {
 		*val = state->bypass;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		*val = colorop->lut1d_interpolation;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else if (property == colorop->multiplier_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 5bdeed99c9b5..8ca705e7b22b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -78,6 +78,9 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 };
 
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
 
 /* Init Helpers */
 
@@ -275,10 +278,12 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size)
+					struct drm_plane *plane, uint32_t lut_size,
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
 {
 	struct drm_property *prop;
 	int ret;
@@ -298,6 +303,17 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
 	colorop->size = lut_size;
 
+	/* interpolation */
+	prop = drm_property_create_enum(dev, 0, "LUT1D_INTERPOLATION",
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
@@ -452,6 +468,9 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 {
@@ -469,6 +488,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
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
index f846f807d7c4..469db22d73f9 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -273,6 +273,21 @@ struct drm_colorop {
 	 */
 	uint32_t size;
 
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
@@ -342,7 +357,8 @@ void drm_colorop_cleanup(struct drm_colorop *colorop);
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size);
+					struct drm_plane *plane, uint32_t lut_size,
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -396,6 +412,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  * const pointer and hence is threadsafe.
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cac25c0ca37b..4b38da880fc7 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -944,6 +944,19 @@ enum drm_colorop_type {
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
2.43.0

