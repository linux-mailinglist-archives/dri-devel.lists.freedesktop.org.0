Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35CBB27796
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E634E10EBD4;
	Fri, 15 Aug 2025 04:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ilDMPMP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EF910EBBE;
 Fri, 15 Aug 2025 04:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ/u7pwu0uncYg/qqMrcnkZE3+ixFKpKU3B4UKBSxoCP6YK1BidxlEDTio/erm6q/VaxTXL3Htx7tlCgNX3sI2Kwub93u3VMAuts5bx/jCAudWsj1rqE2jV+2knmbIpt5s52xvIuTzAFL6Ow9o6ruK89uLwpuKbKj2DmOL+mvAPuCZFWu0dtG3TMerl59WRtLHJPH4wgZCo7vmKrj8ANvKsxP6O8+6W3fgOQ6HTNjFqrGiVvbEAvi5I+NkbrE+5KqSTfZLY5ToccUO9Ajs8pffntRVmABYL1J6jew/K53oV24YFC5l97oJQGDv5bfrS7Sbf4TT4pPMFxWPAb4p8DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkmhU2g3Fjt+Ekxv7F5B5QgNHI8QttGT2erZhMRbPrE=;
 b=P8+/eaNLyeHMonIlY9O1tNGxB7xygTVHPoddHJbDmMWs4iB4uIXme3/3feKP9dsJZkBacLK/McUDG22buXFYw0KT1seTFi07xWmvc9PZXVtwp7/f3oNCUHzAqpDmux2QnGJeJCpVJuqVWN4sALtkm8m+Co4Q8JCXJ59oyL9jmjWwxvebKtmKZDQS9Lrrz5So4ah4tbpV7dAeTjssEriAApwT7KhSENbi6zk9E5OQsfW0yZLrHCncjuBReHLfn6xfeuYp5walt5VqXzk+B5UuRK1DkG6s+Wgq9A2skQ+I3OF6d5fpiVZYDyPLkQq+J9L+7XUt89eCa+awu6enq6HHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkmhU2g3Fjt+Ekxv7F5B5QgNHI8QttGT2erZhMRbPrE=;
 b=ilDMPMP+RDUkmbU7u4nwwuSHuoGDA1oduXwuhn7IXkhrX3W4tFihdEs64x8gr3+WrQ+yEvXKMF/fZplEyy8Pu7mcIQYIRlvXUhlIfoA6YSvl16NGY3htqy2+9zVqCAHiurO1rM8VX6drUePaAuMgp9JBsH3tV3Jxkgg4d3+6Lq0=
Received: from CH5P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::19)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 04:02:29 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::ce) by CH5P220CA0021.outlook.office365.com
 (2603:10b6:610:1ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 04:02:29 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:02:25 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 45/47] drm/amd/display: Add AMD color pipeline doc
