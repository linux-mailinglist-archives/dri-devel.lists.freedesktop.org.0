Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFABAA406C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA9A10E679;
	Wed, 30 Apr 2025 01:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xw7t/dgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B403510E679;
 Wed, 30 Apr 2025 01:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRzNmowJbJ/yZLu5gCJMLI1fHcILFcmyq4OU0QI8fAe6zvYZEJHuHlym9PblF3CWMtjCCEuK11qU5T7OZh+TicJ9zz9SUwjZEhVL9n7Dnm53GfZRkuhgDxCtvPWpuxRn4noNXo6qYxErELMyM7a6m8wpPH9MhW58D1Ng59Bz5REmjFKMvfmsHWPfOdZLMwa8p2UFMe25j5jd8XsRHnya+oXsswPGli6BJXGlJPnveyLujrwK6C89d9aHh4uxf6qal/0JLvz1F+FJ9Eg6LlnZZss9Cdvo7E74jA2dwve2cRksFTqiRKRU+1T1zaXvSdewRxtJgnPhxXD6GmyXjDuu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvdt/kUV2odZ5M7rgdr++nOOdPiOI9lP1voJz0VDv/E=;
 b=rZxIB0nUQHBCFh3sgF5LjgUvoNoso79Mhhmh9GlWD6cWyE8zZDQ/GXcupijRoVlvOp87U6Rw9dLUT8hwzbH5DoA9sHF1CtHB3z0DeszKY34Jcsia1nc0tWuB27HR+LTPKrssFQpWcnYOUZmkxnyWUAsAXTJHCfxy4PfxqnusD7iEJk8faKNFAglLmMUuyJC7/Pq/QTp19RuC2KT/A9GK2XKQgpwhiJg/Z75/d7QPHi/0Ge/Dc7jd7RQuu2Eya47uxGJEHFYkBekPq4xi9UsHZZYz5fwqG9gStgYQLD8tGe1pGBSIrqmMKoWo5d5j/0nq6ePLXxOdRxlFrY9zOnunsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvdt/kUV2odZ5M7rgdr++nOOdPiOI9lP1voJz0VDv/E=;
 b=xw7t/dgma1qIvj9O7N2LJg9goRD3WAIJxSKTnCaZosrJ54H0s7LQ+xpVJGZJVsBnYz2eSxlUSLJyXn/cb6PA1RZgUxX/mjbhEzs+R7ykORqlmVQ5dPbY20jzfMgHgWuGx+Gm0PSN1VcZmKUGQmQJQzihdVeEoDua3k6N2O/d7CE=
