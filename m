Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B788315DC80
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829DF6F989;
	Fri, 14 Feb 2020 15:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6866E826;
 Fri, 14 Feb 2020 15:53:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09C3224676;
 Fri, 14 Feb 2020 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695636;
 bh=zERLyX57mTufDyJ7gVj+1+koC2enHgrS/6UrUIXrfNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xqcIwbD8gSA+/1iE3yFjTBIjiSebqVaa8eQemCTCECaRJWlGAIjQ3eO9pl9lc0NZb
 MGKurRM1P9l7Y5I1NirWIdcGckjWqw4Wp6Q/V20g4I9GxsdJ8ADMSSFOHdqxDxbplm
 LMJb5dL+w4W+N1Lm9Cf0SHgSBECGjPYCPVAh2ecs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 232/542] drm/amd/display: Fix
 update_bw_bounding_box Calcs
Date: Fri, 14 Feb 2020 10:43:44 -0500
Message-Id: <20200214154854.6746-232-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Sung Lee <sung.lee@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Yongqiang Sun <yongqiang.sun@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sung Lee <sung.lee@amd.com>

[ Upstream commit 615b9b585eb57c1d49382d16a62de768f2c6a340 ]

[Why]
Previously update_bw_bounding_box for RN was commented out
due to incorrect values causing BSOD on Hybrid Graphics.
However, commenting out this function also may cause issues
such as underflow in certain cases such as 2x4K displays.

[How]
Fix dram_speed_mts calculations.
Update from proper index of clock_limits[]

Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index fe0ed4c09ad0a..83cda43a1b6b3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -1352,12 +1352,6 @@ struct display_stream_compressor *dcn21_dsc_create(
 
 static void update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
-	/*
-	TODO: Fix this function to calcualte correct values.
-	There are known issues with this function currently
-	that will need to be investigated. Use hardcoded known good values for now.
-
-
 	struct dcn21_resource_pool *pool = TO_DCN21_RES_POOL(dc->res_pool);
 	struct clk_limit_table *clk_table = &bw_params->clk_table;
 	int i;
@@ -1372,11 +1366,10 @@ static void update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 		dcn2_1_soc.clock_limits[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
 		dcn2_1_soc.clock_limits[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
 		dcn2_1_soc.clock_limits[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
-		dcn2_1_soc.clock_limits[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 16 / 1000;
+		dcn2_1_soc.clock_limits[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
 	}
-	dcn2_1_soc.clock_limits[i] = dcn2_1_soc.clock_limits[i - i];
+	dcn2_1_soc.clock_limits[i] = dcn2_1_soc.clock_limits[i - 1];
 	dcn2_1_soc.num_states = i;
-	*/
 }
 
 /* Temporary Place holder until we can get them from fuse */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
