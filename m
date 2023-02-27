Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F806A3737
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411110E316;
	Mon, 27 Feb 2023 02:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A791510E312;
 Mon, 27 Feb 2023 02:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63BF0B80CD9;
 Mon, 27 Feb 2023 02:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B39DC433EF;
 Mon, 27 Feb 2023 02:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463658;
 bh=INn+U1GXAUe+gaSxv5/iSa1snUoDzIdU/5IrwnueNkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4+XDPQbf5u70aaSKmXpFtHjzIBOuu/IsVBemcoDqBw+dqrkEYKboO+BoPm306Zx3
 T13iFmfVrvnGB1PFb1SD3Fbce/+r2qC3fNhS2KRSQCswvld0MwTOgZgtgY0qj868H2
 09DM+NMAKpmg5v20MttSHB4d885QrLYv1Gve7ZHEUaF47btkns5VeqcFaOVK4+dIKH
 UCt6wM8r0W2yPjut0qAsckIIL0vb/eCU8Z/Ts1FeS1e2UZaTZ4uKuaT2yLr8XBFwXN
 gGvpc2hWOth82QtaL4xOxon72JBvvSQZzo3cuNYisnNdKQ35KFFE9/aBwi4LeNAGq6
 1+Mp9kaJwllKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 44/58] drm/amd/display: Do not set DRR on pipe
 commit
Date: Sun, 26 Feb 2023 21:04:42 -0500
Message-Id: <20230227020457.1048737-44-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
Cc: felipe.clark@amd.com, wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 Jun Lei <Jun.Lei@amd.com>, Sasha Levin <sashal@kernel.org>,
 Anthony.Koo@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, Alvin.Lee2@amd.com, HaoPing.Liu@amd.com,
 sunpeng.li@amd.com, mwen@igalia.com, sungjoon.kim@amd.com,
 Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com, Roman.Li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wesley Chalmers <Wesley.Chalmers@amd.com>

[ Upstream commit 4f1b5e739dfd1edde33329e3f376733a131fb1ff ]

[WHY]
Writing to DRR registers such as OTG_V_TOTAL_MIN on the same frame as a
pipe commit can cause underflow.

[HOW]
Defer all DPP adjustment requests till optimized_required is false.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 8c50457112649..c20e9f76f0213 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -992,8 +992,5 @@ void dcn30_prepare_bandwidth(struct dc *dc,
 			dc->clk_mgr->funcs->set_max_memclk(dc->clk_mgr, dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
 
 	dcn20_prepare_bandwidth(dc, context);
-
-	dc_dmub_srv_p_state_delegate(dc,
-		context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching, context);
 }
 
-- 
2.39.0

