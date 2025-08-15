Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67271B2778E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFD510EB65;
	Fri, 15 Aug 2025 04:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i/L6ucbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ACB10EB5A;
 Fri, 15 Aug 2025 04:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPRQuj++/Q6ZTJGgVhDw5ppad7RAOmAvmhvzQ1MCR61nNySFbVcuzNOI3iPUZuitv6UnpYT2xcu2Ib6j43/6IfioADIwcDBjIPoddskgM42mmRD02zIXB8XfKA4uQsTtIMcUR1vyCWUXgE2qms1V3hyAlUhpJMXHOqGCM7TrL+WS6f9QpAA+pKtzauApyIPxbqgrZEcq5VfHyNMzbxa4N2swsdIjE9S00bHbZglzOTDS/5aax0y4m26SonLpxWSkOPy5q2fOXVplZgy80m5O7M0CYANkMOE0OD0TxV7B7O+bAxQk9LvJdZpfFRaFJWYihtOhFrOStR8Ie7328COkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HoCkJCo7A+uFGt5s5ks4yeg3zYbw5WFuU+1YivxJ2o=;
 b=L8hbyRrAISt5g0HQv/wLi9ffSj9KL8j1MvpjXGX7VnH2VL5gaakH6qwHcDfQehA4opgk72WCFLwK6HAb11ZqtBwirNBvDcup1X2Ecz17FAgVEf4OlpuPb1kANNWcV/CDzLT+hlUFLL0k/6aKwLDG6MFqdNsCqqxAK/nxTI4xJcxUg806w0aq539Lsh0njwHV0MHMY9rEeX7ToKnJZMzv/hs7LjJOdAbPdw6ElR+hwAyMILSK9g10hvknfPE1g9FENsUUyLoA+GeJ33r4m6+qSoE/Yq76+TDIbrpdEw5BMiXxrWJVrZnwVLGi+Z4JjWaOCd0Ss+s92ZYxjgpPbGNDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HoCkJCo7A+uFGt5s5ks4yeg3zYbw5WFuU+1YivxJ2o=;
 b=i/L6ucbVrHcayA/yIjFHjOsoRt3SSC2Hn+viiONhHBsdWBP2JhifmgQB9oqSJIeOsrR0lqQCZkrlyVbfVfWn9KZrTA7OkeJAzEbofV6tmOG0FOh/pbQBKSjE1v/MS0xgSm0nnHIZqw0drBbUQA2Cc/ft+j1Dh6wMLxLzxqf6/kQ=
Received: from BL1P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::13)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:01:31 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::c4) by BL1P221CA0043.outlook.office365.com
 (2603:10b6:208:5b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:01:31 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:01:27 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 41/47] drm/colorop: Define LUT_1D interpolation