Received: from BL1PR13CA0201.namprd13.prod.outlook.com (2603:10b6:208:2be::26)
 by IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:19:59 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::29) by BL1PR13CA0201.outlook.office365.com
 (2603:10b6:208:2be::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:19:59 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:19:55 -0500
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
Subject: [PATCH V9 33/43] drm/colorop: Add 1D Curve Custom LUT type
Date: Tue, 29 Apr 2025 19:11:03 -0600
Message-ID: <20250430011115.223996-34-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a936de6-47e8-4d35-3e86-08dd87851fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ER7lQnP50G4VXI6wdeB1SmsRXqN+fHlxrxgpTrVwg/JiflmbebgLRvOQ5Cv3?=
 =?us-ascii?Q?Zp1FiJEkxf85eNiiLVwi/NfWtAOdRZEp4aDvt+XWUM2UcD91UW8DFql694Wg?=
 =?us-ascii?Q?GpVhGqaKxqqfewgx3fpcan+MR3AgUC0Bd5oZIpAK5g3YUSH/8eWzMDYsJPQS?=
 =?us-ascii?Q?XtxKKQFjcW3mXzlMWVDt85EQhoWG3JkLibVhF1O8CG333RY57W3FfTfs7+k6?=
 =?us-ascii?Q?tDR72e8CailwRG47lvvz99hcH28nh/GyGjhkIB4zPVPjztKn/CSksasXDJvK?=
 =?us-ascii?Q?HslMT/Z20C/KVaYiZ1LKrasQmSBs8SB6O8rC7xGDsXOaDzgA05o5EYoL5vGH?=
 =?us-ascii?Q?g/I45z2nFD5fxXjlFrSwtHOLoUp/VccuybMQuOEaWEw2V4k8AA6lSube+J2P?=
 =?us-ascii?Q?r5PHNanQRQ37Cp/hMEQUj1u64RhPSNRPVbNegs5x2XODz9VARFcEghpY5o8Q?=
 =?us-ascii?Q?C6f3WSwGiRvDlNDmplbi49SGAEjQve2TmAMQtePzKF14/W6KDqQjTKhiqGMl?=
 =?us-ascii?Q?tieQfXZE0TufpTxAJc1g8QfYCY8xL7iUl93zRVdijTuXIFf5x1kgYZ/a9aSd?=
 =?us-ascii?Q?c+lyJdVpP4VBn1CrcFvO+Uw5EOIJ5e5un9p9mj/9TB0HYGZIegZP4wgxiZUo?=
 =?us-ascii?Q?KHVlWetJd276glMwn/UntriX9Nzf7N5GXDJz4sSu9LHNhP106kJ/3z+TpYlu?=
 =?us-ascii?Q?WIIhGYeb7azQjBiftJwSFcUaM+qXW3lEwNdJKbbwWk9bx843Ksb9BN2ThV7y?=
 =?us-ascii?Q?/U/bCro+svmcENPFZYl02BIV2OBedhaOGmekA22f+HAp5uhP8gCheWnmvy2m?=
 =?us-ascii?Q?flWKx55AF3UvMaA9zThwCEltZQACeFHoMYzMY3821Jq3XU7ewfAh9qy2OXbu?=
 =?us-ascii?Q?CNv2l+fOTnbb4309rjOGlzUjbxVHZ5lFHGQPjwXkZR/qI9cmEA7MvYG71kWb?=
 =?us-ascii?Q?Ny+OYzV2Nxp/Udhdl0fPEqF/XK9PDwuTYyPXwdb6l1OKhpRglhiM7hbw8w2v?=
 =?us-ascii?Q?GvcPTdk1yPgg+Pgzj0uO5e3DTBZA0WNEntYdkt7LK5FA13us2OzkcPyXv+O4?=
 =?us-ascii?Q?8MeefbEq0PWd7vjwG8/BPYCT0V9IIEn/tp8vr5F9HSLmBTRkt3LpDzDA9SsN?=
 =?us-ascii?Q?aSoPjWNFnJ4g2hm19BJj3gv21zru9Br5uml5iTHeeXXYxgzOo3eNZH8toWR+?=
 =?us-ascii?Q?7HPo6DUILEgS8If08ltBu3wb7pUX7mkOqWDSsVQlxH2Uuc5MO3gZfcOpmv3w?=
 =?us-ascii?Q?OUzJO28liIeAJdSL0rJV23EezB5dclvU9Y3PS1KXqFFXvgkGDKHfLP1mtKMo?=
 =?us-ascii?Q?GzwZAlk9gyIXG7zjM3j4kxU9kpKdZxDW5ylypw43wP1DthhV7hOkrFdyiwC1?=
 =?us-ascii?Q?LDCTC6TmiOh1khAKPFcOzUH4NMcCVUIdu53KtQ2Wqjtf+N7/s5VHSbWuOEtZ?=
 =?us-ascii?Q?SRZwD/fi6VKRFjjfbSQ55iGA/sx/NdGbxZpl4hLFr1fleg4idUlUbN0KOG0I?=
 =?us-ascii?Q?3XwvCy5/+i4x1vKu7qptEuaKYlfOQLbndSJl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:19:59.1316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a936de6-47e8-4d35-3e86-08dd87851fdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
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
index 0de0fdd8af5b..0cd250db3981 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -712,6 +712,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->lut_size * sizeof(struct drm_color_lut);
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
index 651bdf48b766..dde250dd7a51 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -890,6 +890,20 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * enum string "1D LUT"
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut with size
+	 * of "lut_size".
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.43.0

