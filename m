Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACAADC088
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6D10E4DF;
	Tue, 17 Jun 2025 04:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r2nZlkyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FC910E4DF;
 Tue, 17 Jun 2025 04:27:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWumQa89GWmG6gYYzhe0WMzdFXbZpk+LYqML9lgTeUmMCg8RQrfuA0RWwNtndPhby+wcV+ekzcXDYDceVixf3ihPWBoH9OuTgVyHzSpZOdsPceUKTVq1MVuKpYTbx4UPaeP1r+QNO5szj9nWS5FDW2CBN/Kw6N+R6cFztKfAiPl7qNypuVQhMRwv6hvH580p7kNEs3c+Hiq1+O3SY0q0CSJ2ORLXil8NKRexYwMqFsBCXqBp9eAG6A977VOBBrhlnf84+VrlcuUNl8Gr+k0LhFhVdzmAXoEeq8vS8T3ZcTgolKk5t3N6MItvUoq09xz6vVN4WvWeWVfQkkd5gNn5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHkNczAadf1HGfKR/0nbfpcgQLfIcF/IpP1/XBKlqnE=;
 b=FDlyuh5DqUbm56WzACqxwNBjMGCS0AaCeH2ZYQMs6RSIk/uAb0m3dpPAwzGyxwoqtJbe7+u28olnNCHviddN5Qpyg/KQpugdbs8+qftiATCldnugiYmoNwfeSP6/Nia8Xtgy+21HxxWiMgBHq7VpPXKRqksnrlGevnjjIZYCRSneEGlQ79wpo5eRePKoQCkXo4quR5dm15pfbNf2tvB6DEbR6ea1pLHz2ie7mwDrYEpQnuqG8d1WV5Fos5BcedRh3kyAMXF65oLdG2LR9wm8uKoA+hDcHffPgZPkQPd20LKYBMj6tikKsX3vbpdbHISOP61hos7X3xyz/YNHb7PF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHkNczAadf1HGfKR/0nbfpcgQLfIcF/IpP1/XBKlqnE=;
 b=r2nZlkyGY0GaEXUu/YFh/uT6Cf/NFOHu6b9QTec3jcL4iN1txh2PyGiMC9tEY6LU4hKz4FmJ7d/Au/BlAGqtI+pkhzuoXiwvY0Lc4nY3DhibQ/WERYwkD4oETOtYKi6y3dThvGFSL8snIKwDI4PfTqBWtZG2Lg46ZJ29NVuliXk=
