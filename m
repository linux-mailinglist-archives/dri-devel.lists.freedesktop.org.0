Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDCF9F8B9B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7CA10EEEF;
	Fri, 20 Dec 2024 04:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mf7uYSOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7120D10EEED;
 Fri, 20 Dec 2024 04:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5YEoOM0hXwnCR/nmD/N8a/IplCm1gyeg1DhYTeYZzc9MBYpVH8aQlGmGPb/lXe+7NkvK0d2ZOm1SQRxJh6yjfTwsaSAUHX8HUe+n7Ew+WIgSE48A9dYCr3jnR1mGpGX31vZjP7T8RB3mjxveqDiHx/fmCwjJaOv0rmsF8QRd/ufJMvO5O/HbJywABa9q5b25TaipfSWsfgbAguqtkeLq2z+jIZd1OAdfzzPXdzybnLyUSJKAUkCQ6m5BlrYrPD8SVhNkZnng9psP9/HdtI08N35tq4jsVvXuNXXlkN5ihiZxP7UE8a258I97k+P4TDFQWK4yYOG4rkXAvbFt3f77w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTJRIWDIMlW+K+Wufm85yfw/m5gHhmpZU0hp7jq4DUo=;
 b=S4KW7VADprTWMI8/452G9mMjO+eeMOSJj9oR2SRxVjrps3hZBAga4rwxaTWpoYwIp4mWESEkP9MfjFLy0Z9/6AUPbP3ceTvMhtVG9e7gi941BE2zolK7TuJGpRfpCWhJIfbTGIqDHbXJhWCV9tq50nplLMEGDnzt73xLKBuuQpIfVsDz1yeppXAk67Yze5sj5/VYfKO0QzKLaK5TrwDFtys3dT4zeEkiqg6XmrtPOqH7esbjtngz+XI5qB1bqFYGRNJx59nwjYxOkrrs91A8mmpyItHSS8DAxq/ua0QjyrTODa0bUZQHmeY13FXFC3Skt0vxqbzsXcsbJXrzdKebGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTJRIWDIMlW+K+Wufm85yfw/m5gHhmpZU0hp7jq4DUo=;
 b=Mf7uYSOS5SYY4le010IpgaQgJZrGwxufQmV9WKPB8wXFZV7VFIYbpe+VuvsFbVIHILWq7Cre/yRVfpnsp08r+VbXWQA9LKKsSfoFbCrPuNoSJrTqRBeFElVzg48eOIef4n90ueACUOIPniG2SEvsRCSoCaVFYqiXVfYKSO2PWfw=
Received: from MW4PR04CA0052.namprd04.prod.outlook.com (2603:10b6:303:6a::27)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:46:35 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::6e) by MW4PR04CA0052.outlook.office365.com
 (2603:10b6:303:6a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:46:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:46:35 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:46:30 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 40/45] drm/colorop: allow non-bypass colorops
