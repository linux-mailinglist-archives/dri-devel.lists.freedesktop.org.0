Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14391A7278E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181E710E812;
	Wed, 26 Mar 2025 23:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y0GqXtbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA41910E811;
 Wed, 26 Mar 2025 23:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nip61LSs//IbW6B5cXE2xn8MgwmVyZhsJrGrKC9Z3DNINsFo6QK4rOxGTr9L0pz0BirEiiC5brqEN/ofeDpHYfv5Z9+lj1uosS97I0rhOOSMUtAYv+ePS61ka7+LIgt8b7oug/5Gyi0rFWo417/7PxFHnFnm1yqQ91YXEhgdZKHn//EGTytQr+5VAPHh4dy7Mq5r2jAakwPQx0LqkahwXd0cF9YRT6ag7sOned1y92m3/OX9T7ao6EDA50KRjtr319S4r3Q+2Bsu3PWTh12BuG69R28ny6sGMeW3bMITX/eR44GePZR6MazyoPH4AIUukmry8/VeG1G1qxRx2cL6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMCpPgcuPNocWeQOlSMpsQTqLjoUCkQTPrI25YpKXTI=;
 b=xgODOyDITCSECLg7bELkydHoy2rIG9ZhWUlvq4vbzxoDVqN2BJ6OR86cGmpT5ef3V4n35PAfHVZCIqhJ4LMe9R2g6FDQwXE5YADg1jAtBgPwTRI5GKwLpmXwBxBgxqY5fuAFmZ9lL4p6ycCRaot4AyhPdRHIh2MkNg4cfCG5T6iWxccP98rKXaQdBMr6mqu7n+MmVuM4GidHUB0xCm1CJBGn8X7Dnu76C+M+LLZZGwSKtWDL9tICI65uH5HpjyaHV8oOCwKjRLqL76BXPVq//WJ40xNzbT3qlYB3IF1ymF2wEze/oDC41Zy7+4cff2VSwcMUTsaoQahEujYDwsk26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMCpPgcuPNocWeQOlSMpsQTqLjoUCkQTPrI25YpKXTI=;
 b=y0GqXtbY4tsvULcTPZ4XAHzHhp6gRGUaBr+338F/zBIzxEeglv5K61clQCusUg6GXsBLTR5u10DHFr5kaH9o6AN3aQ1lLnccSYGu+dxohlUuJw9mNijnAyhoKFG5S+UvrooyDjiO2wZTTMGCVNQLDz/tg3fmNT3H2VpXweQrflY=
