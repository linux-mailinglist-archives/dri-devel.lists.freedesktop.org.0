Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B51C5FB4C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F510EBCD;
	Sat, 15 Nov 2025 00:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zvFaPwyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012065.outbound.protection.outlook.com
 [40.93.195.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD9010EBB8;
 Sat, 15 Nov 2025 00:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQms7hjXigTU09XSW3lMJckxTrabcxrQvBCEGXvZNL8J/5FJI+5nk1FJY4NovZrQmhppAVmMDv7SMNms1XzzRVZvX9/xMcgWz0vLbT1h3Fhok6C9U7l/KX+i4ICa0rRzGUYki0dS3tkZdC+leJNnYiuSodf8Orif32jscaNsoDLepnNYhYC21a5VsL5+o9rIv7n9F9bEe3zIewoGlypzRN3va+kkvclOBp79t3LwHlrmWr8xoED+AANBwJaLh/jGGn9USBBcSD8UI1vtKmAMXJ5MhBMKChcvAGzREqNjnl1XHAEhxgGqgu8pd2kNOvPUYbhPURadpq9y5+e3g4gIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs1fveSQUYXNW3z09Vu8BTulv7l47uoiM0o3iptb1QA=;
 b=Y1co+k8kVwyzxS5JknGfQDvZaxy6e7JenKAQr/HEGvuejkqDklXorIOxMpQOm4T4I7B33KGlY/GTOISX6icfghwXo39WcOyp5qcW7vHBIz1AnF7yNDJ275oYsFirBFuz7PYRUyNBl+NnCJxVqC67O4rdNRCLnKvNbloTgrAZpV27MtuUkDgytH0hYy3FeX3xUicPgiXj5cWQkxih1qor1EfvwVF47E+V2/sp7sWQGPzoENAQ35xZoPE0N7LbL+DixyAyd/wN1q2bsB+FOBK5B7Lf0zGK3LJmQzticzass5TbBhmuBB4oYMnRxQ2EUMckphbkXHUsfq8DBgMOppHwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs1fveSQUYXNW3z09Vu8BTulv7l47uoiM0o3iptb1QA=;
 b=zvFaPwyd+NAK22unnMkK7uzX1Dwm2woPMqnCVSvwQQjo+jl9ln+fGSmr/QHeoS1HzcbjSMglNGg0Fc7j/8D6URRKR+0HdfXQ6jQ7M4bDudoTGlAx0+TXIaDMY18gzJYOEAHT+f9XsAlRflJ9vsoma/XW9w53h5WSwDVUmxIDnJc=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:12:37 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::17) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:12:37 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:12:33 -0800
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
Subject: [PATCH V13 37/51] drm/colorop: Add 1D Curve Custom LUT type
Date: Fri, 14 Nov 2025 17:02:02 -0700
Message-ID: <20251115000237.3561250-38-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 70865860-4740-498b-6349-08de23dbaeef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2BdxTiMbnPCF8p58mZekhBO0EQ/D5IOczSJmi6UY9hUqSM4YpnOA2vZsDw36?=
 =?us-ascii?Q?d2Y8s5olU4plq+SyCskR2n84zmZRvZlDgq93vNWApaLRo0Q0YrarSwjo82to?=
 =?us-ascii?Q?q49wMR/0LX5QE3qhmRd8HrB7V1hls03XO+Sp3u0efy6u/ugExA7ZZ2dY17Qe?=
 =?us-ascii?Q?owKBrI9I1/PQZ2nujc5KEPDaHShLa71Z2VTjq2mHTMuNPOvUHXM5RlumVQjt?=
 =?us-ascii?Q?9dtNLLRiULMXLfo+06CpdWtEH0WcoBcvX6/EMx3bbuGStEKZt/hnSj5DytGt?=
 =?us-ascii?Q?vrdMZrBVPtrrDVWpxmKPNzmUVDSFJ41dspeGZc/uUdF2wOUkEqkojKrUwv1U?=
 =?us-ascii?Q?/udnCmK/75ePeoLWBdfOk2wNjaVKk/Wj0uusmmmiN0p0LR+ODl3qHrUY2lvI?=
 =?us-ascii?Q?CSt9LmVh5A0n/42EySdxeer34b4bXGTK83QR5+2MnoK9CbO9qv3J7enSfCLP?=
 =?us-ascii?Q?vNZQCV/JQjlVQeSuoY3Vg0zRaNfp5tOy1390+KjRXF6YyMwnm4M7YVJj2IPQ?=
 =?us-ascii?Q?5YEcj+bpVIm2FpN1KjRVmui8CRe8J6bFYJ8A/8QtHZRbS8blXIYaPkPeUL3O?=
 =?us-ascii?Q?8QYpu0iTnflyndMFHde14/D8Q4OoIH83fWd0b55KKNWKuyL/LGNJBFWGSJUz?=
 =?us-ascii?Q?z+gUIzUg868gtq4+dpI7+/mj5VaF4BrrVCQjS4A28NW7uHMM7e22H8EBABD2?=
 =?us-ascii?Q?nxhsSYy6x11EM1StvE1E7N4qeu00mtbQNF27Eag+IpMO0q4erb2uNmB+OcyF?=
 =?us-ascii?Q?6bapQrhThTYt8PDEnxWsGOZnIqmhKBoY9PyFVTsTmjFeLJ4/D5WEAZHoG4Fq?=
 =?us-ascii?Q?4sMIco2bR1D51f4l2Q5oP19glDBmTQfnNoSc8MlqCPfprDUsJh4z5G5EV6Oi?=
 =?us-ascii?Q?aaAmKlv+7BnsvR28NuhLOfLVbwWxU/CEZ41yz5jy13K1CeG2At1VDlUGb8FS?=
 =?us-ascii?Q?NYamkEI4CoOg0A3XBxc+ooUvJCL/nSDtnl86f4NykwDr6eepz55WGFQrz2DJ?=
 =?us-ascii?Q?8CaHRkzc9QHViYkrEMZu1/koLoVveKmtqJvAwzeUnmtZ7M+HAGn3aU0yszRO?=
 =?us-ascii?Q?9c0qpay/10hkm+bBotQZD5cV/KTKiIABAatSoE87326j4pwVTWC/xcK/B6Wj?=
 =?us-ascii?Q?X+CRADaosVZWjJeuzdJdYHDkqMifZ6l8dzuBV4R/0j9XbKlei6GbgZcVXLX1?=
 =?us-ascii?Q?iUjJA7O+tpnSUuBwTVKLxTy6HaGRzFSHVMHWfMR+EhlpEDxPRF4tnZIKtYX7?=
 =?us-ascii?Q?qjV+ReWgO5lSIORXxCn9yNslnjik26Zwqz0zzYajeTi9BeH0gsRP4sgtbWRt?=
 =?us-ascii?Q?w+gGF3N+lTrklTH2YJO5gGjQy2uLeYGRVQPFQ4/WQTMZ43YK7uFCBjpwVYIY?=
 =?us-ascii?Q?Xl724uf0Qog/kEEgFSRXZ7lcBk0WKi0HvHnNHtEvgfpb+71a03iYkp3m/kmF?=
 =?us-ascii?Q?Q0jKHjYR9O/VuD3kB9CabnmxUKliZSOAwXy4P9pKCD6CETJRNFsQEKj9/9Xf?=
 =?us-ascii?Q?DUpRaTJbUL2R6iEoiTuGWkEe45jUjkzTGD13yiNpGJw98PpGQATadpWeGZcW?=
 =?us-ascii?Q?g5WtckGOyKp7KHrEqVU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:12:37.2048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70865860-4740-498b-6349-08de23dbaeef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
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
v12:
 - Change lut_size to size (Sebastian Wick & Xaver Hugl)

v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)

v10:
 - 1D LUT API is now using 32BIT RGB with drm_color_lut_32 (Uma Shankar)

v9:
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
index 334f791af14c..1e685ebf1bd1 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -797,6 +797,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tcurve_1d_type=%s\n",
 			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
 		break;
+	case DRM_COLOROP_1D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->size);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 75fcc95197ac..a1c956420dd8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -701,6 +701,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->size * sizeof(struct drm_color_lut32);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -750,6 +753,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->size_property) {
+		*val = colorop->size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index db41cda51296..e773259633ae 100644
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
+	colorop->size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
+	colorop->size = lut_size;
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
index 19f3778f9e9a..7f622c8a0955 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -259,6 +259,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
+	/**
+	 * @size:
+	 *
+	 * Number of entries of the custom LUT. This should be read-only.
+	 */
+	uint32_t size;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
@@ -266,6 +273,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @size_property:
+	 *
+	 * Size property for custom LUT from userspace.
+	 */
+	struct drm_property *size_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -313,6 +327,8 @@ void drm_colorop_cleanup(struct drm_colorop *colorop);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5e637ec7b64c..bec524e2fa32 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -902,6 +902,20 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * enum string "1D LUT"
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut32 with size
+	 * of "size".
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.43.0

