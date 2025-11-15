Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17655C5FB07
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291E10EC73;
	Sat, 15 Nov 2025 00:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Jr8mplx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221A410EC5F;
 Sat, 15 Nov 2025 00:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+qCYZR8sor4ncgzGBFqdv7gv21rp1u62YsNj+RiwKthj3NYGSOsOXIbXNXhloFKvcr2XmxNLbP7rlcKM0CadZFxrSJGvrms80cBQBqeaap5pb6DLcBm555wuFQO9oHpdAKY5ovaYWzzz2EH8ICbK3Kw21TvoBZ+bX9zAxQbNpVC/P9eA/FEt3EmpodkCkUr712DNV4tp0K6mWXqmtVGzxyFhL7V70iVY3UeP0s10ttlkgO0VxEd2M8hKqOXnwFYxL10cOoEa9DgoQlF+LUzE+KqSrLwMQmh1Pu0dBg0l7608bZFLrq1miNWDB67GMqypniqlgfx9cniVL7PvUlrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSpOGDkLghQfiqTEEh3h3cRd5n/ZtDx/E2FbYOLlpAw=;
 b=Y3+OKGqj7j63XQr3zt1l/UGIg4rqlCZEvF+WiFbvePrSLL5AwU+L6a+nEjJRCDYqPgwGd9XvQXPZPZu0BGSHD1nYDy+GqbMe/52YeKVte2u/aBcNlWjex7dBwP+98Htvama5E3P7u3Y/6U6XnsfxUydBtewjAIdAqcOaaL7w1jGk7h97OWldFNFeKmnjuoxk8UA2jTkq6vKyAHUFAQjr9/vCVdjtyNVFQ4dnhm9rec5Nmb3LXCCqUlZ0ZBWzyk24w0Y7b+wPS4boDZnW7JRVuYIFB0FZI2nJ4JuxPTDAgVXGrDDz6My/FQUaDYoCT9ZEG+0bdhXgD4UNPEKX8084qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSpOGDkLghQfiqTEEh3h3cRd5n/ZtDx/E2FbYOLlpAw=;
 b=5Jr8mplxVFq9o61VFWi6HwJXkgfwi3JZwofOyd/zS6VEqsbNFZ/7rWkxNfWt1SkqrZ+KA1CxqaRxuDh7ypJjedG1PzmKaQ4ZW3lZPT3BdDGbszpsM74CVrEdYUCGqzjuer8gCISdY2FsEFI+hG8GcRdyAe0MoYwq+cNLHt2Nz6g=
Received: from PH8PR07CA0011.namprd07.prod.outlook.com (2603:10b6:510:2cd::19)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:10:28 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::90) by PH8PR07CA0011.outlook.office365.com
 (2603:10b6:510:2cd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:10:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:10:24 -0800
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
Subject: [PATCH V13 28/51] drm/amd/display: Add support for sRGB EOTF in DEGAM
 block
Date: Fri, 14 Nov 2025 17:01:53 -0700
Message-ID: <20251115000237.3561250-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c84834-4621-4e8d-a2e9-08de23db622b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tpkPGBL/BmjxhPOoyJTUL0Kt7UW1JfxRl0l+bl898xBJAQMXofVO8dkCsEqh?=
 =?us-ascii?Q?kIdOefFTIl2ouwpq3jTIuht5Pt1XdV7XcE7GxHyg73NTuiAC64097zY8rBmJ?=
 =?us-ascii?Q?B3O3cdECkYDWD/wyS50GbjaXU57TRb8hhYYFyjLe8iiRhJNMtbFT2QvOi3/K?=
 =?us-ascii?Q?b3hmfB6j2LN6hO0DPXQlTfPOn3nFQrvtxbSTe5R2rBf/pXjG4YhOMBTjBLOz?=
 =?us-ascii?Q?63JmuBEl04YHYiVJk88PghWimUPDlJaHz8lCK1k8tcorj1tHa2vD0Lp72vbS?=
 =?us-ascii?Q?jlRJaS3i/7OjpQQpjmoD5JvudF87zKAKRP+ze9DsyqL7ShDkWbMI1vv+78hz?=
 =?us-ascii?Q?skn/yHthRRxnBv2x77aXriX1nxL0UEng2ONcu55F67coNQFSuHYjfjHxrIxl?=
 =?us-ascii?Q?daD7oZNGPA7VzblUHHLoLDY6yhcZLrZwotNhkzCtzkwdTjmW8an5TF5vWits?=
 =?us-ascii?Q?LUjPLyCrR55oS/j3TA3JRglqxVveuUjLqDnhgDGAXXnXMMxdncgHwHmhFxnS?=
 =?us-ascii?Q?h8DZ3IVBIWjoR4L/+tC3P6tcA2+gKZG0cF+lcNj94J3d0J41jE1k3qL5RkHM?=
 =?us-ascii?Q?f/wIgSvzdaFdvvIFV+QLXsipSdt5Ml7cuDMUaDEzXsw95Il+ArmaBt+ddhR6?=
 =?us-ascii?Q?BoD4y/Vx8qoXuE5yqxyEW8UrgvVkTXAyp+YQlqrySZYSukIQHiVq0HTWxYVU?=
 =?us-ascii?Q?3yIPm29Rbm7vB78a2xZpr+/+GiZif3mPbkq03bzztwe/TuTymd9VZmLmmq2l?=
 =?us-ascii?Q?fRe4kHqVwHNNO00Ud1PN9idr47md82gP9l/ircSMuSBJd1PxWpqJ0PvXDZO9?=
 =?us-ascii?Q?jXjQIkBKcJTDmCg6po6j5BDIYumtPcLttF2Q7BNvwjhqh+ycttZBgH2iMmXJ?=
 =?us-ascii?Q?zHzsB+3s0i/sDvcGBjOrrx5nSr+t+/d+6+I9OwmFZ3P5kO88IIw2cysonSKS?=
 =?us-ascii?Q?aguqFh92JFJAtZuKHFooH0VJK/64+ypryN5itfFzqMrH+9u64mSwyK0Vyh6I?=
 =?us-ascii?Q?1m+odYAgqeY/kC3RKJ4WM87k55NhcwvXy6sGXnTABT4uN5Id4xl3C/rbn70N?=
 =?us-ascii?Q?a7MWK2F15GesSfl/PIZflXD5p3UAhDJszD8JbEU8gWHW4eB3ahfSz9MZnDh8?=
 =?us-ascii?Q?6z4iZfQcLk9vMU9yJf8IsSRkr9Pq7uLOdSrCJ9c69QuY2UC2O7RfM/jFC8nf?=
 =?us-ascii?Q?xOb80+kENhq+r8puKjpN7GxolYmufdI8cAOJ08dQw3/RIqhF99qkGg02Pf2k?=
 =?us-ascii?Q?xNiPoNb4DUUHdLX7DI/3+BhabGE1jGXxN0kb92i2NbV9p5ojWA2SFJYiB1+e?=
 =?us-ascii?Q?hL52QiARVu/yPY+PT3m5ajmGpMIBMZg4LJzd9fiONNklIwoPzCaTTLC6a900?=
 =?us-ascii?Q?Prqiznhy0WgsFInp79gN1Cf/K8r9jRD8919LyA+oAz/NQNibJGn8XiafeezN?=
 =?us-ascii?Q?ElDk6735oaBMyXvDTiks05kn4QhX+GjrNjqzWd2sTfnv76y6izwJqeyAptLD?=
 =?us-ascii?Q?CQBxjvFd1kzo1E6IM9TPwvhu4ZzJzVaTlulrTGrss6CPr7vm+LG2CRvtJonQ?=
 =?us-ascii?Q?acsMADx5Q9c7gtkHSl0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:10:28.4125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c84834-4621-4e8d-a2e9-08de23db622b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Expose one 1D curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
the sRGB transform when the colorop is not in bypass.

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf

The color pipeline now consists of a single colorop:
1. 1D curve colorop w/ sRGB EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v11:
 - Create color pipeline on supported hardware only (Melissa Wen)

v10:
 - Replace DRM_ERROR by drm_err
 - Creaet color pipeline when >= DCN_VERSION_3_0

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)
 - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)

