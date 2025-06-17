Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D23ADC094
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106A410EA9B;
	Tue, 17 Jun 2025 04:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XKgJCIhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E88310EA8C;
 Tue, 17 Jun 2025 04:28:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfIdJkcc8qPFFOsLrRHM9+P2jzrm1WO0lAJ9yjt7GwUiPy8ksi/LmjZltFn5a6UlRkfANDjxvMIho6d/xM2K8lM48h9rTb9yummDpt62FbQP1FUzkXLa/CZEEvNFSmZOTElES7BPBYr1AcTiFQzifRz3lMW5Z4vmqsz1DcphDRxi9+QChYHLz0QHP7sz8WpdnRv7YaQoFLCvdNFg/kL9ow4ATD4yjhdRofMc5PztxKR7xcraHwbYXUVjdVLD5BgPBqIeSOPpjQ86FdDt2ksrx8PiThsS7bgQegA3l72NvZvd0ClYtPh3aJ+mTT8hkFi25rcZIGNawAB0RsHcxF0m2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VS1thBcBe6oMiu6ze+ouMIBmtZhuO5fPyE+AsmheFfI=;
 b=Hio0OR7EEZKZmYGcg9HmG9zSQMNP8U5VrKS30Ga3y4OITmBY1xGeiyPkzIQVBZcLA+0jmzgjqcbpd+J8Jb0S8CKioHXA2QSKO4OitrPIbny4N/AiqjffJrHTOG+DE539i782Wovt0Yf2yP7/S8h7cnsDP3YhFWREoCHNrO32RRq7YV5u1iotcMvyg4f4xGj4APBxyB7wuRgjNKLzkIW9qDm2vl4/IwDvBYxusQIofKSR1J2ljRTWeAJ60xQq4FS2/gQ4z757ASQ7rfYSVqJdV5cCPSYpBMnGdEhFCSPnL4FoxLn9rykpHodXRiJ8m1vTLMgTQ9ptX7hkR1UlSN+3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VS1thBcBe6oMiu6ze+ouMIBmtZhuO5fPyE+AsmheFfI=;
 b=XKgJCIhVA9UWqPbdutPHIweJiA6fb4n6MHEXAfr5kCC3fEu+UdAk2oTP3ZJqCaoPnz527Eyf8FXyByYYkJcoT/JFdksrNpFREBjXw4ThqHQ1aH3qEHqFYByde1S4pIc6Qrq4aUye6bLh3o9C9MvgUVY8GEAb0myPVmjcdkDTaJk=
