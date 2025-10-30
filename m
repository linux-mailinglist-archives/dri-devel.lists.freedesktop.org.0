Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BDC1E4CA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4AF10EA4A;
	Thu, 30 Oct 2025 03:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JpkR9ZJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756C510EA45;
 Thu, 30 Oct 2025 03:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bzyixpx3OVeyH/LJnj7hdMMGEYSn08qFO38CuwiuJheYCmZ6Ewgr9E28Ji1lvsG4Xx9yky6wJYcDh5d9kHDiz7aao4VNbrjuLtey2VM/fe+ndrcbdmyC8edilwFDrmyWgBXCvd/2sxZUE2A49I2ALJffcF+Kz77xAaDlZMzdb3UEa06zrUQlrMrMmXhdiFZsoA+49Bp6yvQKDUesMp9/sxx7MLKP7WV3y0AgjZmi9pw83cMj+Sb68ZcJ9Pms8VK81zEZN1pAtAnCOJ+vKaUyA/Zq1jFMP3y5s7pzdka8n9W9bpRXY6imGaBsfAwaKvvsQGLAqmUVJB2Pov0+2Ez+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h882+NqnqJAxDv0XBnUKyFxseH9zaV+xtOSp4msVUwA=;
 b=Mi8tc7ZweRtgCwZofCXlEdnJR4CAt/Ii+JUlK3fldxJ3qXHLISsePFFg0cr/1W25g2XCD+38g8ldaSGygBN7/H3b2nzsMlgsaXVcQ4EeeSeMvqG7BwlEn8+Gd796gFahUpAaTJTCgXiwNmQ/3/US+PBgYl1H4J7CCK0uQ6OeDtJ3o8HOT4ys4IbfzzLRLTpP7SsJwBYa2TcAdpMoT1+sfHNZsHUnmyZX5ofWCn6m7lHmZfQzTyiAjSYZXPmxbCOSdUX7/lCuK6fKH6kTfRlzACHAqy7sqznqMuoG1yVKfFRJ7t3hz8Psd+PlX6LzFH67zLIw+P87O5DdFVmpP76Uyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h882+NqnqJAxDv0XBnUKyFxseH9zaV+xtOSp4msVUwA=;
 b=JpkR9ZJ2QM+o4D5SPUTHBptS9Vf9D7RGmnaqeI5sgmSNp93SQ/P4Y/p+SQ/o3MBViPuP87WAP/Sd9xkW9cMmGec9uY+MIKaN3W9wdR1FOGYkdR95SYOeTfiGIecgvB9nMG0GWCNt5p8KKKYQpmIapJ7UUHlouAmBKPsCuR8x6dY=
