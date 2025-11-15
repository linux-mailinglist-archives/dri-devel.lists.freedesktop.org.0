Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF4C5FB9E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45C310ED7D;
	Sat, 15 Nov 2025 00:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PCrDO7w9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F05710ED5C;
 Sat, 15 Nov 2025 00:16:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL/4nvvb6O2EN5wRzKSdayiqk0giFIu8B2FW+D82Hl9O/WAbO2JUe5Ieb2dAi5JQlYjj5o7ap7Tl/jMVrr7rdFRb8ZNtTKkz5FaogqMfCUxmaelvAO5Z6ESainQJy48wxe+6r3kFtt9Ncj1JES4cQnaOa4SuDVRXM049Qy88/vCDZEn6poZ2j1raeOlFSMd7VEyddKW9/2c5NmbHKdGCvKtk2DAdeMNslrxAzwkZ4oltz9UzgLWid7mvevZmVKyFCam8nVsDrLqWvtBbq6fXylIIyl0lFrVhMR6JBXu/NFIXoeHe0/7vKV2XcYFnUWOxFvYC4P6pG2T9nQnnIWsdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbE4m1JBC0Tpsex+5gUH4Nq6CPojsgRv8O3mlfWZ7dk=;
 b=V7B493VnitAgpCKNAFN3OCtROxBIVi2JBIBVO5P+LgGKZmY0Hjc6Pb5MM07oQSFlSqOXITTFUCDAXHdTMk0L+EN+SiXqBLv/4vV8DYHxS1OeBWMDSGzmLWkCJkpRyqE9rBQFFeVpu3UYmlzlqL11PAuHhNGgV8naneljT2mJ7bbvy8e1dFubAf5CJh2snR7nL3bBqpeEaAeNDyQj5SIC6kqKToAPffYRkrKqvyA+ZyB9bSe2j66syiNIM4m2JawWbiXCJx5zt5sTfm+hqM5qp7iMS3UOolHT+qNkkrAuTP9l/JkdpoWX2oeTYm8ceLlDpP33xV1Oa94nh2qAnMgsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbE4m1JBC0Tpsex+5gUH4Nq6CPojsgRv8O3mlfWZ7dk=;
 b=PCrDO7w9qSjQ4y7Gy/WfTqLnPO0mMJSKbxtg/hh7qoO0K3trJtrv24EAuvMRh6qHX2QD6y8Jzd+FD8W9gNC8bsHFstLDxTzV8jNmJWsJ+aRsiClW2PYTOqrb4yVbQpY0rNo/lWEW7V2+FUqQO5xqd+PZahmtCdqu4iCVFvpUSg4=
