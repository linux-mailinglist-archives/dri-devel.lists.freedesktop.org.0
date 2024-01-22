Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA98366E4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F141610F373;
	Mon, 22 Jan 2024 15:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2E510F36B;
 Mon, 22 Jan 2024 15:08:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7733CB80E8E;
 Mon, 22 Jan 2024 15:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5CBC43394;
 Mon, 22 Jan 2024 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936093;
 bh=1Q7Z81zASWE7XHaFnf9WPbdcfwDelvwLdwo+aImNdaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bpJfNVM4IN3CNkQ8ZiW1fY4VA7DVFIFX+NAhoxY9DvnXQqTlUVjjjroPz3pOl3PLd
 BFc7TLRk3i+T0HOVtOV4RCtXouj78V5yDS6q9aSDi5a0ZfReRH5hSloPDOayVL1TrQ
 DnKPJgp+mCFQ+h55FAhqJsUpZ4BW8yWmwJ0yB+CrRl8Waoj3s0k8N9zg/5B8NBQbi7
 rWAyc7ksZTJM9szooE2fdT2v4EBtEgQ0PiKthjtZ8sSGqxaDZ309idpD0TDkkSuMBm
 40jP3eK8mNFzrAlPD+LtLH7+vRELWv6CA9JdlgfXi7OAmiLPqDfJqfCq8ufSE2Ryz8
 Di9D9BqTHVErw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 63/73] drm/amd/display: Fixing stream allocation
 regression
Date: Mon, 22 Jan 2024 10:02:17 -0500
Message-ID: <20240122150432.992458-63-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: Sasha Levin <sashal@kernel.org>, Relja Vojvodic <relja.vojvodic@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 samson.tam@amd.com, ethan.bitnun@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, alvin.lee2@amd.com, daniel@ffwll.ch,
 Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Relja Vojvodic <relja.vojvodic@amd.com>

[ Upstream commit 292c2116b2ae84c7e799ae340981e60551b18f5e ]

For certain dual display configs that had one display using a 1080p
mode, the DPM level used to drive the configs regressed from DPM 0 to
DPM 3. This was caused by a missing check that should have only limited
the pipe segments on non-phantom pipes. This caused issues with detile
buffer allocation, which dissallow subvp from being used

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Reviewed-by: Martin Leung <martin.leung@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Relja Vojvodic <relja.vojvodic@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 3ad2b48954e0..03bd05596d21 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -190,7 +190,7 @@ bool dcn32_subvp_in_use(struct dc *dc,
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE)
+		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_PHANTOM != SUBVP_NONE)
 			return true;
 	}
 	return false;
-- 
2.43.0

