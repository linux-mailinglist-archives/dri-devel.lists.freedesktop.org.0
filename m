Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39545E9641
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 23:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD6510E294;
	Sun, 25 Sep 2022 21:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E51410E294
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 21:53:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s6so8097733lfo.7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 14:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yQ+lfhRR2bAbJqjtfC3UV79L4Vh7W/BYSyQmB8xGYmg=;
 b=bMotQ7pG4vHGInI6+u0VLMlf0V9e9usU61BPZ889xoX0tpOm31ooV/0wVi57MX7Vlk
 bR3A7hMHxaO2QbqTT9ZIAHArEra3dy1w62OBtC5sx1keKjMkocA9u8LEEN1wohb1qHPM
 xL4M0YETyCroDaNH9KlpF2EalOsgbH8A5GGMQPjbSQbxWptY5LsCTc8BqbpodpVzzP3B
 AbjtvKD0uRCk2/JCz5c2tbA5EeV2rmZPkwaOPfAEG6dram0QqStJC1i3FMTip/AVwuCi
 w2QzSgBp1D3PXw3EUtZAzAFFYoWTyo6rC87QxnHhF7hLw1mEjOMTFt8QgsJPtVkftKmr
 ++Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yQ+lfhRR2bAbJqjtfC3UV79L4Vh7W/BYSyQmB8xGYmg=;
 b=Nsz6lm9GZj7mDzeG6PB271wuMo2qEkjmLd9FmEywmDnAAwco7zZd4nMtvo1JnkP8Yw
 n5zUGIJXQbhbv6YmXVxpXIp3NEC37awglVIiVHmvbYg/EkXRPHO8ruqeqiFtDx+G//mx
 w78pd69zJBS/f45nC1Lder+kGGKdjPXBFVOkJlV5XRVvMCgTNfjwCkZJdZptvKTV0pC7
 yxu8MncTZG0U+dDHMIFWTX3vbOrVQWNB33YbntRUqWprE8pxxuPcQEFCS6JfJOkpqa/2
 S4zKsuv2Gb+hdvHYG5YLmx9F8j0kQ46sYMwMDslQpVjVT5qMqfoniDqd+6qzgosnQR3s
 d7lA==
X-Gm-Message-State: ACrzQf2uv4DuhvJLjekw9g+/EkPFokXX5btMtjJ4BPiBGu8KOuguYa+3
 fsXwPu3QcD0wOJd9/16zfkgrzA==
X-Google-Smtp-Source: AMsMyM5UoKpma0p9XuNN0qhnrD7JEoJzExaFNAlsbMCiWoMA3L6/fIcK2g69WM1EsQ5bhB9Gv8lmBg==
X-Received: by 2002:a05:6512:6c7:b0:49f:5491:3330 with SMTP id
 u7-20020a05651206c700b0049f54913330mr7582623lff.197.1664142803312; 
 Sun, 25 Sep 2022 14:53:23 -0700 (PDT)
Received: from localhost.localdomain (188-177-43-54-cable.dk.customer.tdc.net.
 [188.177.43.54]) by smtp.gmail.com with ESMTPSA id
 c12-20020ac2530c000000b004a054efd0cdsm1121867lfh.36.2022.09.25.14.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 14:53:22 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: 
Subject: [PATCH] drm/amd/display: Fix mutex lock in dcn10
Date: Sun, 25 Sep 2022 23:53:13 +0200
Message-Id: <20220925215320.644169-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <b21aa2e6-1b47-cdc1-307c-21fb331d4afb@amd.com>
References: <b21aa2e6-1b47-cdc1-307c-21fb331d4afb@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yi-Ling Chen <Yi-Ling.Chen2@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 Daniel Gomez <daniel@qtec.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Ahmad Othman <Ahmad.Othman@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Duncan Ma <duncan.ma@amd.com>,
 Becle Lee <becle.lee@amd.com>, Melissa Wen <mwen@igalia.com>, dagmcr@gmail.com,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>,
 Sung Joon Kim <Sungjoon.Kim@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 Roman Li <Roman.Li@amd.com>, Bernard Zhao <bernard@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removal of DC_FP_* wrappers from dml (9696679bf7ac) provokes a mutex
