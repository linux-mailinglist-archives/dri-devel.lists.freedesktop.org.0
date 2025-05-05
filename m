Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFECCAAA0CA
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152DD10E505;
	Mon,  5 May 2025 22:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="foHrwPcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE4610E505;
 Mon,  5 May 2025 22:39:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93B82A4CF2F;
 Mon,  5 May 2025 22:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137E2C4CEE4;
 Mon,  5 May 2025 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484746;
 bh=PwWSdU0v4ac350M24sNgCGAuAFFzNWKlDyW/Vpiq864=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=foHrwPcvuR1z6J1IHfls//0gjk7JsLigB2BXRVTpUD9Jqi/RcAgyAFst5sl66X1J+
 bHs6iYjZ+qRBYhlEpKKJDgiu1D8VH2iDbwV9kzYOyMHbqjOPZL5zp1q/aXi8phq5oI
 d6IC/+GlYrMrqOtqaQb5nG6mzlfUumJUcgEgNBbtJ3vtAsEfUm1CgWIc131koct7TX
 0KQVKaW8vIyQxkmlE+qZD+9UPV3Uuik+CDvaAcNQ7Ojs4FN8kroU72uBvyeP9AMVIN
 1Clk+7mLy+aBQS6BHXywSl/Nd6UttcEm1Mo+ZguYCzMVQllSZH/URiFDe/vXjXaeVr
 wdl53EF4YAgNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ovidiu Bunea <Ovidiu.Bunea@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Charlene.Liu@amd.com,
 alvin.lee2@amd.com, chiahsuan.chung@amd.com, jerry.zuo@amd.com,
 alex.hung@amd.com, Kaitlyn.Tse@amd.com, ryanseto@amd.com,
 martin.tsai@amd.com, yi-lchen@amd.com, tjakobi@math.uni-bielefeld.de,
 Sungjoon.Kim@amd.com, michael.strauss@amd.com, Brandon.Syu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 637/642] drm/amd/display: Exit idle optimizations
 before accessing PHY
Date: Mon,  5 May 2025 18:14:13 -0400
Message-Id: <20250505221419.2672473-637-sashal@kernel.org>
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

From: Ovidiu Bunea <Ovidiu.Bunea@amd.com>

[ Upstream commit c488967488d7eff7b9c527d5469c424c15377502 ]

[why & how]
By default, DCN HW is in idle optimized state which does not allow access
to PHY registers. If BIOS powers up the DCN, it is fine because they will
power up everything. Only exit idle optimized state when not taking control
from VBIOS.

Fixes: be704e5ef4bd ("Revert "drm/amd/display: Exit idle optimizations before attempt to access PHY"")
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Ovidiu Bunea <Ovidiu.Bunea@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 2f5f3e749a1ab..94ceccfc04982 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1889,6 +1889,7 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 	bool can_apply_edp_fast_boot = false;
 	bool can_apply_seamless_boot = false;
 	bool keep_edp_vdd_on = false;
+	struct dc_bios *dcb = dc->ctx->dc_bios;
 	DC_LOGGER_INIT();
 
 
@@ -1965,6 +1966,8 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 			hws->funcs.edp_backlight_control(edp_link_with_sink, false);
 		}
 		/*resume from S3, no vbios posting, no need to power down again*/
+		if (dcb && dcb->funcs && !dcb->funcs->is_accelerated_mode(dcb))
+			clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
 
 		power_down_all_hw_blocks(dc);
 
@@ -1977,6 +1980,8 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 		disable_vga_and_power_gate_all_controllers(dc);
 		if (edp_link_with_sink && !keep_edp_vdd_on)
 			dc->hwss.edp_power_control(edp_link_with_sink, false);
+		if (dcb && dcb->funcs && !dcb->funcs->is_accelerated_mode(dcb))
+			clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
 	}
 	bios_set_scratch_acc_mode_change(dc->ctx->dc_bios, 1);
 }
-- 
2.39.5

