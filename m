Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF21B27787
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E489310EB3C;
	Fri, 15 Aug 2025 04:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V8aziEf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0810EB3C;
 Fri, 15 Aug 2025 04:00:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5NFbVQ+WAyuhhiWrdqw9DMAEM2G2TS3weyLWk1cUYyiGO53jS23zAqN3EEszHGqVvj56P9LOkiFt0zgEFzyb0bM8N4qTEimdaJYzNz4tq5RJtliEFpXn+H6lJ8wX5V6y+y5OmvNPoDIN5j3ECpiuq/BQP52xBhrH9GmiV6ZsQKy9kEEHxpLalX8/E0M+g/FznnO0X2cHeI8k0wCMFo6We/2x4Nd2dGqP8TJPW48pjP9jR00hkR47GMZNEsE8/EuVCvTCPq+dHublu6alLo9RkYZv8/wnkgcus5OLLsJa8/+y3Mplo1LKrr0C4T/cJ8++O/83l6IIiVvV394fSl+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t78asFOAXoJ+24LmxfebgbpnBH0Xrq0eJpyhPFU1DMA=;
 b=wgR/hHsEbGk3o5akEq6mMJqJ/6KWd5uwksno5LjqekujaAKZ+M0E+eNiUKnz4HJoBgTPU5KLJCn18oHJygoTX3iAFppwLVxLFGZuwrEJwRYshNTuL7WfLJ4I1mqz00vJir52VlS3dDaVxQc2l0NzsCD3+vvNDkJu0WMU/FIpnkRbdkpoHsqix1NurXV2fOApmpdaH6+noeNeKQLuCyPi7S6kdx2ZyQKH5I37knVHZEeaEThOnOgrmsbMLsmVV/qAKUM3wO5EsYwqXxkc7QtOQy/XzIquRycxRYu4DixD8RHvhmfwpfTgBvMl3+53IoFb7c5UnDvhf1nHGxpjG19/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t78asFOAXoJ+24LmxfebgbpnBH0Xrq0eJpyhPFU1DMA=;
 b=V8aziEf+FfMPEsu+gzm14OsHTNLiRRUd926pMLZzE75QtZba/UV+eQqwj0JIhLx2F88GwNNXu0+DvXmaKkCidoPgHEjcEmd8h68+UyzTREMitDY9VTTBL0PIM+k0kf3vJD8ARikFfCvop3gH2psfYMcK5Ez3imZ7NxWl1LZRfY4=
