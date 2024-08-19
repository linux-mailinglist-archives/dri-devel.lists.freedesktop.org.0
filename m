Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425AE957644
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACC210E43D;
	Mon, 19 Aug 2024 20:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Di7sNnHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F2810E3EC;
 Mon, 19 Aug 2024 20:57:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJhRWkU/kxmWtHHC9JPZHYYSe2QckT5NRmEIi1ssiHO6bzTW2yrt+RJPwcIh4BfSKmwF294fSuk9VevMbLya23fo5opJE2vmBlZvM2THHjZVU6GjBi0aCelI1gpIM+HPDiycgjeD4D7s3MAq29CVrxGppFSdlsZqnzrd6qbLzMqEGkiIC+3Zr+UFrooFyHaJyJz68GqEVdU+owXxwq17+zomLmuLQuI/l4OnhVm7TLimXlD6SDfFOTgt+0+IfKqjMxbpuC3BukeR95Xt7RGmB9ZMHAPnzirWGoghckDL91pkT2ejDmw4M4Z+ghLHbjt0l1tXNW1xgHiJOr1RlBhK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbNqqNjSRH7uIjhpR3msrF0gBxNcPiBPVXnK2M6s7TA=;
 b=IaRXmz7JJrfNUOqXHYBHsdqsZli5Dwr6QJOXva4Njh6FfXv+AbwnH3aJEIsXAwM1tr200oli8ov/dhI0rwzek239Z7K2kETMlSM3hVKEWr/of73iSRDL0yyVpQpKLa3jV7fx2DGsYNIoWwRhatgGLtrE965rZU/tOeHlaerocLa+izQt8GNwZM4F9p2s0ScOHgP4ynZVYft8ugrcYA6qDGpOk3Xahw31uoosJnR3nlaRdeNmYxB355K614OKQChZMgc1okKl3f0v9LGExnPVaBszYgnoVpu/yShGIqYXEJcbIfzyBWT8H5AafvN0R4I42w7ynY1V97U0M8OAew909g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbNqqNjSRH7uIjhpR3msrF0gBxNcPiBPVXnK2M6s7TA=;
 b=Di7sNnHtp8t60n03C3nVq0UXRLrQLkwmHPo44aMcyU6wePu3uTssQuvEPCyvKNyJEYVh++a0yf1G/wzFWZZLZakfppWrcBcko57wC7jgFzJ5qBDnl7y+1WgPu4hzVfaMr4fTIMUNAcLMjG3xIIchdpewEbtYzcU2Hpp2rU9foj8=
Received: from BN9PR03CA0300.namprd03.prod.outlook.com (2603:10b6:408:f5::35)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:48 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::c) by BN9PR03CA0300.outlook.office365.com
 (2603:10b6:408:f5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:46 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 44/44] drm/amd/display: Add AMD color pipeline doc
