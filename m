Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE8C5FB32
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9071A10EB39;
	Sat, 15 Nov 2025 00:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gdjQ6OwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010002.outbound.protection.outlook.com [52.101.46.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2115410EB83;
 Sat, 15 Nov 2025 00:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX2QqfjkUfr3b9SFcee7/XBNZRByTizkdEW/ef3sU+OI+GGBKxZbgqH0wsRCrhXDYw2SAM5mgvutFL0q9JBt2mlXCG3iuobS87fGXBasxTpIRW5aGh8Y1iKtG0SxIH/VQux9soOA/ev+D3/4k2n8VT3StSTCfIjz4bSl98sJSKvhSHfX9YHTdjQribRImgSIKIc5yEaqVKhBTJrtQPib4QnfKSI4XptDwZAgr6LUHZd9Kn2fuQWxYlWvQPs+UlKpXSkCSvBsYR8Xm8fEwtxbASRkYJgKuqxDjtW7ppNE3QUJPPpqLiMkEAueKnB7zszFeoYy9Fyydjh+I+G1GdDDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SHcHL3tw4kfjdEZSfeitg/FLss8c/qBfc+FoOa5hyY=;
 b=RDH5wW2cvOYybPnWLa1Nos6j3Mh7aKiuB3vsSziEsOIHpZrJX6oeQats6albQ1SkHpPBE0lEKoQjx6lNM55LsyJRliGVqAd583FjzBHho8mJkwul0BOaNnTQqE99iJxwLAbjao75UYGg96f1hPzwhSWRbOhlGw3k2mQ1myp+ajEc1y5D14yii6k46N6ghY1veKIWGOIz2IyE/bW6MJY/bLear77dyjnvLadWpbxtjFGmbHKxGDoqMELj0XQO74W9oPnQ4hp3jGariF5YhezztAPHE5TgWPzXG3GBw/oS/uhektUBNTZAkW0jXLOKv5raXRCVjOL0wqGarRYDq179IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SHcHL3tw4kfjdEZSfeitg/FLss8c/qBfc+FoOa5hyY=;
 b=gdjQ6OwGUGcC7cysP0umjTDaTfNPe03Cl8Mckchg/eOdLiwkw78OSABDbZW9XN0q01vWSx/3Sxe/VJcNtg4Km5YasevU6lVazZfR8CUsASoMGUsEzn6IfUGDcs6lE6CdL4ozIJgO8Rrc/ZZbQUCxQf0t4naP9U54W5/2ZuufqNE=
Received: from PH8PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:2cd::16)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:11:54 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::8a) by PH8PR07CA0008.outlook.office365.com
 (2603:10b6:510:2cd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:11:54 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:11:50 -0800
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
Subject: [PATCH V13 34/51] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Fri, 14 Nov 2025 17:01:59 -0700
Message-ID: <20251115000237.3561250-35-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b29dfb-15a3-432e-dadf-08de23db955c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pXTmO++OZ7Ak3t9GYdtfSgXLuV/XtIGRrLWAVHaoke2HL9D4IQaJAbgTI40p?=
 =?us-ascii?Q?5jfnuHQXxSrP7wWmg3alcSOCZapo1QRpG7buYSpLGoWyD2DVJt5K3Y4mVvwK?=
 =?us-ascii?Q?17ct8RGKfnzHWeNvT4oqeh/3UvNRndcGM5mUlMiri8+8giyTzih7XIxoX/gQ?=
 =?us-ascii?Q?OMt4XmSCXV5Hnc0pFVc2eA8Im2tmiTK0OA9rMjFUrjcLoAjSLvi9ISxhTi20?=
 =?us-ascii?Q?p44/JrYd7+gZGe3jnSZBhkOCaFoPhZiC7VQCN11RcOSilQP4y7NVWl5Ltbx4?=
 =?us-ascii?Q?622ufUiFnIRm0OEQrt3hOh1qkWgxGMEiwKvSiHY+2cBo+K3UghxNxnz6gPz7?=
 =?us-ascii?Q?/JHpwZPO0BYfml+c31t57mWHC9Ql3JDX/PdUMaqnqWdclo2CUQdg7oHHfvH+?=
 =?us-ascii?Q?sUD0YjgUOQVRuAIGDdhhB5ah9u8m5UzL6o1GqrIds0KWPQn5fTpO1pPTGkfK?=
 =?us-ascii?Q?QHWJ8U7AUgwncV99vBcqgUVUo2lKVANhAhLEutIXTK8XHYdG2HFrlF+KZo0A?=
 =?us-ascii?Q?dSn3DOhtqBBZN/4WwFH6FewEB2fOSnH+wbR75mKZyac7hCklX9YF6h3/dQwN?=
 =?us-ascii?Q?ffGLRQfMGVVCxZN0jlMP854fRKQBIuQky1Zo7Y3ac9lJhx70/Zj/sdUUaek2?=
 =?us-ascii?Q?T+y8Yg+3MVVyfc9zTe7XcabAvrvIUCMXc2j2GpvNRWuZ9uSQYtSe8hTZ+4LL?=
 =?us-ascii?Q?qAhjxpveU/p08iG55u1q8zIBIVGeuLsCwA8ofouYxU6CNzZv8QbWPhi5knvt?=
 =?us-ascii?Q?8kt9u60EBuVU+xlj6L5d2MsG3Ox/ST7R3z1qdtdo5kwpRaUO9K1NLPllzRn4?=
 =?us-ascii?Q?uWKsxXA3VXouewG2BUFoDqFZC4FZNbD8Ke1/ERve+ovBc8KDS/Ar3Is9Ojah?=
 =?us-ascii?Q?rQDATXcjRpMY5X5XqMehrS95xKrfQKKxBQ8w4108WY82EFmux4LcakHJTG15?=
 =?us-ascii?Q?2cW7kiGRlAVNPAJ4sNfKK55ov1iEj7o2TocGFr5ZU5H0rHQvI32wQatvCxT9?=
 =?us-ascii?Q?bKoyv9beAn91YdC18pnkhd3CGCDIZrEZfEtX9aqR7EtzzS/qpOL5N+Sw+orN?=
 =?us-ascii?Q?ed9/+qfb4kg+zHFVfBzWEpn55WArzzs/OplZsPEnwhPPtaMRyAl6t9fwcolt?=
 =?us-ascii?Q?JZDoI01k58lpB2CVlJGQECzQiAc5Daj1s9v2TsQHSXWJYeoF7ZxxXe7eMlCU?=
 =?us-ascii?Q?I6f4tHPIHnUfMnZsCIt4yw12x724L1BlD8YCnsjALeuPYCmpnhLq2C++swaw?=
 =?us-ascii?Q?gDsVUyRbhD+g1DF0Nri270i7S15ReIbcK05peWXHXXO0G23Jht0eq5FEdSKx?=
 =?us-ascii?Q?cQofhlwtjiQ5E2SzGlaP7FAr5bqgiHm7eu3h46MyJtgzGmvAEf/w9yIcTJzh?=
 =?us-ascii?Q?FR2AGZXLxsmUcA34q+f1hQiTcom/j0n68rCfu3nZPu76UYeRjoNI5xjDRkIV?=
 =?us-ascii?Q?KSy6d8DWC6XbF7Ge4Gn7cMofYNzAmo+I6IjHBvgga9vMtd8eq2vGq6XGNswi?=
 =?us-ascii?Q?CC4Jo2+E8qj5pWApFCT8yotnMEW7tVTF30E6bkDk8G7JfMGDg+o/X++lBsCp?=
 =?us-ascii?Q?0/wOBoOmKVliPgmMW+w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:11:54.3007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b29dfb-15a3-432e-dadf-08de23db955c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
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

