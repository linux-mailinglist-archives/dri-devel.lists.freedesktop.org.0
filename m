Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A09F8BA1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2110EEF9;
	Fri, 20 Dec 2024 04:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rY3frm45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D0710EEF7;
 Fri, 20 Dec 2024 04:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENpOEA92NNxhZETnILiaD5dFpJmmo2MZrEvwJANKaNjY4nkFrjYUzHuJYEOLZKu3m8CH6mnLf3ASCQhJMYI1ZiJw3yNu6hkQ87V7PD7A1rBFHsh/6OahuMLSMuCSodiqhHk6sXaLGDQBFxNBcH4D4Sl10ZZOen04UWBflUpAHarkPtofz0aqOmlrDsqFRqPbq87o6jUZf3t7Gm0WssNR1hN8pOrUt18Qs/myr72XkTezQCn+BHeMrRJZ5afDLdJ/pOfiuUbCvZSfN2INsJY0TPYmvGdpHqTsLaAmy2wrix/3yYxrxIXShm2VxBj83l+wCT9hfZdSCUE97nOH6ewpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1SXhCRrhlqJoEUl/zOHQrtpYAMcCmtWjirZJPF1oG4=;
 b=w+46kJHiVmqumsBJbYYN8RfK9PJODlMO2eZ6eJZjyND4TNlDfezS87kVTZnShAL2zVbYQtBL3uCvL/yD4n+5k7ZBR9f9gZ6gQ+/hTdjfvXvWqbgCPMTBpKd7FI1EpAwTrajnox+TtOhk2U3Ra48whcTsNClC4QOWJVFiMdbBvosSLluvx4hsCEb3qbpk+Wq1t70mfrl4MY4jiuKqskanwIYdQGO2Me48gmDDtAWcJrs8TyUEWnSGrhEkzKE+/YtPpj5Rh42IDs7C/pOWwYcns1UNrd/2R43Fxo/AfNV5XxB1E1zh7uEjCMxpdCwzAvbCdGke1kJ8/SwHjjjdVIY9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1SXhCRrhlqJoEUl/zOHQrtpYAMcCmtWjirZJPF1oG4=;
 b=rY3frm45FqnV0TLZA8SIpaO6y3gECJVMB9lNYCpwPL+/gmgYFFDNIk9qPSVjMZYVoKF6pKyfgUEBKGK/vJzi4UkaSagDuUkPLWHB/kAj0nDRafCmNiRVpyugQ4I5FoQeEgi1ttrqggTUq0jPnkkQtnrbqEdoRaG73TvRBwUmdsI=
Received: from MW4PR04CA0045.namprd04.prod.outlook.com (2603:10b6:303:6a::20)
 by PH0PR12MB7862.namprd12.prod.outlook.com (2603:10b6:510:26d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:47:50 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::58) by MW4PR04CA0045.outlook.office365.com
 (2603:10b6:303:6a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:47:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:47:09 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 43/45] drm/amd/display: Add AMD color pipeline doc
