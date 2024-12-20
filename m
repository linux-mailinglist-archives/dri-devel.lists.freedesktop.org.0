Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E99F8BA5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951C710EF02;
	Fri, 20 Dec 2024 04:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mIicdLXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F68610EEFE;
 Fri, 20 Dec 2024 04:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXSJNTrbDrJy1XB7goajZnL69ntCAYyLZem46/9NeHk11aWjonc27eqzTTRSZzGF6njTU3qPRX5+tGEGE2MXqWdUbCaCa4rh57xS6CPaOhwDxPRvE5EQNQ+MjFmn8sSQ5ar66hw//Bo/4Gc8nBBPQl0A94LtCUtPBSB7s8bCHaibW+1PM6qBOlnKVRdv+j7VnlC1YzAVjquVlqKNgD7KIA+pNgfFwDXPXzEuiLEJHVO6w/mHeZE3SQItk9JYSsMtCv5rmVqlo6K30jm3Z+dGcRSmqxVjVFHRE50LgdnZVMONo2QX1yf18UzxGno1njgrKWkUJ9tnlbtwztDTDSUpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td4+g3CUCM6NEU97Hcj0TZWbVpyNh6cPZfuGS8bOERE=;
 b=UNJ7oK7kuU5yMH/AkbU/qQltg3F835YIWBoGGAhBMk71GQUymzcTVj75JFN2uOZELyUNKkMK7eb5PIDCF+1VkKLcaHZRCKf/I5bBJ9o+z9fpxoOrLkoWl/k2WIyNK2xB7agvvMgva0GOTs2lVfWzvKA+4UetjMCyPpvxF+mKHbP68JA4yFDKmTgJtrW+jupsfRMdpNkUGKm1rmj5fPTQe8/JLvAqhpP+Ma3NH6Px0JbTvWioEIfyZ8Jx0ko1u2J6i1Gt0WpZ/RQR3qW7DJwtyJMNoJksQGg4j4is1SVNSK/tRxjJfF8KPvd0ZtSfpuVF/uDjCZbiHn25cXdEVeyx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td4+g3CUCM6NEU97Hcj0TZWbVpyNh6cPZfuGS8bOERE=;
 b=mIicdLXXSjOxJ2YSv8SpKFeliP5pTHNMNdO6yWUJnEuFDs8t5kO2IeohkzpbPYyZVfp6gxZG9fAt+z2tkWJWDJxd+jLjWHatB6VGRiKO3Gn9kpyRX/q1pS8X1KqNkcZDFeGrkl/io8c38gJPWgAdnghZjBZ7/kDgad0WzZjKrcA=
Received: from BYAPR06CA0012.namprd06.prod.outlook.com (2603:10b6:a03:d4::25)
 by PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:48:15 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::98) by BYAPR06CA0012.outlook.office365.com
 (2603:10b6:a03:d4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:48:14 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:48:13 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 45/45] drm/colorop: Add destroy functions for color pipeline
