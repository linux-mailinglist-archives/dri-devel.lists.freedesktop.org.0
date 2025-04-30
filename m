Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBBAA4079
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B2E10E697;
	Wed, 30 Apr 2025 01:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bfGceyF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512E10E691;
 Wed, 30 Apr 2025 01:21:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEQvGDb8lXjyPKmUQxdvhOM/BXODIVB0DHzy6vrNwYZpi4nl5nAfPdOoT4QCCGxiTH9dxlHQLk9pF/CsSebhBt9Ca/goE2zmUaOGS870X6iag102L01W4JJxmlZl9NXejlDDCq58MgPGK4iQJISF4re5sF2goloKW5WlgGoz8XfLDG0v8CUmwKtspxrtyOkm58aRWguS84J1QrpbCIPFhGpoMBIugjBJpxRCArw67zgFAGIPT9o9+uGll5idyI2V/bhvCDD3PCFzOFSM+/3rnewcOxWjiQew/AG0wIx2lyW2BCKB0hFQuSd2dmZmXC45DqF8ykiOPKIr2F9GdRsLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qc80SsIZi5KqpAMQitQ+d4nFRXCPlNIiJnztmHwVn0=;
 b=UHEyWvuhsJlbOyvj7Yg46cHaPaZP2ahS3gg3X8GRKrFI1dux/J1yKls8RQe0CwY+N/jBdln66LeHyyTksrSNgTn1NXC7gJCDjT/HQuE8qxak2JeabqbVaqvol1IR4KDrHPZ2i6fchFUmkb0JAFz7RIocb4UQg4NUT8XWPPsUU2Mon/lU0Nr2sJU4761MXnl2nxnGSIrXSVZ92IJAnfS/KnTCUQ2rC3znojTQQj02H8sR8HNtFs2L1mhrvWWWugV8z869FcdiBx7BVRdFoNJ76CZU/4/GLjcz50WuSJdripkoE34fW5Wtd3xwEfRaqlpQDg/zeVHhrQzDYSMnoa+0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Qc80SsIZi5KqpAMQitQ+d4nFRXCPlNIiJnztmHwVn0=;
 b=bfGceyF9pfSJiJMqfFjpWw+KWbtxrAzLagm1ERoFOntALj6UOq/8lmvMyLHgl12PYCWvqen4g31rUNw8lqhrGKTuSqqa1R39FtwlIsUmnmJ1KYsTQM+Th6bN7pzNqHb2I16ZJBbv6isG89O7o3DFBqEKs/hkff6J8qdkn0pEjBo=
Received: from BLAPR03CA0039.namprd03.prod.outlook.com (2603:10b6:208:32d::14)
 by SN7PR12MB7155.namprd12.prod.outlook.com (2603:10b6:806:2a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:21:25 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::5c) by BLAPR03CA0039.outlook.office365.com
 (2603:10b6:208:32d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:21:25 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:21:22 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 39/43] drm/colorop: Define LUT_1D interpolation
