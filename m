Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEBAFB4E1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288F910E493;
	Mon,  7 Jul 2025 13:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r6XocvBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F3C10E491;
 Mon,  7 Jul 2025 13:42:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 046BE5C55B8;
 Mon,  7 Jul 2025 13:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5BDC4CEF4;
 Mon,  7 Jul 2025 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751895776;
 bh=YPEvwsrhEYilovZE/FzKLWSDVL/XkoOF8+zmDx8isVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r6XocvBvqNUB5/9tCW7d8fPhNJFKSQMo4bgJIqkJp2LyWU6RQlPwZf31Jb+UN0OBu
 lNUqkl9Y/oUiJZ930NUmN4vKajMjqHq5sYyK8r/7U6LN9ceo90L8M6JrsxkDQi+J5u
 mgDJOTQFkRfgcWbAzn6XEfR5rliAly+leHYK5BW6E5bvIsus1LQzKwkxN/A1II/K1L
 kejRTDxLnQIiA/b314drqx6M5Kqn+fJH7uCvygv3Kmg8Y/a2hXJg39Ky9H2d3BmOmf
 oyYY2uWyTNFtTRCtAw0oBeB7OC6m4QCDsbUrS81G7712SxsQkxZq7R74S8WGlqy1P5
 hasr6upNTcCng==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 6/7] drm/nouveau: Add new callback for scheduler teardown
Date: Mon,  7 Jul 2025 15:42:19 +0200
Message-ID: <20250707134221.34291-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134221.34291-2-phasta@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
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

There is a new callback for always tearing the scheduler down in a
leak-free, deadlock-free manner.

Port Nouveau as its first user by providing the scheduler with a
callback that ensures the fence context gets killed in drm_sched_fini().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_sched.c | 15 ++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..9f345a008717 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -240,6 +240,21 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	return ret;
 }
 
+void
+nouveau_fence_cancel(struct nouveau_fence *fence)
+{
+	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
+	unsigned long flags;
+
+	spin_lock_irqsave(&fctx->lock, flags);
+	if (!dma_fence_is_signaled_locked(&fence->base)) {
+		dma_fence_set_error(&fence->base, -ECANCELED);
+		if (nouveau_fence_signal(fence))
+			nvif_event_block(&fctx->event);
+	}
+	spin_unlock_irqrestore(&fctx->lock, flags);
+}
+
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 183dd43ecfff..9957a919bd38 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -29,6 +29,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
 
 int  nouveau_fence_emit(struct nouveau_fence *);
 bool nouveau_fence_done(struct nouveau_fence *);
+void nouveau_fence_cancel(struct nouveau_fence *fence);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
 int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 460a5fb02412..2ec62059c351 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -11,6 +11,7 @@
 #include "nouveau_exec.h"
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
+#include "nouveau_chan.h"
 
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
@@ -393,10 +394,23 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
 	nouveau_job_fini(job);
 }
 
+static void
+nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_fence *fence;
+	struct nouveau_job *job;
+
+	job = to_nouveau_job(sched_job);
+	fence = to_nouveau_fence(job->done_fence);
+
+	nouveau_fence_cancel(fence);
+}
+
 static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.run_job = nouveau_sched_run_job,
 	.timedout_job = nouveau_sched_timedout_job,
 	.free_job = nouveau_sched_free_job,
+	.cancel_job = nouveau_sched_cancel_job,
 };
 
 static int
@@ -482,7 +496,6 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	return 0;
 }
 
-
 static void
 nouveau_sched_fini(struct nouveau_sched *sched)
 {
-- 
2.49.0