v8:
 - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)

v7:
 - Fix checkpatch warnings
  - Change switch "{ }" position
  - Delete double ";"
  - Delete "{ }" for single-line if-statement
  - Add a new line at EOF
  - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */

v6:
 - cleanup if colorop alloc or init fails

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 71 +++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 ++++-
 5 files changed, 211 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 7329b8cc2576..8e949fe77312 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -39,7 +39,8 @@ AMDGPUDM = \
 	amdgpu_dm_psr.o \
 	amdgpu_dm_replay.o \
 	amdgpu_dm_quirks.o \
-	amdgpu_dm_wb.o
+	amdgpu_dm_wb.o \
+	amdgpu_dm_colorop.o
 
 ifdef CONFIG_DRM_AMD_DC_FP
 AMDGPUDM += dc_fpu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a4ac6d442278..23acc035b62d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -667,6 +667,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
+{
+	switch (tf) {
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	default:
+		return TRANSFER_FUNCTION_LINEAR;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -1177,6 +1189,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE ||
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
+
+	tf->type = TF_TYPE_PREDEFINED;
+	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
+			       struct dc_plane_state *dc_plane_state,
+			       struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 1st op: 1d curve - degamma */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1227,6 +1292,24 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct drm_colorop *colorop = plane_state->color_pipeline;
+	int ret;
+
+	/* 1D Curve - DEGAM TF */
+	if (!colorop)
+		return -EINVAL;
+
+	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -1323,5 +1406,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
+	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
+		return 0;
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
new file mode 100644
index 000000000000..a61250f7fdd4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_print.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_property.h>
+#include <drm/drm_colorop.h>
+
+#include "amdgpu_dm_colorop.h"
+
+const u64 amdgpu_dm_supported_degam_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
+#define MAX_COLOR_PIPELINE_OPS 10
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1D curve - DEGAM TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	return 0;
+
+cleanup:
+	if (ret == -ENOMEM)
+		drm_err(plane->dev, "KMS: Failed to allocate colorop\n");
+
+	drm_colorop_pipeline_destroy(dev);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
new file mode 100644
index 000000000000..3324e2a66079
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __AMDGPU_DM_COLOROP_H__
+#define __AMDGPU_DM_COLOROP_H__
+
+extern const u64 amdgpu_dm_supported_degam_tfs;
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
+
+#endif /* __AMDGPU_DM_COLOROP_H__*/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index f3efaf55e099..f79ad08c0c57 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -37,6 +37,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1790,13 +1791,28 @@ static int
 dm_plane_init_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dc *dc = adev->dm.dc;
 	int len = 0;
+	int ret;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return 0;
 
-	/* Create COLOR_PIPELINE property and attach */
-	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+	/* initialize pipeline */
+	if (dc->ctx->dce_version >= DCN_VERSION_3_0) {
+		ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
+		if (ret) {
+			drm_err(plane->dev, "Failed to create color pipeline for plane %d: %d\n",
+				plane->base.id, ret);
+			return ret;
+		}
+		len++;
+
+		/* Create COLOR_PIPELINE property and attach */
+		drm_plane_create_color_pipeline_property(plane, pipelines, len);
+	}
 
 	return 0;
 }
-- 
2.43.0