Date: Thu, 19 Dec 2024 21:33:46 -0700
Message-ID: <20241220043410.416867-41-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: b53184ca-f442-4578-b2c6-08dd20b14864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?36ZH6XSopBHK4HneiYPataUSJQqhCR5/UWG9DGbu5xjIuQxWBumEb6W46l+d?=
 =?us-ascii?Q?+BXvjqO553Sp42xHOtfClqboukp4M7puRjmhTJQ1hx/wTLlFnd4bpBvKKoIH?=
 =?us-ascii?Q?BqWAahGivY7CrDAvG/DuzQ6XcHpbFou8Bljt1OZpFcHFNiI81W8OH+tFai8V?=
 =?us-ascii?Q?IrjMJq2ACBF+mJmkHJilM+lG2k9IseH7oMNJrqRB5BxPpSR9GwWki4savDHA?=
 =?us-ascii?Q?IFyhVojibEu5fHW3uCAb2v/RCXV7kLX1ONkWGFWAPvE6yZvdNvZeZVxaXfjS?=
 =?us-ascii?Q?1xvVB5/6jqwSuYAtaqkXcFPU7mx9tglN32vC0tqTsb1tM9MRVuBjG+O8rmqf?=
 =?us-ascii?Q?CadOczTDPwJ0Q+2XMZaGTQpXSNoZ6dxzyUBGY8hCcluWL/A5IOcvD2VTwzhd?=
 =?us-ascii?Q?zvSeeOnXpP8YDrz2Up5WpnFf+fPyPkolHKKsIOGHNpFLGsInyzgLJJxn7VIx?=
 =?us-ascii?Q?UWjiOA3pHur8Nk1iVdkSMqJUEcbb23NwsroZkaTG+W9KqU8bPy4+8QK+OagH?=
 =?us-ascii?Q?gXokkHoQRnfJxEoRL2GDnNtqBQm5k1TnkFPkr0/AyUSAsGKAyQzfGVHjdE5f?=
 =?us-ascii?Q?gxIRV601pUvL8ZPwV7j/WWQZiGdIFezKe+edVZUqnweQbp+c2Tthd61+paN7?=
 =?us-ascii?Q?0iyfc20k7e6TyNAIAqrscz3evVtcq6UG4Ps6Zmg6z+Bz3IKv/31Il2F6Wp3K?=
 =?us-ascii?Q?T9MgwGsbRIkPtQUx7RlqUONlg1IrvZb9M/XSZ1sDpyG2ZuysGPfape8RYsvr?=
 =?us-ascii?Q?3h4Ba18Ugt5RMYcxCq+uK815Ri8NWmK9iREv1S8jqKkv0bQoHUai1WxmQ49g?=
 =?us-ascii?Q?G5nrXd1GaQp+W5TQ6cueMAFEnt493Zr+oGrHqezEzK8M9cjgMvcpr3cRbnHt?=
 =?us-ascii?Q?WlF3TEMhkHgw3bTFYxOVVcwvBsYcWlI0IvisLDHX6JrS/H5fFkmQfvAVQGA+?=
 =?us-ascii?Q?MJODV1Lsc+vx3stGhEvvveNGjVsN8cmieWKkRPk/Z8MphdM0s6kq7+HRQuZr?=
 =?us-ascii?Q?q0mqEX0vVWE/13ziARzcofHiaRTTUJNpUt4aMy24m/g2OAUksjPMv3b8RlrS?=
 =?us-ascii?Q?jaGkB4ohj5DYuF56onTfQ5BMJvGEIbCDpiKaEU0zi1ArrBXfKCMwe6LzeLIo?=
 =?us-ascii?Q?U+CFFkw2mqBDY1cOJopEVcx3xN/nYWvKPkEienaVLQCr2T40kwvbFd0F1Isc?=
 =?us-ascii?Q?cFEFnn/Pf03HpkDWiLhUob1x9v6FmOYArkznSsZQEJVSTYpXtMyscEz2FpHd?=
 =?us-ascii?Q?vnqlyTpn2uH0JSfn0zxIz9h7pphADekqazcqMDF+1DNO3+AmfeTjFCMnYW9C?=
 =?us-ascii?Q?IkyZBSNQ+l2aEu+29fK74STKxuJFHbD4zOBluZDr2h/dVxjJRhwWTQ4EvENY?=
 =?us-ascii?Q?UD2u9nfHF3zRZF+9qY2CjFMG8ezFurVfyVRVJYx4LDpSMvZi7kZrYiiO6bIm?=
 =?us-ascii?Q?H7zP1CoWhfqtG6VfOWh76ER4Wsn6zaVccoJLixDfTkDr17rQehesRlY7diIY?=
 =?us-ascii?Q?Lpf5mmV9zEpi9lQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:46:35.0775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b53184ca-f442-4578-b2c6-08dd20b14864
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

Not all HW will be able to do bypass on all color
operations. Introduce an 'allow_bypass' boolean for
all colorop init functions and only create the BYPASS
property when it's true.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 53 ++++++++++++-------
 drivers/gpu/drm/vkms/vkms_colorop.c           |  8 +--
 include/drm/drm_colorop.h                     | 10 ++--
 5 files changed, 61 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 92c9f3fb0254..ec94ff887886 100644
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
index 9a17fe11bcb3..88219b095d99 100644
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
index e8d8806e94cf..dfff8e37ff05 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -85,7 +85,8 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type)
+			    struct drm_plane *plane, enum drm_colorop_type type,
+			    bool allow_bypass)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -121,16 +122,18 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->type_property,
 				   colorop->type);
 
-	/* bypass */
-	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
-					"BYPASS");
-	if (!prop)
-		return -ENOMEM;
-
-	colorop->bypass_property = prop;
-	drm_object_attach_property(&colorop->base,
-				   colorop->bypass_property,
-				   1);
+	if (allow_bypass) {
+		/* bypass */
+		prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+						"BYPASS");
+		if (!prop)
+			return -ENOMEM;
+
+		colorop->bypass_property = prop;
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,
+					1);
+	}
 
 	/* next */
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
@@ -154,10 +157,13 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
@@ -178,7 +184,8 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 		return -EINVAL;
 	}
 
-	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE,
+			       allow_bypass);
 	if (ret)
 		return ret;
 
@@ -238,16 +245,20 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
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
 
@@ -285,11 +296,12 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
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
 
@@ -309,15 +321,18 @@ EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
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
index b407f8ae758d..c418926d5bc0 100644
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
index 01c7f5cd6019..988955582636 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -335,14 +335,16 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
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
2.43.0

