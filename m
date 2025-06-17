Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B00ADC072
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F2C10E659;
	Tue, 17 Jun 2025 04:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lCgAj3df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6872010E635;
 Tue, 17 Jun 2025 04:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuXD1rWTXZewKeM4+m3d9swMsbzv+OzCyyxZbipfLjLYLX021E7g60hK/RjOaVzzS7vm18y3Y7KW227D3g74SYB1UIPHwvn2KLsv2x55QRPgqlJr2t9IqjQz0e5jymvZYTGPARp+aot5Qarza59ZdeTiSugopBwDYv5IZ+HyIWwTWayxKZpxmKQyfqvMykfkoiJSLmsBBS0H/hFl18BhavRIX/PvHN/ieZETw+5e4pter/W3z4lGhw/OMIFgq6jDebbz2t1VklbpsQCT5/4e0DaCkGNtnDK516KlfNU6W+IcLJs0d0N0SjXzha87+H41GhkDf04BhLidEc8lRPyHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8trL66qZLZ+KZUGfOZTIBzkqBYMJmvct7ezzQOlFYfo=;
 b=sBhkPomcKjrreH39+oxsGSSPyiVHQ9ZuMGCxk/I9UaVEe1LMWF/bpzYe8MDf3Ihihxna16N6adGXsM+uyOrSGQpbtGT/VJHU4yxoSLCjboLnlYOCfe+7YWQBFd9pKpIH8qb/u+mYxkpeJqWWmDi/B7q9lY6KKHX+rApmXAFuVPlFOdMOKo2Sku9MPDfZJw3w7SHskZIjRftVfR+xmGfYTDnDfofL9c61gQyhCpvvuakGrWS+xaoUC5v7SnC/kn4r9vIsPsj+8Pt1M8wDArrhxRT561Qv0/yIsmh3DxF2xPjjsacCsFcm1qg54stBpBvo40nx7VXvZsiZGv2I2bRiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8trL66qZLZ+KZUGfOZTIBzkqBYMJmvct7ezzQOlFYfo=;
 b=lCgAj3dfqfMn8J9BrCDcR3VT/FMoh2XMLuLImuvKRzuvU/VFGXk7sWNUgt4msmo0ZNBCleOKncXMASDf+aXcoorZH18TBmMy4nIkawjOE7pWtmwz0V5PHTOPGYkmWezodSw/MF1g3xnnAlJp3DPVkBKFiTTWRh9cbhEgBb52feQ=
