Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F4B3FF3D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEFA10E695;
	Tue,  2 Sep 2025 12:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KEU80650";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038FB10E695;
 Tue,  2 Sep 2025 12:08:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 009F260206;
 Tue,  2 Sep 2025 12:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4A7C4CEF7;
 Tue,  2 Sep 2025 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756814936;
 bh=s7eGJZp6iHwsOqMKnNp/7d6zarSqh4NmZUcRnPi4YZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KEU80650D44PzgFjq8wPPTNlp2OiqkAkQQnZplNqR2ZuoDNqnGB7NAQQmUvhheIxK
 Khk3F5xKt4u+flMiA2BZs5LNGNyVdCz6jGkfEayyLsJP7Gw6p7BjVl/6i/8LEA7oqc
 ekB7kjhmo47AFvM0Kws+McaylaNC02FYHouWINVKUO9SYyH1gl2XySQ9jCxqpYxP0G
 m5UTBJQl62DRp6v0p90JUfGfI/ARr65NV5IdMmNEpyLgUKyIe+Z+6dHjsnKhMBJcks
 +4vo4QH+EYlv+u9j5dVUgLfOawHyMT1xwUiY9sR6VQHkuo55y9/8krHEUa6rV2PRXe
 nAZ9DHfZqNShA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.16-6.12] drm/msm: Fix order of selector programming
 in cluster snapshot
Date: Tue,  2 Sep 2025 08:08:26 -0400
Message-ID: <20250902120833.1342615-15-sashal@kernel.org>
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

[ Upstream commit a506578d8909e7e6f0d545af9850ccd4318bf6cf ]

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/666655/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Bug Fix Nature

The commit fixes a **clear functional bug** in the GPU crash
dump/snapshot functionality for Qualcomm Adreno GPUs (specifically the
a7xx series). The bug causes incorrect register capture during GPU crash
dumps:
- **Symptom**: Failing to capture ctx0 (context 0) registers correctly
- **Impact**: ctx1 registers were actually ctx0 registers, meaning
  critical debugging information was lost or misrepresented

## Code Analysis

The fix is **extremely simple and surgical** - it only reorders two
blocks of code in the `a7xx_get_cluster()` function:

**Before the fix:**
```c
/* Some clusters need a selector register to be programmed too */
if (cluster->sel)
    in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);

in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD, ...);
```

**After the fix:**
```c
in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD, ...);

/* Some clusters need a selector register to be programmed too */
if (cluster->sel)
    in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
```

The aperture control register (`REG_A7XX_CP_APERTURE_CNTL_CD`) must be
programmed **before** the selector register. This is a classic hardware
programming sequence issue where register order matters.

## Stable Backport Criteria Met

1. **Fixes a real bug**: Yes - incorrect crash dump data affects
   debugging capability
2. **Small and contained**: Yes - only 4 lines moved, no logic changes
3. **No architectural changes**: Correct - purely a reordering fix
4. **Minimal regression risk**: Yes - only affects crash dump path, not
   normal operation
5. **Aligns with vendor driver**: The commit explicitly states it
   "aligns with the downstream driver"
6. **No new features**: Correct - purely a bug fix

## Additional Supporting Evidence

- The commit has already been marked with "Upstream commit
  a506578d8909..." suggesting it's been accepted upstream
- Similar fixes in the same file (e.g., `f28c9fc2c82de drm/msm: Fix
  debugbus snapshot`) show a pattern of fixing crash dump issues
- The fix is isolated to the crash dump code path
  (`a7xx_get_cluster()`), which is only executed during GPU error
  recovery
- The author (Rob Clark) is a maintainer of the MSM DRM driver, lending
  credibility to the fix

This is an ideal stable backport candidate - it fixes a clear bug with
minimal code change and virtually no risk of regression.

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 61850e2802914..6e8dbd27addbe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -776,15 +776,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1