Date: Thu, 14 Aug 2025 21:50:30 -0600
Message-ID: <20250815035047.3319284-42-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 8740ac37-aa7e-4806-f1d3-08dddbb06b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8zAzFWOQrCzCwUybXFt81Jz1wrMjVsUgeYwb2t4TLXxZeobBA43hIvGI1jXM?=
 =?us-ascii?Q?iOZZaXBqum6EpwSYfvbJ12IrkzptjzQ96cUWLPPKD10zmmIiwl3NRyfBEDxs?=
 =?us-ascii?Q?cu4HxMgEb0l6vxIH78DBg1X6pH0zmVGmBE5rZB43Z9EcsN8S2jLlrtQH8enl?=
 =?us-ascii?Q?fQfIsfQ51viG7tBnRwmHzj35dfmdaOifhMrCtHlTjbp4V0+bfCK1a01wyx4S?=
 =?us-ascii?Q?KLi0PeX+DHwn6IBnugU+C9i6cYQcyQD6lfOxC2prU/OMgaC7V80AYOXrrVoC?=
 =?us-ascii?Q?HT5ugvVFzc0xvsPxbkENDIPL+SbFdByIsZAuBNNekZGPpuQm/C6C2IoKeoBD?=
 =?us-ascii?Q?YSqerzGH3Ol3eZqa7X2ayKVRqRYwjDJ/naM+TruNK7HDURpYnZb5oUUbbcVn?=
 =?us-ascii?Q?X4acqfEz/ZiU6SOV4h6orSKerZ6+TCZz5/ti5MY1oHYgjisOdxgqrG4ntRL0?=
 =?us-ascii?Q?uln2iVMFeVdUddYScw1D2DUWdxjZdXp0O4t/dY/W37uJUFvuUud1qWcNUYb2?=
 =?us-ascii?Q?fiBULvxjiskppIpmuRnRvFAb5wAjmdV7o+kahboUXASVDyfilirc/L/eoRsD?=
 =?us-ascii?Q?eTgug5yyZkuPxbPrHOlBP5gQ0pOn75FeF3ZdAie8Q/A/QAtZTRZ3KyUn/tbq?=
 =?us-ascii?Q?/wsZY+Q/5wt4bFiGD6hYdixAaRRyTSBbWbvRkSPqeXzYX9ngLgKKr42TT8cM?=
 =?us-ascii?Q?xRw45IzuTtvWx7Z9HomNBl3DKrVcwPnuaA4V4RsoAaISa8X+eUw+PsQwZfCt?=
 =?us-ascii?Q?EKils8z6YIFDyQ4BxpuHUy2rYe7D1yZtcyXWTmjb1W5jUzG1UhB1UJe1vXIP?=
 =?us-ascii?Q?psVtwqu3TgvPRJugh0hbztVNvV6XJjPHClcCk07n3XM0d4FPEjs3UibB0eGr?=
 =?us-ascii?Q?kXC3+5JEovNUW9O71awegzfK94Bee/M4/9DxUnWoxUIam6DSZoww2uY2duGy?=
 =?us-ascii?Q?09mFNSclcv3cw9HY7KR8qSrfcvYrLTc43kp0TqGhauMvci6rU6TcLbspCEd4?=
 =?us-ascii?Q?Y9foj+fYRLm+DcW/lcNYizqLN2/GqqkjBjhzXEm5vKQNFOdmU0fyPozn4dGT?=
 =?us-ascii?Q?1bIGmKNGRj0y/HEZS8odmW5fGWVfRC2TkFRH2Ar3rryVYPQEaq+MGbDmgJpP?=
 =?us-ascii?Q?JToH0TvCOOzpDGe/pbT8mChDKdZQaI5+IRKMFU8jcPHnmFqkzD4irZPwCOOo?=
 =?us-ascii?Q?bjpsOvEXH2KWNcry5ROhMcTX5rF2mf1IPZffCDJtKRhR6pVLUyC+gvSXFOA/?=
 =?us-ascii?Q?75PS7vtKKi1OPx+SiHSAeifrK0wRCAtkAHtu5oZRw76nwXmPfRkpCgREx2Ah?=
 =?us-ascii?Q?OILAIHsFx00e7Nmue8PGN4WNV+v95AyMmsCa8IUtiI30RBc0JWIRNmSwYc9C?=
 =?us-ascii?Q?8fImCKBgk/5PwXb0v3ndb0dKFelV6HRScgS85Ydaa/C89CcCl5j9b+4tbwq3?=
 =?us-ascii?Q?N0aU5uqQ4ngnf/lL8KyOgRU0Lj919NWRqu8LRO3jPyAH71Km518wSoaZLmny?=
 =?us-ascii?Q?uda75S232kwqvyVKWzYfqkRy5CPJnfiqJFVp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:01:31.2455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8740ac37-aa7e-4806-f1d3-08dddbb06b07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
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
index 4db0546ca6e1..c3aebcd9848e 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -795,6 +795,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		break;
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2e90e12e6977..5f080adc690b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -722,6 +722,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->bypass_property) {
 		state->bypass = val;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		colorop->lut1d_interpolation = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
@@ -749,6 +751,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->type;
 	} else if (property == colorop->bypass_property) {
 		*val = state->bypass;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		*val = colorop->lut1d_interpolation;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else if (property == colorop->multiplier_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index ac6ef89fe939..8663b49d32a8 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -78,6 +78,9 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 };
 
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
 
 /* Init Helpers */
 
@@ -274,10 +277,12 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
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
@@ -297,6 +302,17 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
 	colorop->lut_size = lut_size;
 
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
@@ -451,6 +467,9 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 {
@@ -468,6 +487,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
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
index 98911ae32fe5..dcffca8b0988 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -273,6 +273,21 @@ struct drm_colorop {
 	 */
 	uint32_t lut_size;
 
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
@@ -341,7 +356,8 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size);
+					struct drm_plane *plane, uint32_t lut_size,
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -395,6 +411,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  * const pointer and hence is threadsafe.
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 236304bcc80b..519badcd1d04 100644
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

