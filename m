Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B36AA9FF3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7AA10E49A;
	Mon,  5 May 2025 22:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LnojNsON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28210E49D;
 Mon,  5 May 2025 22:29:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 517B05C4EAA;
 Mon,  5 May 2025 22:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94518C4CEED;
 Mon,  5 May 2025 22:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484191;
 bh=fzDozuo7kbxJDxbgO7Loiq2m58dhuP02qkoTWNSOdk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LnojNsONxLOzPFij/xsBDGVJrJyMPb3gpJspU77bx+roTAThsB88cB/7SXsFH+hnd
 5Hi0Al4oPSEtEpmbi2r8R1vlKQsdotxIxWNdiSjQKqGCypkFYoaB1ahHQpu5OEqkfa
 c6oEDlGFhckihhSj08P6WAPTvx9s2y3uLI4vlbN8HPHq5UyQtz1WuQXGAUQQxEgyzI
 WmJYTpUt/6EcJNmtEkPROJ7VITscxvXybHWf88LS8TYHJ41pEQ2YivGYWBoGPlunVY
 qhoEFYs1i81Xmn8MnM/xj/jAE6diPsW517CHY7AtvMlrB6uWGYR5ZbMXoEXYfrGMmg
 /XqYAoKV5Jkdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: George Shen <george.shen@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, wayne.lin@amd.com, alex.hung@amd.com,
 robin.chen@amd.com, Fudong.Wang@amd.com, Cruise.Hung@amd.com,
 Hansen.Dsouza@amd.com, ryanseto@amd.com, michael.strauss@amd.com,
 Gabe.Teeger@amd.com, PeiChen.Huang@amd.com, Ausef.Yousof@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 387/642] drm/amd/display: Read LTTPR ALPM caps
 during link cap retrieval
Date: Mon,  5 May 2025 18:10:03 -0400
Message-Id: <20250505221419.2672473-387-sashal@kernel.org>
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

From: George Shen <george.shen@amd.com>

[ Upstream commit de84d580126eb2214937df755cfec5ef0901479e ]

[Why]
The latest DP spec requires the DP TX to read DPCD F0000h through F0009h
when detecting LTTPR capabilities for the first time.

[How]
Update LTTPR cap retrieval to read up to F0009h (two more bytes than the
previous F0007h), and store the LTTPR ALPM capabilities.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h         | 12 ++++++++++++
 .../display/dc/link/protocols/link_dp_capability.c   |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index cc005da75ce4c..8bb628ab78554 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -959,6 +959,14 @@ union dp_128b_132b_supported_lttpr_link_rates {
 	uint8_t raw;
 };
 
+union dp_alpm_lttpr_cap {
+	struct {
+		uint8_t AUX_LESS_ALPM_SUPPORTED	:1;
+		uint8_t RESERVED				:7;
+	} bits;
+	uint8_t raw;
+};
+
 union dp_sink_video_fallback_formats {
 	struct {
 		uint8_t dp_1024x768_60Hz_24bpp_support	:1;
@@ -1118,6 +1126,7 @@ struct dc_lttpr_caps {
 	uint8_t max_ext_timeout;
 	union dp_main_link_channel_coding_lttpr_cap main_link_channel_coding;
 	union dp_128b_132b_supported_lttpr_link_rates supported_128b_132b_rates;
+	union dp_alpm_lttpr_cap alpm;
 	uint8_t aux_rd_interval[MAX_REPEATER_CNT - 1];
 	uint8_t lttpr_ieee_oui[3];
 	uint8_t lttpr_device_id[6];
@@ -1372,6 +1381,9 @@ struct dp_trace {
 #ifndef DPCD_MAX_UNCOMPRESSED_PIXEL_RATE_CAP
 #define DPCD_MAX_UNCOMPRESSED_PIXEL_RATE_CAP    0x221c
 #endif
+#ifndef DP_LTTPR_ALPM_CAPABILITIES
+#define DP_LTTPR_ALPM_CAPABILITIES              0xF0009
+#endif
 #ifndef DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE
 #define DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE	0x50
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 28843e9882d39..64e4ae379e346 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1502,7 +1502,7 @@ static bool dpcd_read_sink_ext_caps(struct dc_link *link)
 
 enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 {
-	uint8_t lttpr_dpcd_data[8] = {0};
+	uint8_t lttpr_dpcd_data[10] = {0};
 	enum dc_status status;
 	bool is_lttpr_present;
 
@@ -1552,6 +1552,10 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 			lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
 							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
 
+	link->dpcd_caps.lttpr_caps.alpm.raw =
+			lttpr_dpcd_data[DP_LTTPR_ALPM_CAPABILITIES -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
 	/* If this chip cap is set, at least one retimer must exist in the chain
 	 * Override count to 1 if we receive a known bad count (0 or an invalid value) */
 	if (((link->chip_caps & AMD_EXT_DISPLAY_PATH_CAPS__EXT_CHIP_MASK) == AMD_EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
-- 
2.39.5

