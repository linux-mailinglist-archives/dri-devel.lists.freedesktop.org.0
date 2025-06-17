Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F11ADC07C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E6810E6A1;
	Tue, 17 Jun 2025 04:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UETkOjNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E0210E695;
 Tue, 17 Jun 2025 04:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV9fP55YnpdpsgcL1DjKGF9QzQvPX7FWxO7ki5coicelJUrqEMFx2nC3M/8M4MnP2fei8OIlL2lywXhOPlCxSBiz33exj7X9uy3lshbOs6WaKCfB4g633YueInAQvo3m3q97WKpH4v6nWO9a4ZQ8/62Y2E+dowiVoNNdMRd2Ov6RfNzNMBi1PTt+Sm2pZDND93YU6plJO+qvidbfu/yN6gzNM3a+HlaRiWyEKgGUfB3ZD1w/2Z1T4xHtOWgbNIgNegRrdFGY5GLcnIyRjBjwMJoxi3zzCliuRZzZrc0fKPp69OSkVfh0d035bdSx3Z6vAkhV4bxn+cn+C64IHm9Kkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOjuMwVQvpfkd3VunQ+qgARI7usYjshnpAFdNcNppcg=;
 b=KjgWP/WJbGH3MYHOwls+6WhwVbNqHTWyNyjd4tsyMbZ4k8qqrKsU0MnNsLHNwK11gEtIAWtbzY/99SNYEIzLEH/LM1h/J8MbwYDlf7MW7pJsGlf0+4DepHkAC53GpTAYhlURiMd/nv1/fgU7iZS/0z7E+ZS5Z64cfQ0LgoT30bb5aMdO2uD5NB0Hk7Gcn04AYuirL00bqBtp3KZdyCNKcgGwKnHWyOjoOiF7BNa8Uk+iTppxJ+vFBgARX+6Px7qdnTp5sH7cek2Ehf8mIuKwFgeQKPTYb7hCWjmOWDStrusk1zkvQbXQZB1dARtdli+CxxT9g6WrukNdtUdve1l/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOjuMwVQvpfkd3VunQ+qgARI7usYjshnpAFdNcNppcg=;
 b=UETkOjNKmGV6X4bpdcP8Tnc90YBcwqnCqf7cI3BVW9uFvdxM6W6mQHpiz8y3VuW5HargqnddRNIf7WOZlUrF7zl2ubk+6fmsK2h2GnEYOlfy3CS5uDGyM/SmioGRgJvY/hdXc6aXdD3QIFWrpYJo55nEzAdOWFIccJxO21lYUGk=
