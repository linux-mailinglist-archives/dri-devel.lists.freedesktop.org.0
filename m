Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B0BE850B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 13:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499C010EBB8;
	Fri, 17 Oct 2025 11:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JAKGPXcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0A210EBB8;
 Fri, 17 Oct 2025 11:26:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF78D446E1;
 Fri, 17 Oct 2025 11:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C915CC4CEE7;
 Fri, 17 Oct 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760700382;
 bh=pPzUuwGvogXsvvUv9K+pic8Th4sHIWdVh+uLPnCifM8=;
 h=From:To:Cc:Subject:Date:From;
 b=JAKGPXcpTbpaITsnF/iMnIYPT2LZAdmUxVKIXGQd1fL00dJ5T8wqO3rem4CutDXMT
 dzZK3xWiBflJxgLAqsUtE3nWKIHQ5q2KILVbaGwDURTZi/MCBTBTSkM5FWZPOXI2GV
 9cPSkc7Yp7XZJYbhSSyZNvc/TRmoFs51k001AYgJS9b2yoT7FG32tstUxsm4MV9eWw
 dsXzdEBZJ7T4YR688CmgstmYgO79Lo63SbHTmgUlnLwA6+kFr0Bkpkc1yecVR2fNuN
 tIhw/QEvp50XhnBNLzMbTgs0Ir4ebXR1HHbws7LcVIq+9KHMA9YDM84JWUl1421WZ9
 2T2mz56TkGY+A==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2] drm/sched: Add warning for removing hack in
 drm_sched_fini()
Date: Fri, 17 Oct 2025 13:25:44 +0200
Message-ID: <20251017112543.177674-2-phasta@kernel.org>
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

The assembled developers agreed at the X.Org Developers Conference 2025
that the hack added for amdgpu in drm_sched_fini() shall be removed. It
shouldn't be needed by amdgpu anymore.

As it's unclear whether all drivers really follow the life time rule of
entities having to be torn down before their scheduler, it is reasonable
to warn for a while before removing the hack.

Add a warning in drm_sched_fini() that fires if an entity is still
active.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Fix broken brackets.
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..87ea373f266e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1419,7 +1419,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
+		list_for_each_entry(s_entity, &rq->entities, list) {
 			/*
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will be removed from the rq in drm_sched_entity_fini()
@@ -1441,7 +1441,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * drivers that keep entities alive for longer than
 			 * the scheduler.
 			 */
+			if (!s_entity->stopped)
+				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.49.0

