Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB9ACA223
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D345810E40D;
	Sun,  1 Jun 2025 23:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I2RaBTKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D990F10E410;
 Sun,  1 Jun 2025 23:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4DA44614BF;
 Sun,  1 Jun 2025 23:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2746CC4CEE7;
 Sun,  1 Jun 2025 23:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820871;
 bh=WyO+M4FyI8ZWPTlyroibRWtNl1gBFKCZ+KTgEpn3XlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I2RaBTKd4Tf1uHjjRFZSXLVjocVMM9aK5n6f9YizN4aBB/hzndzKKRuThKQU3jmqZ
 ZcFFLETPACwOAIzQ3uzmexeA6CQ0wwkBvF9RhfGFlDSb2skSILqAJDOcYJovmk4s8w
 Tz3PQSmZYMO/6xsbLljmDr8p9sqxdLwcvsnIV3t4Q038FZs3FefQm5fxExYO6GBC+D
 ht/rSbnzAQvCMlr3uPpr5xqqnKKx+QiDggQHMAQ3oKIRyzWkhw9GgW+lc+lmH7jIxt
 Q8RaHjWyPNaChskxz0LKByJnVztUl8If+rTqozwEDaZP+qiRBNuTY89X/iJIr0CYm6
 3cSwn62iUmmow==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Yihan Zhu <Yihan.Zhu@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Mark Broadworth <mark.broadworth@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, martin.leung@amd.com, moadhuri@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 09/93] drm/amd/display: DCN32 null data check
Date: Sun,  1 Jun 2025 19:32:36 -0400
Message-Id: <20250601233402.3512823-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
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

From: Yihan Zhu <Yihan.Zhu@amd.com>

[ Upstream commit c9646e5a7e01c3ede286ec5edd4fcb2e1e80261d ]

[WHY & HOW]
Avoid null curve data structure used in the cm block for the potential issue.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Yihan Zhu <Yihan.Zhu@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

I need to analyze the actual Linux kernel commit from the provided
information in the user's message. Let me examine the commit details:
**Commit Analysis:** Subject: `drm/amd/display: DCN32 null data check`
**Commit Message:** - WHY & HOW: Avoid null curve data structure used in
the cm block for the potential issue. **Code Changes:** The commit
modifies `drivers/gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c` and adds
null checks for the `curve` pointer in two functions: 1.
`mpc32_program_shaper_luta_settings()` 2.
`mpc32_program_shaper_lutb_settings()` Specifically: - It wraps the
existing code that accesses `curve[0].offset`, `curve[0].segments_num`,
etc. with `if (curve)` null checks - Without this check, the code could
dereference a null pointer, leading to kernel crashes **Analysis of
Similar Commits:** Looking at the historical examples provided, this
commit is very similar to commits with "Backport Status: YES": 1.
**Similar Commit #1** - "Add Null check for DPP resource" - marked YES
2. **Similar Commit #2** - "Check null pointers before using them" -
marked YES These commits had similar characteristics: - Small, contained
null pointer checks - Fix potential kernel crashes/undefined behavior -
Minimal risk of regression - Address defensive programming issues
**Evaluation against backporting criteria:** 1. **Does it fix a bug that
affects users?** YES - Null pointer dereferences can cause kernel
crashes 2. **Is the fix relatively small and contained?** YES - Only
adds null checks around existing code 3. **Clear side effects beyond
fixing the issue?** NO - Simple defensive programming 4. **Major
architectural changes?** NO - Just adds safety checks 5. **Critical
kernel subsystems?** YES - Display driver, but the fix is minimal 6.
**Explicit stable tree mention?** NO - No Cc: stable tag 7. **Follows
stable tree rules?** YES - Important bugfix, minimal risk **YES** This
commit should be backported to stable kernel trees. Here's my extensive
analysis: **Reasoning for Backporting:** 1. **Critical Bug Fix**: This
commit addresses a potential null pointer dereference in the AMD display
driver's DCN32 color management code. Null pointer dereferences can
cause immediate kernel crashes (kernel panics), affecting system
stability. 2. **Minimal and Contained Change**: The fix is extremely
focused - it only adds `if (curve)` null checks around existing code
blocks in two functions (`mpc32_program_shaper_luta_settings` and
`mpc32_program_shaper_lutb_settings`). This defensive programming
pattern is a best practice that doesn't change the logic when `curve` is
valid. 3. **Low Regression Risk**: The change preserves existing
behavior when `curve` is non-null (the normal case) and simply skips
potentially dangerous operations when `curve` is null. This cannot
introduce new bugs since it only prevents undefined behavior. 4.
**Similar Pattern Success**: Looking at the historical examples, commits
with nearly identical characteristics have been successfully backported:
- "Add Null check for DPP resource" (YES) - Same subsystem, same type of
null check - "Check null pointers before using them" (YES) - Multiple
null checks in display code 5. **User Impact**: Display driver crashes
can render systems unusable, requiring hard reboots. Users with AMD GPUs
using DCN32 hardware could experience system instability without this
fix. 6. **Code Quality**: The commit follows standard defensive
programming practices. The existing code was accessing `curve[0]`,
`curve[1]`, etc. without verifying `curve` wasn't null, which is a clear
programming error. The only reason this might not have an explicit `Cc:
stable` tag is that it could be a recently discovered issue or the
developers may have overlooked the stable tree importance. However, the
technical characteristics clearly meet stable tree criteria: it's an
important bugfix with minimal regression risk confined to a specific
subsystem.

 .../drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c  | 380 +++++++++---------
 1 file changed, 192 insertions(+), 188 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c b/drivers/gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c