Date: Thu, 19 Dec 2024 21:33:49 -0700
Message-ID: <20241220043410.416867-44-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|PH0PR12MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbfdb7a-76a0-4aac-3e41-08dd20b174be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vp+ehA0Xx36W+z3L3nuoFeYe5rRViTFMaO+C4NH+GnlKhJZfBSAyfBPaq+wq?=
 =?us-ascii?Q?jMcJQBf5abnCOJQnXGb+flMA5l9hfK+Que91xLthYVU9HkmiouUYfg2wuvHR?=
 =?us-ascii?Q?B4fMWvtaHB2he0JLCubVJgyVH+g1Fp/XPwPFk/fgcUNwQLjrkYxgTvN3o089?=
 =?us-ascii?Q?IEA1bW8NnJGVVCEZf3ddq3YKNRh7RqXulCXBYjo9222DsAJC0OsiiXNe4abr?=
 =?us-ascii?Q?VeSfH9vXrGM02KWZuKaJf0N+kGpuYltVxIpOgqZTnNuFQnDIa976Q42AqmsW?=
 =?us-ascii?Q?tnrINEWr8QgWArXjflfMI2mp3uGajHysEEdv7h+NuRW4fSCjV70hiteQ1Raj?=
 =?us-ascii?Q?47uQDomjbEuO03/ZPVc8n0PdvfMpeI2PA3qy9j+IE7O9f2x4KLzm/hNy8By0?=
 =?us-ascii?Q?Ho+E3irPRlpA3SS5iyyVwrE8VNdfQnIJBfyUi5Y/paHUtINF4e5PsgylCKnz?=
 =?us-ascii?Q?ZEHyrIa74cdwbT15rNiBbW4lhFd9PaBhikIQayZIBS5YhGwPqJzBYIyaE1Wy?=
 =?us-ascii?Q?KmKCdQ+xlKGq4PkrowIjMFRg6amb4gkIebXNIZ82jLCp+8zVpcz1aP3LbWe7?=
 =?us-ascii?Q?oSsekXuFh77AGvZmy8avJ3UPGxMYATJboD6H56XijrYTv2sVP8iu9jZJDwq1?=
 =?us-ascii?Q?15AJTkc0zfhFr5uG9VyB/OtNmQyjGtKIVkvujCRNEdOCChgvFZ8v2WU7OAaC?=
 =?us-ascii?Q?bjl46IUyIYgTIWuFaSiATOrBtPlKc3esW5yU7VDQIWTu9NMYb0jLNX4KkFRQ?=
 =?us-ascii?Q?OYHAnoQwYM+86Gzu6yCv8855cOyX/wxUvsPOR/6L/Ahd9TJsgqfpnzzzxfKW?=
 =?us-ascii?Q?3/AhlzEQKwUGJoNexq5YhFy4SnTzIRdWRUgbV9zDDkHDMiqKaWZ9HOSVEtHW?=
 =?us-ascii?Q?mQG/7QgjY57xkfiFwXQEpK7NfuY2RU/nBMEcGOPed0PphKNg8ojxABs0ykR8?=
 =?us-ascii?Q?y/mnJCo2eB8qR1T5xGKb2VVb2iBGa3X5GvcnC5TXT43Ul8SHP27O+6nu+KUj?=
 =?us-ascii?Q?n5XIHPyENDZVq+/rwrUS2sJN6HuKhbtoFx5uGp90/XckL2xwx6y2ahf2jkpo?=
 =?us-ascii?Q?uHtb9F4R/PXfqcz8TcLdqM6Vku6YZC6AEWMDtfqDYLNgbwuJBwR4XU56eO9v?=
 =?us-ascii?Q?AWnua9cXBDGFoLBpcArv709gawvFhh7Dh21wl9JSPmqXts1kOJBrjDYYGcLf?=
 =?us-ascii?Q?dwCgI5SVQsiqxMzNwoTlSnUGdgnnGmeNxpY9yTiyKpgigVJeJ4Ztv1lgbVAh?=
 =?us-ascii?Q?NqUWnC06a/WlfTqEUAGuFCx+wMGIJVrh5QRjEmirxo8AoZjUT7CR5UEs81yG?=
 =?us-ascii?Q?cthXxLLWCUksYLkJVib4c8hdqD+6dfeAvF/ehP8vlmb9j+f7aT0R6272cEyC?=
 =?us-ascii?Q?PQ1ahupAkBhlhAsX+/TRV+Ub9Ns0elQu0WB4dVmhpUshwniQjkw19tEPGzoK?=
 =?us-ascii?Q?yV+U5FxquGUGRizvuqFMG+mIjH7tzJkTkV6vb5IHsEQ4XHAVH2v+hZlLIAn6?=
 =?us-ascii?Q?m0Zs2ClY8k/70RY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:47:49.4997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbfdb7a-76a0-4aac-3e41-08dd20b174be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7862
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
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++++---
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 5e8c5c0657c4..56fb0870a2fc 100644
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

