Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AFA58FF89
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C918EB439C;
	Thu, 11 Aug 2022 15:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F04B4374;
 Thu, 11 Aug 2022 15:31:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37C9161617;
 Thu, 11 Aug 2022 15:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DCFC433B5;
 Thu, 11 Aug 2022 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231875;
 bh=k93vBGoDb8sFYgeVHyFBYv0jNZOn3630SDaP8Xq6Was=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcF9qzqxQXtv/x+0Ke70zzPJym+oppf1+EVqrffEAQo9IkG3HICBRaDANMSIddTVS
 tNn8M9UKjnM8KEfsz9skiLJ8x1jRtlZLbPAGdObkm3T/dCml9msd3LXg7Ou/5vxaaI
 sYaHXk9YrzXgmhD5HiGWsv5a+tB8h//tLonvhQHydhM/PAQyhkXKlqck+DpeVaGKd4
 sD01C36CfNn1cZ2Hvvg9LfiDavkFzUDeyFzZeWt9UTGUcKg93rbOxWtWcwVCszU2bk
 ucf+MLOprQf6niCNnx405ynMWAJHpdZI2gQlO6veQidTkXCJNGMIjPnv8rAm+azOTI
 uj+tzYGeEK84Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 018/105] drm/amd/display: Reduce frame size in
 the bouding box for DCN20
Date: Thu, 11 Aug 2022 11:27:02 -0400
Message-Id: <20220811152851.1520029-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
index f79dd40f8d81..48df4f225ac7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1428,21 +1428,20 @@ void dcn20_calculate_wm(
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
@@ -1453,36 +1452,35 @@ void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_s
 
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

