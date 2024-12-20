Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28F9F8B7A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABF310EEB0;
	Fri, 20 Dec 2024 04:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FvEJdLrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8239110EEB0;
 Fri, 20 Dec 2024 04:41:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUAjxRXunsPGWytyxkEwX1ZG3YI1f68mHh+2sfXb0pIYw6zRNL82xEmJNNUwQj37Pr8gs0Ryx1C+JdMhTPdAmDE+0jFaNOjvDZr9kSeDSOpD3Iubkrn5N7hmG50UMJ8S4JxMzWR920m2ELBAJ+6BAHVELZd/exE/8CFxDIxehdLAXvf/lHVRAeoUP+GPZFY8MFBklH2iGGFwL+BZmYIOr80e+wHWHOTLEnI4GEnEkrjjxqkVUVIw2trryMDrONG8qzUPYnVjTm7RDKOYmkeR3QIcJunyJaTyh1yVHBM9tLfnOO/gbaZnrkNDkH4K2xVPatALYodtY9j4lcOmu3jGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJLHVPYEphPX1+QrOoyzN9WFbDnopiHbUXbf/sUZ7oE=;
 b=Co0+LQce3ao878zDEXZDHjVStJP3ienQmRLcwRO5vyIZELWJKeAWIuBf2tce13MXbjvNQrEQ68SC2R3/+xYfnmKjSQneUZ3Oq1RL6T7nmz4SI8wGZB6QvO/EUnTCT60OhvVLW5WtSOzdN4I4WohZzM553RuvN0H0MC2fOCHqI7NH0cZ4lqNb70BgxtpenQhfM/Rkx6rSGqD6ssKoob8+Z8o/56jUxgZym4t6GAjFujhSbjCj2HD7D+H3Bz9ZcqIpP6d/0M6G3kvGi6LO+r9AtsrQsuySE9Jt8tA/koSUeIVHyoOGR1SwK/kXn2tntoTMlm/vV450+vTBtUan+aZsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJLHVPYEphPX1+QrOoyzN9WFbDnopiHbUXbf/sUZ7oE=;
 b=FvEJdLrzqIOc9Ks1HFEQqbsVoAuCZW1oVdpnbpa0x4JXDGSpIR0h6QNe3TQi/aAibyptIz8r3pZGQOcaeuxvIUAqGl+6yNMQCiwYifR9rHgpCc7bI0NOY0ukVuklgx22aLPvXm8U/35SBw1v2l+Ti2a7FMPhrrHmUNWD76wWNq8=
Received: from PH8PR22CA0014.namprd22.prod.outlook.com (2603:10b6:510:2d1::29)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:41:51 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::b4) by PH8PR22CA0014.outlook.office365.com
 (2603:10b6:510:2d1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:41:50 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:41:48 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 26/45] drm/amd/display: Add support for sRGB EOTF in DEGAM block
