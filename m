Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F5C1E47F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578A10E885;
	Thu, 30 Oct 2025 03:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a91X97YH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3FB89C55;
 Thu, 30 Oct 2025 03:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkxsJiI4HA66Z6Q3Qv368CnLkb6Jy2owdSDwVb56uPS3MdeIpT63a/kxhClV9I59YTk9gOCwmw43ip9nFt/MpmnAuBS3VfOiVOnaa1Y2d5SE/SrGAgjqba9ZnXlYWZQLgyMN8SS6o5Go5wJTZxDIv1c1VwkKS9FCeb9dPDalZR8Jc/AEhf6hl7rzg+UBvw6xGu2C08EDHp1N0ibJsk+S4yG8+KFSgd2HwMIdht33igXDdK1MRd3bnaiGXMXJfAtsTT49knDpU5aX/Ccyi2p023AXipIF2tjnhgjA4/ZU3imF7VtfYVO9XADNFrDeAOP5U/RuNIpodWRG/UQ0tpkm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIhUHk7pCICHvuVLwQg1paW1WcLdxum7F2DgcutrVdQ=;
 b=KD8KoGh9YCImCiHmWr9X4Fe3hq2+T9gN0xMIGrRnylAyNJCtsnI8oGbe+q4Q3zGgGwNT4hFHqdutPxylQDLjW8BTOQRmUU0djh32ACiFvn8FahPyEvRvwSQwWz3KGTLHJnCeYhTrJwsYcH326ndDBWEA5ckmG8uwuZpxnP93ifpnkr+MeEQqBzTTErAb5ZngoYrNG3PQL293PRSOz20au+gcRZ0ann2NqzuG/mncJeyUANb6R8AdJhsFLk4dZA/P9+kkXzfnIR01TTCMLmWJBuB9c+jTvjZWajlQeT2N7OQtBJmJKCQYqezz/bFpf6WnoKobQbI9KXR8RinTrBuYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIhUHk7pCICHvuVLwQg1paW1WcLdxum7F2DgcutrVdQ=;
 b=a91X97YH9bBWSU40WXWgt5KSjjF8SGgO1BowO8wV724sS89SOmGg7dYBHvziHLU8d1NVvNNM357PkUJ5O9OvRIHROztleZ+2rHLb8tjYfxw8GqcvxP0vJCLpurBQMk8j2NCUmd8RixM6JOd9UBOr+h1e7P55H5GKzx8GG7CK2Mw=
Received: from MN2PR06CA0030.namprd06.prod.outlook.com (2603:10b6:208:23d::35)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:51:59 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::33) by MN2PR06CA0030.outlook.office365.com
 (2603:10b6:208:23d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:51:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:51:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:51:55 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 29/49] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Wed, 29 Oct 2025 21:42:34 -0600
