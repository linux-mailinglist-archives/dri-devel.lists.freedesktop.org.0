Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A430AB3FF39
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27FF10E68E;
	Tue,  2 Sep 2025 12:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gvJwrR+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8104910E324;
 Tue,  2 Sep 2025 12:08:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A31443709;
 Tue,  2 Sep 2025 12:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94977C4CEF5;
 Tue,  2 Sep 2025 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756814929;
 bh=bC5WUueZSL6XU4o9HYtOorRGhKa8zfgvYBW2rSrcMZk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gvJwrR+GoJHQ7Kz3vGiFzgNYY9fRpfmIISD2n+e6izOClROFvY30N66kf3TnwkO27
 ffDYr39fBEVWTS7ID3gqWDrlXcuXgPh1f9o2hDR1jCBgDoc4nCvUZWJXy4zi4BYExT
 iYouebU1fuAgE1vj3PGRE76glqpNqs3JWb+yNilDCLCUNxtLLVJE2xZZVAAr88pb6A
 Rk2BTd/XXxllB+p7z/zY4blitMD1hQyGLm4Hw8aeu1qPTQy63cjB3ssEKFkwgIUtZj
 x2W0pqGXKkEnnPV5o9+L/UcS84e+spf/+PcRSaF7Adr0iAewzBqB9ybUyseqP3WZes
 RstqI6Ki33G4Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.16-6.12] drm/msm: Fix a7xx TPL1 cluster snapshot
Date: Tue,  2 Sep 2025 08:08:20 -0400
Message-ID: <20250902120833.1342615-9-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Type: text/plain; charset=UTF-8
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

From: Rob Clark <robin.clark@oss.qualcomm.com>

[ Upstream commit e9621ef610c4a600678da5d8020d4a0dfe686faa ]

Later gens have both a PIPE_BR and PIPE_NONE section.  The snapshot tool
seems to expect this for x1-85 as well.  I guess this was just a bug in
downstream kgsl, which went unnoticed?

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/666662/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's the
extensive analysis:

## Technical Analysis

### Nature of the Fix
The commit fixes a bug in GPU crash dump snapshot generation for Adreno
a7xx GPUs (specifically the x1-85 variant). The issue is in the TPL1
(Texture Processing Level 1) cluster snapshot register definitions where
the PIPE_NONE section was missing.

### Code Changes Analysis

1. **In `adreno_gen7_0_0_snapshot.h`**:
   - The original code had only
     `gen7_0_0_tpl1_noncontext_pipe_br_registers` which included all
     registers (0x0b600-0x0b633)
   - The fix splits this into two separate arrays:
     - `gen7_0_0_tpl1_noncontext_pipe_none_registers`: Contains the bulk
       of registers (0x0b600-0x0b633)
     - `gen7_0_0_tpl1_noncontext_pipe_br_registers`: Now only contains
       register 0x0b600

2. **In `adreno_gen7_2_0_snapshot.h`**:
   - Adds a new entry to the `gen7_2_0_sptp_clusters` array:
     ```c
     { A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0,
     A7XX_USPTP,
     gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
     ```
   - This ensures both PIPE_BR and PIPE_NONE sections are captured in
     the snapshot

### Why This is a Bug Fix

1. **Incorrect Snapshot Data**: Without this fix, GPU crash dumps would
   be missing critical register data from the PIPE_NONE section
2. **Tool Compatibility**: The commit message states "The snapshot tool
   seems to expect this for x1-85 as well", indicating external tools
   that parse these snapshots expect this format
3. **Consistency with Later Generations**: The commit aligns x1-85
   (gen7_0_0) behavior with later generations that already have both
   sections

### Backport Suitability Criteria

✅ **Fixes a real bug**: Missing register data in crash dumps affects
debugging capabilities
✅ **Small and contained**: Only modifies snapshot header definitions -
no runtime code changes
✅ **Low risk**: Changes are purely additive to snapshot data structures
✅ **No architectural changes**: Simply corrects register definitions
✅ **No new features**: Only fixes existing snapshot functionality
✅ **Important for stability**: Proper crash dumps are crucial for
debugging GPU issues in production

### Context from Repository

Looking at recent fixes in the same area:
- Multiple snapshot-related fixes have been made recently
  (f28c9fc2c82de, e1d5ccf0a62b8, 06dd5d86c6aef)
- The gen7_9_0 variant already has PIPE_NONE definitions, confirming
  this is the expected pattern
- This appears to be fixing a downstream KGSL (Kernel Graphics Support
  Layer) bug that was carried over

### Risk Assessment

**Very Low Risk** because:
- Only affects devcoredump generation (post-crash debugging data)
- No impact on normal GPU operation
- Changes are data-only (register arrays)
- Aligns with existing patterns in other GPU generations

This is an ideal stable backport candidate as it fixes a specific bug
with minimal code changes and virtually no risk of regression.

 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 11 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index cb66ece6606b5..4f305de5d7304 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -668,12 +668,19 @@ static const u32 gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
-static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_NONE */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 	0x0b600, 0x0b600, 0x0b602, 0x0b602, 0x0b604, 0x0b604, 0x0b608, 0x0b60c,
 	0x0b60f, 0x0b621, 0x0b630, 0x0b633,
 	UINT_MAX, UINT_MAX,
 };
+static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_none_registers), 8));
+
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+	 0x0b600, 0x0b600,
+	 UINT_MAX, UINT_MAX,
+};
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_br_registers), 8));
 
 /* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_LPAC */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6f8ad50f32ce1..8d44b9377207c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -573,6 +573,8 @@ static struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+		gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
 	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
-- 
2.50.1

