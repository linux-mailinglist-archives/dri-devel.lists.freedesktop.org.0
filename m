Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F0BA7277F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57F710E7FA;
	Wed, 26 Mar 2025 23:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PLAZImFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C567E10E7F9;
 Wed, 26 Mar 2025 23:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQAO6Ob/3wb/zPdlqLYn1vZml7c6dsY7s6JgDILl7zFEz5Lli8h6dB+f6Rc4zKFoGFexSkGmFcmm2a+QQUNvMeWd9kI5Fm7sNhfrnvdEqzQqsvU4lu4K/JGmSsT7MlznjZzByDnC/4PNCSC0apqxRJfi/mXm616CkNpW6y2Ydd5dtvrmjTYpC/AseliXVoPO2UjzJhTJMqwZ9FcdQlYvNl639WeUlUJYIpGhTJ3VS4adg70VuaNMX7PSKZAPcvGyFWaAWUitpwCfZaCknMJgm/ySGYi7fp6J2PTc8CazTKE1w7dsJ6xyuxZFuxyk9zCrUBdd/8tOB6ClEh4YOEWK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaXo04WQkVBq+3Z+58UeXp15WraS5Vv4tTJJ0nZBMpI=;
 b=M2edmGlc6zen892xHmOwgjHhr2nXz0Lc2MfNlMLm6bMyg5qASXXhIy1qhUa8Mo8ZPGxVyvk3C1WMoTzMa/zriSif6cMZryjm5XKAfaQ2JKZrnh4FmN6D6DpVGMuOIy9z7dd3Ncgp3bPSjmCK0bIVAyeAY26mSK28Ju20q0uQtStCDCWXB0slu526JNw1BQ69yvN3ZpNQuLx96vuXBcNH3+fFZYf3hTcZCQACPXlr3kJuCwPEkoi42dYF0mnX2nFvPdmgD3t4FpbmnWPj02I8Wq+n3VU8WaVlQxHTp9n2vgOjAiworbi80mVujvYd718ysHIzg3YAXkN7UhRnHUP4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaXo04WQkVBq+3Z+58UeXp15WraS5Vv4tTJJ0nZBMpI=;
 b=PLAZImFiWExEDuYqatoGEzq9Dmu/nOY3txGKqbxe9ze7ujxzNH28uoRyaxGjw5N0XVEJvSDEvlIV2gyQcGMyVgYeBtoY1kKjadve5beqjRUGIdncbbe6ZQK3J0moKml0nOLYloiqAOP6I27vLdQm4W2ZMryWVXJ2SIfCUoWamMI=
