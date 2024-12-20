Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E859F8B50
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02710EE6C;
	Fri, 20 Dec 2024 04:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o4C0KTzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998E110EE6C;
 Fri, 20 Dec 2024 04:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zx3BAPOScBqxwa6iVP4TRe+wvlq6z6aHRx/w1SQrZYN1R+OUQXHUd/TjsQEwvrnThWeMsCP+LlpYNciahiOVWqxiaXyxD6bTyDl8y7+CDZDDejJIGr2zqCzlbZv3ASSRzJtxav8gDm6KW2suuSJKZi3kFShpDJ9/gOIlUPPsVXj4Ca1L+W9JW5UECwleBdcYuWu/ivtDq7dXn0t4G89eEElAsIW14LabHuuqrEuwS+jtxf74hyl/RTOfgkm9Rea4BDAT2NXkdZhvziROwCBLyRBEC8bq7FEBGYVITGS6/6z7/nJdXRN37MIs+3nqTKmhgGP+XVleYBFaoc96NiUO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43wRQF/ZlXVsYorQP9ecXCepAFkYBzkmolWpiaKFJIU=;
 b=XWwD4UKKajEF0tsOcrpyR+0Tg5Exa0h2uKMLgeGiTvbRsSAIjjaWgrJ7GB8YompiA0jsGwvEYAB3DpWtzaHdfhwKW9Y17Pc/zjc3U2aBT0bQ3jeYQNCkHtJmHdOzTfOj8pgVvjl2S5VMyf9fAHLfqEIL5DbQGdxhXUlbtP9szJ4U+bLosVapUrJaAAOO/zaIzLxZpCeXsgVJPg6z9UmcCJGEe/SiTiPuaaHVDXyF138HJeY6SIfF+0VF4NBU73nysS+M3ZpIZ40hniUJ/3vo26l9lRUG/gdobWD7A6sHdOVz+7qlEMYtTaFXKeurI/riba4fX1iNN850CQ9Z+oZeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43wRQF/ZlXVsYorQP9ecXCepAFkYBzkmolWpiaKFJIU=;
 b=o4C0KTzQ41Gz91Q7sYKJWmh4QX+2Vx2KaMRYDusbAvIee9KXbElJ0ZYJO1Fgjn6poScEyx/S7bPCxDkRckTSgHcdJwy9FDC4TpqDbnXYLVQnpaEl6BvDfw6q/zzxC/p1+RES2rCURcgNGRMR8nunm1FFbM6D12yoqnrJnEIqYko=
Received: from SA9PR13CA0146.namprd13.prod.outlook.com (2603:10b6:806:27::31)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:37:26 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::8d) by SA9PR13CA0146.outlook.office365.com
 (2603:10b6:806:27::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.9 via Frontend Transport; Fri,
 20 Dec 2024 04:37:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:37:25 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:37:24 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 07/45] drm/colorop: Add 1D Curve subtype
