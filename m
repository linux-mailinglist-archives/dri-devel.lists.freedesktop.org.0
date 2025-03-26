Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15799A7279A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C63B10E824;
	Wed, 26 Mar 2025 23:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WwMCj1KY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8D910E822;
 Wed, 26 Mar 2025 23:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2js2UHcYFeNcGSNUMn3n9jEgMi2Nk6ibJJYGHePay7zaOQNMOZUxaTa3gR4tTFoYiJlKZWWvLm3S5qKacZ3IiBvxWdGDUREbvNOxFcaWF7xIr2Fh4JHcyrUg2nRxoPfOknOmxMYFTE0vgPiqfW1tI6tRyeQ9k1S4wEQD2ZOICnKhNxlVZc64/dYME2AmgkJqDRQa9c1g0Eg9v9QLvhlbo2Bkk+4fdsxg5gi+XIcrNcFbzAEcZ0Cz0YVGCsjjgrSx3Uyz4+DNHZvonFR7XcQK4ZExOhuRM8kXvQQNs6EXuurVgoV2aTndapBuQDPwOmnWhhhMDBpxdSZ2sQI/BKZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D1n9NiFmgQTHNfamUTYZq6yP/Cd4MrkYgZh7EalAiM=;
 b=hb7QOTI633jkIEfeZS2Y9wfJXn6FfUcJRfwrCDw1aaPq+Y68Coiim5OdLyRiOxFsEIVMKZrQgZR3lR5jz5vZom1ZlBI8t+nYpp6JaCzpyX4vr/sJkXRWxmWVZbqOyAFRMB2+5WsKFk6IgqNnBH+/TLB6npSbYx105akW33MdKE8yAKpliNUGd6kvI7eM0YxHgQ3Sqm2PYIq0nPn2/5a30NZJMIHdDiRnwJlaY4gk2R54wzCfB8fffeKOR80IjyfHWH9IwaaP8riIuwSRnI/E543hLsJ5BzeilebA3phPO3hUsqUBu/eFrrvyeWg0VB7u2mwSpVYlPl9CCzwIZOcChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D1n9NiFmgQTHNfamUTYZq6yP/Cd4MrkYgZh7EalAiM=;
 b=WwMCj1KYwRJ5JK/Acc+uyVVPhxmmbesKP79AqeCWjdJGAUmH+Cqhv610Jzoq7+97uaa+jMdSxtTs731UIUDmfJY9WVddn/N53bno3nSre59uTLYiX8vid1skU4WFmCvZvrCG+eFFdG8CuhMb0v+ms2TDK1Ot2mYrsKv8kogGWqU=
