Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51098AA4028
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9110E5F0;
	Wed, 30 Apr 2025 01:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oErNzK4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68B410E5DB;
 Wed, 30 Apr 2025 01:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbt3xzxzy5P3AZ/YSdUTuFQJaJTAN7WHwqVrDzlLgGxFC5VKBXKdxxKSLm9HX4Hf08yrgP1BAyek5zZ/o7fks0MO+ZF+4unOgjzP9lvShaoa19/10UNqqzy95YNGblzk3UnKoSB4WMHKwmjJh0KfQ0m+L71cRAZStvMG1PMNGxWLd9z0mHAkvuIpraAK2NQYwPt2Vq5ykJT93jaqCci94NIHU4vRlbAhZ9YlP3nzlFlOsVSMGpfgrCWcOkEcJTIR9Mdk5zSZ0d1AYw2bHZVoRahPEADgQVMVKCAv3mbrGi4eySFWgcDVw9jJQeGvm63coPJ/8hxoBlpAn6I0HG45fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjBj3hmAxrBdk92iQMuRdOAGRYbfnoqf5TCuw7E85OI=;
 b=K7MfzA8mijWUUwOFVkvDBAhSKzdX9GhemY2fRuaitMW9Zs3G8GW18FvOPdMxSBfT0lM20EV0uUuPT9uE5Tnms09he6W/Umj65P59jHl57dD8rsKHlAWic7YvjlGHj5ft9wZ7BIVhzYtZQw0+EOwEeGjKZyrklmdDdQtv+MNHpx3YofKwl5iMcxLSL1UfjL8kCGBrIENqCMSTyhmVbb1P1iHDSKV2jUO2beVMYBpDovhbQOD2RMb9c4oaRLVhOagapjAMAp4xSypYYAK3czK0PEgSZ6ugqQwuOzf/RXMHC4ZGEe5d/lcE8XtQ+rWcahMshiyPRh3WyDTBac8Z1pJKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjBj3hmAxrBdk92iQMuRdOAGRYbfnoqf5TCuw7E85OI=;
 b=oErNzK4SieR3SrbCAgDBKAewHamGCslhan2+m632bSYsRTo8x08fYHnPeSTjezlV2siuKSFkJtiWpAuehmzuqiJ1jjtHsjRrTV+jYoe0O2todHUE1PqTE0RMZE7H8wiE4PJgf3k6KwbUCGG+vXjsqO1psElKrQqNp27jNHLMMzc=
