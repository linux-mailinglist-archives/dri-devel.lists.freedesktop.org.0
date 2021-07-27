Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086773D6B4F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9FD72E31;
	Tue, 27 Jul 2021 00:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C810A6E926;
 Tue, 27 Jul 2021 00:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIdNFEUpxfr8QxNNWQS0OlqSPCIx+zj7esBuCHWorAWNRzeTeLDlbm/fJqC8FDJnnwdclTgis85y+qxS+GVcwu1lplAQKY93lZvMikaOStH4sMhfKmGEIJToFkHMT68nVWQTlzF3vq1Ji4xgKX+o+1HTgjt04KoSQYE8gDCKpNAyLI7jaT+qspPbmc8seaJipxPG8DDWx9ZqthOjI/h6cMG10JILYMeldDMCDAmS8AlufWMwu0hfdsT2mJ4ocBtkLk8itBJwW/IQ0Ij4jWz+V3OLALN3WKrQjGayES2Zr4riY7yE2GDBZ/PMwoXy6hfCuH249wX9YV02FcshTR25cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjBMFwuO7oXOlOdLEzm99vEm+4hCNWGAUQrVP/Mawe4=;
 b=SuDPswleO5BzrUXRjakGcDr4PKXkvQe7S980RyaD8etIs7IDZA/n2d5YO7muXKAwynic9yfw2H5sA9Xgd9jFUEvD2RBnvyE6zK1O2M0wHpLr55cDF+3Zz0lKDxEr1R7OPMHZ9DJYeY0+GyO7sSHE4nupQ2FOTUPY1Xg/wX4f58B/k9Gza8WI/0jCryDwIWi2tS+TNtVsL9A3zlJ3bbcRuu4LdakAIEeno7Dt3q5Z9qX6OFh/0HVYXCShc97hOZOom1NCT5nuug5NhkFRctm+JMrIy86Exq40h4OkBqnMClBOP0Z41/4H8REOdSeMaosHS1PsdwULst+hWPZD8XAv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjBMFwuO7oXOlOdLEzm99vEm+4hCNWGAUQrVP/Mawe4=;
 b=C0LOjI2TCNm7df7NXaYW/LhPITPFIxed0l9+jAyrhr8Yq2n6XHejRW5j2N9WSJCK8O3SULFEgNdCYeGmUxo2Rt4vPYkRoc5JQUB9w2OSaVN0EVhU0/UsaElkvLASvbfZS5MmeoJKfjyVAX4JvFkZCLHM69GotLUwU86+1ri9gcM=
