Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2375E5FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5425A10E080;
	Mon, 24 Jul 2023 01:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B92C10E06C;
 Mon, 24 Jul 2023 01:13:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D3D260C7A;
 Mon, 24 Jul 2023 01:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFC4C433C8;
 Mon, 24 Jul 2023 01:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161222;
 bh=NB4yiJ9qkY/g2r6LSCdH7+plADVlnL6WqvZB92EzA00=;
 h=From:To:Cc:Subject:Date:From;
 b=ddMq54MI6Q8d4EP1haxxKduHhNJMnJ077O9D6NZvnIMIkusTb0mDoHlMWQPZTH5/U
 DP83Xg8yjC7gYrhQUtY4g4mrcRCWB6JkWSKhK2v8myRkwapPMi2Hp24uTWsZg/MXkK
 19Zm3oUzAjYz+J750bUcTJq3vUaEe3H/qcPrmQxY8zyEDJX6AKM0ZG6E3gM88aiCpM
 VIeByBGRK4Zaom+VcgyHo22pJ3h3YUQybxZwDoJMJsyubVTzu/R2XczGKAcQDwHTDj
 cBOaDoTCgjD26/7/GwSFcgSyQd7rlUUx9YjyM7/vL8LeLEK3arWObxweAs8fKbGvpb
 /PLNlqWDOtMXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 01/58] drm/amd/display: Do not set drr on pipe
 commit
Date: Sun, 23 Jul 2023 21:12:29 -0400
Message-Id: <20230724011338.2298062-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 jun.lei@amd.com, Sasha Levin <sashal@kernel.org>, Josip.Pavic@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 alvin.lee2@amd.com, sunpeng.li@amd.com, mwen@igalia.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, hanghong.ma@amd.com,
 sungjoon.kim@amd.com, Dillon.Varone@amd.com,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wesley Chalmers <Wesley.Chalmers@amd.com>

[ Upstream commit e101bf95ea87ccc03ac2f48dfc0757c6364ff3c7 ]

[WHY]
Writing to DRR registers such as OTG_V_TOTAL_MIN on the same frame as a
pipe commit can cause underflow.

[HOW]
Move DMUB p-state delegate into optimze_bandwidth; enabling FAMS sets
optimized_required.

This change expects that Freesync requests are blocked when
optimized_required is true.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 6 ++++++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 5403e9399a465..6ce10fd4bb1a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2113,6 +2113,12 @@ void dcn20_optimize_bandwidth(
 	if (hubbub->funcs->program_compbuf_size)
 		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, true);
 
+	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
+		dc_dmub_srv_p_state_delegate(dc,
+			true, context);
+		context->bw_ctx.bw.dcn.clk.p_state_change_support = true;
+	}
+
 	dc->clk_mgr->funcs->update_clocks(
 			dc->clk_mgr,
 			context,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 32121db2851e6..f923224e85fc6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -985,11 +985,18 @@ void dcn30_set_disp_pattern_generator(const struct dc *dc,
 void dcn30_prepare_bandwidth(struct dc *dc,
 			     struct dc_state *context)
 {
+	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
+		dc->optimized_required = true;
+		context->bw_ctx.bw.dcn.clk.p_state_change_support = false;
+	}
+
 	if (dc->clk_mgr->dc_mode_softmax_enabled)
 		if (dc->clk_mgr->clks.dramclk_khz <= dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000 &&
 				context->bw_ctx.bw.dcn.clk.dramclk_khz > dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000)
 			dc->clk_mgr->funcs->set_max_memclk(dc->clk_mgr, dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
 
 	dcn20_prepare_bandwidth(dc, context);
+
+	dc_dmub_srv_p_state_delegate(dc, false, context);
 }
 
-- 
2.39.2

