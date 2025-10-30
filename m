Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D13C1E4E2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACA610EA87;
	Thu, 30 Oct 2025 03:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K3SMN7Wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E6810EA67;
 Thu, 30 Oct 2025 03:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCQAWdgEqw3DgLWaPheWYtyKnmyzsjoafb46fMTpm8pzNVGmE+3BNyy2ysoiuRIDkJZ07sa2KOuIuWYU5s46MXKh2T3kwxGMH1kN5HiHUEr0174ELxb4GxD7Ves6y1RWPSnSkYso9o5IAhYTcb7HfvNF5YgIakztzm6ROOVw0sIoQfxI2fntTA6caiZbzVqVi+nuln2vkHInngvTBh5w5DJu3IxkWxPazhTEWbaZe1h5SwSbSBqxuqphSCqeYaOLxPiygtGsaSE+ubUhNxysfALq6gIzVYegbgrYvyDurIo8RwVeApYW4dZ3mjHGcTQ56IyZaj6j19gDGw9oIsPfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUlriXC5+5UuN0p8UA2AZwUd17OxuOvFtk+r0WB1z+4=;
 b=NicMH8FKg/mzc4l8sB7Yl9lij+MnP4OEMoIvDhvMrm4EPl7SeropEif2Er2A2UAzLqWjSEP17ph+n3aGcMjQ/Ck9Vv29THaI8r6CLLMDeUcxkE+xaQ3APJTFdC4xmJPGzYUAcPsFKOXNmLwpvvB5Bx4Xsi9JQb/HSz4eptzr5EW+CaAtBjmGSbLCxcL7f+tj9+bf3w7ALj4qDyrUhO6nrCsrYqoqvgbGo+CzskuysW8SGzBoaPf+M9+vLpetr/cMS09fkwed2PHxBovfQaAOdTPRJtTyGqkQAz5AvLnb2ncUWJzScSoSoCflZgqcWjT6VtSGfPs3TEmEJdlE40k8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUlriXC5+5UuN0p8UA2AZwUd17OxuOvFtk+r0WB1z+4=;
 b=K3SMN7WgWIrZ4gn7ZiaJO6aInj8k+CY8mJXlPR5BgA1hWUjtPdxvwL4oA8GLwe1Kcq5Ej4gXcpnfRyoRHli0HJ3aZnFu658cTolDVDvvcuD7yqI3uW4+AbhYl+cIBQrt2qe6wX7hDOCWBycB2OLwSddQwUnTg8lTeBrPpJJQ1O0=
Received: from SJ0PR13CA0238.namprd13.prod.outlook.com (2603:10b6:a03:2c1::33)
 by PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:56:00 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::82) by SJ0PR13CA0238.outlook.office365.com
 (2603:10b6:a03:2c1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Thu,
 30 Oct 2025 03:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:55:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:55:54 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 45/49] drm/amd/display: Add AMD color pipeline doc
