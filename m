Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A33A7279E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031110E82A;
	Wed, 26 Mar 2025 23:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J1WUj/wn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8352410E82A;
 Wed, 26 Mar 2025 23:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waF+TVexTu3dVkjnGARUJjKhAXkm2gIsaWFlGJM/4poFAypea/wbpGAFvKVkxcMU5mKYl+6GbAgGj4g7wiVDU1QPsGpZ/HDF0C4grhvm44nVH70c9v4DmDFyZE1nwwXdt9cNQfjYnmRCOEsJM5BSgb8S9p4fH6zJkevumdoUQK0jQL8qJpPZ6oaw5151ur51kHIH3Hq5boJd1e4pUO2y7dQNV10+sSYJgy3S5cq3wN1LUkDr98YHIYf3KjY+RpP4HL70N/eA31jQQoe/87roOPSXbiaIutIV8HQOLoiZAsyWomhh0RR7Xk1dNfhTlWSd7lHJCss2rdfZEKqUQW+auA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKU/t3C8qqHh1vNMrVvEGhXcvUGFEU4nC6lCr0p9RtU=;
 b=Ppwuy2TmcZK7yWIxFUCuBpQdKQRCH+BzKIEDW1r0jVB5mTzSw+J1fCK30pN88dBZcdUZlRfIPxPeQN4nctDSJdDJ/bEMUfPXKiuDfGHt/4tLTSoArypEFYGpVUn1IVzU2+YD4eCBE3Q7hSJess/SvUWNKvHXdn+gnaawfw4cJsZp9/uDLRrW+hwHu4sLyoqvm7KX3Vb8rC2wPdfu/jgaqQChrELUgDDJSJy+dlQZItOdOu+rNoBmZX0JxJP/5A1om/hwRaHP+6qdZxdR8Dne82SawnCzvHspYphR1y7Y3p04oaW0dgnckcpb9R3fdnpdiqUr6lJC7rCA0GEodIWHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKU/t3C8qqHh1vNMrVvEGhXcvUGFEU4nC6lCr0p9RtU=;
 b=J1WUj/wnb3BZLy4q8cOxZzqX4lArCvwv15nNtS7F+rXiuFFOvPOkxUFAp+w080o1tUgSMrvS/iJCeM7EKjSdkLtIC9ijqVSmUGoVrgtSVnDNMrGcR8lAamNk/hEERMFsToCOQBggRmdYHjQw9pgnNI8QPuCVhWSgV5aB/RwkXAY=
