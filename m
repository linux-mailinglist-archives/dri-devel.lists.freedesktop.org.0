Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4197E9064
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 14:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440410E2FC;
	Sun, 12 Nov 2023 13:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939F10E1A6;
 Sun, 12 Nov 2023 13:28:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 36BDCB807E8;
 Sun, 12 Nov 2023 13:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F4AC433C8;
 Sun, 12 Nov 2023 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699795724;
 bh=hdxK28Eo9S+RouVwlhaxKIMABP/G5jYBzxIG3cQQP5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k6n9QtaNKW9qGyDzFQwLnqg0Mos86ZiRmff1hCLvoIlThx8b5z+DbnOW6aLKUm6fx
 wsvaqUgiburg6FccKXQAG8xArVZR5SzqqXisICVJkwPL15fkFJMChQk96CrblwZY+z
 FFX3xQExeehphz3x0tTTwnI8EPqDn651QpKDCfjTsxMl7rLVoX8zgd3FgCFfhxOHEG
 4Pp3CQdTjvM2iAU3h0eNHg+44j9/q5keqqsRLgY7KcDAH5HOxNcVnG+0sD2QjIvn/x
 u8v83QXA3oZapTXrpKeK33nwOqBTtFYi/gQryanHWi6rQM7aAuupnIOozDO9YTXhts
 whzVic5Y+3sbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 9/9] drm/amd/display: Avoid NULL dereference of
 timing generator
Date: Sun, 12 Nov 2023 08:28:29 -0500
Message-ID: <20231112132830.176228-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132830.176228-1-sashal@kernel.org>
References: <20231112132830.176228-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.138
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <jun.lei@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wayne Lin <wayne.lin@amd.com>

[ Upstream commit b1904ed480cee3f9f4036ea0e36d139cb5fee2d6 ]

[Why & How]
Check whether assigned timing generator is NULL or not before
accessing its funcs to prevent NULL dereference.

Reviewed-by: Jun Lei <jun.lei@amd.com>
Acked-by: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index f0f54f4d3d9bc..5dd57cf170f51 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -562,7 +562,7 @@ uint32_t dc_stream_get_vblank_counter(const struct dc_stream_state *stream)
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct timing_generator *tg = res_ctx->pipe_ctx[i].stream_res.tg;
 
-		if (res_ctx->pipe_ctx[i].stream != stream)
+		if (res_ctx->pipe_ctx[i].stream != stream || !tg)
 			continue;
 
 		return tg->funcs->get_frame_count(tg);
@@ -621,7 +621,7 @@ bool dc_stream_get_scanoutpos(const struct dc_stream_state *stream,
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct timing_generator *tg = res_ctx->pipe_ctx[i].stream_res.tg;
 
-		if (res_ctx->pipe_ctx[i].stream != stream)
+		if (res_ctx->pipe_ctx[i].stream != stream || !tg)
 			continue;
 
 		tg->funcs->get_scanoutpos(tg,
-- 
2.42.0

