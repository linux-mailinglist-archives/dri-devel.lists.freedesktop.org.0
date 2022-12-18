Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F464FF7C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED91510E1CB;
	Sun, 18 Dec 2022 16:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79A10E1CB;
 Sun, 18 Dec 2022 16:03:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C740560DC9;
 Sun, 18 Dec 2022 16:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66690C433D2;
 Sun, 18 Dec 2022 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379360;
 bh=2z2kx3GfS55LxRLsKjgo8pcqfUBZUKUOXS4w7KtOlKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgt0jytGj7JY/bWy+7M3WDvU8+6DhXmv/ybFuQ6Z7xYq9pvjKUBe8qGRxvcs5Y4HQ
 kfxMVduKOckCznBKpFlPOHpwT8v/Vo0y9wtxhWU7Yk5I8t0OhPuTv7vRzBtuHT5hum
 FLAV6A4BIHhApKb+QBUAlL0XI9rZwTMUHjtmb+c5Ps+QV2J0rHaQYSG2btvZG9ucmP
 ++AjSXn+IzIlFA6LPjRwMerwDN+DQZIzoXC4gDHtp6uu/JD7HUumlKHELvTcj9jlR7
 +Ra3nrFGMBZ+SmILs/TmFMtqKMiefYvGrJ2v15MQG1y4DMV1J1pWef6oJFN+tNRour
 WsB04VvRhWFNQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/85] drm/amd/display: skip commit minimal
 transition state
Date: Sun, 18 Dec 2022 11:00:29 -0500
Message-Id: <20221218160142.925394-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, HaoPing.Liu@amd.com,
 Mark Broadworth <mark.broadworth@amd.com>, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Samson.Tam@amd.com,
 wenjing.liu@amd.com, meenakshikumar.somasundaram@amd.com, alex.hung@amd.com,
 Dillon Varone <Dillon.Varone@amd.com>, Alvin.Lee2@amd.com,
 zhikzhai <zhikai.zhai@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhikzhai <zhikai.zhai@amd.com>

[ Upstream commit 1e8fd864afdc7a52df375e888a03b8472fc24f5d ]

[WHY]
Now dynamic ODM will now be disabled when MPO is required safe
transitions to avoid underflow, but we are triggering the way of minimal
transition too often. Commit state of dc with no check will do pipeline
setup which may re-initialize the component with no need such as audio.

[HOW]
Just do the minimal transition when all of pipes are in use, otherwise
return true to skip.

Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Reviewed-by: Dillon Varone <Dillon.Varone@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: zhikzhai <zhikai.zhai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 997ab031f816..5c00907099c1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3650,10 +3650,32 @@ static bool commit_minimal_transition_state(struct dc *dc,
 	bool temp_subvp_policy;
 	enum dc_status ret = DC_ERROR_UNEXPECTED;
 	unsigned int i, j;
+	unsigned int pipe_in_use = 0;
 
 	if (!transition_context)
 		return false;
 
+	/* check current pipes in use*/
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &transition_base_context->res_ctx.pipe_ctx[i];
+
+		if (pipe->plane_state)
+			pipe_in_use++;
+	}
+
+	/* When the OS add a new surface if we have been used all of pipes with odm combine
+	 * and mpc split feature, it need use commit_minimal_transition_state to transition safely.
+	 * After OS exit MPO, it will back to use odm and mpc split with all of pipes, we need
+	 * call it again. Otherwise return true to skip.
+	 *
+	 * Reduce the scenarios to use dc_commit_state_no_check in the stage of flip. Especially
+	 * enter/exit MPO when DCN still have enough resources.
+	 */
+	if (pipe_in_use != dc->res_pool->pipe_count) {
+		dc_release_state(transition_context);
+		return true;
+	}
+
 	if (!dc->config.is_vmin_only_asic) {
 		tmp_mpc_policy = dc->debug.pipe_split_policy;
 		dc->debug.pipe_split_policy = MPC_SPLIT_AVOID;
-- 
2.35.1

