Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8029575FD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF5110E37D;
	Mon, 19 Aug 2024 20:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GYz9v0wI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257810E38D;
 Mon, 19 Aug 2024 20:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Om6w4hj3wOQM4Gw/B0pV/8A5XjfXOO+vS+nOPTyOw8Bqd0qDxB+f39eEI4PwCtXU++14ZqRFYx1ROGjHM/U/hVcB0htH2xUUXNgP2G4eSf6idjs6Syi0eFuGjhYpRLJBrmEOrUOqxhFMX/JgB0kMwvHYfeehdoo6hvOQHb/muOvrlgDueD8HK0r2oyZyY5/X0Yj8cVarGdpmiXJnIQRyH0TMuYVh5H4Nn0cJGfvgo3aqH5BzvtlYRIkKUvqx1KqKuUbFGSiR5cLOT6Rdpwf4xXm46bQMulJVF+nxeNk3Cx2lQCQVLs4xFglk3jzGIRa5Ua56VgG6fp7PtV6hW7bchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sY0S8mwvvAQC5Gn1VDvL/IX4l6663JUWeZt17hJIo4=;
 b=SC/X4QJa6Bf//ehkZRfAm4TUVp8ghOhhlH9qiPGKD0vx30pocmuSy764BmCcZVh0KvNfVevCyTXMzldllEt5sb6SM09WfQ5IvjPHX8eF64/5kJSL1FeCNXw/caE+8h3Kb9mQzX0wo4xGTWNLfofRwePlm8bCTpVGxzY4BvKAyCwYx0CeqxVPjONzlZD2NV2tdr8a/d4Qny1dAZRrOCF408Tf8JfMgE7TCAkGylhzw/gkdgE0mB9YwZJzqU+8kl66GZw7j1FIUkCM6sh8t2yxY/gOQEdRE41YMwhZiT44m8fbclMBq6+1cfQaesN8ocKUxTtYrPdZmC48ESFfXM+I3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sY0S8mwvvAQC5Gn1VDvL/IX4l6663JUWeZt17hJIo4=;
 b=GYz9v0wIKgfB969vck3uQ62Bgzm9kgtG+Ff/yOpSaW03R8IjQryUQBDGDSh6WFC0Y4eXrifm8fa4w7lK8XjupuTQW0xVMGH0LvZqGF5nqVPhBoa4V2AbOfVTv+dsxjFDt3KAnQaexrYhoT6yIYqfl/NQA87/4XQUbCXtlESwi2k=
Received: from MN2PR17CA0007.namprd17.prod.outlook.com (2603:10b6:208:15e::20)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 19 Aug
 2024 20:57:25 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::e) by MN2PR17CA0007.outlook.office365.com
 (2603:10b6:208:15e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:23 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:22 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 07/44] drm/colorop: Add 1D Curve subtype
