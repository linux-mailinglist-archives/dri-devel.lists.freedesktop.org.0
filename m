Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3757BE9E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C8C113803;
	Wed, 20 Jul 2022 19:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B9B1136D5;
 Wed, 20 Jul 2022 19:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UicLgLWwPdtUUFcXVDzpO7LZkiz+r97xHnRjNQNZ4tk=; b=nVTyiZxj7tzGu9aKTFIhOfSLR2
 x2M4qtQSrtsOK7Zna2UrNV/E/GeRo7Wamc7EYsFncDIl4Vyy6SvWs7MpN/jibKKL5v0gMBxIwQBav
 ehNd0NWscRRLHSlNvci4H4l+Oc543fYlHpxz7+E0N3xmimovuyMoADNE191zWo/G7grD9DpLfTUdQ
 IP4uyRPeOpPVTzI1F5WgN7uQrtuy8k0GyjPasoaVYiIrly4++ASb7cZrgf5Y7zav0D29/CRimIWmd
 Hin2CtuDEVswKeUUgS0eI98DDTjKrTfK6MR7abJDwnrROLPcCdulWxwN2/A0LvsRbbIb4HRCOZSIh
 vo3GeEog==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEFRZ-000fxI-73; Wed, 20 Jul 2022 21:33:13 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/5] drm/amd/display: move FPU code on dcn21 clk_mgr
Date: Wed, 20 Jul 2022 18:32:06 -0100
Message-Id: <20220720193208.1131493-4-mwen@igalia.com>
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

The -mno-gnu-attribute option in dcn21 clk mgr makefile hides a soft vs
hard fp error for powerpc. After removing this flag, we can see some FPU
code remains there:

/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses
hard float,
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o uses
soft float

Therefore, remove the -mno-gnu-attribute flag for dcn21/powerpc and move
FPU-associated code to DML folder.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |   6 -
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 234 +----------------
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h |   7 +
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 235 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   2 +
 5 files changed, 248 insertions(+), 236 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index a48453612d10..66dc02c426e9 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -107,12 +107,6 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN201)
 ###############################################################################
 CLK_MGR_DCN21 = rn_clk_mgr.o rn_clk_mgr_vbios_smu.o
 
-# prevent build errors regarding soft-float vs hard-float FP ABI tags
-# this code is currently unused on ppc64, as it applies to Renoir APUs only
-ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
-endif
-
 AMD_DAL_CLK_MGR_DCN21 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn21/,$(CLK_MGR_DCN21))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index cf1b5f354ae9..0202dc682682 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -26,10 +26,9 @@
 #include "dccg.h"
 #include "clk_mgr_internal.h"
 
-
 #include "dcn20/dcn20_clk_mgr.h"
 #include "rn_clk_mgr.h"
-
+#include "dml/dcn20/dcn20_fpu.h"
 
 #include "dce100/dce_clk_mgr.h"
 #include "rn_clk_mgr_vbios_smu.h"
@@ -45,7 +44,6 @@
 
 /* Constants */
 
-#define LPDDR_MEM_RETRAIN_LATENCY 4.977 /* Number obtained from LPDDR4 Training Counter Requirement doc */
 #define SMU_VER_55_51_0 0x373300 /* SMU Version that is able to set DISPCLK below 100MHz */
 
 /* Macros */
@@ -613,228 +611,6 @@ static struct clk_bw_params rn_bw_params = {
 
 };
 
-static struct wm_table ddr4_wm_table_gs = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 7.09,
-			.sr_enter_plus_exit_time_us = 8.14,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 10.12,
-			.sr_enter_plus_exit_time_us = 11.48,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 10.12,
-			.sr_enter_plus_exit_time_us = 11.48,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 10.12,
-			.sr_enter_plus_exit_time_us = 11.48,
-			.valid = true,
-		},
-	}
-};
-
-static struct wm_table lpddr4_wm_table_gs = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 5.32,
-			.sr_enter_plus_exit_time_us = 6.38,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.82,
-			.sr_enter_plus_exit_time_us = 11.196,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.89,
-			.sr_enter_plus_exit_time_us = 11.24,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.748,
-			.sr_enter_plus_exit_time_us = 11.102,
-			.valid = true,
-		},
-	}
-};
-
-static struct wm_table lpddr4_wm_table_with_disabled_ppt = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 8.32,
-			.sr_enter_plus_exit_time_us = 9.38,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.82,
-			.sr_enter_plus_exit_time_us = 11.196,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.89,
-			.sr_enter_plus_exit_time_us = 11.24,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.748,
-			.sr_enter_plus_exit_time_us = 11.102,
-			.valid = true,
-		},
-	}
-};
-
-static struct wm_table ddr4_wm_table_rn = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 11.90,
-			.sr_enter_plus_exit_time_us = 12.80,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.18,
-			.sr_enter_plus_exit_time_us = 14.30,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.18,
-			.sr_enter_plus_exit_time_us = 14.30,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.18,
-			.sr_enter_plus_exit_time_us = 14.30,
-			.valid = true,
-		},
-	}
-};
-
-static struct wm_table ddr4_1R_wm_table_rn = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.90,
-			.sr_enter_plus_exit_time_us = 14.80,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.90,
-			.sr_enter_plus_exit_time_us = 14.80,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.90,
-			.sr_enter_plus_exit_time_us = 14.80,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 13.90,
-			.sr_enter_plus_exit_time_us = 14.80,
-			.valid = true,
-		},
-	}
-};
-
-static struct wm_table lpddr4_wm_table_rn = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 7.32,
-			.sr_enter_plus_exit_time_us = 8.38,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.82,
-			.sr_enter_plus_exit_time_us = 11.196,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.89,
-			.sr_enter_plus_exit_time_us = 11.24,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 9.748,
-			.sr_enter_plus_exit_time_us = 11.102,
-			.valid = true,
-		},
-	}
-};
-
 static unsigned int find_socclk_for_voltage(struct dpm_clocks *clock_table, unsigned int voltage)
 {
 	int i;
@@ -914,12 +690,10 @@ static void rn_clk_mgr_helper_populate_bw_params(struct clk_bw_params *bw_params
 		/*
 		 * WM set D will be re-purposed for memory retraining
 		 */
-		bw_params->wm_table.entries[WM_D].pstate_latency_us = LPDDR_MEM_RETRAIN_LATENCY;
-		bw_params->wm_table.entries[WM_D].wm_inst = WM_D;
-		bw_params->wm_table.entries[WM_D].wm_type = WM_TYPE_RETRAINING;
-		bw_params->wm_table.entries[WM_D].valid = true;
+		DC_FP_START();
+		dcn21_clk_mgr_set_bw_params_wm_table(bw_params);
+		DC_FP_END();
 	}
-
 }
 
 void rn_clk_mgr_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