lock [2] on the amdgpu driver. Re-arrange the dcn10 code to avoid
locking the mutex by placing the DC_FP_* wrappers around the proper
functions.

This fixes the following WARN/stacktrace:

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 227, name: systemd-udevd
preempt_count: 1, expected: 0
CPU: 4 PID: 227 Comm: systemd-udevd Not tainted 6.0.0-rc6-qtec-standard #2
Hardware name: Qtechnology A/S QT5222/QT5221, BIOS v1.0.1 06/07/2021
Call Trace:
 <TASK>
 dump_stack_lvl+0x33/0x42
 __might_resched.cold.172+0xa5/0xb3
 mutex_lock+0x1a/0x40
 amdgpu_dpm_get_clock_by_type_with_voltage+0x38/0x70 [amdgpu]
 dm_pp_get_clock_levels_by_type_with_voltage+0x64/0xa0 [amdgpu]
 dcn_bw_update_from_pplib+0x70/0x340 [amdgpu]
 dcn10_create_resource_pool+0x8c8/0xd20 [amdgpu]
 ? __kmalloc+0x1c7/0x4a0
 dc_create_resource_pool+0xe7/0x190 [amdgpu]
 dc_create+0x212/0x5d0 [amdgpu]
 amdgpu_dm_init+0x246/0x370 [amdgpu]
 ? schedule_hrtimeout_range_clock+0x93/0x120
 ? phm_wait_for_register_unequal.part.1+0x4a/0x80 [amdgpu]
 dm_hw_init+0xe/0x20 [amdgpu]
 amdgpu_device_init.cold.56+0x1324/0x1653 [amdgpu]
 ? pci_bus_read_config_word+0x43/0x80
 amdgpu_driver_load_kms+0x15/0x120 [amdgpu]
 amdgpu_pci_probe+0x116/0x320 [amdgpu]
 pci_device_probe+0x97/0x110
 really_probe+0xdd/0x340
 __driver_probe_device+0x80/0x170
 driver_probe_device+0x1f/0x90
 __driver_attach+0xdc/0x180
 ? __device_attach_driver+0x100/0x100
 ? __device_attach_driver+0x100/0x100
 bus_for_each_dev+0x74/0xc0
 bus_add_driver+0x19e/0x210
 ? kset_find_obj+0x30/0xa0
 ? 0xffffffffa0a5b000
 driver_register+0x6b/0xc0
 ? 0xffffffffa0a5b000
 do_one_initcall+0x4a/0x1f0
 ? __vunmap+0x28e/0x2f0
 ? __cond_resched+0x15/0x30
 ? kmem_cache_alloc_trace+0x3d/0x440
 do_init_module+0x4a/0x1e0
 load_module+0x1cba/0x1e10
 ? __do_sys_finit_module+0xb7/0x120
 __do_sys_finit_module+0xb7/0x120
 do_syscall_64+0x3c/0x80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff2b5f5422d
Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>
3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 ab 0e 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc44ab28e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 0000555c566a9240 RCX: 00007ff2b5f5422d
RDX: 0000000000000000 RSI: 00007ff2b60bb353 RDI: 0000000000000019
RBP: 00007ff2b60bb353 R08: 0000000000000000 R09: 0000555c566a9240
R10: 0000000000000019 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000020000 R14: 0000000000000000 R15: 0000000000000000
</TASK>

