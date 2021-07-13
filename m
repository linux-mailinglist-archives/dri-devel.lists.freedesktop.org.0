Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42ED3C71D7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D986E0BC;
	Tue, 13 Jul 2021 14:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF226E0B6;
 Tue, 13 Jul 2021 14:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eje9Z+lfw575K4U+Oe50FLSZkqTM/+rHqlcpVtodUnWu0Rk+RYjb9ngqX/JeStCBqEou5jTFTOXmTQk7mn4N4vmADDZDIobYXXTD0YGAFThYd/OZdULFoEt+4S9oKiFZ51Q8E2Exio/eY5YsHnCzdZVfIlysXKlYjzU5nk/28n1qX5QauAabub331+X0wgNh806eVRNgbOKHuAiNgAk3gEDciXjJHRmFne0BxU5JpHzQuyceLTdhOANRhjGBoxigyjNf6HWRti///1/kCABLnJdMuNuUwdFi3zDYhQuc2+T7BvVYUY30TD9hD/HIOZkGq6RGvI8A+/P4vxaNx5YK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoPiD3fTbMuYEpETFtZRXEfPqQh0S6Rw72e2KjxnhyE=;
 b=cejm/4lQ3KQfQkN/kOCj4LQJF6wdW1kZzCJ5Mm+k00+s9hb0xQULK/QJIJvXR09S/CjCza/iv1xJGU53hlipXNQOZfb/OEbdXYxxQUb5RZFS97PNLvR+WZYzXcyScoL0TWQvhCfOhrvQpehStc2/nVl87DrMThJ4d09aGt7BdOPz9ib7rySX2FUbOMQ3LYX2NSy/gT7az3Qq088MUL8I9Ie5hNX/igmFjmzWROpgNMnuaZKNfntN2yfQ/gDKyMjFXfvHBuQjuZXawHEa1OjYmvTdSqNFZX0f2USrc32qISCa8I9uzJRQ+fk6v+ZhNtyFahwMJIft8k1LqzDexhAMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoPiD3fTbMuYEpETFtZRXEfPqQh0S6Rw72e2KjxnhyE=;
 b=MUHtcFlBL09z3RMCRyY7xSTtxwbOytCoF9sUo1N90LNJGTh3pt17TWfldp/pPNpLGINB0g13z6pKpmussv++nVp+BCY686u/2AFjgIm+u2zGDtDgfhanYagywOwsyyY/eoH1ZhFB7+RAMqkPVaJaNbkBp0bjIfNuNEe3fPS/TlQ=
