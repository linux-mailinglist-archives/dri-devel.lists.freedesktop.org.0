Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B3ADC091
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041CE10EA98;
	Tue, 17 Jun 2025 04:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zAbaOH9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7024810EA93;
 Tue, 17 Jun 2025 04:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbYbxZjX0ZaSDBBJXOSWeIxogJ56AHj/eDEbvZPNzbC5X/dPaZlggsimkvmlY0u7Zi2QPhPlj1WdSmA8vqQr59N66yFvwMA4onaIrr/QL1+Zc34b7jwGN3CoYnoYg516XEvZgddqWGz5eZOQRy4ObkKb9nCUaeziAiqkY3sN7P9JeHYG3TQf/VT6gBvCdGgh04fy4yJFm252RN313ZORNpioKTleqTHqXofjtftg5aZrxo9A/dmD2i0mBiWWCok+YfthaFhPaAcloclb7BVUyJ2SJ6Lg3Iu0VdK3zubA8y8tP068mE+A0di174HNhLqTE3v1Mhcmb2tH0MCM1G3A+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REQoHTBG9kFxxqzGLCB42OG4/iuzYhx5Cw0jR+WLc1E=;
 b=sjQwCPrtRvMH/zRh14ojUvVfv9/zaqnFoRfEs4i0EIm5gUBCvspyxUF7wCb7xWWVdCb4Xq+8UD98MYNHbT9z92Ov5RcnCyDFqYSiCRbQ5Tre4J3NDCBIop9/5LgcS4S5VAvjL7dKkxuJazowBrVFXbJLrH7wlK8y+XEh+lVCLfZFMrtfzch1ouvYo4CKmu9T4cnH0hBMNpiaJvC+zhzaIM42ql0huah2JAJ0dUQ2fNmVl7lMmhL4VGzyB+HUgIe8fRP0pYh8EVxPUkzFs7azXoVMZA0ttWwcnW61ANpDRJjsBHXHxsGm+LDhVNS2Bbks/j7GfxusTbsvHHVpd75GaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REQoHTBG9kFxxqzGLCB42OG4/iuzYhx5Cw0jR+WLc1E=;
 b=zAbaOH9D1QFwAJZriK6V5KffCXpuznZBQLx1jGhOZwZ5dcPf+TupTZb/Fl0AwgVIBdRcUaAu5sSrnZmcqyjqyFkDpswVkebapO36hwalpNDdAm96s2hB7a7AcShzl4eULS2/VdUKsQ02mBzXd4Cu9By2Se8zghDaObP9BsWkly0=
Received: from DM6PR07CA0069.namprd07.prod.outlook.com (2603:10b6:5:74::46) by
 SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Tue, 17 Jun 2025 04:28:28 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:74:cafe::a0) by DM6PR07CA0069.outlook.office365.com
 (2603:10b6:5:74::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:28:28 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:28:24 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 43/46] drm/amd/display: add 3D LUT colorop
Date: Mon, 16 Jun 2025 22:17:25 -0600
Message-ID: <20250617041746.2884343-44-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA3PR12MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d315403-710e-4a7d-2315-08ddad5768a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wjok6SnhsUf+nCqf/B8k2tRrYNpagnLFA6UDZHaSMJqvlkGD+QWFwJ5ZD6uM?=
 =?us-ascii?Q?B0aAClSOX0Wtf7xSRBJtqdkEZ/kXzMP837zwZ45Z7BGTH7AUuKaISZDQykF4?=
 =?us-ascii?Q?BQNX+47gtsygwMfZpbULYp8dgZrxRuOOrhxIm6tLVYDSMa9am8NMHYAS4uPW?=
 =?us-ascii?Q?5ZMWLglp7eJat4z3sr+SeT1vZBfvBhnzUXUwACacQqagEGWa9Ot4kRZHVngs?=
 =?us-ascii?Q?g0d1n2l+obYlxZjKuYMvF8ytAbanyCOgApMHovWzkaopnkQzNV07k+0OKcln?=
 =?us-ascii?Q?qg6lBMF54oQj/QZYtOMs9FFV9KkaQL6atTrQ6k0XX7v0BGqmFH5geJbUFjbG?=
 =?us-ascii?Q?E8Yq2Iz/Ck1kI6U5xmRGOHQHHwQTLZorDzLmywF/J3tcS94rodB+brkH4x7N?=
 =?us-ascii?Q?3uwo3OVhy+exw92aKDlQarW5ekekA4GYQuXX43B1DWw7o16ZnuwGZEYHetZi?=
 =?us-ascii?Q?mTXNKznr5+qFq2Mc4uiF1kU8tVVnzYg5+L3pyxio0hTgLWTC7wyylPULZvSJ?=
 =?us-ascii?Q?iZ2fF+w050NJqhSbn+QRu79xeNOWS6ZzwWOvw/j3Nzkv1WhDtS/77iczX3bd?=
 =?us-ascii?Q?6z4NJrxlAs39zA/paXuTpDCJHODjywQ0WaTCqBTFgC5xIq8V/9IIONrY54TT?=
 =?us-ascii?Q?rjtgXO/cTg/axqpd354tyZAPndLQb2yvCwQZDmvk2xDvY5kNM1HgrhBAutpb?=
 =?us-ascii?Q?dai6Tv9llA456LVz2kbs7uixYHfaBBnd9oizeiVBthN0aFMZY7kZVtrd5Hya?=
 =?us-ascii?Q?aYxbT5Hx24kzY23Zht2sJwaGx2LahpmtWRPHhTadLrggf0sau/uY/DjgHz/5?=
 =?us-ascii?Q?7MCTnrcdb/g6J9/q8T6ZFLQgnflmcEFSICEMJcyB8VfQzKL9yrrxEd/lMHfQ?=
 =?us-ascii?Q?Qb48GttxgT/wrJQgaR+vZhUV7biclCk8aRB6QuYVXg/dshPeVTAtEG/z0U7R?=
 =?us-ascii?Q?KykQZIQz43rQlTfUbVe1Z6AN+4A3/MkJ/hbVlSImIFb4kLNHgjal0bvmG0lI?=
 =?us-ascii?Q?CAwxapaHQ8BiD9XJ4+Q+bf1Xg+z5Wykn99jhYBBABB8+/GqwE0oNZ1R9U6Cl?=
 =?us-ascii?Q?KyLFw4S43Sf2MXRExT/VKlETczG03viVYrMxbI9wxGyINrsI9s6I+R6y14fE?=
 =?us-ascii?Q?lpktLhA3/cYYAsOikAqk0TUiPGjJ+Ztliiu6iAUfFqIoYcRx3RlBExHkBGMQ?=
 =?us-ascii?Q?DyjZ6jGoh0qXqGcsu6r2zDxDp2e4iE4XtbIsopyiupHrFoBGbFyxQ6wnSXp/?=
 =?us-ascii?Q?nQkm72jGbdHnh/O6+Kf4ILPjJeKvg8ItRhvyIozpgC58TdDOvpsKYCAPFFzc?=
 =?us-ascii?Q?3sadl0u/5mpbZzFwZSa7lvxnQZaH0NeR+z6Lk3+kU8ncY8n0+0NqpFYM3iqs?=
 =?us-ascii?Q?ttrEm7qdASSIreB7wSH6KchaIOdJF0I3MICSOl591ECrXypCzsEcKObt/QQu?=
 =?us-ascii?Q?51vp9Cxvc7HGfG/x+FpzzLuG/KCSzeuIRJnr5VwT1ja9Z873XUZgSuDy7agw?=
 =?us-ascii?Q?hZQhqKbXSraeNwl4a39FePw2SWCysPBmfMAx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:28:28.5379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d315403-710e-4a7d-2315-08ddad5768a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7923
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
V10:
 - Support 32BIT RGB in 3D LUT with drm_color_lut_32 (Harry Wentland)
 - Remove redundant DRM_ERROR(...)

