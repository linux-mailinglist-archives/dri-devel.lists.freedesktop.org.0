Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7928B9F8B7F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3561810EEBB;
	Fri, 20 Dec 2024 04:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yor35e/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB510EEB9;
 Fri, 20 Dec 2024 04:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJAoO0t01861O9Z3RGACCW7Tz7aK2TQMw2rpofmG+eNsC6mPLPiUHjSYunlg5Hjyfv/WgObnB5nRxhRHiR/k8GJfqT+8tSEYuFSorrcVatKY1aGMJRkp6voYf53P2tMVz1cKUwBdeiBydO5HxAYKxfeawctFzgl/AucyHvSihqPNeFHVzgFP+JUv7yx0fWvXCm7xUlhMYvgt9ynXkoUk6MA5s8oBKTrNeJUksMZNvGSiWBXnVMH+wGBYYh1Bx5jxkV/bEz4DKpxfHKB6JLUeU792iLu++oQvQ50SsYQwwlBV1UApcQW9LuOmbepbs3XPyOO2DZqnDKO+wbo3+/AP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zFpifbsjUw5aIk/Ur4KSpPRxH8c5tAEtG5c53YmYNk=;
 b=cMQnIOgglaxOgF+gn+T6HNrVCP8lnDO1S9MOCe9E9fRcVu7uLfr+58ncosAPZo6vmneFCjafPwAlmu+x2nEcPDmZrO7+0z6frs8R4isaUECXkaYQHEsnHG4MDjUzsJ/9+E5FYB8PXXaW87M1vg1+15fevFmBxFrEbOBcygQBT/ea7L0aI2RN+LvBYRcoDGT8q8rUx+VjUcq/rorqiW06IxIglCIISQ0xP0BBoFA85agWrGweAzlH4krnOrMaldVvtn0kN0LuoT6nu+Kcj5tBMR7SQzM48114+5A2yKyTzd6gaeR/Fe729n36kMbA3b2u8Vn8HbrK/TIOkBvrbjfL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zFpifbsjUw5aIk/Ur4KSpPRxH8c5tAEtG5c53YmYNk=;
 b=yor35e/la/KzTpxN7eEDzZH50XJ9+Q9JLYubOV63WyLKqhPOJ6Az2VheLrrOLQjyUVsot5AehPb9jgUS/Gg7jObwQ4ZY2K3RsNGXyw6V81lxXNwdn0soWYfSkeCJxy3VX7OQE9odqRoLy+NnF37HiXZGKAo9mKbwbJap6bkwDnI=
Received: from SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) by IA1PR12MB8468.namprd12.prod.outlook.com
 (2603:10b6:208:445::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:42:02 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::59) by SN6PR2101CA0024.outlook.office365.com
 (2603:10b6:805:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.8 via Frontend Transport; Fri,
 20 Dec 2024 04:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:42:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:42:00 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 27/45] drm/amd/display: Add support for sRGB Inverse EOTF in
 SHAPER block
