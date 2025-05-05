Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9BAAA03E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A71210E4C3;
	Mon,  5 May 2025 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o6sf7gwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEB810E4C0;
 Mon,  5 May 2025 22:32:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5045061F1B;
 Mon,  5 May 2025 22:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAF6C4CEE4;
 Mon,  5 May 2025 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484373;
 bh=sjcG5owB5DdTH8YS9RUliRnJZhFLk2r+YY/+DrBCN/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6sf7gwT3W6p1UJHdcMst/+K2bAlDhjO4Qkm2xaG+/Li35FeXsgDJQMhUb/s1IuTW
 d+n8Igf6VWCmc96+eiA4zgwt14VGunu9R60iRNoh6UTM/1jyHGecTC+c2n0b0QCbGi
 UD8VmoUknQQ2rPVyvjDfBIqxVr0WaN1i1mSnBSbxgLOxaUKW4effy6wW0ampURWQq8
 j4zCVUwrviJAJFM0ChdjWGlX4TLQV4wN/480zBFCDDjVPJBdsKZ1dQKPb/ypWmpt9T
 cW0GL3z/sZkxNrhEIQaWN9ecBJJ1/eW21iiuxeF814+6q3TaQwoWWVaKi+1zOPYqg+
 /QPJ3s3lo1NaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brandon Syu <Brandon.Syu@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Charlene.Liu@amd.com,
 alvin.lee2@amd.com, jerry.zuo@amd.com, chiahsuan.chung@amd.com,
 Kaitlyn.Tse@amd.com, Ovidiu.Bunea@amd.com, ryanseto@amd.com,
 martin.tsai@amd.com, yi-lchen@amd.com, tjakobi@math.uni-bielefeld.de,
 Sungjoon.Kim@amd.com, michael.strauss@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 467/642] Revert "drm/amd/display: Exit idle
 optimizations before attempt to access PHY"
Date: Mon,  5 May 2025 18:11:23 -0400
Message-Id: <20250505221419.2672473-467-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Brandon Syu <Brandon.Syu@amd.com>

[ Upstream commit be704e5ef4bd66dee9bb3f876964327e3a247d31 ]

This reverts commit de612738e9771bd66aeb20044486c457c512f684.

Reason to revert: screen flashes or gray screen appeared half of the
screen after resume from S4/S5.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Brandon Syu <Brandon.Syu@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 94ceccfc04982..2f5f3e749a1ab 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1889,7 +1889,6 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 	bool can_apply_edp_fast_boot = false;
 	bool can_apply_seamless_boot = false;
 	bool keep_edp_vdd_on = false;
-	struct dc_bios *dcb = dc->ctx->dc_bios;
 	DC_LOGGER_INIT();
 
 
@@ -1966,8 +1965,6 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 			hws->funcs.edp_backlight_control(edp_link_with_sink, false);
 		}
 		/*resume from S3, no vbios posting, no need to power down again*/
-		if (dcb && dcb->funcs && !dcb->funcs->is_accelerated_mode(dcb))
-			clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
 
 		power_down_all_hw_blocks(dc);
 
@@ -1980,8 +1977,6 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 		disable_vga_and_power_gate_all_controllers(dc);
 		if (edp_link_with_sink && !keep_edp_vdd_on)
 			dc->hwss.edp_power_control(edp_link_with_sink, false);
-		if (dcb && dcb->funcs && !dcb->funcs->is_accelerated_mode(dcb))
-			clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
 	}
 	bios_set_scratch_acc_mode_change(dc->ctx->dc_bios, 1);
 }
-- 
2.39.5

