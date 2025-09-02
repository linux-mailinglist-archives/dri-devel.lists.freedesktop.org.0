Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF087B3FF3B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D78510E690;
	Tue,  2 Sep 2025 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BdpAc5Hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8310E324;
 Tue,  2 Sep 2025 12:08:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D812445A7;
 Tue,  2 Sep 2025 12:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B0EC4CEF4;
 Tue,  2 Sep 2025 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756814932;
 bh=LAwn6LXlJkC2hCxXCp6lL6R5ho2WopRSPF5UydoPook=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BdpAc5HyZCucuirSTYZ4xU5CLno+RXVLCXQUQIfP2t412JO1M6RBXqwppnwdDGszr
 zEOsRKKfTfyE4WttU1hFX/Mh8TioFaRFCkGGO5I9/0UiVscdpRUUPJIRVq1wvn4Jw9
 SNmmFYrfUpRrrn32MiR+KDnmwOBehXEypVXK3cqOuHb7gpqVJoFHSTE/Ll2sK7bG2U
 3h9/LbxM1HPKHMaQWEAVZOqaJqBc0x9sG0zbyHmBHK5NG6dpZpHaYqRhNtOALmVc1X
 +O628PifEl1ZA+QpOdSsie+MEKclNrVFsd21/kpPkatR8e+m+zznOZQWlcdIkQYLZl
 NGtzp2LpRfz1A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.16-6.12] drm/msm: Fix debugbus snapshot
Date: Tue,  2 Sep 2025 08:08:23 -0400
Message-ID: <20250902120833.1342615-12-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
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

[ Upstream commit a814ba2d7b847cff15565bbab781df89e190619c ]

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/666660/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Impact Analysis

1. **Clear bug fix**: The code analysis shows that
   `a7xx_get_debugbus_blocks()` allocates memory for
   `total_debugbus_blocks` worth of debugbus data and populates all of
   them, but critically fails to set `a6xx_state->nr_debugbus =
   total_debugbus_blocks`. This is clearly visible at line 442 of the
   fixed code.

2. **User-visible impact**: Without setting `nr_debugbus`, the function
   `a6xx_show_debugbus()` at line 1949 will iterate 0 times (`for (i =
   0; i < a6xx_state->nr_debugbus; i++)`), meaning NO debugbus data will
   be shown in GPU crash dumps for a7xx GPUs. This severely impacts
   debugging capabilities when GPU hangs or crashes occur.

3. **Regression timeline**: This bug was introduced in commit
   64d6255650d4e0 ("drm/msm: More fully implement devcoredump for a7xx")
   from January 2024, which added the `a7xx_get_debugbus_blocks()`
   function but forgot to set the counter. The a6xx version of this
   function correctly sets `nr_debugbus` at lines 372 and 384.

## Stable Tree Criteria Met

1. **Real bug affecting users**: Yes - debugbus data is completely
   missing from a7xx GPU crash dumps
2. **Small and contained fix**: Yes - single line addition:
   `a6xx_state->nr_debugbus = total_debugbus_blocks;`
3. **No architectural changes**: The fix simply sets an existing counter
   variable that was forgotten
4. **Minimal regression risk**: The change only affects the specific
   code path for a7xx GPUs and simply enables already-allocated and
   populated data to be displayed
5. **Critical debugging functionality**: GPU crash dumps are essential
   for debugging graphics driver issues in production

## Technical Details

The bug is in the a7xx-specific path where:
- Memory is allocated for `total_debugbus_blocks` entries (line 426)
- All blocks are populated via `a6xx_get_debugbus_block()` calls (lines
  430-439)
- But `nr_debugbus` is never set, leaving it at 0
- This causes `a6xx_show_debugbus()` to skip all debugbus output since
  it loops from 0 to `nr_debugbus`

The fix correctly sets `nr_debugbus = total_debugbus_blocks` after
populating all the data, matching the pattern used in the a6xx
equivalent function.

This is a perfect candidate for stable backporting as it fixes a clear
functional regression in debugging infrastructure without any risk of
destabilizing the system.

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a85d3df7a5fac..f46bc906ca2a3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -423,8 +423,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1

