Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5878BF0AC
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63EE112FD3;
	Tue,  7 May 2024 23:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wao8AwrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A786A112FDE;
 Tue,  7 May 2024 23:09:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 280F461A11;
 Tue,  7 May 2024 23:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435BBC4AF67;
 Tue,  7 May 2024 23:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123379;
 bh=o4kHvtL5xP3bfDqpKz/1lp/LoNHKKqwR2ufyRf54P4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wao8AwrUxf3PElJFbZDlEtTIde5iRzAL0p6GMBp8OGlr4LqFQ1+LSbKE9EcpFYWQr
 YML27WFulPqId4/M+uJPz84RCGVysLMTB60c5cYnHZxnKa+BeWTYulafmX24tFH6Um
 LNkV8JIaLhAJ0iGwGW0Ajh6UrnMVKz79d8Ac0UNJdJlx+eV83HVRK0koQgj6sRTydz
 GnxEj2wxGlFQchp26zNv7f5vPdUiZy1BkSrYtb+2azGQUEI8CDdFSiYNcNHWOypqJS
 A4I4Muii6FkL1EJkPFBkk/f/oMwC0u66ZCzFIg/dwWcKHdRY8Tvt8GjYyvBgCUUsGR
 ZnOR21dFfqgNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leo Ma <hanghong.ma@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, samson.tam@amd.com, stylon.wang@amd.com,
 relja.vojvodic@amd.com, etbitnun@amd.com, charlene.liu@amd.com,
 wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 41/52] drm/amd/display: Fix DC mode screen
 flickering on DCN321
Date: Tue,  7 May 2024 19:07:07 -0400
Message-ID: <20240507230800.392128-41-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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

From: Leo Ma <hanghong.ma@amd.com>

[ Upstream commit ce649bd2d834db83ecc2756a362c9a1ec61658a5 ]

[Why && How]
Screen flickering saw on 4K@60 eDP with high refresh rate external
monitor when booting up in DC mode. DC Mode Capping is disabled
which caused wrong UCLK being used.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Leo Ma <hanghong.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index bbdbc78161a00..39c63565baa9a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -696,8 +696,12 @@ static void dcn32_update_clocks(struct clk_mgr *clk_mgr_base,
 					 * since we calculate mode support based on softmax being the max UCLK
 					 * frequency.
 					 */
-					dcn32_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
-							dc->clk_mgr->bw_params->dc_mode_softmax_memclk);
+					if (dc->debug.disable_dc_mode_overwrite) {
+						dcn30_smu_set_hard_max_by_freq(clk_mgr, PPCLK_UCLK, dc->clk_mgr->bw_params->max_memclk_mhz);
+						dcn32_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK, dc->clk_mgr->bw_params->max_memclk_mhz);
+					} else
+						dcn32_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+								dc->clk_mgr->bw_params->dc_mode_softmax_memclk);
 				} else {
 					dcn32_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK, dc->clk_mgr->bw_params->max_memclk_mhz);
 				}
@@ -730,8 +734,13 @@ static void dcn32_update_clocks(struct clk_mgr *clk_mgr_base,
 		/* set UCLK to requested value if P-State switching is supported, or to re-enable P-State switching */
 		if (clk_mgr_base->clks.p_state_change_support &&
 				(update_uclk || !clk_mgr_base->clks.prev_p_state_change_support) &&
-				!dc->work_arounds.clock_update_disable_mask.uclk)
+				!dc->work_arounds.clock_update_disable_mask.uclk) {
+			if (dc->clk_mgr->dc_mode_softmax_enabled && dc->debug.disable_dc_mode_overwrite)
+				dcn30_smu_set_hard_max_by_freq(clk_mgr, PPCLK_UCLK,
+						max((int)dc->clk_mgr->bw_params->dc_mode_softmax_memclk, khz_to_mhz_ceil(clk_mgr_base->clks.dramclk_khz)));
+
 			dcn32_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK, khz_to_mhz_ceil(clk_mgr_base->clks.dramclk_khz));
+		}
 
 		if (clk_mgr_base->clks.num_ways != new_clocks->num_ways &&
 				clk_mgr_base->clks.num_ways > new_clocks->num_ways) {
-- 
2.43.0

