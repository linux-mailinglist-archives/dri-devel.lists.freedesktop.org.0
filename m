Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23788DEDF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17EB10FBD4;
	Wed, 27 Mar 2024 12:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wb8yZjcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19A710FBD3;
 Wed, 27 Mar 2024 12:19:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2250861519;
 Wed, 27 Mar 2024 12:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7DDC43390;
 Wed, 27 Mar 2024 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541982;
 bh=bnUB4C5n/YL5crTAVZbDDemqN2fLAzWLNhHj26IJp84=;
 h=From:To:Cc:Subject:Date:From;
 b=Wb8yZjcsO9qA6WnIASYIhpJ8el7PtMpzAgeLw98rbspxqYUU0P+QmHX7TwDgg1YJD
 NB2LAr1tiJvIH7QZdAD+jgLBj2/nmD7THnYw4zytsSf9rOSLrtVKKUu4NdrfcOgoGI
 3Lk1fDzS9FrSC0bF976FECP9ET/ABSGuxV0AF0WLNs7MSYIVApB70pSwqxcB9wNG3i
 pX3aVV7V6MgtrgcA4+LH+LrlpK0wK2n+Mub3Rd4pfPhsLdpRQtERJJRsNpfjAnDcsV
 BfvxNsQnmiL1YQdpl2klPlBIGBJSs4rRq0r3T+VctTgCBYRG8bH/sdzmGif3z4L4T2
 MRKYA9Xga4xoQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sohaib.nadeem@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Josip Pavic <josip.pavic@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: fixed integer types and null check
 locations" failed to apply to 5.10-stable tree
Date: Wed, 27 Mar 2024 08:19:40 -0400
Message-ID: <20240327121940.2835388-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 616b39467e816851335277d817ec98b7a9b92758 Mon Sep 17 00:00:00 2001
From: Sohaib Nadeem <sohaib.nadeem@amd.com>
Date: Wed, 31 Jan 2024 16:40:37 -0500
Subject: [PATCH] drm/amd/display: fixed integer types and null check locations

[why]:
issues fixed:
- comparison with wider integer type in loop condition which can cause
infinite loops
- pointer dereference before null check

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Josip Pavic <josip.pavic@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Sohaib Nadeem <sohaib.nadeem@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/dc/bios/bios_parser2.c   | 16 ++++++++++------
 .../drm/amd/display/dc/link/link_validation.c    |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 960c4b4f6ddf3..05f392501c0ae 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1850,19 +1850,21 @@ static enum bp_result get_firmware_info_v3_2(
 		/* Vega12 */
 		smu_info_v3_2 = GET_IMAGE(struct atom_smu_info_v3_2,
 							DATA_TABLES(smu_info));
-		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_2->gpuclk_ss_percentage);
 		if (!smu_info_v3_2)
 			return BP_RESULT_BADBIOSTABLE;
 
+		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_2->gpuclk_ss_percentage);
+
 		info->default_engine_clk = smu_info_v3_2->bootup_dcefclk_10khz * 10;
 	} else if (revision.minor == 3) {
 		/* Vega20 */
 		smu_info_v3_3 = GET_IMAGE(struct atom_smu_info_v3_3,
 							DATA_TABLES(smu_info));
-		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_3->gpuclk_ss_percentage);
 		if (!smu_info_v3_3)
 			return BP_RESULT_BADBIOSTABLE;
 
+		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_3->gpuclk_ss_percentage);
+
 		info->default_engine_clk = smu_info_v3_3->bootup_dcefclk_10khz * 10;
 	}
 
@@ -2422,10 +2424,11 @@ static enum bp_result get_integrated_info_v11(
 	info_v11 = GET_IMAGE(struct atom_integrated_system_info_v1_11,
 					DATA_TABLES(integratedsysteminfo));
 
-	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v11->gpuclk_ss_percentage);
 	if (info_v11 == NULL)
 		return BP_RESULT_BADBIOSTABLE;
 
+	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v11->gpuclk_ss_percentage);
+
 	info->gpu_cap_info =
 	le32_to_cpu(info_v11->gpucapinfo);
 	/*
@@ -2637,11 +2640,12 @@ static enum bp_result get_integrated_info_v2_1(
 
 	info_v2_1 = GET_IMAGE(struct atom_integrated_system_info_v2_1,
 					DATA_TABLES(integratedsysteminfo));
-	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_1->gpuclk_ss_percentage);
 
 	if (info_v2_1 == NULL)
 		return BP_RESULT_BADBIOSTABLE;
 
+	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_1->gpuclk_ss_percentage);
+
 	info->gpu_cap_info =
 	le32_to_cpu(info_v2_1->gpucapinfo);
 	/*
@@ -2799,11 +2803,11 @@ static enum bp_result get_integrated_info_v2_2(
 	info_v2_2 = GET_IMAGE(struct atom_integrated_system_info_v2_2,
 					DATA_TABLES(integratedsysteminfo));
 
-	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_2->gpuclk_ss_percentage);
-
 	if (info_v2_2 == NULL)
 		return BP_RESULT_BADBIOSTABLE;
 
+	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_2->gpuclk_ss_percentage);
+
 	info->gpu_cap_info =
 	le32_to_cpu(info_v2_2->gpucapinfo);
 	/*
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.c b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
index 1c038e2a527b3..1aed55b0ab6a0 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_validation.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
@@ -359,7 +359,7 @@ bool link_validate_dpia_bandwidth(const struct dc_stream_state *stream, const un
 	struct dc_link *dpia_link[MAX_DPIA_NUM] = {0};
 	int num_dpias = 0;
 
-	for (uint8_t i = 0; i < num_streams; ++i) {
+	for (unsigned int i = 0; i < num_streams; ++i) {
 		if (stream[i].signal == SIGNAL_TYPE_DISPLAY_PORT) {
 			/* new dpia sst stream, check whether it exceeds max dpia */
 			if (num_dpias >= MAX_DPIA_NUM)
-- 
2.43.0




