Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D988DDE3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C58B10FB08;
	Wed, 27 Mar 2024 12:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YfRjn+jr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873C10FB0D;
 Wed, 27 Mar 2024 12:11:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 510FE61511;
 Wed, 27 Mar 2024 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59971C433C7;
 Wed, 27 Mar 2024 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541512;
 bh=2Kr8PTdAZyAl58wBKC1+WWzJyamt4mSFZhFb+FpEWKI=;
 h=From:To:Cc:Subject:Date:From;
 b=YfRjn+jrmTR5PgZG5ojtgO2Sk9HLJ/pNWc1xlMVxMQ+0IQXt4Wqf7YM2YZaEIKGE1
 S30WJIOB29xAckDIMF4wPCyIJxbGlV8genrEHtM1vcOm3f8q1+1NUkI9u39kv7p3Jw
 x0BE/raI8h/s7nGjbtL8gpx2GVFUYmUi4mLKFxLhV3E2bt6k7RxQZ5nMS/qTbJV2yi
 EKNyncfXNmhm5sQ6W1WMZtbdnLVWVo2/XKvzVhg3XPvY/DN5YNkFP2SJVb1R0O+S0N
 JkkOcCYq7bfJp0xaewkPbxz9o6hpznYmmyPMQ6iaNRgU/21VGpx0zhVgLAvIuQh8xl
 vkLypcrfk5Kpw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	wenjing.liu@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Martin Leung <martin.leung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Revert Remove pixle rate limit for
 subvp" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:11:50 -0400
Message-ID: <20240327121150.2829047-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From cf8c498694a443e28dc1222f3ab94677114a4724 Mon Sep 17 00:00:00 2001
From: Wenjing Liu <wenjing.liu@amd.com>
Date: Mon, 4 Mar 2024 11:20:27 -0500
Subject: [PATCH] drm/amd/display: Revert Remove pixle rate limit for subvp

This reverts commit 340383c734f8 ("drm/amd/display: Remove pixle rate
limit for subvp")

[why]
The original commit causes a regression when subvp is applied
on ODM required 8k60hz timing. The display shows black screen
on boot. The issue can be recovered with hotplug. It also causes
MPO to fail. We will temprarily revert this commit and investigate
the root cause further.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Reviewed-by: Martin Leung <martin.leung@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index b49e1dc9d8ba5..a0a65e0991041 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -623,6 +623,7 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 		 * - Not TMZ surface
 		 */
 		if (pipe->plane_state && !pipe->top_pipe && !dcn32_is_center_timing(pipe) &&
+				!(pipe->stream->timing.pix_clk_100hz / 10000 > DCN3_2_MAX_SUBVP_PIXEL_RATE_MHZ) &&
 				(!dcn32_is_psr_capable(pipe) || (context->stream_count == 1 && dc->caps.dmub_caps.subvp_psr)) &&
 				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_NONE &&
 				(refresh_rate < 120 || dcn32_allow_subvp_high_refresh_rate(dc, context, pipe)) &&
-- 
2.43.0




