Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B72ACA148
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F8C10E2F8;
	Sun,  1 Jun 2025 23:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5fIYkw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39E510E2F8;
 Sun,  1 Jun 2025 23:25:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8992444BBC;
 Sun,  1 Jun 2025 23:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02926C4CEEE;
 Sun,  1 Jun 2025 23:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820358;
 bh=VgXaw0opX4N8DOTZJP/W6frQFN+qpfKXQt25PrW05WI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c5fIYkw/GjYinF6+aSygDP2wZlaYwYl7pF18ruo9Hibr/vRjm5VUlKj3ivXfvugwA
 7IbzjC6M+P9nSJFaY+QYH52CQjh/jRI1VIXbsiksVmseUF2vR+/2+plvTiuP0b3Ntr
 etvQaQ5Gx96NPhrroQwEaT4wPzTtkkqUKzkZnWKzy918pWCff0qU3QTCJj4Nn+yEBe
 SUZbaRHkfgcxq3Q3UHxGjADfRyFtz4Bxo3myBWjp/lxg/n4EJUsb2+ui7Y2w9bEVs7
 yBgJF7K6FqqndeVPfH+g5xbjKIQcLKcAtaPKs4hok3D91o63VGGstvcnY6AHZFMDG6
 1+mmcsiNWLLIQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Paul Hsieh <Paul.Hsieh@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, nicholas.kazlauskas@amd.com,
 alvin.lee2@amd.com, rodrigo.siqueira@amd.com, yi-lchen@amd.com,
 george.shen@amd.com, Zhongwei.Zhang@amd.com, v.shevtsov@maxima.ru,
 Fudong.Wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 031/110] drm/amd/display: Skip to enable dsc if
 it has been off
Date: Sun,  1 Jun 2025 19:23:13 -0400
Message-Id: <20250601232435.3507697-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Paul Hsieh <Paul.Hsieh@amd.com>

[ Upstream commit 8b8a602c985e99074fa1d5233cd224b7bcfb9df2 ]

[Why]
It makes DSC enable when we commit the stream which need
keep power off.And then it will skip to disable DSC if
pipe reset at this situation as power has been off. It may
cause the DSC unexpected enable on the pipe with the
next new stream which doesn't support DSC.

[HOW]
Check the DSC used on current pipe status when update stream.
Skip to enable if it has been off. The operation enable
DSC should happen when set power on.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Paul Hsieh <Paul.Hsieh@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

## **YES** This commit should be backported to stable kernel trees based
on my comprehensive analysis: ### **Analysis Summary:** **1. Bug
Description and Impact:** The commit fixes a critical DSC (Display
Stream Compression) state management bug where: - DSC gets incorrectly
enabled when committing a stream that should keep power off - When a
pipe reset occurs with power already off, DSC disable is skipped - This
causes DSC to be unexpectedly enabled on subsequent streams that don't
support DSC - This can lead to display corruption or system instability
for users with affected AMD GPUs **2. Code Changes Analysis:** The fix
adds robust state checking in
`drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c:72-108` by:
```c struct dcn_dsc_state dsc_state = {0}; if (!dsc) { DC_LOG_DSC("DSC
is NULL for tg instance %d:", pipe_ctx->stream_res.tg->inst); return; }
if (dsc->funcs->dsc_read_state) { dsc->funcs->dsc_read_state(dsc,
&dsc_state); if (!dsc_state.dsc_fw_en) { DC_LOG_DSC("DSC has been
disabled for tg instance %d:", pipe_ctx->stream_res.tg->inst); return; }
} ``` This adds a critical safety check that: - Reads the current DSC
hardware state before attempting to enable it - Checks if DSC is already
disabled (`!dsc_state.dsc_fw_en`) - Returns early if DSC is already off,
preventing incorrect state transitions **3. Consistency with Similar
Fixes:** Historical analysis shows this exact fix pattern was already
applied to: - **dcn32** in commit `4bdc5b504af7` (with Cc:
stable@vger.kernel.org) - **dcn35** in the same commit - This commit
extends the fix to **dcn314** hardware Similar Commit #1 in the examples
shows a nearly identical fix that received **"Backport Status: YES"**
and was explicitly marked for stable (`Cc: stable@vger.kernel.org`).
**4. Backport Criteria Assessment:** - ✅ **Fixes important user-
affecting bug**: Display corruption/instability - ✅ **Small and
contained change**: Only 14 lines, minimal scope - ✅ **No architectural
changes**: Pure defensive programming addition - ✅ **Minimal regression
risk**: Only adds safety checks, no behavior change for correct flows -
✅ **Subsystem confined**: Limited to AMD display driver dcn314 path - ✅
**Follows established pattern**: Identical fix already applied to
related hardware generations - ✅ **Clear maintainer support**: Previous
similar commits included stable tree marking **5. Hardware Impact:**
This affects DCN 3.14 generation AMD GPUs, which are used in production
systems where display stability is critical for users. The fix follows
the exact same defensive programming pattern already proven safe and
effective in dcn32/dcn35, making it a low-risk, high-value backport
candidate that addresses a real user-impacting display bug.

 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
index be26c925fdfa1..e68f21fd5f0fb 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
@@ -84,6 +84,20 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		struct dsc_config dsc_cfg;
 		struct dsc_optc_config dsc_optc_cfg = {0};
 		enum optc_dsc_mode optc_dsc_mode;
+		struct dcn_dsc_state dsc_state = {0};
+
+		if (!dsc) {
+			DC_LOG_DSC("DSC is NULL for tg instance %d:", pipe_ctx->stream_res.tg->inst);
+			return;
+		}
+
+		if (dsc->funcs->dsc_read_state) {
+			dsc->funcs->dsc_read_state(dsc, &dsc_state);
+			if (!dsc_state.dsc_fw_en) {
+				DC_LOG_DSC("DSC has been disabled for tg instance %d:", pipe_ctx->stream_res.tg->inst);
+				return;
+			}
+		}
 
 		/* Enable DSC hw block */
 		dsc_cfg.pic_width = (stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right) / opp_cnt;
-- 
2.39.5

