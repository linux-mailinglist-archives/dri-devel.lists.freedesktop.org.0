Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD78F95763B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3323710E42D;
	Mon, 19 Aug 2024 20:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EUJl8kTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15E10E411;
 Mon, 19 Aug 2024 20:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VE5t7iB3i0S5iH1jx05Mk4r3ygJevOZYAhWzdNOdMtFgQ+fwGeygwm+465IFNnU6G/kI2UX7kQZNmDkXpH3xuG+JwANnY1BZAf+m+Lq+570jSz6Bu/haMp7HuU2cKXSqDjPr5MCRWknTQemwJpVcGpG7OeqONYfFGRcdyjCjX1yzxz9JP82Rm1butF2puo5lMajPEbUVFJBd/fPIb8H7ZaB9WGLwTPdXNyJiqNLUVhGlv5hSIm7dF6cCdgHV5CE0idJjvp5wPOWAMmwMRA6gNROXKlvdqxnG2d49JDTUtKgEC8PEown0D3NPYRS60m7TioI0Ljjs3Y8Riwz6+wgZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD+Md+Xmz0dN6mvK9Asf/jp47Ub+AWjKaK2RKwEUD04=;
 b=IboVJkmV9crXVdYyENAwVKD9lOKZ/PH6hz1lrrr85D3MRYtWA4iFZlEfuTOh43cBhweqUNoo1Qz6QCX4ZPYIP//3Wgv6H78NiE9ymzqRupURubaX3aRf+AZBoeekP4t346IhSovd2sA6MbbVUlQO1f1AibG7X8gAD/EYyPShM7c4Q5a9FChfhhs0Fhbvb2JmqXw9zTcVH8gKkVOA5kpZUlQtKx6nEC/7Z1ULnqba37vZIiZSU1BdzraC5wWOZkHyux/0T23nV15xf7KfXF/eAw8VqNguiw7rs8Rz/1IL2ZTram/vuBzn8HnV/g26GG47g+CIPLP982Zaduar0hF1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD+Md+Xmz0dN6mvK9Asf/jp47Ub+AWjKaK2RKwEUD04=;
 b=EUJl8kTzzYR6bYv810XJT7SHUbjZesqzEjI2iH6PlyqCMuswjeOiOYQlhpcR4yMmfwdafMuzBf69MrfAbT5GRDSrniqzi+P5RUpiEfzPd9+IsfaI5sJBuHDDlJRr2ZVCJbtc35qH4l/3Y3IkfKex8UERsuuRyNW9Zc9n2J2fEDg=
Received: from BN9PR03CA0274.namprd03.prod.outlook.com (2603:10b6:408:f5::9)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:46 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::eb) by BN9PR03CA0274.outlook.office365.com
 (2603:10b6:408:f5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:44 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 40/44] drm/colorop: Define LUT_1D interpolation