Date: Thu, 19 Dec 2024 21:33:51 -0700
Message-ID: <20241220043410.416867-46-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|PH7PR12MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: f9411f1e-0aed-443b-3e9d-08dd20b183d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dK/fWNjl/Rusx/0hBCTZtUsifXs80xemWAomxdau0XdRFlnYwyXFbEjYBh9r?=
 =?us-ascii?Q?e+PpZXaRVL6hbUUMn4Xp4ZL/YA+VsCg8xpHbKfwNQBdQJ1EM0t37O2WJHio5?=
 =?us-ascii?Q?RiLPabsStrWB+HzLPV8FgeUcSekc7uFDTivU7mGQUYkABw6OMqjyin81hSXd?=
 =?us-ascii?Q?3J/5/bA28ROycLgDm6BOYDxZThG4rtpoKJiqA868McsCdcvvIshFJyIk+65J?=
 =?us-ascii?Q?R/wcBT8dy5xokfPY2KXFPzs4ESH3DY9CaIeYtEC55sahsBf2ZH3FwdlaOa6d?=
 =?us-ascii?Q?bF9d7J6nSZgcAG/4KDVjfVjSpgVZg8+k09dhancgcHK4aNafo5lHiyS76GS+?=
 =?us-ascii?Q?PFWmePzqTIXbl2r7NP9nVKep1gYzhuFmhmGnIRySjBbZlcv/za3Nmc7uUcw/?=
 =?us-ascii?Q?iog9vvY8b8svZDGqUbKsayE5aqh+6uY00GputaUqGIZxCzGb2/m0wCjLrYvT?=
 =?us-ascii?Q?nJqhMe/TZcN4I9n2nkUm9qC7pSgmPMzxS2Asv10rwZ6okRUT2Mv7wsWMbsPF?=
 =?us-ascii?Q?OyhjOT5z0k2jqeABbsqxb8rcyAlmhZDIPFIIitD3LdbJl7M6tjBHHzwGkmOA?=
 =?us-ascii?Q?xQz2dRYrjMQvymjXJzVOBvceQBVZw3iewi6MQFMhISeMdH8UZ6ReX2JHEbzY?=
 =?us-ascii?Q?MfSsWDIMrRssSnbDodJLFJTH440wtwmR25QU6ElJuCZTcrUBEb7OklKXNCAC?=
 =?us-ascii?Q?R/Pg0mnGDOeRtCnZs+we43Kl3yfGj0gsj+DEbnldDU/ewEOOmYV7yjV5d5Xv?=
 =?us-ascii?Q?q+iOUw3WPSp6wZSNKHNavBMhDcmwiIxnvRhpz5hs9oj3t0kazkKcSD4w3Qcv?=
 =?us-ascii?Q?R/iRbBX0oUs0uLU4FWngzo7aez9/d5zzfSLAWi6/trMFI8K+84j565GvYL7l?=
 =?us-ascii?Q?fS6VMZ1xbHIQUn7kt+We6NdHx0JEz+oPOE0M/HxZ8HAVGOy2nCJ1Dnck2gXT?=
 =?us-ascii?Q?u0vGh/ccMPKcBfw2kUqjeiQsnHeti2QAZh/rQVHwuKYiMyaqz1Hv7Mm9BEpO?=
 =?us-ascii?Q?s81qrREW12nT3vLQ+AxKfx07akALJ4tu7ufJs7NIQ3oDIenITV2DtMmxEpL+?=
 =?us-ascii?Q?rLtYS+kq2JIdU8PP+u3Qr63CpW9c27jUajheRFxkfuhyEqtbRHVE2Zw6RkzP?=
 =?us-ascii?Q?83UMmWX/OeI5si4/tzK15Ec0vTJ00HPNzCxp0mtIWRZr1Zb7ixzIZGWd4R7A?=
 =?us-ascii?Q?Ap53i2lTuhnKDPQzFxi2Ar5yEeVnRkivn7GaiDC26IXXQtwbTWw35/6E9MGd?=
 =?us-ascii?Q?n0xAj+a1+U/5M9GLCzsE2ZT+RmnwakP3Y4M/q0wB3gABRRiJZrz7fRC5QdR4?=
 =?us-ascii?Q?KHs7c1Q2iY+6vc6WqquhvN8qhPCHuyqlmOEtUwxLSGeSqTsgOC1pEVE9SZji?=
 =?us-ascii?Q?wizMG/Y6PPklww8eHSSHR+i2gdYea3FEjp1vu8heFjn6Jr9FspzYbj9VzbxY?=
 =?us-ascii?Q?kfbnLh5vLQB9CyRrrs2LR9zCoRv2NmTUu7Xd2K3fP/JwDDqe0cxOa05DdN1V?=
 =?us-ascii?Q?ksLLIwgY5UaWtXE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:48:14.7810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9411f1e-0aed-443b-3e9d-08dd20b183d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5854
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
index e3dd49c0080d..5245d6a4da39 100644
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
+void drm_colorop_cleanup(struct drm_colorop *colorop)
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
index c418926d5bc0..5cf47a6ef79e 100644
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
index 11b474a9b10a..953eea079708 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -367,6 +367,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_pipeline_destroy(struct drm_plane *plane);
+
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs,
 			      bool allow_bypass);
-- 
2.43.0

