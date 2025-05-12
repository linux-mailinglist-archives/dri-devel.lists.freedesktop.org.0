Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FEAB415C
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4AE10E46C;
	Mon, 12 May 2025 18:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BwsM1eT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8533D10E46C;
 Mon, 12 May 2025 18:04:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5933EA4B171;
 Mon, 12 May 2025 18:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C564C4CEE7;
 Mon, 12 May 2025 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747073091;
 bh=AESvUlPW8mv9wKVURiU6MMPiaUUCwGT2gGubYF9BAAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BwsM1eT3Fpb4JXg297t2vWY/GgVkD96ukqHKjeil16HKnUQgCSBHkCnzPMUAxnj6m
 CsRyZ99lmxB9f5yIDS8t9TKbb+KQZcsRF28SOcrvRJwqyRQRaa1cutOdqZno4LrLNN
 MzBFy5TNkZms1X6v71FOup1McLz39aj0so2r70w3vhnRMRYw2Gpetn889nkL8giTPc
 ob8iZSnMlR4qYtSvVZM5YUtLnHoMLxgJ1zSQ2xo1ABd8vFN/+EyKAc7CCn+Ix/e+Ry
 5i1NdX3iRM+t7dJmGGpHMRSREXjrKaCH+wt5JH+1fCM1eLMBG+hX9FpNyHbrzOFfbf
 x3K9sEl2FGbgg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Austin Zheng <Austin.Zheng@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Ray Wu <ray.wu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, dillon.varone@amd.com, aurabindo.pillai@amd.com,
 chenhuacai@kernel.org, george.shen@amd.com, rostrows@amd.com,
 siqueira@igalia.com, jerry.zuo@amd.com, jiapeng.chong@linux.alibaba.com,
 chris.park@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 10/11] drm/amd/display: Call FP Protect Before
 Mode Programming/Mode Support
Date: Mon, 12 May 2025 14:04:25 -0400
Message-Id: <20250512180426.437627-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512180426.437627-1-sashal@kernel.org>
References: <20250512180426.437627-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.28
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

From: Austin Zheng <Austin.Zheng@amd.com>

[ Upstream commit eba692ca3abca258b3214a6e4126afefad1822f0 ]

[Why]
Memory allocation occurs within dml21_validate() for adding phantom planes.
May cause kernel to be tainted due to usage of FP Start.

[How]
Move FP start from dml21_validate to before mode programming/mode support.
Calculations requiring floating point are all done within mode programming
or mode support.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit fe3250f10819b411808ab9ae1d824c5fc9b59170)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index e3e4f40bd4123..dcbe327209d5d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -221,7 +221,9 @@ static bool dml21_mode_check_and_programming(const struct dc *in_dc, struct dc_s
 	if (!result)
 		return false;
 
+	DC_FP_START();
 	result = dml2_build_mode_programming(mode_programming);
+	DC_FP_END();
 	if (!result)
 		return false;
 
@@ -271,7 +273,9 @@ static bool dml21_check_mode_support(const struct dc *in_dc, struct dc_state *co
 	mode_support->dml2_instance = dml_init->dml2_instance;
 	dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
 	dml_ctx->v21.mode_programming.dml2_instance->scratch.build_mode_programming_locals.mode_programming_params.programming = dml_ctx->v21.mode_programming.programming;
+	DC_FP_START();
 	is_supported = dml2_check_mode_supported(mode_support);
+	DC_FP_END();
 	if (!is_supported)
 		return false;
 
@@ -282,16 +286,12 @@ bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml
 {
 	bool out = false;
 
-	DC_FP_START();
-
 	/* Use dml_validate_only for fast_validate path */
 	if (fast_validate)
 		out = dml21_check_mode_support(in_dc, context, dml_ctx);
 	else
 		out = dml21_mode_check_and_programming(in_dc, context, dml_ctx);
 
-	DC_FP_END();
-
 	return out;
 }
 
-- 
2.39.5

