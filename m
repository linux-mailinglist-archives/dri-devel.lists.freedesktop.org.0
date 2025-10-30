Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60560C1E4F3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076110E8AD;
	Thu, 30 Oct 2025 03:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pQqo8EMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013065.outbound.protection.outlook.com
 [40.93.196.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEAE10E8AD;
 Thu, 30 Oct 2025 03:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1Wzq7cnRAW4p3U+ayp2a6/skuTuEAcdh6c/zdZGqtMk944jZEa/9tVopzXRTNefOTR/C2opXfNZqXtqsBGH63+7/fXzbYCukwRjNl1VMCl5LmnkKNwFPlwc9N67mTMA7TE/k6n9vlNWB+369NSpfofEOhg+tCmvwpD8bJ+Fy2OFizuXh4nxms423Z1v1EIFMjS6JcyJnLgKulgkHDfG9q3/etKc2nn89J+9GqyANLGuc2r3VFN13pt/HrNpWCIs0Nrx/Xqp3YB9SF5/yABDnwbI71yU9xoNhKIdpansU/JCvVRP0zqeBrvjmJhqT6dJPA5I7JbiLWxa2OtZXMAfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqnIohHyy3IQhmst+dVbv7EvCWYmqJe58D5qwz0oVjU=;
 b=JwrBblQ9nmWIkWvwRU0xR4x9z7LUaJTHPBgDBriOMgpTOmcpZluWrWSl8KjYo1EnrpfhPkN/xCjUQRyqo0Q20boKjE/CyiEJajv6y0xGlHOuzThgloip5JehXAnhNvFeP8NCJ4+S9yStBJntJ+MROVihEu4MxVSvb8cK2a5n8yfs/wH0MPIYCfV9IxClptcsUlLRmewdkTfdCRgWBH48cYEzh4oRifO6Lp/+mX/UWrgCyfg/bTWqV5WSGZ5k12l6K31nhuG1Mv9YMV2Ha+2/COLVSeGIMdcvOi6nw+VO5SkOJyRyxJ5PkRhFmwSt5/bEDkeBdEJOzK/OVkJLZYB5Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqnIohHyy3IQhmst+dVbv7EvCWYmqJe58D5qwz0oVjU=;
 b=pQqo8EMW6dPDcRvfJmnFtaT865V/qoQmgBf0nBP4G2uAapAssDrqZKK/jue1D8XjWCxkW9YiJY5ilY85FqU16vKvAZaydXVAQsiyj9sw3xlRh2TSdrqulY9+qzFNe57GPGn7e+E3amoh0T2FcXDoyLPku/Zfp8PO8oH2nyHBraY=
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by BL1PR12MB5705.namprd12.prod.outlook.com (2603:10b6:208:384::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:56:58 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::e7) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 03:56:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:56:57 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:56:53 -0700
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
Subject: [PATCH V12 49/49] drm/amd/display: Enable support for Gamma 2.2
Date: Wed, 29 Oct 2025 21:42:54 -0600
Message-ID: <20251030034349.2309829-50-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|BL1PR12MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: b19ea436-73d2-4c85-9811-08de17685f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IzvgQHz00Wbbb1Uv2AcmQ3X4At/pEcr8DT04Awv2UALtcTtHjY8+zWhwrJwh?=
 =?us-ascii?Q?o+5VK4Bzn5basCHpZnHj68edZGOQtv19cidFbo1pVW00BywcaW++e7jylbG2?=
 =?us-ascii?Q?21Y5VJDgZYbp6ZpmFCKUwsgXqg57036fmt3Vf3ixMq4KA6mVtYLDhsyonvmx?=
 =?us-ascii?Q?DcogIyTAIs4DebuGSJEh0etvEs76cjkZDSJA7Gv7W5H18sJxrMfYhQVeBOtZ?=
 =?us-ascii?Q?w4UHk4e5PCE+wUb/EJQW/WCTlUV4l6hqwhgwOLeLLc60njy9Rr4OZYfEkCB1?=
 =?us-ascii?Q?jFwwVZmXW7pF11YMfM4/QYT/QTyx1XsHD4jr/y/9mWzfwiLnTdRhcQf6rPsz?=
 =?us-ascii?Q?9tCxV2z52T75kXKqhm7pM/zGaUTDsBIVsWLjLnLMKdslxnCFIwYcN+ZLNZf9?=
 =?us-ascii?Q?ZUOsHNtzJGwG/3dJTF0ilE9im64L6kDWCyMSzc3Cay0XbbHt77zUgEQggQSM?=
 =?us-ascii?Q?Gq6YzL1DEPOK4lpgw5DkeLqc9BMQboMp/izBTqnzqYgDebvoE3xExx8LpbbX?=
 =?us-ascii?Q?YVqCXQ3IPAVYcNdLJY61Ojbg190WAVvnpZbAfqBtWD2pdeTOgyG19QUkwEZH?=
 =?us-ascii?Q?v2/fIiAbwtI5uXQSbxLqppV6bWtqDsvppRZ1oL4wk5ziYq4wd7KEBiMGsdt5?=
 =?us-ascii?Q?4KG+XEjxfhZvWaXyMRIBirQ96qIiriCD3J6TPAwSAwzqIXhawrQmA52wjdmo?=
 =?us-ascii?Q?jjJ+h3SBfqlrg1RftizqvPlyRE+py8SlSzSDB9bz3jVt5l/gf4JgFL/corzh?=
 =?us-ascii?Q?oBqjuVPlPnINIXQrrReO+WE9a8A4uL+RgXbdh9DFUJkqyr28b+Zaiui0jcOa?=
 =?us-ascii?Q?YNl+UizgA1NXS5V+fMQk7TsLyofNMimQwv3ltNRF4xYpa1/zFa+/1n0tz8X3?=
 =?us-ascii?Q?wahc9l34uK1yVvYp1pDWKKp/nzs2sQAn//UA2UtM9lpGG1yQ9bsgiUU76iT9?=
 =?us-ascii?Q?gDSEJwpAPqdK8RDKDfUXa6tcvfCoLK69xbsZtVJaBngquC1UbY9qLAeL2U04?=
 =?us-ascii?Q?zfEviB8w0T1DiTOjHFwQ5ZlF+gKt7lq2vZKyPkkt5M4dt+R2PkGtsRWNERUv?=
 =?us-ascii?Q?u+1sCaOV1jOWt77qh/ovumSQZP3e13mdHBQ7gy8n6knGuRyzb2YSofhEHiPd?=
 =?us-ascii?Q?jfDcru8cBYruwwwd/BYwVCVFsma6b1HkOQq45D92mi7KFRW1B9TI2xO3JMpP?=
 =?us-ascii?Q?u5Zbe0H6vtxuSdDTd1CzcAgh+yPheV/AR2zmQWMGSIpiKetZXI+12fic/MQa?=
 =?us-ascii?Q?nm6LimYP342EhMzL/WPo2PH8w3/KgkfJ1qJiRMaxUmaNNkCphSbrbhSxybmp?=
 =?us-ascii?Q?pc054oLvnj5h6vmB6oLmTtACAdti/yyL9uOfz2HJr0X/0kavIUQDTCNShyix?=
 =?us-ascii?Q?lOw3gYId6ImYPe/aAkxpeW86sHahN7t3/gfaspFzZo1CBZzcA2n1hAWUSurx?=
 =?us-ascii?Q?xAJPfhnQ4EaQm81mgBIRkScviEv9Hhmy7941YEQyrL6kln3OZes3ySGgjeaW?=
 =?us-ascii?Q?KSfcuR9Senp84sbNO/QMBR28w4zuLzQCNn0JV07HfoYE3FOyFFkZPi+GU9Jn?=
 =?us-ascii?Q?WttkxGAUzKCqcx+bxJo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:56:57.9774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19ea436-73d2-4c85-9811-08de17685f99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5705
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v12:
 - Add gamma 2.2

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 3 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index c3ddf136dbc8..6992067fd7d2 100644
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

