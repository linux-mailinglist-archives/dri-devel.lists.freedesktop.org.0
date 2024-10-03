Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0298F7C9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4910210E9A0;
	Thu,  3 Oct 2024 20:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r+MDMY67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1524210E982;
 Thu,  3 Oct 2024 20:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN3icA5FRPPE79Mg8e1pB8GuLua7qL0ek52ZN+ef6z1pR4qdcS4R5Ui9CeDmLivFN5OckjVYCnOKBGx3TX82DZi4e5SVMDVjMJN0WmyCKKrL2o1lDPRUi4jDF6mCUI3aJ3zB7cQD7NnHLrECZIzGShhXmxczHl27UlUmkHit7yxa1x9E9upsx/Weqmi7QgaTwK49fb4wHl4oVs4C0e7u1WVEGosjuPqlOL0Xs/SXzNpa4THaKHtG6nG2lwQV9kUXhS08TpAj6jsbMdpHKWYofMhLpGc/6dko/4jnLQTpHktRINOCT1jHigRw1HSWE0abfyLIJZco9F15QwIIUaOu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9/gk6HAQZ7Rx2nc9k5SR99QPgZmkJP6xl+BAa8NV9g=;
 b=kBagvYiMGVAsJtCfnQQ4QIgOelhHlcEFdjRb9uxc48UV99Ym5khmVep/2Za6t08Jpg/IM6E0IMqt0dWDVO4QlV8r4tAe+2hkADSmXk5BWN/OCBltfzhPCIoQkwHnJpgtDeFJQacaObTl0/mOml7meRvO8Kif61mvP2Yxm4e9AXVZ+8wXB8Z+aNadt5jsm75nYl7X2V2Zr3Oo+xaobLnM5ljhqL4YkCZO5Sofhgm3tT8FtGXetgCqOnc+moV87eQnwM4AiYz153RInW6qs3UnR3jWKZPVDZlZRqnSDqrSxFcqPBXSwnSYVgXgqIgzS1HQfPo0HwFqkr85et05WfSi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9/gk6HAQZ7Rx2nc9k5SR99QPgZmkJP6xl+BAa8NV9g=;
 b=r+MDMY67poozlFBRgwGdrtV2vZPPoqSXcsLQ5M13FQXQbxuL9J8kZARt62/zN7XZejSUg3HAUOOOH/QM+6aYuZefMaaW/e26JoBIkB03UG5w58CHTiO137wrD4419u6WR77vkVe4OApI1j+C7fJM7pGoZ9ZTZM94Xo+j4CTfmfg=
Received: from CH2PR14CA0055.namprd14.prod.outlook.com (2603:10b6:610:56::35)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:02:00 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::9a) by CH2PR14CA0055.outlook.office365.com
 (2603:10b6:610:56::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:57 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:57 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 41/44] drm/colorop: allow non-bypass colorops
Date: Thu, 3 Oct 2024 16:01:23 -0400
Message-ID: <20241003200129.1732122-42-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: a2281f24-c5b7-4891-015b-08dce3e63df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?euOm/ts9XjEHMyXeWYoQskuIIUWn+c6WVCl2paNGXSKag0T0LpffrtmY3RaZ?=
 =?us-ascii?Q?yPKptuioogCDE+ziIukS92mnZzfjn2OBeUVcUgj6C1YwcsmC8KH6ls1uvI2q?=
 =?us-ascii?Q?7hsvHUqwZvWbUqUIu5eg6OApQ4aTJqoQ5N6F4hAWHAj9pWwhOMbykS4LXF8t?=
 =?us-ascii?Q?9jdewRthgboAd9PLd/qXHlUh19HwrLDfry4bhky9GlcO9n4N8MKcB3DcTIG9?=
 =?us-ascii?Q?tovrSxKYhKML3LJiO5PzoZmNujAabf85XIW6AcPhhGOjJ3zzHJ0a3jLBMsDX?=
 =?us-ascii?Q?eqY1x1YNJ64NHaPcxtmGQ6vO+S3CKv4zhhdPCkYDgN9usgqf6uanUbznBgAE?=
 =?us-ascii?Q?QKvYPJIu5XCPLU2WLLre2EIRThcwqDPdWURcOX7n2DYZA6lXQCyV5JLgab3M?=
 =?us-ascii?Q?Q4XmaH55EzXIbGDEJ/SeWI+ffHIjO0HrZd1omzibP3jAdQ2tbMZSqvHIaAVt?=
 =?us-ascii?Q?8WjdVxuY4HAtnsYwiGPqPxUCb4+vg6BH+cCzOK4KaELdF4QANZu+9yOb5wUo?=
 =?us-ascii?Q?NDW2BhHZiOXu9+bcsni/3lSQH3g3M5b/aDWnRP/FaBNMGAalhqwff/Xszwg5?=
 =?us-ascii?Q?axTolvkyw1Vs3/0MgQIeC7gZPuXz15jMm6929ZHeq+YjhZ7snfKS0h60v0Lo?=
 =?us-ascii?Q?oRsqsbvRHVXiOT18/jqDPs4qP9DXF8schGvXuak7m7eR4LzHYxsgCpWK1F8l?=
 =?us-ascii?Q?9kxTFpRrmHqrBT5jLgW2XYf46sWENEf777jusT2eNAayiBtVzvvfllizNISo?=
 =?us-ascii?Q?YZlOjFgcWlu+Gyqi6kj1JXFUnNpezmfAJYeWIu/72dk2M+eI/kqUN+bsNvM9?=
 =?us-ascii?Q?BBUGLK7SasbmHnrk0jZS9FBXGb3XKwOk09CoxJTvbqvGYTRpbLlwbk7aDinY?=
 =?us-ascii?Q?9jzRV437VeBeqLeQmr9LSrTOsUmK0qWQfihRyo9EdUEtjwmeeTJkBsuIuTlw?=
 =?us-ascii?Q?+9wN5KDFz5qm3CHKJLK6TnBuod2Jt6RbJhsCZnQMHtUk5bGiJjRkHI+Fyf15?=
 =?us-ascii?Q?svz4pAzBcH3ybFn0ZyUK6WhQJzRexpI1onqfeWctoP7w8SwUpx6w/sjHu4E9?=
 =?us-ascii?Q?ZaHLQdE91BARLyDKyQtBe01/+wRuBVkLFNAMkuo3mzHNfxsEOAqRFb1CAnuD?=
 =?us-ascii?Q?+bTQ9zvU4huN4KzqIU3KnIT2X46iKV6mdwg0Jr60WMGh97/RDg03Ej3nDYfI?=
 =?us-ascii?Q?ripsS64qPQz0Marf+z2Fm0n2Af8JPixabfWnGS1JuO3GyfVfPOQ5AjqAyDpP?=
 =?us-ascii?Q?OX3fI5XQpDLtbHtotiB2F6FH3ibRp3IKkwLQLEO3HhCSt6gQd5Q/O+8CFBTu?=
 =?us-ascii?Q?BhSuLhFx6upx7mbC97fyqbG9cT+yNb4JCKE0H2wO6jC0IJKJY9L5CDqooc6h?=
 =?us-ascii?Q?dDNXaUC0RwL2p3+kxyW7ICq+QWML?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:59.9952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2281f24-c5b7-4891-015b-08dce3e63df0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958
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

