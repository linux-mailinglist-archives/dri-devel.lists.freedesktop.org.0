Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34B3089F2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DEE6EB6B;
	Fri, 29 Jan 2021 15:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6DE6EB6B;
 Fri, 29 Jan 2021 15:37:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06CAC64E27;
 Fri, 29 Jan 2021 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934676;
 bh=Tn1QHHcsJqiutpk3sC7RqJ7WncRkDf7SD0f8luhEqt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UQSKiFdhMTNO6vJFJAhmIx7kfHQSJtcoKez1lL4w9KqO02ptUPIZkYlYkYbgdl5vV
 iSjDD8DDue/oe8haD2viD59rNFy2iGXA+Dr+c0OHn7G+JAn5w90CFV+za0/KI7IBD/
 gjhn0bD4mIlX4zoIdNrMfEQUz5uHIKp5vyRG2GQkvMVwkxkQSzI/XQgW8cwWaQEZab
 GqNwzg36VeOb3bVdjjPUrAQ6LlOxqK1VWlxrjde0parhRFagRR+tYXnQN4K3A2+DKK
 mELagjoIjHv11NyWjOSEfGc1npckzATfIh1OuMqjmGizeO+msAR9ArevgOzqcpA58D
 1WCgcLKG4wArg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 33/41] drm/amd/display: Fixed corruptions on
 HPDRX link loss restore
Date: Fri, 29 Jan 2021 10:37:04 -0500
Message-Id: <20210129153713.1592185-33-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153713.1592185-1-sashal@kernel.org>
References: <20210129153713.1592185-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <anson.jacob@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Vladimir Stempen <vladimir.stempen@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vladimir Stempen <vladimir.stempen@amd.com>

[ Upstream commit 4b08d8c78360241d270396a9de6eb774e88acd00 ]

[why]
Heavy corruption or blank screen reported on wake,
with 6k display connected and FEC enabled

[how]
When Disable/Enable stream for display pipes on HPDRX,
DC should take into account ODM split pipes.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Vladimir Stempen <vladimir.stempen@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Anson Jacob <anson.jacob@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 004e2b32e02fa..17e6fd8201395 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3023,14 +3023,14 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
 		for (i = 0; i < MAX_PIPES; i++) {
 			pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
 			if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
-					pipe_ctx->stream->link == link)
+					pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe)
 				core_link_disable_stream(pipe_ctx);
 		}
 
 		for (i = 0; i < MAX_PIPES; i++) {
 			pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
 			if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
-					pipe_ctx->stream->link == link)
+					pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe)
 				core_link_enable_stream(link->dc->current_state, pipe_ctx);
 		}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
