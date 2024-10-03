Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D898F7D2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FEF10E933;
	Thu,  3 Oct 2024 20:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CViii64q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6A610E933;
 Thu,  3 Oct 2024 20:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5che6DUmPVYAtLY/NxCAPKeDcV0a8uY+5yegAu+Huh9Kcl5FkIBkZwQ0OXab5r350RsguVBpI+Rvd1dwBYEQlZxQB56FJaKNjn49G9throkziB7cy+XUavZh3U6BfqQnzuuXAuo7HyB6+sKOSeiAcCFksokEGvKPSQU8gFdOxnMjvcL9/E6U14frgdImtmuBrj1CATZJi4dIWZXD8Fart4eOXBTKdF5OOzPaVj607MVueQjaG3ny/UETxotiEvpldulLLugdKxpgJpeylZmbnP7z/i90gZ/TuoPFKvQWniTBg+gBme1Lkf/rhuS45rI9G+21vCK2NuDVl5q7XVqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MTGeOwN+W6NkQgKLazuaznTq/QunsfljGA2AwsDXHY=;
 b=iZAYzlp3ZNYH6IpYIBrtIViEEIML1B1OBFR5sd6rDPfI8tKI7aeAVkm/pOVaVNiWQuMb4k1hAOiF8V2cboMGFegYyhAttntnAGLgRvEo39cG1Ib6BBb38QOax0ElkA/rg25jGN/0vPwSYQdyAqcWVLZDsLoeGSxZD6rjr3/rsC/ewCyHrFD4UCzT0bI0cqe4r1bnpZEhQrZaHesfZZyn+pU1gIlWanGGiwPh2u0eEVlDqTGlLjN+CD1zlt9lplV2e0uA/PvD5EKIsH6FxHTroFjxIY54P7C9HbVL5dZ8PyhuJRPsW5KZimPL4RTU8skXBDT56+y0dltWnHzRvFPAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MTGeOwN+W6NkQgKLazuaznTq/QunsfljGA2AwsDXHY=;
 b=CViii64qIMwGUAP0Q6Ye8vDmbmFjEas9cxBus7M2sCntitbwqoOWY7WL+CXZW8dBwI/N3CdXdAk9ZZK5+iwwthMZHQ7ZEb4YRwvoE9e2vYMSsbA/VSgdM/fo3UoICF+IbUs1N2jyKmCNae6/3UTSGeg8CA/46qsy/fODHSUrWmM=
Received: from DM6PR04CA0020.namprd04.prod.outlook.com (2603:10b6:5:334::25)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:02:08 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::da) by DM6PR04CA0020.outlook.office365.com
 (2603:10b6:5:334::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:02:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:58 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:58 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 44/44] drm/amd/display: Add AMD color pipeline doc
Date: Thu, 3 Oct 2024 16:01:26 -0400
Message-ID: <20241003200129.1732122-45-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: fa488002-0030-4923-3ff5-08dce3e642a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oZABx1RfBu3XVK0LkknXZ2aerfGa9a4Wo0W3lNUnNzArBYHy+rDWJggwMat5?=
 =?us-ascii?Q?lSMw733q3iKAGkuzUYLg2U3W8aJVzCn4VdzqUisxaUApm9DCXIk13VmtiW/f?=
 =?us-ascii?Q?mWTv9/NB/rGYb+l3nvUjcXvpgmMbN1YzDKD/ohtamEDhq0o/eooYcJZBj3m1?=
 =?us-ascii?Q?Dbj1d00Jn5K1E6gRXukOwdHSzRI4SAXsvDBlzVNpccoSm/yz8gafcm+ogqtq?=
 =?us-ascii?Q?vPcZRQQeL6LdmPV+4n7W0zES7qC5UalTyEcJbOXh9GYaD5XxVJtnhRZz/TVl?=
 =?us-ascii?Q?ZhSGIfz0Jmiph3SWKhGVi0LnBaEGA49pHvF0gbx4K6Z1W8P8cwYtErEtJRbZ?=
 =?us-ascii?Q?ZBYAGCtF/4CfgRtc8+6D26o4I0hAm4jwoewOskJxwoqs8ynqxJO3tQ7ly4m8?=
 =?us-ascii?Q?CVF6cfQocbBlfaSOFNCQsUYshgEjifUq021qXPr/MXPTwEt/2QqfWVV3xLgQ?=
 =?us-ascii?Q?psucelBkW+jOE4JIq7B9aqkm3gmK0LW+LqWDff2Dt5Xo05vP8p1LFCI3JN/F?=
 =?us-ascii?Q?3w7Chm0H/7WjhnT3uvdhixYWBh3a/82Fd0Sz8CI3iRXzmbLLxmIfoUAKDcom?=
 =?us-ascii?Q?hiZE44hLJuxznQRlaxfinnwEwqJYKQZWUxJPqyTqnk9GRFtiBstDSCcn8Olr?=
 =?us-ascii?Q?vjxC+J+2tWdTnMoW2CgPvZmO/+bIDpNYAG/ynJTyTUy2TMNjZmuGHSkNrAu4?=
 =?us-ascii?Q?QHIpjFRjhLpPtsBADo4zVnPco6uYfns/PAT4RGW5zy2u0RjJ2ysz5o9yM+g4?=
 =?us-ascii?Q?Yo4l0bZ2c1fisCumDQU2LxeOxyjeJlNW4oJH7qlj6/mXM7GAfqb1NsHYWD6n?=
 =?us-ascii?Q?vQskHIrivGJUIxn8+I0ryRTEvYgWQpeUC+KtRngd7qRWDcFJ+K2x2zj5GOvx?=
 =?us-ascii?Q?O5ayYtmTTdfvkRy0PJIcMATej34h0HphpZs++kqntWLyzuyZpriNqEUlcLQm?=
 =?us-ascii?Q?+xVrZJHeg0EsngijMWQIzXBGmyl1IJKraq1Z7zVNyPiKi+DOWz1xJyteki7I?=
 =?us-ascii?Q?vWY4g6z++YqLQPH0sn+bIwUtDBtKnOkoXfBn/5seClscS8Y9E7UTUZPP5fEn?=
 =?us-ascii?Q?K/wbKl9o+FRvt06sZmCbcJhxjGtPO3xfVA4K+Fxuf82/HYyvmKmsr9NDgGmp?=
 =?us-ascii?Q?TaKDkIta9Gf8NgbUFov+F2c4Aw9rAKF/cIbssyHWc3FNffzh1eQpHBQgb2ok?=
 =?us-ascii?Q?9fWHSHpZs3xzrBxQ2upKMKa7sxAkE/sCRT82/a+oQhpxJiUrctkF8FTO0EuS?=
 =?us-ascii?Q?T2ivZPnfNlftVzjxDmqVAugPOLpRiesaKjrmUGo3g5N/LKb3SS70AGakzFBi?=
 =?us-ascii?Q?UIAwahXjzKujjFA6lNm2lIhvkxHtdrLMtsOiLgwCAuge9oCzF+hlUUgzClZO?=
 =?us-ascii?Q?BuRM5jL/yjzMeuRyEpiHIsusAfpR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:02:07.9161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa488002-0030-4923-3ff5-08dce3e642a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728
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
index 3814f6fce4a2..8c5d91556462 100644
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
2.46.2

