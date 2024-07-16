Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A1B93286A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DC610E737;
	Tue, 16 Jul 2024 14:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QmDnPGrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758610E733;
 Tue, 16 Jul 2024 14:26:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A01260DF7;
 Tue, 16 Jul 2024 14:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B14C116B1;
 Tue, 16 Jul 2024 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721139994;
 bh=homoOp5PggDAdsEv+cYcAgFaZRjiXh8bu10ArfAvvGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QmDnPGrS/Cf7TaPZJPYnlz9yH8I/3j3Stry17YImigREbkiH3bccPv3/52fZQgGtE
 suCsMB/LaEcR+mlx4xLiJI3qhfoDPqAUOjaHtYvR4Qt9LPqEDravBTKI8EjeybC952
 mLe6EQ5hOYE96TOL875OgckPzbJpap40ztCWg+no3t6z5REz5VtTFpVXzOC0BeMmn7
 hjF7k7TBrTV+UbHaZI3IaWf0LxS7owAuM82u5/KFCAqHX/tElmwI0gs586enI8zuKq
 XkefvdDf05ypTmYrbyrWWTaLrBtefuygL69JFXkvmqGuI8RUWJr4RAD839x+GNUhrH
 T/hXZ2DkNxyDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roman Li <Roman.Li@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, charlene.liu@amd.com, Qingqing.Zhuo@amd.com,
 sungkim@amd.com, michael.strauss@amd.com, wenjing.liu@amd.com,
 jiapeng.chong@linux.alibaba.com, gabe.teeger@amd.com,
 dillon.varone@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 16/22] drm/amd/display: Fix
 array-index-out-of-bounds in dml2/FCLKChangeSupport
Date: Tue, 16 Jul 2024 10:24:23 -0400
Message-ID: <20240716142519.2712487-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142519.2712487-1-sashal@kernel.org>
References: <20240716142519.2712487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.9
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

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit 0ad4b4a2f6357c45fbe444ead1a929a0b4017d03 ]

[Why]
Potential out of bounds access in dml2_calculate_rq_and_dlg_params()
because the value of out_lowest_state_idx used as an index for FCLKChangeSupport
array can be greater than 1.

[How]
Currently dml2 core specifies identical values for all FCLKChangeSupport
elements. Always use index 0 in the condition to avoid out of bounds access.

Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
index b72ed3e78df05..bb4e812248aec 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
@@ -294,7 +294,7 @@ void dml2_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_state *cont
 	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz = (unsigned int)in_ctx->v20.dml_core_ctx.mp.DCFCLKDeepSleep * 1000;
 	context->bw_ctx.bw.dcn.clk.dppclk_khz = 0;
 
-	if (in_ctx->v20.dml_core_ctx.ms.support.FCLKChangeSupport[in_ctx->v20.scratch.mode_support_params.out_lowest_state_idx] == dml_fclock_change_unsupported)
+	if (in_ctx->v20.dml_core_ctx.ms.support.FCLKChangeSupport[0] == dml_fclock_change_unsupported)
 		context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = false;
 	else
 		context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = true;
-- 
2.43.0