Received: from BL1P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::7)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:54:59 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::f1) by BL1P223CA0002.outlook.office365.com
 (2603:10b6:208:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:54:58 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:54:54 -0700
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
Subject: [PATCH V12 41/49] drm/colorop: Define LUT_1D interpolation
Date: Wed, 29 Oct 2025 21:42:46 -0600
Message-ID: <20251030034349.2309829-42-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 185e6cde-fd31-4d2b-a50f-08de1768187b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iMv0lruL3Fccboor6p/YVwCPokJMzr7y/h587hUrl1KwE7oWUGXfKwEyQRK/?=
 =?us-ascii?Q?SNaXuOnLJKQVKIXYK1XdeTv4znHNwiSDy+vANWPA+HA1WrcryOJQO83856KD?=
 =?us-ascii?Q?nzm5r9HKyf7yyH2mi5QCqkK0C8K+YuljkPB6OTIUm743NnsTVUSzr0uf8JUI?=
 =?us-ascii?Q?5dY2RnAnKu1lw+KXoJvWWobuEmlwHQdOBRskJjyG7DD3jYkKFlpp+BZ4EhZ+?=
 =?us-ascii?Q?5vcJ1ap/RblwtHvFIyP8VYxfzfuHOYvhXQHor7JnYYwdicsnFZw4BvCjF6h6?=
 =?us-ascii?Q?p6Ag9GVLXIHz4e8VkdvYCJJ2+FuA2TEiMxUTl4oDII4w+reUck0XTxLig+2O?=
 =?us-ascii?Q?OqEwiqe8Us1Y2KJq0+QTF7tVI1U4YTE7wodwMa2KbnAyzZe10vfsPnfoVMuG?=
 =?us-ascii?Q?2FSKL5GbAAiw1e/8B9a8N37+E+GJ8oiBbUOZ3tk28n0F5mvn+jo2uNzj0LTv?=
 =?us-ascii?Q?fNEppmLhgNgB5+B9FnwFRqCmq72tPrsw5hl6jAzCCq0rXQVq6O8c+fVtepT0?=
 =?us-ascii?Q?LVV+wT9mSCTnEGB+uvyKJ3Q2i5/stKZmWHOcBCOjqsCzZzsV6w8127MobtYm?=
 =?us-ascii?Q?3sRVynCb0Rs586yJ1ancUdAtmvSe77OnVqbVT9t4trotb1iaTCKRQsTzLo3w?=
 =?us-ascii?Q?xre/MxuWvoQwrTVL1QPpBeDcF1bLjgfmjiEAQq6vbukfkhAwvyJDn9sfRb0X?=
 =?us-ascii?Q?l1t6qRE1tF33DEKq5n6N1hSyWQvwdOIREDYdayAiqTop5iY82pXH+EFpQgpj?=
 =?us-ascii?Q?9Aq2aR/QRVlLOgbtNLNEFiRAj3d3x/nmdXyC3oKtaRkdr2aVLilEYFTzEjJm?=
 =?us-ascii?Q?AeFOppCZ+M+c75SXI8VJx7eQbUMgrzGOxlbYAHC4S3mOJlgWrBARNqtT77da?=
 =?us-ascii?Q?U1c7MpS086WA0L5RuUv9I28yuyErJMRsJKRsCwRzjNefstL60JKnojZ+zpRZ?=
 =?us-ascii?Q?59mI5LeAj3/WlQKhM0sSH9/fqJjcyKEsaWH97jB6XGcJ/OjJCTWLAeYvbfbB?=
 =?us-ascii?Q?TF13BkfZByhPqb+B46B718PCYWd4N2s3SpA/MDmOwFdLWarhFjGBFeodxF4y?=
 =?us-ascii?Q?SPn6OPAoZykn34Bze2uVU6XTyooA5JC4bKSJl2y4CsNw6nu0WMsidY11gHWQ?=
 =?us-ascii?Q?NBtbLp818gFoP3wKilavqIbY0lOnq+5P9Y+xh3tL7uNZyeeXp2jT9fYJw+9Q?=
 =?us-ascii?Q?IQmfv1IJIvP3xcyhxiTqKQBnaQUx+solmJRURp4RUZ1mNDn6ZLdwaHvEHkck?=
 =?us-ascii?Q?dPdCAQA9yji3dSN+sxYznjVG8JvPKRBupSFVt+k0oslqBcCK+K2IDoDfzGSu?=
 =?us-ascii?Q?SnSkBQaYnFEAlq9j/ua8gSZ2Ny13h99Qe7FtEcEvfIYzLOFcw1hQBuIWVtpn?=
 =?us-ascii?Q?/UI+iaYPeN405uLZ9L8YwAgkzeAIHVu2SDw595YwR0WrqI6D5YHpWw2vaWT8?=
 =?us-ascii?Q?THEM0lQ0PrAv6Bhex35K1QgS8VyQMRleNnnBg8uJ70efrEU8C14f88bybu0G?=
 =?us-ascii?Q?B7iOXWNsECnb6obxtpT+9dN5IJtjRcbQCxYLPWSZDm8KwuKYzL6yNBgpxY1X?=
 =?us-ascii?Q?SSclLA0waaIMfZsXxvY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:54:58.7474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 185e6cde-fd31-4d2b-a50f-08de1768187b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998
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
index cda5eba1636c..265e2e992bfd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -795,6 +795,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		break;
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", colorop->size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 47af8a553e84..3c17943b990e 100644
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

