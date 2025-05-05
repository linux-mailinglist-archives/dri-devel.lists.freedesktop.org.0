Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18965AA9FC1
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6D510E48F;
	Mon,  5 May 2025 22:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ErDnQ88m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014610E48B;
 Mon,  5 May 2025 22:27:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 32B324A2E4;
 Mon,  5 May 2025 22:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66EAC4CEE4;
 Mon,  5 May 2025 22:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484029;
 bh=NEnIgFa1vzdx6SehrHdu6hqP61wk6W3TvGqPC8DhPrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ErDnQ88mrTThXEjlh2ZNbVs5FnzLsQD0ZO+IwSwk/LYh7mAobcq/kGUBnxbCiLide
 J7Fd1wj4MmM0Wl24AHzZfBjpBsjxikv3tpN4dVkExWpr1Guwl39nQXb0K6wAaioG4h
 TfLBMmzQkLzRb0tXA9+iKn0zJNExKnL2K+ebqkUzVsh0jbx0x5g64kpqvZW4O6yyna
 SeMhMOPLaiAVAgrc/BmWmRMM9H4oLuAnuNW4aj/lQx2eqEGYSPCjbD3ucoI+8ATBPe
 2bL4dIqlhWK8hLzncJvE7AJF/mLZEnzIRDpyzGQJ4kUyMn9Z7dO706vXyfDdEDAeKc
 Dg2pizzQwOdKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samson Tam <Samson.Tam@amd.com>, Jun Lei <jun.lei@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com,
 navid.assadian@amd.com, Relja.Vojvodic@amd.com, wenjing.liu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 323/642] drm/amd/display: fix check for identity
 ratio
Date: Mon,  5 May 2025 18:08:59 -0400
Message-Id: <20250505221419.2672473-323-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Samson Tam <Samson.Tam@amd.com>

[ Upstream commit 0d3004647631aedb713251525a99784661574767 ]

[Why]
IDENTITY_RATIO check uses 2 bits for integer, which only allows
 checking downscale ratios up to 3.  But we support up to 6x
 downscale

[How]
Update IDENTITY_RATIO to check 3 bits for integer
Add ASSERT to catch if we downscale more than 6x

Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Reviewed-by: Jun Lei <jun.lei@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 38a9a0d680581..18b423bd302a7 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -8,7 +8,7 @@
 #include "dc_spl_isharp_filters.h"
 #include "spl_debug.h"
 
-#define IDENTITY_RATIO(ratio) (spl_fixpt_u2d19(ratio) == (1 << 19))
+#define IDENTITY_RATIO(ratio) (spl_fixpt_u3d19(ratio) == (1 << 19))
 #define MIN_VIEWPORT_SIZE 12
 
 static bool spl_is_yuv420(enum spl_pixel_format format)
@@ -887,6 +887,8 @@ static bool spl_get_isharp_en(struct spl_in *spl_in,
 static void spl_get_taps_non_adaptive_scaler(
 	  struct spl_scratch *spl_scratch, const struct spl_taps *in_taps)
 {
+	bool check_max_downscale = false;
+
 	if (in_taps->h_taps == 0) {
 		if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz) > 1)
 			spl_scratch->scl_data.taps.h_taps = spl_min(2 * spl_fixpt_ceil(
@@ -926,6 +928,23 @@ static void spl_get_taps_non_adaptive_scaler(
 	else
 		spl_scratch->scl_data.taps.h_taps_c = in_taps->h_taps_c;
 
+
+	/*
+	 * Max downscale supported is 6.0x.  Add ASSERT to catch if go beyond that
+	 */
+	check_max_downscale = spl_fixpt_le(spl_scratch->scl_data.ratios.horz,
+		spl_fixpt_from_fraction(6, 1));
+	SPL_ASSERT(check_max_downscale);
+	check_max_downscale = spl_fixpt_le(spl_scratch->scl_data.ratios.vert,
+		spl_fixpt_from_fraction(6, 1));
+	SPL_ASSERT(check_max_downscale);
+	check_max_downscale = spl_fixpt_le(spl_scratch->scl_data.ratios.horz_c,
+		spl_fixpt_from_fraction(6, 1));
+	SPL_ASSERT(check_max_downscale);
+	check_max_downscale = spl_fixpt_le(spl_scratch->scl_data.ratios.vert_c,
+		spl_fixpt_from_fraction(6, 1));
+	SPL_ASSERT(check_max_downscale);
+
 	if (IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz))
 		spl_scratch->scl_data.taps.h_taps = 1;
 	if (IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert))
-- 
2.39.5

