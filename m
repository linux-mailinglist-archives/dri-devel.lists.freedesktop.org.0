Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A76A7AABA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E2510EAAB;
	Thu,  3 Apr 2025 19:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jmd1Qe43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1A10EAAA;
 Thu,  3 Apr 2025 19:15:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 767CC614B7;
 Thu,  3 Apr 2025 19:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A464C4CEE8;
 Thu,  3 Apr 2025 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707731;
 bh=wHyFbe8lGadhldF5tZXD8T4pgLpVE2yi5fdh5tFPYWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jmd1Qe43D+uIUiwA863Y4qfJYYZ9UWEDpRuw/hargdA8WSCeCk1gF6m1Wr/r+PCry
 /XClEKl4R5/En7QSqqFkWWzivH5AN2z/0WEyI8nVyNlQnXIj6B/isaORdDXvPOWMNL
 OJuayHkGv1NhcMU9Bptuy2/9+OOpAj9uHWXO6cNc0Z3oDLc6Q6ouAD7SO/9SI0plMj
 wWUb0fl4gc7fD/vfXGZd6JFwTy995OmLanDnP+ygDZHjqOb0NBcXDqcGOMmxa48Md7
 u4OqWyK6Ij9msPRg8TE0puiZTfvHrLgQKasGbsXxGVMswqwwekUuuJlDiPmLG+s+M3
 EXQ1EcA45ZwRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhikai Zhai <zhikai.zhai@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sung.lee@amd.com, martin.leung@amd.com,
 Aric.Cyr@amd.com, bhuvanachandra.pinninti@amd.com, siqueira@igalia.com,
 wayne.lin@amd.com, chiahsuan.chung@amd.com, alex.hung@amd.com,
 mwen@igalia.com, tjakobi@math.uni-bielefeld.de, peterson.guo@amd.com,
 ivlipski@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 05/37] drm/amd/display: Update Cursor request
 mode to the beginning prefetch always
Date: Thu,  3 Apr 2025 15:14:41 -0400
Message-Id: <20250403191513.2680235-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191513.2680235-1-sashal@kernel.org>
References: <20250403191513.2680235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
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

[ Upstream commit 4a4077b4b63a8404efd6d37fc2926f03fb25bace ]

[Why]
The double buffer cursor registers is updated by the cursor
vupdate event. There is a gap between vupdate and cursor data
fetch if cursor fetch data reletive to cursor position.
Cursor corruption will happen if we update the cursor surface
in this gap.

[How]
Modify the cursor request mode to the beginning prefetch always
and avoid wraparound calculation issues.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Zhikai Zhai <zhikai.zhai@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/hubp/dcn31/dcn31_hubp.c    |  2 +-
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 22 ++++++++-----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c
index a65a0ddee6467..c671908ba7d06 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c
@@ -44,7 +44,7 @@ void hubp31_set_unbounded_requesting(struct hubp *hubp, bool enable)
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
 	REG_UPDATE(DCHUBP_CNTL, HUBP_UNBOUNDED_REQ_MODE, enable);
-	REG_UPDATE(CURSOR_CONTROL, CURSOR_REQ_MODE, enable);
+	REG_UPDATE(CURSOR_CONTROL, CURSOR_REQ_MODE, 1);
 }
 
 void hubp31_soft_reset(struct hubp *hubp, bool reset)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 44e405e9bc971..13f9e9b439f6a 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -1992,20 +1992,11 @@ static void delay_cursor_until_vupdate(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	dc->hwss.get_position(&pipe_ctx, 1, &position);
 	vpos = position.vertical_count;
 
-	/* Avoid wraparound calculation issues */
-	vupdate_start += stream->timing.v_total;
-	vupdate_end += stream->timing.v_total;
-	vpos += stream->timing.v_total;
-
 	if (vpos <= vupdate_start) {
 		/* VPOS is in VACTIVE or back porch. */
 		lines_to_vupdate = vupdate_start - vpos;
-	} else if (vpos > vupdate_end) {
-		/* VPOS is in the front porch. */
-		return;
 	} else {
-		/* VPOS is in VUPDATE. */
-		lines_to_vupdate = 0;
+		lines_to_vupdate = stream->timing.v_total - vpos + vupdate_start;
 	}
 
 	/* Calculate time until VUPDATE in microseconds. */
@@ -2013,13 +2004,18 @@ static void delay_cursor_until_vupdate(struct dc *dc, struct pipe_ctx *pipe_ctx)
 		stream->timing.h_total * 10000u / stream->timing.pix_clk_100hz;
 	us_to_vupdate = lines_to_vupdate * us_per_line;
 
+	/* Stall out until the cursor update completes. */
+	if (vupdate_end < vupdate_start)
+		vupdate_end += stream->timing.v_total;
+
+	/* Position is in the range of vupdate start and end*/
+	if (lines_to_vupdate > stream->timing.v_total - vupdate_end + vupdate_start)
+		us_to_vupdate = 0;
+
 	/* 70 us is a conservative estimate of cursor update time*/
 	if (us_to_vupdate > 70)
 		return;
 
-	/* Stall out until the cursor update completes. */
-	if (vupdate_end < vupdate_start)
-		vupdate_end += stream->timing.v_total;
 	us_vupdate = (vupdate_end - vupdate_start + 1) * us_per_line;
 	udelay(us_to_vupdate + us_vupdate);
 }
-- 
2.39.5

