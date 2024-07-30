Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8694200A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 20:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85DA10E205;
	Tue, 30 Jul 2024 18:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=holm.dev header.i=@holm.dev header.b="mKbTeXjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D134910E303
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 18:53:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=holm.dev; s=key1;
 t=1722365626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dn0xLoWfpimcsell+FemET9LAXc+6vt12NIgpqJmTuA=;
 b=mKbTeXjP4/9I1YF92icnDI09ZeHIfFWNXVz6Xr+njiwq//LEdXFTrZXsXIM/NRagozi3Bq
 V15l4NcBHoTVjm0dsn9tpEt58s4cDH/KDmdeLnYedz8WcFEZHS6m8uB4JfWAa1TcOLAgs8
 1lnJfWAr3RxvEL/vTM+G+hhlnMhrUHjlnT8z2LBVsf5Hc1ZCljUD4ysAmgmKuHD8MZgStY
 84jmZj3d2GQ8UsTyLI99gc+PJFhEAdIds2eGNQXGy6JUMBQpOa+UbS9e8X7WnFboTGXMtb
 nthKe0cP7YjasayTr4vDRHHlXOAhH0Kpfch8cthWynbQPBRrkhXZhji8QxMiCw==
From: Kevin Holm <kevin@holm.dev>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Wayne Lin <wayne.lin@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Holm <kevin@holm.dev>
Subject: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Date: Tue, 30 Jul 2024 20:53:39 +0200
Message-ID: <20240730185339.543359-1-kevin@holm.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Wayne Lin <wayne.lin@amd.com>

[ Upstream commit fa57924c76d995e87ca3533ec60d1d5e55769a27 ]

[Why]
dm_dp_mst_is_port_support_mode() is a bit not following the original design rule and cause
light up issue with multiple 4k monitors after mst dsc hub.

[How]
Refactor function dm_dp_mst_is_port_support_mode() a bit to solve the light up issue.

Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[kevin@holm.dev: Resolved merge conflict in .../amdgpu_dm_mst_types.c]
Fixes: 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst mode validation")
Link: https://lore.kernel.org/stable/d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev/T/#u
Signed-off-by: Kevin Holm <kevin@holm.dev>
---
I resolved the merge conflict so that, after this patch is applied to the
linux-6.10.y branch of the stable git repository, the resulting function
dm_dp_mst_is_port_support_mode (and also the new function 
dp_get_link_current_set_bw) is identical to the original commit.

I've confirmed that it fixes the regression I reported for my use case.
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 232 +++++++++++-------
 1 file changed, 147 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index a5e1a93ddaea..e90f9d697511 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1595,109 +1595,171 @@ static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
 	return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
 }
 
