Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49088A72784
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C9B10E804;
	Wed, 26 Mar 2025 23:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OKg+rLho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B91F10E801;
 Wed, 26 Mar 2025 23:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTxyk4rXUZTsyzkMYNJBgLv6HktXcY6OJ2H0AO+EwqohV7OVyo35D8YbczGRNcVRZvMJv4N+DPDmdD+688ytsLegz3LrqZfV3E1L0Fd2uJJEGIv8cxLbLP0Q3CrV3RIeqrysjK3actfj16IJGx62bvl+OXvh0uzLcheZktF1qCdCKfARKV2lLaBEprG+WiitwzqvjqM5iAvXz3LNOlrK9HQ4y0iXhPqwk4b726neaU42r9YO23m2jPXC0UBxuyjxMwMNXZotcsLM2aCjgirD+khh3LvlRtmQvCO1CRQ2sRoU0Z206M/9QgN7GapHYwoXUO3w5NNjEjINkgZoJzuy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6A/7GcfBUfy74Jf6sfy88Y54wsT6iitw22zdyLS1y8=;
 b=Od5QKSDFy0yiKfIjZwBqmW7eSxYWf8m1g3DwJ/V7F32yGnK4LlM+084jxheopaNmETqV69gbdOCaRmfCS7a4HWKyV/a9k6m30pXSyuStMXaJCj7P+07jDgxoXIfruHv2oSMPfXN3PJQVQMuTk74nHviRhXjDx1wMpAjUkKOZMa5OZQ8H/m9hLBFx5fagjgvewjjFFpIJsPYUaxPLVZpn26j7QGLxjcGWgsXJhXM8WPuIrh84eL3T2am5kWh3ltXj1y+aZFCFSAo7i3wJNvnvKpKHb4EiNeT5uzcxq+w3InwjgHQj+fmtvTbiUsbMD7aPl4eiKnyJl1kan85jBTkedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6A/7GcfBUfy74Jf6sfy88Y54wsT6iitw22zdyLS1y8=;
 b=OKg+rLhohIXlEpZKhxy3lAUyy64K1SkxXHnT/oog8b6VdKtd/NyC3tLLViRhRhVQXfdTRUVcCk9J5y+wKfA3zvNR92qO9mOfHO+FOgoBlvsMbYJ0XnIaclmuzJI2RDEZwCa7Y5oI0DuiMmg56SnERUTaWWUqVzMsbohHTG5vddQ=
