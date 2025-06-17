Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588FADC077
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019910E617;
	Tue, 17 Jun 2025 04:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lnnANtdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698410E677;
 Tue, 17 Jun 2025 04:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+xzOUU+0UCWkmo4pqQZgdCiz72XykMnkXfTrRi63BhT2nvx4NY3IYaorIa+EhfGDwBzJx+HGFz7Y31G6pB/ov5JQRpDL6No+dbTujQ8TTrf8p3QAskQOlIFpfN4aDoeO2+0Hfjngd0djOk3yHUGwXuQJ/ipB1PRlSNHl3qHyZST+F7dZAr/dPf559leQfR8Vr7lSz6ttc6xoC0uedYyoiZO7nozsw8x/4uBoxagiVS9G+zjqcu8bJJb82tHh0UmrRIFNKnSlP1+ZxaVhS027yv87SIoJ3JHD7X+Myrp22K/U3gSwkWSnB32MhcRaFiwiJfHxP9ju7OMDLSORVyKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfXpTpOurWFcsHyZLL9mqMRe+F/+hH5BuMm1r6/e7p8=;
 b=G7w0LDmiJMXJI7xkM/zMwukJaHN2EOdK6dhG5weiSiKKXpCJLQrHjhDy29q8ejqsoO9+YrR+Jz25zMnB13j1gRnWzh8P/dc6vTz0GluYwVabcxjCLdy8dY7Zkoz/jt3qL1HqftoP4XohjptBaB9W1qfVZEKjALlCh3RjlpNAEpeSmkQP2r+jZhod8MVXnDm45amO6VzVWYZ4RO697IjEKvYQnD0zXgz5pSApVlB0vCrbkJqkNv2qWcf2FOGlYFxFCY2Dd7jdYllDtzWuPnXoiRr2Unz8knA3h53pE6UtbaaDgEyyH23VQ33h3p8ABc525FVmEL4cYNk+Q5W5m/MSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfXpTpOurWFcsHyZLL9mqMRe+F/+hH5BuMm1r6/e7p8=;
 b=lnnANtdiXwCAEE0esbvaUx1bQeT3/eHWJAWi0jjDN0iQBIFEHp78tib0eWQumqGavsmoNT88hgUnzX5LUmAhxecsIF4Lo11jNWGVWVrJM+8rFH2KP4Bpvn5EZnghRJgmW+IVQ/GSK+u9jIgV7HXYmUh5pYxJh6EwEnib81s8MOA=
Received: from CH2PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:52::13)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Tue, 17 Jun 2025 04:26:02 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::39) by CH2PR04CA0003.outlook.office365.com
 (2603:10b6:610:52::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:26:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:26:02 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:25:47 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 32/46] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Mon, 16 Jun 2025 22:17:14 -0600