Received: from SJ0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:2c0::7)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:56:52 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::2a) by SJ0PR13CA0002.outlook.office365.com
 (2603:10b6:a03:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.26 via Frontend Transport; Wed,
 26 Mar 2025 23:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:56:51 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:56:47 -0500
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
Subject: [PATCH V8 35/43] drm/colorop: Add mutliplier type
Date: Wed, 26 Mar 2025 17:47:16 -0600
Message-ID: <20250326234748.2982010-36-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 937f5c50-572c-4abb-b269-08dd6cc1e11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ixpnXrEXGcMVeKG5bEjHBq8h9sCSgpXyX9in6HbrATSFvjCRKtXY6b2j/u9a?=
 =?us-ascii?Q?3hN6AUrfUn0lETiVvVH+BWpmtipLbowql9up8pYl1R6HCFl/VK1MC2/7ibWd?=
 =?us-ascii?Q?q2jAfopXzwu94CR0g6dUe4WJfXHKVFVh+tvADnENTn1cvI95kgF5BPKSyA5j?=
 =?us-ascii?Q?V+Tv2Iiacy+4R3R6ecLblsrIoF/P+YOX2imK0PtdgHZ1zYdH0HPE4x1XQtf4?=
 =?us-ascii?Q?Gy4sgwc6OhUk1TkI1HH3xbml1yQ/cEBUOVasa2sQ4RA6bqk0IWlLGgLlb1+A?=
 =?us-ascii?Q?CbpML2DLyHWXPmCV9147fhYsFUyEo2sL+v1Ct7hbi4JS+npQT0xeVE8voyvk?=
 =?us-ascii?Q?kz3V9D0zVX6j9S/7Q/FlQe/2WOTJkk9VoGNlsmx3WtqzCsZpQPq5+4Vgmk3S?=
 =?us-ascii?Q?cawMZCZrYTWYCusDov8k4Tc5+a1h/wSDLHEoN34dnYLuSblIaa/PJ4lzgj3P?=
 =?us-ascii?Q?lFUHuu75zgdA87RbI7kvoy11f81SEdIN4ST+Tnbqf6W5P/xFzf0u3LrdAU5A?=
 =?us-ascii?Q?MT0WOXZ3U/AYjplPrpjIpbdHdKhJjdSArt/2dZFtnBuUhCLRGRVc24oKaPno?=
 =?us-ascii?Q?aGPQ/Y9RyD5OjwpUMIHuYbvzvfKxf6NYKZbY3DjMVBGB/m1Gnya5i4P2fnGT?=
 =?us-ascii?Q?mFeF5PjhpxNNaaZbXzFM4L/MaMCm3j8CT8fhjWS516A7INCkqakOhQLpv1mS?=
 =?us-ascii?Q?X49UEvq87+sFqKxkXov3d33eEsioMTnj7qGYybFPvv8NsTeJj6WLM/lvBBZd?=
 =?us-ascii?Q?XD5lsScYTTEV4aQlKLbaKwyDMlQWJM9eyFjzEc0pUlqt0mJubbuRc0isqWdB?=
 =?us-ascii?Q?2M6OHIQcZsu8TYbuDNVU0jtLFLyXZuCoL2Yh1Ok1KbeBYFUBtOdUMNiyY8js?=
 =?us-ascii?Q?p1qKJH3/Fh+TGW/qXE2J3yMs1QV18GkyyxPf0lnZN4EWmaNNfEW5KmXiVWyl?=
 =?us-ascii?Q?Z1g1/p+hDaEIHcvoVNHqyc7tg4KgdPCQykfLgoiAzDHbV85Deu2epF1lYPif?=
 =?us-ascii?Q?k3Bj/S4Ds8jdVc5t6eztfRuS8Ew5GHUmDBApykxYoHq7uqpJ4k8+TvdtO/rV?=
 =?us-ascii?Q?2kNizqdp+RYu/yQTlVYZdSFA1O0wZYu5bvyv0sq545zV5Ouzy4a+SELJ+U5O?=
 =?us-ascii?Q?SkcuWXhOgE8+pUJZpvxp97+5iNHAiOyO0cUkh6b+jA8e+KMZA9LWSMYINcF1?=
 =?us-ascii?Q?YnsjfPULnpkF2pvm9EnESAoNGsVB0g/QrNCEWbK1bzKiBrf9vGXLTuWkkOXD?=
 =?us-ascii?Q?7RRkCpqCLcqIcVb3LVso6URdpxx+UZ6TXZADed5M4sRfPVS+8UxgEJKfi7b3?=
 =?us-ascii?Q?KFEqWo03xdEad0YVZA/iuqL7JdmT20//HzCMz+NQGrwmYZduWzJo4nYxmdgM?=
 =?us-ascii?Q?6kfeGGXtRaF+XwE9zRrlyVzf6YRBO/9OfsOXKv+HqYdeS0HkB11AiKRUqxUF?=
 =?us-ascii?Q?QoTzEh6oPLucSjwhq7Ps+5O88yYe+LNGLEbEIQkcMUyMPuJ9E+wfFMjAj9sW?=
 =?us-ascii?Q?NmdquEX4mdpjMBQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:56:51.6314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 937f5c50-572c-4abb-b269-08dd6cc1e11c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
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

This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.

It's a simple multiplier to all pixel values. The value is
specified via a S31.32 fixed point provided via the
"MULTIPLIER" property.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v7:
 - Modify size_property to lut_size_property

 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 33 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 +++++++++++++++
 include/uapi/drm/drm_mode.h       | 11 +++++++++++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f713d177241d..a04f1c98fef9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_MULTIPLIER:
+		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dfd88a227da7..947c18e8bf9b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -740,6 +740,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -765,6 +767,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 15ffbba60b3d..45aa7b059e35 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -66,6 +66,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -286,6 +287,37 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
+/**
+ * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	if (ret)
+		return ret;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->multiplier_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -377,6 +409,7 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d66c76033343..159e6d52e8b1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -146,6 +146,13 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @multiplier:
+	 *
+	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
+	 */
+	uint64_t multiplier;
+
 	/**
 	 * @data:
 	 *
@@ -273,6 +280,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @multiplier_property:
+	 *
+	 * Multiplier property for plane gain
+	 */
+	struct drm_property *multiplier_property;
+
 	/**
 	 * @lut_size_property:
 	 *
@@ -328,6 +342,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index dde250dd7a51..fa5e1ddaf4f0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -919,6 +919,17 @@ enum drm_colorop_type {
 	 * | B |   | 8  9  10 12 |   | B |
 	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * enum string "Multiplier"
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.43.0