Received: from MW4PR04CA0222.namprd04.prod.outlook.com (2603:10b6:303:87::17)
 by BYAPR12MB3240.namprd12.prod.outlook.com (2603:10b6:a03:136::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 14:06:41 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::87) by MW4PR04CA0222.outlook.office365.com
 (2603:10b6:303:87::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Tue, 13 Jul 2021 14:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 14:06:41 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Jul
 2021 09:06:38 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, <christian.koenig@amd.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <anson.jacob@amd.com>, <hersenxs.wu@amd.com>,
 <jerry.zuo@amd.com>, <sunpeng.li@amd.com>, <aric.cyr@amd.com>
Subject: [PATCH v2 1/4] drm/amd/display: Introduce FPU directory inside DC
Date: Tue, 13 Jul 2021 10:06:09 -0400
Message-ID: <20210713140612.2721113-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
References: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d546f4ae-3170-420e-abd5-08d946077048
X-MS-TrafficTypeDiagnostic: BYAPR12MB3240:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3240670A51421F55988B7C8098149@BYAPR12MB3240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+lLzuZFMSJ7J/shiEdnSSStNdInNtMESVYlWozUE8iv2JboRgXQAVSxemiGXYN1k2fMitMBSXvWa6e43oD1La7noOwX+nTcLxY79RArtc3OOQx2XAu4sJsu6G3pPENbazGoEe8JFtjXk8JS08Jazlc3et38373S0Br6gpD2INBT67ebOQTpRttRDsewMeF2f2s5mUKFBtKLIh7sUXczrf8PNZV7dInca3Q8BJNOr/0goylWg/KQjX/ZsrrszP5i+LxgAtZ4BHi8qzVMRvKeRaIFkTS+ScJkpxslg+FC0SlqkvBfIapfUqzlxtjPQGR/HKPRjkVc+2chWBmQKPsStSjSoOUEt8OjX9m658UsVofSIvzuABR8adX5uBaCACTUax+PV/rzDLRmdFIOaCyQwCdnYrKGkLLURE2jwNB5g/jqdm5JFqgYyYBz7YvvDJ/UOd7bCstZThwza8fiNqN33G0/WyOt4cP+55lydFGKWMpsO2gQAy2xCbuQqCEN02IGwiSeuV2QkHqnLQbUBW3LUvjjdFlMwtVDP26BdsbtAm79czlp4u4LtwgaWCRf54TGOW5ryqjjZ9keHUO/dv1dbu8ZHVpvCseRHnGCziKd3cXG/Cv3kJRWYnZvNzxEXWTaanrzNftUnLZhoIBo/Vx222StYkP/+KM9a6JJ2DmRwx2iPSkFdEVyEMkbLYLGbyDwi/vTQSmCFVg9AyxdjGYOzDhULAhbpBreuDTZzdp+nYAel2twLQnN1MYzzSUf20XZ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(36840700001)(5660300002)(82310400003)(316002)(6666004)(47076005)(81166007)(86362001)(426003)(186003)(16526019)(336012)(2616005)(4326008)(2906002)(70206006)(70586007)(83380400001)(6636002)(478600001)(110136005)(8676002)(356005)(54906003)(30864003)(36860700001)(8936002)(82740400003)(26005)(921005)(1076003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:06:41.0472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d546f4ae-3170-420e-abd5-08d946077048
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3240
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display core files rely on FPU operation, which requires to be
compiled with special flags. Ideally, we don't want these FPU operations
spread around the DC code; nevertheless, it happens in the current
source. This commit introduces a new directory named fpu_operations that
intends to centralize all files that require the FPU compilation flag.
As part of this new component, this patch also moves one of the
functions that require FPU access to a single shared file. Notice that
this is the first part of the work, and it does not fix the FPU issue
yet; we still need other patches for achieving the complete isolation of
this file.

Change since V1:
- Update documentation and rebase.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +--------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
 .../amd/display/dc/fpu_operations/Makefile    | 58 +++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 87 +++++++++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.h | 33 +++++++
 7 files changed, 183 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 943fcb164876..93e731a9be68 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -37,6 +37,7 @@ DC_LIBS += dcn303
 DC_LIBS += dcn31
 endif
 
+DC_LIBS += fpu_operations
 DC_LIBS += dce120
 
 DC_LIBS += dce112
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 1b05a37b674d..f99b09643a52 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "fpu_operations/dcn2x.h"
+
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
 #include "dcn20_hubbub.h"
@@ -1974,43 +1976,6 @@ void dcn20_split_stream_for_mpc(
 	ASSERT(primary_pipe->plane_state);
 }
 
-void dcn20_populate_dml_writeback_from_context(
-		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
-{
-	int pipe_cnt, i;
-
-	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
-		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
-
-		if (!res_ctx->pipe_ctx[i].stream)
-			continue;
-
-		/* Set writeback information */
-		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
-		pipes[pipe_cnt].dout.num_active_wb++;
-		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
-		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
-		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
-		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
-		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
-		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
-		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
-		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
-		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
-		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
-		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
-			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
-				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
-			else
-				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
-		} else
-			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
-
-		pipe_cnt++;
-	}
-
-}
-
 int dcn20_populate_dml_pipes_from_context(
 		struct dc *dc,
 		struct dc_state *context,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
index c8f3127bbcdf..6ec8ff45f0f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
@@ -58,8 +58,6 @@ struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
 		struct dc_state *state,
 		const struct resource_pool *pool,
 		struct dc_stream_state *stream);
-void dcn20_populate_dml_writeback_from_context(
-		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
 
 struct stream_encoder *dcn20_stream_encoder_create(
 	enum engine_id eng_id,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index f3d98e3ba624..85385144e2c5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "fpu_operations/dcn2x.h"
+
 #include "clk_mgr.h"
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
new file mode 100644
index 000000000000..7f6f90c3f267
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2021 Advanced Micro Devices, Inc.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+#
+#
+# Makefile for fpu operations component.
+#
+
+FPU_OPERATIONS = dcn2x.o
+
+ifdef CONFIG_X86
+fpu_ccflags := -mhard-float -msse
+endif
+
+ifdef CONFIG_PPC64
+fpu_ccflags := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+fpu_ccflags := -mpreferred-stack-boundary=4
+else
+fpu_ccflags :=  -msse2
+endif
+endif
+
+CFLAGS_$(AMDDALPATH)/dc/fpu_operations/dcn2x.o += $(fpu_ccflags)
+
+AMD_DAL_FPU_OPERATIONS = $(addprefix $(AMDDALPATH)/dc/fpu_operations/,$(FPU_OPERATIONS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_FPU_OPERATIONS)
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
new file mode 100644
index 000000000000..c815d6c01d64
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#include "resource.h"
+
+/**
+ * DOC: DCN2x FPU manipulation Overview
+ *
+ * The DCN architecture relies on FPU operations, which require special
+ * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
+ * want to avoid spreading FPU access across multiple files. With this idea in
+ * mind, this file aims to centralize all DCN20 and DCN2.1 (DCN2x) functions
+ * that require FPU access in a single place. Code in this file follows the
+ * following code pattern:
+ *
+ * 1. Functions that use FPU operations should be isolated in static functions.
+ * 2. The FPU functions should have the noinline attribute to ensure anything
+ *    that deals with FP register is contained within this call.
+ * 3. All function that needs to be accessed outside this file requires a
+ *    public interface that not uses any FPU reference.
+ */
+
+static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
+{
+	int pipe_cnt, i;
+
+	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
+
+		if (!res_ctx->pipe_ctx[i].stream)
+			continue;
+
+		/* Set writeback information */
+		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
+		pipes[pipe_cnt].dout.num_active_wb++;
+		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
+		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
+		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
+		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
+		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
+		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
+		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
+		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
+		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
+		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
+		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
+			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
+				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
+			else
+				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
+		} else {
+			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
+		}
+
+		pipe_cnt++;
+	}
+}
+
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
+{
+	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
new file mode 100644
index 000000000000..c060f909164b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#ifndef __DCN2X_H__
+#define __DCN2X_H__
+
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
+
+#endif /* __DCN2X_H__ */
-- 
2.25.1

