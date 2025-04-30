Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4CDAA407E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5F10E6A7;
	Wed, 30 Apr 2025 01:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QIJ48TII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413D910E6A6;
 Wed, 30 Apr 2025 01:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfLSs4W9Zymz6HbtZSSKcFdqS6SStl0w5t9XGwkMliDGq5X3ZgOZufyTcKEnPpUqC9eIGAG4Xy4tldTB0Wqf6akjzF+4XzuEnaH71NWC/jaHH8SVZhP/SWLBVpvNNq1d0RHskgCazDr2QTDTb0Ysjr1ZZOhcwFICKzVtBZGLIC9spZWJSpIxxg2fWs7pkAGha4i5uB+jRHxy1pyK8NNPT0nLIax41qVBZhRxgcyY69pjO/mz8FY9k6lMp4TBvKWK9Z+WAy/N0f8W0o8iLl6LWfxcjZz6dwybwyNfhOKEd6GYIcmvRCqEMBJLdSnEePq2QAv3SKq2JLOK3PDyDHfqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1DI//jtVYzOp7NtMpP9nx/xXN95zTNNDlk2CFmt5jU=;
 b=XJKtEINXicIdv3KWs6WbYFmGXrHB8fIXDIOjPRyNgEc4+w5/MCa4f+yemfKG27kHzescvtFtmoEH8GaF5B5+Sj2TPHwepY4dntXWbNKODk4R0HxgFDgsemaOawUB9iVj7YPk0MrD0Ttlhtb/GUbzhwaV5fjg2PUpLAJMzppUdFUkJG9YUwveOdBIFr09zkpqbLrvHH0DXPZB2C6Fpi6On6uQv1Wd1EB/PmKVDor+HiEqPRS6J3Ejt/K1WJO09YOGh0FXPJTHCHS1HuLiASiKf/l0IY7JTL7h3aBHXCqIMLy1N+0XmyyxxkTqwfYgDjk9w/of5FocguFmFlzvS2ChiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1DI//jtVYzOp7NtMpP9nx/xXN95zTNNDlk2CFmt5jU=;
 b=QIJ48TIIX0af9pHlja4EyCfHzasM3Im1fBWfH9ykC0fkSP7Q+LR18Sh/mOxZ1G0FzYnVIQMa+Zu/YHHLljfNUJoxso1sc5DGQa/LZhKVaQag1doPmO1zwEZ17bWnwdo03Nmm+a+zrUu6O9wt2NRU7pjB9RpLYPBcs7P+heJjNpQ=
Received: from BN9PR03CA0504.namprd03.prod.outlook.com (2603:10b6:408:130::29)
 by LV2PR12MB5799.namprd12.prod.outlook.com (2603:10b6:408:179::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:22:10 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::94) by BN9PR03CA0504.outlook.office365.com
 (2603:10b6:408:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 01:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:22:09 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:22:06 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 42/43] drm/amd/display: add 3D LUT colorop
