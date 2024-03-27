Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F888DE5B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150410FB69;
	Wed, 27 Mar 2024 12:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n/MVnGpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6C110FB66;
 Wed, 27 Mar 2024 12:15:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92C3061515;
 Wed, 27 Mar 2024 12:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EACC433C7;
 Wed, 27 Mar 2024 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541747;
 bh=RQadja7aJUKunpltXo1cuYEXQVwcU76V8Y1Bktc/3nc=;
 h=From:To:Cc:Subject:Date:From;
 b=n/MVnGpK+KhPRkQW6cTVLh0nEvlBFp7e/nyVadYAByW8R/1H9KZgKOh96rY0pdH/d
 iVIWjeAKmza2ag+vQWHDVGO/dGS3W++klwptHW1Aq/WLild91kP6AuRfvctjJ1J6HB
 SMQ8d53L37EVyROKOqz9EVinVZZCSTeBWTq6Kquz/oE7l1gRngEwYDBEL8DiNuR17y
 kw/juND2yHc+S/6fKT0KtwqmcaT92201CsdJbHYn2RBEscHlZDhio57rk/O9eBzSpf
 qEGKj583tzTHRvfo5e4zRJuxYLn7SPc9KYjlLBlfEYqAtVXlC+ysiBwbXV9RXoQDBF
 wjtSHZ6iCH6Jw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	roman.li@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Fix array-index-out-of-bounds in
 dcn35_clkmgr" failed to apply to 5.15-stable tree
Date: Wed, 27 Mar 2024 08:15:44 -0400
Message-ID: <20240327121545.2832156-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a8edc9cc0b14e3769bbc9b82d00e5e5fc6b5ff0a Mon Sep 17 00:00:00 2001
From: Roman Li <roman.li@amd.com>
Date: Tue, 30 Jan 2024 18:07:24 -0500
Subject: [PATCH] drm/amd/display: Fix array-index-out-of-bounds in
 dcn35_clkmgr

[Why]
There is a potential memory access violation while
iterating through array of dcn35 clks.

[How]
Limit iteration per array size.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index 36e5bb611fb10..c378b879c76d8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -658,10 +658,13 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 	struct clk_limit_table_entry def_max = bw_params->clk_table.entries[bw_params->clk_table.num_entries - 1];
 	uint32_t max_fclk = 0, min_pstate = 0, max_dispclk = 0, max_dppclk = 0;
 	uint32_t max_pstate = 0, max_dram_speed_mts = 0, min_dram_speed_mts = 0;
+	uint32_t num_memps, num_fclk, num_dcfclk;
 	int i;
 
 	/* Determine min/max p-state values. */
-	for (i = 0; i < clock_table->NumMemPstatesEnabled; i++) {
+	num_memps = (clock_table->NumMemPstatesEnabled > NUM_MEM_PSTATE_LEVELS) ? NUM_MEM_PSTATE_LEVELS :
+		clock_table->NumMemPstatesEnabled;
+	for (i = 0; i < num_memps; i++) {
 		uint32_t dram_speed_mts = calc_dram_speed_mts(&clock_table->MemPstateTable[i]);
 
 		if (is_valid_clock_value(dram_speed_mts) && dram_speed_mts > max_dram_speed_mts) {
@@ -673,7 +676,7 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 	min_dram_speed_mts = max_dram_speed_mts;
 	min_pstate = max_pstate;
 
-	for (i = 0; i < clock_table->NumMemPstatesEnabled; i++) {
+	for (i = 0; i < num_memps; i++) {
 		uint32_t dram_speed_mts = calc_dram_speed_mts(&clock_table->MemPstateTable[i]);
 
 		if (is_valid_clock_value(dram_speed_mts) && dram_speed_mts < min_dram_speed_mts) {
@@ -702,9 +705,13 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 	/* Base the clock table on dcfclk, need at least one entry regardless of pmfw table */
 	ASSERT(clock_table->NumDcfClkLevelsEnabled > 0);
 
-	max_fclk = find_max_clk_value(clock_table->FclkClocks_Freq, clock_table->NumFclkLevelsEnabled);
+	num_fclk = (clock_table->NumFclkLevelsEnabled > NUM_FCLK_DPM_LEVELS) ? NUM_FCLK_DPM_LEVELS :
+		clock_table->NumFclkLevelsEnabled;
+	max_fclk = find_max_clk_value(clock_table->FclkClocks_Freq, num_fclk);
 
-	for (i = 0; i < clock_table->NumDcfClkLevelsEnabled; i++) {
+	num_dcfclk = (clock_table->NumFclkLevelsEnabled > NUM_DCFCLK_DPM_LEVELS) ? NUM_DCFCLK_DPM_LEVELS :
+		clock_table->NumDcfClkLevelsEnabled;
+	for (i = 0; i < num_dcfclk; i++) {
 		int j;
 
 		/* First search defaults for the clocks we don't read using closest lower or equal default dcfclk */
-- 
2.43.0




