Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA5227072
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 23:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE1589C1F;
	Mon, 20 Jul 2020 21:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3436E053;
 Mon, 20 Jul 2020 21:37:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DBED207FC;
 Mon, 20 Jul 2020 21:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595281069;
 bh=/r7CpAbdOGh79gtbW0/Th7l8+bvwG0+jXqRwWEGze1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OS13EzL1ms2o5J1vpI9lX2Ostm55AznYoNryBaT+VX2uMoGUjt2rvQEfZbxH3r8cy
 xyJJMYNLcRbgOB/0XmlHza+2yT2xjyiUS+77W8yIrd2aGo1f9+N09o8+eLn2o48NEN
 A+0H41RJ9sSmuGbY8uCjzr1i5nEnUU7qGJCPa/qM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 27/40] drm/amdgpu: fix preemption unit test
Date: Mon, 20 Jul 2020 17:37:02 -0400
Message-Id: <20200720213715.406997-27-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213715.406997-1-sashal@kernel.org>
References: <20200720213715.406997-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jack Xiao <Jack.Xiao@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

[ Upstream commit d845a2051b6b673fab4229b920ea04c7c4352b51 ]

Remove signaled jobs from job list and ensure the
job was indeed preempted.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index c0f9a651dc067..92b18c4760e55 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1156,27 +1156,37 @@ static void amdgpu_ib_preempt_job_recovery(struct drm_gpu_scheduler *sched)
 static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 {
 	struct amdgpu_job *job;
-	struct drm_sched_job *s_job;
+	struct drm_sched_job *s_job, *tmp;
 	uint32_t preempt_seq;
 	struct dma_fence *fence, **ptr;
 	struct amdgpu_fence_driver *drv = &ring->fence_drv;
 	struct drm_gpu_scheduler *sched = &ring->sched;
+	bool preempted = true;
 
 	if (ring->funcs->type != AMDGPU_RING_TYPE_GFX)
 		return;
 
 	preempt_seq = le32_to_cpu(*(drv->cpu_addr + 2));
-	if (preempt_seq <= atomic_read(&drv->last_seq))
-		return;
+	if (preempt_seq <= atomic_read(&drv->last_seq)) {
+		preempted = false;
+		goto no_preempt;
+	}
 
 	preempt_seq &= drv->num_fences_mask;
 	ptr = &drv->fences[preempt_seq];
 	fence = rcu_dereference_protected(*ptr, 1);
 
+no_preempt:
 	spin_lock(&sched->job_list_lock);
-	list_for_each_entry(s_job, &sched->ring_mirror_list, node) {
+	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, node) {
+		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
+			/* remove job from ring_mirror_list */
+			list_del_init(&s_job->node);
+			sched->ops->free_job(s_job);
+			continue;
+		}
 		job = to_amdgpu_job(s_job);
-		if (job->fence == fence)
+		if (preempted && job->fence == fence)
 			/* mark the job as preempted */
 			job->preemption_status |= AMDGPU_IB_PREEMPTED;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
