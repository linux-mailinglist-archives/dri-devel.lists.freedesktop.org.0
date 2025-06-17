Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05959ADC08C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D37310E72D;
	Tue, 17 Jun 2025 04:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TxTdLWMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64CB10E6FA;
 Tue, 17 Jun 2025 04:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsNHquRLCaG6ka/i54eNlFbSAfSO86SXW+4n8CiJX97MThE5FBhfFDXdrEPh5eOdD3YlqN7Ri+nnIm0LmWd2I8kiFdsZegR7+QeecAixAv/UNw4ObsGYAkc79A8W66Iskd9gp8du2CcyssMWSqil+OQQbVbX5OJFWSAcZLrMhMvKPbiDbHNw+G9ltZmhB1ZvZnWHpvLnCEIsrMramkvuE/HymcZ3ivBIF8k9z3V0LxjDvq6bsr3dhu74ql7sW0qcnWZ/AMAK2Pru9tbWOqMeQgSa+6gFZomai8/8yE+dlZ+BBABzCiOqeokUqaufu01Qo0SMR7vWEeV177BMsXgfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHUJYS8puIiSHKeBzLj1jJ4HrCPgsOHY5WFkGcz+hZ8=;
 b=ULgWrzAlCUJmgjnD5h1Z29/6nZSSM9vWCoZMdfij42Q/8hvuLBtcfPtBlWikz0dBQJjeIhPAiP5w30OSJjUhcIeWJl/KIbGN+yRsMscr33TYGGG+bLcxwVgHTprzsNV99cBiUQ4SayBnYWRMwXBd42xmMH162NP1YNnc9Cz/4hr/5FPrX0raIEAWsuoMCSLSSwaktq15Pu+gHt8IBI+dOuVIsIDMHeziXeG2j3pXx/dCLRtmlZr6lSBdU8W46zai5GEwmRnPIzkbaKmLsGoxTYhlM1wI4ZHKXv0PNijgxgtfAfqRiMmgWPvfqcibzvNO4Jt6cd5O10LA5Q5Tg8oIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHUJYS8puIiSHKeBzLj1jJ4HrCPgsOHY5WFkGcz+hZ8=;
 b=TxTdLWMxpebTPy7s71d4mBcDprP37CFgTlFm2Z9EXNIerkALUBBLFoe2b871s/WGhbVcwprjJWtU+1cRnHTBH9CrRLMTysqxKo+bmQgc4V97KJYDOlEs85V0naKgCQEGS60O/ejQyGAWz+K6q81tI2ctPhCPZ+3IMN6/1i9lN0E=
Received: from DS2PEPF00004554.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::516) by IA1PR12MB6186.namprd12.prod.outlook.com
 (2603:10b6:208:3e6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:28:14 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:61f:fc00::379) by DS2PEPF00004554.outlook.office365.com
 (2603:10b6:f:fc00::516) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.6 via Frontend Transport; Tue,
 17 Jun 2025 04:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:28:13 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:28:10 -0500
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
Subject: [PATCH V10 42/46] drm/colorop: Add 3D LUT support to color pipeline
Date: Mon, 16 Jun 2025 22:17:24 -0600
Message-ID: <20250617041746.2884343-43-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|IA1PR12MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: e23edaac-e8de-466d-8b49-08ddad575fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4v4En/N/yOGfJHXMRLLD3PgE5FaW9KzJ2XwV8TaNEz8wveOivc8vjZ/6iD5T?=
 =?us-ascii?Q?Jw49PHHf0cYGnR8eE3SQuH7xkq5B/6ItK7cVSAar+liWYOEYNCY4xIpMteot?=
 =?us-ascii?Q?d/eugoy9KfHAbahdRso7rJKyTGs82Z0T/El5+7nIGD/AIWv8WZmlw/RqhPWp?=
 =?us-ascii?Q?i5u/1hbETbDklqA0JMvC8uw5nSzy82Z0hucMwQ0f81Olu1sYqpHI3zPnSZcD?=
 =?us-ascii?Q?qr73HczrxXGjq9292QSeBF7GujgjSKE8kBECme5vu+iNAPa0OY6ikJPx3Ue6?=
 =?us-ascii?Q?aT0tfbBR1y6JDJNKqYJs2sxfCQIlM4BZrSSKk0wbjg8yJKWo20iqCSa4XLtx?=
 =?us-ascii?Q?A0f0lQyANPLXs5+fuDvbCzqyuCYAwPD36ROzwdEIiarnmRJDAUvy99r9R/KV?=
 =?us-ascii?Q?oQx1GxDfWXlTfmLT8z2HzoKczZEq9um0dItTHeEITT8I+S0hdZGISzrMkA88?=
 =?us-ascii?Q?CVitTzn+8r85TbLga8uFua5Xud7OaDp/lb0VonkeRUUxn+KGHDNZEF4PbtE4?=
 =?us-ascii?Q?a9/Yd+7UWTzvrQVJHrK8kZtrc+IVeXVUknFClrRMGzRgothoPf/MrUNpijx5?=
 =?us-ascii?Q?av3NkAX6T5WcOg3ADTQ3pVjiuD1hK2D5PUxrgxEWS2RheHseiIvpCLgWmMSe?=
 =?us-ascii?Q?QrnHrrwXsGQkIpbymG/n8oMacLTupfXmBfYcWncgf210IHY3vBue3seiHST2?=
 =?us-ascii?Q?jNIct442OaKsV4oIvIzLEDPy2aftk1kufThNi7DqOcOVIRBMw9y3ylfO2Vex?=
 =?us-ascii?Q?qA+W9tu+8gRxeojZIFeVjynJnwxMF6pOXgEc+3cgTezHsS1JS9x4kvj4oezH?=
 =?us-ascii?Q?J3Fz6lOWfce+g0dHrFmCU2v4wpimiVNX2oNUF9SDc8WLq0jiSQQm5BI801qQ?=
 =?us-ascii?Q?9jejfuyFf6d0mRcujv5yz/tJZCYLbTOj1K9cDWdf+g+pUyM0mHh5+bBny9DN?=
 =?us-ascii?Q?uBY6iriCdnw11Sk7KnGJq9oI5Lwd20f054rFoF4jyhxHzmW79XYVEzr5SZ3Z?=
 =?us-ascii?Q?fknqIPTlcr/HEeOd7yKK++iLjZ2GylL5UVxp4kOSs3c1SQ/TMfBLh0kvrjph?=
 =?us-ascii?Q?0BdW8GRVsUm5jG3CFAKdAZu8xc1ExQ0mJEbv0UgsoO75Akfhzt7PMkjmS7af?=
 =?us-ascii?Q?3QaJHfLg1fnaFH/qMdaSzB5ig+qg5lsbgjfNNZS0fZenqBvqV5SDKu9NlifW?=
 =?us-ascii?Q?EE/ngjYQV38Nj+A+6QRI9BudeWP9a6O01yMWKOU1aukImyTwnoG7K7KMtJy2?=
 =?us-ascii?Q?T9Zs/7QhLBjWR0jQkYi90YDJH+3vvBH2c6Ui9vBcitR1/rtKgLnAUoei1xLV?=
 =?us-ascii?Q?o4lwTThrkFpemHo2bOzTCLPp9V/bj+TGmDzQT/E+EvJ5UfDtG0vmnhS1S+Jr?=
 =?us-ascii?Q?zNEgAeIUcAGBCt2enBZusWk0+J8W2XT3Ba/GtSrQW2tsL/64kKgIPaW3Z6qp?=
 =?us-ascii?Q?FzF1YJDYEQ2KfEJ3rJTAoS2GVpq2LqWKp/+pHx8SDmzEbGIYrOf7CRifj5xx?=
 =?us-ascii?Q?Hng4ly4chT2M10e2Dfpbc3rwSmjqDONNSDyU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:28:13.6321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e23edaac-e8de-466d-8b49-08ddad575fc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186
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

