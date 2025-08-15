Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AABB27790
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85610EB8B;
	Fri, 15 Aug 2025 04:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qqpN21Ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0464E10EB8B;
 Fri, 15 Aug 2025 04:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UO11aoG3W5vbcmr7998EI4P4hT3tpu7AaPeJxly7vDGNIulkMtRyDSNzJHIEkYX0P76DdBRZ9xryy4H7PFsB8MfVIcqzStADYAHcm1ae3sBogMTTlOT/RkTyC8xUTJoLYKeVhOjy0pNkFv/g3xIsz4OkdCPyMV0NuE8/FBVJnTfcXXNE/78YycOm1gfaXtnakBnB5m3p92GQrhhwvaGsGcr12/zznwK0IqN84TGIDDf86c2CTooTbvfW0agtUZgQtcqobCq6nvZrHbFoyShtYbD5L04tkYIhSmskUpL/BIMm5cDtlJUTQ2fRUsTlbFhfDHkp47KTnEOh7v3O+cXp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUL5p0YE5UpIEu3WL86qKfmz0m3neUvsxxQP6E1wPAQ=;
 b=WBgRbtRRG7ubc5EJCL1gTdSSd9hcYaX33Ib2pGAR8m7z7Vy76LisUQhKvkMk1+u82no1uplNI30JcCr5v5qYM8aqW3Af1fKG+/RCBcuJMco38uJCzlAck6XaeQFQDmPJ6S9S9L0xA4du4bDzU1wy+/cGeh6OWGknSDi5t3JMS6fqN87y1XQlvmeEXN+B7JG/dAqNGiqg4dx1/pXjoQ3CU3A8vunV5pQIOEUk1nTGcEnxK1sZqhBbzd2Z0R2C49a0Ik2Ys8hqp33z7nX7hb6MXC1NvVKjGRGmCzi8jVIrb1zoOr0yTZw0O5IQ9LfBmKr9yoIdNie/DhptyFP9FNEfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUL5p0YE5UpIEu3WL86qKfmz0m3neUvsxxQP6E1wPAQ=;
 b=qqpN21OxgoUFq1NTFC6XhBKMd/r1MH0awAsDMTTuO07YlIFXqUJYXasQ4/QsgxCKYVRoUIzzCt5S8UIp1+Pd6c0CyPbHyhwPV95xskK2d6pnlaK+GLLLgJF3DZLpZ1rhOHBsSHEv8pCPcnYCSAMYp/JBkiymsFZvg57z6xcp4QY=
