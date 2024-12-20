Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F699F8B9E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AED110EEF4;
	Fri, 20 Dec 2024 04:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aSzD86hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1950E10EEF4;
 Fri, 20 Dec 2024 04:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eztmj17t8vjvevXfWDwnGDjzSFW0kUAsDdoTaHBoAvFoo984JG8r+0A2hsmkOlRyQ7NVazLMNdPVpnPvUhBRJwO2eyJqOodRKaoxVS41/++vDayNOolSnmCtyTXYYcmJlkGA3GIpoLBo84rIku5PYvvOiM5/EokTtKqK3J/hSNebp/XdYatTx9GvS/oAWCgb2RxY6jW9QWKcWVXQ3bfW7yz5dZ6BJ6NnoeMWkl5OByAx9FBwBUnQyz5UHg/FcyBEdEurfSmvTR2n3sxCXnHGewkvi+NRV6pGcEZ7TQLUKo8W18cXUtyqPUerzCRimhU7J7Uu6vtVwrrpZMUR1DT7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2+wq5uoFahVI/7bw4jbBuJshqT/F8eERGTUQQjqdjU=;
 b=Z3G2RZM1H8SVlG48fo0Prq+yv+bLdpBGwywE/hjvgoOqHaDFMgEG/SRlPKic4z4uCvtD99QGbNDn50P0aMvvACBbt/6I0pZ5rEen8vPWlz0APGOkVaJSpEZ+JzrVSVSJCk2bDieG8Ci2OcbJDz+Ib5mgqSWmsFjUYb7XOq0vssFYLjAUxS1TN8k1e4S0k1uxbow9w4iQYm6ReaAY00n7z0zq3mSqczNFav2zfDNbw/ljSeTKVxuSd7AxucX0wwTVfQtHEcvzDmSjbo4AzSK9SIKlKcFpXJv/8iv6uUjmwfBeoucRWd3wmL9A2SEg+jVZgFCLoNfjjjqjWVeVDcjUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2+wq5uoFahVI/7bw4jbBuJshqT/F8eERGTUQQjqdjU=;
 b=aSzD86hrpvi7Av/rTZfzA1InblbFe4jJPmLBbtRwPqKOXENY4EUyftaiKwBY9x/rUrcAkjBvd7Z47ztEkxBQJOezJDw1sR8jIi5XQ631taNTBCP6RfB+NI45UivJU12sK5Z7UMNHs3NtzmUuT2RQ00p94gwb91z6EHkCpxyzbT4=
Received: from BYAPR04CA0033.namprd04.prod.outlook.com (2603:10b6:a03:40::46)
 by IA1PR12MB8189.namprd12.prod.outlook.com (2603:10b6:208:3f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:46:59 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::11) by BYAPR04CA0033.outlook.office365.com
 (2603:10b6:a03:40::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Fri,
 20 Dec 2024 04:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:46:58 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:46:56 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 42/45] drm/amd/display: add 3D LUT colorop
