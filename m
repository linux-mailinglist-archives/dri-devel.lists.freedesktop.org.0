Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C7AAA2FE
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B5110E5E1;
	Mon,  5 May 2025 23:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZTPCFWtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6ED10E5E1;
 Mon,  5 May 2025 23:07:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28EDDA4D33A;
 Mon,  5 May 2025 23:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BB4C4CEE4;
 Mon,  5 May 2025 23:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486460;
 bh=N8IwUxpIjGA+yNQjDHdf8PS3Q1MkIP6rgd8fc2Nu+b0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZTPCFWtM/oFKdhkMPEjzm+NHdEGajZYQ8g53H1bmIVRjdo60UDypHZp2yFhNDBF/7
 E/J7owqgB/FsXD5cVUczppRowg1NsN3Y7zzTEaMKsqbuIWUH3ZQoe4htnXZGi42QUe
 SWi/S9R3pCWgSaimnAlXiMZlmCm8b3F75u/tiITwaFnm2WNoUD66ZWE0Sb21dDO+jj
 7UTVZLY9eVf8iKO3EMgqGCJ9tv7dIGEPf+4kQ3D9kCSb9Wp855EX/AEpcL9CHKau6T
 3V3KfWo+4bN2wOLwfAELXJ4nXB5udWO7hllPPtmIK4pl427ht4lA3IN+t4UY96lDTR
 dEQ6o9HDaEfaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jing Zhou <Jing.Zhou@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Chris Park <chris.park@amd.com>, Eric Yang <eric.yang@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Charlene.Liu@amd.com,
 ovidiu.bunea@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 041/212] drm/amd/display: Guard against setting
 dispclk low for dcn31x
Date: Mon,  5 May 2025 19:03:33 -0400
Message-Id: <20250505230624.2692522-41-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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

From: Jing Zhou <Jing.Zhou@amd.com>

[ Upstream commit 9c2f4ae64bb6f6d83a54d88b9ee0f369cdbb9fa8 ]

[WHY]
We should never apply a minimum dispclk value while in
prepare_bandwidth or while displays are active. This is
always an optimizaiton for when all displays are disabled.

[HOW]
Defer dispclk optimization until safe_to_lower = true
and display_count reaches 0.

Since 0 has a special value in this logic (ie. no dispclk
required) we also need adjust the logic that clamps it for
the actual request to PMFW.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Reviewed-by: Chris Park <chris.park@amd.com>
Reviewed-by: Eric Yang <eric.yang@amd.com>
Signed-off-by: Jing Zhou <Jing.Zhou@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        | 20 +++++++++++--------
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        | 13 +++++++++---
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 09eb1bc9aa030..9549f9c152291 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -116,7 +116,7 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
 	struct dc *dc = clk_mgr_base->ctx->dc;
-	int display_count;
+	int display_count = 0;
 	bool update_dppclk = false;
 	bool update_dispclk = false;
 	bool dpp_clock_lowered = false;
@@ -192,15 +192,19 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 		update_dppclk = true;
 	}
 
-	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
-		/* No need to apply the w/a if we haven't taken over from bios yet */
-		if (clk_mgr_base->clks.dispclk_khz)
-			dcn315_disable_otg_wa(clk_mgr_base, context, true);
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz) &&
+	    (new_clocks->dispclk_khz > 0 || (safe_to_lower && display_count == 0))) {
+		int requested_dispclk_khz = new_clocks->dispclk_khz;
 
+		dcn315_disable_otg_wa(clk_mgr_base, context, true);
+
+		/* Clamp the requested clock to PMFW based on their limit. */
+		if (dc->debug.min_disp_clk_khz > 0 && requested_dispclk_khz < dc->debug.min_disp_clk_khz)
+			requested_dispclk_khz = dc->debug.min_disp_clk_khz;
+
+		dcn315_smu_set_dispclk(clk_mgr, requested_dispclk_khz);
 		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
-		dcn315_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
-		if (clk_mgr_base->clks.dispclk_khz)
-			dcn315_disable_otg_wa(clk_mgr_base, context, false);
+		dcn315_disable_otg_wa(clk_mgr_base, context, false);
 
 		update_dispclk = true;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index 29d2003fb7129..afce15aa2ff10 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -153,7 +153,7 @@ static void dcn316_update_clocks(struct clk_mgr *clk_mgr_base,
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
 	struct dc *dc = clk_mgr_base->ctx->dc;
-	int display_count;
+	int display_count = 0;
 	bool update_dppclk = false;
 	bool update_dispclk = false;
 	bool dpp_clock_lowered = false;
@@ -226,11 +226,18 @@ static void dcn316_update_clocks(struct clk_mgr *clk_mgr_base,
 		update_dppclk = true;
 	}
 
-	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz) &&
+	    (new_clocks->dispclk_khz > 0 || (safe_to_lower && display_count == 0))) {
+		int requested_dispclk_khz = new_clocks->dispclk_khz;
+
 		dcn316_disable_otg_wa(clk_mgr_base, context, safe_to_lower, true);
 
+		/* Clamp the requested clock to PMFW based on their limit. */
+		if (dc->debug.min_disp_clk_khz > 0 && requested_dispclk_khz < dc->debug.min_disp_clk_khz)
+			requested_dispclk_khz = dc->debug.min_disp_clk_khz;
+
+		dcn316_smu_set_dispclk(clk_mgr, requested_dispclk_khz);
 		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
-		dcn316_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
 		dcn316_disable_otg_wa(clk_mgr_base, context, safe_to_lower, false);
 
 		update_dispclk = true;
-- 
2.39.5

