Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144493E62B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B3710E224;
	Sun, 28 Jul 2024 15:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A5tOxok8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC9710E224;
 Sun, 28 Jul 2024 15:44:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10D73CE0917;
 Sun, 28 Jul 2024 15:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62459C116B1;
 Sun, 28 Jul 2024 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181472;
 bh=PhUeR7yYmxaM6RyfVYIprb0Wbx/tF1HiF3qEf2iSiow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A5tOxok8denubA8dZsbHkUq6IZpNfRkq5TSM6jgk0IserjfBNqzlUwwaPyEplJWc4
 U99wR6OP1ojJfreYZN86WmsKywQKnURJNbs2t6cj6ptnap8EjAFRkdhGANplKjJeIk
 495XJ1XkoBRTG4HLGKxMUYadBmtVQAcEIyrr0zJhW1jWCPlHkbwEuVkRsDdxrVsk1N
 SJ+2aUyVeUIBvrg1cUEwG2pxDC2RQqWmW6T+pBQpxjNBVDd1A2AvxLPUkG8wLh1/hu
 IVZzOhYFvA87ri9zK9c8mtaZ8239Ytl36TeZmeQcYQQqaGXvxMHzOzD9rZ73yHaqtU
 zSn45/rmDPTSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wenjing Liu <wenjing.liu@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jun.lei@amd.com, hamza.mahfooz@amd.com,
 chiahsuan.chung@amd.com, alvin.lee2@amd.com, george.shen@amd.com,
 alex.hung@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 20/34] drm/amd/display: remove dpp pipes on
 failure to update pipe params
Date: Sun, 28 Jul 2024 11:40:44 -0400
Message-ID: <20240728154230.2046786-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
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

From: Wenjing Liu <wenjing.liu@amd.com>

[ Upstream commit 3ddd9c83ff7ac0ead38188425b14d03dc2f2c133 ]

[why]
There are cases where update pipe params could fail but dpp pipes are already
added to the state. In this case, we should remove dpp pipes so dc state is
restored back. If it is not restored, dc state is corrupted after calling this
function, so if we call the same interface with the corrupted state again, we
may end up programming pipe topology based on a corrupted dc state.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index a2ca66a268c2d..a51e5de6554ee 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2701,6 +2701,7 @@ bool resource_append_dpp_pipes_for_plane_composition(
 		struct dc_plane_state *plane_state)
 {
 	bool success;
+
 	if (otg_master_pipe->plane_state == NULL)
 		success = add_plane_to_opp_head_pipes(otg_master_pipe,
 				plane_state, new_ctx);
@@ -2708,10 +2709,15 @@ bool resource_append_dpp_pipes_for_plane_composition(
 		success = acquire_secondary_dpp_pipes_and_add_plane(
 				otg_master_pipe, plane_state, new_ctx,
 				cur_ctx, pool);
-	if (success)
+	if (success) {
 		/* when appending a plane mpc slice count changes from 0 to 1 */
 		success = update_pipe_params_after_mpc_slice_count_change(
 				plane_state, new_ctx, pool);
+		if (!success)
+			resource_remove_dpp_pipes_for_plane_composition(new_ctx,
+					pool, plane_state);
+	}
+
 	return success;
 }
 
@@ -2721,6 +2727,7 @@ void resource_remove_dpp_pipes_for_plane_composition(
 		const struct dc_plane_state *plane_state)
 {
 	int i;
+
 	for (i = pool->pipe_count - 1; i >= 0; i--) {
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-- 
2.43.0