Received: from RO2P152CA0047.LAMP152.PROD.OUTLOOK.COM (2603:10d6:10:28::22) by
 LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.23; Tue, 17 Jun 2025 04:28:47 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10d6:10:28:cafe::87) by RO2P152CA0047.outlook.office365.com
 (2603:10d6:10:28::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 04:28:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:28:44 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:28:39 -0500
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
Subject: [PATCH V10 44/46] drm/amd/display: Add AMD color pipeline doc
Date: Mon, 16 Jun 2025 22:17:26 -0600
Message-ID: <20250617041746.2884343-45-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2e3c0d-ce23-457e-2d12-08ddad577268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?io6FREehll7TqLTNZMzAbbGxBhrGPcS7/EHFoeEncpwFsLBfdSqDHcLkBKPW?=
 =?us-ascii?Q?EyQues9XxfKFQTEBxoOgxiIJbKH/zba2fx2G7XZN9Y0+53no7xQagjmAreS5?=
 =?us-ascii?Q?76VghCNaNhJTw5LJuFLc97NkjbzI7kzmJT4xN5Mi5XsqzwejyAGayW8509Uq?=
 =?us-ascii?Q?CjOgoAxpelEu7hv2qeE/WqbrNQu8UdPYkoYWjkD0df/bR4YeyYb8Pt9P1D0X?=
 =?us-ascii?Q?O57Szate1sFRMo+Bobp0fhjQ2dzB3h7j6jZ9rFWfN97081j/j7uYRfZagTlO?=
 =?us-ascii?Q?6lh1SPtyNUITYDgIlSrb/eYwPyGWiErdpWTOHY9kkIOad7Tw0F52USVt2TfN?=
 =?us-ascii?Q?sr/yUFgqBLVuVRlehUAb6iCZfWGRlhJDp1rzf0B2s0Qo7+nRMXRUBFzIwgi8?=
 =?us-ascii?Q?tgUHLJh2l9m/bwxJ5DRAZSOYkWnTG1mQiv8AuwOJehv2fE0t+0fT7Eqs0/Tb?=
 =?us-ascii?Q?YqFM2dlWUVkGZI1oziUKiOV0rIkoKFxN4LrS0roIioAKP0BCSOn9RYo/CX7y?=
 =?us-ascii?Q?CtKGjxoXdJrw63ngrCPj9b/rX15JULsDZYzswc88B/x/R2FjQKqkFRXkWWYA?=
 =?us-ascii?Q?xJNU+U9Pkd+3jbV9zA1p6Z3a+VjzpP4YtWC11uICcmTCq/MVwQlwjzi1X7xG?=
 =?us-ascii?Q?/hX09ysA4iGEHyTlD04syfyMg1oEGaiefDrlZGh6nRV0iNaBu2YOPZ9/YgSA?=
 =?us-ascii?Q?R9GDKRXrzFx2KDK9csn3SsP78OrYznUZTz5maTepO18Vmf/Jeeqa1IzuLF8q?=
 =?us-ascii?Q?v/auD3XgL4U+vOQH5srmT2lz7kguWNG0cDCB87ouGK+iOY+Zp7eo9vgTURWW?=
 =?us-ascii?Q?8n5qqHUMIITgmeKj0sZDBXttGW9LTMLngrb3nypxtvqfENNztuZKcf4xKyMY?=
 =?us-ascii?Q?rZqaTGtyp7NXyZfT+JmPjqWBiUmBLzm96O2jsAJZ1rnkYGHv3/bN4ZUhT8Jo?=
 =?us-ascii?Q?zC91MBukhBvAXYCg5M//PmmLWkUcCzRJdYCo80ShsBU/+iZePEIQJBBbalj5?=
 =?us-ascii?Q?JdSBRtkhwJzvRWb+EesTUPcDVduvb6cIQQlD2ZeYXMWsI1giXTc1Z/Vs2PD8?=
 =?us-ascii?Q?0j/FV6M1QzGHDvbwXljAuYtNOSOVBtyXLqnoQluN9A6RkQRcvX8NKYA4rsm1?=
 =?us-ascii?Q?jbMjl7UUQXBn1Foz1vbV0sdEY7VL0EDk3SOlBAgdaj4e0vejOdmK1BJ/cGcX?=
 =?us-ascii?Q?JGpJQsHvlNr7Wu8+HmIyOL550H6p4EwJBH0GXfg+NkrYrmkkpXRvKFnLtNuy?=
 =?us-ascii?Q?k8JtWE0hNyKH8ObsHZhxs6MnGW86UP0FIqlyOVoNOTEfKFrPOuogNBLpJhIR?=
 =?us-ascii?Q?L69Y27H3yC050DBQ14Pmwll5ofF2tU5/YKwb87F8ArfIfASyic7BUv0FhYLR?=
 =?us-ascii?Q?2+bJKvcuIlBT4ZY1Fx7Io0xiwndsFu70e0JYw7f1CPgcfCDVJs95AX0Y38da?=
 =?us-ascii?Q?FceeWngvMLhSZiggFtfyNWjWnXv+lgDn/Ao8U1Rx6XwBO6a2eaGLbWKKbMnc?=
 =?us-ascii?Q?7sYC2TvaCroOP4Z84ykll1ClpMewZ4GDxGQq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:28:44.9053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2e3c0d-ce23-457e-2d12-08ddad577268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798
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

Add kernel doc for AMD color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++++---
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a2e76df039d6..b53aecd1bebc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -33,6 +33,32 @@
 /**
  * DOC: overview
  *
+ * We have three types of color management in the AMD display driver.
+ * 1. the legacy &drm_crtc DEGAMMA, CTM, and GAMMA properties
+ * 2. AMD driver private color management on &drm_plane and &drm_crtc
+ * 3. AMD plane color pipeline
+ *
+ * The CRTC properties are the original color management. When they were
+ * implemented per-plane color management was not a thing yet. Because
+ * of that we could get away with plumbing the DEGAMMA and CTM
+ * properties to pre-blending HW functions. This is incompatible with
+ * per-plane color management, such as via the AMD private properties or
+ * the new drm_plane color pipeline. The only compatible CRTC property
+ * with per-plane color management is the GAMMA property as it is
+ * applied post-blending.
+ *
+ * The AMD driver private color management properties are only exposed
+ * when the kernel is built explicitly with -DAMD_PRIVATE_COLOR. They
+ * are temporary building blocks on the path to full-fledged &drm_plane
+ * and &drm_crtc color pipelines and lay the driver's groundwork for the
+ * color pipelines.
+ *
+ * The AMD plane color pipeline describes AMD's &drm_colorops via the
+ * &drm_plane's COLOR_PIPELINE property.
+ *
+ * drm_crtc Properties
+ * -------------------
+ *
  * The DC interface to HW gives us the following color management blocks
  * per pipe (surface):
  *
@@ -43,33 +69,89 @@
  * - Surface regamma LUT (normalized)
  * - Output CSC (normalized)
  *
- * But these aren't a direct mapping to DRM color properties. The current DRM
- * interface exposes CRTC degamma, CRTC CTM and CRTC regamma while our hardware
- * is essentially giving:
+ * But these aren't a direct mapping to DRM color properties. The
+ * current DRM interface exposes CRTC degamma, CRTC CTM and CRTC regamma
+ * while our hardware is essentially giving:
  *
  * Plane CTM -> Plane degamma -> Plane CTM -> Plane regamma -> Plane CTM
  *
- * The input gamma LUT block isn't really applicable here since it operates
- * on the actual input data itself rather than the HW fp representation. The
- * input and output CSC blocks are technically available to use as part of
- * the DC interface but are typically used internally by DC for conversions
- * between color spaces. These could be blended together with user
- * adjustments in the future but for now these should remain untouched.
+ * The input gamma LUT block isn't really applicable here since it
+ * operates on the actual input data itself rather than the HW fp
+ * representation. The input and output CSC blocks are technically
+ * available to use as part of the DC interface but are typically used
+ * internally by DC for conversions between color spaces. These could be
+ * blended together with user adjustments in the future but for now
+ * these should remain untouched.
+ *
+ * The pipe blending also happens after these blocks so we don't
+ * actually support any CRTC props with correct blending with multiple
+ * planes - but we can still support CRTC color management properties in
+ * DM in most single plane cases correctly with clever management of the
+ * DC interface in DM.
+ *
+ * As per DRM documentation, blocks should be in hardware bypass when
+ * their respective property is set to NULL. A linear DGM/RGM LUT should
+ * also considered as putting the respective block into bypass mode.
+ *
+ * This means that the following configuration is assumed to be the
+ * default:
+ *
+ * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ... CRTC
+ * DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
+ *
+ * AMD Private Color Management on drm_plane
+ * -----------------------------------------
+ *
+ * The AMD private color management properties on a &drm_plane are:
+ *
+ * - AMD_PLANE_DEGAMMA_LUT
+ * - AMD_PLANE_DEGAMMA_LUT_SIZE
+ * - AMD_PLANE_DEGAMMA_TF
+ * - AMD_PLANE_HDR_MULT
+ * - AMD_PLANE_CTM
+ * - AMD_PLANE_SHAPER_LUT
+ * - AMD_PLANE_SHAPER_LUT_SIZE
+ * - AMD_PLANE_SHAPER_TF
+ * - AMD_PLANE_LUT3D
+ * - AMD_PLANE_LUT3D_SIZE
+ * - AMD_PLANE_BLEND_LUT
+ * - AMD_PLANE_BLEND_LUT_SIZE
+ * - AMD_PLANE_BLEND_TF
+ *
+ * The AMD private color management property on a &drm_crtc is:
+ *
+ * - AMD_CRTC_REGAMMA_TF
+ *
+ * Use of these properties is discouraged.
+ *
+ * AMD plane color pipeline
+ * ------------------------
+ *
+ * The AMD &drm_plane color pipeline is advertised for DCN generations
+ * 3.0 and newer. It exposes these elements in this order:
+ *
+ * 1. 1D curve colorop
+ * 2. Multiplier
+ * 3. 3x4 CTM
+ * 4. 1D curve colorop
+ * 5. 1D LUT
+ * 6. 3D LUT
+ * 7. 1D curve colorop
+ * 8. 1D LUT
+ *
+ * The multiplier (#2) is a simple multiplier that is applied to all
+ * channels.
+ *
+ * The 3x4 CTM (#3) is a simple 3x4 matrix.
  *
- * The pipe blending also happens after these blocks so we don't actually
- * support any CRTC props with correct blending with multiple planes - but we
- * can still support CRTC color management properties in DM in most single
- * plane cases correctly with clever management of the DC interface in DM.
+ * #1, and #7 are non-linear to linear curves. #4 is a linear to
+ * non-linear curve. They support sRGB, PQ, and BT.709/BT.2020 EOTFs or
+ * their inverse.
  *
- * As per DRM documentation, blocks should be in hardware bypass when their
- * respective property is set to NULL. A linear DGM/RGM LUT should also
- * considered as putting the respective block into bypass mode.
+ * The 1D LUTs (#5 and #8) are plain 4096 entry LUTs.
  *
- * This means that the following
- * configuration is assumed to be the default:
+ * The 3DLUT (#6) is a tetrahedrally interpolated 17 cube LUT.
  *
- * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ...
- * CRTC DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
-- 
2.43.0

