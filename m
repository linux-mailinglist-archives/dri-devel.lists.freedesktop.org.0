Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F7AC0714
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 10:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0F710EE02;
	Thu, 22 May 2025 08:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LlchIuSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062C210ED8F;
 Thu, 22 May 2025 08:28:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3B26DA4E4DE;
 Thu, 22 May 2025 08:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58D2C4CEE4;
 Thu, 22 May 2025 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747902492;
 bh=rnC+iWAxQZV8/eK2peQIVBFSEZ98f6paoI2fDz9f89c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LlchIuSb/NZKPyb7dDLFNILVoWbpFPmX3gFZntv51aTAO9HiODmiZA8tQeS4S2bNm
 My6P4S++7Q+/cM/is10fs8/Z8qp0ES9k1mq0DwdhccoUUxis7a72EZU4VUhV9JV8t7
 irpbVNH0ZyJCuRJJQkIvB785B8tua/2Xhk2JqgYZeOxBA15er8+2DsODxo2Dwt6c2V
 E0+090oBJIvL79SvMei5u7lHKKU2l5e+k6+Hi2xUBr2f/F6VVvuDPRwwTHt4YTOoLr
 igpPXG6k+nrwsF5zKuSw4bVsslJlrYplENEXBJ90hmcNoYhPI5G7VFKtXYQ0+yn8xe
 NBl9FnnqqyQIQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] drm/nouveau: Add new callback for scheduler teardown
Date: Thu, 22 May 2025 10:27:42 +0200
Message-ID: <20250522082742.148191-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522082742.148191-2-phasta@kernel.org>
References: <20250522082742.148191-2-phasta@kernel.org>
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
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 19 +++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_sched.h |  3 +++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 2a0617e5fe2a..53b8a85a8adb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -415,8 +415,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 * The client lock is already acquired by nouveau_abi16_get().
 	 */
 	if (nouveau_cli_uvmm(cli)) {
-		ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
-					   chan->chan->dma.ib_max);
+		ret = nouveau_sched_create(&chan->sched, drm, chan->chan,
+					   drm->sched_wq, chan->chan->dma.ib_max);
 		if (ret)
 			goto done;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c69139701056..2a2b319dca5f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -313,7 +313,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	 * locks which indirectly or directly are held for allocations
 	 * elsewhere.
 	 */
-	ret = nouveau_sched_create(&cli->sched, drm, NULL, 1);
+	ret = nouveau_sched_create(&cli->sched, drm, NULL, NULL, 1);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index d326e55d2d24..de14883ee4c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -11,6 +11,7 @@
 #include "nouveau_exec.h"
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
+#include "nouveau_chan.h"
 
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
@@ -392,10 +393,22 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
 	nouveau_job_fini(job);
 }
 
+static void
+nouveau_sched_fence_context_kill(struct drm_gpu_scheduler *sched)
+{
+	struct nouveau_sched *nsched;
+
+	nsched = container_of(sched, struct nouveau_sched, base);
+
+	if (nsched->chan)
+		nouveau_channel_kill(nsched->chan);
+}
+
 static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.run_job = nouveau_sched_run_job,
 	.timedout_job = nouveau_sched_timedout_job,
 	.free_job = nouveau_sched_free_job,
+	.cancel_pending_fences = nouveau_sched_fence_context_kill,
 };
 
 static int
@@ -461,7 +474,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 int
 nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
-		     struct workqueue_struct *wq, u32 credit_limit)
+		     struct nouveau_channel *chan, struct workqueue_struct *wq,
+		     u32 credit_limit)
 {
 	struct nouveau_sched *sched;
 	int ret;
@@ -470,6 +484,8 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	if (!sched)
 		return -ENOMEM;
 
+	sched->chan = chan;
+
 	ret = nouveau_sched_init(sched, drm, wq, credit_limit);
 	if (ret) {
 		kfree(sched);
@@ -481,7 +497,6 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	return 0;
 }
 
-
 static void
 nouveau_sched_fini(struct nouveau_sched *sched)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 20cd1da8db73..e6e2016a3569 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -9,6 +9,7 @@
 #include <drm/gpu_scheduler.h>
 
 #include "nouveau_drv.h"
+#include "nouveau_chan.h"
 
 #define to_nouveau_job(sched_job)		\
 		container_of((sched_job), struct nouveau_job, base)
@@ -101,6 +102,7 @@ struct nouveau_sched {
 	struct drm_sched_entity entity;
 	struct workqueue_struct *wq;
 	struct mutex mutex;
+	struct nouveau_channel *chan;
 
 	struct {
 		struct {
@@ -112,6 +114,7 @@ struct nouveau_sched {
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
+			 struct nouveau_channel *chan,
 			 struct workqueue_struct *wq, u32 credit_limit);
 void nouveau_sched_destroy(struct nouveau_sched **psched);
 
-- 
2.49.0