+#if defined(CONFIG_DRM_AMD_DC_FP)
+static bool dp_get_link_current_set_bw(struct drm_dp_aux *aux, uint32_t *cur_link_bw)
+{
+	uint32_t total_data_bw_efficiency_x10000 = 0;
+	uint32_t link_rate_per_lane_kbps = 0;
+	enum dc_link_rate link_rate;
+	union lane_count_set lane_count;
+	u8 dp_link_encoding;
+	u8 link_bw_set = 0;
+
+	*cur_link_bw = 0;
+
+	if (drm_dp_dpcd_read(aux, DP_MAIN_LINK_CHANNEL_CODING_SET, &dp_link_encoding, 1) != 1 ||
+		drm_dp_dpcd_read(aux, DP_LANE_COUNT_SET, &lane_count.raw, 1) != 1 ||
+		drm_dp_dpcd_read(aux, DP_LINK_BW_SET, &link_bw_set, 1) != 1)
+		return false;
+
+	switch (dp_link_encoding) {
+	case DP_8b_10b_ENCODING:
+		link_rate = link_bw_set;
+		link_rate_per_lane_kbps = link_rate * LINK_RATE_REF_FREQ_IN_KHZ * BITS_PER_DP_BYTE;
+		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_8b_10b_x10000;
+		total_data_bw_efficiency_x10000 /= 100;
+		total_data_bw_efficiency_x10000 *= DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100;
+		break;
+	case DP_128b_132b_ENCODING:
+		switch (link_bw_set) {
+		case DP_LINK_BW_10:
+			link_rate = LINK_RATE_UHBR10;
+			break;
+		case DP_LINK_BW_13_5:
+			link_rate = LINK_RATE_UHBR13_5;
+			break;
+		case DP_LINK_BW_20:
+			link_rate = LINK_RATE_UHBR20;
+			break;
+		default:
+			return false;
+		}
+
+		link_rate_per_lane_kbps = link_rate * 10000;
+		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_128b_132b_x10000;
+		break;
+	default:
+		return false;
+	}
+
+	*cur_link_bw = link_rate_per_lane_kbps * lane_count.bits.LANE_COUNT_SET / 10000 * total_data_bw_efficiency_x10000;
+	return true;
+}
+#endif
+
 enum dc_status dm_dp_mst_is_port_support_mode(
 	struct amdgpu_dm_connector *aconnector,
 	struct dc_stream_state *stream)
 {
-	int pbn, branch_max_throughput_mps = 0;
+#if defined(CONFIG_DRM_AMD_DC_FP)
+	int branch_max_throughput_mps = 0;
 	struct dc_link_settings cur_link_settings;
-	unsigned int end_to_end_bw_in_kbps = 0;
-	unsigned int upper_link_bw_in_kbps = 0, down_link_bw_in_kbps = 0;
+	uint32_t end_to_end_bw_in_kbps = 0;
+	uint32_t root_link_bw_in_kbps = 0;
+	uint32_t virtual_channel_bw_in_kbps = 0;
 	struct dc_dsc_bw_range bw_range = {0};
 	struct dc_dsc_config_options dsc_options = {0};
+	uint32_t stream_kbps;
 
-	/*
-	 * Consider the case with the depth of the mst topology tree is equal or less than 2
-	 * A. When dsc bitstream can be transmitted along the entire path
-	 *    1. dsc is possible between source and branch/leaf device (common dsc params is possible), AND
-	 *    2. dsc passthrough supported at MST branch, or
-	 *    3. dsc decoding supported at leaf MST device
-	 *    Use maximum dsc compression as bw constraint
-	 * B. When dsc bitstream cannot be transmitted along the entire path
-	 *    Use native bw as bw constraint
+	/* DSC unnecessary case
+	 * Check if timing could be supported within end-to-end BW
 	 */
-	if (is_dsc_common_config_possible(stream, &bw_range) &&
-	   (aconnector->mst_output_port->passthrough_aux ||
-	    aconnector->dsc_aux == &aconnector->mst_output_port->aux)) {
-		cur_link_settings = stream->link->verified_link_cap;
-		upper_link_bw_in_kbps = dc_link_bandwidth_kbps(aconnector->dc_link, &cur_link_settings);
-		down_link_bw_in_kbps = kbps_from_pbn(aconnector->mst_output_port->full_pbn);
-
-		/* pick the end to end bw bottleneck */
-		end_to_end_bw_in_kbps = min(upper_link_bw_in_kbps, down_link_bw_in_kbps);
-
-		if (end_to_end_bw_in_kbps < bw_range.min_kbps) {
-			DRM_DEBUG_DRIVER("maximum dsc compression cannot fit into end-to-end bandwidth\n");
+	stream_kbps =
+		dc_bandwidth_in_kbps_from_timing(&stream->timing,
+			dc_link_get_highest_encoding_format(stream->link));
+	cur_link_settings = stream->link->verified_link_cap;
+	root_link_bw_in_kbps = dc_link_bandwidth_kbps(aconnector->dc_link, &cur_link_settings);
+	virtual_channel_bw_in_kbps = kbps_from_pbn(aconnector->mst_output_port->full_pbn);
+
+	/* pick the end to end bw bottleneck */
+	end_to_end_bw_in_kbps = min(root_link_bw_in_kbps, virtual_channel_bw_in_kbps);
+
+	if (stream_kbps <= end_to_end_bw_in_kbps) {
+		DRM_DEBUG_DRIVER("No DSC needed. End-to-end bw sufficient.");
+		return DC_OK;
+	}
+
+	/*DSC necessary case*/
+	if (!aconnector->dsc_aux)
+		return DC_FAIL_BANDWIDTH_VALIDATE;
+
+	if (is_dsc_common_config_possible(stream, &bw_range)) {
+
+		/*capable of dsc passthough. dsc bitstream along the entire path*/
+		if (aconnector->mst_output_port->passthrough_aux) {
+			if (bw_range.min_kbps > end_to_end_bw_in_kbps) {
+				DRM_DEBUG_DRIVER("DSC passthrough. Max dsc compression can't fit into end-to-end bw\n");
 			return DC_FAIL_BANDWIDTH_VALIDATE;
-		}
+			}
+		} else {
+			/*dsc bitstream decoded at the dp last link*/
+			struct drm_dp_mst_port *immediate_upstream_port = NULL;
+			uint32_t end_link_bw = 0;
+
+			/*Get last DP link BW capability*/
+			if (dp_get_link_current_set_bw(&aconnector->mst_output_port->aux, &end_link_bw)) {
+				if (stream_kbps > end_link_bw) {
+					DRM_DEBUG_DRIVER("DSC decode at last link. Mode required bw can't fit into available bw\n");
+					return DC_FAIL_BANDWIDTH_VALIDATE;
+				}
+			}
 
-		if (end_to_end_bw_in_kbps < bw_range.stream_kbps) {
-			dc_dsc_get_default_config_option(stream->link->dc, &dsc_options);
-			dsc_options.max_target_bpp_limit_override_x16 = aconnector->base.display_info.max_dsc_bpp * 16;
-			if (dc_dsc_compute_config(stream->sink->ctx->dc->res_pool->dscs[0],
-					&stream->sink->dsc_caps.dsc_dec_caps,
-					&dsc_options,
-					end_to_end_bw_in_kbps,
-					&stream->timing,
-					dc_link_get_highest_encoding_format(stream->link),
-					&stream->timing.dsc_cfg)) {
-				stream->timing.flags.DSC = 1;
-				DRM_DEBUG_DRIVER("end-to-end bandwidth require dsc and dsc config found\n");
-			} else {
-				DRM_DEBUG_DRIVER("end-to-end bandwidth require dsc but dsc config not found\n");
-				return DC_FAIL_BANDWIDTH_VALIDATE;
+			/*Get virtual channel bandwidth between source and the link before the last link*/
+			if (aconnector->mst_output_port->parent->port_parent)
+				immediate_upstream_port = aconnector->mst_output_port->parent->port_parent;
+
+			if (immediate_upstream_port) {
+				virtual_channel_bw_in_kbps = kbps_from_pbn(immediate_upstream_port->full_pbn);
+				virtual_channel_bw_in_kbps = min(root_link_bw_in_kbps, virtual_channel_bw_in_kbps);
+				if (bw_range.min_kbps > virtual_channel_bw_in_kbps) {
+					DRM_DEBUG_DRIVER("DSC decode at last link. Max dsc compression can't fit into MST available bw\n");
+					return DC_FAIL_BANDWIDTH_VALIDATE;
+				}
 			}
 		}
-	} else {
-		/* Check if mode could be supported within max slot
-		 * number of current mst link and full_pbn of mst links.
-		 */
-		int pbn_div, slot_num, max_slot_num;
-		enum dc_link_encoding_format link_encoding;
-		uint32_t stream_kbps =
-			dc_bandwidth_in_kbps_from_timing(&stream->timing,
-				dc_link_get_highest_encoding_format(stream->link));
-
-		pbn = kbps_to_peak_pbn(stream_kbps);
-		pbn_div = dm_mst_get_pbn_divider(stream->link);
-		slot_num = DIV_ROUND_UP(pbn, pbn_div);
-
-		link_encoding = dc_link_get_highest_encoding_format(stream->link);
-		if (link_encoding == DC_LINK_ENCODING_DP_8b_10b)
-			max_slot_num = 63;
-		else if (link_encoding == DC_LINK_ENCODING_DP_128b_132b)
-			max_slot_num = 64;
-		else {
-			DRM_DEBUG_DRIVER("Invalid link encoding format\n");
-			return DC_FAIL_BANDWIDTH_VALIDATE;
-		}
 
-		if (slot_num > max_slot_num ||
-			pbn > aconnector->mst_output_port->full_pbn) {
-			DRM_DEBUG_DRIVER("Mode can not be supported within mst links!");
+		/*Confirm if we can obtain dsc config*/
+		dc_dsc_get_default_config_option(stream->link->dc, &dsc_options);
+		dsc_options.max_target_bpp_limit_override_x16 = aconnector->base.display_info.max_dsc_bpp * 16;
+		if (dc_dsc_compute_config(stream->sink->ctx->dc->res_pool->dscs[0],
+				&stream->sink->dsc_caps.dsc_dec_caps,
+				&dsc_options,
+				end_to_end_bw_in_kbps,
+				&stream->timing,
+				dc_link_get_highest_encoding_format(stream->link),
+				&stream->timing.dsc_cfg)) {
+			stream->timing.flags.DSC = 1;
+			DRM_DEBUG_DRIVER("Require dsc and dsc config found\n");
+		} else {
+			DRM_DEBUG_DRIVER("Require dsc but can't find appropriate dsc config\n");
 			return DC_FAIL_BANDWIDTH_VALIDATE;
 		}
-	}
 
-	/* check is mst dsc output bandwidth branch_overall_throughput_0_mps */
-	switch (stream->timing.pixel_encoding) {
-	case PIXEL_ENCODING_RGB:
-	case PIXEL_ENCODING_YCBCR444:
-		branch_max_throughput_mps =
-			aconnector->dc_sink->dsc_caps.dsc_dec_caps.branch_overall_throughput_0_mps;
-		break;
-	case PIXEL_ENCODING_YCBCR422:
-	case PIXEL_ENCODING_YCBCR420:
-		branch_max_throughput_mps =
-			aconnector->dc_sink->dsc_caps.dsc_dec_caps.branch_overall_throughput_1_mps;
-		break;
-	default:
-		break;
-	}
+		/* check is mst dsc output bandwidth branch_overall_throughput_0_mps */
+		switch (stream->timing.pixel_encoding) {
+		case PIXEL_ENCODING_RGB:
+		case PIXEL_ENCODING_YCBCR444:
+			branch_max_throughput_mps =
+				aconnector->dc_sink->dsc_caps.dsc_dec_caps.branch_overall_throughput_0_mps;
+			break;
+		case PIXEL_ENCODING_YCBCR422:
+		case PIXEL_ENCODING_YCBCR420:
+			branch_max_throughput_mps =
+				aconnector->dc_sink->dsc_caps.dsc_dec_caps.branch_overall_throughput_1_mps;
+			break;
+		default:
+			break;
+		}
 
-	if (branch_max_throughput_mps != 0 &&
-		((stream->timing.pix_clk_100hz / 10) >  branch_max_throughput_mps * 1000))
+		if (branch_max_throughput_mps != 0 &&
+			((stream->timing.pix_clk_100hz / 10) >  branch_max_throughput_mps * 1000)) {
+			DRM_DEBUG_DRIVER("DSC is required but max throughput mps fails");
 		return DC_FAIL_BANDWIDTH_VALIDATE;
-
+		}
+	} else {
+		DRM_DEBUG_DRIVER("DSC is required but can't find common dsc config.");
+		return DC_FAIL_BANDWIDTH_VALIDATE;
+	}
+#endif
 	return DC_OK;
 }
-- 
2.45.2

