Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E970E5E7CB3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F9F10E574;
	Fri, 23 Sep 2022 14:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9A410E594
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:17:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a41so431465edf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UIbyRt/2hWXP75+auGQPO08v5iAXBofhMAPo6YTUSuE=;
 b=DCh6DTm3dTnmhFuz1AxVt+/Hf0Vj9pZbLB8HWXquhcamS2npe70kwCziymZUbQGNAV
 D2Rs5zULVze5BuGBXVUCZIPkyxq5OoefKZ8Aoje+V8lQyyOtWCYIdP8MSi+6XXtefCfK
 wfPWxReLV74vNlFHGXLYWzzXyJEMukTaX5jjULcBwENBb9ZK7wg16V0YnoPKJOIsrkbt
 wU9TiR+Af91SJVDTsNkQd4VCXMciemDrTKcF3j6I05HUL+6HD5GtIDSdVDRIwPj8BdDH
 gOgFOLGgDUZIdgSuJJbQD8QT8j5us/4cZag0DyEEqs51jec60dm1v/Fm5iqYlGQN9N3Y
 dxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UIbyRt/2hWXP75+auGQPO08v5iAXBofhMAPo6YTUSuE=;
 b=qZXREB9aZzjHfVDeTFdCrQq5da7jMkBh7FOw6RKUq8QJUFtvPj8dR6ZpcmEOHb1pI9
 7BL0oOCbJuDddISxjW8ElGXIDyvQSrV7UEDhsNLJBYLnfnjR9G/MM4j8LEED+4bqkKRz
 iowAjhZDTQnyUial659keDjcMtwEiUbYy77R0dfgupGBWAZnQAy8MRbJrOpK33zp2YXL
 jcv96ztDebcDL9BzGQv3Pkb+7pdM58m50VUtp/qsAEMzW1GOnA0WXCfZPYq3KLGkAwPZ
 /zffN6W4kW5vIXj95gS8FPrX+xstCne0kCSMWgWRIk4MmqrclIsfa8SPqE5aZfc1qLFQ
 9eaQ==
X-Gm-Message-State: ACrzQf2LYZItLemP7znOo2XpCj7SKj5O/dP23PUGzbwqPTFtubJMeDJm
 vRlrCllnghmKsxzYzofl+aSFoQ==
X-Google-Smtp-Source: AMsMyM5NGNo9Lo1ijc28YrZjiuN2uwqRWJDXjoxxPzsYB0tIsz6bEtT7ZOtW4epyg/UFf6H+D1hVWw==
X-Received: by 2002:a05:6402:3596:b0:450:c4d9:a04b with SMTP id
 y22-20020a056402359600b00450c4d9a04bmr8746426edc.218.1663942651526; 
 Fri, 23 Sep 2022 07:17:31 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18]) by smtp.gmail.com with ESMTPSA id
 e26-20020a1709062c1a00b00722e50dab2csm4071384ejh.109.2022.09.23.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 07:17:30 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: 
Subject: [RFC][PATCH] drm/amd/display: Restore DC_FP_* wrapper in dml/calcs
Date: Fri, 23 Sep 2022 16:17:21 +0200
Message-Id: <20220923141725.436141-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Becle Lee <becle.lee@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@linux.ie>, Isabella Basso <isabbasso@riseup.net>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dagmcr@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Gomez <daniel@qtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit [1] removes DC_FP_* wrappers from dml. However, this generates
the BUG [2] on the amdgpu driver. Restore DC_FP_* wrappers in dml/calcs
but only for the functions dcn_bw_update_from_pplib and
dcn_bw_notify_pplib_of_wm_ranges.

[1] 9696679bf7ac40a8fb6a488a75bd66d4414cd3c3 drm/amd/display: remove
DC_FP_* wrapper from dml folder

[2] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:283

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

Hi,

The patch [1] introduces BUG [2] since linux 5.18. The reason seems to be
wrapping entirely the functions dcn_bw_update_from_pplib and
dcn_bw_notify_pplib_of_wm_ranges in the dcn10.

On dcn_bw_update_from_pplib function the problem seems to be the
dm_pp_get_clock_levels_by_type_with_voltage call.

Any suggestions on what should we do here?

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
Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 ab 0e 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc44ab28e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 0000555c566a9240 RCX: 00007ff2b5f5422d
RDX: 0000000000000000 RSI: 00007ff2b60bb353 RDI: 0000000000000019
RBP: 00007ff2b60bb353 R08: 0000000000000000 R09: 0000555c566a9240
R10: 0000000000000019 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000020000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c |  2 --
 drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 10 ++++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 174eebbe8b4f..a6ef20b43f3a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -1505,7 +1505,6 @@ static bool dcn10_resource_construct(
 			&& pool->base.pp_smu->rv_funcs.set_pme_wa_enable != NULL)
 		dc->debug.az_endpoint_mute_only = false;

-	DC_FP_START();
 	if (!dc->debug.disable_pplib_clock_request)
 		dcn_bw_update_from_pplib(dc);
 	dcn_bw_sync_calcs_and_dml(dc);
@@ -1513,7 +1512,6 @@ static bool dcn10_resource_construct(
 		dc->res_pool = &pool->base;
 		dcn_bw_notify_pplib_of_wm_ranges(dc);
 	}
-	DC_FP_END();

 	{
 		struct irq_service_init_data init_data;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
index db3b16b77034..a3c71d875adb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
@@ -1490,6 +1490,8 @@ void dcn_bw_update_from_pplib(struct dc *dc)
 	res = dm_pp_get_clock_levels_by_type_with_voltage(
 			ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);

+	DC_FP_START();
+
 	if (res)
 		res = verify_clock_values(&fclks);

@@ -1519,9 +1521,13 @@ void dcn_bw_update_from_pplib(struct dc *dc)
 	} else
 		BREAK_TO_DEBUGGER();

+	DC_FP_END();
+
 	res = dm_pp_get_clock_levels_by_type_with_voltage(
 			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);

+	DC_FP_START();
+
 	if (res)
 		res = verify_clock_values(&dcfclks);

@@ -1532,6 +1538,8 @@ void dcn_bw_update_from_pplib(struct dc *dc)
 		dc->dcn_soc->dcfclkv_max0p9 = dcfclks.data[dcfclks.num_levels - 1].clocks_in_khz / 1000.0;
 	} else
 		BREAK_TO_DEBUGGER();
+
+	DC_FP_END();
 }

 void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
@@ -1546,9 +1554,11 @@ void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
 	if (!pp || !pp->set_wm_ranges)
 		return;

+	DC_FP_START();
 	min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
 	min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
 	socclk_khz = dc->dcn_soc->socclk * 1000;
+	DC_FP_END();

 	/* Now notify PPLib/SMU about which Watermarks sets they should select
 	 * depending on DPM state they are in. And update BW MGR GFX Engine and
--
2.35.1

