Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38C590092
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A650714BD84;
	Thu, 11 Aug 2022 15:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37A5B46A8;
 Thu, 11 Aug 2022 15:44:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96DE5B82128;
 Thu, 11 Aug 2022 15:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E8BC433D7;
 Thu, 11 Aug 2022 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232689;
 bh=lUIIInpb1mZbIG1/Rqh5tRD1Ox6ZtSk+BkiautnqUFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iVXRkyzaZbhSsghWeEZrRSdd1mJtCAd5pgaBqTMJ626kvMSGe+FteDAGsN2tTi+1D
 617Zveavva0kW0I1CTUQV+Yw7ycbznPnGDIfLjGtGGSZO8uAyjGaMBNh1zIWuRS5fy
 sYxaYv9cYubfTlAsGte4Ww4t9o/p1Glm4vu1sOQULfRovpqJIj8CsKuJ1VL5kuSQPU
 dDS0s6j+yHnaguBWm6Ns3JNOfAFGZOpxfQZG7a9UMS9TEFN6wI9Qp+c6ftOe1I87bh
 tlP2cRX1CG5K6aQvlRv7SlKU5kn/X6ohbcmEXyYzBtT5n8X0oF4JRpVCE6yiDwvQRa
 OFu0US22MG9DQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 17/93] drm/amd/display: Reduce frame size in the
 bouding box for DCN20
Date: Thu, 11 Aug 2022 11:41:11 -0400
Message-Id: <20220811154237.1531313-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Eric.Yang2@amd.com, dri-devel@lists.freedesktop.org, gabe.teeger@amd.com,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas.Kazlauskas@amd.com, mwen@igalia.com, airlied@linux.ie,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, HaoPing.Liu@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit c55300ad4a1814bac9191a4d2c7b0d74273aec7c ]

GCC throw warnings for the function dcn20_update_bounding_box due to its
frame size that looks like this:

 error: the frame size of 1936 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

This commit fixes this issue by eliminating an intermediary variable
that creates a large array.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 38 +++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index f93af45aeab4..c758f84baaf5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1430,21 +1430,20 @@ void dcn20_calculate_wm(
 void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_st *bb,
 		struct pp_smu_nv_clock_table *max_clocks, unsigned int *uclk_states, unsigned int num_states)
 {
-	struct _vcs_dpi_voltage_scaling_st calculated_states[DC__VOLTAGE_STATES];
-	int i;
 	int num_calculated_states = 0;
 	int min_dcfclk = 0;
+	int i;
 
 	dc_assert_fp_enabled();
 
 	if (num_states == 0)
 		return;
 
-	memset(calculated_states, 0, sizeof(calculated_states));
+	memset(bb->clock_limits, 0, sizeof(bb->clock_limits));
 
-	if (dc->bb_overrides.min_dcfclk_mhz > 0)
+	if (dc->bb_overrides.min_dcfclk_mhz > 0) {
 		min_dcfclk = dc->bb_overrides.min_dcfclk_mhz;
-	else {
+	} else {
 		if (ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev))
 			min_dcfclk = 310;
 		else
@@ -1455,36 +1454,35 @@ void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_s
 
 	for (i = 0; i < num_states; i++) {
 		int min_fclk_required_by_uclk;
-		calculated_states[i].state = i;
-		calculated_states[i].dram_speed_mts = uclk_states[i] * 16 / 1000;
+		bb->clock_limits[i].state = i;
+		bb->clock_limits[i].dram_speed_mts = uclk_states[i] * 16 / 1000;
 
 		// FCLK:UCLK ratio is 1.08
 		min_fclk_required_by_uclk = div_u64(((unsigned long long)uclk_states[i]) * 1080,
 			1000000);
 
-		calculated_states[i].fabricclk_mhz = (min_fclk_required_by_uclk < min_dcfclk) ?
+		bb->clock_limits[i].fabricclk_mhz = (min_fclk_required_by_uclk < min_dcfclk) ?
 				min_dcfclk : min_fclk_required_by_uclk;
 
-		calculated_states[i].socclk_mhz = (calculated_states[i].fabricclk_mhz > max_clocks->socClockInKhz / 1000) ?
-				max_clocks->socClockInKhz / 1000 : calculated_states[i].fabricclk_mhz;
+		bb->clock_limits[i].socclk_mhz = (bb->clock_limits[i].fabricclk_mhz > max_clocks->socClockInKhz / 1000) ?
+				max_clocks->socClockInKhz / 1000 : bb->clock_limits[i].fabricclk_mhz;
 
-		calculated_states[i].dcfclk_mhz = (calculated_states[i].fabricclk_mhz > max_clocks->dcfClockInKhz / 1000) ?
-				max_clocks->dcfClockInKhz / 1000 : calculated_states[i].fabricclk_mhz;
+		bb->clock_limits[i].dcfclk_mhz = (bb->clock_limits[i].fabricclk_mhz > max_clocks->dcfClockInKhz / 1000) ?
+				max_clocks->dcfClockInKhz / 1000 : bb->clock_limits[i].fabricclk_mhz;
 
-		calculated_states[i].dispclk_mhz = max_clocks->displayClockInKhz / 1000;
-		calculated_states[i].dppclk_mhz = max_clocks->displayClockInKhz / 1000;
-		calculated_states[i].dscclk_mhz = max_clocks->displayClockInKhz / (1000 * 3);
+		bb->clock_limits[i].dispclk_mhz = max_clocks->displayClockInKhz / 1000;
+		bb->clock_limits[i].dppclk_mhz = max_clocks->displayClockInKhz / 1000;
+		bb->clock_limits[i].dscclk_mhz = max_clocks->displayClockInKhz / (1000 * 3);
 
-		calculated_states[i].phyclk_mhz = max_clocks->phyClockInKhz / 1000;
+		bb->clock_limits[i].phyclk_mhz = max_clocks->phyClockInKhz / 1000;
 
 		num_calculated_states++;
 	}
 
-	calculated_states[num_calculated_states - 1].socclk_mhz = max_clocks->socClockInKhz / 1000;
-	calculated_states[num_calculated_states - 1].fabricclk_mhz = max_clocks->socClockInKhz / 1000;
-	calculated_states[num_calculated_states - 1].dcfclk_mhz = max_clocks->dcfClockInKhz / 1000;
+	bb->clock_limits[num_calculated_states - 1].socclk_mhz = max_clocks->socClockInKhz / 1000;
+	bb->clock_limits[num_calculated_states - 1].fabricclk_mhz = max_clocks->socClockInKhz / 1000;
+	bb->clock_limits[num_calculated_states - 1].dcfclk_mhz = max_clocks->dcfClockInKhz / 1000;
 
-	memcpy(bb->clock_limits, calculated_states, sizeof(bb->clock_limits));
 	bb->num_states = num_calculated_states;
 
 	// Duplicate the last state, DML always an extra state identical to max state to work
-- 
2.35.1

