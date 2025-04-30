Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCAAA4080
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6910E6A8;
	Wed, 30 Apr 2025 01:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jp0MS0a7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2A10E6A6;
 Wed, 30 Apr 2025 01:22:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNamYaAbuvcXqGGsFlGpR2veuCTfArHvaBOUr2YHQEop0nw3XqkoI02m/cUMbh4rtk5gr8reTSDGdYORS1d1MXKPNdSLn6CzB2W25997zR0B6kFL8uTJ1uINQxlAxK+b/F5S4PtKe+KPChS5gYGawFdNt2Ayw7KWl2n51BRFhfhNU73gKEicl1nULGRdoToMUYW8U133WeuUTY4rBjxLQ0ev6vYhfPwf6MbvCHxVxuptgoXN56zp8DT4ePeikxzH3lhZ8fIUupIf9QNJVHt9Vr8+Nlm5c2CVh8mpg6C1tvfDCMPP35krSyvK13xgbKyNOG7S9+3jArd/qe9rITSXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VuPL+IXOlnC2p+Lq4lzIV9VwtGUWGuG5vrIqzP6yps=;
 b=c7lTlYKImz0t29IPpX6GVUaB2dm014Z3X08vtaPuL9O7H3d4cy5HklodJojRzKbREcrLoVcVh/NMPBgxNhf9InywKVXFJ7ImmDiaQyPjnz45eUXbBIxZn5YaysgNdq1jp0DZZ670NTpY6f6dvQV02E2avJEPzkyaD+z4U+GpO+o8fIEKRpt/4WiNM542cPv529xKjDpqAiUqR2cBpRVRYcgcSa1N3TilUlJ9IC7cuQGMaZTAeqKcdj9BzYtduncu94DX74Y0Nf+9DAefSR+BeGqAEsN5/CFt9K00lXE3tlQA6/f33Dewzvkjzf8IhImjcLPkyJgBQyX9XyA8xn0a9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VuPL+IXOlnC2p+Lq4lzIV9VwtGUWGuG5vrIqzP6yps=;
 b=Jp0MS0a7ks+YhttjkqOApK8mL1kMoAlkOMAOVOp0wEWlnOZQKkGJke/WuYCsh4qRrM03E4X2p2fN/6ANAiIYZNisR/TiKDPYIt411yxnS4VM4A+JT98RcBH+NLGjoePO/fnjjE8N6gGoufE01ONct37V9JJ5nYZyyNlKvkENhsc=
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by BN7PPF521FFE181.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Wed, 30 Apr
 2025 01:22:25 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::68) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 01:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:22:25 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:22:21 -0500
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
Subject: [PATCH V9 43/43] drm/amd/display: Add AMD color pipeline doc
Date: Tue, 29 Apr 2025 19:11:13 -0600
Message-ID: <20250430011115.223996-44-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|BN7PPF521FFE181:EE_
X-MS-Office365-Filtering-Correlation-Id: 3321b2c6-5862-43e9-bf30-08dd878576ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jcg9Fv1WaydjtcaQpzFHmOSZyaN5iU4Nn+LIWz/csj0khQJaazt7Z19OVUGT?=
 =?us-ascii?Q?DluNUUKitPo9l1yJ0aGFwYQfQK+5DcWasfE4AVG/hyQb5KWKzzsRCOo+Tnj6?=
 =?us-ascii?Q?PHiOiFMwEutkIxRz3eRnwC1tzq9q5zSQ75TAGItNeVDoWdNG1kQkxmBmec4f?=
 =?us-ascii?Q?RXBYXQsyEchDU8pFZ7h3IXhXQMGJdm0tgIpJgbf5fVlSyR2MEePvKFf95YnM?=
 =?us-ascii?Q?DhA/44Iq6xjEuhnQ51msPnBY7omEQUtsg5KiCOhtWzZijyj1xQhRFS96hGg6?=
 =?us-ascii?Q?SDQ7SiZnqQgjmM/DwqCdTzjTYy5D4kA8F3g0SfOX9SQhteKedYy+WUY6GzVl?=
 =?us-ascii?Q?Q2hIz766dg7GzqsQZ5AH360BaQW/6T0sgoSHIYLKfgVcfmjzNE+3MWudZCxc?=
 =?us-ascii?Q?wSnMXTvTId0XqD0IFYgfMv5q58TfVqaTY/yKDEeTYPo+1bE6KctRxQXzrj3u?=
 =?us-ascii?Q?Uu2OTENYedtkeWNQ8ivExyGiqFxXHrMiZRTLMUmHq9FM4FBKtwnuv+VLwlvo?=
 =?us-ascii?Q?3JgSU4GWeiyk9Vgp3WbF7/Bn6wNWqdjh1m/9JyvtV0EW3cMods35KZ/DRmg4?=
 =?us-ascii?Q?eucx+o+qdrtvqElMfvGQaq5oaOKa+NVuLe85z7A9C9X9g4VnBh+Qxou7i0UJ?=
 =?us-ascii?Q?UCfA1zZCcIDboYKfLRJT94LHRcXRjLYyA5jaDuRg/i/ftMbCKU0gSZfdBKtp?=
 =?us-ascii?Q?pMKV+6Z5I1xVKWLuq3LEPA7VOJ+cNXf4uHz0iHd+8cS7QyFzeZ7stktgMNHy?=
 =?us-ascii?Q?6HC1RXRjO7eeLfvEDbyoUGBDQB/SD8gp6unbXfFsjMvkPoiB+922QfvF15Zi?=
 =?us-ascii?Q?7S5VtUb5iU8YMxRZ1KtLPD5tIKSqF8RjzMK6DlJtCwBQVc69iY7A6G/iB8Ur?=
 =?us-ascii?Q?dMR//pCgRahdLnqx65SGSL9G48fWE3rJZvKVZ0Az5suunNv6MAmxNXT13e8M?=
 =?us-ascii?Q?JU+NPJb51fU5mplg7pe1z8spviYHPywCkUAFIepaGujdcS7t0v1Z+AqUIHdR?=
 =?us-ascii?Q?qgpQa9oGTM2ZaXY7X8BTMQgz5I0aVMlg+gSrsi1xuJO6buEvRwymDSNgbLPp?=
 =?us-ascii?Q?EdzKqRNKGyFuUxPJGo8GSoWn8AXS0BtkmYmc9OfgI2U3XRqoQHnHFjgmOu/s?=
 =?us-ascii?Q?QYrKocKlJl4h6q29atYiYzXvPJ/TFXS9dH2r777AqnzzewqwRuLKyoVkMMkS?=
 =?us-ascii?Q?0hjTnUMkn4rp7n9dPhOqu1iyUnROpZDbVbI/FB1zuddeCHGzutyPu+bqQ0do?=
 =?us-ascii?Q?m/FcCIr5YulcLgKMKitfSwRwISQarmChTxiczfTx6tiuvvplaWYJwqu/aKtG?=
 =?us-ascii?Q?vVbODjzt5NHqN6icvCGi64eaPD7oLXlk120GBxj1SHmIVSMB41cAQ77fD0cx?=
 =?us-ascii?Q?1RLXoBuOolmcAK5yJji1gRVD4jMXJXXZ8Vd5SpoeTPakcm/7s+21xyZYchbO?=
 =?us-ascii?Q?pADuMOXOuWNHs5hfMBGheW8izPU8Fcb3HMiKZhHBsDBSdj4x5YvLnNv2QHIB?=
 =?us-ascii?Q?nmqPoGauOx9c2F0y3Q2T4oxobdrheYI1X8N0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:22:25.1349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3321b2c6-5862-43e9-bf30-08dd878576ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF521FFE181
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
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++++---
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index dfdd3f557570..ef30ea707077 100644
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