index e4322fa5475b..2e088c5171b2 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
@@ -29,6 +29,13 @@
 #include "clk_mgr.h"
 #include "dm_pp_smu.h"
 
+extern struct wm_table ddr4_wm_table_gs;
+extern struct wm_table lpddr4_wm_table_gs;
+extern struct wm_table lpddr4_wm_table_with_disabled_ppt;
+extern struct wm_table ddr4_wm_table_rn;
+extern struct wm_table ddr4_1R_wm_table_rn;
+extern struct wm_table lpddr4_wm_table_rn;
+
 struct rn_clk_registers {
 	uint32_t CLK1_CLK0_CURRENT_CNT; /* DPREFCLK */
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index dc60b835e938..eeeae52fe6fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -42,6 +42,9 @@
 #define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
 #endif
 
+/* Constant */
+#define LPDDR_MEM_RETRAIN_LATENCY 4.977 /* Number obtained from LPDDR4 Training Counter Requirement doc */
+
 /**
  * DOC: DCN2x FPU manipulation Overview
  *
@@ -650,6 +653,228 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
 	.num_states = 8
 };
 
+struct wm_table ddr4_wm_table_gs = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 7.09,
+			.sr_enter_plus_exit_time_us = 8.14,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+	}
+};
+
+struct wm_table lpddr4_wm_table_gs = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 5.32,
+			.sr_enter_plus_exit_time_us = 6.38,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.82,
+			.sr_enter_plus_exit_time_us = 11.196,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.89,
+			.sr_enter_plus_exit_time_us = 11.24,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.748,
+			.sr_enter_plus_exit_time_us = 11.102,
+			.valid = true,
+		},
+	}
+};
+
+struct wm_table lpddr4_wm_table_with_disabled_ppt = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 8.32,
+			.sr_enter_plus_exit_time_us = 9.38,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.82,
+			.sr_enter_plus_exit_time_us = 11.196,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.89,
+			.sr_enter_plus_exit_time_us = 11.24,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.748,
+			.sr_enter_plus_exit_time_us = 11.102,
+			.valid = true,
+		},
+	}
+};
+
+struct wm_table ddr4_wm_table_rn = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 11.90,
+			.sr_enter_plus_exit_time_us = 12.80,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.18,
+			.sr_enter_plus_exit_time_us = 14.30,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.18,
+			.sr_enter_plus_exit_time_us = 14.30,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.18,
+			.sr_enter_plus_exit_time_us = 14.30,
+			.valid = true,
+		},
+	}
+};
+
+struct wm_table ddr4_1R_wm_table_rn = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.90,
+			.sr_enter_plus_exit_time_us = 14.80,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.90,
+			.sr_enter_plus_exit_time_us = 14.80,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.90,
+			.sr_enter_plus_exit_time_us = 14.80,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 13.90,
+			.sr_enter_plus_exit_time_us = 14.80,
+			.valid = true,
+		},
+	}
+};
+
+struct wm_table lpddr4_wm_table_rn = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 7.32,
+			.sr_enter_plus_exit_time_us = 8.38,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.82,
+			.sr_enter_plus_exit_time_us = 11.196,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.89,
+			.sr_enter_plus_exit_time_us = 11.24,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.748,
+			.sr_enter_plus_exit_time_us = 11.102,
+			.valid = true,
+		},
+	}
+};
+
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
 					       struct resource_context *res_ctx,
 					       display_e2e_pipe_params_st *pipes)
@@ -2068,3 +2293,13 @@ void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 
 	dml_init_instance(&dc->dml, &dcn2_1_soc, &dcn2_1_ip, DML_PROJECT_DCN21);
 }
+
+void dcn21_clk_mgr_set_bw_params_wm_table(struct clk_bw_params *bw_params)
+{
+	dc_assert_fp_enabled();
+
+	bw_params->wm_table.entries[WM_D].pstate_latency_us = LPDDR_MEM_RETRAIN_LATENCY;
+	bw_params->wm_table.entries[WM_D].wm_inst = WM_D;
+	bw_params->wm_table.entries[WM_D].wm_type = WM_TYPE_RETRAINING;
+	bw_params->wm_table.entries[WM_D].valid = true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
index aa892193e485..a6e1ad0f38e9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
@@ -82,4 +82,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
 				 bool fast_validate);
 void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
 
+void dcn21_clk_mgr_set_bw_params_wm_table(struct clk_bw_params *bw_params);
+
 #endif /* __DCN20_FPU_H__ */
-- 
2.35.1