Date: Thu, 19 Dec 2024 21:33:48 -0700
Message-ID: <20241220043410.416867-43-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|IA1PR12MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 869e4fcc-8bc2-48a7-11fd-08dd20b15635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oErCwYvvdikfypZ073U4Z+6jMFwz4Y3lenZLyGiBdR9g3ikGCPFXVwAI5XIc?=
 =?us-ascii?Q?GeSP8oRt/S8KIPQVwI0xGUC+uyykc33Xx6QnIkUGrFsU28aUJB5cIKowxnWO?=
 =?us-ascii?Q?y3jK4weY3ot3neJnJgjAhRbsxdN5soKkaKnjCglQcazQebUBFB68fF6MKyYh?=
 =?us-ascii?Q?UId6A8wGgcy7JKsrYujr1Vhjk0jodalsnTEk/PhSH4DnAitijWemB+jH66EK?=
 =?us-ascii?Q?PsRctMANGGAq1fynCcrTbTB49/EBwd29E6QXw7d5CRIS15bXRmu9N1g6YgfV?=
 =?us-ascii?Q?vFKhLu+FB/lwzKCnFuQP8nkV45PWr8eILQf/crkDxkkMtCLNsTkKLLxo2/7j?=
 =?us-ascii?Q?0G+3oZY3tHQH51LBuXjknpe0p6aQWlFWE0sjQfUry9jBXJWtCnb+njMVjxKb?=
 =?us-ascii?Q?oAERj5/kjwEW+4DmDDIXB43HCMGD/kvDBcL0m+LwN/md9xuSbiSAwVg553aa?=
 =?us-ascii?Q?nQbzuWwSs39W0/b34hdTd9bXmPxZ1kpssZoZI1Lr0yLVOu2VMctNJC1+4jA2?=
 =?us-ascii?Q?t9LG7YXB3mNvSvZPcq3juvZpAZumzz/5IyLEry7a/SNMw1HHfxBhgF6D6Ddk?=
 =?us-ascii?Q?//jTNFll71cfcuiRB+Vro+RbA7K5Kb4K//J2iJ9kRs4wYeRcT6amyruVGiL7?=
 =?us-ascii?Q?emZdvNUaeMIDUbK2MlO3/vbPrvwLRGgSD7ImY7uwNm4bd48f0T3jntvaGysr?=
 =?us-ascii?Q?MhMVIJ87SaDWVwiCjIl9FKCxhxxxetvEtsv8Q2Sd3ny/wnkG78g9l1fUENj2?=
 =?us-ascii?Q?hpHRTA0uV/7utrzrqD9iCT0jOvowaMKLI8ddxqN8UQbD2viVq1E0nmlgSp6a?=
 =?us-ascii?Q?PQBu0NlTkVCcdqbnokO8OfIl/l3I8PryPWAtwgJc+xK1IMMhQvb7Nlshn5rS?=
 =?us-ascii?Q?9COkdIVCy+Rz7Zf9slS4ZGJcNTv/qeXLf5PQPE2AsmIS1JWyUcP4+2vio5HH?=
 =?us-ascii?Q?JBtua59pL8fPOx9aq4GtCCnBR0Mzscdpj5ETWuh/vFTZAfCNhzZxKQ3G6KT9?=
 =?us-ascii?Q?KoYrW2zA4MdZ/LsHB/WSIEZLzV6ljzEEmsTSfWm0kPaGCix0nz+/uWD9NWHt?=
 =?us-ascii?Q?aB8T4MgMqxC1ODX65S7YOwWNTRHyyApnOIgn8pU5qBQ3ntPjtJBRkvtF9pPo?=
 =?us-ascii?Q?b4aRoqw0sG5ROa8jNL3GVZ3VjItiZ8B+uTIQi2UsxGk+qBVvhEDgNjUYIfTn?=
 =?us-ascii?Q?9Os7HpWTvovn2GJkh3NKHsRmwgrCQYsTd2sqcQXEOYpvQN5aaaMVikyM8nEP?=
 =?us-ascii?Q?QDmujnBiBfzGjfzv2830uxE23tpK8sX3fGDL1CWOYJIbmJXiCJVdOLvMTMi5?=
 =?us-ascii?Q?OlyS3hR89YHBmInypYS8gF5g/9nLfNJwQAE52Q/+SZUqB1X9+Wl2x4Lz5zoQ?=
 =?us-ascii?Q?iEhxshBgvERcdOvf1QpkSuhodTyH38VPx/2VdYUbH+Dw86jJxAVbCZkIl97G?=
 =?us-ascii?Q?BfK+YENjKc5Mt4P7bwLYqLAAiSSnO/aattlD8p6gOw8ZI8PGvYs/FOdrdBM6?=
 =?us-ascii?Q?TB+UOzUL3kohJ+Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:46:58.2534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869e4fcc-8bc2-48a7-11fd-08dd20b15635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8189
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

This adds support for a 3D LUT.

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. Multiplier
3. 3x4 CTM
4. 1D curve colorop
5. 1D LUT
6. 3D LUT
7. 1D curve colorop
8. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v7:
 - Simplify 3D LUT according to drm_colorop changes (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 100 +++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  19 ++++
 2 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 54ec12c1352f..5e8c5c0657c4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1282,7 +1282,8 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
-			      struct drm_colorop *colorop)
+			      struct drm_colorop *colorop,
+			      bool *enabled)
 {
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
@@ -1310,6 +1311,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 		__set_output_tf(tf, 0, 0, false);
+		*enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1337,8 +1339,88 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		shaper_size = shaper_lut != NULL ? shaper_size : 0;
 
 		/* Custom LUT size must be the same as supported size */
-		if (shaper_size == colorop->lut_size)
+		if (shaper_size == colorop->lut_size) {
 			__set_output_tf(tf, shaper_lut, shaper_size, false);
+			*enabled = true;
+		}
+	}
+
+	return 0;
+}
+
+/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
+ * @drm_lut3d: user 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
+ * on DCN accordingly.
+ */
+static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
+				uint32_t drm_lut3d_size,
+				struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size)
+		return;
+
+	lut->state.bits.initialized = 0;
+
+	/* Only supports 17x17x17 3D LUT (12-bit) now */
+	lut->lut_3d.use_12bits = true;
+	lut->lut_3d.use_tetrahedral_9 = false;
+
+	lut->state.bits.initialized = 1;
+	__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				lut->lut_3d.use_tetrahedral_9, 12);
+
+}
+
+static int
+__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop,
+			     bool shaper_enabled)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_color_lut *lut3d;
+	uint32_t lut3d_size;
+	int i = 0;
+
+	/* 3D LUT */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
+		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+			drm_dbg(dev, "3D LUT is not supported by hardware\n");
+			return 0;
+		}
+
+		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
+		lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
+
+		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
+		 * with TRANSFER_FUNCTION_LINEAR
+		 */
+		if (!shaper_enabled) {
+			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+			tf->tf = TRANSFER_FUNCTION_LINEAR;
+			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+			__set_output_tf(tf, NULL, 0, false);
+		}
 	}
 
 	return 0;
@@ -1467,6 +1549,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
 	struct drm_device *dev = plane_state->plane->dev;
+	bool shaper_enabled = false;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1506,7 +1589,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop, &shaper_enabled);
 	if (ret)
 		return ret;
 
@@ -1515,6 +1598,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (!colorop)
 		return -EINVAL;
 
+	/* 3D LUT */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3D LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop, shaper_enabled);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index ec94ff887886..e03e6044f937 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
+#define LUT3D_SIZE		17
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
@@ -145,6 +147,23 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3D LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, true);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