Fixes: 9696679bf7ac ("drm/amd/display: remove DC_FP_* wrapper from
dml folder")
Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  12 +-
 .../drm/amd/display/dc/dcn10/dcn10_resource.c |  66 +++++++++-
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 118 ++++++++----------
 .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |  19 ++-
 4 files changed, 138 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 5b5d952b2b8c..cb1e06d62841 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2994,6 +2994,7 @@ void dcn10_prepare_bandwidth(
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	struct hubbub *hubbub = dc->res_pool->hubbub;
+	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
 
 	if (dc->debug.sanity_checks)
 		hws->funcs.verify_allow_pstate_change_high(dc);
@@ -3016,8 +3017,11 @@ void dcn10_prepare_bandwidth(
 
 	if (dc->debug.pplib_wm_report_mode == WM_REPORT_OVERRIDE) {
 		DC_FP_START();
-		dcn_bw_notify_pplib_of_wm_ranges(dc);
+		dcn_get_soc_clks(
+			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
 		DC_FP_END();
+		dcn_bw_notify_pplib_of_wm_ranges(
+			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
 	}
 
 	if (dc->debug.sanity_checks)
@@ -3030,6 +3034,7 @@ void dcn10_optimize_bandwidth(
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	struct hubbub *hubbub = dc->res_pool->hubbub;
+	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
 
 	if (dc->debug.sanity_checks)
 		hws->funcs.verify_allow_pstate_change_high(dc);
@@ -3053,8 +3058,11 @@ void dcn10_optimize_bandwidth(
 
 	if (dc->debug.pplib_wm_report_mode == WM_REPORT_OVERRIDE) {
 		DC_FP_START();
-		dcn_bw_notify_pplib_of_wm_ranges(dc);
+		dcn_get_soc_clks(
+			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
 		DC_FP_END();
+		dcn_bw_notify_pplib_of_wm_ranges(
+			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
 	}
 
 	if (dc->debug.sanity_checks)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 174eebbe8b4f..a18a5b56ca7d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -1336,6 +1336,21 @@ static noinline void dcn10_resource_construct_fp(
 	}
 }
 
+static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clks)
+{
+	int i;
+
+	if (clks->num_levels == 0)
+		return false;
+
+	for (i = 0; i < clks->num_levels; i++)
+		/* Ensure that the result is sane */
+		if (clks->data[i].clocks_in_khz == 0)
+			return false;
+
+	return true;
+}
+
 static bool dcn10_resource_construct(
 	uint8_t num_virtual_links,
 	struct dc *dc,
@@ -1345,6 +1360,9 @@ static bool dcn10_resource_construct(
 	int j;
 	struct dc_context *ctx = dc->ctx;
 	uint32_t pipe_fuses = read_pipe_fuses(ctx);
+	struct dm_pp_clock_levels_with_voltage fclks = {0}, dcfclks = {0};
+	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
+	bool res;
 
 	ctx->dc_bios->regs = &bios_regs;
 
@@ -1505,15 +1523,53 @@ static bool dcn10_resource_construct(
 			&& pool->base.pp_smu->rv_funcs.set_pme_wa_enable != NULL)
 		dc->debug.az_endpoint_mute_only = false;
 
-	DC_FP_START();
-	if (!dc->debug.disable_pplib_clock_request)
-		dcn_bw_update_from_pplib(dc);
+
+	if (!dc->debug.disable_pplib_clock_request) {
+		/*
+		 * TODO: This is not the proper way to obtain
+		 * fabric_and_dram_bandwidth, should be min(fclk, memclk).
+		 */
+		res = dm_pp_get_clock_levels_by_type_with_voltage(
+				ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
+
+		DC_FP_START();
+
+		if (res)
+			res = verify_clock_values(&fclks);
+
+		if (res)
+			dcn_bw_update_from_pplib_fclks(dc, &fclks);
+		else
+			BREAK_TO_DEBUGGER();
+
+		DC_FP_END();
+
+		res = dm_pp_get_clock_levels_by_type_with_voltage(
+			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
+
+		DC_FP_START();
+
+		if (res)
+			res = verify_clock_values(&dcfclks);
+
+		if (res)
+			dcn_bw_update_from_pplib_dcfclks(dc, &dcfclks);
+		else
+			BREAK_TO_DEBUGGER();
+
+		DC_FP_END();
+	}
+
 	dcn_bw_sync_calcs_and_dml(dc);
 	if (!dc->debug.disable_pplib_wm_range) {
 		dc->res_pool = &pool->base;
-		dcn_bw_notify_pplib_of_wm_ranges(dc);
+		DC_FP_START();
+		dcn_get_soc_clks(
+			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
+		DC_FP_END();
+		dcn_bw_notify_pplib_of_wm_ranges(
+			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
 	}
-	DC_FP_END();
 
 	{
 		struct irq_service_init_data init_data;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
index db3b16b77034..7d3394470352 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
@@ -1464,81 +1464,67 @@ unsigned int dcn_find_dcfclk_suits_all(
 	return dcf_clk;
 }
 
-static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clks)
+void dcn_bw_update_from_pplib_fclks(
+	struct dc *dc,
+	struct dm_pp_clock_levels_with_voltage *fclks)
 {
-	int i;
-
-	if (clks->num_levels == 0)
-		return false;
-
-	for (i = 0; i < clks->num_levels; i++)
-		/* Ensure that the result is sane */
-		if (clks->data[i].clocks_in_khz == 0)
-			return false;
+	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
 
-	return true;
+	ASSERT(fclks->num_levels);
+
+	vmin0p65_idx = 0;
+	vmid0p72_idx = fclks->num_levels -
+		(fclks->num_levels > 2 ? 3 : (fclks->num_levels > 1 ? 2 : 1));
+	vnom0p8_idx = fclks->num_levels - (fclks->num_levels > 1 ? 2 : 1);
+	vmax0p9_idx = fclks->num_levels - 1;
+
+	dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 =
+		32 * (fclks->data[vmin0p65_idx].clocks_in_khz / 1000.0) / 1000.0;
+	dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 =
+		dc->dcn_soc->number_of_channels *
+		(fclks->data[vmid0p72_idx].clocks_in_khz / 1000.0)
+		* ddr4_dram_factor_single_Channel / 1000.0;
+	dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 =
+		dc->dcn_soc->number_of_channels *
+		(fclks->data[vnom0p8_idx].clocks_in_khz / 1000.0)
+		* ddr4_dram_factor_single_Channel / 1000.0;
+	dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 =
+		dc->dcn_soc->number_of_channels *
+		(fclks->data[vmax0p9_idx].clocks_in_khz / 1000.0)
+		* ddr4_dram_factor_single_Channel / 1000.0;
 }
 
-void dcn_bw_update_from_pplib(struct dc *dc)
+void dcn_bw_update_from_pplib_dcfclks(
+	struct dc *dc,
+	struct dm_pp_clock_levels_with_voltage *dcfclks)
 {
-	struct dc_context *ctx = dc->ctx;
-	struct dm_pp_clock_levels_with_voltage fclks = {0}, dcfclks = {0};
-	bool res;
-	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
-
-	/* TODO: This is not the proper way to obtain fabric_and_dram_bandwidth, should be min(fclk, memclk) */
-	res = dm_pp_get_clock_levels_by_type_with_voltage(
-			ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
-
-	if (res)
-		res = verify_clock_values(&fclks);
-
-	if (res) {
-		ASSERT(fclks.num_levels);
-
-		vmin0p65_idx = 0;
-		vmid0p72_idx = fclks.num_levels -
-			(fclks.num_levels > 2 ? 3 : (fclks.num_levels > 1 ? 2 : 1));
-		vnom0p8_idx = fclks.num_levels - (fclks.num_levels > 1 ? 2 : 1);
-		vmax0p9_idx = fclks.num_levels - 1;
-
-		dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 =
-			32 * (fclks.data[vmin0p65_idx].clocks_in_khz / 1000.0) / 1000.0;
-		dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 =
-			dc->dcn_soc->number_of_channels *
-			(fclks.data[vmid0p72_idx].clocks_in_khz / 1000.0)
-			* ddr4_dram_factor_single_Channel / 1000.0;
-		dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 =
-			dc->dcn_soc->number_of_channels *
-			(fclks.data[vnom0p8_idx].clocks_in_khz / 1000.0)
-			* ddr4_dram_factor_single_Channel / 1000.0;
-		dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 =
-			dc->dcn_soc->number_of_channels *
-			(fclks.data[vmax0p9_idx].clocks_in_khz / 1000.0)
-			* ddr4_dram_factor_single_Channel / 1000.0;
-	} else
-		BREAK_TO_DEBUGGER();
-
-	res = dm_pp_get_clock_levels_by_type_with_voltage(
-			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
-
-	if (res)
-		res = verify_clock_values(&dcfclks);
+	if (dcfclks->num_levels >= 3) {
+		dc->dcn_soc->dcfclkv_min0p65 = dcfclks->data[0].clocks_in_khz / 1000.0;
+		dc->dcn_soc->dcfclkv_mid0p72 = dcfclks->data[dcfclks->num_levels - 3].clocks_in_khz / 1000.0;
+		dc->dcn_soc->dcfclkv_nom0p8 = dcfclks->data[dcfclks->num_levels - 2].clocks_in_khz / 1000.0;
+		dc->dcn_soc->dcfclkv_max0p9 = dcfclks->data[dcfclks->num_levels - 1].clocks_in_khz / 1000.0;
+	}
+}
 
-	if (res && dcfclks.num_levels >= 3) {
-		dc->dcn_soc->dcfclkv_min0p65 = dcfclks.data[0].clocks_in_khz / 1000.0;
-		dc->dcn_soc->dcfclkv_mid0p72 = dcfclks.data[dcfclks.num_levels - 3].clocks_in_khz / 1000.0;
-		dc->dcn_soc->dcfclkv_nom0p8 = dcfclks.data[dcfclks.num_levels - 2].clocks_in_khz / 1000.0;
-		dc->dcn_soc->dcfclkv_max0p9 = dcfclks.data[dcfclks.num_levels - 1].clocks_in_khz / 1000.0;
-	} else
-		BREAK_TO_DEBUGGER();
+void dcn_get_soc_clks(
+	struct dc *dc,
+	int *min_fclk_khz,
+	int *min_dcfclk_khz,
+	int *socclk_khz)
+{
+	*min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
+	*min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
+	*socclk_khz = dc->dcn_soc->socclk * 1000;
 }
 
-void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
+void dcn_bw_notify_pplib_of_wm_ranges(
+	struct dc *dc,
+	int min_fclk_khz,
+	int min_dcfclk_khz,
+	int socclk_khz)
 {
 	struct pp_smu_funcs_rv *pp = NULL;
 	struct pp_smu_wm_range_sets ranges = {0};
-	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
 	const int overdrive = 5000000; /* 5 GHz to cover Overdrive */
 
 	if (dc->res_pool->pp_smu)
@@ -1546,10 +1532,6 @@ void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
 	if (!pp || !pp->set_wm_ranges)
 		return;
 
-	min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
-	min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
-	socclk_khz = dc->dcn_soc->socclk * 1000;
-
 	/* Now notify PPLib/SMU about which Watermarks sets they should select
 	 * depending on DPM state they are in. And update BW MGR GFX Engine and
 	 * Memory clock member variables for Watermarks calculations for each
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
index 806f3041db14..9e4ddc985240 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
@@ -628,8 +628,23 @@ unsigned int dcn_find_dcfclk_suits_all(
 	const struct dc *dc,
 	struct dc_clocks *clocks);
 
-void dcn_bw_update_from_pplib(struct dc *dc);
-void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc);
+void dcn_get_soc_clks(
+		struct dc *dc,
+		int *min_fclk_khz,
+		int *min_dcfclk_khz,
+		int *socclk_khz);
+
+void dcn_bw_update_from_pplib_fclks(
+		struct dc *dc,
+		struct dm_pp_clock_levels_with_voltage *fclks);
+void dcn_bw_update_from_pplib_dcfclks(
+		struct dc *dc,
+		struct dm_pp_clock_levels_with_voltage *dcfclks);
+void dcn_bw_notify_pplib_of_wm_ranges(
+		struct dc *dc,
+		int min_fclk_khz,
+		int min_dcfclk_khz,
+		int socclk_khz);
 void dcn_bw_sync_calcs_and_dml(struct dc *dc);
 
 enum source_macro_tile_size swizzle_mode_to_macro_tile_size(enum swizzle_mode_values sw_mode);
-- 
2.35.1