Date: Thu, 19 Dec 2024 21:33:32 -0700
Message-ID: <20241220043410.416867-27-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8d095d-9480-46a9-d20a-08dd20b09ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y6djxJLmwV5+Zrm1KC0a7amdS999lMsZb9zayqsIkRXGpxTn/5R1PvMlSJrC?=
 =?us-ascii?Q?LYPB75ewuGP6WrKVsR8g2OjF84KOUYA+wKz8R0CCqj+OV0o8c6ssF+OI1ChE?=
 =?us-ascii?Q?praQlb6LpRzqLTHIoQq0L5SECg54YAitlApSxXAPhGn5aMLgEg1bYdCR6wrv?=
 =?us-ascii?Q?HgvJeihIi+RE6lrWAGHcrK5t34wgqv55rS6UepJlimd/InJyg/NItSoCEmxI?=
 =?us-ascii?Q?JNFYfI4TfI+c5VE7ndliEoB+Wab+wnqW54LEDUG0U0JVWeG+U0uKoJ8KxqPN?=
 =?us-ascii?Q?FO+i+4BfKwXBKR95WiFfnJZbXFk0wfvetBnu5HUuRd+Vt4pP2aciWQoaLux+?=
 =?us-ascii?Q?uWe+QitEk7fQIDaMA0VPGSFWRofpb1eUkTAfBKzb5FVyK6k7aEHNqAVQoa+w?=
 =?us-ascii?Q?yuo+GzCc3AFSfereQNCg/xznRfCNAWa8+zme50m0Vsqo0ldHle5jE8eDsiKd?=
 =?us-ascii?Q?Fhho9MFTWr7zGdq6y/oNsJhyOgQMN2JKhT+0yaFSQcu8Vq7XfMpHP6sJBUcl?=
 =?us-ascii?Q?BB0jphv0BshIc7M7Cp4IEALcfiVXjYJdrZq5eYHiVAOR1vFHoHfuibfsxVh1?=
 =?us-ascii?Q?7qseStrHEqQhAZsXP+KPnOftyJK18P6nRqJhbWwFs4rYMJp7d+X7R5h37aeg?=
 =?us-ascii?Q?jq0CGvd74A+MFIretGi2KNpZ8dHKVhYIAMYXnK9StmcP/YetIvcGhCONgIba?=
 =?us-ascii?Q?/j9yx+Hm9JiY4WYw8MVHcQTc59rUjxsU8VKVhNUGGacQNscF/1HAmuErh/13?=
 =?us-ascii?Q?ZoSel3Rb1Z64wKkpnYwJmpjcIXBrEkU30Roz4zJI7XSkaHBdXh4vT6r2eHCz?=
 =?us-ascii?Q?MbMLSoSc0V6UFEHb8xngPjlrRSS7g6ds4FAelFrNf/EV4kefRbS0kDQmwrEy?=
 =?us-ascii?Q?iJJjgwen2+tByZNzLN57jrAmAhvxmkWaUHX3oGVniBKATInS75uYGh1ukxQC?=
 =?us-ascii?Q?E5Wf+Ls6iGnvbNpm7dAkf8R9hKbdXbkbcaeZRihqVHSVDG/vakV6TYePUKXN?=
 =?us-ascii?Q?/ak9YeXCEPY6EvE7eXpY5OuPBhq4VZKMoVKOtif2Cuf61r3WXVNUtX9SufBk?=
 =?us-ascii?Q?TI7RGAm5O1R0roYO9YxlteCrdtdN5jmsVW12cVXBldcNrQ8la9icYrrf5kCW?=
 =?us-ascii?Q?AhYg+VV2ogCIKy7gltMsUN9X8ekUOUY4IO30OPskw+fwIRapNe2kOJXsCif2?=
 =?us-ascii?Q?7T0CsDFg3U43SaPG/QT7oBmKohe6WPB+EyeWBUIygn/EQ0LkvO7nwAIRF3ej?=
 =?us-ascii?Q?pUPmdwuvN9IXoNOzubWUsVgL9vs5iENOKnybb0Fb22rpm+Yd0nWS+9jF72Gb?=
 =?us-ascii?Q?/7C5NWAsjwqu+Ui7NoiMYAjL6gm97o3hvtJZwqVFYqSs5d1vlehmq/t+258A?=
 =?us-ascii?Q?TRLwNlQb302O/zaye8ibdrBxhpfS1Vd2G27KtDvgX9ayfH39NeIF4nsHq7OT?=
 =?us-ascii?Q?pIasI1Q/bgxTpsGMB5NPAfBBwIyVp9vESbLitX2FmdGmMJvAhfjybf7W8zhX?=
 =?us-ascii?Q?PacZdEsWKHxIFhA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:41:50.9040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8d095d-9480-46a9-d20a-08dd20b09ef9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
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

Expose one 1D curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
the sRGB transform when the colorop is not in bypass.

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf

The color pipeline now consists of a single colorop:
1. 1D curve colorop w/ sRGB EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Fix checkpatch warnings
  - Change switch "{ }" position
  - Delete double ";"
  - Delete "{ }" for single-line if-statement
  - Add a new line at EOF
  - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */

v6:
 - cleanup if colorop alloc or init fails

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 70 +++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
 5 files changed, 202 insertions(+), 1 deletion(-)
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
index ebabfe3a512f..566035af00cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
+{
+	switch (tf) {
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	default:
+		return TRANSFER_FUNCTION_LINEAR;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
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
@@ -1187,6 +1252,24 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
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
+	if (!colorop)
+		return -EINVAL;
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
@@ -1283,5 +1366,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
+	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
+		return 0;
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
new file mode 100644
index 000000000000..3be0cb19ebc7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -0,0 +1,70 @@
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
+#define MAX_COLOR_PIPELINE_OPS 10
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1D curve - DEGAM TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	return 0;
+
+cleanup:
+	for (; i >= 0; i--)
+		kfree(ops[i]);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
new file mode 100644
index 000000000000..3324e2a66079
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
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
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 1bfb9f340c24..78c749ce1bd0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -36,6 +36,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1763,10 +1764,19 @@ dm_plane_init_colorops(struct drm_plane *plane)
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
2.43.0

