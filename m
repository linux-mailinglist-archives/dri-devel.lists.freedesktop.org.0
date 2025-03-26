Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF9A72787
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892910E806;
	Wed, 26 Mar 2025 23:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DdYTjB6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4C10E806;
 Wed, 26 Mar 2025 23:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsiVmNZBZFyh7nHCjlakNztLAlZ93xNAmWB7dyQ68iqbLUPqTPAnLg7/nPdsxd4lww40ixPzb/OUM0uBxkxzh8ehdJBGPOTWMuAGTsNNa7XDKhQBEzTmF5s2iwDGG49/lJocj93TObWQoGqjnOzxKOB2nzvf+dNjrJcuFKKT2XGvvpuIszYjJWto9ogreRFjUz1kcQy5S2wO+20Ghq/+p4Gjzfe1cVHs4GxeKl18V/Q05jUzMg9MqscBXTwbTZ59on51An0wN6DjTBWkY8FhzLLoPYQiJroBsqLseLLQbLoDzH2ySExu+5cm6jwsxejHsV7+WSt3lb27mgOu+hpP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDnFcq6uUXjkwx+t2yxzJKudzjSkMEtlFZyWJ6HKmCk=;
 b=l+iOQ9Mcpw6b+4xCtz2DkQxBCNw16WXKyJa8KBqPEpRiq4zbkEC4Nsc6jTg+EZSaZNGz67klSrsUhgWywr9gdijLW5X/CV2c7LHLg5D8r7e3OivlOeqzETdq4Gl9Z/PSBZDu+WVuJUOMSZa8VbVj1mM6Zwy5aCbNPtDcFBIPtt2hHu4aouJBYywupo4pqSu2+VutUDPR5YBeIi5W7IbL+uplU2Kc7QhfSUUgYhhqkO+sTGRbuUo7jpK13FAKxHwg7qdaQFnecMnEcbRvtGkxk+6tJ0+7tidsfODkUud1mcMB8oTaD4NqEViuZYW/EuLXh/6Sqy+Q915i7y7m/HAc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDnFcq6uUXjkwx+t2yxzJKudzjSkMEtlFZyWJ6HKmCk=;
 b=DdYTjB6ES/NHxUCamV41zDhemcgvYo/ppeZM7tiOJ69Dr/lVMpMVwf0c/SnNyZgPYdqkRKElPk/R9AzUjTcz9FZzl2ZYLOzNXOGupz2Edp99sZDqLD1jgl0KCp6LzMXbP9BiLHwGbHF2DXVE+zs23y/ZMHmpp0aER5PxiE/I93o=