Date: Tue, 29 Apr 2025 19:11:12 -0600
Message-ID: <20250430011115.223996-43-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|LV2PR12MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 501bbf9f-4789-4622-2038-08dd87856ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dvqH0oY//BvimKzOgOHBUDCPrK8yL+IH+D6r4Q9+3q+O+7t4euLIBup7c+oN?=
 =?us-ascii?Q?PYR2H+JKDy9KePiu0RDLTpdTW3zWGGP6ci+uyLi6pFPw6o7CXp301AiAnJT+?=
 =?us-ascii?Q?8a8HV7NcMnmmwwHXIFlA7Op35NTu6womW1xbA+An6VHcEsc3nPqN28gjweSU?=
 =?us-ascii?Q?1K+c83O2Zg6KUcJbng7MhbL41NWspjRa5MWgFiOF3OCwT13wwggB/deZfrJP?=
 =?us-ascii?Q?zxy1uR9UiJQwY4U0oGCd2VkgFee1NfWecSZ2DEx3d0UeLF02ZgSS2Yg5tA3C?=
 =?us-ascii?Q?LyCt0ugKx4tbJJbkB0whZ7MIOCXqyhMUXVkwTEzFpF5lIkFNfrGpXVmcOrZJ?=
 =?us-ascii?Q?jlhJru8j5KSAmr58yhjF9wdL9SN85zYuunNTxa9FQQvFFPlNDVAYurMZI9AH?=
 =?us-ascii?Q?JRjk5NeXn6QlZc70V2bYX6ANhCu1W7FDNGGgKL5EWd2m3LBWdnIOdd0iwWdi?=
 =?us-ascii?Q?cn9wY8dMUIIHPJXPRizldZWihCXNBwv8K3ZGQL2jjhBCWUY/Y6+1XxpubNCp?=
 =?us-ascii?Q?xXQMRN/gtM3k/nPvtlNT2NxDTPBdn6clKuUzdRF/Y/mdn5gO1vjoVYN3Zmgs?=
 =?us-ascii?Q?vRGIGSD8WqcLga81x0UB4k28RcbeTjzj8hmGS6cEhcm2sd9A3dNHAnNU7Xbv?=
 =?us-ascii?Q?wsJCnoFomMbp5d3smu1GtEXV0NpAz1kVjS3FWgqdJgvEYNUJatCkCHVMaBWZ?=
 =?us-ascii?Q?RhVWL+RCkVhQZYbqDs3pD/qfS9SOi5sVR/0z4l8aZ8JjtvmUFDmzd6+xl19E?=
 =?us-ascii?Q?tLqrmk0aW4T0OVM8s59h3nBtABGzQdiMrJ/yLC490g8oGMxi5RrL34TLiAG6?=
 =?us-ascii?Q?eBP+HCFryIFAfAZoEzNG5i6K670xaik96iIQBCN7kUrbNmsxP6C1HFFONFyv?=
 =?us-ascii?Q?MVGoszxRS1vWd2iHh3ZqVwzikL1QOPxtpBV6dLTuu85FEfQybxG2E/OjMy9g?=
 =?us-ascii?Q?qEPdA+oKluPpZRIDoIzcdaQCAQyuEVFIesl26Xj9GghGQgoXESiwm66ADKIp?=
 =?us-ascii?Q?UBjR4JW+HgE1ndtdaIu+tfXP7QamUxP3RyY8aTOAtIlS8FTB6WhFBvo+su93?=
 =?us-ascii?Q?w4Ug8a/KJ2hV9Dw5L+XPbXTR5yFBo95kqRFEN4CFYvbMMvJ7AFbSA9yMjQ6W?=
 =?us-ascii?Q?16MfTw6WIaebMykEsrZaXnLC6rQPlAmleL3PNcAb7atoswFPN+9vg2TFt4lb?=
 =?us-ascii?Q?nI0Ca1mvW2fRLrrEqoPeLUuwhXyTPJqX/P41rGBZJbK4GUvCIOrL7bQnay53?=
 =?us-ascii?Q?gWu+9YPrPEMt768LTEVomnfcxNe+LXoKyLtWzJqO3YO5PjUXcMiRbJxG1g+j?=
 =?us-ascii?Q?6Xl1oa6TTZQXoBcgeJyjwQSv8u/wcNL7OHSebx+EmJfs098YzLtIyOAsHW/P?=
 =?us-ascii?Q?ZanZjpPoki8EIlRerdxbDp8jO3uETXlfNvFvaPV8kGUGAP3ZkAjiuNUztFpr?=
 =?us-ascii?Q?h2lRv6LZmPHBx65q5J9VGrf/HW1EUx0WeGsjtyITmec1LyDTsK1oFy7XDsg8?=
 =?us-ascii?Q?fQKt+2WYwTuC+/o6tpK6v09eornwE2lF6rHy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:22:09.9752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501bbf9f-4789-4622-2038-08dd87856ddc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5799
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Return a value in __set_dm_plane_colorop_3dlut

v8:
 - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
 - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)

v7:
 - Simplify 3D LUT according to drm_colorop changes (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 94 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 20 ++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 313716f2003f..dfdd3f557570 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1293,6 +1293,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut *shaper_lut;
 	struct drm_device *dev = colorop->dev;
+	bool enabled = false;
 	uint32_t shaper_size;
 	int i = 0, ret = 0;
 
@@ -1314,6 +1315,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
+		enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1345,12 +1347,93 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			ret = __set_output_tf(tf, shaper_lut, shaper_size, false);
 			if (ret)
 				return ret;
+			enabled = true;
 		}
 	}
 
+	if (!enabled)
+		tf->type = TF_TYPE_BYPASS;
+
 	return 0;
 }
 
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
+	if (!drm_lut3d_size) {
+		lut->state.bits.initialized = 0;
+		return;
+	}
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
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_color_lut *lut3d;
+	uint32_t lut3d_size;
+	int i = 0, ret = 0;
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
+			return -EINVAL;
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
+		if (tf->type == TF_TYPE_BYPASS) {
+			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+			tf->tf = TRANSFER_FUNCTION_LINEAR;
+			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+			ret = __set_output_tf(tf, NULL, 0, false);
+		}
+	}
+
+	return ret;
+}
+
 static int
 __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 			     struct dc_plane_state *dc_plane_state,
@@ -1522,6 +1605,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (!colorop)
 		return -EINVAL;
 
+	/* 3D LUT */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3D LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 10b3e3906461..e90774294971 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
+#define LUT3D_SIZE		17
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
@@ -145,6 +147,24 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3D LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
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