Received: from BN8PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:d4::13)
 by IA1PR12MB9530.namprd12.prod.outlook.com (2603:10b6:208:593::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:01:45 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::5d) by BN8PR04CA0039.outlook.office365.com
 (2603:10b6:408:d4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Fri,
 15 Aug 2025 04:01:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:01:45 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:01:42 -0500
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
Subject: [PATCH V11 42/47] drm/colorop: allow non-bypass colorops
Date: Thu, 14 Aug 2025 21:50:31 -0600
Message-ID: <20250815035047.3319284-43-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|IA1PR12MB9530:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f94ce7-ea99-42c2-3c3a-08dddbb073a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?spYn4ri9yIW3cvrKzSHVPVRavUJz2H7CSJ/8o73oFzXCSMuouUj1X2C8g4eT?=
 =?us-ascii?Q?eXK6dFmEYTxkWYdpm0xV5UQyGHLxZbb1+XsDdZ3Ofy65Lk40YWMYbZ5CG70x?=
 =?us-ascii?Q?oVY+fNsqg+AZvNe+bWqmlRj2YzZ4JHXsVXbNivNZftmuarUDQDd6F3oK1e2G?=
 =?us-ascii?Q?6LXYlQih5IYLci5WvaNbTYzoKLafXTBkQahqOVNuErx1r4xKG4cSKA2ga5Oo?=
 =?us-ascii?Q?VcW8licV6TDFZfIkZXgfOg+QTeuh6v6Yf/KL/hU/5poedstX3bk92tKcowio?=
 =?us-ascii?Q?Bw0Um0tmPHpI1zBnCnlzkbMU4ssFzZ1u4c8veH/wKVeBKdEqU7USGMutHKwR?=
 =?us-ascii?Q?UUuBwlVvcpnRL+EIlXVxCMbKjqTfOZVDgCRTx88j33ZYd970Fez4kZUmvSsA?=
 =?us-ascii?Q?ouKs8YFnqUKcBuqxKxovUleij4pJUoIW4xUSD1prL7AnYL2T0XhOIsXgf/4F?=
 =?us-ascii?Q?98Rx5FAyUccs2/9o8QzuaVjy3Uj8+Lp0/RyLZ3relfvZNAvRZqZhLec/YqE7?=
 =?us-ascii?Q?gAx0m+oIm92ROt9fqzZ1t1/QFcpigimeusXrBruh+rMzXfrd4ZLyVcV3rdDW?=
 =?us-ascii?Q?t1+65vDMbfqnj+ltU8cw8WEzcjW1+UBlrFNp1LkehaE8DDoTQayue7ruy10/?=
 =?us-ascii?Q?EWJ1JIkubStc3aLfQVhq6Jaq5CtOM5tzyH0CdjA/YqLxfdmW25dRXJ24BUTL?=
 =?us-ascii?Q?3ZY5Ga0DcD3gPmCysgf1mvVxDnJC6H6qohfr437XHq1doNGZCcGQNvyzuW4t?=
 =?us-ascii?Q?k1lGBW56tLuHz6sDndmQLmXChkf0aWFpp4shOBQMNv4GT7roqOhwOTZe0YuL?=
 =?us-ascii?Q?TPADh+Y+nGh3/CiG7ZcgpShiGqdTrQAecXF+0KSNJYbdwmYhGeZBXEMuENlU?=
 =?us-ascii?Q?s9XeS4/5L1mRY4PgbekIjVr4oMJH781iV1dLcwylGQ2kOgYkT65dROLyMwWl?=
 =?us-ascii?Q?DKfyoG16spZOzdYRN9lLUfs3vZXotPLWHJd3JWLX80rF7qmiC2z3L7JW1a35?=
 =?us-ascii?Q?L9WawJhR0h14xHFJ+a5Zhz2+k5C0ZJnAPWEbwDDUr2S+i6KLT4q7eqASLzqZ?=
 =?us-ascii?Q?ZXN3EpwKzm+of8I4Za6H5U3weELFIF6oEx+a44gq407edi8FRN4TMH/XWTOx?=
 =?us-ascii?Q?gbbt92QCgM5JKF/1KhU3TvA1ftDn+Dr91c0BxeP5AkY7BgFJHanuFVRcSFiP?=
 =?us-ascii?Q?8w/8wLNxOdFZdwspxnabIzNVj6Zqg6Dypk2Z0s/7xJRfFeMFLozNRE27QCqL?=
 =?us-ascii?Q?dC8ZHzWiZh6x8TnmxgNVTp/EewXy6mRUa3GC0VEnJXr1StbRXBZ1HAqODp4p?=
 =?us-ascii?Q?y+TD48qSJtv1+Zp1nUzj+xlFi/Iq4zfs8/Rud49FEsfJurL30wgyU0HR4ZOm?=
 =?us-ascii?Q?RanujuYO+qnVRaHSRBy90TtcrR6870J3iY5kdd00+/0J9SLg9V9NjhYkkcVX?=
 =?us-ascii?Q?vIRvvEkY1ZnMPzewIWTaMqhVGe7ThAAOyPR2Cg5mA/rDudKeIIjcz5P2dDTe?=
 =?us-ascii?Q?WC7d+R5SqjbMcoCgxDjpFMJQGAUM8P+fY8uN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:01:45.6949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f94ce7-ea99-42c2-3c3a-08dddbb073a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9530
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
operations. Introduce an 32 bits 'flags' for all colorop
init functions and DRM_COLOROP_FLAG_ALLOW_BYPASS for creating
the BYPASS property when it's true.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)
 - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++++---
 drivers/gpu/drm/drm_atomic.c                  |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 44 +++++++++++--------
 drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++--
 include/drm/drm_colorop.h                     | 11 +++--
 5 files changed, 55 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 8e05f7fd3748..deacc18b8926 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -65,7 +65,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_degam_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -81,7 +83,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -96,7 +98,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -111,7 +113,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_shaper_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -127,7 +131,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -142,7 +147,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_blnd_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -158,7 +165,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	}
 
 	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c3aebcd9848e..3157a503001c 100644
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
index 8663b49d32a8..fd9cedbb4a8e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -85,7 +85,7 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type)
+			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -121,16 +121,18 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
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
+	if (flags & DRM_COLOROP_FLAG_ALLOW_BYPASS) {
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
@@ -194,10 +196,11 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
  * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
  *                 created using BIT(curve_type) and combined with the OR '|'
  *                 operator.
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs)
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
 {
 	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
 	int i, len;
@@ -218,7 +221,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 		return -EINVAL;
 	}
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
 	if (ret)
 		return ret;
 
@@ -278,16 +281,18 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
  * @lut1d_interpolation: 1D LUT interpolation type
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 					struct drm_plane *plane, uint32_t lut_size,
-					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+					uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
 	if (ret)
 		return ret;
 
@@ -325,11 +330,11 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane)
+				   struct drm_plane *plane, uint32_t flags)
 {
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
 	if (ret)
 		return ret;
 
@@ -349,15 +354,16 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-				struct drm_plane *plane)
+				struct drm_plane *plane, uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER, flags);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 3be9b204a9bf..0191ac44dec0 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -31,7 +31,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -48,7 +49,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -64,7 +65,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -80,7 +81,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index dcffca8b0988..7600f10d3961 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,8 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+/* DRM colorop flags */
+#define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
 
 /**
  * enum drm_colorop_curve_1d_type - type of 1D curve
@@ -354,14 +356,15 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 void drm_colorop_pipeline_destroy(struct drm_device *dev);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs);
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 					struct drm_plane *plane, uint32_t lut_size,
-					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+					uint32_t flags);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane);
+				   struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-				struct drm_plane *plane);
+				struct drm_plane *plane, uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
-- 
2.43.0

