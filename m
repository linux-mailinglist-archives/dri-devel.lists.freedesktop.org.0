Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF0AAA014
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3C210E4B3;
	Mon,  5 May 2025 22:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="enyEOaBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701D410E4A6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:31:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4C9B629C6;
 Mon,  5 May 2025 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E77EC4CEEE;
 Mon,  5 May 2025 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484292;
 bh=Qk1eyKnX5OztIuXD3gcVb1g5PJcA+op3VmGa+6UqilU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=enyEOaBGzJZFWxnO/t/H8oKwnYMtc6Q+/RFT5LZHc3H5hjx4xtPfgkwIHf8vxrJdM
 2xpywsbw7lVfPCJIARqZjvqvAae5xXDJ+1sH6e6na8cE7UbsaVvzxu/WK+1dvMEVWW
 Y3t5rP476yI9H5IuJwwVON927JWgcqNNQfu5D0gKMU30oNrRTpIEQpR5sXqKVVquET
 +ZpJlBzBEpWBeyPoYq3HDHSDVNJkhrXH4flwF900YGzeCn4Sw3jDWI0gkPq1rYjma+
 puJRJeq6yfdQPtTq1LNj3+00TH7ekWg+sFBC9YSRrmR8nd3s2y43lEaad2gIiqHtqm
 ObVUp6kjJyJ2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lizhi Hou <lizhi.hou@amd.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Sasha Levin <sashal@kernel.org>, min.ma@amd.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 439/642] accel/amdxdna: Refactor hardware context
 destroy routine
Date: Mon,  5 May 2025 18:10:55 -0400
Message-Id: <20250505221419.2672473-439-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Lizhi Hou <lizhi.hou@amd.com>

[ Upstream commit 4fd6ca90fc7f509977585d39885f21b2911123f3 ]

It is required by firmware to wait up to 2 seconds for pending commands
before sending the destroy hardware context command. After 2 seconds
wait, if there are still pending commands, driver needs to cancel them.

So the context destroy steps need to be:
  1. Stop drm scheduler. (drm_sched_entity_destroy)
  2. Wait up to 2 seconds for pending commands.
  3. Destroy hardware context and cancel the rest pending requests.
  4. Wait all jobs associated with the hwctx are freed.
  5. Free job resources.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250124173536.148676-1-lizhi.hou@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 29 ++++++++++++++++-------------
 drivers/accel/amdxdna/amdxdna_ctx.c |  2 ++
 drivers/accel/amdxdna/amdxdna_ctx.h |  3 +++
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5f43db02b2404..92c768b0c9a03 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -34,6 +34,8 @@ static void aie2_job_release(struct kref *ref)
 
 	job = container_of(ref, struct amdxdna_sched_job, refcnt);
 	amdxdna_sched_job_cleanup(job);
+	atomic64_inc(&job->hwctx->job_free_cnt);
+	wake_up(&job->hwctx->priv->job_free_wq);
 	if (job->out_fence)
 		dma_fence_put(job->out_fence);
 	kfree(job);
@@ -134,7 +136,8 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	if (!fence)
 		return;
 
-	dma_fence_wait(fence, false);
+	/* Wait up to 2 seconds for fw to finish all pending requests */
+	dma_fence_wait_timeout(fence, false, msecs_to_jiffies(2000));
 	dma_fence_put(fence);
 }
 
@@ -616,6 +619,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	hwctx->status = HWCTX_STAT_INIT;
 	ndev = xdna->dev_handle;
 	ndev->hwctx_num++;
+	init_waitqueue_head(&priv->job_free_wq);
 
 	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
 
@@ -652,25 +656,23 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 	xdna = hwctx->client->xdna;
 	ndev = xdna->dev_handle;
 	ndev->hwctx_num--;
-	drm_sched_wqueue_stop(&hwctx->priv->sched);
 
-	/* Now, scheduler will not send command to device. */
+	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
+	drm_sched_entity_destroy(&hwctx->priv->entity);
+
+	aie2_hwctx_wait_for_idle(hwctx);
+
+	/* Request fw to destroy hwctx and cancel the rest pending requests */
 	aie2_release_resource(hwctx);
 
-	/*
-	 * All submitted commands are aborted.
-	 * Restart scheduler queues to cleanup jobs. The amdxdna_sched_job_run()
-	 * will return NODEV if it is called.
-	 */
-	drm_sched_wqueue_start(&hwctx->priv->sched);
+	/* Wait for all submitted jobs to be completed or canceled */
+	wait_event(hwctx->priv->job_free_wq,
+		   atomic64_read(&hwctx->job_submit_cnt) ==
+		   atomic64_read(&hwctx->job_free_cnt));
 
-	aie2_hwctx_wait_for_idle(hwctx);
-	drm_sched_entity_destroy(&hwctx->priv->entity);
 	drm_sched_fini(&hwctx->priv->sched);
 	aie2_ctx_syncobj_destroy(hwctx);
 
-	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
-
 	for (idx = 0; idx < ARRAY_SIZE(hwctx->priv->cmd_buf); idx++)
 		drm_gem_object_put(to_gobj(hwctx->priv->cmd_buf[idx]));
 	amdxdna_gem_unpin(hwctx->priv->heap);
@@ -879,6 +881,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 	drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
 
 	aie2_job_put(job);
+	atomic64_inc(&hwctx->job_submit_cnt);
 
 	return 0;
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index d11b1c83d9c3b..43442b9e273b3 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -220,6 +220,8 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	args->syncobj_handle = hwctx->syncobj_hdl;
 	mutex_unlock(&xdna->dev_lock);
 
+	atomic64_set(&hwctx->job_submit_cnt, 0);
+	atomic64_set(&hwctx->job_free_cnt, 0);
 	XDNA_DBG(xdna, "PID %d create HW context %d, ret %d", client->pid, args->handle, ret);
 	drm_dev_exit(idx);
 	return 0;
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 80b0304193ec3..f0a4a8586d858 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -87,6 +87,9 @@ struct amdxdna_hwctx {
 	struct amdxdna_qos_info		     qos;
 	struct amdxdna_hwctx_param_config_cu *cus;
 	u32				syncobj_hdl;
+
+	atomic64_t			job_submit_cnt;
+	atomic64_t			job_free_cnt ____cacheline_aligned_in_smp;
 };
 
 #define drm_job_to_xdna_job(j) \
-- 
2.39.5