Date: Mon, 19 Aug 2024 16:57:07 -0400
Message-ID: <20240819205714.316380-41-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: e8819b01-d485-4b9d-a6ec-08dcc09193e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V+nCeEFB/9eflWhlUsoXuedHIDKhK/gD7LHPng3OhwDQ3l82JUHrtfCcCs61?=
 =?us-ascii?Q?5Y+YTnN1Bqwv+gdGHEAWSSnSqMqPWVTaAx4zidB0lQ97ODfBmw4Fdc5wQwNg?=
 =?us-ascii?Q?jsn+6owxszJdUOu6lsrva+hp9ujUQAE472h6RcUeppLebmIQqfx3cc6Td4Ib?=
 =?us-ascii?Q?+x5naxtL0Fn5pgRr95eUmbJvwlUDvBryTpmInuFxdHPW3mR4cvaALnYIv3EA?=
 =?us-ascii?Q?U4p+t8zqN+w6mYUnSNQhDrJhrq8WcX3t+A905CDgukG/Bh/+YasZE36YCaiT?=
 =?us-ascii?Q?AhzG+ufuwNFQmm/inqPAZY0xs9502JEZt1zaODP2/2gA2e57yyalXw40Sose?=
 =?us-ascii?Q?Y561VINNFDubx90F/E3xUEAnfFfxDisQ2/ai1B8TkPO+IoV5C8q4NPBlofJQ?=
 =?us-ascii?Q?8tGGfRa1pKa8cCWPDdigkWiEHPVCJEtz9IKAfh0Alx+mKTThCJXWtzjt/kg0?=
 =?us-ascii?Q?zf9tTMUdNTVxMycm2Lq3/8TtlXJMjDJy4qznFqJcANrcDsiw6piwSybMCT6e?=
 =?us-ascii?Q?pyuNV9cD4S/099KaKJjafdVnGhklJrRUcHju7I2K8TgAtYr92fNHtRUfv2FP?=
 =?us-ascii?Q?CeS9T2S4JKHKdv+dGEVXmwPUSMZEhK4R1ufd3Iq2x4609pMjMtRC5QeSDBo/?=
 =?us-ascii?Q?We8QcMvT3YPing+m0XeG+4nd1PLubFdffKOo/rVXaUMxAVPGuJnP1J3dfKwF?=
 =?us-ascii?Q?Jwm5LLULO9f+FczpcbQGYbL9ZcD/yRS3aczyB78b/4BgVcY62U3ETRp0LGS0?=
 =?us-ascii?Q?CHI9cPplw33UJjNYnDsOKqMebfEPsXv2dyZEdcxGbRwrrV8OEjaHU+gURAyj?=
 =?us-ascii?Q?mOzW0WofWKv3sJ6h9pvtvrrtbjjV2CpQ3XuUDoOAdx3CTF5xpnuSP0XH/zTz?=
 =?us-ascii?Q?CIMHeSibivTF8C3MjxbceLOaujcQRE2hzT4stYap+1ufAuPS2wwkY5gLeHl3?=
 =?us-ascii?Q?OAWCXhKOqKBCCKKOWI57PFOVnDxTqcNFz7O9dqVFn/uSLWB/ncpubVsulgmv?=
 =?us-ascii?Q?HqF8QryoS85ciSc4dAVElkF2+DnUwizqvhFI3lol+btIfRohC1IU5EySCtjT?=
 =?us-ascii?Q?N1mV5ryt64JDcZIM+oTZCMOq3Qo0vRzf8fQGuU6E1cMa1+498hn+n3GHZ28a?=
 =?us-ascii?Q?JXjQ+P+uaS9AQv2Gwl/roUxbVzQx7j2shZUXKDVho2eyNVmdSJqu87C/YSbd?=
 =?us-ascii?Q?+wA3zOALQoSqAD7CZqLu+BZx2bLzgrK9vDpw69kBJURcmG/iEgaRetBwj6v8?=
 =?us-ascii?Q?C87cu6gpG+CdosnHbwJA+tptRbZqRafJgDnzTqdMjcLe7Z6RUcKLu5x4ZbCS?=
 =?us-ascii?Q?R+1GXu6kRSxvT4uqq26uWFqPexN7z9y4vvt8bt+ZHBc2Qxyy3DbW3IuyICjv?=
 =?us-ascii?Q?8chaXRzP6tnDYAcSLJTHrDXJKerBxqg9XIXpaiw80ysoQOXbmG5HaO8e6cvl?=
 =?us-ascii?Q?hdc4y6C95IuJkPhLeCE7lNppIGywm281?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:46.2751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8819b01-d485-4b9d-a6ec-08dcc09193e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
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

We want to make sure userspace is aware of the 1D LUT
interpolation. While linear interpolation is common it
might not be supported on all HW. Give driver implementers
a way to specify their interpolation.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++--
 drivers/gpu/drm/drm_atomic.c                  |  1 +
 drivers/gpu/drm/drm_colorop.c                 | 36 ++++++++++++++++++-
 include/drm/drm_colorop.h                     | 19 +++++++++-
 include/uapi/drm/drm_mode.h                   | 13 +++++++
 5 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 8a86849e1529..c85e344eaccb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -121,7 +121,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		return ret;
 
@@ -151,7 +152,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		return -ENOMEM;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, op, plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 2ab797e9d946..dbb8776ae433 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -798,6 +798,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		break;
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", state->size);
+		drm_printf(p, "\tinterpolation=%s\n", drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 9634effab73a..47a9877099c3 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -77,6 +77,9 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
 
 /* Init Helpers */
 
@@ -233,10 +236,12 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
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
@@ -255,6 +260,17 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->size_property = prop;
 	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
 
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
@@ -407,6 +423,9 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 {
@@ -424,6 +443,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
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
index 09e96b9a8eff..1304b19c96b5 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -238,6 +238,21 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
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
@@ -306,7 +321,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size);
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -360,6 +376,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  * const pointer and hence is threadsafe.
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 8e9886200f4d..b64f9515bd0a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -916,6 +916,19 @@ enum drm_colorop_type {
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
  *
-- 
2.46.0

