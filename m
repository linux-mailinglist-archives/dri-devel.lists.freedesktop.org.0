Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FDEC093CE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00E10E2A1;
	Sat, 25 Oct 2025 16:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ej+8x8/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A7010E2A0;
 Sat, 25 Oct 2025 16:15:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE5B344F8D;
 Sat, 25 Oct 2025 16:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE70C4CEFB;
 Sat, 25 Oct 2025 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408913;
 bh=78ERbFKaeO0h6PkzV58N49XWB06R/jyEXp38t/OS7tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ej+8x8/Y8+G0SLKDGSSSod+6qKvBWEOz3JNDqH/DIsM4OPnegVAE8PHpdjv1gHESJ
 XFdIRfHD1qXBAn9fG/rcwE0awD57lxGNYWmmJmiPfJVaDLdJCp41WGWR7cJYqbu1fj
 w766HjEXF9kPUJkK5U9Iy2Zx0HWkHpwcf7yKdlhFjKADX5KBgCw01ekXx5bugyRI2A
 vLsm89iBpFzSze7iW9+D4iybCD3BYQfdC/ALTG573AS8A4/GgZxMr79nBETN+HI8Lw
 mVpdX8GPgueKWyedKOkhEbRumitCPGSgMzM/IlUXYIh6Rn2ylBkLOhxdOMFggOneeX
 vTWaUJnz5EfCg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-5.15] drm/msm: make sure to not queue up recovery
 more than once
Date: Sat, 25 Oct 2025 11:55:58 -0400
Message-ID: <20251025160905.3857885-127-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Antonino Maniscalco <antomani103@gmail.com>

[ Upstream commit 10fb1b2fcaee5545a5e54db1ed4d7b15c2db50c8 ]

If two fault IRQs arrive in short succession recovery work will be
queued up twice.

When recovery runs a second time it may end up killing an unrelated
context.

Prevent this by masking off interrupts when triggering recovery.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/670023/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes: Two fault IRQs arriving back-to-back can queue
  `recover_work` twice; the second recovery may kill an unrelated
  context. The change masks interrupts before queuing recovery so
  subsequent fault IRQs don’t re-queue recovery.
- Core change: In `drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1821-1824`,
  `a6xx_fault_detect_irq()` adds:
  - `gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);` to mask all RBBM
    interrupts before `kthread_queue_work(gpu->worker,
    &gpu->recover_work);`
  - This follows the hangcheck timer being disabled, ensuring no further
    spurious recovery triggers while the first recovery proceeds.
- Call path impact: `a6xx_irq()` invokes `a6xx_fault_detect_irq()` on
  hang detect (`drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1891-1900`). With
  the new mask, subsequent IRQs won’t retrigger recovery for the same
  incident.
- Interrupts are safely restored: During recovery, the GPU is
  reinitialized and interrupts are re-enabled in `a6xx_hw_init()` via
  `REG_A6XX_RBBM_INT_0_MASK` (sets `A6XX_INT_MASK`/`A7XX_INT_MASK`) at
  `drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1410-1413`. `a6xx_recover()`
  calls `msm_gpu_hw_init(gpu)` to perform this re-init
  (`drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1614`). Additionally, the top-
  level wrapper brackets `hw_init` with `disable_irq/enable_irq`
  (`drivers/gpu/drm/msm/msm_gpu.c:168-174`), so the flow cleanly unmasks
  after reset.
- Consistency with existing patterns: A similar mask-on-fault pattern
  already exists for a7xx SW fuse violations
  (`drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1831-1834`), indicating this
  is the established approach to prevent repeated fault handling.
- Stable suitability:
  - User-visible bugfix: Prevents erroneous second recovery that can
    kill unrelated contexts.
  - Small and contained: One register write in an error path; no ABI or
    feature changes.
  - Low regression risk: Interrupts are restored during the normal
    recovery/reinit path; only affects a6xx hang/fault handling.
  - No architectural churn, limited to DRM/MSM Adreno a6xx driver.

Conclusion: This is a minimal, targeted fix for a real correctness issue
with low risk and clear recovery restore points, making it a good
candidate for backporting to all supported stable kernels that include
the a6xx driver.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45dd5fd1c2bfc..f8992a68df7fb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	/* Turn off the hangcheck timer to keep it from bothering us */
 	timer_delete(&gpu->hangcheck_timer);
 
+	/* Turn off interrupts to avoid triggering recovery again */
+	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
+
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
-- 
2.51.0