Not all HW will be able to do bypass on all color
operations. Introduce an 'allow_bypass' boolean for
all colorop init functions and only create the BYPASS
property when it's true.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 51 ++++++++++++-------
 drivers/gpu/drm/vkms/vkms_colorop.c           |  8 +--
 include/drm/drm_colorop.h                     | 10 ++--
 5 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f0f7ef6b52a9..22bddb45043a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -66,7 +66,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane,
+					amdgpu_dm_supported_degam_tfs,
+					true);
 	if (ret)
 		goto cleanup;
 
@@ -83,7 +85,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_colorop_mult_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -99,7 +101,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -115,7 +117,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane,
+					amdgpu_dm_supported_shaper_tfs,
+					true);
 	if (ret)
 		goto cleanup;
 
@@ -132,7 +136,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+					    true);
 	if (ret)
 		goto cleanup;
 
@@ -148,7 +153,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane,
+					amdgpu_dm_supported_blnd_tfs,
+					true);
 	if (ret)
 		goto cleanup;
 
@@ -165,7 +172,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+					    true);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e492a06c3a6b..29f8a8f402f2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -786,7 +786,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
-	drm_printf(p, "\tbypass=%u\n", state->bypass);
+	if (colorop->bypass_property)
+		drm_printf(p, "\tbypass=%u\n", state->bypass);
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_CURVE:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 3ad3e22d37c2..df0266734639 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -84,7 +84,8 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type)
+			    struct drm_plane *plane, enum drm_colorop_type type,
+			    bool allow_bypass)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -120,16 +121,18 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->type_property,
 				   colorop->type);
 
-	/* bypass */
-	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
-					"BYPASS");
-	if (!prop)
-		return -ENOMEM;
+	if (allow_bypass) {
+		/* bypass */
+		prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+						"BYPASS");
+		if (!prop)
+			return -ENOMEM;
 
-	colorop->bypass_property = prop;
-	drm_object_attach_property(&colorop->base,
-				   colorop->bypass_property,
-				   1);
+		colorop->bypass_property = prop;
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,
+					1);
+	}
 
 	/* next */
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
@@ -153,10 +156,13 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
  * @supported_tfs: A bitfield of supported drm_colorop_curve_1d_init enum values,
  *                 created using BIT(curve_type) and combined with the OR '|'
  *                 operator.
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane, u64 supported_tfs)
+			      struct drm_plane *plane, u64 supported_tfs,
+			      bool allow_bypass)
 {
 	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
 	int i, len;
@@ -177,7 +183,8 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 		return -EINVAL;
 	}
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -237,16 +244,20 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
  * @lut1d_interpolation: 1D LUT interpolation type
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 				  struct drm_plane *plane, uint32_t lut_size,
-				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				  bool allow_bypass)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -284,11 +295,12 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
 
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-			     struct drm_plane *plane)
+			     struct drm_plane *plane, bool allow_bypass)
 {
 	int ret;
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -308,15 +320,18 @@ EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
  * @return zero on success, -E value on failure
  */
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane)
+			      struct drm_plane *plane, bool allow_bypass)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index f0c264820a81..519521e9b908 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
 	if (ret)
 		goto cleanup;
 
@@ -48,7 +48,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -64,7 +64,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
 	if (ret)
 		goto cleanup;
 
@@ -80,7 +80,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
 	if (ret)
 		goto cleanup;
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d3a00296973d..b8c1c4da3444 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -333,14 +333,16 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 }
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane, u64 supported_tfs);
+			      struct drm_plane *plane, u64 supported_tfs,
+			      bool allow_bypass);
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 				  struct drm_plane *plane, uint32_t lut_size,
-				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				  bool allow_bypass);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-			     struct drm_plane *plane);
+			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-			      struct drm_plane *plane);
+			      struct drm_plane *plane, bool allow_bypass);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
-- 
2.46.2