Received: from MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::19)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:55:41 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::2) by MW4P223CA0014.outlook.office365.com
 (2603:10b6:303:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:55:41 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:55:36 -0500
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
Subject: [PATCH V8 30/43] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Wed, 26 Mar 2025 17:47:11 -0600
Message-ID: <20250326234748.2982010-31-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0b990b-5ccb-45f9-ea4f-08dd6cc1b742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?82qjRVP4sxU/j96XqrfXkOZkdZLDjfebhujUkW4ZI6CgKbfjy/WwTIM9t+nQ?=
 =?us-ascii?Q?y8J7PJ4mbaSC9Dz4eMGPdkFQzy0NYc3tygiWFK2TMAL/V7A97VTA1NmGbYiX?=
 =?us-ascii?Q?Z7arT/kUbYJS3ekqO5rEQI5DK8syd128T6tJwM1Sr+VKCaTjsQY+xWmI140L?=
 =?us-ascii?Q?0Jr9KqL6STOEZkQZXvZUvA0njIZ4b3/ussIJOEZpSYqM1Aw9IMs5VLW/6ZhG?=
 =?us-ascii?Q?Ft23TIAAW/KDRECdmPeg//L5rKTkABTUyzaljSrpBZW/M6oO1UrBHkJ2KcGH?=
 =?us-ascii?Q?ZAASsGklaAJ1vErHIKAsJpfgjmRGRMmI2T82yrWAEmo2Mxs458UdHZmlAPBA?=
 =?us-ascii?Q?K9ucsFVLrgEagwNdIdveVoMOmPyDX5+Ieg2r4JadEW1/BLwQFHXvDwS4K0si?=
 =?us-ascii?Q?bg7mWAnV/nFRJeZnRKZllJgHRha/GYkvb1ctQNG9WNifGKE2iMLe/oslZYi9?=
 =?us-ascii?Q?8hhBG8dkdu3Ly+Du81t6USDpPYqmu1rlA+PT18Acg/mZyNmkl8/Hw/wbjTKC?=
 =?us-ascii?Q?ouJCyRBjuOmE5knIIxfkhlSlEK5XLFQeWgsWh3Thl3n8+GF7mNypFCqtrdOD?=
 =?us-ascii?Q?F0yxZvJGMb894xw4q5SR99iFkYdWvISuKt3ZPwhxZHDp1fv+XcdItPRruLZT?=
 =?us-ascii?Q?vkcvFtw/zYCUY4WQXq94aL6GzBc41Uy3E0whfIugzmnzVjB4U2p6LkLQBtql?=
 =?us-ascii?Q?K5ya+eMy+NaGOZdLKBmEt8zrOfhdy62KrJhzRt4g9pTkWiQm8LyEX1j6ojf+?=
 =?us-ascii?Q?oAOriaVixk78GSogCeCBVCR+x80qlQE/r9qnGZsuoibJ3487TTymOQq9l7cz?=
 =?us-ascii?Q?3/B8iiBiLPeSBc5CxiOvvLhgg/RnwJitzgmv2yspG95IoXrAwTis2Vfo3XAW?=
 =?us-ascii?Q?aqNmBZfTV1PIPRZvgT7YENPC98qxoDeNj4aCwACiesdzWYJBweBCyH/vLkVk?=
 =?us-ascii?Q?8+DjSc1NbSXJHqNGh7W4ijdoiV/jtYu7omaUat5eKsn6bnmMpPYxWYg37sUe?=
 =?us-ascii?Q?l3aGMJxB1lK1+FLYZoRBQWasIpIQZvlM/YNfVbXOUGRcjMu+ELmUe3dZxxe2?=
 =?us-ascii?Q?l+gZn2IQCwQD/5Wtva7a67XTxMK3UtYPyJ4JmxlMF75Le+tJaEEceQ7RI05h?=
 =?us-ascii?Q?+gza20ZjFLo5etWzzJpALPq48xgmr3RFU2oZuKMDrlNxH5Yi4qTE2ackKfx/?=
 =?us-ascii?Q?MyshcMEZP5MeULumH+mPZDenXmxJws+28hV11Ws+eRHGeW9t+fFp0bVd1YlR?=
 =?us-ascii?Q?Np8alJBZm5+IzPOuUTen0eoEwHIq6RKH0IDz67R9IH2w6id88ZlAX05XjOrg?=
 =?us-ascii?Q?ZHxHxd3MSSixIa4+X51jbuxp3u4kDj6iRkSPSuqcUcHqDnJROYqVU2sBbYTF?=
 =?us-ascii?Q?Y5z0xFzzAzFFEJ8mQj2xoYsYqfWiorev+qeKkaS4W1UQobvIF6/ZTJ6zvvx0?=
 =?us-ascii?Q?FcNp8k/QtequFRlpVvs0WS5jPaWEvXY93y5H3t3ZOhoRfi4tAL1U0ScqhwkN?=
 =?us-ascii?Q?5mt8SeEr8d35xFg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:55:41.4332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0b990b-5ccb-45f9-ea4f-08dd6cc1b742
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227
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

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 914fa0fa71d1..fcb4a8d0e38d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index ce51ac407c70..d3a60c1beed1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,29 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * enum string "BT.2020 Inverse OETF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * enum string "BT.2020 OETF"
+	 *
+	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
+	 * transfer functions are the same, the only difference is that
+	 * BT.2020 is defined with more precision for 10 and 12-bit
+	 * encodings.
+	 *
+	 *
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	 *
-- 
2.43.0