Received: from CH2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:610:60::36)
 by PH8PR12MB6964.namprd12.prod.outlook.com (2603:10b6:510:1bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Tue, 17 Jun
 2025 04:25:10 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::eb) by CH2PR14CA0026.outlook.office365.com
 (2603:10b6:610:60::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:25:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:25:09 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:25:04 -0500
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
Subject: [PATCH V10 29/46] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Mon, 16 Jun 2025 22:17:11 -0600
Message-ID: <20250617041746.2884343-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|PH8PR12MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c65335-e6a1-4993-dcf4-08ddad56f23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V/AB3kvdfgj0RQv4eLqOcIs2FvUQ2LjtsetbAfxEcJdRbOOshSpDKVOhP8Y2?=
 =?us-ascii?Q?84XTPbMpMku8de1tWGngQjGdHyCiVkBOnR4hG1C4EY2Xq8L1GLV5d9mp+y8A?=
 =?us-ascii?Q?bm1X8YyZILn9fuinkR/YksBkqB/Ek0AIwuXQb03YNYPe+gA0zM7FBf3qzfqN?=
 =?us-ascii?Q?PEiyX4ZnQ35n5xlmFw1jrhqrtE/VGEYypFkeDWfqvunfbDwBb4ONWsT/ebI/?=
 =?us-ascii?Q?Pz1Y0r6adaPFM3wIiHhD6EEJ1L0aE6nqe3Xi9AgBATV2756YXJRk30V55zKq?=
 =?us-ascii?Q?uv4sqFcThtIlkWPG1UOrZJz7BpofM1sK5a1i7wHuA2DuhnZEV7XBDf8oh5k4?=
 =?us-ascii?Q?A6ZSe+4tIbS7DT+wecGzDRRjaEn0lvjUI/sAwqnYbOempbUyiNLtrOkBe0Z4?=
 =?us-ascii?Q?TXEfZ62j+T6ssU7DP+7s/NvIn5l0H+WFbV4suzCxHzsQOQ3pQ8LJJFfdIqeE?=
 =?us-ascii?Q?8IY+85S4W9R7QCeCE5PCJEWd3iMOTYwq0OlE9n2Gsom0J1oW6dOZT4nBkonh?=
 =?us-ascii?Q?zCl2xF3OISLycmsSzEUsYJHN3TOO6X9SfbV3QDtewEFNVC5Lq8aHcKLlPvpa?=
 =?us-ascii?Q?EYL5cqYUqygkgNsHR4NNOVnPiNDVFuHcaHpzXKu9kzje07QZeuuhRPqdqdIq?=
 =?us-ascii?Q?GsiV015eJzrfJzyQZG14FB5Rp/NyvtGaGClO3CD0ldkFLGjH7cEJz3BJkpIr?=
 =?us-ascii?Q?/W5DTNOIfUdzyM0glbqPASDYvDMSZ9w2ZKbAMgQgNfK86B/wHLw5Xh+L1kxR?=
 =?us-ascii?Q?PGSKMJfm6V3qcB1Jt76xa9GWQIHt70HsbHCK6DC6BwE7VSYR430lK1/B9isH?=
 =?us-ascii?Q?WdAdy+0NKq6Ko4cJdU7zkfKcwqAUTql5jP4akyKLNvbGZl9jXUX3fjS0d3Wj?=
 =?us-ascii?Q?ErSTPpJb46FikI3Rxmatc1Tt+ekQSxmT/jZ1Fkgt2tygfjqlNyLmdldbRrq1?=
 =?us-ascii?Q?etUx3WokthY7Wk3ENj1JQk1y9fhcbfiDACkvzmyCks3uK0Plh5Rb25TxOK1i?=
 =?us-ascii?Q?z/h78mU/ETqXhqKe04HsorTq/7hf0OwBeXAGIyfMEL+7x2AUU+yErXHWjHX4?=
 =?us-ascii?Q?HpuOzHhx0jtiQlh06DoGA1wllc5Qd++lf+Ufw824eU2rhj9DZtGwc8JxrkWA?=
 =?us-ascii?Q?b+YTcXPAqRRFxJuJiSxw2uHoP/ujvuh+UJ+20pVMOQOBzavbzUGkVo7ZzXc1?=
 =?us-ascii?Q?on35rkf1uPPm97Fqb477amC/biuT7h0h1CQRdEnRedRKLwIkZAkBFgHiEyP/?=
 =?us-ascii?Q?ggddNyM2wNcisnpprxFdBScDsx/TqvwmCEHFiAKt26RpaTkd0BEMR8lqgQLc?=
 =?us-ascii?Q?dwWPHQ3y1AvojgbB9wNb0kQuHF6TUq7Etg6coG8bymw8KWI3iMlNLFPWxI1o?=
 =?us-ascii?Q?IphzR5NxaJ7yBvX7Jjcat+JX51t9Z5OmUO1DvFNgBQ0U87VoSqzFlp2W5LvP?=
 =?us-ascii?Q?O1bANwfzQp8qu9AZ6X4DteWJgh/Ur3hdPcra/X+e5tFod6DURQU8GvfXeyWh?=
 =?us-ascii?Q?Kxqiawbv0BYiEX/GBVtpnr40dTP5i3szA03b?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:25:09.8741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c65335-e6a1-4993-dcf4-08ddad56f23b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6964
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
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 65351aaa7771..9ddb3dccaf72 100644
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
index 5f0cddc3922f..40d70d4a34a0 100644
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

