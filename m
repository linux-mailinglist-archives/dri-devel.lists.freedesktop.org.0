Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C69F8B8A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD82610EEC9;
	Fri, 20 Dec 2024 04:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1IGh8ojw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1C10EEC9;
 Fri, 20 Dec 2024 04:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAG8f1glcoQgA5aQgAT83+7pKkSEXaC+Ze/uvmP81UMs4J0vFl3klKbj2vk2R59byAvTkSEYvhpWFENwYi53PAA7mT7jHSwalRkZqGKAhEcKd4p/7MnhS93mAlOQhLJ3vqB4qqV2Uet70/LEhJE8mgDeRC2oggfA92GbvwxkUHO9REAp4y33YaCxa3YndtvumXsfZ4HalSoN7YBgR/By6JoIPHwPDLF1Tfl01+VZP5hrZ1dUZ0wK+YqN4ObzmaD0FI0MIdR0yznsyexPaxuSC5vAmjbZ7JTexj/uMvdzprpK9DIk8aPJcZjjLu64ImjVUU8crtxy1qs6EfFA8pvj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwV1+Xib14JnN4GPQnLpapQ73qKLspSiJKceBBLXqu8=;
 b=b5cDfxjRSpwuY9OOClWo/C0buuNTm1a0PSujCvuk2nIkN/gNJ8CigXUjmYTlj3OX9FtI0bU/kGUIWVByOHjuL21tdv/4oEa1cIkBjOAZp0+sa66ZBLdElI3I5j7UJV8oX+0PH8YLDK7zg/lRuPaV1aeZsQFYlgjo22CDe3+8O6i8lvouw9+R7/P2WmuOD+tL1kYS72cR0crfKPqlfcjLXCads3JTvcVweHLT72rv2S+4RZ9k1g25myJveZptAV6j/a8baUr/TZRp24WgeYgyRqFB7NDa8U3iyf8eA4RTQX9jFG67hVBYb+t7NMWuqFxit1n7VyQMJyecG/8I243QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwV1+Xib14JnN4GPQnLpapQ73qKLspSiJKceBBLXqu8=;
 b=1IGh8ojwykfmDMepIq0j97SWhZVO7opUFicsn+BF5EveKrZb/akxK5n+YPbGSuKcPmz4RwQKxka4jdDHHqDCk/D2ZLa+Wbr8eaVhm8W7+nkCf16iPAnNiTqwJ1c6kZwrql0yLHs71kqE3Rg9H528v7Z/+tM/dwAGx+3MQSDFCfg=
Received: from SN1PR12CA0101.namprd12.prod.outlook.com (2603:10b6:802:21::36)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:44:30 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:802:21:cafe::49) by SN1PR12CA0101.outlook.office365.com
 (2603:10b6:802:21::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:44:29 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:44:28 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 32/45] drm/amd/display: Add support for BT.709 and BT.2020 TFs
