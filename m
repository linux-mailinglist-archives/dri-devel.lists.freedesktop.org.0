Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C00AAA1E0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D4C10E576;
	Mon,  5 May 2025 22:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cLI17ZQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2810E575;
 Mon,  5 May 2025 22:52:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 78B1B446E8;
 Mon,  5 May 2025 22:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7D7C4CEE4;
 Mon,  5 May 2025 22:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485559;
 bh=okfQ0p2BkEh19Ojv1U+9vH9B+4z3vlhl41JYyyWl/RM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLI17ZQ72Yb8rbmTc922eXCL6KhWzCVZQ7XaO5gK/GXWMICW2wCjvB3vXFaiHMngP
 5MIsB2qOtzQYtAHZT+dDYqRjBo267TTz/MmGpGMELXNt7Ix0z/1UEsn8f3BxweQTQk
 wXvVibEyod/0TXV1ZcFS5jDq97a6SPDBouJZGsZWhNAj7ELj6PXp2z/yw3X6xSmS10
 EJ/aaQl68BaWpAPNDriPv5f2FICmxxgoJdDRoXYQdNsp5IH2719nXDtvPwJyh4t6rD
 5uG6/0LPhFGQqcB1q+0S/WS4DHtVNPfRI9BF6UfK0Ya4VRpI1WeP2PFC627XnHQaz8
 SsqtQ/5R3rs6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brandon Syu <Brandon.Syu@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Charlene.Liu@amd.com,
 alvin.lee2@amd.com, chiahsuan.chung@amd.com, jerry.zuo@amd.com,
 Kaitlyn.Tse@amd.com, Ovidiu.Bunea@amd.com, ryanseto@amd.com,
 martin.tsai@amd.com, yi-lchen@amd.com, tjakobi@math.uni-bielefeld.de,
 Sungjoon.Kim@amd.com, michael.strauss@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 368/486] Revert "drm/amd/display: Exit idle
 optimizations before attempt to access PHY"
Date: Mon,  5 May 2025 18:37:24 -0400
Message-Id: <20250505223922.2682012-368-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 297f313794e49..809c556f4e7de 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1890,7 +1890,6 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 	bool can_apply_edp_fast_boot = false;
 	bool can_apply_seamless_boot = false;
 	bool keep_edp_vdd_on = false;
-	struct dc_bios *dcb = dc->ctx->dc_bios;
 	DC_LOGGER_INIT();
 
 
@@ -1967,8 +1966,6 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 			hws->funcs.edp_backlight_control(edp_link_with_sink, false);
 		}
 		/*resume from S3, no vbios posting, no need to power down again*/
-		if (dcb && dcb->funcs && !dcb->funcs->is_accelerated_mode(dcb))
-			clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
 
 		power_down_all_hw_blocks(dc);
 
@@ -1981,8 +1978,6 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
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

