Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276775E6C6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E796C10E247;
	Mon, 24 Jul 2023 01:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7115D10E245;
 Mon, 24 Jul 2023 01:23:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE0CD60E9C;
 Mon, 24 Jul 2023 01:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C3AC433C7;
 Mon, 24 Jul 2023 01:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161782;
 bh=BiTMSXI9KdRxa9YYU67peBK//OlQrgZWHgUTs04Hqng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q+Q5X6tFzWhGvE0139UMQooXr1rk8kpw/DrdANm5VhPWbyiDwGr+iY0g4sAiMXoGs
 BXdPb/FED9+qQTzT4vEN33EtAzOqy4vn/gIT01dl8ExSqhF40L5O2+ERru6yo39TXQ
 7MuFNZ5bAAgzl+6EZUdK1fiwp599vNjh7f82gTtD7xJEzd0WYZqb1mN1jW5hl3eQpp
 qC0pGxB567dmbafR6FvRfjV9wBYli77x7aJvSZiHg++knjZ7FDJDqpLfQnEabj3z3s
 uRg7MZIhxTZyGynYua+McIJsfa0ZnCC5tWeK22P5Ay82gEUWTOWkJlGhzl3+O+7HUT
 uRlg45BvR0aZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 28/41] Revert "drm/amd/display: Do not set drr on
 pipe commit"
Date: Sun, 23 Jul 2023 21:21:01 -0400
Message-Id: <20230724012118.2316073-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Sasha Levin <sashal@kernel.org>, Dmytro.Laktyushkin@amd.com,
 dri-devel@lists.freedesktop.org, Wesley.Chalmers@amd.com, sunpeng.li@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, hugo.hu@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

[ Upstream commit 8e1b45c578b799510f9a01a9745a737e74f43cb1 ]

This reverts commit 474f01015ffdb74e01c2eb3584a2822c64e7b2be.

Caused a regression:

Samsung Odyssey Neo G9, running at 5120x1440@240/VRR, connected to Navi
21 via DisplayPort, blanks and the GPU hangs while starting the Steam
game Assetto Corsa Competizione (via Proton 7.0).

Example dmesg excerpt:

 amdgpu 0000:0c:00.0: [drm] ERROR [CRTC:82:crtc-0] flip_done timed out
 NMI watchdog: Watchdog detected hard LOCKUP on cpu 6
 [...]
 RIP: 0010:amdgpu_device_rreg.part.0+0x2f/0xf0 [amdgpu]
 Code: 41 54 44 8d 24 b5 00 00 00 00 55 89 f5 53 48 89 fb 4c 3b a7 60 0b 00 00 73 6a 83 e2 02 74 29 4c 03 a3 68 0b 00 00 45 8b 24 24 <48> 8b 43 08 0f b7 70 3e 66 90 44 89 e0 5b 5d 41 5c 31 d2 31 c9 31
 RSP: 0000:ffffb39a119dfb88 EFLAGS: 00000086
 RAX: ffffffffc0eb96a0 RBX: ffff9e7963dc0000 RCX: 0000000000007fff
 RDX: 0000000000000000 RSI: 0000000000004ff6 RDI: ffff9e7963dc0000
 RBP: 0000000000004ff6 R08: ffffb39a119dfc40 R09: 0000000000000010
 R10: ffffb39a119dfc40 R11: ffffb39a119dfc44 R12: 00000000000e05ae
 R13: 0000000000000000 R14: ffff9e7963dc0010 R15: 0000000000000000
 FS:  000000001012f6c0(0000) GS:ffff9e805eb80000(0000) knlGS:000000007fd40000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00000000461ca000 CR3: 00000002a8a20000 CR4: 0000000000350ee0
 Call Trace:
  <TASK>
  dm_read_reg_func+0x37/0xc0 [amdgpu]
  generic_reg_get2+0x22/0x60 [amdgpu]
  optc1_get_crtc_scanoutpos+0x6a/0xc0 [amdgpu]
  dc_stream_get_scanoutpos+0x74/0x90 [amdgpu]
  dm_crtc_get_scanoutpos+0x82/0xf0 [amdgpu]
  amdgpu_display_get_crtc_scanoutpos+0x91/0x190 [amdgpu]
  ? dm_read_reg_func+0x37/0xc0 [amdgpu]
  amdgpu_get_vblank_counter_kms+0xb4/0x1a0 [amdgpu]
  dm_pflip_high_irq+0x213/0x2f0 [amdgpu]
  amdgpu_dm_irq_handler+0x8a/0x200 [amdgpu]
  amdgpu_irq_dispatch+0xd4/0x220 [amdgpu]
  amdgpu_ih_process+0x7f/0x110 [amdgpu]
  amdgpu_irq_handler+0x1f/0x70 [amdgpu]
  __handle_irq_event_percpu+0x46/0x1b0
  handle_irq_event+0x34/0x80
  handle_edge_irq+0x9f/0x240
  __common_interrupt+0x66/0x110
  common_interrupt+0x5c/0xd0
  asm_common_interrupt+0x22/0x40

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 6 ------
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 7 -------
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 7ff4a308152a0..2d49e99a152c4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2021,12 +2021,6 @@ void dcn20_optimize_bandwidth(
 	if (hubbub->funcs->program_compbuf_size)
 		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, true);
 
-	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
-		dc_dmub_srv_p_state_delegate(dc,
-			true, context);
-		context->bw_ctx.bw.dcn.clk.p_state_change_support = true;
-	}
-
 	dc->clk_mgr->funcs->update_clocks(
 			dc->clk_mgr,
 			context,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index c97d3e81a83d2..a1b312483d7f1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -987,18 +987,11 @@ void dcn30_set_disp_pattern_generator(const struct dc *dc,
 void dcn30_prepare_bandwidth(struct dc *dc,
  	struct dc_state *context)
 {
-	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
-		dc->optimized_required = true;
-		context->bw_ctx.bw.dcn.clk.p_state_change_support = false;
-	}
-
 	if (dc->clk_mgr->dc_mode_softmax_enabled)
 		if (dc->clk_mgr->clks.dramclk_khz <= dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000 &&
 				context->bw_ctx.bw.dcn.clk.dramclk_khz > dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000)
 			dc->clk_mgr->funcs->set_max_memclk(dc->clk_mgr, dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
 
 	dcn20_prepare_bandwidth(dc, context);
-
-	dc_dmub_srv_p_state_delegate(dc, false, context);
 }
 
-- 
2.39.2