Received: from CH0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:610:119::27)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:26:19 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::fd) by CH0PR03CA0361.outlook.office365.com
 (2603:10b6:610:119::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:26:18 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:26:15 -0500
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
Subject: [PATCH V10 34/46] drm/colorop: Add 1D Curve Custom LUT type
Date: Mon, 16 Jun 2025 22:17:16 -0600
Message-ID: <20250617041746.2884343-35-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cebb01-3e50-4a7f-2b08-08ddad571b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W3oPHtJaZftssfbgqGb1rroGGeyJs9tO3JCt4T102j2FbA090vWOSBvqSm4a?=
 =?us-ascii?Q?7gLhqOUlZA70RO+0y5sjMVjE7wRsUQH4tcuheRr4QDY3pYrhMUS+ExZeI4lv?=
 =?us-ascii?Q?/H23xN/1LVpww/4ric4Fe51l021Mv0QCr/YimETbf06owhzz+RqVHoLsQrCz?=
 =?us-ascii?Q?Dw2KHs8JXcZuukdMvOc6tDqsgCj1g47jX7BBjHI9zPw5jmnzRlw3e5raVuTY?=
 =?us-ascii?Q?z9GgNzFuqLzcuQ9vQvkLkZQE37ZIUihlpXt1N3jV+Qu+BA2O1lCsAVSzikHo?=
 =?us-ascii?Q?iDxAmEJfvsc0aex1Jyoe33S1JV2znnixGlQL7HfY9peUTYKSG2Lm8k54HWKf?=
 =?us-ascii?Q?L5JREbkWZ75cEtTS0TALm17H8hgaxh+9MTTdw20H2rbP9GO0YqUUabYYt+o0?=
 =?us-ascii?Q?NQC3+UHvSDED7OjfxowvzFtV5huVDbisM0GRmhlOMy+Q6JDb/Sonr8QFOTVX?=
 =?us-ascii?Q?7j2c8V/bfIElCjMS+rt8mT0d3nqvPTsSDqthOi7RZLVSUvpgfs/1//MRAzdt?=
 =?us-ascii?Q?olWSDYiuwdgvx3a1Ze4hFtxIqlMSBFd387Wx05oKs4347TAi2hI82NpWM/xU?=
 =?us-ascii?Q?SVfs1tdG8JSXkgAhXwCyPujtDLIIa1Mr6Z1BZFedeadG08lKHUBFzqVtR7rz?=
 =?us-ascii?Q?z2yYz/pWa8xVrXtL0vW1Y2oqBsCQ2Eet9ORWhmjj1yg7YTkXVVPeIaAJ/0fv?=
 =?us-ascii?Q?vI2yCQteYUOS0EBU1mI7jPk3Sr6qo++PC4yF5mvh/8S5edCBThl3InHxSYYl?=
 =?us-ascii?Q?MAdMRFnHVurtBCdEEVMXU/+0g+yGR86NXPUHp5hjz/HorrwxMTwQyc+hUkn5?=
 =?us-ascii?Q?GO2E5EwUwbikcoEFhIt+IDdhpfpxVCEzESmwIJwE80EdoOHZzcS1Sb/avQr0?=
 =?us-ascii?Q?amLS+UhMZga3qP8D4gII827OeFIJVbfEhyRcxLtUeaV611O9Rwz6pdIT3u2l?=
 =?us-ascii?Q?VfzEvLyKUk3FobxHe/djgcAUTWhIOha1SyYsbWQIaAIcWtQcg6hJt5ManPc2?=
 =?us-ascii?Q?uoW3pYGx7te4aZpYh9scLSTBuHIldMv0vjntPdeJiPDfvOqP9LDNtxLdDgz0?=
 =?us-ascii?Q?uumXDv1stg22g7lcAAB6n1zLr/KJSCoWR1cUp4kFbkG7kbrRQxUR4Rrrekpb?=
 =?us-ascii?Q?SS7vM1zv/QERd1HqLHH7N/2Sr+33R7byJz1NuCIkjC9/XRatVDu8HqAyAM+9?=
 =?us-ascii?Q?Zhr8uJ2y5Rx0mE++yM8tBso5PLi14TTwN95DvUM4IQZyoRSQkx+Mgu7fJGua?=
 =?us-ascii?Q?t4w1uXtL8yO6UDThHEUVtXlwB7x0XurwZ+UkewYPBLoVbuEe3vWJJkUjl3Uc?=
 =?us-ascii?Q?CGuQ3IZLngA2/SywtGYE1r7zTHKMfQhhGtwOa5sRqAS+PmSGTI2Lpmb8mW4d?=
 =?us-ascii?Q?z2dyjhWFz4LQjXDsF5PtNmCOtZe/KG0wxgxcTfMVbI164Amchp31R1S7iuTD?=
 =?us-ascii?Q?hEdPGT5c7u3fECJVsLc4Woy/VnRhHPlyTPKDf2QLXFZ5dHyCDYJZ/S7Mp7j9?=
 =?us-ascii?Q?HoMUMPItxNDR4Wc04PCJgDAx2BIcBPijuR82?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:26:18.8712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cebb01-3e50-4a7f-2b08-08ddad571b5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260
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

We've previously introduced DRM_COLOROP_1D_CURVE for
pre-defined 1D curves. But we also have HW that supports
custom curves and userspace needs the ability to pass
custom curves, aka LUTs.

This patch introduces a new colorop type, called
DRM_COLOROP_1D_LUT that provides a SIZE property which
is used by a driver to advertise the supported SIZE
of the LUT, as well as a DATA property which userspace
uses to set the LUT.

DATA and size function in the same way as current drm_crtc
GAMMA and DEGAMMA LUTs.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V10:
 - 1D LUT API is now using 32BIT RGB with drm_color_lut_32 (Uma Shankar)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
 - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)

v7:
 - Change "size" to "lut_size" (this affects multiple following commits)
 - Move "lut_size" from drm_colorop_state to drm_colorop
 - Modify other files accordingly (i.e. from drm_colorop_state->size
   to drm_colorop->lut_size)

v5:
 - Add kernel doc
 - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)

 drivers/gpu/drm/drm_atomic.c      |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
 drivers/gpu/drm/drm_colorop.c     | 43 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 ++++++++++++
 include/uapi/drm/drm_mode.h       | 14 ++++++++++
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 809bd856d378..1dda90554e46 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,6 +793,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tcurve_1d_type=%s\n",
 			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
 		break;
+	case DRM_COLOROP_1D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 0de0fdd8af5b..6839363fa05e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -712,6 +712,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->lut_size * sizeof(struct drm_color_lut_32);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -761,6 +764,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->lut_size_property) {
+		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 3ae4a93f0200..6c87f5b9f7f9 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 };
 
@@ -266,6 +267,47 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 	return 0;
 }
 
+/**
+ * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	if (ret)
+		return ret;
+
+	/* initialize 1D LUT only attribute */
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
+
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane)
 {
@@ -374,6 +416,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 766caedea2f3..52e965577bd8 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -259,6 +259,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
+	/**
+	 * @lut_size:
+	 *
+	 * Number of entries of the custom LUT. This should be read-only.
+	 */
+	uint32_t lut_size;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
@@ -266,6 +273,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @lut_size_property:
+	 *
+	 * Size property for custom LUT from userspace.
+	 */
+	struct drm_property *lut_size_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -312,6 +326,8 @@ void drm_colorop_pipeline_destroy(struct drm_plane *plane);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 21bd96f437e0..e522723e28c5 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -901,6 +901,20 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * enum string "1D LUT"
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut_32 entries,
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut_32 with size
+	 * of "lut_size".
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.43.0