Date: Thu, 19 Dec 2024 21:33:38 -0700
Message-ID: <20241220043410.416867-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e63f584-07b5-426c-8690-08dd20b0fdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w8tXUjrwZ3dTBnLvJ6f9bY9e9LUFWwOU4HiMYW1P4jh/v7YClBxHbwZzXbYy?=
 =?us-ascii?Q?w3WDp/b9qkxsuOM5HuAna2xwPKmvyHx6IFkYpAfuEw3TqtS/OFwuJ6fNEzQH?=
 =?us-ascii?Q?lc4u3LLhzVv4IHTLeNyXEuMiLFbU+QBEmRfw2hRtyX8NLahnaU8qyyvvxe+1?=
 =?us-ascii?Q?cAf/Szt7KIhy7+qSxcAUXXp0DMPnS+TwYS/5bL+wfJneGOM0RqJnUPKkFoqU?=
 =?us-ascii?Q?SIL8YaDoqRHW/qt5tXjOiDb4cO0mlY5iuY80ejwwDrzbVKkM71lJnYfKVBvN?=
 =?us-ascii?Q?78aqo66OWV87VqXM9Ef+X1kZRynpEudNB7qWJtR5wKdfIZ/0noKG0IGoK0+g?=
 =?us-ascii?Q?nwxBm6jSUNiFh5yMGBItIiNIPeTwxuybeQyFusITn3p8+5zebeyjUc+4mcKO?=
 =?us-ascii?Q?iogbtUl5OPmDWIMOWLk4EJn3ju/j3ynklFMxpWmtYjpa8tbYYMmAwSoOaWQH?=
 =?us-ascii?Q?a0tyO6bHx7LvdWVP2F4DxhFknchf3J6UgtdsJ2mcTEe5fktm65b74uXE7osw?=
 =?us-ascii?Q?9I+pO/xIjngrl7FAIufxJgghMvp6Mao/Xs4LyWLuj6FhtaVzGonjcLZnl5ka?=
 =?us-ascii?Q?qmzSul4oIi2ahpNSF/gufJj2JUAa58Wiwpzj5PlTNQOM/PxcqsEaYOIvx7aS?=
 =?us-ascii?Q?6rVvKNoFoYphBFJoN3rz/kqX037w3dACS0LI1Lo1WeSx7DdwLYB4wZlxD8RE?=
 =?us-ascii?Q?4HmZwgTJFvTJW+7Im9Uu6ByrODrafwGWX955Q4XoYQzeHszW/oxQl9wRxEmE?=
 =?us-ascii?Q?oOZZtQlmJn7dPlfZr/y08xzdksuViovVXHYUaZR62rX7Euw9qyI87VKTToP7?=
 =?us-ascii?Q?QN9BJVQwdS4p0a3aLwHiQqkZVuzGJNlbOo4v40Dmk0ZBzLlsXfpxrnhF5rFW?=
 =?us-ascii?Q?2QgU2bTGjuX0FUf6bU3m6hZbUST+i1vTQEFDNVnhrIdy9o+IfBSJRzidp4zw?=
 =?us-ascii?Q?dHbb6Ly/T8vetuPSsBlfYXQKj/8XQaze90E4YeBW5A3F3jpCLQoP3OxeFEwS?=
 =?us-ascii?Q?QNpYBXoXkNpkNWV3+emGOOoknoePmJtSEspcBaiUPtxfVT0+Ht7niVN8EvKR?=
 =?us-ascii?Q?NO2FTg9XeXl4wu9XQJrPnhlyUdGPsEOtq+pRPenVSRHzsXleRY6FR35dJtZH?=
 =?us-ascii?Q?nXCbkKMLO4CovDqwRzH0UtLPlPbR6+93+XKJsCG/oMMdIkmX72nz2Y344IyB?=
 =?us-ascii?Q?QGUGvQPFqmecmXjSKRnMtLNqQnYgNL8V3Cmc9sDx3MRoxw9scxZ1qSLAP001?=
 =?us-ascii?Q?vMvbMbeFU7koFViD5gFaihZxLfreHbfu6RGalBNxULIx1lHBM+O7L9l7m+4S?=
 =?us-ascii?Q?IvSmRezltkcgbWZxXVM+t2NvmEmfqbovMAcY+OnQRyVTDfYCPs/8+d9OXuzm?=
 =?us-ascii?Q?DlP3IT4JOtlzIpH0qs5Z70r1VAcN8LAx4yN+MBIZpaJwHPImc4K7AIw+PPWm?=
 =?us-ascii?Q?7TYeb5kJE3xy7hISWhvHwEDYzPr3ok9z0UVMhjEKbx3epGZNmqnm4+G3AbYH?=
 =?us-ascii?Q?bTm62OT4pyqRPvY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:44:29.9741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e63f584-07b5-426c-8690-08dd20b0fdc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
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
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 10 +++++++---
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 63044e0296cb..1765402bc122 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -676,6 +676,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
 	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
 		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
@@ -1284,8 +1287,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
 	const struct drm_color_lut *blend_lut;
 	uint32_t blend_size = 0;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1321,7 +1326,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index a9d94018a207..ff5828a1e8cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -33,14 +33,18 @@
 
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
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.43.0