Date: Tue, 29 Apr 2025 19:11:09 -0600
Message-ID: <20250430011115.223996-40-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SN7PR12MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ac090c-66e5-4952-464e-08dd87855352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CaDJepZ3h2VzQ5JApx/VxeF7YjjDlMn19a4HLn8VRgHSu2s4RPI5CTxae9vt?=
 =?us-ascii?Q?jSeImJzUMaLUnk0K5H756A4qzdsGyxV5uaK+LHYcvzkga0j7apmA9qR46TGM?=
 =?us-ascii?Q?nCEHDY9b1LDyve9oLJ8CwNaTgOr/f+MqlhCOzhFY/TRNsM55ACfKEwfEzAW1?=
 =?us-ascii?Q?5v+46+it17CutuTvmxxoO8euomwCiaqzOsDm+dN54XjZTMCLV1RedEWQAaXW?=
 =?us-ascii?Q?5sHldir68qePzuvpxNZL+O/EeHwO9PyHg4/aLlVSelV9cjksA74LS809sxQI?=
 =?us-ascii?Q?O3GKFUUNsPSRmTz3dOaey38kZMQbfYgRMKaXqg9RJmyXmxMV8nHS/oslUiby?=
 =?us-ascii?Q?HN3q15YXuXZt52G2Diz9wxsFz+acQ2II5U52nB1d/9m5+WHYPQYB+/GPVCGh?=
 =?us-ascii?Q?ZcIo5ILXZdFriU3j6p5Ij0cpOZgN5SjViniQ+/0j+PVIHThU6LhjfqktqDwv?=
 =?us-ascii?Q?P+JKNmUTbwRqqQvVree9bRE0TY7BAGc/mlRFDKrXePVHFrZPD+0EaQlUMNkV?=
 =?us-ascii?Q?HvnAOUvCGe9nZIcxG+xpZd59UPWJkz495Cc9gECvfbxmQLX8M9KM7za7X8B7?=
 =?us-ascii?Q?Ffu5tcByfHN144jKMd7Uc48eFLh5MkihSyxJydRtFTZ7xqVlrkX5Z7VvIUU6?=
 =?us-ascii?Q?tWUnt57NPz16nUM0v8nZUNdbox/SEKIOPuEaNZK9TqCp2ZglTe/il/t+AqfK?=
 =?us-ascii?Q?F2u9balbr9dU2Xq80bV/3Wpqy5cgB2x6YWurwcIpq0N5nUPT8TNE95OTzCwy?=
 =?us-ascii?Q?drl7XO8ctWRbpAxJDLszagXzcODfOlw6aU0v4SIiSNN1r1NMz6b3lAD19yWb?=
 =?us-ascii?Q?1Mpg8dvKMK5/drDTJfhf1OUgtj9+RjREJFJaciI6pwRSQo9/Q43z+40fwYV9?=
 =?us-ascii?Q?oL2FAaXIf8Z29TFnyyrEcUDHo+/6vqYnnn0ESKSGomnGs5WvqAZuq3NsT8Hi?=
 =?us-ascii?Q?KnqJ1Ux62FwOIWV0m+BAcvlRcd14zGNOTi1xwg8CswAa0AUBUlTLeoUkqUdu?=
 =?us-ascii?Q?74BLX8gbBrEMyqlpE/mr6lEkDklDI3lQG+I2VDKKqO3uMrMoLYtPwrKPfU5h?=
 =?us-ascii?Q?PiMYst9Cd00kZKtJVB9u3sI16Bz21S0Olqx7m7y4GvxA+IfQ4dmQkMQyCQUY?=
 =?us-ascii?Q?bJcFjE6wB50YSLNr9Ox8LpYOPkjf3CYooSqzcIN7FEtOYOSEtsKXpAyE1Cwp?=
 =?us-ascii?Q?XmNi6ShU5KU2htOO1G9Vj6gXNO9gddeCwz4I9p80JjSaWDhwl9hBABA1kBAU?=
 =?us-ascii?Q?NGXX2J29NGKbhd/paDdFWPLajg/MqFFDXiRiYpCW65YoMesxHMjdcJIs1YJk?=
 =?us-ascii?Q?7WiizLQoO7JPGAmg83rEkeYkpXrD9oKt5OY6zXh1EkNFvTvoOHw9iUKdCy2H?=
 =?us-ascii?Q?Lp9uDNcDdoLKAnJEnEvi/Ugy1VgAdG8gYh3lUMtZ8WIz7cklrGJb62SctX9x?=
 =?us-ascii?Q?TmrSoINBj1sg6HnRKKQ6WBsXa5Qimg1ERX3P83o+uQTYDfhGrb8vA9b8oZY+?=
 =?us-ascii?Q?dlLFA9VbxpCNVfdKVrSIPXczFnrd2elAzsLE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:21:25.4492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ac090c-66e5-4952-464e-08dd87855352
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7155
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
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Fix a checkpatch long-line warning
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++--
 drivers/gpu/drm/drm_atomic.c                  |  2 ++
 drivers/gpu/drm/drm_colorop.c                 | 36 ++++++++++++++++++-
 include/drm/drm_colorop.h                     | 19 +++++++++-
 include/uapi/drm/drm_mode.h                   | 13 +++++++
 5 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index bce461ecdad4..ff11cb0603c8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -131,7 +131,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
@@ -163,7 +164,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 907ca790689f..90df638f25d5 100644
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
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index a3cf62c5e263..125b3e507d6c 100644
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
 	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
 	colorop->lut_size = lut_size;
 
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
index 888184aef7a0..00dbde7e1a92 100644
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
@@ -341,7 +356,8 @@ void drm_colorop_pipeline_destroy(struct drm_plane *plane);
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
index fa5e1ddaf4f0..d76c8ffe5408 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -932,6 +932,19 @@ enum drm_colorop_type {
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