Received: from MW4PR04CA0069.namprd04.prod.outlook.com (2603:10b6:303:6b::14)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Wed, 30 Apr
 2025 01:13:24 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::32) by MW4PR04CA0069.outlook.office365.com
 (2603:10b6:303:6b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:13:23 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:13:18 -0500
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
Subject: [PATCH V9 06/43] drm/colorop: Add 1D Curve subtype
Date: Tue, 29 Apr 2025 19:10:36 -0600
Message-ID: <20250430011115.223996-7-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|SJ2PR12MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fda887-0b20-4ebf-a203-08dd8784345a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BmJRLFbjL3t7giaCkJGszWr3cfV37ejEiixLCjUqvdcKzaPHdObaQUblN3MI?=
 =?us-ascii?Q?xUYk9wmuEH9zQly534pUAEWdPw3SkFn7UaLear/IWPyEIz7g1+g+wml+DI1q?=
 =?us-ascii?Q?3BQBQ2Cu3yuuavmJf0YPbPc+5TYIruV5/tqT0mecT+PIWp0qFHQpOewQGu1q?=
 =?us-ascii?Q?tIDmZsw/s3gYPxEvicJBj7oiyhclfjZktUwkM/vj3bTwewfLER4p2YWmOMdJ?=
 =?us-ascii?Q?sliNQXttxNxpdkRl5uR1z6orxq9PPrghXs2/nSJsU2lo5kz2vvYO0rehchU9?=
 =?us-ascii?Q?iWsL4mobKAb7HPIF7HqLU+GOpeh62BfGEFQa2oXK6wUIRnUmqmMbR9fRn4zj?=
 =?us-ascii?Q?WVjIvLaQFtqwDrMPvMngslBcoy5j+Ixe8zllTgxA/yUn0Fc+XGcJq+CuQ2O5?=
 =?us-ascii?Q?m5f0JoFmdtDsoxD37JIx5ZUY+fwfiGBfTmLaUDXxPX9vVTy9szavEk4g7vo9?=
 =?us-ascii?Q?4C1/p+sh67r040PNs+vFk4Ol+jyiL3+OHPncI/t0tsLRvATbyZA0DsQ7R882?=
 =?us-ascii?Q?bRzsI8iiXeQkrTA2lJBhG9+HfVrSqJfuTFgsTwNGNjjVuy7ltErConJBFIsH?=
 =?us-ascii?Q?jVYlByPV6odRKKnHETsB8KGv5LlRrhebDVv+7aOe42rzo7MUZhD0m76cBJFl?=
 =?us-ascii?Q?8gkDgatbgzefyZhhF5GUSYRiXIzRC1LCopMaw149uZAenUtvp+Yh7glb6e1a?=
 =?us-ascii?Q?Z24ct6nnyGGXdil/DFc7kbh5S3mXIg3P7mVyjFigH85YXI/INROMDHX/XtyC?=
 =?us-ascii?Q?Hjbw/a2VKM4WqhMJghF0poKf+jH/NsS9gYMz7d1PpmHpmKi3dhycUcBkul8v?=
 =?us-ascii?Q?Fe2sAdpTyx7pjs62Tzmjt0aCXPNIYN1J8lUxybs+KI4g+r4oU/4MjDJolIG6?=
 =?us-ascii?Q?ovoTVg5i98lU8OFl8chArUOigQqTtnHCmUSVuxUCM5r87cJeAaRHuUVu8kfj?=
 =?us-ascii?Q?WTD39HRPbePvffN6T6RVdqzmMwj71jczaEhKCPf/Zj82Q6aB3kSozzH6uO8U?=
 =?us-ascii?Q?Pfo/Ahmz/KYDkyXkZOiKA8e2cRgPGupAQXXml4ci87w7UR8WnAamZ93Cmt/d?=
 =?us-ascii?Q?Gnf+Snqy/kf9cBUwJWeX0QEEPDckYpGwNNL/950WFqDjVK7Fe7pJHQOBaVf7?=
 =?us-ascii?Q?5Bw388qPHxI6hGlR5dqCIrc+SFqWeXI+dxKqQUVLxxoyHv+Ev8pCS7odN8SJ?=
 =?us-ascii?Q?o/VMlLLr7SDCaLrfg8KA3PgN4kUUR8orlic0WX5+7jNLSr8PcsF26B4P8gty?=
 =?us-ascii?Q?VSjL/pmProEJSGCIkFoXwgFGRiCjlGw+kCVA+5vd7H+qNIUwx9i3WemT3Abg?=
 =?us-ascii?Q?m50lOJS2SYJGU/23HN7VY2Wuu9EIzJ994opQTltcR6CfsWC+4r6tqgfOHUAA?=
 =?us-ascii?Q?srgcfGtbNnbtb6w8/Zwzkeer/+gqmC5QNagYFV2OqGp3vPIeE9pe/Dmz5sWf?=
 =?us-ascii?Q?w2qYD/lI08I7dOkoeL3VPFcR+5IeQ+hAQ16m5mlHBdsLyJrKHaDWom4qzLq+?=
 =?us-ascii?Q?lObcDTROAimbFl61pzHtxJCnkCBFBjfox/BH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:13:23.9493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fda887-0b20-4ebf-a203-08dd8784345a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192
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

Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9: Specify function names by _plane_ (Chaitanya Kumar Borah)

v5:
 - Add drm_get_colorop_curve_1d_type_name in header
 - Add drm_colorop_init
 - Set default curve
 - Add kernel docs

v4:
 - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
 - Create separate init function for 1D curve
 - Pass supported TFs into 1D curve init function

 drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
 drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  63 ++++++++++++++
 3 files changed, 210 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 358a95065459..995f5ce87efc 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -649,11 +649,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	drm_dbg_atomic(colorop->dev,
-			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
-			colorop->base.id,
-			property->base.id, property->name);
-	return -EINVAL;
+	if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int
@@ -663,6 +669,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1459a28c7e7b..6fbc3c284d33 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -31,6 +31,123 @@
 
 #include "drm_crtc_internal.h"
 
+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+};
+
+static const char * const colorop_curve_1d_type_names[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
+
+/* Init Helpers */
+
+static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	int ret = 0;
+
+	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
+	if (ret)
+		return ret;
+
+	colorop->base.properties = &colorop->properties;
+	colorop->dev = dev;
+	colorop->type = type;
+	colorop->plane = plane;
+
+	list_add_tail(&colorop->head, &config->colorop_list);
+	colorop->index = config->num_colorop++;
+
+	/* add properties */
+
+	/* type */
+	prop = drm_property_create_enum(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", drm_colorop_type_enum_list,
+					ARRAY_SIZE(drm_colorop_type_enum_list));
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->type_property = prop;
+
+	drm_object_attach_property(&colorop->base,
+				   colorop->type_property,
+				   colorop->type);
+
+	return ret;
+}
+
+/**
+ * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
+ *                 created using BIT(curve_type) and combined with the OR '|'
+ *                 operator.
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_curve_1d_type_names[i];
+		len++;
+	}
+
+	if (WARN_ON(len <= 0))
+		return -EINVAL;
+
+
+	/* initialize 1D curve only attribute */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->curve_1d_type_property,
+				   enum_list[0].type);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -70,7 +187,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
+	u64 val;
+
 	colorop_state->colorop = colorop;
+
+	if (colorop->curve_1d_type_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,
+						&val);
+		colorop_state->curve_1d_type = val;
+	}
 }
 
 /**
@@ -114,3 +240,11 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
 	return colorop_type_name[type];
 }
+
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_names)))
+		return "unknown";
+
+	return colorop_curve_1d_type_names[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 9c9698545f63..fa167e642e0d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,42 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+
+/**
+ * enum drm_colorop_curve_1d_type - type of 1D curve
+ *
+ * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
+ */
+enum drm_colorop_curve_1d_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	 *
+	 * enum string "sRGB EOTF"
+	 *
+	 * sRGB piece-wise electro-optical transfer function. Transfer
+	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
+	 * to H.273 TransferCharacteristics code point 13 with
+	 * MatrixCoefficients set to 0.
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+	 *
+	 * enum string "sRGB Inverse EOTF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_SRGB_EOTF
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_COUNT:
+	 *
+	 * enum value denoting the size of the enum
+	 */
+	DRM_COLOROP_1D_CURVE_COUNT
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -46,6 +82,13 @@ struct drm_colorop_state {
 	 * information.
 	 */
 
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -127,6 +170,14 @@ struct drm_colorop {
 	 * this color operation. The type is enum drm_colorop_type.
 	 */
 	struct drm_property *type_property;
+
+	/**
+	 * @curve_1d_type_property:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -151,6 +202,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
@@ -191,4 +245,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
  */
 const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @type: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 #endif /* __DRM_COLOROP_H__ */
-- 
2.43.0

