Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156AAA4074
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325A10E68B;
	Wed, 30 Apr 2025 01:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3N1HiccQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF2710E687;
 Wed, 30 Apr 2025 01:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbexnW00MH72sUAdG6q2Ohaia9XX7B6WNCk3/ZtB9CDEDKVqEGpx6cO17Vy4AURe784DCIV0qXe2U5MhsyFZ7xwvQCZUQiS+CipkmVmf2wIUdQo6RQCtkNX3nZqHDYoxADoJU/Ps3KbltMkIr+Iu0RV3LygQHDP+qb8osgYQNAlqIQe+xVA5EEP54vbME1r/EEHbObuFwEEBoxIaxslUwMttmge0ZBbTlcwnfNO0KD9jUvSNAL7HXp5HTkooSZGd68R6S3i+N+X4zeyk6enLMaDCSpK1zHmFmd3PRovWRFZL1q4liNYFgmvzqPv4l0hMfPZ226B6yZNDKF9BMeVEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAEDjsUmol6nY5Ut6kb7gbRemWbQx1Rl6s/qx5nj+PM=;
 b=FsVgJ/h3Bd3aRIhc6CZWhwdH8i9fNJoZQPHQWMGCDjtXFNXQhhLt3do9osux5HTd/A7+RRwfrra0kWpkdikt8ZGJB7RgXCpDjS6X8e+WLawlHP373wppAsSzgQx2j0fjgWdaacUcUmiidP0z3aD+HVGp42zJ3WgEI3a/jH6aKRTiJavK+XGhfwEVUzWZd38vmMxMUaJTkgS8GBv12LT0SDuOiZ2pl4hhikbpVOnZTD5uAmgVYi0N1iWruqybEKfKWNS88VP93PZqJtz+kjXM1Y+m7BJfODqThw/JxEGYHqLo9zDoeH0iML1X68DPF5x2V2i1xGhExpQuTkLgs8eIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAEDjsUmol6nY5Ut6kb7gbRemWbQx1Rl6s/qx5nj+PM=;
 b=3N1HiccQlr5wNDuePV9FqEa5hmtaisWvss0Onbdw0i6atLoHtEbpWOJEfVLmhWG5h38ph/B1o/WjYHllixchMeEbC1ZsUB9jvHxg5TAq6wBSivR2TgbpBzBAY3p3pCLAEAug88JoJnDfVtcc+5d3ORZJIP7jFPdmgmmpJ1BehuA=
