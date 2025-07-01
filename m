Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3216AEFA44
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 15:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CFC10E5AF;
	Tue,  1 Jul 2025 13:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eJWzypBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573A10E5AD;
 Tue,  1 Jul 2025 13:22:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7615E6143F;
 Tue,  1 Jul 2025 13:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C21C4CEEB;
 Tue,  1 Jul 2025 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751376164;
 bh=YPEvwsrhEYilovZE/FzKLWSDVL/XkoOF8+zmDx8isVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eJWzypBbI9YtnzazLXUr4k+L5FjPNNBvtjlZBTnC3q4zfJuLUhsK2AdaT28MFA7Oq
 +W0ZCKoackXsY2UqpkVVQp+OoferUgFLtK0FsjuPno3gSVhQlMZKQg6AKkNtTLysqg
 D67DCdkCRGIUQb4LjYZWQ0FtTXTCX4HehKAB+AlhD7jUdJr2nXXQvjNVaSpm2xMyql
 WiINbodPorB0fIEvQqF4ysV6XCKckJsdMmdBebF5WJLH3v5f4Ndmx0Ns1V4Gy5aOHS
 rVREw5a4Uefw49RsBhOdZdUKx0XvY29OFO2+5MVIZp/bT76+lcWQraYxP/TIdagE9L
 UYx/PiOjyy9Pw==
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
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/6] drm/nouveau: Add new callback for scheduler teardown
Date: Tue,  1 Jul 2025 15:21:43 +0200
Message-ID: <20250701132142.76899-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701132142.76899-3-phasta@kernel.org>
References: <20250701132142.76899-3-phasta@kernel.org>
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

