Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9118A47A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 21:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F676E967;
	Wed, 18 Mar 2020 20:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7142F6E966;
 Wed, 18 Mar 2020 20:54:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCF7220B1F;
 Wed, 18 Mar 2020 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584564869;
 bh=Bz1KfbscorsoPHnKCfjR5ivUakflhm5VAIEiOcqHq3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qziV+XYqD4NNSi8B50iSX51vVonS+cn4p3DaIbW48+KVpC4C1FGAzuHH1JTtXWh54
 k8j7nDlivlvapM9+3RRpH6xsMyA4eGocBv7MlqHQB/xzNlwdLa+WdPeQo71xHDT/BG
 Cstea8CWblYgKDJRAGRBbpdT90aui24hXiNm/AnY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 41/73] drm/amd/display: update soc bb for nv14
Date: Wed, 18 Mar 2020 16:53:05 -0400
Message-Id: <20200318205337.16279-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205337.16279-1-sashal@kernel.org>
References: <20200318205337.16279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Leung <martin.leung@amd.com>

[ Upstream commit d5349775c1726ce997b8eb4982cd85a01f1c8b42 ]

[why]
nv14 previously inherited soc bb from generic dcn 2, did not match
watermark values according to memory team

[how]
add nv14 specific soc bb: copy nv2 generic that it was
using from before, but changed num channels to 8

Signed-off-by: Martin Leung <martin.leung@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 3b7769a3e67e3..c13dce760098c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -269,6 +269,117 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc = {
 	.use_urgent_burst_bw = 0
 };
 
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc = {
+	.clock_limits = {
+			{
+				.state = 0,
+				.dcfclk_mhz = 560.0,
+				.fabricclk_mhz = 560.0,
+				.dispclk_mhz = 513.0,
+				.dppclk_mhz = 513.0,
+				.phyclk_mhz = 540.0,
+				.socclk_mhz = 560.0,
+				.dscclk_mhz = 171.0,
+				.dram_speed_mts = 8960.0,
+			},
+			{
+				.state = 1,
+				.dcfclk_mhz = 694.0,
+				.fabricclk_mhz = 694.0,
+				.dispclk_mhz = 642.0,
+				.dppclk_mhz = 642.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 694.0,
+				.dscclk_mhz = 214.0,
+				.dram_speed_mts = 11104.0,
+			},
+			{
+				.state = 2,
+				.dcfclk_mhz = 875.0,
+				.fabricclk_mhz = 875.0,
+				.dispclk_mhz = 734.0,
+				.dppclk_mhz = 734.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 875.0,
+				.dscclk_mhz = 245.0,
+				.dram_speed_mts = 14000.0,
+			},
+			{
+				.state = 3,
+				.dcfclk_mhz = 1000.0,
+				.fabricclk_mhz = 1000.0,
+				.dispclk_mhz = 1100.0,
+				.dppclk_mhz = 1100.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1000.0,
+				.dscclk_mhz = 367.0,
+				.dram_speed_mts = 16000.0,
+			},
+			{
+				.state = 4,
+				.dcfclk_mhz = 1200.0,
+				.fabricclk_mhz = 1200.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1200.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 16000.0,
+			},
+			/*Extra state, no dispclk ramping*/
+			{
+				.state = 5,
+				.dcfclk_mhz = 1200.0,
+				.fabricclk_mhz = 1200.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1200.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 16000.0,
+			},
+		},
+	.num_states = 5,
+	.sr_exit_time_us = 8.6,
+	.sr_enter_plus_exit_time_us = 10.9,
+	.urgent_latency_us = 4.0,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 40.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 40.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
+	.max_avg_sdp_bw_use_normal_percent = 40.0,
+	.max_avg_dram_bw_use_normal_percent = 40.0,
+	.writeback_latency_us = 12.0,
+	.ideal_dram_bw_after_urgent_percent = 40.0,
+	.max_request_size_bytes = 256,
+	.dram_channel_width_bytes = 2,
+	.fabric_datapath_to_dcn_data_return_bytes = 64,
+	.dcn_downspread_percent = 0.5,
+	.downspread_percent = 0.38,
+	.dram_page_open_time_ns = 50.0,
+	.dram_rw_turnaround_time_ns = 17.5,
+	.dram_return_buffer_per_channel_bytes = 8192,
+	.round_trip_ping_latency_dcfclk_cycles = 131,
+	.urgent_out_of_order_return_per_channel_bytes = 256,
+	.channel_interleave_bytes = 256,
+	.num_banks = 8,
+	.num_chans = 8,
+	.vmm_page_size_bytes = 4096,
+	.dram_clock_change_latency_us = 404.0,
+	.dummy_pstate_latency_us = 5.0,
+	.writeback_dram_clock_change_latency_us = 23.0,
+	.return_bus_width_bytes = 64,
+	.dispclk_dppclk_vco_speed_mhz = 3850,
+	.xfc_bus_transport_time_us = 20,
+	.xfc_xbuf_latency_tolerance_us = 4,
+	.use_urgent_burst_bw = 0
+};
+
 struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc = { 0 };
 
 #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
@@ -3135,6 +3246,9 @@ static void patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_s
 static struct _vcs_dpi_soc_bounding_box_st *get_asic_rev_soc_bb(
 	uint32_t hw_internal_rev)
 {
+	if (ASICREV_IS_NAVI14_M(hw_internal_rev))
+		return &dcn2_0_nv14_soc;
+
 	if (ASICREV_IS_NAVI12_P(hw_internal_rev))
 		return &dcn2_0_nv12_soc;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
