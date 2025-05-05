Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA5AAA178
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFCF10E548;
	Mon,  5 May 2025 22:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JD2ZwO4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0A10E547;
 Mon,  5 May 2025 22:48:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 29E30A4D09D;
 Mon,  5 May 2025 22:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B31C4CEE4;
 Mon,  5 May 2025 22:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485284;
 bh=fyiu71eYlgW/COF8lDRLJM6UWE/RGqymuevgYT5Uy9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JD2ZwO4A5iqlMpy/Gk+JUluzICz1az+RPj6Uif2J7JJUzzEvNaln0Xct++t64qlDT
 uuKcIBN4+pwOG8/kMhbCEgJo4nrx7+CI/X4P6TuipbpQZSZkpoPwBWPUZqWwGQewmb
 mIREJna03EadSzpS5dvRXMqJAZ75Ub8uUAiHYJwdF9G03m1YSSzcc7vXepGeitE3DH
 ytCd6nKLvq2EgYq0KqWdutkH5UfJL3AKb9dlmVa28u2kV8mEN4JWEgP8LMbasguRwE
 p0JqGwC1yH4gQcJ1Qa2FIZPzKvb0V5iAiGqeh/Dt0uWoiDj3SYCOQEE0694OaZ48Ur
 wilE94LYrwnRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yihan Zhu <Yihan.Zhu@amd.com>, Samson Tam <samson.tam@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, ivlipski@amd.com,
 nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 252/486] drm/amd/display: handle
 max_downscale_src_width fail check
Date: Mon,  5 May 2025 18:35:28 -0400
Message-Id: <20250505223922.2682012-252-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
 drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
index 40acebd13e46d..abf439e743f23 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
@@ -425,11 +425,6 @@ bool dpp3_get_optimal_number_of_taps(
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
@@ -467,6 +462,12 @@ bool dpp3_get_optimal_number_of_taps(
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