V9:
 - Return a value in __set_dm_plane_colorop_3dlut

v8:
 - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
 - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)

v7:
 - Simplify 3D LUT according to drm_colorop changes (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 147 ++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  19 +++
 2 files changed, 166 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 47414f9c5757..a2e76df039d6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -873,6 +873,59 @@ static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
 	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
 }
 
+static void __to_dc_lut3d_32_color(struct dc_rgb *rgb,
+				   const struct drm_color_lut_32 lut,
+				   int bit_precision)
+{
+	rgb->red = drm_color_lut_extract(lut.red, bit_precision);
+	rgb->green = drm_color_lut_extract(lut.green, bit_precision);
+	rgb->blue  = drm_color_lut_extract(lut.blue, bit_precision);
+}
+
+static void __drm_3dlut_32_to_dc_3dlut(const struct drm_color_lut_32 *lut,
+				       uint32_t lut3d_size,
+				       struct tetrahedral_params *params,
+				       bool use_tetrahedral_9,
+				       int bit_depth)
+{
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int lut_i, i;
+
+
+	if (use_tetrahedral_9) {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+	} else {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+	}
+
+	for (lut_i = 0, i = 0; i < lut3d_size - 4; lut_i++, i += 4) {
+		/*
+		 * We should consider the 3D LUT RGB values are distributed
+		 * along four arrays lut0-3 where the first sizes 1229 and the
+		 * other 1228. The bit depth supported for 3dlut channel is
+		 * 12-bit, but DC also supports 10-bit.
+		 *
+		 * TODO: improve color pipeline API to enable the userspace set
+		 * bit depth and 3D LUT size/stride, as specified by VA-API.
+		 */
+		__to_dc_lut3d_32_color(&lut0[lut_i], lut[i], bit_depth);
+		__to_dc_lut3d_32_color(&lut1[lut_i], lut[i + 1], bit_depth);
+		__to_dc_lut3d_32_color(&lut2[lut_i], lut[i + 2], bit_depth);
+		__to_dc_lut3d_32_color(&lut3[lut_i], lut[i + 3], bit_depth);
+	}
+	/* lut0 has 1229 points (lut_size/4 + 1) */
+	__to_dc_lut3d_32_color(&lut0[lut_i], lut[i], bit_depth);
+}
+
 /* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
  * @drm_lut3d: user 3D LUT
  * @drm_lut3d_size: size of 3D LUT
@@ -1426,6 +1479,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut_32 *shaper_lut;
 	struct drm_device *dev = colorop->dev;
+	bool enabled = false;
 	uint32_t shaper_size;
 	int i = 0, ret = 0;
 
@@ -1447,6 +1501,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
+		enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1478,12 +1533,93 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
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
+static void __set_colorop_3dlut(const struct drm_color_lut_32 *drm_lut3d,
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
+	__drm_3dlut_32_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				   lut->lut_3d.use_tetrahedral_9, 12);
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
+	const struct drm_color_lut_32 *lut3d;
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
+		lut3d = __extract_blob_lut_32(colorop_state->data, &lut3d_size);
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
+			ret = __set_output_tf_32(tf, NULL, 0, false);
+		}
+	}
+
+	return ret;
+}
+
 static int
 __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 			     struct dc_plane_state *dc_plane_state,
@@ -1655,6 +1791,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 868d6bd0a5db..680b4e783959 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
+#define LUT3D_SIZE		17
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
@@ -140,6 +142,23 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3D LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
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