Date: Thu, 19 Dec 2024 21:33:13 -0700
Message-ID: <20241220043410.416867-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 966f9385-f0f9-4575-ef56-08dd20b00108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VpyFVbPm7VmnJU0FSfZi4cGrPVgQp5OPxSRmmPHojVKuziMOVagsut82lfhX?=
 =?us-ascii?Q?gImHUAsUNxWm7FEUkP8bxRi46V4dDrk3z/OdQ1KHiq9mGmtDu9ylzlpxBpra?=
 =?us-ascii?Q?TBKCkAeOqVSTUpR34yQBnVDbnyogQsdd2ByS7UOfkkpIfLVpmwMWtLN2JmYD?=
 =?us-ascii?Q?w03nekITkQzu3CYLyVHeCaPSMAMsgoVI7307wTwUxnyKfCf2Yka+I4WwsdBG?=
 =?us-ascii?Q?11fYOm+AX/V065fM1KX3hEnedKP73uc9FrUfN6Akjc0h9AR5c5cfxYMqSlAj?=
 =?us-ascii?Q?HT9wHrxBZpD+kJF0ZRzdzVclY4XLRprTEBGXm5FqYlu3ts6ZVSU6qivQwkk5?=
 =?us-ascii?Q?YxNFgzoN9zI85p6zTB0yRfLIB5OTxUkbYg5KJWj0m7XJwDAtSrSfgWWIldCY?=
 =?us-ascii?Q?xMIn4sdrdklHoNOd6CFxAR+kekpiFMkGyDXe+UuNZbx8zMABDKVyL3zRrkFP?=
 =?us-ascii?Q?XyjE4a1Gg0eWhFFJjWOislMdJCCuSTE4FK6WOxSBjcsqol/9/HlFXjOlt+b1?=
 =?us-ascii?Q?CteYx3likCHlcf10QMJ811OCEDmENNekxqApGPV313SN82u9j0/NJr9Z17Ya?=
 =?us-ascii?Q?W+N/WHE7RHZvZNBD1cf6Lp01R0rPWDOQ4ZDY+lEbA+8Z5k3q6M4g/g0waIvW?=
 =?us-ascii?Q?6u09CdXosoqx8tSFNqtx3dJ2uU2WdQnOa6CDH4iALjD0P33+7PoTsQy2bnSP?=
 =?us-ascii?Q?d7JsDTYHCxjh6WBsKTklCwjH7mUG/bplBja7ugE86HhOQ0oyKzhDMzV+E6wB?=
 =?us-ascii?Q?2WARP0esfkZEmOK+ehCFsTAX4Gtjx6DXYB00l33zsRcXlqJzDCiwiq4lsdCT?=
 =?us-ascii?Q?MVXuwOiAiaoHIz7iiE413DM08obE717U3s4KtYNkT/2yB0daYniX4Z+GkCGX?=
 =?us-ascii?Q?Tux/nG47eC7xfSeFTY1VN8nr/NpWjzV6B7pYxAurOlVh3mD8GYBRrwO/m0uL?=
 =?us-ascii?Q?dvcnIQnuQbqGFe8sij5L/Yltgv7FZBu7V7k/SFpT7d7GN/ktKTVM1IwZUe4z?=
 =?us-ascii?Q?AC4AmXKNhl7fsgZC7gjxFs8Rd0RGnNuQoAAUN0EH4BAm4sW83b1fdR5YCcQm?=
 =?us-ascii?Q?3V96ymuBpP95/Zd2H4SECJE1lPLx5hHDfYspmMQqklQPqvYkX1GieYGCEci5?=
 =?us-ascii?Q?+FT6MAv6o0TR8fkfStzCZraAO9M8R4GeBSn32AF3s6sSX+/+9oz9sV4rBbnR?=
 =?us-ascii?Q?IRZ2VNa1S6N/5YZ/PPpbZKLXpPUiB2EQL3RI9QMzrhEvmpFn6BVRjy53H27N?=
 =?us-ascii?Q?JPPJcbIEz7qEeVwm1crSZ4aYD59IIDRNHOVilY/tITr+y2ZY8VGA61TfVkcd?=
 =?us-ascii?Q?6rbG7TX7zvPmI1VNbOKIcBR4focvoT0jQokWCWn7x/P+tHeOtn+mRRh4Ep08?=
 =?us-ascii?Q?YCVRXqB+u2vapYNY2/NrHpnOQYkemhC4/XZBhffwDUAKQ19pAko2sda3Wfbo?=
 =?us-ascii?Q?+li2aEMkNSriWbAQh92NuSbDNhoD/tDp74eFE/7AOtxqfs0b3iAurx19p9LG?=
 =?us-ascii?Q?k04y07C9/FoOYCA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:37:25.9236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 966f9385-f0f9-4575-ef56-08dd20b00108
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
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
 include/drm/drm_colorop.h         |  60 +++++++++++++
 3 files changed, 207 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 59fc25b59100..9a5dbf0a1306 100644
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
index 1459a28c7e7b..a42de0aa48e1 100644
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
index 579e72e0b6b5..cd5a754e5d10 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,39 @@
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
@@ -46,6 +79,13 @@ struct drm_colorop_state {
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
@@ -122,6 +162,14 @@ struct drm_colorop {
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
@@ -146,6 +194,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
@@ -186,4 +237,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
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