Received: from BN8PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:d4::28)
 by SN7PR12MB7225.namprd12.prod.outlook.com (2603:10b6:806:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 04:00:47 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::f2) by BN8PR04CA0054.outlook.office365.com
 (2603:10b6:408:d4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 04:00:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:00:47 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:00:44 -0500
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
Subject: [PATCH V11 38/47] drm/colorop: Add multiplier type
Date: Thu, 14 Aug 2025 21:50:27 -0600
Message-ID: <20250815035047.3319284-39-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SN7PR12MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfab446-6044-4ed7-cbbf-08dddbb0511d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4nFYDiHZUo4+Zq+A2s8uGY3wXggkuB8bGWy2XMhXL2rmys2Wl2MRoDLrqlZi?=
 =?us-ascii?Q?9CRz45hCeWKN1I59kCv7NeesJ/JhDeG9edAxp97vJZmx8Hj8QVgT4d6ddDYQ?=
 =?us-ascii?Q?6V3fSc2wNcLQ1YT2KLtEXtJa5QifGn7VTIyluSHzJFHuvGDh7n4p+CXspuiF?=
 =?us-ascii?Q?vY4GNsDRVSJAO1we8/v6GwJ+8BtfByPYNf9Js580pW1Dk00O1r+ugVjGT91T?=
 =?us-ascii?Q?bm2mUWm/g90jwIosFH1XQ2nj6LvNzjuB7f7h/tZTo9Oksgveexpv6t50jm6x?=
 =?us-ascii?Q?YZghyA6bEtZuHMIChkkxfjaz5l8uLqjyCxeA6dIrHtv6VkzMg6EpgsSjCovq?=
 =?us-ascii?Q?0ZVYxXn7ZYJzC6Md300hTDRH7/2gROSiVTVeqBPy9m/SyDfLCV39y7BhQW2H?=
 =?us-ascii?Q?6QCCZP/nQzFDEi6n2X9SBSBPon97hbS3f0uajYQzlPa2m5PMUEiT9ftSa+wf?=
 =?us-ascii?Q?wPMjrH+gtKg78xeYGUlKPpj3KTuZuDumLveut3+RjvyqCOXJlt1NsZparElR?=
 =?us-ascii?Q?Mgm9D4rwXEkexchddzIsZhr+E0/tQWHwF7eTZAkcrfM47xLP+KauErl1OybB?=
 =?us-ascii?Q?JM8LjdALq0jkUGOXJrSSwndkD2KxyjU+BHkvBmxIZwvlBUAu0j8LBX77sIxY?=
 =?us-ascii?Q?etehebKSWKxGTWLxaT5nQZ5QL1TcKF7ZPvkZXD8JPFV+GFzanh9PaXT35Wv9?=
 =?us-ascii?Q?G2z1mHamK25cXcBomMvpjlzAdGBPmKC/x9B4ilBz4Eag+8FwYcv8vRBljiZI?=
 =?us-ascii?Q?aOt6xMErqd3CFY3yMMrSVezlji5Gkrpyr1WTmmzBGiVDR2LdxOEnxjii0wtG?=
 =?us-ascii?Q?vkzVKQEgGpO1xyyZbSnEAqp20RoGV9T/0B5BBjfQejSh9MAIPL+Yve+hQUUt?=
 =?us-ascii?Q?e3QoYIK3syE+GVkAz2NbDx12TRhv+okXrGk60PJfyONqaXRVPMYZ8O6Kc1kF?=
 =?us-ascii?Q?3eAG6wxOgvSR82RDhhDo16ryrkyCMzxO4gPXmNLsKDn+w/EGJQZb8+y3M/6y?=
 =?us-ascii?Q?Qqy0t2jEyLlJl5i0I1ZSlY7Fu1PoeNe3GtjXM2gjU5AGtY5mq5qHNKjOdnDa?=
 =?us-ascii?Q?x8DoJpR71+YoxOWjV6kPAHnNgu0oMifbg40EaND92h4+nRfq0Q9qcZCPfPcO?=
 =?us-ascii?Q?5rVz9b2BFzPDsiOoqxjbldmbxP6W+CMGhrHoRScV/s/WSD09T2CAO0yUiBRo?=
 =?us-ascii?Q?+X79lTP5fGhugS+Z8x0kehmoQsmVWJjIBMbUrJFxdRFl4c/n6JR2kSpU04Ce?=
 =?us-ascii?Q?nyWPRiWA/t7wuoZ9xu3qiE/htXLOsieEtHZtiMF1/0g5jbNkiKNMIvqTibZJ?=
 =?us-ascii?Q?fQdRkIUCDDn8XTweYV5TSduOlgvJc/Jz3S+PKbnGQOL/49/K8kv5mGlYGLWi?=
 =?us-ascii?Q?IIVY6oPEH/uj5o38dnBOJC6wdiEqqZxN1UDpY1FEwYDrfVIVjBtPz9hJziYk?=
 =?us-ascii?Q?QekiPXJyGf2vCLL+aHohVipQb54N4UVMHM4q6K0GHfyl/sy6mdPTf9Hd0eZg?=
 =?us-ascii?Q?BlQqkfwQEzvBR9mtFDFm1xnf07o20Wiu+DKO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:00:47.7676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfab446-6044-4ed7-cbbf-08dddbb0511d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7225
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v10:
 - Fix typo of mutliplier to multiplier in subject (Melissa Wen)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Modify size_property to lut_size_property

 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 33 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 +++++++++++++++
 include/uapi/drm/drm_mode.h       | 11 +++++++++++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 27eba485fe2b..4db0546ca6e1 100644
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
index 093635d43ea3..2e90e12e6977 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -724,6 +724,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -749,6 +751,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e799a87f25fe..ac6ef89fe939 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -66,6 +66,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -326,6 +327,37 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 }
 EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
 
+/**
+ * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
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
+EXPORT_SYMBOL(drm_plane_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -417,6 +449,7 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index fe662e0f89aa..98911ae32fe5 100644
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
@@ -330,6 +344,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 24fd52e16953..236304bcc80b 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -931,6 +931,17 @@ enum drm_colorop_type {
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

