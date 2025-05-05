Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E21AAA05B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A110E4D7;
	Mon,  5 May 2025 22:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F9MpEFNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F90110E4D6;
 Mon,  5 May 2025 22:34:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 582495C09ED;
 Mon,  5 May 2025 22:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABB6C4CEE4;
 Mon,  5 May 2025 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484439;
 bh=CrqN30HjhD19eBzOMO96lI4kp3HihUmYgnJL5ukWcJ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F9MpEFNswGGJUE3byFrFXg8oKBiEDmebslpuaTrbcILpGLCNe8fVjKx1MQhTdLc9f
 nkQMvuTV7zS/JYKW0wzluaHcuUvRlyncxnSpR7ZrclJR9egRUgrL7FHtBue0Vo/JYH
 V/0RIxHPl5/1SwjvxNMU1rbPid/yz7y0UL5eSRdQqpTR+HHyMMsMHxUruSaWM7V/R5
 xOl22e0hiX1SKK5fPIF1l8+s2wLSRatJZRc9q/GoIxMHf1f1qSVKvOiTOxw27kNhYP
 w7fXnMF2r/uwrx6VwEXgl+VegavEYJYPC7x2HYZG74zsVqpYcBJYNuxkcDuY/2pNRu
 S6CmSZXv1v52Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Joshua Aberback <joshua.aberback@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Alvin.Lee2@amd.com,
 rodrigo.siqueira@amd.com, alex.hung@amd.com, dillon.varone@amd.com,
 Austin.Zheng@amd.com, chris.park@amd.com, PeiChen.Huang@amd.com,
 yi-lchen@amd.com, aurabindo.pillai@amd.com, linux@treblig.org,
 Samson.Tam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 477/642] drm/amd/display: Increase block_sequence
 array size
Date: Mon,  5 May 2025 18:11:33 -0400
Message-Id: <20250505221419.2672473-477-sashal@kernel.org>
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
index d558efc6e12f9..652d52040f4e6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -627,7 +627,7 @@ struct dc_state {
 	 */
 	struct bw_context bw_ctx;
 
-	struct block_sequence block_sequence[50];
+	struct block_sequence block_sequence[100];
 	unsigned int block_sequence_steps;
 	struct dc_dmub_cmd dc_dmub_cmd[10];
 	unsigned int dmub_cmd_count;
-- 
2.39.5

