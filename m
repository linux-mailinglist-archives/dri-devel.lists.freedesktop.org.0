Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3174240D95
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 21:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7C889DDD;
	Mon, 10 Aug 2020 19:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9F89CD4;
 Mon, 10 Aug 2020 19:09:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E36D622BEA;
 Mon, 10 Aug 2020 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086586;
 bh=sP4va8tw/LWQq1aLYu/jsNtjodsiB3MIonkDEyyS1RI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UlojHyICd57g9qHSLgu9y7jBwV3J/KohZCtxiMJQF7dZm2jogp/nnpjQBgyWs8+qR
 KLDsUuATb5Qp31irmIRBTeMUQ6v+ME3RdyMjS37cMq+nnzh4uzCvhaeN/oHXepu36c
 vQijQmlTdGGgszgnZ85u81WHS/WY2P4fRs8RmWQE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 34/64] drm/amd/display: Improve DisplayPort
 monitor interop
Date: Mon, 10 Aug 2020 15:08:29 -0400
Message-Id: <20200810190859.3793319-34-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810190859.3793319-1-sashal@kernel.org>
References: <20200810190859.3793319-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

[ Upstream commit eec3303de3378cdfaa0bb86f43546dbbd88f94e2 ]

[Why]
DC is very fast at link training and stream enablement
which causes issues such as blackscreens for non-compliant
monitors.

[How]
After debugging with scaler vendors we implement the
minimum delays at the necessary locations to ensure
the monitor does not hang.  Delays are generic due to
lack of IEEE OUI information on the failing displays.

Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Acked-by: Tony Cheng <Tony.Cheng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c    |  4 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 16 ++++++++++------
 .../amd/display/dc/dce110/dce110_hw_sequencer.c  | 11 ++++++++++-
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 48ab51533d5d6..841cc051b7d01 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3298,9 +3298,11 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 			write_i2c_redriver_setting(pipe_ctx, false);
 		}
 	}
-	dc->hwss.disable_stream(pipe_ctx);
 
 	disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
+
+	dc->hwss.disable_stream(pipe_ctx);
+
 	if (pipe_ctx->stream->timing.flags.DSC) {
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
 			dp_set_dsc_enable(pipe_ctx, false);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 91cd884d6f257..6124af571bff6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -1102,6 +1102,10 @@ static inline enum link_training_result perform_link_training_int(
 	dpcd_pattern.v1_4.TRAINING_PATTERN_SET = DPCD_TRAINING_PATTERN_VIDEOIDLE;
 	dpcd_set_training_pattern(link, dpcd_pattern);
 
+	/* delay 5ms after notifying sink of idle pattern before switching output */
+	if (link->connector_signal != SIGNAL_TYPE_EDP)
+		msleep(5);
+
 	/* 4. mainlink output idle pattern*/
 	dp_set_hw_test_pattern(link, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
 
@@ -1551,6 +1555,12 @@ bool perform_link_training_with_retries(
 	struct dc_link *link = stream->link;
 	enum dp_panel_mode panel_mode = dp_get_panel_mode(link);
 
+	/* We need to do this before the link training to ensure the idle pattern in SST
+	 * mode will be sent right after the link training
+	 */
+	link->link_enc->funcs->connect_dig_be_to_fe(link->link_enc,
+							pipe_ctx->stream_res.stream_enc->id, true);
+
 	for (j = 0; j < attempts; ++j) {
 
 		dp_enable_link_phy(
@@ -1567,12 +1577,6 @@ bool perform_link_training_with_retries(
 
 		dp_set_panel_mode(link, panel_mode);
 
-		/* We need to do this before the link training to ensure the idle pattern in SST
-		 * mode will be sent right after the link training
-		 */
-		link->link_enc->funcs->connect_dig_be_to_fe(link->link_enc,
-								pipe_ctx->stream_res.stream_enc->id, true);
-
 		if (link->aux_access_disabled) {
 			dc_link_dp_perform_link_training_skip_aux(link, link_setting);
 			return true;
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index b77e9dc160863..2af1d74d16ad8 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1069,8 +1069,17 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 		link->dc->hwss.set_abm_immediate_disable(pipe_ctx);
 	}
 
-	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
 		pipe_ctx->stream_res.stream_enc->funcs->dp_blank(pipe_ctx->stream_res.stream_enc);
+
+		/*
+		 * After output is idle pattern some sinks need time to recognize the stream
+		 * has changed or they enter protection state and hang.
+		 */
+		if (!dc_is_embedded_signal(pipe_ctx->stream->signal))
+			msleep(60);
+	}
+
 }
 
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