Received: from SJ0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:a03:2c0::24)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:58:03 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::78) by SJ0PR13CA0019.outlook.office365.com
 (2603:10b6:a03:2c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.26 via Frontend Transport; Wed,
 26 Mar 2025 23:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:58:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:57:59 -0500
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
Subject: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
Date: Wed, 26 Mar 2025 17:47:21 -0600
Message-ID: <20250326234748.2982010-41-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb39be2-4070-4efa-62fd-08dd6cc20b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hbOcM3GUO5gKHgA2yg2NhS9n3ejppjkqcLdu5tTw3NwhfIH492IoKqsGwPay?=
 =?us-ascii?Q?0rdqFheEetIFEHfEO9W7DCtpGd04UiR5XDiEh46dYx8c6jAbJMx8LfDxCFTD?=
 =?us-ascii?Q?UaOg1NaRTywaX6AoVaQlrdlykUEGlZDMP7y62fvegMU4+JDNqpXDBt9L3NSd?=
 =?us-ascii?Q?Dn8ZHnV5uRfljGINhZGPUX++ZzK7AsYfl3WU7QhdIwHbcuM18H1elZgMslFJ?=
 =?us-ascii?Q?YALMTFauwGPvMYUYoT6yduzwyEVst65IuStkozCEFnp+hua6vWnlYjvRnZNB?=
 =?us-ascii?Q?gSx57V/xyt5jo+AtsbMft7fvMwfDrDzzotdTlk/GfOr4x9r8dqpCURQ5vA4i?=
 =?us-ascii?Q?hLlAL2q/w3lhdw8O+2leYIVovnhu/53SA7sBADkyAWkcBWkUt8/8fV30XaPx?=
 =?us-ascii?Q?GEVXN1Q5Xw4tc0rCM8hNSzH+5lOBD2ZuiGIpeaq+7jepLkbFuxCyajFVeD+d?=
 =?us-ascii?Q?jf7n042XVEbmUwDckHn/xdA7Ep+OBoHvubmqTXtQsmNjz21vHBu7mAEdshVp?=
 =?us-ascii?Q?WrHpz58dITjJHwaf02QVgxtEpM2B0C4sf9uvO5KiZ46II0ljzabWXj4pOWjz?=
 =?us-ascii?Q?kiDaRGUXLQyde8rZUuKG/gdcSaIQgQ9yOZpM7/pV+hixmIyMLnLcPH6PXu8c?=
 =?us-ascii?Q?m76EJgGanEEWBgYdQcWID65JnQqoFUKYQD2HQBszXTmURkXSAG+IVhfl6JUr?=
 =?us-ascii?Q?3KiaCXMfF/jI1E86LmDiBC8RHxaiHGvaz9++dhIgnRC86mwF5L49KcQ04cMh?=
 =?us-ascii?Q?eqbqPJ9DENhIgOsRSBrF8EjC0TjXHfAkWBSgcMtfZvy4ORm7NupZmaiKsTqL?=
 =?us-ascii?Q?hBqZtNovjeUUpTqftwxU+Kws2qgXfEYo/lvv/KErQEDBZgqORZ8cT7nh2K5k?=
 =?us-ascii?Q?HCnau6cROdyi0L173TgGnSqWjKVWQITXD0Wf7xyZv9eka1PCT6+bBbngcQZk?=
 =?us-ascii?Q?7xc0bSEm+y315pWziQy0xThLmMWDqm7/RJ5J75nRCm5a2/V+tAFqe/PC7WLW?=
 =?us-ascii?Q?IY7pIE5xzrSr/ZkEr9ZEc7YSFz6ZASeS9ylKPKTXHMOIM6tse0rxvF3jAw6Q?=
 =?us-ascii?Q?0j1WNRXmYdrs902rJgnoDZIR10NLEHOWQdgKdd2bMvw0c/pdIvCwjJHfaoHX?=
 =?us-ascii?Q?0Sf3tXwYf+YG7tKUrPKwf1Eyx5wU+db5yIQvP128GveBp6We0z/ig2M5gtX/?=
 =?us-ascii?Q?Ka6j9PlYNTysfIGhJvXUj4eSFtjhL6SAh0jozdGpPyoIl3ImIY4JC1eMiNpf?=
 =?us-ascii?Q?FRHvY6JymUu0cK/wXvSxtgApQcuTQh2U3+ijb0U17G/yP1K0AoRfRdgA/8oR?=
 =?us-ascii?Q?ctpdbQmhApAlj8lTGOsiGcCdsXTSsDe0sXniUF3zEFBqX9LsCJRGdWW6cuVw?=
 =?us-ascii?Q?FrkfTk0tMGnDgfsGhnMVig/DoV22gbE1DqahePk9eECkr3/WH2D/sEW4jRWf?=
 =?us-ascii?Q?SVXH0cW9JQb5gUwR6q3t1oFQuzUv/Avpmbgvp2tuxo78ARZyZMI0QpTGbPam?=
 =?us-ascii?Q?KL5QueZedQkj68s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:58:02.6638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb39be2-4070-4efa-62fd-08dd6cc20b73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v8:
 - Fix typo in subject (Simon Ser)
 - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
 - Delete empty lines (Simon Ser)

v7:
 - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)

 drivers/gpu/drm/drm_atomic.c      |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
 drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++
 include/uapi/drm/drm_mode.h       | 33 ++++++++++++++
 5 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0efb0ead204a..ef47a06344f3 100644
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
index 947c18e8bf9b..d5d464b4d0f6 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -719,6 +719,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
+		       sizeof(struct drm_color_lut);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -771,6 +775,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e03706e7179b..224c6be237d2 100644
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
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -349,6 +355,51 @@ int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 }
 EXPORT_SYMBOL(drm_colorop_mult_init);
 
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane,
+			   uint32_t lut_size,
+			   enum drm_colorop_lut3d_interpolation_type interpolation,
+			   bool allow_bypass)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, allow_bypass);
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
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT3D_INTERPOLATION",
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
+EXPORT_SYMBOL(drm_colorop_3dlut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -441,7 +492,13 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
+	[DRM_COLOROP_3D_LUT] = "3D LUT",
 };
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
+};
+
 static const char * const colorop_lut1d_interpolation_name[] = {
 	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
 };
@@ -477,6 +534,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
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
index c89d5eb44856..e999d5ceb8a5 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -281,6 +281,14 @@ struct drm_colorop {
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
@@ -309,6 +317,13 @@ struct drm_colorop {
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
@@ -362,6 +377,11 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, bool allow_bypass);
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane,
+			   uint32_t lut_size,
+			   enum drm_colorop_lut3d_interpolation_type interpolation,
+			   bool allow_bypass);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -412,6 +432,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d76c8ffe5408..88fafbdeb2a2 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -930,6 +930,39 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut with dimension
+	 * length of "lut_size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for R in range 0..n
+	 *     for G in range 0..n
+	 *       for B in range 0..n
+	 *         color = lut3d[R][G][B]
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

