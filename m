Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B823AAA295
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5D10E5D7;
	Mon,  5 May 2025 23:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EsAfYVgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA76010E5BE;
 Mon,  5 May 2025 23:01:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9C61445B6;
 Mon,  5 May 2025 23:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE437C4CEE4;
 Mon,  5 May 2025 23:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486100;
 bh=zPTcb5EF+PZ7SBsevaVplteoZZUfmgwh2tLi1WG3G2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EsAfYVgwvR9ueLTcHxCp2N253V9wZRjJftpYqYwg3NnkyozjKpewa0tcSH4sRvYRl
 dGk9I6PlWJMQVP0fT3/GioMWkVLKiIelz8VOxzI0xsgwNKOVGxlRJyL4yYMkM7ssaD
 qnupt3HeoGSwuUCpnHvxSCGyVLvq6cRXL3Rc6RtHSRTikA1tzUk2Hw4ItM1GdBI7yZ
 oLznNjgJBXnRdqa/xRz1OGbcqznJ3SKKJ14FpDWwBoUlLbcrLR66yFPeK205wwcjkZ
 emyFif/QUdwlOtbGzuB/7gGsGyy6IGKVF8Z94LhLHRvXI8S2SagPWk6G8tX1LNnXGV
 9dxlXj/fTGj6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yihan Zhu <Yihan.Zhu@amd.com>, Samson Tam <samson.tam@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 155/294] drm/amd/display: handle
 max_downscale_src_width fail check
Date: Mon,  5 May 2025 18:54:15 -0400
Message-Id: <20250505225634.2688578-155-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Yihan Zhu <Yihan.Zhu@amd.com>

[ Upstream commit 02a940da2ccc0cc0299811379580852b405a0ea2 ]

[WHY]
If max_downscale_src_width check fails, we exit early from TAP calculation and left a NULL
value to the scaling data structure to cause the zero divide in the DML validation.

[HOW]
Call set default TAP calculation before early exit in get_optimal_number_of_taps due to
max downscale limit exceed.

Reviewed-by: Samson Tam <samson.tam@amd.com>
Signed-off-by: Yihan Zhu <Yihan.Zhu@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 50dc834046446..4ce45f1bdac0f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -392,11 +392,6 @@ bool dpp3_get_optimal_number_of_taps(
 	int min_taps_y, min_taps_c;
 	enum lb_memory_config lb_config;
 
-	if (scl_data->viewport.width > scl_data->h_active &&
-		dpp->ctx->dc->debug.max_downscale_src_width != 0 &&
-		scl_data->viewport.width > dpp->ctx->dc->debug.max_downscale_src_width)
-		return false;
-
 	/*
 	 * Set default taps if none are provided
 	 * From programming guide: taps = min{ ceil(2*H_RATIO,1), 8} for downscaling
@@ -434,6 +429,12 @@ bool dpp3_get_optimal_number_of_taps(
 	else
 		scl_data->taps.h_taps_c = in_taps->h_taps_c;
 
+	// Avoid null data in the scl data with this early return, proceed non-adaptive calcualtion first
+	if (scl_data->viewport.width > scl_data->h_active &&
+		dpp->ctx->dc->debug.max_downscale_src_width != 0 &&
+		scl_data->viewport.width > dpp->ctx->dc->debug.max_downscale_src_width)
+		return false;
+
 	/*Ensure we can support the requested number of vtaps*/
 	min_taps_y = dc_fixpt_ceil(scl_data->ratios.vert);
 	min_taps_c = dc_fixpt_ceil(scl_data->ratios.vert_c);
-- 
2.39.5