Received: from CH0PR03CA0444.namprd03.prod.outlook.com (2603:10b6:610:10e::12)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:27:45 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:10e:cafe::e7) by CH0PR03CA0444.outlook.office365.com
 (2603:10b6:610:10e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:27:44 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:27:41 -0500
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
Subject: [PATCH V10 40/46] drm/colorop: Define LUT_1D interpolation
Date: Mon, 16 Jun 2025 22:17:22 -0600
Message-ID: <20250617041746.2884343-41-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 65508a83-a9c0-4ae3-c4b9-08ddad574ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?737WE7QOPGikdd80jz01DLLEIuBCkFWXgQRGyG5ILv2273dhWydDVKHhd/AL?=
 =?us-ascii?Q?g3Aiz4I3rBr6O9QxoVOM/RIpD5LLi7tPlWYIml3+FofVRs4QJ1zvgwFOIxDO?=
 =?us-ascii?Q?XEHlIvIgq0WSkbpliQ9O+Tb9TPoJmc/q3FYril1kc5p7JcH4iMoqlxqCzgHo?=
 =?us-ascii?Q?VHquh7+961hwco5fnmpg38fqAuBpeSLUFgUG3bYmxya60qe4o8xxaO3TyOlN?=
 =?us-ascii?Q?IS5pb6vSsztJoIBoWWRfmgLEhEjUHDKq8js/7ydSHTIQf+6HBAavXGjJ6r86?=
 =?us-ascii?Q?En1tkfHeIa5W5bXyLeIBYJAYYMQ7/U1JXhPaL1oZDMObS/wCGvXGzvtP7dh5?=
 =?us-ascii?Q?iFZkY8p1Z4WCrjR1A3du9ah0Pzy0QaKvwHEtZ3cl0RbNgJZVvyb1x/ySLRqb?=
 =?us-ascii?Q?93NIDh2BOsUAAumNyfXCawc7afrH/tuwBKdXIJa6Nqnlj7+9pHuICggJMi7i?=
 =?us-ascii?Q?7NuxaEA/X9KaDJr9N5z+o/PDXIX+3aWXrPppbOOljnEl52nO/b4GGr9aXilj?=
 =?us-ascii?Q?6/8IXMJUqxFGszerjG3wBDKQfDvj+xP9ohk0vBN1WGaMPrTEjvZX/vflaR8w?=
 =?us-ascii?Q?NMvW5IaTnXWjCAfbdg6sOLYDQv743hVWrQFc2ChqRPjgBj8SFhIRIJ3QK87e?=
 =?us-ascii?Q?VpgZnAe8MMr8G9EtIbCd21W4i5xXK2O2/7x6E16c+9MpEs9aChBJrWVC/I40?=
 =?us-ascii?Q?0QV7TEZr9fqiN7MOBz0RCdS0+07ZrfVer/ezbiD3CjDfvYPNi94UPCXJWb3/?=
 =?us-ascii?Q?h693vWgpmtrjbziP5AseZ98/SsTcRY2sGp4bKgOQeXonevd5njR96S6DZ2f8?=
 =?us-ascii?Q?zYLWEyXSN2yya3qJA3bkZ5HlfQaSa9Bg0WiSdqZQDMnA/jdoPjKWpDkEbVRX?=
 =?us-ascii?Q?fFTJZW3FhRqa/QokEWtiidJA5kDLY7o9zN6LpJyjLcgbEDA9zmdbUGVulsir?=
 =?us-ascii?Q?BnQMIZnuAGNbbNtFNzIUstO4isYrk1DY5BfsMe8iw919leHEI01I3ga+sNJe?=
 =?us-ascii?Q?llMDGZuHrXj5SzyShrRC1U09b5NLKbIzJg5GaFm6Fqct2u3MmLHNevZr43OW?=
 =?us-ascii?Q?3Ea5GM6TtgET3sFsuRciyBmX1BND6H6XCRV+s44mb0BLYvUHUHamGX19vgdg?=
 =?us-ascii?Q?LIVQHIxSlI20WpTkvhgRiEdHN76A34gS+C++SseC5CLIew3F8yn+D6d0Uqln?=
 =?us-ascii?Q?co+uMeV+jbRtqxmI5//4nn7CoNcKSFVx7YQ4d4mEJ9iDwQF3/ZZ3ne5nYWX7?=
 =?us-ascii?Q?g6CZ6WFVuQMxXlpyr+SQc2aPcJHOwrE6zFonuPS8u6jcOFxLk1udJ5c7xSUe?=
 =?us-ascii?Q?3hYRsnRo65UveW5A3BcTGES0b24jvgMDvTIYaGc5HW3APm/tImNDy9HVDldt?=
 =?us-ascii?Q?Vdp69EiUodGo2B6fiVh3wOYzeNxub+sl5W313p+T1RJPJQFEYQl1c/AoW2Ro?=
 =?us-ascii?Q?sm54nkbnCyU0MBwy+S9Nm8onCWMk+T0dp6XCfL11j7d/4K2HLRuSCtfvqsik?=
 =?us-ascii?Q?scIOWsjgetrP/RhLGbBcsBX/vbKC3Tb4nSo4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:27:44.9232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65508a83-a9c0-4ae3-c4b9-08ddad574ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240
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
V10
 - 1D LUT is no longer immutable (Xaver Hugl)
 - Add setting 1D LUT's property in drm_atomic_colorop_set_property

V9:
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
index f89f6631062e..60a5bfdc2578 100644
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
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 405f4234e641..40ee221b6496 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -737,6 +737,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->bypass_property) {
 		state->bypass = val;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		colorop->lut1d_interpolation = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
@@ -764,6 +766,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->type;
 	} else if (property == colorop->bypass_property) {
 		*val = state->bypass;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		*val = colorop->lut1d_interpolation;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else if (property == colorop->multiplier_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index a3cf62c5e263..1617b2742551 100644
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
index 4909809c7fbf..adc74aee160e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -943,6 +943,19 @@ enum drm_colorop_type {
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