Message-ID: <20251030034349.2309829-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8c7fdf-9513-4176-1afb-08de1767adc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TMuLMjhjAZsc0EokcDLiWEcPnD5xE3d1KHPyUWcwCeXHzv73eFI4QXbfwmjQ?=
 =?us-ascii?Q?1JotKxHPs7W+BzwJhBHRDyP4L88kidxGehcRg4lWGks89zVNmbEveoBXH0FZ?=
 =?us-ascii?Q?FwKFQJR6Lzy+1UIf7BSqhqZRxnTaCRsDdz9wdY1BhNukce2Nj7ipDxHAEFrD?=
 =?us-ascii?Q?ODHsuSK8soSdtAtm5YYmDjGE7VxLqNL5s5wil/IOcRNT58K+WvD+EqfmgKr9?=
 =?us-ascii?Q?/RVZPQfKNO4eMWsG8KpZa/ztkd50WxME8c1zCDnK2zcxOZcYvU87/5yDN9Tb?=
 =?us-ascii?Q?d+l0gcV5MopTW33wrysF8iad60IHSUiOFgD9kjJcfj9/gD552A/rW/jRUsXP?=
 =?us-ascii?Q?PlgG/br3N8wmfY3f3EOtA2Ta7sIiAYF6DQT/FBVo9vh2cUH2pNWdWEtrRiHs?=
 =?us-ascii?Q?UPAuj/weMunBMPmCcV1fuMTgvBSOgt6EEbFAXi1r5sxUgV6fUyLUzHvOEY6d?=
 =?us-ascii?Q?GFDeZWY3VB8MuKMSvi1ubjQ4UsMTAU1+keYf/qB8Q1SxwBHulnLPzrA7xaVN?=
 =?us-ascii?Q?MyGH9L3dxKB+mnBnSgn/VxBhb/ac4n0vGG1ljNSG+1TF+5vgrRX7IRHkn8CC?=
 =?us-ascii?Q?51fPHGm5K9poCSFXlENFePWzjeG2GblFahq2vH0TxPio2STXZnkET/RLuEaO?=
 =?us-ascii?Q?c1f+5tvc2/GxUq4pEZ4rtNyeD3jkjUIt8GD4o6bHEbBdiIH7PgisrQKL0gRn?=
 =?us-ascii?Q?zySbER2Yrn7YVVVb9LdBrbGy6fQttktBTAq3PMdQlkXb6I4OO3q45MGpx7Gy?=
 =?us-ascii?Q?IX/t3H13s0brbUdiJchOjOY799NNSPke9F6LqTr7PRJBDuTBXsELp3uxP1qi?=
 =?us-ascii?Q?HbJvAJyP216wu+yuDPUx/P+NpR1yaNlQKyXEdOVpkzli3DyI0D0Wd9oATUgP?=
 =?us-ascii?Q?U5Nh7HZ9CBPcH9AKXiTeWWMvpIXWAS/5qeyM3wV09NPDxHpXY/QWzJaa1KTE?=
 =?us-ascii?Q?uKLQ2onTVCbiWFzsRYMp+idNDNLBm2PtriVXQ8X23yqSULfKmJdHID6X53iS?=
 =?us-ascii?Q?a1Ds99Id9wW8HuOn7LbS9Gd9sXEUjQgju2n6jbgoXEOFMzEmEr+0OEUI0e1f?=
 =?us-ascii?Q?yxSXFw9nPT17U6WrgSJD/HLAsVb9jfjvrRtuGbD356x3gHvssp4cgb1Lqby+?=
 =?us-ascii?Q?d+GnBKfvF8EEHrrZLF/KLKMvCLQQw4Mj/a8qdb+qvIfHr0Pq4Yn1lkhK8ZKX?=
 =?us-ascii?Q?6W4dxdASNJ9gqhcoX1yFJncZZa1mSyxGoOVdEA6GI7PmTZ3qP+mdtnXZjLJM?=
 =?us-ascii?Q?jN7kTu3jfvpUnRDuY3uKbzrhjUVIwrUnXBo+HhSPmjLZFDRRPNuz4AWwSOrU?=
 =?us-ascii?Q?aGoujvSawwi67yuOy2A8Ghkrp0U97bps6TM2hH/B1/LIWJMVEZFd1iTe0Knc?=
 =?us-ascii?Q?h20udzP+LOmAL/sc9x1Jea3rnFm6aOvCciJsW21an6en9kKMzVm4RveRtwX4?=
 =?us-ascii?Q?lsddIoy+xHxUA6aRCwXTzd3C16Rj/9RBHiQgsp4dha6y5k4zW423cmRMwRmT?=
 =?us-ascii?Q?f6/O2CnpVXv1PmYg7ie/QzOqUZB7HKjw9/YMRwlEV1N2S0urLHOPZCd4gg9b?=
 =?us-ascii?Q?oGZQaT528C/N6T0Vqt0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:51:59.6873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8c7fdf-9513-4176-1afb-08de1767adc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262
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

The PQ function defines a mapping of code values to nits (cd/m^2).
The max code value maps to 10,000 nits.

Windows DWM's canonical composition color space (CCCS)  defaults
to composing SDR contents to 80 nits and uses a float value of
1.0 to represent this. For this reason AMD HW hard-codes a PQ
function that is scaled by 125, yielding 80 nit PQ values for
1.0 and 10,000 nits at 125.0.

This patch introduces this scaled PQ EOTF and its inverse as
1D curve types.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index aca02ca05785..5951db1c385d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1c313257cc89..1032d8988886 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,30 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	 *
+	 * enum string "PQ 125 EOTF"
+	 *
+	 * The PQ transfer function, scaled by 125.0f, so that 10,000
+	 * nits correspond to 125.0f.
+	 *
+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
+	 * represented by H.273 TransferCharacteristics code point 16.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+	 *
+	 * enum string "PQ 125 Inverse EOTF"
+	 *
+	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

