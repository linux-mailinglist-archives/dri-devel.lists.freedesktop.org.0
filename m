Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45EBC1E48F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7391610E9C4;
	Thu, 30 Oct 2025 03:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fYTjqbkG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977510E9C4;
 Thu, 30 Oct 2025 03:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+hraZ/n0wPu8QJ0tbeItKyBpgSCgxoLUZjYbrXNhiBJE4QDTpUq2C0PcYe0rBhHiSLqdvCGof7xOCgX1bDpRRD2SlOro3U0L9GXiCn77Q9LEYyRB1hGClEf1r2nBeTE76LwQy2eUmwqBtC894E2XHWTlD7ZE7NAirxEJjfeGvpLil9vAAry1Ze5gNjYysoUUaUEr/0X6wmRn8kxf9EvAVE9oLh/Z9u8yv3I6CmaGVAnwqyhYNlNwfrU6xso4qlE3FzLqNF1PCCRc40gXuBBegJpj4KzMi3NdRqeC53qjkhHV4Aa0bORJxdxRXZXMcUuyVhKT9IdJW/O7s4iXwFang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SHcHL3tw4kfjdEZSfeitg/FLss8c/qBfc+FoOa5hyY=;
 b=GHZ3y36g0l3ZxKsxDe45f5Na+9AJPvW+xkJUj78CSHODOxNQsCtv1rHBj+CTwJlz+viqqGhqkG8VkK4ddC/NJ6UaY+bFdNZQn19sVWbAQVMVyaM8ob0SzLPjcCdnDAjoXmFwoKqk4NvXHXOkAoDCJb1dRDKl4oplJ+D0LFlUvc2PLUSBlm5jbAp8dww0aaCGHL6O9dhr5eArgtyO/bhwmhpioNST8jP+doZDGkYagyqx2RUyw7iZ5GGHbjfrEDUDT5K2PCpx7OCzXdgS3L6nXuHKs7yjk/KooMm+bt3E9/Ej86chXN12oudEvYB2W61t6EIFctUEE/TKqJ7LATTZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SHcHL3tw4kfjdEZSfeitg/FLss8c/qBfc+FoOa5hyY=;
 b=fYTjqbkGsuUzhLEz/TYg8i6c795Hkv3rP52EwezEDY/mceGE+a8gSQOrKQbAHcDoINdXImgaJx3Jk+z2lSeBheXmm/PbT+Eh42HvK5vDrPhFiumcdgqBsTF09yhmXjz0ZTvu5PO2cQHg/6XFvYxzayWVvrOylF7QqtgshcoHIGI=
