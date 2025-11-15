Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7EEC5FB8B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6F10ED46;
	Sat, 15 Nov 2025 00:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Op4nLta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013043.outbound.protection.outlook.com
 [40.93.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E4010ED46;
 Sat, 15 Nov 2025 00:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE/DRdYNwQd6yrVUKfvJmWDErEMRzb17SMh0Zpd3GR9dFOlsOUlDjlyTUNutLK7SO6gGOjRr2W9SeofwjAn8ysRZy65nGW7BQlEt36CuyujuhHHrcx5h1Up2xOqvELUDNUTHzipBodPuRkjjQQTqLBMapJRcw4+CLvq1vjayDZoqPHf9b/2Ra4DTwsgWUL6Dzk10MY9CXKShxvGgrx+yQxInocWgUeNBZPagFlYH5MVFUf6L6mT2Cl2OEUAA9uWisAveH1tbK83pX55A5IGSsA2y5F63SngX0Dq+AfV9W1hJ/8yGuTqEXLXVNsc1sBSqO0mNFpQA3w/EfwOrWVMQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+RW7aWxucOAV3wRqfZdGDaujW+ntd7db9DdlHwQoSA=;
 b=PYn/GLaYZcz27eiYSpnG895nJ7SA1gLDb8ALnfY2ZZzJzNWmqe2kKyoy41nguUk5wpgdFbfPUUTXs44ccBe3E7zzMDJzr4v8kvCcJE/Qa7/kTruVVWkeeel1e3eFMllS5pTNSJ4h9c5l17AZrLHPhEJwSobrf04Aq/1bvGBcYypByfSXfywpXvCO8RwccFB0UzpzaGfrIwX1pZgIRGwGqXMwNbLJ6BG9UqSJtKhk8pj+4+qq+6Xuu2yiQ9l5FMMunZr5VeZHOonHNSFC/voZgSn4GHWc2ueCut7CKSrshRyRKfiko5o8Om8tBuHb8iQGbNv/0PIslifVE7OJ2sqE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+RW7aWxucOAV3wRqfZdGDaujW+ntd7db9DdlHwQoSA=;
 b=1Op4nLtawLun6mytCGQDpcHK2eewz5WrzINRgv00aJM+cWFo4BDTRBXrN2MeSY5HsuJKPKwm0MmPpLiTt6civTtENJcnBppYkp94Ciov21gvHNs0qCh9szlMEHWP07Vo4Cdz5V1iumkOxOAuspKtXjcNRJQD7ZSt+5fBIo1NioM=
Received: from CH5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:1f1::25)
 by BN7PPFEE0F400A9.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:15:14 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::a2) by CH5PR03CA0007.outlook.office365.com
 (2603:10b6:610:1f1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:15:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:15:14 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:15:11 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V13 48/51] drm/amd/display: Ensure 3D LUT for color pipeline
