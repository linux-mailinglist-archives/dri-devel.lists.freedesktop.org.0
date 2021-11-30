Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5046385E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364EC6EA0B;
	Tue, 30 Nov 2021 14:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84146EA0B;
 Tue, 30 Nov 2021 14:57:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E66DB81A35;
 Tue, 30 Nov 2021 14:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAC3C58329;
 Tue, 30 Nov 2021 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283791;
 bh=hYNxbfEimHbEDbWqSzh1CkNFIQwTJln1jdBiUDtkhaM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=adSssKAoZAKNg4tP0s6fNetsYtt2h1H7C2SSUr2qBtk1RLxYUICvejX28+XtIK9YR
 gInDfJYpusoGBY5/TsCyWVCLgZ37tOt4WVMXQCR9+4cTam1rnE9I+Op7TkpueR8Fag
 oeZmp4YBWs1t1inOFMxAAuQdW93I/TJNAr8gKu9aRGISN4Ihn5/IgVQDDMnVyONBDJ
 Zl2Qx9JQCrSdsCFyY+p54ZCQkIZPytZPwdtL9Dy9vIqD6l5nTLeOaTMdlvuEf//A2o
 VrZxdz3UxN0pvgtAoO3/6A90ySUoY5+6IJ9iHuF+uHRMdgOaleFpgmxk8iOYVgHam9
 U6hxecOGq4UKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 57/68] drm/amd/display: Fixed DSC would not PG
 after removing DSC stream
Date: Tue, 30 Nov 2021 09:46:53 -0500
Message-Id: <20211130144707.944580-57-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
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
Cc: haonan.wang2@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Yi-Ling Chen <Yi-Ling.Chen2@amd.com>, wyatt.wood@amd.com, Jun.Lei@amd.com,
 Anthony Koo <Anthony.Koo@amd.com>, hanghong.ma@amd.com, Jimmy.Kizito@amd.com,
 Sasha Levin <sashal@kernel.org>, Josip.Pavic@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, paul.hsieh@amd.com,
 agustin.gutierrez@amd.com, dillon.varone@amd.com, eric.yang2@amd.com,
 Wesley.Chalmers@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Xinhui.Pan@amd.com, christian.koenig@amd.com, vladimir.stempen@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Derek.Lai@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yi-Ling Chen <Yi-Ling.Chen2@amd.com>

[ Upstream commit 2da8f0beece08a5c3c2e20c0e38e1a4bbc153f9e ]

[WHY]
Due to pass the wrong parameter down to the enable_stream_gating(),
it would cause the DSC of the removing stream would not be PG.

[HOW]
To pass the correct parameter down th the enable_stream_gating().

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Yi-Ling Chen <Yi-Ling.Chen2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c        | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 3af49cdf89ebd..2e0fb2ead0a3a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1566,7 +1566,7 @@ void dcn10_reset_hw_ctx_wrap(
 
 			dcn10_reset_back_end_for_pipe(dc, pipe_ctx_old, dc->current_state);
 			if (hws->funcs.enable_stream_gating)
-				hws->funcs.enable_stream_gating(dc, pipe_ctx);
+				hws->funcs.enable_stream_gating(dc, pipe_ctx_old);
 			if (old_clk)
 				old_clk->funcs->cs_power_down(old_clk);
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index a47ba1d45be92..027f221a6d7d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2262,7 +2262,7 @@ void dcn20_reset_hw_ctx_wrap(
 
 			dcn20_reset_back_end_for_pipe(dc, pipe_ctx_old, dc->current_state);
 			if (hws->funcs.enable_stream_gating)
-				hws->funcs.enable_stream_gating(dc, pipe_ctx);
+				hws->funcs.enable_stream_gating(dc, pipe_ctx_old);
 			if (old_clk)
 				old_clk->funcs->cs_power_down(old_clk);
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 3afa1159a5f7d..251414babffa3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -588,7 +588,7 @@ void dcn31_reset_hw_ctx_wrap(
 
 			dcn31_reset_back_end_for_pipe(dc, pipe_ctx_old, dc->current_state);
 			if (hws->funcs.enable_stream_gating)
-				hws->funcs.enable_stream_gating(dc, pipe_ctx);
+				hws->funcs.enable_stream_gating(dc, pipe_ctx_old);
 			if (old_clk)
 				old_clk->funcs->cs_power_down(old_clk);
 		}
-- 
2.33.0

