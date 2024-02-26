Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3838682BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9280110F282;
	Mon, 26 Feb 2024 21:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GYccP0PI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF85C10F1B2;
 Mon, 26 Feb 2024 21:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhEU9qtNURrtpdiYPjgYDCu2ZEKj2oNVMEVozEebKRXVVE1gJKO5ltmPnT+L+tiVBx53DXVp5C6NnfjZU+Mw4Ot7em3rXiAdiok1uDbegotBoP0CpD9weoKEmpDJEGpI4BTjd+zFXchLFuJAs8LHLfRk4oxSeFOuoD/U2+KKF3vA7w6/oXyo+2M6Bk+mmMqSieA95Db3UBmdz1Nq/qBxuy5X4yjwnIvNj7Y+pgVfJ1i+l1sTNm1470qsRpQ/q7QSSIaduyaYR/MqqDlgnT9vjc9SoryLgQk5y+pCBoYziVp7rkDR34PorMPn402fNRrVzZwbp/aHj9URYeT8d0hM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmeDB0l6/zw+Dxs1mn67sS+QZRCnZ3YR9JiyCdV2PoE=;
 b=Pn9PQcFD0CkvuedzqNH8K2Buw/j0tjs/8KueDV7SHxC027mhBwj10ZnG3zo36UwPEn8EoT/NtOwai/U+dYQfCityqZmk9jCrtDdgQE7sbimOwE3oj2eSGKFk91HVGyQJd+Mp9MWjK59meKzCRMev5UpOsqcg26lclDiArFv+EWfENjUKBdLBS5RkPTf+4c5ZTqXBCmKYtOfg4Vbl72j7i5J0kKwEqbvrDre5wicMC08JA0TLWrzlG+tbRHyqcdJF95bRWN4897V4gAlnd2b+htHmUEPNVwXY6IShCBFfoacwRr4IpxdJqU6ONVbb6nNucav7UV+dbdYyW2QKHTM/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmeDB0l6/zw+Dxs1mn67sS+QZRCnZ3YR9JiyCdV2PoE=;
 b=GYccP0PIN8fIKy+vQMyemVNSYGHLdFA79Skzn/44Cq+3XEoe9WP8jncIL9A16wYPtrfDlcQl/laufngFgjjQ34DV8cf0Mx5tHM/n5ywZzimrQD/77vpbBiD2B+tXET1D3WmjAE6qmgfhKRgMDa2DVJ8IRgqNZkJxs7pL+MTw9KM=
Received: from CH0PR04CA0073.namprd04.prod.outlook.com (2603:10b6:610:74::18)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:11:27 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::70) by CH0PR04CA0073.outlook.office365.com
 (2603:10b6:610:74::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:25 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:24 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v4 31/42] drm/amd/display: Add support for sRGB EOTF in
 DEGAM block
Date: Mon, 26 Feb 2024 16:10:45 -0500
Message-ID: <20240226211100.100108-32-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SJ2PR12MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 34de571f-30f8-4b35-008d-08dc370f7e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMxiDaU0HX0AOS/dwHADOBHnBIBc6FJ1vS956h1ko31lZ3C+vT6/+tMA2TDqhgT2A4iGA8e1dpIonk6P6sGIikXiNzKPQBvCmCj9iB++ioAfAK1By5U+4V+z4E8MRb23AQAZof8XxUxZBgu6vHAEHrI9o02mk5QjgUI0JgfSk/Qx8PsuKlRnDSnJqtJ+zUBjnlJGWisD2e2mG9YtfqljjpI3KI8pe03ll/EjE+A8e34uZKeUVZ+dwjZIyKDr4ZofuvxqU8cHR1GdvLqKMnpqi0OXQHZEWO3pUEUeJP2FAYEmd+VDxZsvAM5a8XJNyLh59ebe+suw5hY8pD8mFWnMvNSNVkUXrz5NZStVOQSkcwY+ueL4P3xUb5kO0BX30SDq4zGpuv8Z4QZjAnlcXWN43WIB8q+FTAbvbx+qt5g1mRkTLSVjlAufRIyOnRv0iPhKpELATmDfwa2CCXLvJ/xsyPFJ8hFTifo8ok9cFgcXlQgw1Gl3Hpobm8y2cQnl/n1M03oD244TgGrSs5Cij6qLKZhak38q0I6vCqQ4TYRgq7reAl6uoyWY9HXAnxmlfvNUkZnKgEy/rhFKIwjIXlLlrMMHHRZqvaw+Pj6gCBzDDzztncFPcYugZWmb/t2sr8IYYrGwA5MVtQL+jcbk9Rs3Tw7tXMRg0+XyNZDUgGcyxRAb+SgsXgB8kVIsSlJIL6s0EdK+HzLAje2da9v7KNP2ZQR9Bu5UmYt2nDBg+2L+6RkcVaE5n+pI8um3zLddnIw9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:26.1792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34de571f-30f8-4b35-008d-08dc370f7e51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209
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

From: Alex Hung <alex.hung@amd.com>

Expose one 1D curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
the sRGB transform when the colorop is not in bypass.

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf

The color pipeline now consists of a single colorop:
1. 1D curve colorop w/ sRGB EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 88 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 58 ++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
 5 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index ab2a97e354da..46158d67ab12 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -38,7 +38,8 @@ AMDGPUDM = \
 	amdgpu_dm_pp_smu.o \
 	amdgpu_dm_psr.o \
 	amdgpu_dm_replay.o \
-	amdgpu_dm_wb.o
+	amdgpu_dm_wb.o \
+	amdgpu_dm_colorop.o
 
 ifdef CONFIG_DRM_AMD_DC_FP
 AMDGPUDM += dc_fpu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 9b527bffe11a..3ec759934669 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -668,6 +668,19 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
+{
+	switch (tf)
+	{
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	default:
+		return TRANSFER_FUNCTION_LINEAR;;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -1137,6 +1150,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = dc_plane_state->in_transfer_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
+
+	tf->type = TF_TYPE_PREDEFINED;
+	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
+			       struct dc_plane_state *dc_plane_state,
+			       struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 1st op: 1d curve - degamma */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1187,6 +1253,25 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct drm_colorop *colorop = plane_state->color_pipeline;
+	int ret;
+
+	/* 1D Curve - DEGAM TF */
+	if (!colorop) {
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -1283,5 +1368,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
+	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
+		return 0;
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
new file mode 100644
index 000000000000..e8b7fc8bb0f1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_print.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_property.h>
+#include <drm/drm_colorop.h>
+
+#include "amdgpu_dm_colorop.h"
+
+const u64 amdgpu_dm_supported_degam_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *op;
+	struct drm_device *dev = plane->dev;
+	int ret;
+
+	/* 1D curve - DEGAM TF */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_degam_tfs);
+	if (ret)
+		return ret;
+
+	list->type = op->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
+
+	return 0;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
new file mode 100644
index 000000000000..f16de6a9fbde
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __AMDGPU_DM_COLOROP_H__
+#define __AMDGPU_DM_COLOROP_H__
+
+extern const u64 amdgpu_dm_supported_degam_tfs;
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
+
+#endif /* __AMDGPU_DM_COLOROP_H__*/
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index d3f64f586243..3adab18332d8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -35,6 +35,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1658,10 +1659,19 @@ dm_plane_init_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
+	int ret;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return 0;
 
+	/* initialize default pipeline */
+	ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
+	if (ret) {
+		DRM_ERROR("Failed to create color pipeline for plane %d: %d\n", plane->base.id, ret);
+		return ret;
+	}
+	len++;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.44.0

