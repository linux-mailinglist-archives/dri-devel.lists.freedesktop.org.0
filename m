Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1D7E3CDF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1803F10E555;
	Tue,  7 Nov 2023 12:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9056310E553;
 Tue,  7 Nov 2023 12:21:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 52B0EB8169E;
 Tue,  7 Nov 2023 12:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B11CC433C8;
 Tue,  7 Nov 2023 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359668;
 bh=Os/ZvETFoFPYYGZspBCeDqKnqlyuNkYjB8BIGvaMwU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GEQpRNhsi/VUfl++6Vh4XxEswyCIj8j7d33hjOI9bI9/8D/NqKtKo1VemdmXiWtpK
 /V2DT8iRo9ubUfsLxWae78hAnO8mQyqSGQKeZR7u9KhHPcHcU6H3L6cSyoBUMA1JjX
 VFmeQ9bUEOy3tFSlYNqA546dtG8cRNBEpS22CHqpATRhg6hPYG9A20urcz8eBndJu7
 4ACylLAX90hX2nKu9XrrG6vGbMgQj+iQtCVkIkhNgi33Kkt7/DXB0eWcyZYmEeEG3V
 oFLiaHYBkW1pKsjkBxD7/cU2IHpGH8qnOauvW03cb0RLwmrmT30SvgwuIXLPoGoM72
 XQpZnjfvlOPZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 32/40] drm/amd/display: fix num_ways overflow error
Date: Tue,  7 Nov 2023 07:16:34 -0500
Message-ID: <20231107121837.3759358-32-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
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
Cc: Sasha Levin <sashal@kernel.org>, Dillon.Varone@amd.com, moadhuri@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Roman Li <roman.li@amd.com>,
 Samson Tam <samson.tam@amd.com>, wenjing.liu@amd.com, syedsaaem.rizvi@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Alvin.Lee2@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samson Tam <samson.tam@amd.com>

[ Upstream commit 79f3f1b66753b3a3a269d73676bf50987921f267 ]

[Why]
Helper function calculates num_ways using 32-bit.  But is
 returned as 8-bit.  If num_ways exceeds 8-bit, then it
 reports back the incorrect num_ways and erroneously
 uses MALL when it should not

[How]
Make returned value 32-bit and convert after it checks
 against caps.cache_num_ways, which is under 8-bit

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Roman Li <roman.li@amd.com>
Signed-off-by: Samson Tam <samson.tam@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 018376146d977..be59e1c02f8aa 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -214,7 +214,7 @@ static bool dcn32_check_no_memory_request_for_cab(struct dc *dc)
 static uint32_t dcn32_calculate_cab_allocation(struct dc *dc, struct dc_state *ctx)
 {
 	int i;
-	uint8_t num_ways = 0;
+	uint32_t num_ways = 0;
 	uint32_t mall_ss_size_bytes = 0;
 
 	mall_ss_size_bytes = ctx->bw_ctx.bw.dcn.mall_ss_size_bytes;
@@ -244,7 +244,8 @@ static uint32_t dcn32_calculate_cab_allocation(struct dc *dc, struct dc_state *c
 bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 {
 	union dmub_rb_cmd cmd;
-	uint8_t ways, i;
+	uint8_t i;
+	uint32_t ways;
 	int j;
 	bool mall_ss_unsupported = false;
 	struct dc_plane_state *plane = NULL;
@@ -304,7 +305,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.cab.header.type = DMUB_CMD__CAB_FOR_SS;
 				cmd.cab.header.sub_type = DMUB_CMD__CAB_DCN_SS_FIT_IN_CAB;
 				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
-				cmd.cab.cab_alloc_ways = ways;
+				cmd.cab.cab_alloc_ways = (uint8_t)ways;
 
 				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
-- 
2.42.0

