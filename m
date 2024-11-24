Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA59D7062
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E90710E4C1;
	Sun, 24 Nov 2024 13:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t75rSsSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBCD10E4C1;
 Sun, 24 Nov 2024 13:33:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 536B35C4AB5;
 Sun, 24 Nov 2024 13:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA8DC4CECC;
 Sun, 24 Nov 2024 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455218;
 bh=AVfqViG6P+Iyv/IDqPP1fwUEIDmIvR2A05zk8aT2G6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t75rSsScKlrCVtcL6jl4I6q38YWDo90S4Gybf86NhDGYG9tlV4nzP5C3/TjJpkL+d
 ivFo5crwP8pJdDhlKkMS/BXGvVai+8RNcfHkhRKPyZqaNuxOOtdXBOM4Awul45zp1u
 xlagL/DDc+yjS7ra5cKPLCeeDSpoGE3ybeH3uIDfZgGheRXQsWci3V1F5AbWfCwiNw
 knr0OwUrOco+3i/w4B1fWw4CKgF8GQcqZVOiTSFZcuzoUv5sihUUKNp+WqZsiNIdkk
 WWK2KbC896RgiqGla7Eb03NPLlnHosS22HYN3lcGOpEV26FquFliMG8j/7s0TOxAHP
 GlisAYTRl2NaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, dzm91@hust.edu.cn,
 u202112078@hust.edu.cn, linux@treblig.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 017/107] drm/amd/display: Fix out-of-bounds
 access in 'dcn21_link_encoder_create'
Date: Sun, 24 Nov 2024 08:28:37 -0500
Message-ID: <20241124133301.3341829-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 63de35a8fcfca59ae8750d469a7eb220c7557baf ]

An issue was identified in the dcn21_link_encoder_create function where
an out-of-bounds access could occur when the hpd_source index was used
to reference the link_enc_hpd_regs array. This array has a fixed size
and the index was not being checked against the array's bounds before
accessing it.

This fix adds a conditional check to ensure that the hpd_source index is
within the valid range of the link_enc_hpd_regs array. If the index is
out of bounds, the function now returns NULL to prevent undefined
behavior.

References:

[   65.920507] ------------[ cut here ]------------
[   65.920510] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn21/dcn21_resource.c:1312:29
[   65.920519] index 7 is out of range for type 'dcn10_link_enc_hpd_registers [5]'
[   65.920523] CPU: 3 PID: 1178 Comm: modprobe Tainted: G           OE      6.8.0-cleanershaderfeatureresetasdntipmi200nv2132 #13
[   65.920525] Hardware name: AMD Majolica-RN/Majolica-RN, BIOS WMJ0429N_Weekly_20_04_2 04/29/2020
[   65.920527] Call Trace:
[   65.920529]  <TASK>
[   65.920532]  dump_stack_lvl+0x48/0x70
[   65.920541]  dump_stack+0x10/0x20
[   65.920543]  __ubsan_handle_out_of_bounds+0xa2/0xe0
[   65.920549]  dcn21_link_encoder_create+0xd9/0x140 [amdgpu]
[   65.921009]  link_create+0x6d3/0xed0 [amdgpu]
[   65.921355]  create_links+0x18a/0x4e0 [amdgpu]
[   65.921679]  dc_create+0x360/0x720 [amdgpu]
[   65.921999]  ? dmi_matches+0xa0/0x220
[   65.922004]  amdgpu_dm_init+0x2b6/0x2c90 [amdgpu]
[   65.922342]  ? console_unlock+0x77/0x120
[   65.922348]  ? dev_printk_emit+0x86/0xb0
[   65.922354]  dm_hw_init+0x15/0x40 [amdgpu]
[   65.922686]  amdgpu_device_init+0x26a8/0x33a0 [amdgpu]
[   65.922921]  amdgpu_driver_load_kms+0x1b/0xa0 [amdgpu]
[   65.923087]  amdgpu_pci_probe+0x1b7/0x630 [amdgpu]
[   65.923087]  local_pci_probe+0x4b/0xb0
[   65.923087]  pci_device_probe+0xc8/0x280
[   65.923087]  really_probe+0x187/0x300
[   65.923087]  __driver_probe_device+0x85/0x130
[   65.923087]  driver_probe_device+0x24/0x110
[   65.923087]  __driver_attach+0xac/0x1d0
[   65.923087]  ? __pfx___driver_attach+0x10/0x10
[   65.923087]  bus_for_each_dev+0x7d/0xd0
[   65.923087]  driver_attach+0x1e/0x30
[   65.923087]  bus_add_driver+0xf2/0x200
[   65.923087]  driver_register+0x64/0x130
[   65.923087]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
[   65.923087]  __pci_register_driver+0x61/0x70
[   65.923087]  amdgpu_init+0x7d/0xff0 [amdgpu]
[   65.923087]  do_one_initcall+0x49/0x310
[   65.923087]  ? kmalloc_trace+0x136/0x360
[   65.923087]  do_init_module+0x6a/0x270
[   65.923087]  load_module+0x1fce/0x23a0
[   65.923087]  init_module_from_file+0x9c/0xe0
[   65.923087]  ? init_module_from_file+0x9c/0xe0
[   65.923087]  idempotent_init_module+0x179/0x230
[   65.923087]  __x64_sys_finit_module+0x5d/0xa0
[   65.923087]  do_syscall_64+0x76/0x120
[   65.923087]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[   65.923087] RIP: 0033:0x7f2d80f1e88d
[   65.923087] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[   65.923087] RSP: 002b:00007ffc7bc1aa78 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   65.923087] RAX: ffffffffffffffda RBX: 0000564c9c1db130 RCX: 00007f2d80f1e88d
[   65.923087] RDX: 0000000000000000 RSI: 0000564c9c1e5480 RDI: 000000000000000f
[   65.923087] RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000002
[   65.923087] R10: 000000000000000f R11: 0000000000000246 R12: 0000564c9c1e5480
[   65.923087] R13: 0000564c9c1db260 R14: 0000000000000000 R15: 0000564c9c1e54b0
[   65.923087]  </TASK>
[   65.923927] ---[ end trace ]---

Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Roman Li <roman.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 347e6aaea582f..14b28841657d2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -1298,7 +1298,7 @@ static struct link_encoder *dcn21_link_encoder_create(
 		kzalloc(sizeof(struct dcn21_link_encoder), GFP_KERNEL);
 	int link_regs_id;
 
-	if (!enc21)
+	if (!enc21 || enc_init_data->hpd_source >= ARRAY_SIZE(link_enc_hpd_regs))
 		return NULL;
 
 	link_regs_id =
-- 
2.43.0

