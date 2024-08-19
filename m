Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBB95763A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6D110E41D;
	Mon, 19 Aug 2024 20:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3oRalYr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8610E435;
 Mon, 19 Aug 2024 20:57:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bay+pwmyWfMzb1iCpC7A8R45RqS1HBrBzbxwUi6DLxz65fIP8HR4dyn1p22HA5fn/Atl8MoU86/7KeIdAAEW0WUo196D6fOZDKxc2VI+zorrUKappGr2oT5G/0HyTL1+6kEQwWLV1Aa7vbSrweKIoyks/kcUxyML2FAx86mlHQEy+kzb2oJCkTKtF7GT5v0hJTVn82TsuYpoR5PaXZrsgG/qwxiJO1pyJnIbXQHQXdM4MKMzsweSXWpR0Q3myOwZXWIfCx55cgvQqfYB73//MNyqEIAhVnbFxV4IjKh3fRdBw71zqm11wlbZMWhH3QJgg0tF30DpfdYlfuobrS108A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12H7YEvQY5ksg6NQGCtVs+C6kjSG0zNuAV5geHUAwS0=;
 b=jNzWX8eomrE8J3UXugwBsQ+krm0AiBNnQ2kuvji9NBS/hCZJYiyNThYHIdi3mdY0Mcm+L29V0vErYvzu1aBJcXVm9vSxgaQpbiKvYSeMgblKOLzcKq9sLlRJyQILPSAUc+J2S6NyVK7enN3gTQ6YvKrvHcy2d9IyaqXJfKelwhLgN8rwTKpN0Wmrung8mpfWZcHfD+17k27/ptZ+glheWLVcJ02GPBrxCFUp6QHLJF9z1G7+sv69k+K+kO3FsekPU0R10iHULwTm4SB7ND5injAixlyfpeuRmXRo5VGRHej/sH1zCsfzfESEiQjcUG1W7Ee710XlRWZ856k5qDd2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12H7YEvQY5ksg6NQGCtVs+C6kjSG0zNuAV5geHUAwS0=;
 b=3oRalYr2esR0qXnx7EnnKWtF85asow/n1NutTB3MEO3DzjB4it8/mE0je7Y0QBUowTfrTCTm6Y/U6ZSRKX/MVPWaW2mHh+MIT5alXWKbtXPcHgg+n4p4XqHNBk9XpWavUJawkt9rZ/4H5hNaGAPMi7CyVq4p1INbSgv4Xv6nIKQ=
Received: from BN9PR03CA0653.namprd03.prod.outlook.com (2603:10b6:408:13b::28)
 by PH7PR12MB7211.namprd12.prod.outlook.com (2603:10b6:510:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:45 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::6b) by BN9PR03CA0653.outlook.office365.com
 (2603:10b6:408:13b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:43 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:43 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 39/44] drm/amd/display: Swap matrix and multiplier