Date: Thu, 19 Dec 2024 21:33:33 -0700
Message-ID: <20241220043410.416867-28-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d72118c-9501-4395-28de-08dd20b0a5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?52EUuFUp5ZGD/IJiJHlA6zIywlMAlayOIXwlS7hMT16Jx8tJspygW1We6cPs?=
 =?us-ascii?Q?O5aaaZwtSr4nO+nRy8ZCqLBp1mhtu7wBClLtIHDG7wAtPbINAHVf/egG/zz0?=
 =?us-ascii?Q?dp0vdhWyf/De3wlsOaL6eIKGs7AxraDNPIvVXSQblEEtBueFfnEuKlLWx8Ma?=
 =?us-ascii?Q?sACFukfHCP3evWAJytdv2ZQZ3ubbpRen3W7DINz47UnV0YCgO/zDL8WcE4Mh?=
 =?us-ascii?Q?rABL1CpFQCwhAebhAY1gFPP7nHvWEVHVl7QClpjq1kHNuWt/8DynvyIKi8xN?=
 =?us-ascii?Q?1ISXFTcOHdJTZ2B9w8IwV0BkRsQVxLcoaaR/OKMA9CW1jbolJ3n2LsofjWDr?=
 =?us-ascii?Q?YEbgV9vAcflqLeE+X74dQDDrT1ZZJmC6SQagSr0WjuBY2x8oxc7jq083TAH2?=
 =?us-ascii?Q?qJmyXLwxlpr0njAPsnAq8QdVehV8cOkVKrgH3fLHQvI+Ef2rNJgbX/eXiLID?=
 =?us-ascii?Q?Ann6wiGOk3HJj6IRhdtyfUcTa5E064WID4zMbDX5dOfjaOeD6XgG/hBynJkX?=
 =?us-ascii?Q?bdRSAra/QH/qVxPP7QAmEQRVTf8uDQo4c2Z3pO6kV26oG+5PzeA+gne3WdUW?=
 =?us-ascii?Q?7O+fN19aw/cZfItFnS4MD/+tXVfimPWz0v++6LyAqWEmeIPs1HYgnTgTsv1+?=
 =?us-ascii?Q?yzkTgjsp9L44e+yHrrw3/H711omQSNznwTvO+rjkyllfdVyNN2XK8kV/wC8d?=
 =?us-ascii?Q?KrfLyyPum5mOmg+pBRmtmQNIIVz4PgV05CEJo6dXRDoLlZVRm5ffj73T/LJk?=
 =?us-ascii?Q?MaRviBgzDCjyQ1s2xTi6OFOLUw3RWcZqKAxB5apG6IqsBQJzGFzxgShRgx1V?=
 =?us-ascii?Q?6lnBQ1ixlA7Sft2xabW2uyUb3f6ycyM8xFNjR4PUEty2Hwe4eNKWq0OHbPMx?=
 =?us-ascii?Q?onZ8RDcSKuxZcod+SXlCobgY08APnzA/fkJkzloGvunAaUVbk5qFGlNVLaOC?=
 =?us-ascii?Q?3848tXj1iZKqFqfEUMhJrLqPAOR1Q4beHsWG6vD9jvcFZJELvBW6W31gXsJB?=
 =?us-ascii?Q?sVg38KfJLOK+7HOkQqR7HtL4/Jlkt7XKrETfyGZ1WLA+WiAf5XQ+bLnmjFiu?=
 =?us-ascii?Q?dgWplqSgeDrpJGdFHFbh0HWuQalEQCktlwMv9k/2EKskDxgWtqbW0of3EKPN?=
 =?us-ascii?Q?EfXrAw7ICW4Y7uoY0LUlK5+FujkMcullvho+YuJd8zSYEEgNvuOa75SxKElx?=
 =?us-ascii?Q?GdBuP56KORpYJQ6l0shmDfQKRC/Y6XZpbRDqjhep62tZOoGLVjrFjq6zfUUf?=
 =?us-ascii?Q?WAbOW4NIrQ+aIChXW1EhT+3jw5657o47JRsTxSU56Ei5ctpjvXTQgSwsuTIG?=
 =?us-ascii?Q?VXdDywoE80aYSwjaiFLIQ4KW0YRj7MhhQZsdXdthVwvNWfd1PO9GvK3PXiMc?=
 =?us-ascii?Q?nzEbhdY11BUBUZkF0PJ1g7vwc5lntU8wZVtwM4f6r0lr3yVeOdZ7CZXD5CEa?=
 =?us-ascii?Q?/6Nni9YY2ytnHr1IT6UbMIp56Uc7a3YWv1g2VqXQGQdFcAK+Zz+fMXFQUANy?=
 =?us-ascii?Q?bsQq5pXhIriTRCQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:42:02.3257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d72118c-9501-4395-28de-08dd20b0a5c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468
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

Expose a 2nd curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF and program HW to
perform the sRGB Inverse EOTF on the shaper block
when the colorop is not in bypass.

With this change the follow IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 566035af00cd..65f681b0c31c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1202,6 +1202,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_output_tf(tf, 0, 0, false);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 2nd op: 1d curve - shaper */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+
+		if (new_colorop_state->colorop == old_colorop) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1257,6 +1319,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1267,6 +1330,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - SHAPER TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 3be0cb19ebc7..718544b11863 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,6 +34,9 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
 
+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -60,6 +63,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = ops[i]->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
+	i++;
+
+	/* 1D curve - SHAPER TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 3324e2a66079..71cd27994528 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