Received: from MN2PR06CA0001.namprd06.prod.outlook.com (2603:10b6:208:23d::6)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:52:45 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::ba) by MN2PR06CA0001.outlook.office365.com
 (2603:10b6:208:23d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:52:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:52:40 -0700
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
Subject: [PATCH V12 32/49] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Wed, 29 Oct 2025 21:42:37 -0600
Message-ID: <20251030034349.2309829-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf1b69f-c847-468a-d609-08de1767c8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KKjd8jgr23qsO5m/a5ZBJYawxmP/oCl+SRCM3DyFb4gIIFFkkoEysX0RfiTE?=
 =?us-ascii?Q?OfsI/4b8INAc9BetSKS59yazsZDW6Y059P3wVqBmlfWeltYrdlbMjZxVcuKx?=
 =?us-ascii?Q?rbGoMF+KwuY/hSi5gA5Q1T8Nq0wwxiZil8SKQhGLL572NZ0kFi191xyXZ0TE?=
 =?us-ascii?Q?TZOdiloljccnAAd2ny6uo3/As0TcYnh6bTND+ki9ib4v1MOBzL2vIxzRpCOp?=
 =?us-ascii?Q?XVpa2v44tepqOdbhTbblNGe1+3+sNOZUIRCsRkjQ6sK098nGGF+ycjKpvr0t?=
 =?us-ascii?Q?CvJNNUgGNPN1o15Zqf+5kHaP0w+PNBNHaTu3WbthE2r/qpy7QHobbgKEShYp?=
 =?us-ascii?Q?V+lhrhgXscRga0GoZrpOzDaU7eNR2vB0Ml63YkG8lbh70iYWNbUs0alUUjza?=
 =?us-ascii?Q?/KvIVXkknJAqZp7krLv1znCvTb+U0QV2eYzHkhgn/BaIfBY+T5hsDIChezbj?=
 =?us-ascii?Q?cutytXJMk7L4BofyAb6PKb7zpfTz4zydwa0C9GfwMLlP9AhdbdLSRnTYLrnc?=
 =?us-ascii?Q?R1UT4vbNElDZAkCqmunIwJ9MQFoO/DLXugqaoK9xeqp0gnPl4acCpAl8BzCW?=
 =?us-ascii?Q?msd/UsgU2fk2+5URLE2aC1tQ/u7uGjkssarZ33bd6yT7I2LWcrACZopLDxDi?=
 =?us-ascii?Q?IAB8I5pLkx3F/40t0+Zs2th8Qm1SmtLUDEFTeXvrsYF6GPNxnmoGOTCcx5O/?=
 =?us-ascii?Q?eogA+Ud24UJy+0dMzkHDGVjbOx+Y1K76ydJ2H6FLjd5C5rkIBW3aYal18LNg?=
 =?us-ascii?Q?MPySAkGCbkj3qOM+48XKQYQmkI805JlXWpHRQwQZqEx2g8BYeeAebhGijyNX?=
 =?us-ascii?Q?UMEm8km/5o4a7ZOtFNu/xg+IsVKkLJ7n0hNeWQQ6vkEK7JkZ1DsZQgvDhV00?=
 =?us-ascii?Q?ZXsV/eh/vl8THj/K96FiYRVCeArJ7qiKC2ytHtXYfCPJMYcn3c78YiVC/qth?=
 =?us-ascii?Q?pgUWI9iS0szDX+LQbEnn4XMShF7oCSkbzOG6iEYVJeOp0U/whj1uKi13uSWK?=
 =?us-ascii?Q?ieLw0kxo2Hg+BP6SGbg8mXrmSuIc2ARKukAeURpFHouzfX5W+Rm5lemWCvY9?=
 =?us-ascii?Q?nAt6QKPkSbOESh2pXgAWITOFExdZqk9ZOTGNJAHpIrYC4R6fwGdlOUX1idjC?=
 =?us-ascii?Q?5hpb+drPcwhP9JLFEc+9fi+Y0xEHLF7I1/2+8Ep12tn68kkYoE90V4iNuSY4?=
 =?us-ascii?Q?Q3qAMnb6E46nQit0gDCvVNCQ/bTnjfalk1OcaKTcCcZ/MD2Viq93/Fhp3EP2?=
 =?us-ascii?Q?oARGk16rMnkoyEzME09gE/Q+TrXfq/v/27NYHOsHzv26FDM+XLE/sTxvjp1k?=
 =?us-ascii?Q?7/EQ2EaEdaSDc3y1CInkKqoJ19auBS1/btVDxMXhKQpelkuDLLlhB8va5CkN?=
 =?us-ascii?Q?IKjWaOPD1ylr3qkaSU/GrO1MR/fx1xT6v2vnuqPGlhdZ705a/ilkdx+0mitf?=
 =?us-ascii?Q?eC+yOjpYoqPpmT1UI9zL8jlqLaiFwz24TDJ40s0OFhcHI/2vlypyPS00S3tz?=
 =?us-ascii?Q?JlFI8ScEx8VrGaVFTAeVVmve3cDozE/gdlN0H59dTmCkim3Zz28P1UJHBze4?=
 =?us-ascii?Q?fF/i+16r5QUCKNFSUws=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:52:45.0481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf1b69f-c847-468a-d609-08de1767c8c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
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

This adds support for the BT.709/BT.2020 transfer functions
on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this change the following IGT subtests pass:
kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
kms_colorop --run plane-XR30-XR30-bt2020_oetf

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - Move amdgpu_dm_supported_*_tfs check to Patch 32 (Melissa Wen)

v9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end

v8: 
 - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
   to "drm/amd/display: Enable support for PQ 125 EOTF and Inverse" (Leo Li)

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 3 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index eb9b1b0d1025..de195b94ac4d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -678,6 +678,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	default:
 		return TRANSFER_FUNCTION_LINEAR;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f79b52ef7d5d..d7162fab0884 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -33,15 +33,18 @@
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