Date: Thu, 14 Aug 2025 21:50:34 -0600
Message-ID: <20250815035047.3319284-46-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 013dfab0-6b0a-4175-5d2f-08dddbb08d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4+04v/Ihv7MaqJIARJK6g/QfZ6eaEVwBBrn8Gq7O6ZzBR8H3SxsnSVaCw4pY?=
 =?us-ascii?Q?Ed1r0A/OFdFWes8P9QZzhoDnDMgV5exTlOprC6Nfe6CmOV58xXSUIyH4UzQI?=
 =?us-ascii?Q?Vga1Cy5e3P4kfHQRLDGuRsO2ZYpMRTvKXtSy+RNEayklpObcJBa7D01xHVIw?=
 =?us-ascii?Q?pw7gI69TjNZi09vhjtZ6SpHZgRqmX8qWAMDf1dwBvwZI6ZHW3UH6H9sSTCkm?=
 =?us-ascii?Q?4wT/8GtoSUx4KUNOtAUAkMC6zl23CENnoPFJiyDaJ/3zlBKO+DPZBqwjlgTV?=
 =?us-ascii?Q?1CpXBwSvN7FgKZ9OgI1XrYwT6DKqOWQHuKPts/KRkEjXj52tJEjb5/zYIEd+?=
 =?us-ascii?Q?ia4JwePkST8Ev1Y5a1n2MdMoNP44M3juQJd+9ZaNOOaHtm9+RNTt0tiDBium?=
 =?us-ascii?Q?xJP8CL6RA2iLXsB2vcR/4DqtSJ5u4sL8TibWw97GUtRXYqCZMb5B8JT8cLet?=
 =?us-ascii?Q?sZN0+Jsd1+W+0dJI1HTjodiBZIQs8pN8Hg7Q6zEnhltKnjB1FG5zenr3U4ue?=
 =?us-ascii?Q?/M+Z13McIRdiOWtTEtpvcmXhA1Fhos20EWxys8fd1o8+9YiJV6vutzJPNmex?=
 =?us-ascii?Q?tgoRv1BxG79MQAWC5gOaHZ5gRIaeXUmnuH2EC1d9oelX7WODJIUfvmoTk7t5?=
 =?us-ascii?Q?oo58tMYxZwNEE1HrhUn4TjADkYg3iraXu61q6J8M5FkUiWIVnIEn8MX6kY3Y?=
 =?us-ascii?Q?VXwOgMT9c/ALuey1ULHwV4xwjvaMqEH98CThk2BeIQKgAtxhKlk6l7vdCDn8?=
 =?us-ascii?Q?fYzwLe9NXlKjBPWvQZhclUZ9NkkxYo2YutBqKzIhIN9O90T98vxlojwUmJia?=
 =?us-ascii?Q?6Ei0RC0rhi8rm/fzEPJdWXiJXQbE0JZEUx8F5PTSZGTzVfuVMrQwWKnswJPt?=
 =?us-ascii?Q?tCUnHtBJ3nA4At5489VBNoDcApABRIwiTQLu8RzXrNHlU7P/W8+2CguVBQBo?=
 =?us-ascii?Q?rNH+srsM3q0t+Vqpq9YwnvQNdJeIZk6/ECm0Tlz5N6HSQZwYathVp5KwhTkG?=
 =?us-ascii?Q?RAkBSKhi/y5sckuYu6EIvm7SWelmYr/s48tqfyou74uO/lmU0B1k/HRcZJSx?=
 =?us-ascii?Q?zQrxdjjkWVHm6p9yYabQg6TJWQexuMIerwCOEpZVRW8/FNbC8piaRSFJSC7u?=
 =?us-ascii?Q?cKlYgdy52FZKJF4o9dGi6UA+X0PKamaV1N9Onxt3tjjmfB+eSIDqCtHagAWW?=
 =?us-ascii?Q?Q+VCxi0qAc/Y5B0w2+1M64TFgH2tMlUU961M0EeeiCM+5Ie7m+IfZtEr8ivf?=
 =?us-ascii?Q?Qsk1y46z6FSQhQFqI+6d/mMTDaDXUuzV4PgYE4AXF+ZS0UkNVfSrJaaEGjR6?=
 =?us-ascii?Q?8MgRwh8M+2+PRZQT6moiXysDckNxkl8R6Wt4jn8W3qCMWd4x0NPgxOCloPsB?=
 =?us-ascii?Q?XYyzHPo1r5Xmma8FulAkeblNY6GhYafb1dMrgz6rFALmEZv+NJVPc5eJB7XY?=
 =?us-ascii?Q?Fg95CMgeKLL0ZovJXYjudgMVR+vD0xV8x2qxdfzKZC+ByFU0IEJr0LeO2bli?=
 =?us-ascii?Q?86O3qkQvaCSU+pQKSU0L23T5WeeB8XX1ma0r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:02:29.1435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 013dfab0-6b0a-4175-5d2f-08dddbb08d8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418
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
index 0056c77225c2..a91ca66d2f56 100644
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

