Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D8A1C90C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE1310E3E5;
	Sun, 26 Jan 2025 14:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gr6NSIZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2929B10E3DD;
 Sun, 26 Jan 2025 14:55:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3ED6CA406C4;
 Sun, 26 Jan 2025 14:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A0AC4CEE4;
 Sun, 26 Jan 2025 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903323;
 bh=XKGfn4HN9PdLr93dYM6sHItaHU5f7ZdT7XRVtQ3vWxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gr6NSIZtapDWeKCsT4CQwwbtoD0qjvn5fDJpF5oA9U4rbIOf4d6OJDCpHwYCs0ZG3
 3V6aKkSgWtXDK/Kzjlp7YmFzV7GjwknxbQr57hSC9kmNnBUFs6hfra0ZpsGhI4HOim
 pA3mPHmxCsUVMOsQnL96tbVgjzjHwl0Z+1Ol0KnajCtNmvxlOQANkXx9Zkq8yqup55
 WaTs+clbnuWAgFYXk+1b2VkMEZTb1y3B8RoLDdKYFVwHw85R76DZVgEMGl5LkQpylk
 LeriwQbz2FkHwr422sIIkhrnjNT/21A+Jl0xtPUK9nABsSGyjNKlLjUilPHQwY7411
 RenP7qRYeFp8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ausef Yousof <Ausef.Yousof@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 chaitanya.dhere@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 10/31] drm/amd/display: Overwriting dualDPP UBF
 values before usage
Date: Sun, 26 Jan 2025 09:54:26 -0500
Message-Id: <20250126145448.930220-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145448.930220-1-sashal@kernel.org>
References: <20250126145448.930220-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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

From: Ausef Yousof <Ausef.Yousof@amd.com>

[ Upstream commit 24909d9ec7c3afa8da2f3c9afa312e7a4a61f250 ]

[WHY]
Right now in dml2 mode validation we are calculating UBF parameters for
prefetch calculation for single and dual DPP scenarios. Data structure
to store such values are just 1D arrays, the single DPP values are
overwritten by the dualDPP values, and we end up using dualDPP for
prefetch calculations twice (once in place of singleDPP support check
and again for dual).

This naturally leads to many problems, one of which validating a mode in
"singleDPP" (when we used dual DPP parameters) and sending the singleDPP
parameters to mode programming, if we cannot support then we observe the
corruption as described in the ticket.

[HOW]
UBF values need to have 2d arrays to store values specific to single and
dual DPP states to avoid single DPP values being overwritten. Other
parameters are recorded on a per state basis such as prefetch UBF values
but they are in the same loop used for calculation and at that point its
fine to overwrite them, its not the case for plain UBF values.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Ausef Yousof <Ausef.Yousof@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dml2/display_mode_core.c   | 30 +++++++++----------
 .../dc/dml2/display_mode_core_structs.h       |  6 ++--
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index be87dc0f07799..6822b07951204 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -6301,9 +6301,9 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 			mode_lib->ms.meta_row_bandwidth_this_state,
 			mode_lib->ms.dpte_row_bandwidth_this_state,
 			mode_lib->ms.NoOfDPPThisState,
