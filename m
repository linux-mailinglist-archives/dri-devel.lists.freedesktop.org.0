Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C898ACA2AA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FBD10E456;
	Sun,  1 Jun 2025 23:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y7386q1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFE110E456;
 Sun,  1 Jun 2025 23:39:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E5176113B;
 Sun,  1 Jun 2025 23:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81855C4CEE7;
 Sun,  1 Jun 2025 23:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821154;
 bh=pA/jQSY+1R/Mi6GHjUlyXFCe9bWopPgnDYpwRXJ1FXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y7386q1SZcgIlY8qeGKL6Tij+vCRCudYQCY/JxzDAPpQtyScgXI22EggZddtbkBF4
 CGcYFPQ2jtOl4sprcKZvc1tTtr9b/CYk7PZC/+U/+bXTBIA/0OHzF9D1hBM4rXoNbq
 /X9v6A10KgQ2c0KmYawEi/IbAIJjauepHMYoUw+l+r4IYZbAQbBd19hti8uPzMDgf9
 E08FZLwLZck4rAk0h1/Xs/4FINrTSpwKzH8J1aXWRmhU8+Jwy6G6g6L2xKiLYNb9p0
 OIlkOtzJoeYCN30E/6v8wMeyr2fryiFs2607uVqLUz9j5DPT5DNwhllwOKWO9Ya8vy
 iQG1IJn9JEyxw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: TungYu Lu <tungyu.lu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Mark Broadworth <mark.broadworth@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, alex.hung@amd.com, rodrigo.siqueira@amd.com,
 hamzamahfooz@linux.microsoft.com, v.shevtsov@mt-integration.ru,
 ivlipski@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 36/66] drm/amd/display: Correct prefetch
 calculation
Date: Sun,  1 Jun 2025 19:37:13 -0400
Message-Id: <20250601233744.3514795-36-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
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

From: TungYu Lu <tungyu.lu@amd.com>

[ Upstream commit 33bc89949b4366dff2dca30bc61ba1c0cbcd2ab2 ]

[Why]
The minimum value of the dst_y_prefetch_equ was not correct
in prefetch calculation whice causes OPTC underflow.

[How]
Add the min operation of dst_y_prefetch_equ in prefetch calculation
for legacy DML.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: TungYu Lu <tungyu.lu@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** ## Analysis This commit should be backported to stable kernel
trees. Here's my detailed analysis: ### **Bug Description and Impact**
The commit fixes a critical hardware register overflow issue in AMD
display's prefetch calculation that causes OPTC (Output Pipe and Timing
Control) underflow. OPTC underflow is a serious display issue that can
cause: - Screen corruption or artifacts - Display timing problems -
Potential system instability during display operations ### **Code Change
Analysis** The fix adds a single line in three DCN (Display Core Next)
versions (30, 31, 314): ```c dst_y_prefetch_equ =
dml_min(dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2
for DST_Y_PREFETCH ``` This change: 1. **Prevents register overflow**:
The DST_Y_PREFETCH register is limited to 8 bits with U6.2 format,
meaning maximum value is 63.75 2. **Applies early in calculation**: The
limit is applied to `dst_y_prefetch_equ` before it's used in subsequent
calculations 3. **Matches existing pattern**: DCN21 already has this
exact fix (commit 9857bb9457fe5 from 2021), establishing this as a
known, proven solution ### **Why This Should Be Backported** 1.
**Important Bug Fix**: Fixes a hardware register overflow that causes
visible display issues affecting end users 2. **Minimal Risk**: - Single
line addition in each file - No architectural changes - Simply enforces
hardware register limits that should have been there - Proven safe
(already in DCN21 for 3+ years) 3. **Contained Scope**: Only affects AMD
display prefetch calculations in legacy DML (Display Mode Library)
versions 4. **Clear User Impact**: OPTC underflow causes noticeable
display problems that users would report 5. **Follows Stable Criteria**:
- Small, obvious fix - Addresses hardware limitation - Low regression
risk - Similar to reference commits marked "YES" for backporting ###
**Comparison with Similar Commits** Looking at the provided examples: -
**Similar Commit #1** (YES): Also fixes prefetch calculation with min
operation and has `Cc: stable@vger.kernel.org` - **Similar Commit #2**
(YES): Fixes prefetch calculation loop variables and explicitly tagged
for stable backport - **Similar Commit #4** (NO): Same type of
DST_Y_PREFETCH guard fix but wasn't tagged for stable The pattern shows
that prefetch calculation fixes that prevent register overflow and have
clear user impact are good backport candidates. ### **Hardware Context**
This affects DCN 3.0, 3.1, and 3.14 hardware generations. The fact that
DCN 2.1 already had this fix suggests this was a systematic issue across
multiple hardware generations that needed addressing. The fix is
essential for proper display functionality and represents a critical
hardware constraint that must be enforced to prevent register overflow
and subsequent display corruption.

 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c   | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c   | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 72ffa1abebaa1..d799ae7a9048d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -1002,6 +1002,7 @@ static bool CalculatePrefetchSchedule(
 
 	dst_y_prefetch_equ = VStartup - (Tsetup + dml_max(TWait + TCalc, *Tdmdl)) / LineTime
 			- (*DSTYAfterScaler + *DSTXAfterScaler / myPipe->HTotal);
+	dst_y_prefetch_equ = dml_min(dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 
 	Lsw_oto = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC);
 	Tsw_oto = Lsw_oto * LineTime;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index adea459e7d363..338a295c464dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -1105,6 +1105,7 @@ static bool CalculatePrefetchSchedule(
 	Tr0_oto_lines = dml_ceil(4.0 * Tr0_oto / LineTime, 1) / 4.0;
 	dst_y_prefetch_oto = Tvm_oto_lines + 2 * Tr0_oto_lines + Lsw_oto;
 	dst_y_prefetch_equ =  VStartup - (*TSetup + dml_max(TWait + TCalc, *Tdmdl)) / LineTime - (*DSTYAfterScaler + *DSTXAfterScaler / myPipe->HTotal);
+	dst_y_prefetch_equ = dml_min(dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 	dst_y_prefetch_equ = dml_floor(4.0 * (dst_y_prefetch_equ + 0.125), 1) / 4.0;
 	Tpre_rounded = dst_y_prefetch_equ * LineTime;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index a94aa0f21a7f4..06cb11bc60905 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -1126,6 +1126,7 @@ static bool CalculatePrefetchSchedule(
 	Tr0_oto_lines = dml_ceil(4.0 * Tr0_oto / LineTime, 1) / 4.0;
 	dst_y_prefetch_oto = Tvm_oto_lines + 2 * Tr0_oto_lines + Lsw_oto;
 	dst_y_prefetch_equ =  VStartup - (*TSetup + dml_max(TWait + TCalc, *Tdmdl)) / LineTime - (*DSTYAfterScaler + *DSTXAfterScaler / myPipe->HTotal);
+	dst_y_prefetch_equ = dml_min(dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 	dst_y_prefetch_equ = dml_floor(4.0 * (dst_y_prefetch_equ + 0.125), 1) / 4.0;
 	Tpre_rounded = dst_y_prefetch_equ * LineTime;
 
-- 
2.39.5