index a0e9e9f0441a4..b4cea2b8cb2a8 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c
@@ -370,275 +370,279 @@ void mpc32_program_shaper_luta_settings(
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].red.custom_float_y);
 
 	curve = params->arr_curve_points;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_0_1[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_2_3[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_4_5[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_6_7[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_8_9[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_10_11[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_12_13[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_14_15[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_16_17[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_18_19[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_20_21[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_22_23[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_24_25[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_26_27[mpcc_id], 0,
+	if (curve) {
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_0_1[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_28_29[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_30_31[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_32_33[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-}
-
-
-void mpc32_program_shaper_lutb_settings(
-		struct mpc *mpc,
-		const struct pwl_params *params,
-		uint32_t mpcc_id)
-{
-	const struct gamma_curve *curve;
-	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
-
-	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_B[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].blue.custom_float_x,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
-	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_G[mpcc_id], 0,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].green.custom_float_x,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
-	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_R[mpcc_id], 0,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].red.custom_float_x,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
-
-	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_B[mpcc_id], 0,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].blue.custom_float_x,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].blue.custom_float_y);
-	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_G[mpcc_id], 0,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].green.custom_float_x,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].green.custom_float_y);
-	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_R[mpcc_id], 0,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].red.custom_float_x,
-			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].red.custom_float_y);
-
-	curve = params->arr_curve_points;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_0_1[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_2_3[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_2_3[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_4_5[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_4_5[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_6_7[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_6_7[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_8_9[mpcc_id], 0,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
-		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_8_9[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_10_11[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_10_11[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_12_13[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_12_13[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_14_15[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_14_15[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_16_17[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_16_17[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_18_19[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_18_19[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_20_21[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_20_21[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_22_23[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_22_23[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_24_25[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_24_25[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_26_27[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_26_27[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_28_29[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_28_29[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_30_31[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_30_31[mpcc_id], 0,
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_32_33[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+	}
+}
+
+
+void mpc32_program_shaper_lutb_settings(
+		struct mpc *mpc,
+		const struct pwl_params *params,
+		uint32_t mpcc_id)
+{
+	const struct gamma_curve *curve;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_B[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].blue.custom_float_x,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_G[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].green.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_R[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].red.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
 
-	curve += 2;
-	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_32_33[mpcc_id], 0,
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_B[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].blue.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].blue.custom_float_y);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_G[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].green.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].green.custom_float_y);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_R[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].red.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].red.custom_float_y);
+
+	curve = params->arr_curve_points;
+	if (curve) {
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_0_1[mpcc_id], 0,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
 			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_2_3[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_4_5[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_6_7[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_8_9[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_10_11[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_12_13[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_14_15[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_16_17[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_18_19[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_20_21[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_22_23[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_24_25[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_26_27[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_28_29[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_30_31[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+		curve += 2;
+		REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_32_33[mpcc_id], 0,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+				MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+	}
 }
 
 
-- 
2.39.5