Received: from DM5PR11CA0013.namprd11.prod.outlook.com (2603:10b6:3:115::23)
 by MN2PR12MB3405.namprd12.prod.outlook.com (2603:10b6:208:cb::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 00:53:04 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::fa) by DM5PR11CA0013.outlook.office365.com
 (2603:10b6:3:115::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Tue, 27 Jul 2021 00:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 00:53:04 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 19:53:03 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <sunpeng.li@amd.com>, <roman.li@amd.com>
Subject: [PATCH v4 1/4] drm/amd/display: Move specific DCN2x code that uses
 FPU to DML
Date: Mon, 26 Jul 2021 20:52:45 -0400
Message-ID: <20210727005248.1827411-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f719af3-dff5-459b-14df-08d95098e473
X-MS-TrafficTypeDiagnostic: MN2PR12MB3405:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34054C1B90E57608E7CFF05198E99@MN2PR12MB3405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L4VRB77ITi+PX0iOI7tNmEHR3uF5zoq93z4lk4Uhxrh1TR5ay721Zt58ntlaXGIwYBk4C1NiX6zPZQjtgVF4Ss0EVmb5zE1HoykYQNRlYzVofwHadnbKae7amO819T1UFgnZwsLg6SE0sC2K25TzBlXN27qq/p/O7AzkV193nJwghzcXYVlbmZKxtR9sez8kfqls+daI0MajWLX4sN7RlsTArDlhBGI/XYwV5KU9Al0n7ZCckbVqfTttqI/9pSR3Ntyuvu8CU6vKNFOICBjlXGhITvjfVyGPkYAMj0LQ7qxIWtXG/6xJI/tJq6fJaVW3f9TFDtX1eYfTN3BEuG3pFkccevvFwqiZXOG6qy5A+UMbmbAvjJHFksqDJzB1HlXwux2nf4DoceDBDpk1RTO0JgqG1vhKfnwPTjWo10GbIyFOv4AMX1TtF86AtysofVOap9fqmb629jFEewE6jaNzUoiZKgGeVPZKGAyElxwZ26AFxMi/nPB4eS4LBtwJcwbcA+mB3OWOG9h/Zvf3CTRANLTdpqCtb6qW0ak+w7JudSM1yLpe/5Z6Bid6x5V6qS4dhV+3aM/S4vTENVaTETSrj0DIUH3XuPJhaq1an1sNfBG5/dpdL9VgYOMscUIH4q5dL1PAWfOsXMZ1JHkHXo2aocUQKj5tlBuuyGfzBLYXjFQpuQop+rTDwIlK+D+BuSdU035euSOX66UEXOfMFDAjZmbM9H0J+PnPyHo9rI79Zoo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36860700001)(82310400003)(16526019)(54906003)(83380400001)(6666004)(70586007)(30864003)(186003)(336012)(70206006)(2906002)(26005)(110136005)(36756003)(5660300002)(508600001)(8936002)(356005)(8676002)(66574015)(47076005)(6636002)(1076003)(2616005)(316002)(426003)(81166007)(4326008)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 00:53:04.6025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f719af3-dff5-459b-14df-08d95098e473
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3405
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display core files rely on FPU, which requires to be compiled with
special flags. Ideally, we don't want these FPU operations spread around
the DC code; nevertheless, it happens in the current source. This commit
introduces a new directory inside DML for centralizing shared DCN
functions that require FPU and have been used outside DML. For
illustrating this process of transferring FPU functions to the DML
folder, this commit moves one of the functions
dcn20_populate_dml_writeback_from_context) that require FPU access to a
single shared file. Notice that this is the first part of the work, and
it does not fix the FPU issue yet; we still need other patches for
achieving the complete FPU isolation.

Changes since V3:
- Jun: Instead of creating a new directory to keep the FPU code, let's
make the DML folder the only part that requires FPU access. Drop
fpu_operation folder.
- Christian: Fix function code style.

Changes since V2:
- Christian: Remove unnecessary wrapper.
- lkp: Add missing prototype.
- Only compile the FPU operations if the DCN option is enabled.

Change since V1:
- Update documentation and rebase.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +--------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |  4 +
 .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c  | 84 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h  | 34 ++++++++
 6 files changed, 126 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 0b1cd1dbed8b..988d7c02199c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "dml/dcn2x/dcn2x.h"
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
index f27fc2acac57..fbbdf9976183 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "dml/dcn2x/dcn2x.h"
+
 #include "clk_mgr.h"
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 45862167e6ce..56055df2e8d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -58,6 +58,8 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 
 ifdef CONFIG_DRM_AMD_DC_DCN
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn2x/dcn2x.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
@@ -70,6 +72,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(fram
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn2x/dcn2x.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_rcflags)
@@ -91,6 +94,7 @@ DML = display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_calc.o \
 
 ifdef CONFIG_DRM_AMD_DC_DCN
 DML += display_mode_vba.o dcn20/display_rq_dlg_calc_20.o dcn20/display_mode_vba_20.o
+DML += dcn2x/dcn2x.o
 DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
 DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
 DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
new file mode 100644
index 000000000000..8f0f6220327d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
@@ -0,0 +1,84 @@
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
+#include "dcn2x.h"
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
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+					       struct resource_context *res_ctx,
+					       display_e2e_pipe_params_st *pipes)
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
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h
new file mode 100644
index 000000000000..331547ba0713
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h
@@ -0,0 +1,34 @@
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
+					       struct resource_context *res_ctx,
+					       display_e2e_pipe_params_st *pipes);
+
+#endif /* __DCN2X_H__ */
-- 
2.25.1