Date: Mon, 19 Aug 2024 16:57:11 -0400
Message-ID: <20240819205714.316380-45-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 586eca51-4987-4679-abb3-08dcc0919529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NZpgiKP5SURnnwBMhTcKM5TXWTGfSs+hFWilAdx50kTCVQ2433mg7eB+X6I+?=
 =?us-ascii?Q?2oJwZW9qxchiDzqkX3ffmgnOM2RPcuh9f4Me9ftyC4HcLXaMLmzW2tYV5LSI?=
 =?us-ascii?Q?KvegTURIziJoaML4y+Hu0ondlLX/SSaI7zZdPQJ66x08lMo/20LOb7WqV4zN?=
 =?us-ascii?Q?aBjNeb3CZTG+aCh8rzZI5Rq7IOeDj8vW/gAwBDyTDm7NV5rHEW75PYb8+hoB?=
 =?us-ascii?Q?8f7mK3D4XYffYNTvGul6XYTG+c1SmIhzLlZlvlHZHAQQ+SZCuqWooYpMBdol?=
 =?us-ascii?Q?L1moB7h3HYbTB+eo7mtxITbEoIJFCoHUSGXTZS1WC+X0CkEjykVSgyT0hmNF?=
 =?us-ascii?Q?S2czVv0iB4cPneTjZGVO1BDgpvEAhofik7EwuQtNs6eGl+18hTxN+u1rRulW?=
 =?us-ascii?Q?Hx9EGHydtshd3pS2cWBe6gcMnxPmSZ21Dwl+6x6Ow5ZzRTN9OBGZOpIElATS?=
 =?us-ascii?Q?3yA0CZaVm74y2a0XHTbbPCeRNpAwCFCN2lKzymdxNjMd9sIgLUvoMk0oOwkW?=
 =?us-ascii?Q?2h3iVARggmBg1qV0rajo5sB7DNG7LaflWOok08+Woy0dAW6i9+LFYLipt0Mb?=
 =?us-ascii?Q?n04flwg3IbAuRaxSw/uz42SwmTvOo+5Q0MR9TvjxgxMRipBpKMvvkkqBQcBb?=
 =?us-ascii?Q?F8ptEaUI8ZpoLV6IPWvLONHdF4ObbksnwJQ5P0coE5tfW50TwSN6Fl9845Gt?=
 =?us-ascii?Q?0vuA491RQYxsGBpbT6s7ctVBTpGeOZ5JNtduBSjZUxmDw8yOYZ4gDO6GlnK6?=
 =?us-ascii?Q?nNAlIxxtiXXzEDsSUS2+VsFpIYSaRDNiTpk9BDorsGogLdghRNS9XUPRzchA?=
 =?us-ascii?Q?BwwQuXPGv7QAiOQ4LBbSTZL+8/2urFswc72CVLujiCIOKw9qQ2R9D7Kgxmu1?=
 =?us-ascii?Q?qTi8Z9Uf6QL1cmfH81AwzxFwc0ePLqf5UmjNg8W6X25SMqBHuX731IMy+MsX?=
 =?us-ascii?Q?hJ96wQl0lEn60bkSO8J0puNDwnzj7SeJuScfmUoiwJWlUCoPJeAc3+EYvJAK?=
 =?us-ascii?Q?LXgwoNzJa3D49qouMzmvsZSkH5AWVlL6HiBzzNzVmBXxngrFxw6yTzTyRtRD?=
 =?us-ascii?Q?o4DjQJJ1KHgADN50Iv+blMvqFVDQE5TMBmFyj4L7TEPAIhtONwYMGyb6LUVM?=
 =?us-ascii?Q?34MbSuLUKUTlrqfQ7mQUW3hV9NxLMXh6vyRfQJeVBjEdguyBzmv53pB7Uf0g?=
 =?us-ascii?Q?4ckKQokK9UK4pjWHAmlTjhewAsEPiFrQCMYsXoiPusrsaes9qvDnjjpGW9lH?=
 =?us-ascii?Q?DFrni4iiGr4Y5CZM2onrYGxlqWbWYjM+m+2ZsQvl3/ZxPA7W0xtcstFXwUWq?=
 =?us-ascii?Q?3b1KT3Jo4GHQgC/K3yGWyk2GtcMS5Odmr8XCLYVHHrILy2NsV6kmOEH56IiA?=
 =?us-ascii?Q?7QwYowizSCD15Uc+ptdzI/X9rp8xaaxviwn6Wob40mTXB5qq302Zk8sPGibO?=
 =?us-ascii?Q?sChaaDqs3EPOMXxH6MentDnkuffecJbe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:48.4314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586eca51-4987-4679-abb3-08dcc0919529
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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

A short description about the AMD color pipeline.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++++---
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index cc3d68d1386f..d48dcaee9e2e 100644
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
  *
- * The pipe blending also happens after these blocks so we don't actually
- * support any CRTC props with correct blending with multiple planes - but we
- * can still support CRTC color management properties in DM in most single
- * plane cases correctly with clever management of the DC interface in DM.
+ * The pipe blending also happens after these blocks so we don't
+ * actually support any CRTC props with correct blending with multiple
+ * planes - but we can still support CRTC color management properties in
+ * DM in most single plane cases correctly with clever management of the
+ * DC interface in DM.
  *
- * As per DRM documentation, blocks should be in hardware bypass when their
- * respective property is set to NULL. A linear DGM/RGM LUT should also
- * considered as putting the respective block into bypass mode.
+ * As per DRM documentation, blocks should be in hardware bypass when
+ * their respective property is set to NULL. A linear DGM/RGM LUT should
+ * also considered as putting the respective block into bypass mode.
  *
- * This means that the following
- * configuration is assumed to be the default:
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
+ *
+ * #1, and #7 are non-linear to linear curves. #4 is a linear to
+ * non-linear curve. They support sRGB, PQ, and BT.709/BT.2020 EOTFs or
+ * their inverse.
+ *
+ * The 1D LUTs (#5 and #8) are plain 4096 entry LUTs.
+ *
+ * The 3DLUT (#6) is a tetrahedrally interpolated 17 cube LUT.
  *
- * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ...
- * CRTC DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
-- 
2.46.0

