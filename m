Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87ABC093D5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D810E2A7;
	Sat, 25 Oct 2025 16:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="boY/eyXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730BC10E2A7
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 16:15:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E84B60590;
 Sat, 25 Oct 2025 16:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A55C4CEFF;
 Sat, 25 Oct 2025 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408916;
 bh=fYpM4OCadbsv58G8fyRyUlNKco7Ezbjct5Df9ZTEAEI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=boY/eyXLzOJqNlZwjV8nhMXM/nxfFGoDYYAGVcACMsUiPVyStbLlU/0BURTjrUUIB
 xC9DLeHDN8xeNhD6prGYrqjDfOBtXkWc3cbEVUN1ZMmDI30LabSeMWP7aCH3KvAeTU
 sn7Xyr/otCe0l+t8080LxIFrONppWZddyLiulMVF0o1rfoA9a2cbAAPpdUEVSzz71l
 rCZ3a+dFppRYCidtx9Wuoaxzae4Q4URbmdqMTOgAWKHgbOLvTwwGDtpX+elwOHiwH2
 eZxrnhzUSHnZvGZmyuq7erIQrUVbzI3PqpjyvbHDA7i4PwCTCSnCj7fyc87rebYjrl
 k54M/nhUiRLiw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Karunika Choo <karunika.choo@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Dennis Tsiang <dennis.tsiang@arm.com>, Steven Price <steven.price@arm.com>,
 Sasha Levin <sashal@kernel.org>, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-6.12] drm/panthor: Serialize GPU cache flush
 operations
Date: Sat, 25 Oct 2025 11:56:00 -0400
Message-ID: <20251025160905.3857885-129-sashal@kernel.org>
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

From: Karunika Choo <karunika.choo@arm.com>

[ Upstream commit e322a4844811b54477b7072eb40dc9e402a1725d ]

In certain scenarios, it is possible for multiple cache flushes to be
requested before the previous one completes. This patch introduces the
cache_flush_lock mutex to serialize these operations and ensure that
any requested cache flushes are completed instead of dropped.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>
Signed-off-by: Dennis Tsiang <dennis.tsiang@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Link: https://lore.kernel.org/r/20250807162633.3666310-6-karunika.choo@arm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this is a real bug that users can hit
- Dropped flush requests: In the current code, if a cache flush is
  already in progress, a second caller does not issue another flush and
  simply waits for the first one to complete. See the conditional in
  `drivers/gpu/drm/panthor/panthor_gpu.c:358` and command write at
  `drivers/gpu/drm/panthor/panthor_gpu.c:360`. When
  `GPU_IRQ_CLEAN_CACHES_COMPLETED` is set, the second call skips issuing
  `GPU_FLUSH_CACHES(...)` and only waits for the existing flush to
  finish. If new CPU writes requiring a flush occur between the first
  flush’s command and the second caller’s request, those writes are not
  covered by the first flush. The second caller returns success without
  a flush that includes its writes. This is a correctness/coherency bug.
- WARN indicates it was unintended: The code explicitly warns if a flush
  is requested while one is pending (`drm_WARN_ON(...)` at
  `drivers/gpu/drm/panthor/panthor_gpu.c:358`), which already signals
  that concurrent callers were expected to be serialized at a higher
  level. The fact this commit adds serialization in the driver indicates
  concurrency can and does happen in practice.

What the patch changes
- Adds a dedicated mutex to serialize flush callers:
  - New field `struct mutex cache_flush_lock` in `struct panthor_gpu`
    (struct currently starts at
    `drivers/gpu/drm/panthor/panthor_gpu.c:26`).
  - Initializes it in `panthor_gpu_init()` alongside existing locks/wq
    (near `drivers/gpu/drm/panthor/panthor_gpu.c:166` where
    `spin_lock_init()` and `init_waitqueue_head()` are done).
  - Wraps `panthor_gpu_flush_caches()` entry with
    `guard(mutex)(&ptdev->gpu->cache_flush_lock);`, ensuring only one
    caller issues a flush command and waits at a time (function starts
    at `drivers/gpu/drm/panthor/panthor_gpu.c:350`).
