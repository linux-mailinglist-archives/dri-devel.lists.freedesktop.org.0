Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B861AEDDB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 16:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606246EC97;
	Sat, 18 Apr 2020 14:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CFF6EC8A;
 Sat, 18 Apr 2020 14:10:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA7EC21D6C;
 Sat, 18 Apr 2020 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587219021;
 bh=aKvVJ6WNIThLwr7SwxRVNwUPVBfJAPy77N+K2WbjMNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u4cLfaR/BYbcdzPhTQozsPs6ODe3jcOlvw3DGZtBXJRwLvGe9Sk0Qaqq8nuvOTqu9
 RrNLnGHNF6BUPzC/vUlHHK814iabXJ3fvDlD9cvCaawRkeLH9qpMGfImJkcBTfaCJ7
 qkss1gZX6/gCFYiPUHRGHMwilfAt+w7v9aeJYW1o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 57/75] drm/amd/display: Calculate scaling ratios
 on every medium/full update
Date: Sat, 18 Apr 2020 10:08:52 -0400
Message-Id: <20200418140910.8280-57-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418140910.8280-1-sashal@kernel.org>
References: <20200418140910.8280-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 3bae20137cae6c03f58f96c0bc9f3d46f0bc17d4 ]

[Why]
If a plane isn't being actively enabled or disabled then DC won't
always recalculate scaling rects and ratios for the primary plane.

This results in only a partial or corrupted rect being displayed on
the screen instead of scaling to fit the screen.

[How]
Add back the logic to recalculate the scaling rects into
dc_commit_updates_for_stream since this is the expected place to
do it in DC.

This was previously removed a few years ago to fix an underscan issue
but underscan is still functional now with this change - and it should
be, since this is only updating to the latest plane state getting passed
in.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 7fdbb47e8c259..d25e0a937bf57 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2283,7 +2283,7 @@ void dc_commit_updates_for_stream(struct dc *dc,
 	enum surface_update_type update_type;
 	struct dc_state *context;
 	struct dc_context *dc_ctx = dc->ctx;
-	int i;
+	int i, j;
 
 	stream_status = dc_stream_get_status(stream);
 	context = dc->current_state;
@@ -2321,6 +2321,17 @@ void dc_commit_updates_for_stream(struct dc *dc,
 
 		copy_surface_update_to_plane(surface, &srf_updates[i]);
 
+		if (update_type >= UPDATE_TYPE_MED) {
+			for (j = 0; j < dc->res_pool->pipe_count; j++) {
+				struct pipe_ctx *pipe_ctx =
+					&context->res_ctx.pipe_ctx[j];
+
+				if (pipe_ctx->plane_state != surface)
+					continue;
+
+				resource_build_scaling_params(pipe_ctx);
+			}
+		}
 	}
 
 	copy_stream_update_to_stream(dc, context, stream, stream_update);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
