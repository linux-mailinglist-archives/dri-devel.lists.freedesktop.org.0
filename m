Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E9AAA1E9
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2A110E578;
	Mon,  5 May 2025 22:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qS3OVwQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2E10E575;
 Mon,  5 May 2025 22:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F24761F1E;
 Mon,  5 May 2025 22:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6135DC4CEED;
 Mon,  5 May 2025 22:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485570;
 bh=tEpnyqxpUwmbm0CU1poVcn8w/flZiQr2S/rIImIpo/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qS3OVwQh7BtCvrQLE2l0sAplxMcRFeHH+INgvnHU+GmfyKk5zS3NfyiCQ0w+NEdFq
 pSPuHyaaLYndzSEHnlMy63j/UJs6+NGz3hqQKsHZ8VJE/V5OqeJx9nixSVLvFYwUlV
 f7aoR+/YwBLTHxAMjJso9utXxoR7RFeNHFyP+SWHXEWB1GLCwUuIo6r5dt9nN6qho7
 WFf+D0FcHP8q0ZtGlfZmqFTgvnwKaD9D+HVQxNL8V5GcuwUPPnEJp4sLHpmR0JeCPj
 CV8pngSLP6ffRYeyhLrcRG9R+qU2WNuYZK2J0Z3wlXvdARC7RdGUVzPIy9K5r5lFXG
 BEowQCdAddyNQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Joshua Aberback <joshua.aberback@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Alvin.Lee2@amd.com,
 rodrigo.siqueira@amd.com, alex.hung@amd.com, dillon.varone@amd.com,
 Austin.Zheng@amd.com, Samson.Tam@amd.com, rostrows@amd.com,
 yi-lchen@amd.com, PeiChen.Huang@amd.com, aurabindo.pillai@amd.com,
 linux@treblig.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 371/486] drm/amd/display: Increase block_sequence
 array size
Date: Mon,  5 May 2025 18:37:27 -0400
Message-Id: <20250505223922.2682012-371-sashal@kernel.org>
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

From: Joshua Aberback <joshua.aberback@amd.com>

[ Upstream commit 3a7810c212bcf2f722671dadf4b23ff70a7d23ee ]

[Why]
It's possible to generate more than 50 steps in hwss_build_fast_sequence,
for example with a 6-pipe asic where all pipes are in one MPC chain. This
overflows the block_sequence buffer and corrupts block_sequence_steps,
causing a crash.

[How]
Expand block_sequence to 100 items. A naive upper bound on the possible
number of steps for a 6-pipe asic, ignoring the potential for steps to be
mutually exclusive, is 91 with current code, therefore 100 is sufficient.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Joshua Aberback <joshua.aberback@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/inc/core_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index e1e3142cdc00a..62fb2009b3028 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -621,7 +621,7 @@ struct dc_state {
 	 */
 	struct bw_context bw_ctx;
 
-	struct block_sequence block_sequence[50];
+	struct block_sequence block_sequence[100];
 	unsigned int block_sequence_steps;
 	struct dc_dmub_cmd dc_dmub_cmd[10];
 	unsigned int dmub_cmd_count;
-- 
2.39.5

