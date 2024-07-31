Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E1943A64
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E716410E735;
	Thu,  1 Aug 2024 00:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f0Jmjed7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E46D10E733;
 Thu,  1 Aug 2024 00:14:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D916F6125E;
 Thu,  1 Aug 2024 00:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E4EC116B1;
 Thu,  1 Aug 2024 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471255;
 bh=X1ygmkzR7iQ9ChJg9ifR7HYOC9jn7JAbiVAuHWbZjDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f0Jmjed7D4a2+25IAxfqensLSFh9L3DIfYBdu8MUsePyuLhPWZ1jjV+SbPmz5RlUO
 rh82Cds7BI1B15bJaBeYhu7wG6hx1GvN/qafoZK3OjF2Py9+X0SiBAPHEelJBa3De8
 qaltfOGj36OYLFZztNSNROVlwTkxLuIx6IWGW2T88y/fREk/stL7MV1v62q2JYxG2l
 taT4jFh0dnensB5GKBPhruP6oAgNKBAuFmzqNPZzg4EpL6WBPLARJh1dYQWTKaljWz
 fM+VdvnvSeWPaMLglmCKsQI8/hvVHBw6IWEPyBPHwSqxRVG897Yndks8bflELZfcZZ
 J7fQSY8iyWx6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Susanto <nicholas.susanto@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, charlene.liu@amd.com, alex.hung@amd.com,
 daniel.miess@amd.com, dillon.varone@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 048/121] drm/amd/display: Fix pipe addition logic
 in calc_blocks_to_ungate DCN35
Date: Wed, 31 Jul 2024 19:59:46 -0400
Message-ID: <20240801000834.3930818-48-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Nicholas Susanto <nicholas.susanto@amd.com>

[ Upstream commit 3aec7a5af4d6248b7462b7d1eb597f06d35f5ee0 ]

[Why]

Missing check for when there is new pipe configuration but both cur_pipe
and new_pipe are both populated causing update_state of DSC for that
instance not being updated correctly.

This causes some display mode changes to cause underflow since DSCCLK
is still gated when the display requires DSC.

[How]

Added another condition in the new pipe addition branch that checks if
there is a new pipe configuration and if it is not the same as cur_pipe.
cur_pipe does not necessarily have to be NULL to go in this branch.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Roman Li <roman.li@amd.com>
Signed-off-by: Nicholas Susanto <nicholas.susanto@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index 5f60da72c6f58..68ac4dee79f79 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -1095,7 +1095,8 @@ void dcn35_calc_blocks_to_ungate(struct dc *dc, struct dc_state *context,
 			continue;
 
 		if ((!cur_pipe->plane_state && new_pipe->plane_state) ||
-			(!cur_pipe->stream && new_pipe->stream)) {
+			(!cur_pipe->stream && new_pipe->stream) ||
+			(cur_pipe->stream != new_pipe->stream && new_pipe->stream)) {
 			// New pipe addition
 			for (j = 0; j < PG_HW_PIPE_RESOURCES_NUM_ELEMENT; j++) {
 				if (j == PG_HUBP && new_pipe->plane_res.hubp)
-- 
2.43.0