-			mode_lib->ms.UrgentBurstFactorLuma,
-			mode_lib->ms.UrgentBurstFactorChroma,
-			mode_lib->ms.UrgentBurstFactorCursor);
+			mode_lib->ms.UrgentBurstFactorLuma[j],
+			mode_lib->ms.UrgentBurstFactorChroma[j],
+			mode_lib->ms.UrgentBurstFactorCursor[j]);
 
 		s->VMDataOnlyReturnBWPerState = dml_get_return_bw_mbps_vm_only(
 																	&mode_lib->ms.soc,
@@ -6458,9 +6458,9 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 				mode_lib->ms.cursor_bw_pre,
 				mode_lib->ms.prefetch_vmrow_bw,
 				mode_lib->ms.NoOfDPPThisState,
-				mode_lib->ms.UrgentBurstFactorLuma,
-				mode_lib->ms.UrgentBurstFactorChroma,
-				mode_lib->ms.UrgentBurstFactorCursor,
+				mode_lib->ms.UrgentBurstFactorLuma[j],
+				mode_lib->ms.UrgentBurstFactorChroma[j],
+				mode_lib->ms.UrgentBurstFactorCursor[j],
 				mode_lib->ms.UrgentBurstFactorLumaPre,
 				mode_lib->ms.UrgentBurstFactorChromaPre,
 				mode_lib->ms.UrgentBurstFactorCursorPre,
@@ -6517,9 +6517,9 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 						mode_lib->ms.cursor_bw,
 						mode_lib->ms.cursor_bw_pre,
 						mode_lib->ms.NoOfDPPThisState,
-						mode_lib->ms.UrgentBurstFactorLuma,
-						mode_lib->ms.UrgentBurstFactorChroma,
-						mode_lib->ms.UrgentBurstFactorCursor,
+						mode_lib->ms.UrgentBurstFactorLuma[j],
+						mode_lib->ms.UrgentBurstFactorChroma[j],
+						mode_lib->ms.UrgentBurstFactorCursor[j],
 						mode_lib->ms.UrgentBurstFactorLumaPre,
 						mode_lib->ms.UrgentBurstFactorChromaPre,
 						mode_lib->ms.UrgentBurstFactorCursorPre);
@@ -6586,9 +6586,9 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 													mode_lib->ms.cursor_bw_pre,
 													mode_lib->ms.prefetch_vmrow_bw,
 													mode_lib->ms.NoOfDPP[j], // VBA_ERROR DPPPerSurface is not assigned at this point, should use NoOfDpp here
-													mode_lib->ms.UrgentBurstFactorLuma,
-													mode_lib->ms.UrgentBurstFactorChroma,
-													mode_lib->ms.UrgentBurstFactorCursor,
+													mode_lib->ms.UrgentBurstFactorLuma[j],
+													mode_lib->ms.UrgentBurstFactorChroma[j],
+													mode_lib->ms.UrgentBurstFactorCursor[j],
 													mode_lib->ms.UrgentBurstFactorLumaPre,
 													mode_lib->ms.UrgentBurstFactorChromaPre,
 													mode_lib->ms.UrgentBurstFactorCursorPre,
@@ -7809,9 +7809,9 @@ dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
 				mode_lib->ms.DETBufferSizeYThisState[k],
 				mode_lib->ms.DETBufferSizeCThisState[k],
 				/* Output */
-				&mode_lib->ms.UrgentBurstFactorCursor[k],
-				&mode_lib->ms.UrgentBurstFactorLuma[k],
-				&mode_lib->ms.UrgentBurstFactorChroma[k],
+				&mode_lib->ms.UrgentBurstFactorCursor[j][k],
+				&mode_lib->ms.UrgentBurstFactorLuma[j][k],
+				&mode_lib->ms.UrgentBurstFactorChroma[j][k],
 				&mode_lib->ms.NotUrgentLatencyHiding[k]);
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
index f951936bb579e..504c427b3b319 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
@@ -884,11 +884,11 @@ struct mode_support_st {
 	dml_uint_t meta_row_height[__DML_NUM_PLANES__];
 	dml_uint_t meta_row_height_chroma[__DML_NUM_PLANES__];
 	dml_float_t UrgLatency;
-	dml_float_t UrgentBurstFactorCursor[__DML_NUM_PLANES__];
+	dml_float_t UrgentBurstFactorCursor[2][__DML_NUM_PLANES__];
 	dml_float_t UrgentBurstFactorCursorPre[__DML_NUM_PLANES__];
-	dml_float_t UrgentBurstFactorLuma[__DML_NUM_PLANES__];
+	dml_float_t UrgentBurstFactorLuma[2][__DML_NUM_PLANES__];
 	dml_float_t UrgentBurstFactorLumaPre[__DML_NUM_PLANES__];
-	dml_float_t UrgentBurstFactorChroma[__DML_NUM_PLANES__];
+	dml_float_t UrgentBurstFactorChroma[2][__DML_NUM_PLANES__];
 	dml_float_t UrgentBurstFactorChromaPre[__DML_NUM_PLANES__];
 	dml_float_t MaximumSwathWidthInLineBufferLuma;
 	dml_float_t MaximumSwathWidthInLineBufferChroma;
-- 
2.39.5