Date: Fri, 14 Nov 2025 17:02:13 -0700
Message-ID: <20251115000237.3561250-49-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|BN7PPFEE0F400A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf20cac-f629-4003-3bda-08de23dc0cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9wzfcuOxbExAJDVk2i+0Mf0WrAqq/M0DnFQF6zAPyPqj+zKQxiZI9ixCewLj?=
 =?us-ascii?Q?Ct4nn6FJY4AoEYGE4p8OWFUIl+k+9SYplPQ/sMQgcH4mFODwMJEGtkr8vM8l?=
 =?us-ascii?Q?KAK4fkJ2/JJZ5sc6xW9T6MohJUR4zUs2ukexnEYLLohE7Em9fJ7N8rpqcqLZ?=
 =?us-ascii?Q?3lE8+g6uSGdZriUqZYHa/uDVmKXMZ56Gt2UNDfiZ4dpa293ykk1NMVh2eVIC?=
 =?us-ascii?Q?KQIv2mXcnfSkArSSmZVeOdqmR+jnhTvgw1CA+IH/piUZEA9Xo89fihI3SnnM?=
 =?us-ascii?Q?28kf7wwvM0WTixT5rvxdfltHWhHfhdYHi5ml5BNTOCIFNJkpUvbqo2FdpEGa?=
 =?us-ascii?Q?d+vyOR/EaFmbn+e9KNOdORe1x5QSSD/PeZdy+B70dcoKeJD7Ol/5GOIoFwe3?=
 =?us-ascii?Q?IwC8UxlGu4RWNQhzpRaYkkTxnSPXHQMkw7J6LE164QILXczn/XIoM5TMXK8/?=
 =?us-ascii?Q?d4i+KOcAIZh93FB1JdNwWgoq6lbt2oZi8iwSLSlZF/FGSng/tfZ99AtHx/2t?=
 =?us-ascii?Q?J27iF7J8onULdG4aXkAnpaLskLlg3TfAOGCRR4f9S6r1B9kJbmYCFAeJOcrI?=
 =?us-ascii?Q?cdMgZoC6aNf06y58eVB4zDqOPjxDvC+gDdc+erlcXE1kAAAS83iLFIpCyY+B?=
 =?us-ascii?Q?9uhzTcFCpKI5vqozf/vsVemch+3lHJbofwdIKKBl93ZO+bbO77Ddpgls+Xs+?=
 =?us-ascii?Q?4CkMToMXtWJArP31VTeZmpAdkQInRa9sos+54NlNO8+Qisx68iBk2Eo1oDor?=
 =?us-ascii?Q?23tY3KwIjGVmX6WCFz8V+w3NcgxtvBy6BvaB43Hk3tGj3eDCKzwuNpR+Exdg?=
 =?us-ascii?Q?6cWW0cusIea46mA8wdr2kCmFXDK8y2cFReDxP7bloPgfgyI50DjGtUl16OXJ?=
 =?us-ascii?Q?lYa3x70YW9fkiXdjYEs+qXpVvnaS2wCCCbHuSCBBjMNLexzN0h1rvdzz+ut3?=
 =?us-ascii?Q?OHYF+WCzH0aoJWEjf1TU8FjKC0DcRwbuE8bcworhT+dpbR4zVdpizVtgnND4?=
 =?us-ascii?Q?LNXuimLxuqQyoGIo95NJRGZBeqsViEFTU0CeFghwoHA52WLsQ5kK/WZXSQR+?=
 =?us-ascii?Q?s2EVo6hWeIJdeIfnjOelTaDZQknt/F0kbCQqHwNypC3gIJeZhPng2TkYYJzu?=
 =?us-ascii?Q?YrTAQFywBidYlUy8uQFBKH7eKFTr/c+aJHgNSLgm1x1Mu+BWEnKt0Fy/zDys?=
 =?us-ascii?Q?D47uF6qqgSZUlWzHmVPeKex3naGRUkXT3tEOEANxdYBQOn7tC5yx20G6eu++?=
 =?us-ascii?Q?143Fitaz3Jq0RyNdn9c4ne0VeBttnYU1Cq2ZqFewfp2r+5wUBajEB5cuHYEm?=
 =?us-ascii?Q?3tAOY5HrU635l89+EEblZ5cBeYHWY+OMHMqY0Df8vml+wMtepE4AKNpfl/oZ?=
 =?us-ascii?Q?xk4rzGvdugPrS6jHY+vZ82T1A699wE2P8ZE0blIgpt/320Tk2hEsxgPjnc+R?=
 =?us-ascii?Q?zN5ZSwEs+upZWJsJPREyN5BW/oZIrpL3XKjFHGQ51WnKLI9KWBUtJ/qSXAdu?=
 =?us-ascii?Q?6vF2lGvHD6BxZb+ccL3IHepy/iIf1CW1U3cShRbURR5he4MYwCvYSqioG//h?=
 =?us-ascii?Q?4I+f/YZJrb+chpQ4Tl0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:15:14.5828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf20cac-f629-4003-3bda-08de23dc0cbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFEE0F400A9
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

Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops in
colorpipeline and handling these colorops.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v10:
 - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops
   (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  47 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 103 +++++++++---------
 2 files changed, 78 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index dafe8a0afcd1..3f10c6157f89 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1868,6 +1868,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
 	struct drm_device *dev = plane_state->plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1900,32 +1901,34 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve & LUT - SHAPER TF & LUT */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no Shaper TF colorop found\n");
-		return -EINVAL;
-	}
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D Curve & LUT - SHAPER TF & LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no Shaper TF colorop found\n");
+			return -EINVAL;
+		}
 
-	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
+		ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
 
-	/* Shaper LUT colorop is already handled, just skip here */
-	colorop = colorop->next;
-	if (!colorop)
-		return -EINVAL;
+		/* Shaper LUT colorop is already handled, just skip here */
+		colorop = colorop->next;
+		if (!colorop)
+			return -EINVAL;
 
-	/* 3D LUT */
-	colorop = colorop->next;
-	if (!colorop) {
-		drm_dbg(dev, "no 3D LUT colorop found\n");
-		return -EINVAL;
-	}
+		/* 3D LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no 3D LUT colorop found\n");
+			return -EINVAL;
+		}
 
-	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
-	if (ret)
-		return ret;
+		ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
+	}
 
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f89a887c6b14..f205f3c31f6a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -31,6 +31,7 @@
 
 #include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
+#include "dc.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
@@ -55,6 +56,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 	int i = 0;
 
@@ -108,57 +110,58 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 1D curve - SHAPER TF */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
-					      amdgpu_dm_supported_shaper_tfs,
-					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
-	/* 1D LUT - SHAPER LUT */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D curve - SHAPER TF */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+						amdgpu_dm_supported_shaper_tfs,
+						DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 1D LUT - SHAPER LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 3D LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+					DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
 	}
-
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
-						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
-						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
-	/* 3D LUT */
-	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
-	if (!ops[i]) {
-		ret = -ENOMEM;
-		goto cleanup;
-	}
-
-	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
-				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
-				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		goto cleanup;
-
-	drm_colorop_set_next_property(ops[i-1], ops[i]);
-
-	i++;
-
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

