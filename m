Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7BB9BAAEF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 03:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039110E357;
	Mon,  4 Nov 2024 02:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="DFqwdvXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32910E357;
 Mon,  4 Nov 2024 02:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=+gndMI+0kZSU1Kvygt+/YQjL5w9rqPYbq+F/LgysxHc=; b=DFqwdvXkdrE5mLFh
 H/yBZ7Hc/dLLYRfnVmu8/bv58+d7dRpgQa74HlJ/L7D2ZawFRr0B0Wdbe7VDFXmlvNXhV6gipeYQQ
 MafOZGSsE3r0dBbO+FZfQrOwWyFzA8x2btckqyxpnTj41ECJhfAKir03prZLM2OEtvpom7iR5fm8r
 liLEIyqbQChn77u/odT7hQrLMAVNGWmVydemEw7v8jz7EWAkmfOA4fKsI53Ux8wJSvnr+p5Ch7VmT
 ChAvhqitEwW1nuEoxWqr05dy5l4d79R82JtfmZZJYdvBDORuD5CMPUQQrU7PbC9d66fyPokRd0fm+
 9G/Ta0No9mZqtYuHGA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t7n02-00FECw-0v;
 Mon, 04 Nov 2024 02:39:26 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 chaitanya.dhere@amd.com, jun.lei@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/5] drm/amd/display: Remove unused dcn_find_dcfclk_suits_all
Date: Mon,  4 Nov 2024 02:38:52 +0000
Message-ID: <20241104023852.492497-6-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104023852.492497-1-linux@treblig.org>
References: <20241104023852.492497-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