Received: from BYAPR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:c0::37)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:56:09 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::36) by BYAPR05CA0024.outlook.office365.com
 (2603:10b6:a03:c0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.35 via Frontend Transport; Wed,
 26 Mar 2025 23:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:56:09 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:56:05 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Date: Wed, 26 Mar 2025 17:47:13 -0600
Message-ID: <20250326234748.2982010-33-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: b19048dc-3458-412e-3677-08dd6cc1c7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oEjh7esJkNrTm9YLTWfKuG/CvkxqTPBKCgDnkKS5QocAUxedNvjlu7E1MivN?=
 =?us-ascii?Q?Y6yNwGgEjetnMdWPIDod0Kil5qBWlVEafPuko4NtvauaKXuLOnRlmxPwQ8Y1?=
 =?us-ascii?Q?LCIp1CIj580hysc5QRgsPcFyZCJY/prh3gfaIMk3QJHG+pBPyIw2uoq7TnHc?=
 =?us-ascii?Q?SDmLCez9EK1NwD3qhliSMs98Vzvc0ye3No82moPQR5PHgh/Quwfik8aeoUc1?=
 =?us-ascii?Q?gamqTrAVB6OGbsHivEusjamqwsra/wo35uYpH+pT03Ls1eJ5CE41h2c1G577?=
 =?us-ascii?Q?ZkCRyFCp9da3mo0xBDKPOyt67U3w2mLkAQfFlBTr4PqI2wHgCnuZPeHWLjnY?=
 =?us-ascii?Q?mo3Ihia+smvONWU1EJCz8qd1BolkZ0OoZk9xuWcdi/p7FPor4ezTVSddFCuW?=
 =?us-ascii?Q?O+Zxik3jacmVOnAAvqFoU3uNPlmcyM4tb/dQcDVvnyaV6oafYzIpdoOYewL2?=
 =?us-ascii?Q?Ci0eC6tDwp00rNjtcpqLONRDHqg3f4w2j7u6uJfkwMZ6g9FBA+d9ldeQf8k7?=
 =?us-ascii?Q?YVDJACvg/6GpHLZOGme9eWcV2n7zonX9wkVqQCOKqQ6SrYL2qXDp7CYoda65?=
 =?us-ascii?Q?AtzKyXyU8rzDiA89NNgMPO3omghT2yzMNWEtbmmejMpl4cjGwUTkXBvtTdHZ?=
 =?us-ascii?Q?6HYQcsa2kEqELY7TxK6RNCyDakS2Nm3vQEwHGO3g83RnbHMq+ld2jYoercIy?=
 =?us-ascii?Q?q3uTTDGy4pT2jizdDhmdxm3YtyZ4CsMoYnbdG4XHXYUOwS00W9qwpGtlvjiC?=
 =?us-ascii?Q?gKs1YG68unvTjkcXnASaYRvlp8+dI1ljihOlk50BlMos0XjNQv09sumxGuCd?=
 =?us-ascii?Q?HDdnM9HDQjc9wi1wOIA3q/yl6c1RkXmTiZvsAVrv5uBwVqF/FGoqaPQxB+Xg?=
 =?us-ascii?Q?m3qW3SGiHIHIP4ly61Cf42g9Dw0rQYy/KdQ5WVZlgJ63UcGEcOaLWx9Jftpo?=
 =?us-ascii?Q?GGNRy9hbta5031j8iO/X5PBpX/ieUyaodUQG9MJLj5XxfoC6+HNjynKWBUHa?=
 =?us-ascii?Q?w9HJI3yJ0tpvHxrYso8H6yNrHxpl6gEjvyGjJLjYhfI8HoAnSNsrAbbsOjkK?=
 =?us-ascii?Q?TvuGJFNgU+6iIPU0ml111yz6+CVU+kfOyxfZtQginuSjIskWkA5liEUKdw54?=
 =?us-ascii?Q?t2YXxGoVgLXA5hphyGP0qQD7AFxVMrZO7Z1mDTFo/OsTer9XkjpYupeijUsc?=
 =?us-ascii?Q?F8OFqkz5rciuLyYgVgAjsvIIx+0yh1rr7jblzFUmLiLCufO2+u8DbqShmbAY?=
 =?us-ascii?Q?Yi4LZ9DKWp+PGshRPbO4+r9H3z6NLRAAAExxiILL3OIMnM4/P9WYXmN8LwrR?=
 =?us-ascii?Q?KqN5DfcfDkPLjBGGeEoOMaN28EtxmCxImcUn0Jc8KF0vqfNEIcGs1Gfq//I0?=
 =?us-ascii?Q?Y1l9HZWGNkoPBYpFjrZgQ7w/Kff/ATXEnMnD7prbbgPlIeFXh1yag0KFe4Es?=
 =?us-ascii?Q?wSLqtJU9XnOdizuHlMKgYQPZrhQKeMxj9HOdXGNg2tR/pFDVX1BuTK3YwWHY?=
 =?us-ascii?Q?SVxG8H8hIncN4ns=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:56:09.1806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19048dc-3458-412e-3677-08dd6cc1c7cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
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
index 5223cf363692..f713d177241d 100644
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
index dcd12fc0bd8f..dfd88a227da7 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -713,6 +713,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->lut_size * sizeof(struct drm_color_lut);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -762,6 +765,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->lut_size_property) {
+		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index fcb4a8d0e38d..15ffbba60b3d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 };
 
@@ -225,6 +226,47 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 	return 0;
 }
 
+/**
+ * drm_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
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
+EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
+
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane)
 {
@@ -333,6 +375,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d3a60c1beed1..d66c76033343 100644
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
@@ -310,6 +324,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
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

