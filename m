Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF75F2650
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 00:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33DC10E167;
	Sun,  2 Oct 2022 22:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079F410E15F;
 Sun,  2 Oct 2022 22:51:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A13760EE8;
 Sun,  2 Oct 2022 22:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F7EC43470;
 Sun,  2 Oct 2022 22:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664751115;
 bh=78pDdmUUoG5H2aYN979n9Ka348bWLEmrB9jrOrOhNOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lINN/qHApC2yQpBVFAIaPt9tggpm7W9lTuh6+xKnHyc5S2GEqPnq0KGyE2UuGRR6M
 qsdk3kq30x4wpj8nvnIuSOBn8KngGfpBTHl4CVBixlQb01NFeETbL1f0SitHJHibie
 vChD0w5Tgp7u2hZA5Vno9YqRXmXBlYIg613dODAbaCpTfn5yhf8Phwni6PrcO/KbiM
 MD6HVAncFSb+XAbqkinevDTdzbMSBar4V8v20/b2kt75cUgbwgUpdtoecBweUiNfUE
 b/Z5lGWUMRCawwz1x8peid+9FSur6kJmNaQqnBKRqw9Zwiarah+T1epUWpT7aYxIu5
 g7fEYFShvraCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 20/20] drm/amd/display: skip audio setup when
 audio stream is enabled
Date: Sun,  2 Oct 2022 18:50:59 -0400
Message-Id: <20221002225100.239217-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002225100.239217-1-sashal@kernel.org>
References: <20221002225100.239217-1-sashal@kernel.org>
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 meenakshikumar.somasundaram@amd.com, mario.limonciello@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 zhikzhai <zhikai.zhai@amd.com>, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Brandon.Syu@amd.com,
 Martin.Leung@amd.com, hanghong.ma@amd.com, agustin.gutierrez@amd.com,
 Wesley.Chalmers@amd.com, Xinhui.Pan@amd.com, Zhan.Liu@amd.com,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhikzhai <zhikai.zhai@amd.com>

[ Upstream commit 65fbfb02c2734cacffec5e3f492e1b4f1dabcf98 ]

[why]
We have minimal pipe split transition method to avoid pipe
allocation outage.However, this method will invoke audio setup
which cause audio output stuck once pipe reallocate.

[how]
skip audio setup for pipelines which audio stream has been enabled

Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: zhikzhai <zhikai.zhai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 62d595ded866..46d7e75e4553 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -2108,7 +2108,8 @@ static void dce110_setup_audio_dto(
 			continue;
 		if (pipe_ctx->stream->signal != SIGNAL_TYPE_HDMI_TYPE_A)
 			continue;
-		if (pipe_ctx->stream_res.audio != NULL) {
+		if (pipe_ctx->stream_res.audio != NULL &&
+			pipe_ctx->stream_res.audio->enabled == false) {
 			struct audio_output audio_output;
 
 			build_audio_output(context, pipe_ctx, &audio_output);
@@ -2156,7 +2157,8 @@ static void dce110_setup_audio_dto(
 			if (!dc_is_dp_signal(pipe_ctx->stream->signal))
 				continue;
 
-			if (pipe_ctx->stream_res.audio != NULL) {
+			if (pipe_ctx->stream_res.audio != NULL &&
+				pipe_ctx->stream_res.audio->enabled == false) {
 				struct audio_output audio_output;
 
 				build_audio_output(context, pipe_ctx, &audio_output);
-- 
2.35.1

