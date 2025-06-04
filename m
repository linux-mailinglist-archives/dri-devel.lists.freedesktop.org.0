Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D7ACD970
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921010E093;
	Wed,  4 Jun 2025 08:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OB9MnhzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E855810E093
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:17:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 107FC5C3F69;
 Wed,  4 Jun 2025 08:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8B5C4CEE7;
 Wed,  4 Jun 2025 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749025047;
 bh=YDCdNCq/TneswErY2hRIPvI7RQchpXi4ApeIkedwm7w=;
 h=From:To:Cc:Subject:Date:From;
 b=OB9MnhzI9mDaHg5mLkDiG+ZcoGfgLnHG2NLW0ZRsgjxQjjDid/Ii1eMT3mFQP1rKU
 3lxmJ0S19b69MqqFS9mNnBf36EOKYDn6WoVGChgvm2DpXP6xZgc4iCYn5VgDxs0sc2
 ayYnmlGsDD2a/5PLUaHyC3n5rg828d4DRhBcCMUbI/6fSHjM/CIwg578McpdpB8/6t
 TYcZwCTzhTBMNE050c29nwPKuVadB57eSbxQbJ4z7W3kdE9EDxBrhB/NEmRt/OE6nQ
 AxEqr/P2ZJJn8IVikpikHEibpjpwSmslUQlCTO/WKAdng5KkFh5BnOnN3kIFIAGpN1
 lkeZLhw8Ct5yA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Discourage usage of separate workqueues
Date: Wed,  4 Jun 2025 10:16:58 +0200
Message-ID: <20250604081657.124453-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

struct drm_sched_init_args provides the possibility of letting the
scheduler use user-controlled workqueues, instead of the scheduler
creating its own workqueues. It's currently not documented who would
want to use that.

Not sharing the submit_wq between driver and scheduler has the advantage
of no negative intereference between them being able to occur (e.g.,
MMU notifier callbacks waiting for fences to get signaled). A separate
timeout_wq should rarely be necessary, since using the system_wq could,
in the worst case, delay a timeout.

Discourage the usage of own workqueues in the documentation.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 81dcbfc8c223..11740d745223 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
  *
  * @ops: backend operations provided by the driver
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
- *	       allocated and used.
+ *	       allocated and used. It is recommended to pass NULL unless there
+ *	       is a good reason not to.
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
- * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
+ * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
+ *		used. It is recommended to pass NULL unless there is a good
+ *		reason not to.
  * @score: score atomic shared with other schedulers. May be NULL.
  * @name: name (typically the driver's name). Used for debugging
  * @dev: associated device. Used for debugging
-- 
2.49.0