dcn_find_dcfclk_suits_all() last use was removed by 2018's
commit 4fd994c448a3 ("drm/amd/display: Start using the new pp_smu
interface")

Remove it, and the dcn_find_normalized_clock_vdd_Level helper it used.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 132 ------------------
 .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |   4 -
 2 files changed, 136 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
index 39525721c976..f1235bf9a596 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
@@ -1312,138 +1312,6 @@ bool dcn_validate_bandwidth(
 		return false;
 }
 
-static unsigned int dcn_find_normalized_clock_vdd_Level(
-	const struct dc *dc,
-	enum dm_pp_clock_type clocks_type,
-	int clocks_in_khz)
-{
-	int vdd_level = dcn_bw_v_min0p65;
-
-	if (clocks_in_khz == 0)/*todo some clock not in the considerations*/
-		return vdd_level;
-
-	switch (clocks_type) {
-	case DM_PP_CLOCK_TYPE_DISPLAY_CLK:
-		if (clocks_in_khz > dc->dcn_soc->max_dispclk_vmax0p9*1000) {
-			vdd_level = dcn_bw_v_max0p91;
-			BREAK_TO_DEBUGGER();
-		} else if (clocks_in_khz > dc->dcn_soc->max_dispclk_vnom0p8*1000) {
-			vdd_level = dcn_bw_v_max0p9;
-		} else if (clocks_in_khz > dc->dcn_soc->max_dispclk_vmid0p72*1000) {
-			vdd_level = dcn_bw_v_nom0p8;
-		} else if (clocks_in_khz > dc->dcn_soc->max_dispclk_vmin0p65*1000) {
-			vdd_level = dcn_bw_v_mid0p72;
-		} else
-			vdd_level = dcn_bw_v_min0p65;
-		break;
-	case DM_PP_CLOCK_TYPE_DISPLAYPHYCLK:
-		if (clocks_in_khz > dc->dcn_soc->phyclkv_max0p9*1000) {
-			vdd_level = dcn_bw_v_max0p91;
-			BREAK_TO_DEBUGGER();
-		} else if (clocks_in_khz > dc->dcn_soc->phyclkv_nom0p8*1000) {
-			vdd_level = dcn_bw_v_max0p9;
-		} else if (clocks_in_khz > dc->dcn_soc->phyclkv_mid0p72*1000) {
-			vdd_level = dcn_bw_v_nom0p8;
-		} else if (clocks_in_khz > dc->dcn_soc->phyclkv_min0p65*1000) {
-			vdd_level = dcn_bw_v_mid0p72;
-		} else
-			vdd_level = dcn_bw_v_min0p65;
-		break;
-
-	case DM_PP_CLOCK_TYPE_DPPCLK:
-		if (clocks_in_khz > dc->dcn_soc->max_dppclk_vmax0p9*1000) {
-			vdd_level = dcn_bw_v_max0p91;
-			BREAK_TO_DEBUGGER();
-		} else if (clocks_in_khz > dc->dcn_soc->max_dppclk_vnom0p8*1000) {
-			vdd_level = dcn_bw_v_max0p9;
-		} else if (clocks_in_khz > dc->dcn_soc->max_dppclk_vmid0p72*1000) {
-			vdd_level = dcn_bw_v_nom0p8;
-		} else if (clocks_in_khz > dc->dcn_soc->max_dppclk_vmin0p65*1000) {
-			vdd_level = dcn_bw_v_mid0p72;
-		} else
-			vdd_level = dcn_bw_v_min0p65;
-		break;
-
-	case DM_PP_CLOCK_TYPE_MEMORY_CLK:
-		{
-			unsigned factor = (ddr4_dram_factor_single_Channel * dc->dcn_soc->number_of_channels);
-
-			if (clocks_in_khz > dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9*1000000/factor) {
-				vdd_level = dcn_bw_v_max0p91;
-				BREAK_TO_DEBUGGER();
-			} else if (clocks_in_khz > dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8*1000000/factor) {
-				vdd_level = dcn_bw_v_max0p9;
-			} else if (clocks_in_khz > dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72*1000000/factor) {
-				vdd_level = dcn_bw_v_nom0p8;
-			} else if (clocks_in_khz > dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65*1000000/factor) {
-				vdd_level = dcn_bw_v_mid0p72;
-			} else
-				vdd_level = dcn_bw_v_min0p65;
-		}
-		break;
-
-	case DM_PP_CLOCK_TYPE_DCFCLK:
-		if (clocks_in_khz > dc->dcn_soc->dcfclkv_max0p9*1000) {
-			vdd_level = dcn_bw_v_max0p91;
-			BREAK_TO_DEBUGGER();
-		} else if (clocks_in_khz > dc->dcn_soc->dcfclkv_nom0p8*1000) {
-			vdd_level = dcn_bw_v_max0p9;
-		} else if (clocks_in_khz > dc->dcn_soc->dcfclkv_mid0p72*1000) {
-			vdd_level = dcn_bw_v_nom0p8;
-		} else if (clocks_in_khz > dc->dcn_soc->dcfclkv_min0p65*1000) {
-			vdd_level = dcn_bw_v_mid0p72;
-		} else
-			vdd_level = dcn_bw_v_min0p65;
-		break;
-
-	default:
-		 break;
-	}
-	return vdd_level;
-}
-
-unsigned int dcn_find_dcfclk_suits_all(
-	const struct dc *dc,
-	struct dc_clocks *clocks)
-{
-	unsigned vdd_level, vdd_level_temp;
-	unsigned dcf_clk;
-
-	/*find a common supported voltage level*/
-	vdd_level = dcn_find_normalized_clock_vdd_Level(
-		dc, DM_PP_CLOCK_TYPE_DISPLAY_CLK, clocks->dispclk_khz);
-	vdd_level_temp = dcn_find_normalized_clock_vdd_Level(
-		dc, DM_PP_CLOCK_TYPE_DISPLAYPHYCLK, clocks->phyclk_khz);
-
-	vdd_level = dcn_bw_max(vdd_level, vdd_level_temp);
-	vdd_level_temp = dcn_find_normalized_clock_vdd_Level(
-		dc, DM_PP_CLOCK_TYPE_DPPCLK, clocks->dppclk_khz);
-	vdd_level = dcn_bw_max(vdd_level, vdd_level_temp);
-
-	vdd_level_temp = dcn_find_normalized_clock_vdd_Level(
-		dc, DM_PP_CLOCK_TYPE_MEMORY_CLK, clocks->fclk_khz);
-	vdd_level = dcn_bw_max(vdd_level, vdd_level_temp);
-	vdd_level_temp = dcn_find_normalized_clock_vdd_Level(
-		dc, DM_PP_CLOCK_TYPE_DCFCLK, clocks->dcfclk_khz);
-
-	/*find that level conresponding dcfclk*/
-	vdd_level = dcn_bw_max(vdd_level, vdd_level_temp);
-	if (vdd_level == dcn_bw_v_max0p91) {
-		BREAK_TO_DEBUGGER();
-		dcf_clk = dc->dcn_soc->dcfclkv_max0p9*1000;
-	} else if (vdd_level == dcn_bw_v_max0p9)
-		dcf_clk =  dc->dcn_soc->dcfclkv_max0p9*1000;
-	else if (vdd_level == dcn_bw_v_nom0p8)
-		dcf_clk =  dc->dcn_soc->dcfclkv_nom0p8*1000;
-	else if (vdd_level == dcn_bw_v_mid0p72)
-		dcf_clk =  dc->dcn_soc->dcfclkv_mid0p72*1000;
-	else
-		dcf_clk =  dc->dcn_soc->dcfclkv_min0p65*1000;
-
-	DC_LOG_BANDWIDTH_CALCS("\tdcf_clk for voltage = %d\n", dcf_clk);
-	return dcf_clk;
-}
-
 void dcn_bw_update_from_pplib_fclks(
 	struct dc *dc,
 	struct dm_pp_clock_levels_with_voltage *fclks)
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
index 55529c5f471c..d19a595c2be4 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
@@ -624,10 +624,6 @@ bool dcn_validate_bandwidth(
 		struct dc_state *context,
 		bool fast_validate);
 
-unsigned int dcn_find_dcfclk_suits_all(
-	const struct dc *dc,
-	struct dc_clocks *clocks);
-
 void dcn_get_soc_clks(
 		struct dc *dc,
 		int *min_fclk_khz,
-- 
2.47.0

