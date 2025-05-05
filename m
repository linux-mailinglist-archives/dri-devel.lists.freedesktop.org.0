Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD225AAA30E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B77D10E5B5;
	Mon,  5 May 2025 23:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CDGuCnNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A065810E5A3;
 Mon,  5 May 2025 23:08:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8FA75C5B7D;
 Mon,  5 May 2025 23:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28253C4CEE4;
 Mon,  5 May 2025 23:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486520;
 bh=EuB5NR2gHM8CNjROZJazBrCfPXq6HWcrHpmCAuliOP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDGuCnNLbYNfgHpaBjSjfLljhg0C8UxoQWsms3J/lO6M3UBl0ajHDaga8vDQpDDfi
 GjHGQm6vWKRsrEhWoHVGUKiA5pCEbUkcjoB/eRzLSs9IiajkyC4gXWvDkp3z0zn4ni
 xMpQK/wiD3FMxmgIip1KrokNcl0lo4Xt1xiQ0GqOhaOLQ2t1PcuyNp4N/Md+BPfKRp
 0iNdqA8hJYk7+yFSDE+SWXSkLi6hBPUPXRD+NuFNSoFxg8PHCZURhN28W1TlwR5AGm
 3z0bV6jGL+BJK6xjrSaiGh4kSp2qt3P969v5yGkQYQInwlYUrRDHhttxdSc4vVqILT
 CtzINi72Mq31g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhikai Zhai <zhikai.zhai@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 073/212] drm/amd/display: calculate the remain
 segments for all pipes
Date: Mon,  5 May 2025 19:04:05 -0400
Message-Id: <20250505230624.2692522-73-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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

From: Zhikai Zhai <zhikai.zhai@amd.com>

[ Upstream commit d3069feecdb5542604d29b59acfd1fd213bad95b ]

[WHY]
In some cases the remain de-tile buffer segments will be greater
than zero if we don't add the non-top pipe to calculate, at
this time the override de-tile buffer size will be valid and used.
But it makes the de-tile buffer segments used finally for all of pipes
exceed the maximum.

[HOW]
Add the non-top pipe to calculate the remain de-tile buffer segments.
Don't set override size to use the average according to pipe count
if the value exceed the maximum.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Zhikai Zhai <zhikai.zhai@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dcn315/dcn315_resource.c   | 42 +++++++++----------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
index 958170fbfece7..9d643c79afea6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -1717,7 +1717,7 @@ static int dcn315_populate_dml_pipes_from_context(
 		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
 		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		if (pixel_rate_crb && !pipe->top_pipe && !pipe->prev_odm_pipe) {
+		if (pixel_rate_crb) {
 			int bpp = source_format_to_bpp(pipes[pipe_cnt].pipe.src.source_format);
 			/* Ceil to crb segment size */
 			int approx_det_segs_required_for_pstate = dcn_get_approx_det_segs_required_for_pstate(
@@ -1768,28 +1768,26 @@ static int dcn315_populate_dml_pipes_from_context(
 				continue;
 			}
 
-			if (!pipe->top_pipe && !pipe->prev_odm_pipe) {
-				bool split_required = pipe->stream->timing.pix_clk_100hz >= dcn_get_max_non_odm_pix_rate_100hz(&dc->dml.soc)
-						|| (pipe->plane_state && pipe->plane_state->src_rect.width > 5120);
-
-				if (remaining_det_segs > MIN_RESERVED_DET_SEGS && crb_pipes != 0)
-					pipes[pipe_cnt].pipe.src.det_size_override += (remaining_det_segs - MIN_RESERVED_DET_SEGS) / crb_pipes +
-							(crb_idx < (remaining_det_segs - MIN_RESERVED_DET_SEGS) % crb_pipes ? 1 : 0);
-				if (pipes[pipe_cnt].pipe.src.det_size_override > 2 * DCN3_15_MAX_DET_SEGS) {
-					/* Clamp to 2 pipe split max det segments */
-					remaining_det_segs += pipes[pipe_cnt].pipe.src.det_size_override - 2 * (DCN3_15_MAX_DET_SEGS);
-					pipes[pipe_cnt].pipe.src.det_size_override = 2 * DCN3_15_MAX_DET_SEGS;
-				}
-				if (pipes[pipe_cnt].pipe.src.det_size_override > DCN3_15_MAX_DET_SEGS || split_required) {
-					/* If we are splitting we must have an even number of segments */
-					remaining_det_segs += pipes[pipe_cnt].pipe.src.det_size_override % 2;
-					pipes[pipe_cnt].pipe.src.det_size_override -= pipes[pipe_cnt].pipe.src.det_size_override % 2;
-				}
-				/* Convert segments into size for DML use */
-				pipes[pipe_cnt].pipe.src.det_size_override *= DCN3_15_CRB_SEGMENT_SIZE_KB;
-
-				crb_idx++;
+			bool split_required = pipe->stream->timing.pix_clk_100hz >= dcn_get_max_non_odm_pix_rate_100hz(&dc->dml.soc)
+					|| (pipe->plane_state && pipe->plane_state->src_rect.width > 5120);
+
+			if (remaining_det_segs > MIN_RESERVED_DET_SEGS && crb_pipes != 0)
+				pipes[pipe_cnt].pipe.src.det_size_override += (remaining_det_segs - MIN_RESERVED_DET_SEGS) / crb_pipes +
+						(crb_idx < (remaining_det_segs - MIN_RESERVED_DET_SEGS) % crb_pipes ? 1 : 0);
+			if (pipes[pipe_cnt].pipe.src.det_size_override > 2 * DCN3_15_MAX_DET_SEGS) {
+				/* Clamp to 2 pipe split max det segments */
+				remaining_det_segs += pipes[pipe_cnt].pipe.src.det_size_override - 2 * (DCN3_15_MAX_DET_SEGS);
+				pipes[pipe_cnt].pipe.src.det_size_override = 2 * DCN3_15_MAX_DET_SEGS;
+			}
+			if (pipes[pipe_cnt].pipe.src.det_size_override > DCN3_15_MAX_DET_SEGS || split_required) {
+				/* If we are splitting we must have an even number of segments */
+				remaining_det_segs += pipes[pipe_cnt].pipe.src.det_size_override % 2;
+				pipes[pipe_cnt].pipe.src.det_size_override -= pipes[pipe_cnt].pipe.src.det_size_override % 2;
 			}
+			/* Convert segments into size for DML use */
+			pipes[pipe_cnt].pipe.src.det_size_override *= DCN3_15_CRB_SEGMENT_SIZE_KB;
+
+			crb_idx++;
 			pipe_cnt++;
 		}
 	}
-- 
2.39.5