Received: from BL0PR0102CA0022.prod.exchangelabs.com (2603:10b6:207:18::35) by
 MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:55:13 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:207:18:cafe::ec) by BL0PR0102CA0022.outlook.office365.com
 (2603:10b6:207:18::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.25 via Frontend Transport; Wed,
 26 Mar 2025 23:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:55:12 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:55:08 -0500
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
Subject: [PATCH V8 28/43] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Wed, 26 Mar 2025 17:47:09 -0600
Message-ID: <20250326234748.2982010-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: e35c2bed-ba11-4d38-5120-08dd6cc1a5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qKRKInEqTT7+RBSdVE8Z7jAXpXXQ3sI82PXtpsP48RUVvuTRS3xI3Xjz3ev/?=
 =?us-ascii?Q?ZqzPj8WcaMM4MXOqLXa90+D4Pv4rcBhB3Ymos+NkF52CvgTREy2b1OViCTtx?=
 =?us-ascii?Q?TKk/JKTG6iB7fnFX8inNF99k31XBE8crHBzHAdcBRd70ML0lXCa7Ar+vhvCE?=
 =?us-ascii?Q?m8Xoz1Gd90aeiQfrmonyiQOoydFjl+tgUwOIm9OBzBogATB/qLcvExthcmw9?=
 =?us-ascii?Q?O5KN+4BJg7HKF8LMftNeIBOobKp/W9XwP68hMuK1auTWOXO92/3QKKPpZ28o?=
 =?us-ascii?Q?Sc2AsmT4GtVezm5IEwpkEmys4Onl1rudy5dzK2baNCTJLTb4BqHLeiBjCEf3?=
 =?us-ascii?Q?DrKwArpRq8WflcSdXZEarQsK+1AlufBjoO0u9YOYvx+KQwWqNhsZyy+9wWVx?=
 =?us-ascii?Q?pLcztdsE+k1Uo6d2bCRypoVbsGh9qQqbrgEtplqr5N6pUAX43fy0Kb6MHE3W?=
 =?us-ascii?Q?xYQ1d73cQEKnHs8PJ9vMxduW3dj5W4hc6DGO09Jcvf+fucNvrV875KXcfznN?=
 =?us-ascii?Q?5J5MuQJmhTs0oyIpBf7owSrNN3ztvsOZish9qPCnLyPrzCA1U+dzjJ2WSUGN?=
 =?us-ascii?Q?kt+gjfZrRNkOFn1FMan3e6Sgrc6zMAMzTEF/0XT3KLsD2H42Denb7CyWPQIz?=
 =?us-ascii?Q?KaqDWFNxD6hZtC7jMQPQHaHzi2xqvpYZnEKGtZGq9AqADYGe448hnofDyilx?=
 =?us-ascii?Q?hZGm95sLAKKeI6RviHOi1UB8JFmRtXjPb4X8skyKgcB3N9J8I/tb0Yif5dGB?=
 =?us-ascii?Q?Cdf6deZFNy6LZSk3oWdohxCT+MvH6np33B5kKqExWRTYUs8hqeXy6mmBzAFN?=
 =?us-ascii?Q?wHVBzATfSwv2LSwj/MAMGTiE2ZXzB+3dGDYZWEY3/lKEAn7X0Z6mp7f0TKBI?=
 =?us-ascii?Q?FElxGiG+IU2RRGuohehQzv1x92LBhzO3ilRqjefiRyS/69CdvCtgL3lpJBQZ?=
 =?us-ascii?Q?e7NDR/OKYRzrtWUoNMgqg3G6pr4bkVAxgOaCkakb9UU3CShKWEMn+SSoqrXV?=
 =?us-ascii?Q?UQAQIOOo5ZCQ0mYeaAaENJ1xEkdCwyZ61uaUFltOpV+q2KeZViF/7Rf9DWOz?=
 =?us-ascii?Q?KnqspVuR0A/lWBdkfNfZkWNhPUkLIsPwSzX/Kh2rl/BAsenXYTkzQWnyY6yY?=
 =?us-ascii?Q?yAH64QJu78wbzd2PikEa6p8vfpoYJ/bkvp/cPS/5BMTsoap2PWvmSWytHEwi?=
 =?us-ascii?Q?z0y5V25xJHLItuITw5/CdD6yO+BYsaZmf2j1riShrJ3hr0CZCvpdmdeoZbvW?=
 =?us-ascii?Q?9aeu4kGdFyIoKVZgodlD55BUGTGoWwW65hvtBvzEQOx7lM7x98nir36nsS31?=
 =?us-ascii?Q?7v3/URBSRzuQ66KB5fKywazRsS25kc7M04nBoYQzClp2lpJS0D/VttAR0lGT?=
 =?us-ascii?Q?RA6Ww02zqnD3WZrPPjeMA2KJFmhWm6g4UWEE4HmQ6lk3vOslAAIns7T2TZKV?=
 =?us-ascii?Q?FFr/YSwLaj05K6CLGJNeosfJMD8UPjT6+0KMYWy4a5yUaQYhc/QeUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:55:12.4921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e35c2bed-ba11-4d38-5120-08dd6cc1a5f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 8ab754f935e6..914fa0fa71d1 100644
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
index d9149c320bac..ce51ac407c70 100644
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

