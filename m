Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97C57BEA3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778C2113C61;
	Wed, 20 Jul 2022 19:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310A2113892;
 Wed, 20 Jul 2022 19:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+zAselzUek/K5cBlr0SOChugmwMu2bXnQnwWfImxHrg=; b=gtWHPUz0fRIPbi85RgRm0Agr80
 OQBh19nWQJZ2/xNOYHmDQoqJ9T7D58ipsD5GyNSTNvqEQXID6aePpWlM5t3ZqmF7B4aHhCqc+utRL
 YcJioF0sUJ8ZPsrCchPCcYijWMOPEuscK7wNXaGFRsROe1rmMBIr829E9lvIlFOwzYhtn4TSARRDX
 4XV9LgnLS8wxBi7Ph+8pgpRGKZYbQv8TgttLXndEb57Me4lXUse32IWxvhFqgYXveBZK2VzScWCb2
 ZVxoO706OYUpWmVXY2J8YJm0yeGRvJnsFGoB+eaxlSIiLCH8/Bj0hZHzoKsWmTWbcOejVqJGrzVVJ
 vINlyslw==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEFRd-000fxI-HF; Wed, 20 Jul 2022 21:33:17 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/5] drm/amd/display: move FPU code from dcn30 clk mgr to DML
 folder
Date: Wed, 20 Jul 2022 18:32:07 -0100
Message-Id: <20220720193208.1131493-5-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720193208.1131493-1-mwen@igalia.com>
References: <20220720193208.1131493-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The -mno-gnu-attribute option in clk mgr makefile for dcn30 hides a soft
vs hard fp error for powerpc. After removing this flag, we can see some
FPU code remains there:

gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses
hard float,
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
uses soft float

Therefore, remove the -mno-gnu-attribute flag for dcn30/powerpc and move
FPU-associated code to DML folder.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  6 --
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  | 63 ++-----------------
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  | 63 ++++++++++++++++++-
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |  1 +
 4 files changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 66dc02c426e9..15b660a951a5 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -115,12 +115,6 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
 ###############################################################################
 CLK_MGR_DCN30 = dcn30_clk_mgr.o dcn30_clk_mgr_smu_msg.o
 
-# prevent build errors regarding soft-float vs hard-float FP ABI tags
-# this code is currently unused on ppc64, as it applies to VanGogh APUs only
-ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn30/dcn30_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
-endif
-
 AMD_DAL_CLK_MGR_DCN30 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn30/,$(CLK_MGR_DCN30))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index 914708cefc79..3ce0ee0d012f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -29,6 +29,7 @@
 #include "dcn20/dcn20_clk_mgr.h"
 #include "dce100/dce_clk_mgr.h"
 #include "dcn30/dcn30_clk_mgr.h"
+#include "dml/dcn30/dcn30_fpu.h"
 #include "reg_helper.h"
 #include "core_types.h"
 #include "dm_helpers.h"
@@ -97,65 +98,11 @@ static void dcn3_init_single_clock(struct clk_mgr_internal *clk_mgr, uint32_t cl
 	}
 }
 
