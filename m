Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F9C01275
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4BE10E052;
	Thu, 23 Oct 2025 12:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g8lVkppu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E66C10E052
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:34:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 295F840B85;
 Thu, 23 Oct 2025 12:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837DAC4CEE7;
 Thu, 23 Oct 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761222889;
 bh=GYBKmdSVd/3rI9vvraR/CDqhZgDVhutt8fTSw28SkRE=;
 h=From:To:Cc:Subject:Date:From;
 b=g8lVkppuiMXK/tlaFNL2WJIqYCJ88NvIOipFAShc8aJqmufpfPmKlmBvKvHpvhyvd
 O2GoTZyjOrqTzR0ksCIOKeJjmOOOCbY7mFJbwxUgxghhLSuUYv46cVtmFljnf3CKBB
 sVSI3EiclVlLiuzXKql1nMq2dsn5q+aECESPlSnz6boO5rN47Kxmm7fKc/HETKC3yL
 F4c1VvD1aIzk1Udf6DyU2wMghWjGpFF0nKgDJOlWYiMAw0nnxV+sQ4/gvdrWHUaiv8
 opkm/AkBnfaCHoPV1BrH6b4tvLDUl24dbqflQuVBfc0lxPCWAk05rB54IwCEYhNJAQ
 7dDnqBU37VLaQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3] drm/sched: Add warning for removing hack in
 drm_sched_fini()
Date: Thu, 23 Oct 2025 14:34:30 +0200
Message-ID: <20251023123429.139848-2-phasta@kernel.org>
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
Changes in v3:
  - Add a READ_ONCE() + comment to make the warning slightly less
    horrible.

Changes in v2:
  - Fix broken brackets.
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..31039b08c7b9 100644
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
@@ -1440,8 +1440,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * For now, this remains a potential race in all
 			 * drivers that keep entities alive for longer than
 			 * the scheduler.
+			 *
+			 * The READ_ONCE() is there to make the lockless read
+			 * (warning about the lockless write below) slightly
+			 * less broken...
 			 */
+			if (!READ_ONCE(s_entity->stopped))
+				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.49.0

