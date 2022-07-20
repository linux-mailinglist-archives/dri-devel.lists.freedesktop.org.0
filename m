Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B557BEA4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B580A113CA0;
	Wed, 20 Jul 2022 19:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94302113B75;
 Wed, 20 Jul 2022 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aiCLfUd4x+v/sPSorz6ahzPNB6QcnOd1IfKWjk97/c=; b=l5eKnxWPlOlJRB7KS2HXmOR5Hj
 H2Swc7rNHWmydQw92/1KqS56XPKyhHHOs1Ui40H9DHJbyXr+s2xM8ff/+Bsee1b9/FHw/5SEljfo2
 fBanWhcBesO41+sTYNJ8QC8L2Its38GJtXYGcP0zZuPWOmgZMX233r/K2V5NVQgF1Bxk+Rn18AzBO
 WVSH2t59WcFuM6KN7aLhLXUqjT6d55uxgF1IdWeTCXLU3T83X0LiREmhDvbcLL8i21hA0/wlTXZac
 tlFlmlAoRja0NzMqjAP4U3+hmPruEM6OBwhcx2ye5TrdScw+19EvsugxXn9FaKy/4xnqCAcd7OCPJ
 3bf4KZDg==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEFRh-000fxI-Oj; Wed, 20 Jul 2022 21:33:21 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 5/5] drm/amd/display: move FPU code from dcn301 clk mgr to DML
 folder
Date: Wed, 20 Jul 2022 18:32:08 -0100
Message-Id: <20220720193208.1131493-6-mwen@igalia.com>
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

The -mno-gnu-attribute option in dcn301 clk mgr makefile hides a soft vs
hard fp error for powerpc. After removing this flag, we can see some FPU
code remains there:

gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses
hard float,
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
uses soft float

Therefore, remove the -mno-gnu-attribute flag for dcn301/powerpc and
move FPU-associated code to DML folder.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  6 --
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 86 ++-----------------
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.h    |  3 +
 .../amd/display/dc/dml/dcn301/dcn301_fpu.c    | 74 ++++++++++++++++
 4 files changed, 84 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 15b660a951a5..271d8e573181 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -123,12 +123,6 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
 ###############################################################################
 CLK_MGR_DCN301 = vg_clk_mgr.o dcn301_smu.o
 
-# prevent build errors regarding soft-float vs hard-float FP ABI tags
-# this code is currently unused on ppc64, as it applies to VanGogh APUs only
-ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn301/vg_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
-endif
-
 AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_DCN301))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
index f310b0d25a07..65f224af03c0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
@@ -32,6 +32,10 @@
 // For dcn20_update_clocks_update_dpp_dto
 #include "dcn20/dcn20_clk_mgr.h"
 
+// For DML FPU code
+#include "dml/dcn20/dcn20_fpu.h"
+#include "dml/dcn301/dcn301_fpu.h"
+
 #include "vg_clk_mgr.h"
 #include "dcn301_smu.h"
 #include "reg_helper.h"
@@ -526,81 +530,6 @@ static struct clk_bw_params vg_bw_params = {
 
 };
 
-static struct wm_table ddr4_wm_table = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 6.09,
-			.sr_enter_plus_exit_time_us = 7.14,
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
-static struct wm_table lpddr5_wm_table = {
-	.entries = {
-		{
-			.wm_inst = WM_A,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 13.5,
-			.sr_enter_plus_exit_time_us = 16.5,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_B,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 13.5,
-			.sr_enter_plus_exit_time_us = 16.5,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_C,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 13.5,
-			.sr_enter_plus_exit_time_us = 16.5,
-			.valid = true,
-		},
-		{
-			.wm_inst = WM_D,
-			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
-			.sr_exit_time_us = 13.5,
-			.sr_enter_plus_exit_time_us = 16.5,
-			.valid = true,
-		},
-	}
-};
-
-
 static unsigned int find_dcfclk_for_voltage(const struct vg_dpm_clocks *clock_table,
 		unsigned int voltage)
 {
@@ -670,10 +599,9 @@ static void vg_clk_mgr_helper_populate_bw_params(
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
 
 }
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
index 7255477307f1..75884f572989 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
@@ -29,6 +29,9 @@
 
 struct watermarks;
 
+extern struct wm_table ddr4_wm_table;
+extern struct wm_table lpddr5_wm_table;
+
 struct smu_watermark_set {
 	struct watermarks *wm_set;
 	union large_integer mc_address;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
index e4863f0bf0f6..7ef66e511ec8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
@@ -214,6 +214,80 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_01_soc = {
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
 };
 
+struct wm_table ddr4_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 6.09,
+			.sr_enter_plus_exit_time_us = 7.14,
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
+struct wm_table lpddr5_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 13.5,
+			.sr_enter_plus_exit_time_us = 16.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 13.5,
+			.sr_enter_plus_exit_time_us = 16.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 13.5,
+			.sr_enter_plus_exit_time_us = 16.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 13.5,
+			.sr_enter_plus_exit_time_us = 16.5,
+			.valid = true,
+		},
+	}
+};
+
 static void calculate_wm_set_for_vlevel(int vlevel,
 		struct wm_range_table_entry *table_entry,
 		struct dcn_watermarks *wm_set,
-- 
2.35.1