-static noinline void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
+static void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
 {
-	/* defaults */
-	double pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dram_clock_change_latency_us;
-	double sr_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_exit_time_us;
-	double sr_enter_plus_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
-	uint16_t min_uclk_mhz = clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz;
-
-	/* Set A - Normal - default values*/
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
-
-	/* Set B - Performance - higher minimum clocks */
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].valid = true;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = TUNED VALUE;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = TUNED VALUE;
-//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
-
-	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].valid = true;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = 0;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = 0;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
-	clk_mgr->base.bw_params->dummy_pstate_table[0].dram_speed_mts = 1600;
-	clk_mgr->base.bw_params->dummy_pstate_table[0].dummy_pstate_latency_us = 38;
-	clk_mgr->base.bw_params->dummy_pstate_table[1].dram_speed_mts = 8000;
-	clk_mgr->base.bw_params->dummy_pstate_table[1].dummy_pstate_latency_us = 9;
-	clk_mgr->base.bw_params->dummy_pstate_table[2].dram_speed_mts = 10000;
-	clk_mgr->base.bw_params->dummy_pstate_table[2].dummy_pstate_latency_us = 8;
-	clk_mgr->base.bw_params->dummy_pstate_table[3].dram_speed_mts = 16000;
-	clk_mgr->base.bw_params->dummy_pstate_table[3].dummy_pstate_latency_us = 5;
-
-	/* Set D - MALL - SR enter and exit times adjusted for MALL */
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].valid = true;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us = pstate_latency_us;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us = 2;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us = 4;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.wm_type = WATERMARKS_MALL;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_dcfclk = 0;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_dcfclk = 0xFFFF;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_uclk = min_uclk_mhz;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
+	DC_FP_START();
+	dcn3_fpu_build_wm_range_table(&clk_mgr->base);
+	DC_FP_END();
 }
 
 void dcn3_init_clocks(struct clk_mgr *clk_mgr_base)
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
index a8db1306750e..c00f759fdded 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -29,7 +29,7 @@
 #include "dcn20/dcn20_resource.h"
 #include "dcn30/dcn30_resource.h"
 
-
+#include "clk_mgr/dcn30/dcn30_smu11_driver_if.h"
 #include "display_mode_vba_30.h"
 #include "dcn30_fpu.h"
 
@@ -616,4 +616,65 @@ void dcn30_fpu_update_bw_bounding_box(struct dc *dc,
 
 }
 
+void dcn3_fpu_build_wm_range_table(struct clk_mgr *base)
+{
+	/* defaults */
+	double pstate_latency_us = base->ctx->dc->dml.soc.dram_clock_change_latency_us;
+	double sr_exit_time_us = base->ctx->dc->dml.soc.sr_exit_time_us;
+	double sr_enter_plus_exit_time_us = base->ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
+	uint16_t min_uclk_mhz = base->bw_params->clk_table.entries[0].memclk_mhz;
 
+	dc_assert_fp_enabled();
+
+	/* Set A - Normal - default values*/
+	base->bw_params->wm_table.nv_entries[WM_A].valid = true;
+	base->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
+	base->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
+	base->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
+	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
+	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
+
+	/* Set B - Performance - higher minimum clocks */
+//	base->bw_params->wm_table.nv_entries[WM_B].valid = true;
+//	base->bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
+//	base->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
+//	base->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
+//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = TUNED VALUE;
+//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
+//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = TUNED VALUE;
+//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
+
+	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
+	base->bw_params->wm_table.nv_entries[WM_C].valid = true;
+	base->bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = 0;
+	base->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
+	base->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
+	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = 0;
+	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
+	base->bw_params->dummy_pstate_table[0].dram_speed_mts = 1600;
+	base->bw_params->dummy_pstate_table[0].dummy_pstate_latency_us = 38;
+	base->bw_params->dummy_pstate_table[1].dram_speed_mts = 8000;
+	base->bw_params->dummy_pstate_table[1].dummy_pstate_latency_us = 9;
+	base->bw_params->dummy_pstate_table[2].dram_speed_mts = 10000;
+	base->bw_params->dummy_pstate_table[2].dummy_pstate_latency_us = 8;
+	base->bw_params->dummy_pstate_table[3].dram_speed_mts = 16000;
+	base->bw_params->dummy_pstate_table[3].dummy_pstate_latency_us = 5;
+
+	/* Set D - MALL - SR enter and exit times adjusted for MALL */
+	base->bw_params->wm_table.nv_entries[WM_D].valid = true;
+	base->bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us = pstate_latency_us;
+	base->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us = 2;
+	base->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us = 4;
+	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.wm_type = WATERMARKS_MALL;
+	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_dcfclk = 0;
+	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
index dedfe7b5f173..c2024052a497 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
@@ -63,5 +63,6 @@ void dcn30_fpu_update_bw_bounding_box(struct dc *dc,
 	unsigned int *dcfclk_mhz,
 	unsigned int *dram_speed_mts);
 
+void dcn3_fpu_build_wm_range_table(struct clk_mgr *base);
 
 #endif /* __DCN30_FPU_H__*/
-- 
2.35.1

