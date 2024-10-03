Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31C98F7C8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E038F10E910;
	Thu,  3 Oct 2024 20:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QqhXb5e2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF9A10E985;
 Thu,  3 Oct 2024 20:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTKtd/HEXqerstYLjMptujVgG8LV7jtSUJUTZVezKCi8lIdTl0QSIyKuq4ru/x5Ikgdd4b5NvvgEw5YQNb3ULfAWIdZ5o4EpxKarZOBBAsxeQPtIl3Su9QBU8qqerYebHIxQ2E4Xl7neZeyk0WVgF5Ic0zzxfPSha/J2ZQZ57mpg6/WjaZgl20R9cYzRIkUVjGwbaNPkP574SiaELKU3uxPTefd1qeGa5SW+0S0xDiacE4EScwDdsQquIfEn4VF+FDbp0raIOL7q4wmByXfUslpoUHEH+wGMBZLiiBmf98PnD6HStFNFXh9O/WQzVMy34i14fcyMOtBoDH7H0JJnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ih6N8Q9d71y233omgDpMvBSPfujdk5ey7D303tnDnB0=;
 b=bk63Mp0F6NFtdtrR2QTKMlo34AwXiiIQM8aN8pwNFAbPdvlQh0d0uy6WogLJIgLLj318ux7kyCVDygmNmiqQLkgFz8rn+vmyHiHM1PxLwmnKGVskzNLvmApsufOk7OIRQR3T2KhECeEhlG7ZzIFzATn9h2uxLk12LUmwgIWB09vZy+c8xKipPhXBfZgW7ofXMjdaky++i4lMvGAL1SKA0urfNuKn9zTs+Uz8sq2O1kJgz8LePDU3TR/aNooeuFiYsk47kAl88HGM2hFsnjMUCKYmgNJzowDcs9f9MNpurJkyz18lyZMZqZ0uaVHMVVN5xd228xLykz4v2RUNnhOWpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ih6N8Q9d71y233omgDpMvBSPfujdk5ey7D303tnDnB0=;
 b=QqhXb5e2YW7I7twEzpFjQZJnwxMC1JxI1CP7PLRfE2mMF1GGSkGS8u6/BiknyoYCeL8DfHac8xI+7TK5dt8OIfyfqzcaQD9M0UJf5r39Y/wmHv/rzlU1WZrZE9xUyoeh5OX/0q0rt+kKiM9hPp9wuT0UuguIPzmqHGYW186rOv4=
Received: from DM6PR04CA0028.namprd04.prod.outlook.com (2603:10b6:5:334::33)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:02:01 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::c2) by DM6PR04CA0028.outlook.office365.com
 (2603:10b6:5:334::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:02:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:55 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:55 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 39/44] drm/amd/display: Swap matrix and multiplier