It is to be used to enable HDR by allowing userpace to create and pass
3D LUTs to kernel and hardware.

new drm_colorop_type: DRM_COLOROP_3D_LUT.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V10:
 - Add missing set lut3d_interpolation in drm_atomic_colorop_set_property
 - LUT3D_INTERPOLATION is no longer immutable (Xaver Hugl)
 - Support 32BIT RGB in 3D LUT with drm_color_lut_32 (Harry Wentland)
 - Fix 3D LUT kernel doc (Leandro Ribeiro)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Fix typo in subject (Simon Ser)
 - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
 - Delete empty lines (Simon Ser)

v7:
 - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)

 drivers/gpu/drm/drm_atomic.c      |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++
 drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++
 include/uapi/drm/drm_mode.h       | 34 +++++++++++++++
 5 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 41dd6a90e13b..35640154c70a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_MULTIPLIER:
 		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 40ee221b6496..828d53e7b460 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -718,6 +718,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
+		       sizeof(struct drm_color_lut_32);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -743,6 +747,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
 		state->multiplier = val;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		colorop->lut3d_interpolation = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -774,6 +780,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 19cb4ecd3033..52c08d717944 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
+	{ DRM_COLOROP_3D_LUT, "3D LUT"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
 };
 
+
+static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
+};
+
 /* Init Helpers */
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -381,6 +387,51 @@ int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colo
 }
 EXPORT_SYMBOL(drm_plane_colorop_mult_init);
 
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, flags);
+	if (ret)
+		return ret;
+
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, 0, "LUT3D_INTERPOLATION",
+					drm_colorop_lut3d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut3d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut3d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, interpolation);
+	colorop->lut3d_interpolation = interpolation;
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
+EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -473,7 +524,13 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
+	[DRM_COLOROP_3D_LUT] = "3D LUT",
+};
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
 };
+
 static const char * const colorop_lut1d_interpolation_name[] = {
 	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
 };
@@ -509,6 +566,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
 	return colorop_lut1d_interpolation_name[type];
 }
 
+/**
+ * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lu3d_interpolation_name[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e79472739d11..d5aebe46970f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -283,6 +283,14 @@ struct drm_colorop {
 	 */
 	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
 
+	/**
+	 * @lut3d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_3D_LUT
+	 */
+	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
+
 	/**
 	 * @lut1d_interpolation_property:
 	 *
@@ -311,6 +319,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *lut_size_property;
 
+	/**
+	 * @lut3d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
+	 */
+	struct drm_property *lut3d_interpolation_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -365,6 +380,11 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 				   struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 				struct drm_plane *plane, uint32_t flags);
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -415,6 +435,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index adc74aee160e..ce14e7cf9651 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -941,6 +941,40 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut_32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut_32 with dimension
+	 * length of "lut_size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for B in range 0..n
+	 *     for G in range 0..n
+	 *       for R in range 0..n
+	 *        index = R + n * (G + n * B)
+	 *         color = lut3d[index]
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
+ */
+enum drm_colorop_lut3d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
+	 *
+	 * Tetrahedral 3DLUT interpolation
+	 */
+	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 };
 
 /**
-- 
2.43.0