Date: Wed, 29 Oct 2025 21:42:50 -0600
Message-ID: <20251030034349.2309829-46-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|PH7PR12MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: a82a95f0-655c-4dc8-937d-08de17683ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2As5H6zChODtN9t5O8v8hmiJoTl9szBfqVZB7xaQ8yBLWzBYtf7Z9bzxu/6M?=
 =?us-ascii?Q?HOKXDUWdtlNBxVDseEZjne2gz6hzxuvMwqyakqvXT5ROSFc0Vj8QObgj8nF6?=
 =?us-ascii?Q?mOjXUToQ46HDBDwlwI9JSEuwKPTeo6UmPv7KLEgywsW1fpEz/0MdPvTgsJVt?=
 =?us-ascii?Q?O/VTMuvo0t7jVjbFHuRH1tcBy1JodaEBV/hDP5620P7vPXPF2+m5+gCMO8wO?=
 =?us-ascii?Q?Uy5i7n1CfNVuLQ4xzUwmJ0dd2rIE9VYF8mCTghqlf6CBmRauk7HW/7YwLnFa?=
 =?us-ascii?Q?pfcSpt+u2vDYuxhIqRwwyBYZz9yTT+en6DLsLFTA7ozv6uxBlZ3PYgDS0N7w?=
 =?us-ascii?Q?7OjEXsETzNGmSJ+9pRg8cjxNhDjORWWHffqzERbWza/VUQgcQdDW0O3IkufX?=
 =?us-ascii?Q?xKrWIjdxIQpoq1hD/xof3nYMwuR90erITbz3oKdT4F7D1HOxowDX48M8Nexd?=
 =?us-ascii?Q?2cjPoTV9jVEoyFlInl5dJPNcW13+U3aOObMBgWO1Ar2oVs1H/ewi0BnjZbv6?=
 =?us-ascii?Q?ju2S587KYjmJOiqJhtOgLQ+n92Osrplyv9Oug3xfNBjYNgQ8wjnxrSzBYeVB?=
 =?us-ascii?Q?/mpgz/q+vhv7sLOAeYMIX0ev/bDZqHuuRunrj3Acf4y9SVYBYFOLmI+UfmQT?=
 =?us-ascii?Q?R0AtlMY8N/591XKIEDKryhxlQUkliREyr2JlsJHixO9mFDomHodQVzHLdz42?=
 =?us-ascii?Q?48K5Zj8mHhx/2v+hyXmJzuzL2RFBrhln/Z3Yck8pnyd9OPs5sn21T2P3jUZm?=
 =?us-ascii?Q?ftWeFBe1ToEe78ybsoZCXNF5ddFOeXYK9W1ugLZBXGYiOTfMo5kOSK8vAxUc?=
 =?us-ascii?Q?+wdY0yaEadA95PUAXevudXyQY/J1hIdGFS68EGis+TfnZEdjnW0h5QVji1LY?=
 =?us-ascii?Q?b8G6QhZXhd6CiAsHIMMJXywqOb2sLHU6gf3skLGve4Bi+ukxdFwzS0OVBIzL?=
 =?us-ascii?Q?leeTVhu2tkbxxhpWNOeJzE5/A4vUh7rsyu3Wwt3ZQPfuNjynHybfEVDQZseH?=
 =?us-ascii?Q?KnQ9MmoWTDAMe91BmgZZLDQ0lsxAjDoGImDomX4o5bGUfoIZwVhNdAMwA8tQ?=
 =?us-ascii?Q?vrRKoq1r5OwoPAv0SL9byS4+oWSAnlq7o4zhLlTX/GUY6cmSMVwQ2w5+uFba?=
 =?us-ascii?Q?FbmZvkR/VVKipSltY1apmeILjc57CWdGUmFIdVVed7nopV3QEUkAJ6Twk9ti?=
 =?us-ascii?Q?iWkKRgF3p+VsVffepCQ+381cNOPiDjnYst+gXMXeCOih99KuWJaXYuZNmRum?=
 =?us-ascii?Q?aNlaIwvyk0mYqvjDrIOQjNccpjb2SlBJ8zkqJrRVZ2nRv6FhuNusRCLgSHsl?=
 =?us-ascii?Q?T0/K6hs+T3qvXdQZRq3AqFcLiaEB4ijAGfY8NQnQ7MN9lU7QisDKfMCYEAyP?=
 =?us-ascii?Q?xa5BmMSBfhLfpDTk3TQ9/OGbFx3mVMvX63/6St5QsuRwXt3o7X4GkwPf+Wrk?=
 =?us-ascii?Q?NJY9QchmoVgl5RFFhpC9DL4reqf/PKwYqd8uC2g5dtMhqwIbtwspsH6IOGjO?=
 =?us-ascii?Q?W1+O0/yoTzUAVIRMPOnNGk5qTDRkWEUa0m/5BE6/oHGIXUF2tmyKU4R5WnAc?=
 =?us-ascii?Q?ILwMVd9Mb1DZrTeOg+U=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:55:59.7656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a82a95f0-655c-4dc8-937d-08de17683ce7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796
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
index e442fa9b791b..e6da42e7fcb3 100644
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

