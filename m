Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F7C5FB85
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07B310EC6D;
	Sat, 15 Nov 2025 00:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kVyKjDoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013057.outbound.protection.outlook.com
 [40.93.196.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949FA10EC6D;
 Sat, 15 Nov 2025 00:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9YdsgCLxsePH5CXX2MgVOyyCbRMx4OFOZ6v31Znk2+eBaC1BZ0rfMh1OkvaoR/cH4LiIJP0t3lrmVGQM0L/ngM5y8UYIXMY4B1kgaYSS4wr0ggRqqZu25GspP/95yMD06bmT3a3p/bT9spleUUP3iM+Jl8U5fc3Yv6LJFQPgbQJmOXWYn/oS67m/PrF91tWaJphvSHuoRW0ZXTnfSihqp/3mrM5DPntJzpB8jcMBW5pMWfR9MZfYXW5SjiTJvYdFJZBL27Jg7tD1fG2yM0QnpUOnd+QjIm9z7Yk3huI1Zjs8k8FFf2hENbya2uaNmuNN/+DKrNNRwfGEvaNh4921g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaelOL8qnJYHmNVb+Gn2UqkfLSShSKnRLLg0d0rvVC4=;
 b=dewofUfwSXXnipn6qrB0dQA2nyB7n5hgUVuHR6Md9XxwYg6WkKssZr5cwkJmSh1KKS/A9Dl0xLS5lbzKxIC7G7unrSBtPHH0CBN6yjXdg/ElIXUzqDrFsTjq/xHpOD04jRmHRg33VIm+M1jz3uV0z+mzlAAnkL4uVeZNE4WuYfkgTeu6s5XITGJ1OkQ/z5zt4+RCjlxuJTDTBHE//gUraEY2lJRzm2AMfFdPg5zsu30LbD8aXGYTulVdD/xdwk6Gzlgux/LNK2x1SoACBuIHPSANDo8dzZSRAoXeV3aiI5+5Q7l5XqL/zMK7xQdXJ406do0v7YCU2bO67udbYMzDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaelOL8qnJYHmNVb+Gn2UqkfLSShSKnRLLg0d0rvVC4=;
 b=kVyKjDoFC6Fos57yPqWYzmQB5PYG5viaDrc0PxPx3KX0MpNoO4CUyrA9yt/rwHtWipOENBBYiplGmF3iP6mF+jyi2mOMM4FAZcNQsfQt5V4UjnMheVxXmMDnLMPsqcULiXs8UUfaeFNakNoi873pAflmwgXz1dRNIOxCrnBaADg=
Received: from CH5PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:1f1::21)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:15:01 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::5a) by CH5PR03CA0023.outlook.office365.com
 (2603:10b6:610:1f1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:15:00 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:14:56 -0800
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
Subject: [PATCH V13 47/51] drm/amd/display: Add AMD color pipeline doc
Date: Fri, 14 Nov 2025 17:02:12 -0700
Message-ID: <20251115000237.3561250-48-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 8846061e-9d83-47a8-00cd-08de23dc045d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RFW7nhrvvk4/02CzCSVjtx3SScSWEMOg9m+1BPwt+XC3JrNveX+JbKhmJrFG?=
 =?us-ascii?Q?DCFb2RwYemmFkc5iJWC/wsNF6j1QPCcXBbxAoBUSElP/7p9LMEvE+rgIEMRK?=
 =?us-ascii?Q?eVQNjn1r24FIS8xH8M31d4NhJx1Q3guambTnVArZKf7zopao0xzoglbhA47i?=
 =?us-ascii?Q?9Rztf2A+x6hpcCbQjrLsPHTgNWJWQRJb3Jrulb6OVVCFY412aLQ7yUML/XaT?=
 =?us-ascii?Q?ovbo/OLtW9DqalOgKYfzcsIpsTWJxGETdhlfuJRb9fTboVXhe5aiwRk/qNIg?=
 =?us-ascii?Q?9LhCRaF0VE2IAa9RhSMNYEqd6GCPHIvWAC+jEEi9vq1loj4ox4Xq1O61sVDA?=
 =?us-ascii?Q?/eyGcSBVQQBbSUkXa80JNGoYzTXxuPXFXloWXTQgZc6FBVu35jHmN9tlRj1M?=
 =?us-ascii?Q?HReIt/gmNX1skLIVfjE4cuJjrZpMRe4PO3JLBdb6VEVnypnM/AROR5GCUDbP?=
 =?us-ascii?Q?nIv6Z6S9yZXpeM1KdQV8bByttxLozwd2UPpxv8cJGJSdGCVpVM/dDYebo4Hv?=
 =?us-ascii?Q?GmCmY6NLTQxWFKJ39yprsOGGtvp+JCGTERWJh4Ir3yoafSI7pHBlVv2hXrYq?=
 =?us-ascii?Q?OFjOxO/0J4pC2eiFrjrYpvssY0vACyKc9pu5/3S3clK43JqyeQEjlsXEOJZ7?=
 =?us-ascii?Q?iI1BouxpOSGWk8FfPIS6ezJ2+FpSMIXpHQCIGQc6011dQylQSS4pqWyBsN+v?=
 =?us-ascii?Q?zLVjI4li7aTnlGn6i4YrHeMNGkt6zusGj1hYbvFqXLpzqF9OPS33svruavjr?=
 =?us-ascii?Q?LxRg5BTdqWwmR0LjrpIfAJBgjnxh2hQO1+9uLR78oXZR4ez/MoOKL6cCM2Qy?=
 =?us-ascii?Q?mx7OlDRsVqKcu5vH1wwUdmJXoblBGUN71c5nxoA3JSDWYQd6PalF8BzAKBoj?=
 =?us-ascii?Q?a+XoFyP7q6te8xmvVcJ/gK6u3QPNhbCDQGuCswfYx7slpc/VrP0JN7O0osAd?=
 =?us-ascii?Q?FP+6L4ny4pdwS+iA+CZLfuVEo87uS1JTctufQV7UziJK9rFuJa5GNCBI6IMj?=
 =?us-ascii?Q?CrgGCS8rX3TnWxnQBAe//i4MAE4JjQb3Y5J4JXB2QmLMy8dpg+UaSseZCoAD?=
 =?us-ascii?Q?YuZUKlk0UDPy/Ejv5C6tpBewzLAYtTLN2p31rVtQutfFPD9F5vcutJRDIxWj?=
 =?us-ascii?Q?yYRXbyZ4ovlswxfO6dyevprWXaU/59APm1hzLh3y6ji6j+mbcjRYVFiGGwZ1?=
 =?us-ascii?Q?T2Z6z4eQro9p+isBuyX5x6CouK9kUpB1FjA5Qsjv/xy3DCtOk1RXKT1yckgR?=
 =?us-ascii?Q?lh54rKX4EV0jwNlopYDSuoaAFmhblUcSRib1ElmDqVgBeCB1fmy8ptI+sHom?=
 =?us-ascii?Q?Dit09P/IUjziYCd2oj/0Auay56ZtE/L5cj068UDBWwbdtA2X95ImH0YGgBtX?=
 =?us-ascii?Q?AvdHcQxA+M7YId4zWUSzhlKBAcRlvrSokHQrEM7nKFG3o7cUDh9lmYqw4F7e?=
 =?us-ascii?Q?QH0tmxpb2IBdB7H0xkt3QIntJqm3Z7ec/RsjdNj6ezNqBUD5cBHmxr35y8Mq?=
 =?us-ascii?Q?yVTJq9SRHqdAyWSRMhnmxqazEJTefuSaNtjGAY9IHNag4ynecNwCtcXLHzKE?=
 =?us-ascii?Q?bjb2DmekB0PD0zD+/Gk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:15:00.4908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8846061e-9d83-47a8-00cd-08de23dc045d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
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
index 01e420b4527c..dafe8a0afcd1 100644
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

