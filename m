Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27433AAA154
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A81110E536;
	Mon,  5 May 2025 22:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mVdrO5Gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC6110E532;
 Mon,  5 May 2025 22:46:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 95BA949CDB;
 Mon,  5 May 2025 22:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE09C4CEEE;
 Mon,  5 May 2025 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485171;
 bh=0tuhh9/DxMp177RlmvvmX2DCNEAa0XiBPG0HzEDVFiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mVdrO5GhucS4MWa1jVJnxD70GQb0zSpkoQe2G+/QZoUU1ce3VJTKvbQNVCaMt8Y4K
 L9Wrwo0JrrHzIXcBhNhhsRmGjubqYh9UJIu+HSz1s3WVlnFv6YxW5TljbYe6m2a9Hj
 uOyGdnx4SzXN7rwNdMmk11qx8Ym0lApKFBtvZ4L2hTQFDmJoVrR94cEQA9jQiLxjoQ
 AALHMj9+7G1g01lgau+o0Liasl7S2JXP2xXc+Q8CzrgAkGKwSqFPQ5VU8/7W0NgOnh
 4vpNzaRKG36anMfDprmccYnOKKAy+sKyA9FQ6Z5rJ8vum/ALHyO4xXm6RX3H4wRr5p
 wSuXywe5v0e6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, zaeem.mohamed@amd.com,
 Hansen.Dsouza@amd.com, joshua.aberback@amd.com, Cruise.Hung@amd.com,
 PeiChen.Huang@amd.com, duncan.ma@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 197/486] drm/amd/display: Ensure DMCUB idle
 before reset on DCN31/DCN35
Date: Mon,  5 May 2025 18:34:33 -0400
Message-Id: <20250505223922.2682012-197-sashal@kernel.org>
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit c707ea82c79dbd1d295ec94cc6529a5248c77757 ]

[Why]
If we soft reset before halt finishes and there are outstanding
memory transactions then the memory interface may produce unexpected
results, such as out of order transactions when the firmware next runs.

These can manifest as random or unexpected load/store violations.

[How]
Increase the timeout before soft reset to ensure the DMCUB has quiesced.
This is effectively 1s maximum based on experimentation.

Use the enable bit check on DCN31 like we're doing on DCN35 and reorder
the reset writes to follow the HW programming guide.

Ensure we're reading SCRATCH7 instead of SCRATCH8 for the HALT code.
No current versions of DMCUB firmware use the SCRATCH8 boot bit to
dynamically switch where the HALT code goes to maintain backwards
compatibility with PSP.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dmub/src/dmub_dcn31.c   | 17 +++++++++++------
 .../gpu/drm/amd/display/dmub/src/dmub_dcn35.c   |  4 ++--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c
index d9f31b191c693..1a68b5782cac6 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c
@@ -83,8 +83,8 @@ static inline void dmub_dcn31_translate_addr(const union dmub_addr *addr_in,
 void dmub_dcn31_reset(struct dmub_srv *dmub)
 {
 	union dmub_gpint_data_register cmd;
-	const uint32_t timeout = 100;
-	uint32_t in_reset, scratch, i, pwait_mode;
+	const uint32_t timeout = 100000;
+	uint32_t in_reset, is_enabled, scratch, i, pwait_mode;
 
 	REG_GET(DMCUB_CNTL2, DMCUB_SOFT_RESET, &in_reset);
 
@@ -108,7 +108,7 @@ void dmub_dcn31_reset(struct dmub_srv *dmub)
 		}
 
 		for (i = 0; i < timeout; ++i) {
-			scratch = dmub->hw_funcs.get_gpint_response(dmub);
+			scratch = REG_READ(DMCUB_SCRATCH7);
 			if (scratch == DMUB_GPINT__STOP_FW_RESPONSE)
 				break;
 
@@ -125,9 +125,14 @@ void dmub_dcn31_reset(struct dmub_srv *dmub)
 		/* Force reset in case we timed out, DMCUB is likely hung. */
 	}
 
-	REG_UPDATE(DMCUB_CNTL2, DMCUB_SOFT_RESET, 1);
-	REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
-	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
+	REG_GET(DMCUB_CNTL, DMCUB_ENABLE, &is_enabled);
+
+	if (is_enabled) {
+		REG_UPDATE(DMCUB_CNTL2, DMCUB_SOFT_RESET, 1);
+		REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
+		REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
+	}
+
 	REG_WRITE(DMCUB_INBOX1_RPTR, 0);
 	REG_WRITE(DMCUB_INBOX1_WPTR, 0);
 	REG_WRITE(DMCUB_OUTBOX1_RPTR, 0);
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
index 2ccad79053c58..4581eb4794518 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
@@ -88,7 +88,7 @@ static inline void dmub_dcn35_translate_addr(const union dmub_addr *addr_in,
 void dmub_dcn35_reset(struct dmub_srv *dmub)
 {
 	union dmub_gpint_data_register cmd;
-	const uint32_t timeout = 100;
+	const uint32_t timeout = 100000;
 	uint32_t in_reset, is_enabled, scratch, i, pwait_mode;
 
 	REG_GET(DMCUB_CNTL2, DMCUB_SOFT_RESET, &in_reset);
@@ -113,7 +113,7 @@ void dmub_dcn35_reset(struct dmub_srv *dmub)
 		}
 
 		for (i = 0; i < timeout; ++i) {
-			scratch = dmub->hw_funcs.get_gpint_response(dmub);
+			scratch = REG_READ(DMCUB_SCRATCH7);
 			if (scratch == DMUB_GPINT__STOP_FW_RESPONSE)
 				break;
 
-- 
2.39.5

