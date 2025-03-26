Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56159A7279F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972B410E82E;
	Wed, 26 Mar 2025 23:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hs69dBoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC86510E82E;
 Wed, 26 Mar 2025 23:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdkBD8vEDXAK0D01QaRd7apUbKO13E/MM+aDTAejSBayYpZP8mlw+iedvHSQjs7WiEIUYVJPvWwnpFnb9eT+K30s5/Ch9OB2bofccSoCFlSJYnUWoNzvMWcj2njfZmCfovEtoptjMZq0GtCI7S2Mcbd+MI5XlHWHpRgF9sC09FaBRNNSVCdIe6ASsENFXQFZ+zwWbj6/2hXe1kn/aBFLvKD3ZX/xYgb4ihhi9jkGTzIpYq/kLSDK6nDQjwqw+F5vTWmg3to5vLJdxe9Fj5K2/hzY0hfnhxFBx3gukTrDOU7uUu3hVaVxbLQSSipkyRwZiK9YhblBpI9PhtDpkeGccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGqyLdVwAh/Cx2v+0g6qp1qu6TghSof2OqR7zt+X+eU=;
 b=cRtzrwmrmVgw31FN7QBtJqkbHeYha+Wg1/0Def8Fkx4P8lLJNTL24qiSy9mIV8/69Ftwsde2J3dRvw7SJL0r/IJ+PqLhJHcrzfNer0TDRYhNPXxPBentufUmoVQf82wOei2FrU/GQYdpKBPHex+H4+by/7gQOhiyOnwovJpWF8XvX0a6VAKaNoCGgP0cEC6RSAPXCFbEHZuG3hfZ1GEJ/A1dDmigqsR6IIUKhdq4wKy+53o0bld/8fhovqpMWzEbMbIqF3FEl2VOgYSH4+RcxkuxdHFq9zV1femdj39yP2sO2mqGiDukHqqH4rTYy12UTi97gzOSujygiBXch7OfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGqyLdVwAh/Cx2v+0g6qp1qu6TghSof2OqR7zt+X+eU=;
 b=Hs69dBoX4NOxvpZEiZnLn7Bk9yz6chDPXA/D3WgA2MUmVozKcEuOCiORBr+Rqf3pCJTJwA8AxGeY5wvm3+vWPqBaDxbbcuQ6kMu9lphDpFWezwfLJ0IBObLAvbyXl0mxrHlIQZuMo8daFPEA+oNjtkr0N9pKgDIgzRUxQtwu5co=
