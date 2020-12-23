Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6E2E11AE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BC36E894;
	Wed, 23 Dec 2020 02:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DBC6E891;
 Wed, 23 Dec 2020 02:16:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9739227BF;
 Wed, 23 Dec 2020 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689815;
 bh=vou7UbMuIOlHogC+JSLYKs9mEKu8zPb4x7tIQAWA6J8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBekCYQBHBoiEr92GmKjCl5XEPCQNJcOlmgfmyy/B6jzIK9ZL7pTJc2pWYbn8cKEq
 9M1H6/i6/8GgWgTg78mlt/CmJdfAQvBJ8YybEIh7UvfeNWXgE/XBD5VOYhC2EJovXp
 poFpqUvGScCZhblLqmaRwJdJyQ4ZS+RrAmkX8YV+b8Z6ry50wlUe49OJ49XjftWHt6
 084Zls17e765taDK9UPcMA5FKVpE9IvUI1ZxfzUwAdbdK3VycTl1DM+aKhWd7pNMJz
 h+4JO28+WAIVdEzvPRQdplbEA3/jhRtFViNFCofFXe7ihXcaHJnUDUuWyrCMBkfsHl
 ubFDWzOGp0qnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 022/217] drm/amd/display: correct eDP T9 delay
Date: Tue, 22 Dec 2020 21:13:11 -0500
Message-Id: <20201223021626.2790791-22-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Hugo Hu <hugo.hu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hugo Hu <hugo.hu@amd.com>

[ Upstream commit 3a372bed1e337efa450d8288bc75cfc9237b7bad ]

[Why]
The current end of T9 delay is relay on polling
sink status by DPCD. But the polling for sink
status change after NoVideoStream_flag set to 0.

[How]
Add function edp_add_delay_for_T9 to add T9 delay.
Move the sink status polling after blank.

Signed-off-by: Hugo Hu <hugo.hu@amd.com>
Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/core/dc_link_hwss.c   | 13 ++++++++-----
 .../amd/display/dc/dce110/dce110_hw_sequencer.c  | 16 ++++++++--------
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h   |  1 +
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 11a619befb425..124ce215fca53 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -156,6 +156,13 @@ void dp_enable_link_phy(
 	dp_receiver_power_ctrl(link, true);
 }
 
+void edp_add_delay_for_T9(struct dc_link *link)
+{
+	if (link->local_sink &&
+			link->local_sink->edid_caps.panel_patch.extra_delay_backlight_off > 0)
+		udelay(link->local_sink->edid_caps.panel_patch.extra_delay_backlight_off * 1000);
+}
+
 bool edp_receiver_ready_T9(struct dc_link *link)
 {
 	unsigned int tries = 0;
@@ -165,7 +172,7 @@ bool edp_receiver_ready_T9(struct dc_link *link)
 
 	result = core_link_read_dpcd(link, DP_EDP_DPCD_REV, &edpRev, sizeof(edpRev));
 
-     /* start from eDP version 1.2, SINK_STAUS indicate the sink is ready.*/
+    /* start from eDP version 1.2, SINK_STAUS indicate the sink is ready.*/
 	if (result == DC_OK && edpRev >= DP_EDP_12) {
 		do {
 			sinkstatus = 1;
@@ -178,10 +185,6 @@ bool edp_receiver_ready_T9(struct dc_link *link)
 		} while (++tries < 50);
 	}
 
-	if (link->local_sink &&
-			link->local_sink->edid_caps.panel_patch.extra_delay_backlight_off > 0)
-		udelay(link->local_sink->edid_caps.panel_patch.extra_delay_backlight_off * 1000);
-
 	return result;
 }
 bool edp_receiver_ready_T7(struct dc_link *link)
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 3ac6c7b65a45a..9f56887029ca6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -992,8 +992,6 @@ void dce110_edp_backlight_control(
 
 	link_transmitter_control(ctx->dc_bios, &cntl);
 
-
-
 	if (enable && link->dpcd_sink_ext_caps.bits.oled)
 		msleep(OLED_POST_T7_DELAY);
 
@@ -1004,7 +1002,7 @@ void dce110_edp_backlight_control(
 
 	/*edp 1.2*/
 	if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_OFF)
-		edp_receiver_ready_T9(link);
+		edp_add_delay_for_T9(link);
 
 	if (!enable && link->dpcd_sink_ext_caps.bits.oled)
 		msleep(OLED_PRE_T11_DELAY);
@@ -1145,12 +1143,14 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
 		pipe_ctx->stream_res.stream_enc->funcs->dp_blank(pipe_ctx->stream_res.stream_enc);
 
-		/*
-		 * After output is idle pattern some sinks need time to recognize the stream
-		 * has changed or they enter protection state and hang.
-		 */
-		if (!dc_is_embedded_signal(pipe_ctx->stream->signal))
+		if (!dc_is_embedded_signal(pipe_ctx->stream->signal)) {
+			/*
+			 * After output is idle pattern some sinks need time to recognize the stream
+			 * has changed or they enter protection state and hang.
+			 */
 			msleep(60);
+		} else if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP)
+			edp_receiver_ready_T9(link);
 	}
 
 }
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
index 9af7ee5bc8ee1..33590a728fc53 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
@@ -51,6 +51,7 @@ void dp_enable_link_phy(
 	const struct dc_link_settings *link_settings);
 
 void dp_receiver_power_ctrl(struct dc_link *link, bool on);
+void edp_add_delay_for_T9(struct dc_link *link);
 bool edp_receiver_ready_T9(struct dc_link *link);
 bool edp_receiver_ready_T7(struct dc_link *link);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
