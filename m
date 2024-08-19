Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A506E95762A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB4210E40F;
	Mon, 19 Aug 2024 20:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WdK80H5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0206210E3DE;
 Mon, 19 Aug 2024 20:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogfSAhvLVYU90QXHPZDZhVt/KDCYcVnJmGKP2OJIU1BoqORwwuJt37jFzoENnET2K263tVXHg3oSv8fBrKhDkM8qF5gIafXgLB7JLqfV5JSNO2BzBFs6bEmxpRFLj/ANSeiE2DhDmBk4xl2uEHtyAIm7WxvQ9PA4EXg5WJL1ITVEz6vnXm21ZXF6CznIpNBtpBR7e+1TjfwPYFkOE9byS2eIxtEwk5xhyY855F+UkmqB0b6/KLp02DvgRIV+E76KxfSPbMTuREQKNhWwmx+mil7SbaS0TGh5zj2cPiC3rwV3DzfD9Reb1pFzrYxddqh14OfSPxo3VrZvORj/tr+m6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/W6SQ+HaeITvQSYYjcYUeVwWDNaa5gta3UFxexDK1Q=;
 b=ElLDUqGgrrC+5kHUPw9iOYcWql4isqOjIySxYmGh1WfcpYmHGV1EItHZiBrVsQlXRHequqCHX7dkdf+fX0u/MGBDOk5sLVEyWv14Ocl8OgyqUE8+xQMcWOaNiJOtJ8YP3m3rpbDww1M5LqF2BGuZxKnuOo4zdtwkAj9Y9kVKe9CN+3+TVLUN5iDtmptfD1GakZllVI5YvGl0V8vpFx8CTqdCJ86OEatj3QSu2sZ4AIBOn0JibmGAOPFAdeEYIGm6zp1bl8SNk8xAhcRqcLZUttXavrIlreT+ujqQQOogEvMTtezgRVI0I25xPLBYr/B6AvtUcuQhYJcySmL4i62ILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/W6SQ+HaeITvQSYYjcYUeVwWDNaa5gta3UFxexDK1Q=;
 b=WdK80H5RXp8qYXyrE5FhpgNyeg/9l0TmsiirymSo/OAJmx/YcpLyIBkkO+v9mOIEJgOtnwDJOOtbhorsnB7+QNUHKJTOGqSe4NEfUTJBUBdANC7yTPugnmVDSP8iKyC53nd4ZwVSIqmzHD9gojam8HSdoZIEpgaFGMgPpJ0qsqs=
Received: from BN9P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::13)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:37 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::22) by BN9P221CA0010.outlook.office365.com
 (2603:10b6:408:10a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:36 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 27/44] drm/amd/display: Add support for sRGB EOTF in DEGAM
 block
Date: Mon, 19 Aug 2024 16:56:54 -0400
Message-ID: <20240819205714.316380-28-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9b382e-e94b-4e16-d5d4-08dcc0918e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W/uryWg9C1drMfzkXYOaftzY/j24AXetkAjpWe8NIoJ+VybfAyycUevWUAw/?=
 =?us-ascii?Q?IADi3w74p8Dc5os0JV++nqmdtxyXU2ZpU57h0FWaBJID8P6FcOFBProicfnU?=
 =?us-ascii?Q?yk2LLUkragelw9GDidpA8H28GGyN2GzGxmzbxm+eN3bCVXIMeXUP6XVOAXtd?=
 =?us-ascii?Q?QMpT3it1YZOK8umE7sr7uCGf5xTc1fuLb3mvn9CebMTRpUqgAq7PffqLq1fz?=
 =?us-ascii?Q?KzG+pUoqFqQ/6YhAvr6VcJXOZffbaDEq6c+ByHXagy/eR0h3j/Evek1du5d0?=
 =?us-ascii?Q?TzUkAc0E2X+2sNLE9LUU6VH8eATMcQg1rTRGQhG9MIoa5cZ7qMDUfeWkuba+?=
 =?us-ascii?Q?LauI/s9NPkt5CF1RK4rEOVBs7VIJsqFSrsZEqDJZIZ9df4+JZ+2kIqzanJam?=
 =?us-ascii?Q?IZmMMBTc8rybBHC6WD6lZ2kWbqxo41sYB/MCoZnCbu0NU8dhRwQB6uSlsype?=
 =?us-ascii?Q?tVv9azR3F5MN2u91nmwgpghRcyjXOp/Ff0xq5QN406NvuErOfO4a4Do9j8vE?=
 =?us-ascii?Q?8oeimeYZBssuflAbqo1Xi3yV8oNJfPFnoHKgDLSldeYXpQs8gs2+SfCfdsob?=
 =?us-ascii?Q?zXCUi0U1cAstKSbQomBW1gR/suNfUVHq1VrhDc4Jvd+0tN97cM9xqgOTIvSc?=
 =?us-ascii?Q?slXZzpDR0ItfybYPrivUEGwk21xtFke1V5g3F2UzLtz0/9yRy4juIL73o1jw?=
 =?us-ascii?Q?Lh07ZjhTPyV/zxteEy5pX7w1jIyU93LhWPlg6Le001ogYZp1ibH0/9idXwUI?=
 =?us-ascii?Q?Eg99PeP4QC4WL2CXabRtL9TxbqiZmVNkcc0EuzsYg5FNcvaupM8A/coyvm3z?=
 =?us-ascii?Q?7huYyib70N7img5OWVFVz7LCZxwFJd+J7hxSuL+uclFwQc92tmR48Vs/ChXl?=
 =?us-ascii?Q?4rOkt3UMDVaQ5fRl9TVBsLc+pfadKpMb57/H1N34DqKML3RASD0Vd4DXz8U4?=
 =?us-ascii?Q?ZWYMh1Tt1+ePQok+F5K20xk5vmLyJwBD6HfFdfIPkIoDl7UqzAtbTb94POTz?=
 =?us-ascii?Q?dXZYU+5P/cN+Ql+EUqjQUwym2rT3pLZVYO13FUNj/fwkhO5zPOjZj9Lbwgiz?=
 =?us-ascii?Q?7sDQyXTwlEizmfW+bN7a5qGcmcKI+lFGS/yJgK3iaVFr+3Opt+tNmzBgoLqS?=
 =?us-ascii?Q?mTXyCJY6lrxnQ+j7MEyHi8KIqK83QB3lRiyEJhDdkbo7J4eIC27VcUw/LV4Z?=
 =?us-ascii?Q?/jfnnsai+QLUrUVH+HtKVW49zplVthVBxje/mDygpXxQO67ZUzSHeqTobnZh?=
 =?us-ascii?Q?F7EMvAU0fK34cf1hdcY8VLMs8hp2F4mSTai2LCWf5da+8Z/b26o+X5FR0COx?=
 =?us-ascii?Q?fPWbIPPkbTcgsjllVwoYSdVRMXDkUvVHJCU72wYTyMaTQcntaThagKVhb8Yh?=
 =?us-ascii?Q?qyZNI8vxaupOrVr3cBAP+cWXpCvP2zWeBVe/ooLmpXokqVPVwLTO/E+Pj8WV?=
 =?us-ascii?Q?QaMiXgYYSVlPOb39WcUoXj88qsQSOl/z?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:36.8325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9b382e-e94b-4e16-d5d4-08dcc0918e3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
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
index ebabfe3a512f..adb1e4b3522d 100644
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
+	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
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
index 8fc0f73fce33..8f950ca1f5ba 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -35,6 +35,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1753,10 +1754,19 @@ dm_plane_init_colorops(struct drm_plane *plane)
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
2.46.0

