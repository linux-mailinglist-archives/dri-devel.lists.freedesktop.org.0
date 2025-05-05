Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C6AA9FEB
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFEC10E498;
	Mon,  5 May 2025 22:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lSNYfxbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191EB10E498;
 Mon,  5 May 2025 22:29:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ABCBFA4CCEC;
 Mon,  5 May 2025 22:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A715C4CEEF;
 Mon,  5 May 2025 22:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484170;
 bh=WkH9QAzOg9qFlj+eC8SmU7hdqXPvZNALVFTPQXnoYgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lSNYfxbIgEcckqhWz0E7LYaR8RUD1pTTcLOcNHSZnBfmHrS9Di3zf/XwYHIuxMLgL
 ytk26zcy7c4++rdVSQQKGfzlz2vheKFWqQ3iD2GinLHi34x60hreJjLxNA7zPyQwLl
 xE47MujzjG1s2RYkIy0kmINTsUOIQfOnJgCs2wq4JCBm0mDJ2fd5lh2nyRFNUsVQ+F
 veJebaUZjmahHuuFp1Ein5Y9YXNBuoVnjFf63i/8czn5OiP2zTZ0VV4PQDpLzNwqd0
 FdBhLxk4bkKv5OTrQ2ulo5GEp77cE2oNG+lUENySVCrnBAEJt0Japt5rFvMzCTbJ37
 eT+b7yDzT5fwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Gabe Teeger <gabe.teeger@amd.com>, Leo Chen <leo.chen@amd.com>,
 Syed Hassan <syed.hassan@amd.com>, Roman Li <roman.li@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Charlene.Liu@amd.com,
 alex.hung@amd.com, zaeem.mohamed@amd.com, Ausef.Yousof@amd.com,
 Nicholas.Susanto@amd.com, sungjoon.kim@amd.com, PeiChen.Huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 385/642] drm/amd/display: Guard against setting
 dispclk low when active
Date: Mon,  5 May 2025 18:10:01 -0400
Message-Id: <20250505221419.2672473-385-sashal@kernel.org>
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 72d7a7fa1f2404fd31c84a8f808b1b37021a3a9e ]

[Why]
We should never apply a minimum dispclk value while in prepare_bandwidth
or while displays are active. This is always an optimization for when
all displays are disabled.

[How]
Defer dispclk optimization until safe_to_lower = true and display_count
reaches 0.

Since 0 has a special value in this logic (ie. no dispclk required)
we also need adjust the logic that clamps it for the actual request
to PMFW.

Reviewed-by: Gabe Teeger <gabe.teeger@amd.com>
Reviewed-by: Leo Chen <leo.chen@amd.com>
Reviewed-by: Syed Hassan <syed.hassan@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c    | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index 1648226586e22..1f47931c2dafc 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -467,14 +467,19 @@ void dcn35_update_clocks(struct clk_mgr *clk_mgr_base,
 		update_dppclk = true;
 	}
 
-	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz) &&
+	    (new_clocks->dispclk_khz > 0 || (safe_to_lower && display_count == 0))) {
+		int requested_dispclk_khz = new_clocks->dispclk_khz;
+
 		dcn35_disable_otg_wa(clk_mgr_base, context, safe_to_lower, true);
 
-		if (dc->debug.min_disp_clk_khz > 0 && new_clocks->dispclk_khz < dc->debug.min_disp_clk_khz)
-			new_clocks->dispclk_khz = dc->debug.min_disp_clk_khz;
+		/* Clamp the requested clock to PMFW based on their limit. */
+		if (dc->debug.min_disp_clk_khz > 0 && requested_dispclk_khz < dc->debug.min_disp_clk_khz)
+			requested_dispclk_khz = dc->debug.min_disp_clk_khz;
 
+		dcn35_smu_set_dispclk(clk_mgr, requested_dispclk_khz);
 		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
-		dcn35_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+
 		dcn35_disable_otg_wa(clk_mgr_base, context, safe_to_lower, false);
 
 		update_dispclk = true;
-- 
2.39.5

