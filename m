Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A290CACA1DA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228E10E3E9;
	Sun,  1 Jun 2025 23:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HgEj29Cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8E10E3E9;
 Sun,  1 Jun 2025 23:31:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA10A61127;
 Sun,  1 Jun 2025 23:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3030C4CEEE;
 Sun,  1 Jun 2025 23:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820678;
 bh=OxBOcbtuqIDR7qc9xFiV8LyuxmWHOl22ZaWUz5qEZSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HgEj29Cv+ORH3Jay/4OEDADNmzgBV6Z8fMgM8urszCf57No6NfdWqMqtXgjrYJ4V9
 ucEzUJKSY2kyiyn5axSLCqfS2ktoQaNDCiqvDz3SewxhqqAi7MxJw6OAtS5CcCQX5f
 YsdqOvBx2jDtUjRdoLnY57FyonZ5tEzF/DKY2NJRShFsox8P7VCQ+XZRuT2YqXPX9M
 hvl0AZaYvOcwh2a1B14NW5neE8Hu85KODaP4Dnu5klp9Lox74r1o6wyLxTMRgqW0lG
 c7/zpW/UJaPpkCnRr2Qc1MEhwOTHVT6vE2SHEiFZT8qqNIaD7cC986zmlb9VfvAdNi
 Z9jxxS6aEgq1w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Charlene Liu <Charlene.Liu@amd.com>, Ovidiu Bunea <ovidiu.bunea@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 040/102] drm/amd/display: fix zero value for APU
 watermark_c
Date: Sun,  1 Jun 2025 19:28:32 -0400
Message-Id: <20250601232937.3510379-40-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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

From: Charlene Liu <Charlene.Liu@amd.com>

[ Upstream commit d5a7fdc88a2d64242d959942cbd0e1499ebb9806 ]

[why]
the guard of is_apu not in sync, caused no watermark_c output.

Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Bug Analysis The commit fixes a critical bug
in AMD display driver's watermark handling for APU (Accelerated
Processing Unit) systems. The issue is in the
`dml2_validate_and_build_resource` function where watermark_c was being
incorrectly populated for APU systems. ## Problem Description **Before
the fix:** ```c memcpy(&context->bw_ctx.bw.dcn.watermarks.c,
&dml2->v20.g6_temp_read_watermark_set,
sizeof(context->bw_ctx.bw.dcn.watermarks.c)); ``` **After the fix:**
```c if (context->streams[0]->sink->link->dc->caps.is_apu)
dml2_extract_watermark_set(&context->bw_ctx.bw.dcn.watermarks.c,
&dml2->v20.dml_core_ctx); else
memcpy(&context->bw_ctx.bw.dcn.watermarks.c,
&dml2->v20.g6_temp_read_watermark_set,
sizeof(context->bw_ctx.bw.dcn.watermarks.c)); ``` ## Why This is a Good
Backport Candidate 1. **Clear Bug Fix**: The commit message explicitly
states "the guard of is_apu not in sync, caused no watermark_c output" -
this indicates a bug where APU systems were getting incorrect (likely
zero) watermark values. 2. **Consistent Pattern**: Looking at the same
file (line 546, 561, 569), there are already multiple `is_apu` checks
that differentiate behavior between APU and discrete GPU systems. The
original code at line 666 was inconsistent with this pattern. 3. **Small
and Contained**: The fix is minimal - just adding a conditional check
around an existing operation. It doesn't introduce new functionality or
architectural changes. 4. **Critical Subsystem**: Display watermarks are
critical for preventing display artifacts, screen corruption, underflow
issues, and power management problems. Incorrect watermarks can cause
visible display problems for users. 5. **APU-Specific Impact**: APUs
(integrated GPU+CPU) are very common in laptops and budget systems. A
watermark bug affecting these systems would impact a large user base. 6.
**Comparison with Similar Commits**: Looking at the similar commits
provided: - Commits #2 and #4 with "YES" status fix watermark values to
prevent "flickering and OTC underflow" - This commit follows the same
pattern of fixing watermark-related display issues ## Risk Assessment
**Low Risk:** - The change only affects APU systems (`is_apu` check) -
For non-APU systems, behavior remains exactly the same - The fix aligns
the watermark_c handling with how watermarks a, b, and d are already
handled - Uses existing, well-tested `dml2_extract_watermark_set()`
function instead of raw memcpy ## Context from Kernel Investigation The
git blame shows the original problematic code was introduced in commit
7966f319c66d9 (July 2023) when DML2 was first introduced. This suggests
the bug has existed since DML2 was added, affecting APU users for
potentially over a year. The fix ensures APU systems get proper
watermark calculations via `dml2_extract_watermark_set()` instead of
using potentially incorrect temporary values from
`g6_temp_read_watermark_set`. **Conclusion**: This is a clear, low-risk
bug fix that addresses display functionality issues on a common class of
hardware (APUs) and follows stable tree criteria perfectly.

 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index d0f9df2daeb41..0c535f9602da3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -663,7 +663,10 @@ static bool dml2_validate_and_build_resource(const struct dc *in_dc, struct dc_s
 		dml2_copy_clocks_to_dc_state(&out_clks, context);
 		dml2_extract_watermark_set(&context->bw_ctx.bw.dcn.watermarks.a, &dml2->v20.dml_core_ctx);
 		dml2_extract_watermark_set(&context->bw_ctx.bw.dcn.watermarks.b, &dml2->v20.dml_core_ctx);
-		memcpy(&context->bw_ctx.bw.dcn.watermarks.c, &dml2->v20.g6_temp_read_watermark_set, sizeof(context->bw_ctx.bw.dcn.watermarks.c));
+		if (context->streams[0]->sink->link->dc->caps.is_apu)
+			dml2_extract_watermark_set(&context->bw_ctx.bw.dcn.watermarks.c, &dml2->v20.dml_core_ctx);
+		else
+			memcpy(&context->bw_ctx.bw.dcn.watermarks.c, &dml2->v20.g6_temp_read_watermark_set, sizeof(context->bw_ctx.bw.dcn.watermarks.c));
 		dml2_extract_watermark_set(&context->bw_ctx.bw.dcn.watermarks.d, &dml2->v20.dml_core_ctx);
 		dml2_extract_writeback_wm(context, &dml2->v20.dml_core_ctx);
 		//copy for deciding zstate use
-- 
2.39.5

