Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E248943A34
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DC010E715;
	Thu,  1 Aug 2024 00:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kMTw/ntP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20710E715;
 Thu,  1 Aug 2024 00:12:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62C1962660;
 Thu,  1 Aug 2024 00:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AA6C116B1;
 Thu,  1 Aug 2024 00:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471136;
 bh=IGYFVng4Ye8vWbtCxK0TZd0qapMU2t/214ak23Cqqzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kMTw/ntPZ4HUSqq4ejBKC6evUyFiSKacRSFdVFlkaMUA+X40jDkFQm/9JUwG6BisB
 dFr6EwRxOR1411b0Ud18jg1NKrC+uC1GoxOaZeImWT2ZFK/U+mNfe5zgxoroI7DlSN
 ztyRq/nsYzD/9uZcHWDExf6veXXpItnT+8yidNRSNuz5s2vIR/RsqDgNb9XM7brTyT
 MvPQ3p3fcLFyp82AhaebUYxgnzI4RfpzCQDef+Uo5FIt6x8TJ7zGtWNmZeHN1ydKRE
 CALhzMBRFEHLFYD0kTIAtVXKkdE03JZmGxbxj4cziCeBiIGQJZsl0reDUv4odEVvvt
 qRXlCsdncVuBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, samson.tam@amd.com,
 wenjing.liu@amd.com, chaitanya.dhere@amd.com, hamza.mahfooz@amd.com,
 sohaib.nadeem@amd.com, Qingqing.Zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 030/121] drm/amd/display: Fix index may exceed
 array range within fpu_update_bw_bounding_box
Date: Wed, 31 Jul 2024 19:59:28 -0400
Message-ID: <20240801000834.3930818-30-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit 188fd1616ec43033cedbe343b6579e9921e2d898 ]

[Why]
Coverity reports OVERRUN warning. soc.num_states could
be 40. But array range of bw_params->clk_table.entries is 8.

[How]
Assert if soc.num_states greater than 8.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c | 10 ++++++++++
 drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c | 10 ++++++++++
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 10 ++++++++++
 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c | 10 ++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
index e2bcd205aa936..8da97a96b1ceb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
@@ -304,6 +304,16 @@ void dcn302_fpu_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_p
 			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 		}
 
+		/* bw_params->clk_table.entries[MAX_NUM_DPM_LVL].
+		 * MAX_NUM_DPM_LVL is 8.
+		 * dcn3_02_soc.clock_limits[DC__VOLTAGE_STATES].
+		 * DC__VOLTAGE_STATES is 40.
+		 */
+		if (num_states > MAX_NUM_DPM_LVL) {
+			ASSERT(0);
+			return;
+		}
+
 		dcn3_02_soc.num_states = num_states;
 		for (i = 0; i < dcn3_02_soc.num_states; i++) {
 			dcn3_02_soc.clock_limits[i].state = i;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
index 3f02bb806d421..e968870a4b810 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
@@ -310,6 +310,16 @@ void dcn303_fpu_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_p
 			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 		}
 
+		/* bw_params->clk_table.entries[MAX_NUM_DPM_LVL].
+		 * MAX_NUM_DPM_LVL is 8.
+		 * dcn3_02_soc.clock_limits[DC__VOLTAGE_STATES].
+		 * DC__VOLTAGE_STATES is 40.
+		 */
+		if (num_states > MAX_NUM_DPM_LVL) {
+			ASSERT(0);
+			return;
+		}
+
 		dcn3_03_soc.num_states = num_states;
 		for (i = 0; i < dcn3_03_soc.num_states; i++) {
 			dcn3_03_soc.clock_limits[i].state = i;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index f6fe0a64beacf..ebcf5ece209a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -3232,6 +3232,16 @@ void dcn32_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_pa
 				dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 			}
 
+			/* bw_params->clk_table.entries[MAX_NUM_DPM_LVL].
+			 * MAX_NUM_DPM_LVL is 8.
+			 * dcn3_02_soc.clock_limits[DC__VOLTAGE_STATES].
+			 * DC__VOLTAGE_STATES is 40.
+			 */
+			if (num_states > MAX_NUM_DPM_LVL) {
+				ASSERT(0);
+				return;
+			}
+
 			dcn3_2_soc.num_states = num_states;
 			for (i = 0; i < dcn3_2_soc.num_states; i++) {
 				dcn3_2_soc.clock_limits[i].state = i;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
index ff4d795c79664..4297402bdab39 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
@@ -803,6 +803,16 @@ void dcn321_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
 			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 		}
 
+		/* bw_params->clk_table.entries[MAX_NUM_DPM_LVL].
+		 * MAX_NUM_DPM_LVL is 8.
+		 * dcn3_02_soc.clock_limits[DC__VOLTAGE_STATES].
+		 * DC__VOLTAGE_STATES is 40.
+		 */
+		if (num_states > MAX_NUM_DPM_LVL) {
+			ASSERT(0);
+			return;
+		}
+
 		dcn3_21_soc.num_states = num_states;
 		for (i = 0; i < dcn3_21_soc.num_states; i++) {
 			dcn3_21_soc.clock_limits[i].state = i;
-- 
2.43.0