Received: from BN0PR07CA0021.namprd07.prod.outlook.com (2603:10b6:408:141::16)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:20:56 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::32) by BN0PR07CA0021.outlook.office365.com
 (2603:10b6:408:141::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:20:56 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:20:53 -0500
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
Subject: [PATCH V9 37/43] drm/amd/display: add multiplier colorop
Date: Tue, 29 Apr 2025 19:11:07 -0600
Message-ID: <20250430011115.223996-38-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae97899-c5a7-49c8-77b7-08dd878541ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hqEXfqzHEM8fRCV7jToOIczgQ7RKCpTUEaC9Jan9kGze69s+w0A8HHvd7RP9?=
 =?us-ascii?Q?+hwT3RokAJLiKqNjRg1kOgoOHOiq5T3RzzvQRIcQiUhG4FFZURA2fgNS9Qo4?=
 =?us-ascii?Q?bVsnQRr5WIjVvBuki1kxA6GdA2vR9X4vecNxyyQrDdwID3QeujnBLW/T53MD?=
 =?us-ascii?Q?e19GMy1Nqb//0UmReGdf5vkcLCJlRSdE+bRsYzj0OUGXOQPkmMTSJpe7xwQA?=
 =?us-ascii?Q?PcpClELwEDk0027JZ13+JS9CLO/qhGk+E9punnq9mzsATjDLYFiiZZdvhedF?=
 =?us-ascii?Q?0WRGaOAkZxCDyd84I+vk3/jWJxqgk5/VkaftoczxoMFgPEIKRw89WclW0zFX?=
 =?us-ascii?Q?Be/1YC8k33TZoZ8ac70eXhuKeYUp2G0Wt2xMYr/g8MuGKnLpdbGEBwgXLo5z?=
 =?us-ascii?Q?DIh+0D9j9jlWsQFcJRWPGQvqiSCJ/TvIW8k2MfSbV106xbRrpYwAnblaknRK?=
 =?us-ascii?Q?pJWoyooptfLRMW2dWkoXB/rtXgfElrY7prMjvdosLBYPjbt9MLLUi+ph4+Ow?=
 =?us-ascii?Q?Snd4UHIH/LFbw0eIyzcdE+IH6tpX21UKZKmD12dGsCo7tU19MtG+FiivqYKw?=
 =?us-ascii?Q?vAPo97hYBhoDmuNTwtD4V3ZJua4DIV3iYIA+NZoeuflQqR0YFdSKYIBLlKnD?=
 =?us-ascii?Q?DT5xGZfBSCENPKoUTzqBcN90/SXA+zRIznep+du1RccyIWjUP9Ec9jaLh96i?=
 =?us-ascii?Q?7qu48gjNycaZ97cs97JAZQGR2hpy0VnSBiF1TI2UfDlC7dfl64n9Q2cIgWZ+?=
 =?us-ascii?Q?47wGUnOut3YhDyeOffHLpiw+dPWgprDJLnkUZVJ5hVXTh/qAGnHNp98chcJ5?=
 =?us-ascii?Q?XnvdAdEeaDjILg3Dn8RkpX3ZDdz34A6whg18k1KGMDWYAJmeCVIDMnnIrVjD?=
 =?us-ascii?Q?04YdR3vifGkVU9D3FxSpWAPUQdczYU/1FBTyK1VGyyDhhOZUo9VB4o+nhZk0?=
 =?us-ascii?Q?zttN0XdC2rvwXEFmWQYTN+aSU8At049LnBPfvP3WmqUpA9j/QsZMSZYm+8wi?=
 =?us-ascii?Q?zSutXwYFwR/czmIvQiDurXdWown2/dC+wb1k5kX6crbZ1+0ltdZVNrUr/2p+?=
 =?us-ascii?Q?Ey61arsddJCA8Xx58/k4TUlHjWZDQg8iaY0TXuLzkp9q9rXcHi4AXmrnb/LN?=
 =?us-ascii?Q?9UyT5x4IAJ76lR6fbysC9mCEdAWiiMPZ7YIdmBeT5kEaSSBId+L6si5DVcy+?=
 =?us-ascii?Q?4FTQDYtcJGDoLUWP9a9WKC7E2QMsFq2k6iIxrgeDaHciq+ehFXYbxk5edFOB?=
 =?us-ascii?Q?8HKT3VNJKlPiDMJ1apR+M4+pt4Xeg+1xfgKtwAfwDMVw1yoO4dSyoSvrqX8T?=
 =?us-ascii?Q?/Ib02+aSihcqrMa3pQbRoT4jHsklykwynWrprRoF1E7rwS9dv/6FaRGbrZLb?=
 =?us-ascii?Q?cb/llMMIkbgC12yv4mfOzqnWjnuTwF38ozlSwy7X5blDFEBrO7dkwBi4pxDl?=
 =?us-ascii?Q?32SkVSOBfNiFT82yCA05jP7T/FBtMyMrnup4jwYrazQYKj7kQdoFE3nX1V7I?=
 =?us-ascii?Q?yFRT9vziMrVGPSV4sLfdR7abV1xhJK9nUxv6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:20:56.2750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae97899-c5a7-49c8-77b7-08dd878541ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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

This adds support for a multiplier. This multiplier is
programmed via the HDR Multiplier in DCN.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-multiply_125
kms_colorop --run plane-XR30-XR30-multiply_inv_125

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. Multiplier
4. 1D curve colorop
5. 1D LUT
6. 1D curve colorop
7. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 268d4837759e..0044ea112ef8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1252,6 +1252,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	int i = 0;
+
+	/* Multiplier */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1466,6 +1495,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* Multiplier */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no multiplier colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 39f0b383700b..efd4799165a8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -91,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
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
2.43.0