Date: Mon, 19 Aug 2024 16:57:06 -0400
Message-ID: <20240819205714.316380-40-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR12MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0058158f-2bfa-44c0-afdd-08dcc0919315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DvZ7hfruCXp2E0FCme9LG4lsWtw8kyC+Cbq2w0UnVDMjrN9WbfVg3MtTW3MW?=
 =?us-ascii?Q?HBGQK+nfrGfCJ/Uy5iEsMHbQSDFqXITSqlniZo5ct4XmBnieyv9Bg2idZ6ne?=
 =?us-ascii?Q?cdNWd9y+7v4G6wlKP4PVxAr3H/qpZU/LmHywBAVNR+N2Kf5fZWF7WD72yqbq?=
 =?us-ascii?Q?UFwedKd2rfsnU/MEVd0Y7dIC4BYDe1d8Y5r5oZbv1PNinECmMFcGD4FcImhZ?=
 =?us-ascii?Q?+FoYlnSkwxtmqokFuJn3rc1AbJDgdSSOyDgCk6ALV+/pqBONzNLnNZ6WZHzZ?=
 =?us-ascii?Q?M3fDYLOuhAUxYkxri523ZujnQWomWttt2lIhbOgczLte158ac60WxJ3FGSLS?=
 =?us-ascii?Q?L4hmF9gk2XDmaTuTcglHK/CJcBtPr94tYcVuCchKI5nelsT4ediNlOwZWreE?=
 =?us-ascii?Q?RPM1t4FQUzHWl+SEcy17MmTy5IMg9rK1rD6fWjIh7lDllNpjnuj/fYqFqJYz?=
 =?us-ascii?Q?kcWntbYeAjyYc1IJ8Sn1WVj0H8b081WpxC0hmgomen1+/1/ktjVIKAp/rWMu?=
 =?us-ascii?Q?xTQ03vltQi9Tunk2RlUMYpwoBnK0HlkGkvyBi+nGZkVuzTKd2g2pQc7NxXAF?=
 =?us-ascii?Q?rikomB6egE96n7EP9eD0E41iLvcOzlpP6gzrIA1Y3MS/WiQvcH2eTN6lIL6I?=
 =?us-ascii?Q?XED7/Q/th5ygPsEID2Ea5HIDzocODefwf6NxIaVf8xvvCktNHdGGoV4eUtXG?=
 =?us-ascii?Q?pSjPP1fokRlJMXwTULrEMSOq0I2o51F5YdhFW6BPXJHayrEbhHnYo23y2LfG?=
 =?us-ascii?Q?Yq78RiKosQ3HT/AWutQXOyTLYj6deZnuVHjDpJZ0XVptGHEhu1hC4QvUAZWT?=
 =?us-ascii?Q?853fbS3ju59o/pL1E/kngQZr8iN98mc2FNNCnmCac5d11mP+/vloQ9CFTfco?=
 =?us-ascii?Q?mS6QnRWJrNpXO3BP2AnvR3wcZN7YmrM0/rJaPNlAUl/wGgkHKmbpeOfUbs7E?=
 =?us-ascii?Q?aSW9JTOsqqoxJy705k94G1e4ibndjpLll+yLoyXB7vaJcsCvdISFbFQ2oivZ?=
 =?us-ascii?Q?o0SQ1pmIHUGSSROlT6pMNGZuCpot4wCMWI/zLIoVRlmuzNyuQvp6ybM8a2Mn?=
 =?us-ascii?Q?dXilQCHADnN380W9ng6qgbezrLWJVR/tY7uC9uT/hhqew7aChjHQpy55R38L?=
 =?us-ascii?Q?XWvB2dhb808hT97kivOiozSBtS2o8YGoOCXUKS5yJWUuD4qZsdfrk0XkZBq8?=
 =?us-ascii?Q?8bVMyiGIaoQziqi9wwNH9PHhtig0YghD30VTueuSluy/+XJfH+Pw3pE7dCS/?=
 =?us-ascii?Q?j1fNNpQMHqRG9m1SMArshwT0mYoBrnZLX4TGa9kBFRi1idqKLi1X/rmpVwtM?=
 =?us-ascii?Q?g8+L1UvSoVuej9OsHLK3yto1Lrvb/iS32VhmwJMu7U4MgajEv2Na8VeLmI1R?=
 =?us-ascii?Q?4NaeQ/Ku4XL1fnhlTwxhS2/9zjGYSDmyTxr4t3DUN4VGis9I6q9H6gOrzd+l?=
 =?us-ascii?Q?qBl/Kh5DFYZrzUaxT+2tJbxLyo0q6OXx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:44.9605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0058158f-2bfa-44c0-afdd-08dcc0919315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7211
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
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 22 +++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 30 +++++++++----------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a14dc67dbbdf..2f0b06fb5f81 100644
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
index b739d6cb3e6b..8a86849e1529 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -69,21 +69,6 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	prev_op = op;
 
-	/* 3x4 matrix */
-	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!op) {
-		DRM_ERROR("KMS: Failed to allocate colorop\n");
-		return -ENOMEM;
-	}
-
-	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
-	if (ret)
-		return ret;
-
-	drm_colorop_set_next_property(prev_op, op);
-
-	prev_op = op;
-
 	/* Multiplier */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
@@ -99,6 +84,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	prev_op = op;
 
+	/* 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
 	/* 1D curve - SHAPER TF */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
-- 
2.46.0

