Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69230A7E40B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840CA10E4F0;
	Mon,  7 Apr 2025 15:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nMwx1PSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC45710E4F0;
 Mon,  7 Apr 2025 15:23:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2346E5C4ADA;
 Mon,  7 Apr 2025 15:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32ACC4CEE7;
 Mon,  7 Apr 2025 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744039384;
 bh=jWhUXx8C0pjgulz9f55tvHNeys7srTOZ3/RnhWeUk5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nMwx1PScHTbGj0ZjDyxH/hn62oWlf6a3tGriD+aZAyN18zRs0MtjfQBIne+08Q2HV
 3jxLv4bieFXI8GkILc6gRLd8Fd2LWUFLxNZmTv27TNkn2gp9yg5KpDkVSHrlJQtdw3
 YMV9o4xnJQBP2RU228IdC/D8JYmKh93nuCGFngRcKcHSrmpMsvD8teXgy63ZPg6hXK
 N4bjDpiYqDfM37gWmSagJX+uk7DNkgG3szsN/Fla94ud4QuvGHG2gBhZsGElXS26lJ
 9+uIQQWLrhwipAVs+4s8n1VZK4b1gYrVfNGSom+BfbxN/WLqRVP5B4yDEKgh8DbPr4
 gYuZHctbBMnng==
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
Subject: [PATCH 4/5] drm/nouveau: Add new callback for scheduler teardown
Date: Mon,  7 Apr 2025 17:22:39 +0200
Message-ID: <20250407152239.34429-6-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407152239.34429-2-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
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
index d326e55d2d24..3659ac78bb3e 100644
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
+	.kill_fence_context = nouveau_sched_fence_context_kill,
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
2.48.1

