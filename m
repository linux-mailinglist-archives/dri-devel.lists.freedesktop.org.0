Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD26A72795
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEC710E819;
	Wed, 26 Mar 2025 23:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xL7VGDIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E4010E819;
 Wed, 26 Mar 2025 23:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZXzFC2vAQfvj6xMeKxZfd//qZC8uybhIYkrnC2KPLg5VXyjV0qkkJqhn81XdkinP+kV4RrnXD+W6qBN/D1NH5p46d4unjS8NqjnewPEk2FoVUjz82t3lXo43Zmjzfq8qpa7kKWiHyHtNBdjB1ZPEgHYEEBPadpxehDuSVvvNxSjz+e6ck6UDJPjczeaygBm6YHUaPPrk2MKoqqIFJFTGda1sPFCrmbIg2UfYpwmV5UHyqcfFKD+ac0kRe0a+WmX5nxNpIQAs+oud06rFpVlFFU928GIDHLdcR6HCLnFxInOrtrmYn6YBvSFgtzKtklx8hzdtoQ9dpkymAjgrPlfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDeVycN69tDJsbvfLagwKWpBltrh29v4iIx5NZsowZo=;
 b=iYoA5LhIbiW4vf5dhFX6wt1whe+fMRNtKn2RYIpe8PMnh3I4dui+abIPRGLW8m3zvaobY/uJSuW2hGbyFa5k3CYbujtm5QhvXZnGpVtQo8ljYqLnoQxSMb2s4CnZuUAeeHH3FASnt1j39bjd0UniAW5YLvCOdAySjIhjm1dyYJnAbpUd1oapdwFO7ljFxys+ZXC6LbRO/p8uCx72m4Oc3yRRqRc5OMuj3EKhLfYFuatZzK5Crok/tu98d9AxI1+A41G8kiomRttypNHFIu3GQiI/DzdGnFI/I+JJYQ2k3Vaw8mNUmh1nqe5NKY8YrQatiWzM/dPi+cASerbWD9wBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDeVycN69tDJsbvfLagwKWpBltrh29v4iIx5NZsowZo=;
 b=xL7VGDIWtLoXBSX9rs70g2p35ierTZE5UC4pCF2CSate3uXuI1QK9OueiJnHWL187ghyL5CYkcGtHtPEbyOA3jdXuBWdTU4lh5iSmecZasmzFwNnEeGCkJ2wPGwBX6TIXyUS01on1Eci5398xAtVyLEwZVJKXhPzsFqOUycbvQk=
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by CH1PPFF9270C127.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::62b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:57:34 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7c) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 23:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:57:34 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:57:30 -0500
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
Subject: [PATCH V8 38/43] drm/colorop: Define LUT_1D interpolation
Date: Wed, 26 Mar 2025 17:47:19 -0600
Message-ID: <20250326234748.2982010-39-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|CH1PPFF9270C127:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2fcae7-a4f6-46e4-a492-08dd6cc1fa6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1nD3oYUSqHUSsq/7tgULcUsdjPGTwsql1oTBX+ln2H5wfZZIW9E5wWF4Vdg5?=
 =?us-ascii?Q?wEixnQ4gReU6heDhYLOEmQSBIn5nYXwXoKdwne6eBqeKV2lD6tIn16heM9v/?=
 =?us-ascii?Q?aeLAqR/8zMOeXC6wqBr5T3LZfLBtg6FddTxYvyHX9LOiQfVGi7fWXl+ApZqs?=
 =?us-ascii?Q?BGaMKYf+1xtgd6MQKJ1UFayVuq+4hifcc6+kd7hetYY6sBLvEyqIMaZkGMzH?=
 =?us-ascii?Q?igyEYvaxz7bFMTyPhEIWKox8limiOIwGi1Xw+Z+JokgGW5xWukZX3mMjOZ/6?=
 =?us-ascii?Q?4zKvqUGvjUJDy4xSTEHh+TgUHDsN1lhXX7kjpp0zyzQTaWBIpeuaBpWJN+z5?=
 =?us-ascii?Q?3Ol0WIn8uZoaY9DmhjnidWL9DjCk88NzdGj83F9TFISAlHUjFjSokjlY9U8s?=
 =?us-ascii?Q?/F4V1Ujcx0t2TKUdVyJdtvIUryEIfJRTyUCPQFEjJxdbzBQia3dQ0R0Dfd1o?=
 =?us-ascii?Q?MWqSr26nFMTFyjw6mCIgO6qiHaIHOf4+/yG/3J3LIro4a60a3pBf+JbqAC9e?=
 =?us-ascii?Q?lBf0owykFjl6r7wW2MXjUnJKv8C0dS0YmSPRyxzI0cdyyRhmDKS+XgOPNFrk?=
 =?us-ascii?Q?41c3IEw8JCtEusGYvfRwUs1crIPPYmA7YwNhWITAFb//VwEGY/oj1ryMaLot?=
 =?us-ascii?Q?mWCs1NCcm6qFprFoZOx8RRurKDVsykMYIHcq7V6TvuQAwDoiJRLkFnv5iqcB?=
 =?us-ascii?Q?V4n47Hjv69ks9WTAfqEZaYg+HMDCdjZ96mnxU8FBSRbdgnq4GZqQ25AeaLAj?=
 =?us-ascii?Q?PmxvZGs8CBUmDPP2HEOHV4mqlAELfPvbJISYXGrOkuGymQawAo9QhY/lIUIC?=
 =?us-ascii?Q?XI+XBJLTQ0yHKcv1Qu2s2ArQVlR+GP53plDckOm2SbNPrEDtYOkHFtKY7T/S?=
 =?us-ascii?Q?I3acI493eIpF/Uy581B3uZsdoIZ3K0o5ASCwS56LveJCuK2u/Akva/HU3P5H?=
 =?us-ascii?Q?7f32ObpqqLugTUT4gWe9HO2ZQ0+DDJrOTy2IAwgviO+h6wtUqo1Wi6U4ohcA?=
 =?us-ascii?Q?/m1biZE821HlydMgxY164KUYCIsqLPMZi5mXSWmNBjJYEuAEEhq/+umMqZO1?=
 =?us-ascii?Q?c0U/vybxQ8ajXDsGN47jMc62+PRxzbq4j85bDC8dldZy4f/ky/QJ9l/kYtnw?=
 =?us-ascii?Q?/ytWfKDLbCdstxFKh04XkQRV7DCREGs5kNIjqhIS4OJOovgScT0zgQBNMo61?=
 =?us-ascii?Q?9/+aVwc4BTgBBgMAlJERnZGwTFeNLr//hfLbFSj0A6HnTDSEZLhVQilFdNB7?=
 =?us-ascii?Q?qK739y9dwQV3pL79ZUeNc/9XZwmt1qKIQBJI994xfQiEte+4HvSRlWFkAd1+?=
 =?us-ascii?Q?IRKUhT2xqOmbtK46812U74trL8e6SgAMkGJvC3qfJLErcnMxIKBB0CJH6PpS?=
 =?us-ascii?Q?ACmt7AquxswdsYh62GBODVdl6PxFfKAOAXOTnH//NrmW4+KuN8nR63JGlako?=
 =?us-ascii?Q?KMhTy2iTOi9nwfUarlp6iS3Iud32ohqTUuHiyOvtOxWDllHOJRClckmISHFk?=
 =?us-ascii?Q?UDw4MHAOaoPzM24=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:57:34.1180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2fcae7-a4f6-46e4-a492-08dd6cc1fa6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127
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
---
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
index d0777691862b..92c9f3fb0254 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -131,7 +131,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
@@ -163,7 +164,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a04f1c98fef9..9420fb9b8a46 100644
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
index 45aa7b059e35..7360ca4d2325 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -78,6 +78,9 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
 
 /* Init Helpers */
 
@@ -234,10 +237,12 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size)
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
 {
 	struct drm_property *prop;
 	int ret;
@@ -257,6 +262,17 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
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
@@ -411,6 +427,9 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 {
@@ -428,6 +447,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
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
index 159e6d52e8b1..86694d45d1d1 100644
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
@@ -339,7 +354,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size);
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -393,6 +409,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
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

