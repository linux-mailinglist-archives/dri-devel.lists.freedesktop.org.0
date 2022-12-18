Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7BF650021
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3210E238;
	Sun, 18 Dec 2022 16:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8CF10E237;
 Sun, 18 Dec 2022 16:09:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA90960DE2;
 Sun, 18 Dec 2022 16:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B44C433D2;
 Sun, 18 Dec 2022 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379779;
 bh=G3ROSK40a4GXYNI2mhMT7pqzHEVcNH4bNL+rSJgEHkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxBWNw6AdC7+OYvqyX76vDQ1iBafDtDNF6N+AFZiach5wwNQhjlpQufi80FjUuz90
 dFR97iMg2jfPNgmGACwoOPrlpUnOMrzKjr+0RY8aGm05eybr3UFX6WaA4VbtbjOQA1
 gqQLoy1Lib68/ST7HrCqH3uyd7vW2YtzSNw3/15TNwuN43pJEuOih2TJKfHzJg0RFx
 CLY+WMSJIuwBVg0acWbLoeMyVEjn9FtriO11G4SrFXBaGIt5RE/Ivn4n1Y2RPdB6cD
 idWCnFIdXdZWuj9pRzk5r3p0TeHAMxnIWw4WlzuY8Njn6FafPQ5CNBavL9aLOl4T3c
 yUr4DP+IPSbcw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 31/73] drm/amd/display: Disable DRR actions during
 state commit
Date: Sun, 18 Dec 2022 11:06:59 -0500
Message-Id: <20221218160741.927862-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
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
Cc: felipe.clark@amd.com, dri-devel@lists.freedesktop.org,
 Jun Lei <Jun.Lei@amd.com>, Sasha Levin <sashal@kernel.org>,
 Anthony.Koo@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 alex.hung@amd.com, aurabindo.pillai@amd.com, Alvin.Lee2@amd.com,
 Alan Liu <HaoPing.Liu@amd.com>, Jingwen.Zhu@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Xinhui.Pan@amd.com,
 Roman.Li@amd.com, wayne.lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wesley Chalmers <Wesley.Chalmers@amd.com>

[ Upstream commit de020e5fa9ebc6fc32e82ae6ccb0282451ed937c ]

[WHY]
Committing a state while performing DRR actions can cause underflow.

[HOW]
Disabled features performing DRR actions during state commit.
Need to follow-up on why DRR actions affect state commit.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index fb59fed8f425..9d369155901a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -973,8 +973,5 @@ void dcn30_prepare_bandwidth(struct dc *dc,
 			dc->clk_mgr->funcs->set_max_memclk(dc->clk_mgr, dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
 
 	dcn20_prepare_bandwidth(dc, context);
-
-	dc_dmub_srv_p_state_delegate(dc,
-		context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching, context);
 }
 
-- 
2.35.1