Date: Mon, 19 Aug 2024 16:56:34 -0400
Message-ID: <20240819205714.316380-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0f23ec-4837-4e83-e749-08dcc091873f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UXyEasIag5TmoAa5hoiO4sxtfKxOsQ9l153nu3NcnB25Ue4H9FELXnqnj3sF?=
 =?us-ascii?Q?ZkoCcjf0EhhE2yLcckob4nWdk04b3DNEpUuDSL6mqETH8NPsbfkQNR7on1VT?=
 =?us-ascii?Q?R5JK+7LOp2LtuMJ5UBfWRqBFqDVnZ2swxNzI1ISKKsCwdBIlieyNTn7YJ1X9?=
 =?us-ascii?Q?0+a9dVz6jAdDDWnmlVHOqupJncJhudPGJHJpy7P5ZLzw2AfPn5NK/yNFDYOv?=
 =?us-ascii?Q?Lt/svfNubKzFZJ2B7/p4nMTlfRa6hCHh807PDoyYAMtme37SEZJpTBimmTdE?=
 =?us-ascii?Q?wAhxhquOAO0+Dt7P99J5mAeX6ryGNu5pYHashF4FlBkpQj875RoDulJVYW72?=
 =?us-ascii?Q?wgoAY8nmhxQeAU9OtvC0US/NLi5uQTm29YtqS//GFUsoQwdHqPzVsOM2woR5?=
 =?us-ascii?Q?xG8WEzZGAhleHjaMcOA8N+tSLKhm/ydXErTYjMjAVEb5JMDUjidR0I4okmk5?=
 =?us-ascii?Q?SCwaI4oFlL1z/he4qISvjtU6TAvJHQj2IuEkJ4pgHGHkFXJSBlw3iI7+vZSK?=
 =?us-ascii?Q?waXcvjpqkD4Mm1GjSJ7C01cxgwPP5slPrQpyv6aGUZH/5Pf/NsxC9TFflYWb?=
 =?us-ascii?Q?1DMojAtXb3VclmYiTQvvfcHAUfZsPzlSovzjYv0IBdZMhAWzhui2TXl/Y/RL?=
 =?us-ascii?Q?SCds8vBDYWiZxNJGacJopMX5mTeRLhkCLmd9cXv+QoZJy4cqI8Rt6kBPj2TX?=
 =?us-ascii?Q?OEm+Qits3vBOGSGQYyHZHgKOlGqktMyCPXyXuUqSZK265Z6dRna92PB7+gVO?=
 =?us-ascii?Q?FpkoMn8a5pofOXxkpEZCxXv2WVX/RXSKvpupSv4fURQTN/kDWStsNv3vXf51?=
 =?us-ascii?Q?oUfMLUKw53yeYMxK9a1jbXI6SZl/gL4/1HKUEqYKZGCA+5myrK4ZSIvAf+7P?=
 =?us-ascii?Q?hKX+CRGW0wSGQrKfNv4X6ZVxZi71mAsVd6WGujA9Yr1q84ry5tM79iaguO9i?=
 =?us-ascii?Q?TojIMlK4dL+wzxb+MwA4K/5woQrtfyVJJO3vmBbyJcU8UuUUSGUE75ppN0NX?=
 =?us-ascii?Q?hJh7Tu11F5PJRKeJuT7rFADr9tvZfHETRhndcwlJ1nV2a+n3zHIoThhNTc8b?=
 =?us-ascii?Q?pmN8xPp24TVFtndXfj4EaCXbL+ctK91qXiZ/PhCMP7jb7IGBFQRK7I80u7o+?=
 =?us-ascii?Q?oQNroqyL4AGvRWqnm9nguuaxY1hifZr5IZCIgWGDJ7pEeRBAMMgd8LbXZLgo?=
 =?us-ascii?Q?FxxGPYBL1sXvqmKPdpZdaSomPQWNWgk6s+/V/x1Y2yeOPGlkI8GWpsO1bc7t?=
 =?us-ascii?Q?5BGWFAiyZMEUu6OkNhnGG2d0IG8mfI9b9Wz/9h5hwjMb7vGA6lKItbTD8qbh?=
 =?us-ascii?Q?MD2ZPmhU7FIcKg7LR8rQlC2fCr68JPYz6cNNJJc8ayLzxi1jFqc0puubafGX?=
 =?us-ascii?Q?7hm+o3Eohh67IUwH2B2vTaYaUmcpLV4AYMCLFGb6wESSW4Mi5NrsAAt0x5tF?=
 =?us-ascii?Q?cjtD8+Y81ki5KEAcXFcJ0+W9UP29gknC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:25.0889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0f23ec-4837-4e83-e749-08dcc091873f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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

v5:
 - Add drm_get_colorop_curve_1d_type_name in header
 - Add drm_colorop_init
 - Set default curve
 - Add kernel docs

v4:
 - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
 - Create separate init function for 1D curve
 - Pass supported TFs into 1D curve init function

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
 drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  60 +++++++++++++
 3 files changed, 207 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f76a83d79993..b867bff49f67 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,11 +648,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
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
@@ -662,6 +668,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 79af42b349a0..98d22ac163e8 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -30,6 +30,123 @@
 
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
+static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
+ * drm_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @supported_tfs: A bitfield of supported drm_colorop_curve_1d_init enum values,
+ *                 created using BIT(curve_type) and combined with the OR '|'
+ *                 operator.
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs)
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
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
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
+EXPORT_SYMBOL(drm_colorop_curve_1d_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -69,7 +186,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
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
@@ -113,3 +239,11 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
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
index 75ec3ec827ac..dd6943117461 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -30,6 +30,39 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+
+/**
+ * enum drm_colorop_curve_1d_type - type of 1D curve
+ *
+ * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
+ *
+ */
+enum drm_colorop_curve_1d_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
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
@@ -39,6 +72,13 @@ struct drm_colorop_state {
 
 	/* colorop properties */
 
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
@@ -109,6 +149,14 @@ struct drm_colorop {
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
@@ -132,6 +180,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
@@ -172,4 +223,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
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
2.46.0