Received: from MW4PR03CA0290.namprd03.prod.outlook.com (2603:10b6:303:b5::25)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 23:58:31 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::92) by MW4PR03CA0290.outlook.office365.com
 (2603:10b6:303:b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:58:30 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:58:27 -0500
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
Subject: [PATCH V8 42/43] drm/amd/display: Add AMD color pipeline doc
Date: Wed, 26 Mar 2025 17:47:23 -0600
Message-ID: <20250326234748.2982010-43-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: a2301000-fd30-42a0-7c1f-08dd6cc21c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?odZCd56RkiYtVkQ67QUUg0rd0DXiC7ZF7K44C9HxPVjiTleAqJkIyKdfrxAJ?=
 =?us-ascii?Q?BHb8n80imYn/j2ONOYTanJrMZH6jHMimwBwhuYdUDhA6+6b6ADb52LhJCi6E?=
 =?us-ascii?Q?qFRWgaJJFwdvK4gXLXJY8ezkyC4EoYk7wMln/hIRDTixJQJ5hhspKBlkqKs4?=
 =?us-ascii?Q?pktnDofYnlWVXyNRV4an9gHmhVxLgnrG1l/sOKTknYUVF9cAzr1NUfTPuGOZ?=
 =?us-ascii?Q?TOjErYhQanNoLeIWcyihkc6pu2d94qnbVw1NmW1gQy+s3y8YjDJC1vYAGkzs?=
 =?us-ascii?Q?2Q+28ERiy37/CU5XTNmEO4HqJQ1lVNbjuPpIsSkkHynzcsrDROTZJxzHAP4+?=
 =?us-ascii?Q?/zmiVd5TcIGBiBXVQXxYeRgvLQuot0xUpV96fE1sc1wOkvx9QGcSXQZZk5jn?=
 =?us-ascii?Q?TiyssFMyqvwvWwuRCxW2h+5YlIKDXfQl5HYcoFgP03tftpO2Ilr3PFqt2rJq?=
 =?us-ascii?Q?WPZ1kp0DemkUaU/40MChx8aFdHuj+p2SXS0Y3SCMqn9XUXJVhzkcYygco1rJ?=
 =?us-ascii?Q?FEOwM33e1y+Dxa8Zcvhj3sKM8x2SuCsVzPp0prHlsFTj8XUk2h4nm2SoybkT?=
 =?us-ascii?Q?2PLluPVis1eGlBtaISqJW3S2VECrCH5/uukfD9yYTCUqbaZKQLS2ZJC9bcE5?=
 =?us-ascii?Q?ukNAw6B5I3pnjl7B6N3tqto7U1eUIGkOhyGZH8KZw3smh8cg3EB/TdJ+UH4n?=
 =?us-ascii?Q?EsD2HEtBZ6hjND6aq4w6A6QusCL9ozRtCmz4MAiOumzor9JxHtShLs9Y9dt0?=
 =?us-ascii?Q?+nKjntDZoGf1YEHBmNco0nyrLb5OVVZA1BnstCnogP0wZnccdRpr11twn57W?=
 =?us-ascii?Q?BBVZFIgCWWQEZcswRdMQY7UDF0CQH0T7/TIU2pOg6l2V7DSOg7a9limkCUGN?=
 =?us-ascii?Q?me+0Efb0HJzQBMGH6tYTzGixaFu5fgl8HaEmQKPhHtYXaTK2fpKFFX9Kud7T?=
 =?us-ascii?Q?FGF6f2wZrGCgb9A0fzOwg5dwKD0U1Z4K1P6eFrLeu+EuuRgNJM95aKWoCQUe?=
 =?us-ascii?Q?kSQK0540yswcHePMRnVrjslsVoK1MySAPCescN/1g5eTW6ZbxYCuAsE5gky0?=
 =?us-ascii?Q?mkn29zThvcrUNveQjx81YeRkMkNCCPGYrlYVIieINQTic7xGpssmtOMC9dE6?=
 =?us-ascii?Q?LD6UrkeHs1zduME31LdHMbPpjy8U3kstxfBDRqM464vvF75AohSqSatWkM75?=
 =?us-ascii?Q?44cEJ2nm8RTwOLhdWSAaxbYCRgdcL0r/3MfhxJCHSSbhYgSFViJ4NqUxFX8r?=
 =?us-ascii?Q?d5nB/EX88ggR5e8q4m3OCevpsDGJDbYsEMUDQRMWqvTEUUzTf5OIegs2sEs4?=
 =?us-ascii?Q?7JB3S4I4jtY4wjFvXF8P/0ThOOuLbvtB7XaT20cdf4/RxqmX3UlMwPgcYNR4?=
 =?us-ascii?Q?wUsOAmOMQojt0AUC9Nms3dNefJVNMKpXXRYNpGgPB2jqCyw9FvI8FENozK1H?=
 =?us-ascii?Q?vx8/kcVK/nzuw0OqSxl4RO6zN8t6/qbtzLcfOGmITJv3q90ngUcBM/eXXU5v?=
 =?us-ascii?Q?iJB3/RLpoMDBXx4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:58:30.9629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2301000-fd30-42a0-7c1f-08dd6cc21c51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910
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
index a4b6bb7b409f..6caec63f001b 100644
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