- Effectively guarantees that each flush request results in a hardware
  flush. Without the mutex, concurrent callers can “piggyback” on a
  previous flush and return without their own flush, losing the ordering
  guarantee they expect.

Scope and risk assessment
- Small and contained: One file touched
  (`drivers/gpu/drm/panthor/panthor_gpu.c`), adding a `struct mutex`
  field, its init, and a single guard in one function. No ABI, uAPI, or
  architectural changes.
- Minimal regression risk: The function already sleeps
  (`wait_event_timeout(...)` at
  `drivers/gpu/drm/panthor/panthor_gpu.c:365`), so adding a mutex
  doesn’t alter the sleepability requirements. The only in-tree caller
  is from the scheduler path
  (`drivers/gpu/drm/panthor/panthor_sched.c:2742`) under `sched->lock`,
  not IRQ/atomic context.
- Locking safety: The IRQ handler uses only the spinlock `reqs_lock`
  (see `drivers/gpu/drm/panthor/panthor_gpu.c:156`-
  `drivers/gpu/drm/panthor/panthor_gpu.c:167`) and doesn’t touch the new
  mutex, so there’s no new lock inversion with the interrupt path. The
  flush function’s existing spinlock section remains unchanged and still
  protects `pending_reqs`.
- Guard macro availability: This stable tree already uses `guard(mutex)`
  widely (for example in `virt/lib/irqbypass.c:102` et al.), so the new
  `guard(mutex)` in this driver is compatible. If needed for strict
  include hygiene, `#include <linux/cleanup.h>` can be added, but
  similar files compile without explicitly adding it.

User impact and stable policy fit
- Fixes a real concurrency/coherency bug affecting correctness: A later
  flush request can be silently dropped, potentially leading to stale
  data observed by the GPU and spurious faults or subtle rendering/data
  corruption. This clearly affects users under certain timing
  conditions.
- No new features or behavior changes beyond making the existing API
  reliable under concurrency.
- Minimal risk, localized change in a driver subsystem.
- Although the commit message doesn’t carry a “Fixes:” or “Cc:
  stable@...” tag, it is a straightforward bug fix that meets stable
  backport criteria.

Cross-checks in the tree
- Current implementation demonstrating the bug:
  - Conditional suppression of a second flush:
    `drivers/gpu/drm/panthor/panthor_gpu.c:358`
  - Single flush command write:
    `drivers/gpu/drm/panthor/panthor_gpu.c:360`
  - Wait and timeout handling (unchanged by the patch): `drivers/gpu/drm
    /panthor/panthor_gpu.c:365`-
    `drivers/gpu/drm/panthor/panthor_gpu.c:375`
- Only in-tree caller identified:
  `drivers/gpu/drm/panthor/panthor_sched.c:2742`, but concurrency can
  still arise across scheduler/reset/suspend sequences or multiple
  threads.

Conclusion
- This is an important correctness fix with low risk and a small diff,
  preventing flushed-from-under-you race conditions. It should be
  backported to stable.

 drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7c..030409371037b 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -35,6 +35,9 @@ struct panthor_gpu {
 
 	/** @reqs_acked: GPU request wait queue. */
 	wait_queue_head_t reqs_acked;
+
+	/** @cache_flush_lock: Lock to serialize cache flushes */
+	struct mutex cache_flush_lock;
 };
 
 /**
@@ -204,6 +207,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
+	mutex_init(&gpu->cache_flush_lock);
 	ptdev->gpu = gpu;
 	panthor_gpu_init_info(ptdev);
 
@@ -353,6 +357,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 	bool timedout = false;
 	unsigned long flags;
 
+	/* Serialize cache flush operations. */
+	guard(mutex)(&ptdev->gpu->cache_flush_lock);
+
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
-- 
2.51.0