Received: from DS7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::7) by
 DS7PR12MB6071.namprd12.prod.outlook.com (2603:10b6:8:9d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Sat, 15 Nov 2025 00:15:57 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::cd) by DS7P222CA0001.outlook.office365.com
 (2603:10b6:8:2e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Sat,
 15 Nov 2025 00:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:15:57 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:15:53 -0800
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
Subject: [PATCH V13 51/51] drm/amd/display: Enable support for Gamma 2.2
Date: Fri, 14 Nov 2025 17:02:16 -0700
Message-ID: <20251115000237.3561250-52-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|DS7PR12MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: de8c9d6d-fffc-4b57-6741-08de23dc2634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d/3h2wi9VCuvCV4yCkaNgxXKtiEeqgDT9b6v0dvBYiW0yAP9yUvESenVXt3j?=
 =?us-ascii?Q?9sN7rxmymGoX+ZhvewRlO18i6IHlVPbOgxZn73Tywpl4Eci1tsdsq5WGOSST?=
 =?us-ascii?Q?UkQzgUknx8eSai1/i8qO3i/FrurfjP3cJ95Ai/ajEjWiP2zhkGQuYINSN4tW?=
 =?us-ascii?Q?qFZobD0gGNqpNM6K8tQzWQnkUcvBbAD5hSLmf9TTU/JbDcWG8r+6bPDPjAy+?=
 =?us-ascii?Q?LbLrM0WkGeQSiQsoGjT/nTGAQrw+vETsN5CkRlj8Gu0SDsLExkY2blpkvBgD?=
 =?us-ascii?Q?O16bvvo5TFPx9Y3zlzB5pKeg0H3xVCcgAjg9by2dlgAM56UUSoHI/btJNUlY?=
 =?us-ascii?Q?f+PpOZLlrwWQS06v1FzC9v0SqMiU09u+IzDagpr6Dk6Ew1ewSH2jxLFn6us+?=
 =?us-ascii?Q?j+iiFNn8Kt72ahhgu6TYm/CghgrDcZ8ViX6DdAnPSeopJuDJWwtP2tOc595X?=
 =?us-ascii?Q?/xy+wYjatBScnqg+Bo8CRYtX8MAnDY/Ob6EXH2HsTojF0x13+9Mc0wSQA04D?=
 =?us-ascii?Q?AamzYqgbEwhZvC0yxm5Pt398MgEzjx0Scdqwo3xViZa3CZDYQoB/xSyfZPhg?=
 =?us-ascii?Q?25vqSGyvAzXS12pJnw7UFf5navKP37poKd8Ycq8amhlq5K7ZK2qw6aDRbV59?=
 =?us-ascii?Q?hWlkL4mjf/6iKpj1rBIisV5zbyJ5TM/scetD8T5ZEBbYCtlcg2HsIgHaeFDG?=
 =?us-ascii?Q?QPmLBMaGVWbGwuMMFXwXxXmB/Di2U5Tg4UFw5Os5+HaTArD+F719EdksL587?=
 =?us-ascii?Q?vGjvaaMFJclz5EAaI4GmWa3KCivQJE+o4Ksen73QpryvkinUZA0csQgHuwtB?=
 =?us-ascii?Q?9/G2bX/rCPf4ZC6AcDgZ/92AiHe0xtS5SbWmSttq5nbzaVnuzR0308Y0YH9t?=
 =?us-ascii?Q?NJBL1HyUU8b9EAElgsBHEPFam4igEKxSkf4oFG1CJTDc7G6Y76PoDJGdoz9H?=
 =?us-ascii?Q?zRezjzIrSVOskH7oYKTwFrgusGmUvmn6kmzQBBWETgXR8Fq/1K6DKmpFOZxX?=
 =?us-ascii?Q?CYA9DueM/EtYuHcmKHaa2vET3JjKH4h3ThpRLpLsPBwx5IdSZeF2FnpTO1Iy?=
 =?us-ascii?Q?nnoYELGXsulp0oBcM6+UCp9t0Gs3GJUtnOs5VjWyYjWvpWQzGMmdRZK/8WBq?=
 =?us-ascii?Q?24KS88AEtPCapuxW3eIMxtgBywxPgFohl5W7ixszPSficSc1IDJX1pQFVmQc?=
 =?us-ascii?Q?o377eCKJodr9pWjF9/y7ljrhFvstKYuYmhX2AyD7YqDsAoh/9bZ2Qk/hdTE7?=
 =?us-ascii?Q?K0jHoMh0lWVtleRyUN0df7alV9oUOQ/EbFT1hGULlBtyXq5uBz1Rs2l3NND3?=
 =?us-ascii?Q?kaFBjNuETFK5mSOJ+WkWhtuYjfSQFN/n0tX+iLrl/c7zianc5274zTgsq3np?=
 =?us-ascii?Q?MtX5BoMeH2nOe3cxlJI2HXHhKSsulydzdKPsxbDxylyK4iBQ5+ODeEPNy8WW?=
 =?us-ascii?Q?CdWIQkDL1/0RhBgitG84bHJtgSDvVTKFXXRO2hHZfYFnQjDRkGP2tqakewhn?=
 =?us-ascii?Q?gYIdYNSpAWuMpIJjoIO1VMd+PFcj4AtWLn0ZGvNX5MNUgWWPKU/0V21LNA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:15:57.3126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de8c9d6d-fffc-4b57-6741-08de23dc2634
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6071
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

This patchset enables support for the Gamma 2.2.

With this patch the following IGT subtests pass:

kms_colorop --run plane-XR30-XR30-gamma_2_2

kms_colorop --run plane-XR30-XR30-gamma_2_2_inv-gamma_2_2

kms_colorop --run plane-XR30-XR30-gamma_2_2_inv-gamma_2_2-gamma_2_2_inv

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v12:
 - Add gamma 2.2

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 3 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 3f10c6157f89..fe0094585c04 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -890,6 +890,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
 	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
 		return TRANSFER_FUNCTION_BT709;
+	case DRM_COLOROP_1D_CURVE_GAMMA22:
+	case DRM_COLOROP_1D_CURVE_GAMMA22_INV:
+		return TRANSFER_FUNCTION_GAMMA22;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f205f3c31f6a..64a4757d778b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -36,17 +36,20 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
+	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF) |
+	BIT(DRM_COLOROP_1D_CURVE_GAMMA22);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
+	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