Message-ID: <20250617041746.2884343-33-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 867f2b0f-93a8-44a5-e2a5-08ddad571196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n4BXdpWmvReFOYAnvfxFdTWnY/IpEJw5GJJ5JM/Hy7TgAkkC20WUgG7k3Sz9?=
 =?us-ascii?Q?lMZkOdZkLLViZWYfnGatq5cNOBe9M+DCqR/WBVXnaoI/xeQlJPORSXOVc8HY?=
 =?us-ascii?Q?iLEXpOK0r3ElIWQQfsfWP0RB2eyT1xd7I6i+xcM7mLGIgaDCraj/kbOjbsJq?=
 =?us-ascii?Q?3mP8oVIJ+3SU/SmR3iyTEKvSD9ek1c3i+P24PhWKXPKTmCBoEw6EFjK0alm7?=
 =?us-ascii?Q?n6xfyCz2unejo6uGrXEyCcxKtGnhKrWR3Tcw2rMcXnagQT1zu6RACJo2+etc?=
 =?us-ascii?Q?FM0fBRGBXn+1QOTv0dIpa7Zt9OTYbqrhfU7JggdS3V/ENpb+0jYjCaNkLeyv?=
 =?us-ascii?Q?klm7QFvKedztr/Hp+STXQud8/M7EfFX4wzEMQaURg/NV8O60LOjBUl471wQ8?=
 =?us-ascii?Q?1g5BLtAAPXpHXtawGwyhSzNDb0oqUMLT1DmVBOdJwdi46lEfq+MTNllbLmyN?=
 =?us-ascii?Q?F+u6udAv7z3gj01Osnlx7abdIftCZoIe79kUTJAMfFKVLwwwIp3cuECrTQRd?=
 =?us-ascii?Q?dWwSY5Y/jL7DqFSoutlR6C+yobX+0hQVknXQR0vbNqYRMDgJZNPtAHdTpjYQ?=
 =?us-ascii?Q?4UFHNcF3m8l26KdB/DHyF2Gip+Dt8nOIM8QSw1HhHJ0gJzOS++M1fT0zwy87?=
 =?us-ascii?Q?v3FpQD/KfpQEI2uMENjf3jJ5bnj3RV9x6hmJpF+5YFEwi+NYPC1U3MBiwICg?=
 =?us-ascii?Q?I8P/UKNImZSujjRxPLfKCvCOAVIEe2ZmM/yYGzU9fKBALEG8QDUPufY5TH4h?=
 =?us-ascii?Q?9RW3Z8uHbjhhpjyQxAjPILTTAlf3ZB0y8V6WuY+u3MDn7+XPbnexmieAsJVH?=
 =?us-ascii?Q?H1oFgN4KglT745xsWU5Tdy1wMZKqUdzv+6FQL7LiYHVWDpLCkkI2p+F5DMU1?=
 =?us-ascii?Q?WZ2wVhYbp9atk9cyKZY5TLuW2RKXPUw3LGYLAwgvGRT6SNrMmw9jJXgYKsHM?=
 =?us-ascii?Q?5H7no6gjayR24HtmmouXc+duTBeX8vkKKnRXz2RY2iAtxfUF01c+xq/DvRl6?=
 =?us-ascii?Q?rQBUMrz+U3CSpD9Bf4ueUUT9l9fHyky1p83XVZAGzlIEDXodOAVuc1rAcg4w?=
 =?us-ascii?Q?yopTGJFtbmaRKMdPKIHQMh00++rbnvlbfB2+Byn7oUtOHbyBwxFO4d1eAm8B?=
 =?us-ascii?Q?3KE8oS9qpfgZikwrK+UkeJaLpNso6BGsqQgCHChl+vOXhPJNbMOpYilG4aQK?=
 =?us-ascii?Q?sqC5Jsgb69sS88ySt+QD2Ai2QSHp/t7Tfy6fe44rxxP5TqHjaR0WbsVCOOyM?=
 =?us-ascii?Q?ME/+15tfnprDjSbmUvemCmoCXQoo10pmTCYaaQJZsgGXvM+TuotEBLJKRfMW?=
 =?us-ascii?Q?Yxto1xtrwZ6Kz2Zj22m7WeRbcfTyioRd95XaO7u+DNBiyFXJOWlcVZlk8sZh?=
 =?us-ascii?Q?SsxSyBjtq4WBCgzD2qRstiXgos/0fD4NFsR6YOwX9faGqM03YGg25OFVlUFD?=
 =?us-ascii?Q?wTtRlnKamnv5m7R4b6hTQDCJteIIMev0Bvznogpl9HFVbCIOxBh0NQ9/iAGK?=
 =?us-ascii?Q?FqdWBWRBzLfzgwzbv2HTsti5eDALQngFtF1C?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:26:02.4774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867f2b0f-93a8-44a5-e2a5-08ddad571196
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741
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

This adds support for the BT.709/BT.2020 transfer functions
on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this change the following IGT subtests pass:
kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
kms_colorop --run plane-XR30-XR30-bt2020_oetf

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V10:
 - Move amdgpu_dm_supported_*_tfs check to Patch 32 (Melissa Wen)

V9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end

v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   to "drm/amd/display: Enable support for PQ 125 EOTF and Inverse" (Leo Li)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 315a1028cd45..f645f9ded95f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -679,6 +679,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 1675913b3f83..5c84c6a5a74a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -33,15 +33,18 @@
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

