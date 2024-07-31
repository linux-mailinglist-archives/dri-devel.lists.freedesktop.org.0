Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09839439FF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728710E6EC;
	Thu,  1 Aug 2024 00:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XzggrWKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC7110E6E7;
 Thu,  1 Aug 2024 00:09:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AE0062569;
 Thu,  1 Aug 2024 00:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BD5C116B1;
 Thu,  1 Aug 2024 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722470959;
 bh=1yKMbkhAyfPrW+nh7Z+gF1Y+RpRfYc0PmOUjnFEVyI8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XzggrWKoHobAGdLDK62yRzy3Q8Hc2QsheQAHyIx9Yevu31aAH4mofeO8CXq7FsK94
 z82lZSG5Fu+Ci8T/TL/oIY9CImB145PjmH1qNWtrEuiz7Liw91KPcYQib2eLDv7V5P
 JYw3/za6UDMT261d5tZK9qRUwK+2gr+nlq7suY/M9yH9QKZNmrsgZcVTp0XWXHJkRW
 n8cYzd+TEmyUCiG6YOIDjuqE2G+Va54yhAWC5ErOy7WHAzAJK6R3JmBhNCGzuioFb5
 ZbYsslnMh+zVaplsRysvyzSUBP/B0pLnKCw5sLMyzoP1QUvi+D0mtsplcWVBH9MpFo
 ALMzan/6gBXwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 wenjing.liu@amd.com, jun.lei@amd.com, hamza.mahfooz@amd.com,
 alvin.lee2@amd.com, george.shen@amd.com, dillon.varone@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 009/121] drm/amd/display: Ensure array index
 tg_inst won't be -1
Date: Wed, 31 Jul 2024 19:59:07 -0400
Message-ID: <20240801000834.3930818-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 687fe329f18ab0ab0496b20ed2cb003d4879d931 ]

[WHY & HOW]
tg_inst will be a negative if timing_generator_count equals 0, which
should be checked before used.

This fixes 2 OVERRUN issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 15819416a2f36..693d05a98c6fb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3492,7 +3492,7 @@ static bool acquire_otg_master_pipe_for_stream(
 		if (pool->dpps[pipe_idx])
 			pipe_ctx->plane_res.mpcc_inst = pool->dpps[pipe_idx]->inst;
 
-		if (pipe_idx >= pool->timing_generator_count) {
+		if (pipe_idx >= pool->timing_generator_count && pool->timing_generator_count != 0) {
 			int tg_inst = pool->timing_generator_count - 1;
 
 			pipe_ctx->stream_res.tg = pool->timing_generators[tg_inst];
-- 
2.43.0