Date: Thu, 3 Oct 2024 16:01:21 -0400
Message-ID: <20241003200129.1732122-40-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbe7ae1-8d0c-4c0b-2050-08dce3e63eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OIyNzCKk2SA2WkLrhCtzlQMBYBlU4h00dvtU4MfC+zpxlfMfIn7TxtRm1k3G?=
 =?us-ascii?Q?rMV23i+ENK+1wEdt7iMXxBXsoMzZS+z39ssZn3KGaRUq9sFhXFdTSpun/rwK?=
 =?us-ascii?Q?kcRFnxdY8nA6XlyneAvYyIkYqXirtqL/16MXlRYu8qoSmv4bgFhT9vhR+445?=
 =?us-ascii?Q?ICFfyBostTFVDM7L5EV3+OUrM71RdNLPrOdEF3hnFXSOMYumA+JM2EhY7Iuk?=
 =?us-ascii?Q?tRrRVgRtJU1ii0hh4mFva2XPkwz1jROCjjkAVp8E+NguBBfweY47w6iCNLFJ?=
 =?us-ascii?Q?ik9JcGNt+Z+cR8fOa0PER2XUHDn5jA/f76sBFUakrUUF8TjG6KWf2FCDtDAR?=
 =?us-ascii?Q?EilHDZkwBNTdJNUd9PHWX6XSQ3Fgp5D3VdgY67EQRyNYu3vaUZDBSQD4T+yF?=
 =?us-ascii?Q?weJG0T0/F4JoGoWV6bRkd4qtRz7TKj2IkqEvi+K+/b9yWC09kQ3RfhrGPL+1?=
 =?us-ascii?Q?UptwwMJbDsyIyIWyx1756+XvIPV5Mrs5F6iqfpw9z9NITvEUghio603s6ou+?=
 =?us-ascii?Q?sEbTtFe5ZNoE3vSh0GRN4xagInOO7kqexZdbMoNcsuuc3iwSfgKkSTu+7ybE?=
 =?us-ascii?Q?AA4PyzDbnnBbihrBglz2h2vK0lbG7R0GkJKEgmdIohWjjZKhMlVWl4LEP5QY?=
 =?us-ascii?Q?UaLBkxTT3KBKx0p/LI919YjVZPpWA3fuM6UCsW75mFiJU8l2WazsdANkUz/v?=
 =?us-ascii?Q?/NGY0CmKq3cmfeVFZ5ebRxRNXZ1XsNCbrJM+CWeU6YI4rRifBhnrs7f7RICU?=
 =?us-ascii?Q?oxoueVIVFqrPWfWm2FYkdt0KWz0ze29mtuteAm30ptFGCZDhffc/u3ldZNFP?=
 =?us-ascii?Q?JF5QpV/ilyHvR1TU2IfqQ8Gp+mciXGDNm/6fpsfZrLlsfWQaOZvJHOJxp8EN?=
 =?us-ascii?Q?X4WOjbm5zwSG/GhdId208tZKMPSbx/OIgQGTExQ4jMeCkspA7Z+3XWyHd+Bv?=
 =?us-ascii?Q?LnD4gZUCl+omiHAh87yEcDOPu5zyzYLSVZeO00g3gECGDWaMT18Z9e1YHHh7?=
 =?us-ascii?Q?XnNVpqu/BGFV3i9MSiYkfko/l29XPc6YMnJoKOmIqF0fI8QfScoH4Kp/Wh7K?=
 =?us-ascii?Q?HXGWA6ktnRfG4sUnAKt0DcN5wp8SfCCN4j81D18VAA1NG4uXzyrVjnSfltFM?=
 =?us-ascii?Q?67q1lYUEIhWQ5auwermdvtueD6fC++iz03z2Wqdv+uODxmJ9EGP90at8WOpI?=
 =?us-ascii?Q?JbmEdRldpe23a8e6MeA9JA4UlFba7ssMN4NoeWoofKHhooM6/Zu3JmB610YN?=
 =?us-ascii?Q?FkcnEWhql6WWN15tckMl66/z2m0dJBhVUpLZ5ww02uuYj3sGt4cZQrdI/94f?=
 =?us-ascii?Q?yjMoPUxeS16EZcSSj+tzWve7NXwFj/o6rTRlVePY+rGWC+N5X/QdO/JgNFTi?=
 =?us-ascii?Q?JPfozqbATxtkeHvmsLOzF/ZFir9g?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:02:01.2286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbe7ae1-8d0c-4c0b-2050-08dce3e63eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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

From: Alex Hung <alex.hung@amd.com>

Swap the order of matrix and multiplier as designed in hardware.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 22 ++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 32 +++++++++----------
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index cd545adbb13a..e41329cffd9e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1479,17 +1479,6 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 3x4 matrix */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no 3x4 matrix colorop found\n");
-		return -EINVAL;
-	}
-
-	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
-
 	/* Multiplier */
 	colorop = colorop->next;
 	if (!colorop) {
@@ -1501,6 +1490,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 3x4 matrix */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index a431de9d2b8f..df82fb14f8ca 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -75,22 +75,6 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 3x4 matrix */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		DRM_ERROR("KMS: Failed to allocate colorop\n");
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
 	/* Multiplier */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
@@ -107,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.46.2