Received: from MW4PR03CA0294.namprd03.prod.outlook.com (2603:10b6:303:b5::29)
 by PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:58:45 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::3f) by MW4PR03CA0294.outlook.office365.com
 (2603:10b6:303:b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:58:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:58:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:58:41 -0500
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
Subject: [PATCH V8 43/43] drm/colorop: Add destroy functions for color pipeline
Date: Wed, 26 Mar 2025 17:47:24 -0600
Message-ID: <20250326234748.2982010-44-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|PH0PR12MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e73dc0-42a1-4eb3-ca1c-08dd6cc224bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pCnYhxpO7XKFnEdXVtQrOr9t1mNs9CS1gFqrzA5TpxKW9PYJ5nBdqC/AOGae?=
 =?us-ascii?Q?1kYbsgAB5KD6wZgIKpnuDhA9qbXDUAhqB/Qj6jjLMSRMbpw+hsXhDrKPbI4t?=
 =?us-ascii?Q?Tp7cfK8t+v2KzXLkcvhSWtVvFivXE5Uu2O9iSphx2I1RdDaNIzbaxVUrjeog?=
 =?us-ascii?Q?BjW/+8LFAgj/XTJ7Ox1ZVnrL4luBVmSHHXq5eZ8alv/LhMpXswa8POnySUwY?=
 =?us-ascii?Q?uyPSbnBsUuliChj8Nssu8pvMLVzwIbjpu9/IKedmonnKCKo/LK0L+f3AuubH?=
 =?us-ascii?Q?TfOhSy5Nwdfn/dpngbrGVfcitjntFeZ03oX8kAWAJXK8qJjrqexWEaoFqZZB?=
 =?us-ascii?Q?3ESCkhjQh+143ckKYimUBfgZAwrJOyfYeh8TrldiHqyGSbDWQMPJ9/L5rKUc?=
 =?us-ascii?Q?SNhsNQvhMV1xsB5LHIvvEe+foKpTDHzf0PpX+kfbhf/G/oAFSGjIjGcsiIYk?=
 =?us-ascii?Q?HFrt4WqzoUYHllaoeLHoM4ToOQsKLm/2EMHFiD3ilvU5F3Mq6WxksSxOyoGd?=
 =?us-ascii?Q?QdEHWcC3f3jzKiNmY2t/AixOiDwhI/BVx23pvrqcBqio3TnSR4oFqY71sgUv?=
 =?us-ascii?Q?TP/jP94kZbx0WCQxqXj8jURwHiDXaThJ59mhCtSmrWEX+81fnICX0+LUOpfR?=
 =?us-ascii?Q?uxBJ59M0aObVSKZOaPVvnHYyEsKlJA11ZeGZiS151/ttCKuAH5CgBaoTIDjd?=
 =?us-ascii?Q?r5RbKSIHPF3FsuP2PU32wm/aorZf7maKrs7I5NNkioeZzsa5dPtXqexZkeVg?=
 =?us-ascii?Q?EfJ8j0UFR/dL1NEZwBrxhOZ5buXaOtSge7MlQVI9Hl4YEj99480djMWHTbPf?=
 =?us-ascii?Q?K6xIZA9/0AO80332tAxKs8K8NWY/D7UuUX36jNNfOPL5PODSOPcws1u9qSvB?=
 =?us-ascii?Q?T5PaHr1S6/I+2gE5KxcSWkz7NdNEThnpum8uJHvqZGW4CM9owXPfM2E20jYm?=
 =?us-ascii?Q?cKJV2AXCxXrvDdju/fCtq00H5tvOQkBMbzoqO4eP+M4SSYm8kr2j4IVRsiYZ?=
 =?us-ascii?Q?STtD3Fk1XCV65rcQVBCNs25t4l3VlYNDpSy1gWB+YsDFbHcq05ZlHRec0ola?=
 =?us-ascii?Q?y70M0u3i4gX8tU0FNpOSAOwTDrooB4vrT40c0M4a4HuJw0zgzlvz9ItWctcZ?=
 =?us-ascii?Q?90xIJ69Ac0lzA0QvMSKI/0/EJSfF3DqLlqL8ZnO3Xx4OUrzgDX7CyTzeFChX?=
 =?us-ascii?Q?4O8czLx9vvFyy+3Qh8odSOvTzR10MBM/CmZBI6xio5yxzTzW/e/f6WUaR7Rg?=
 =?us-ascii?Q?H/jZ86EOMglR7GnNYP3BBNqktcSm9ugnDRkDmDzv5JSZEb7MiaVUka5FxdnK?=
 =?us-ascii?Q?jZx93sul7E0xQH4NvgR3YHnF0y+gtupANI4U+x50roVJCIi/VGQONkJcATvJ?=
 =?us-ascii?Q?aDjFM8Lb5UGxs0UUuQGdv5QicqCs/FV4QfL4GRgA4U2uZxKfPbIlPeOUqdJ3?=
 =?us-ascii?Q?GLjHCgDb070gSN/bxag0/IwGlkyGGYPBuCplSVvDseXS4pXpEKdi2nYU08tg?=
 =?us-ascii?Q?lWs2jhoD+/CIwwk6byk+874a9PpuKu3E9gzo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:58:45.0879 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e73dc0-42a1-4eb3-ca1c-08dd6cc224bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813
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

The functions are to clean up color pipeline when a device driver
fails to create its color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  3 +-
 drivers/gpu/drm/drm_colorop.c                 | 41 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           |  3 +-
 include/drm/drm_colorop.h                     |  2 +
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index e03e6044f937..80173f00dfd0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -200,8 +200,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	return 0;
 
 cleanup:
-	for (; i >= 0; i--)
-		kfree(ops[i]);
+	drm_colorop_pipeline_destroy(plane);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 224c6be237d2..5845527201d2 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -154,6 +154,47 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	return ret;
 }
 
+/**
+ * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
+ *
+ * @colorop: The drm_colorop object to be cleaned
+ */
+static void drm_colorop_cleanup(struct drm_colorop *colorop)
+{
+	struct drm_device *dev = colorop->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	list_del(&colorop->head);
+	config->num_colorop--;
+
+	if (colorop->state && colorop->state->data) {
+		drm_property_blob_put(colorop->state->data);
+		colorop->state->data = NULL;
+	}
+
+	kfree(colorop->state);
+	kfree(colorop);
+}
+
+/**
+ * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
+ *
+ * @plane: - The drm_plane structure containing the color_pipeline
+ *
+ * Provides a default color pipeline destroy handler for a planes.
+ */
+void drm_colorop_pipeline_destroy(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop, *next;
+
+	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
+		drm_colorop_cleanup(colorop);
+	}
+}
+EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
+
 /**
  * drm_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
  *
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index a2f548a4b84d..801e7ad6ad79 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -89,8 +89,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 	return 0;
 
 cleanup:
-	for (; i >= 0; i--)
-		kfree(ops[i]);
+	drm_colorop_pipeline_destroy(plane);
 
 	return ret;
 }
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e999d5ceb8a5..e1f7c91e8db1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -366,6 +366,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_pipeline_destroy(struct drm_plane *plane);
+
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs,
 			      bool allow_bypass);
-- 
2.43.0

