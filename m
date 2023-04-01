Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F66D2CA8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 03:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4BB10F363;
	Sat,  1 Apr 2023 01:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B910E4F6;
 Sat,  1 Apr 2023 01:42:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A93562CEE;
 Sat,  1 Apr 2023 01:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C79C433EF;
 Sat,  1 Apr 2023 01:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680313351;
 bh=ln6XzTMYNR/OxX7UOrfi6W+HYBL2AaaT9QbQO/DSoqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AHG2q2cH0Jt7j7cHGN2wTnEpwsx3fE3TLCB8k+nGlN2cCdXPRn2ctJ5BShiEOrBqE
 lgN9WQBb0ML5l/etvLFOGyuj0/TTc5YKX5uji7BTGQ8Ayjn7O4xdvuYvSKZ1kYu1Sr
 g7nTwYV9YCDC6HVUme4Q2+AkOKluHPY4QCbNW63lakD2pIGICenhQ+NBF4A3l0Upye
 LBVyVq/Plp1yt9gMhdqJHZf2s0NdbrqrRLvK0Y2hbbFpj+8S92QW67EWyGAiAqsReM
 8m8PCN4HcVtC/UT0eA2iD0FHaF4fNmodY0dg1ZZ5wUo6l3t7rZoqofh4Y3bTCAv4l6
 2z6cONawbKDwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 23/25] drm/amdgpu: Force signal hw_fences that are
 embedded in non-sched jobs
Date: Fri, 31 Mar 2023 21:41:21 -0400
Message-Id: <20230401014126.3356410-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401014126.3356410-1-sashal@kernel.org>
References: <20230401014126.3356410-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: YuBiao Wang <YuBiao.Wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Jack.Xiao@amd.com, andrey.grodzovsky@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, gpiccoli@igalia.com,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 Jiadong.Zhu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: YuBiao Wang <YuBiao.Wang@amd.com>

[ Upstream commit 033c56474acf567a450f8bafca50e0b610f2b716 ]

[Why]
For engines not supporting soft reset, i.e. VCN, there will be a failed
ib test before mode 1 reset during asic reset. The fences in this case
are never signaled and next time when we try to free the sa_bo, kernel
will hang.

[How]
During pre_asic_reset, driver will clear job fences and afterwards the
fences' refcount will be reduced to 1. For drm_sched_jobs it will be
released in job_free_cb, and for non-sched jobs like ib_test, it's meant
to be released in sa_bo_free but only when the fences are signaled. So
we have to force signal the non_sched bad job's fence during
pre_asic_reset or the clear is not complete.

Signed-off-by: YuBiao Wang <YuBiao.Wang@amd.com>
Acked-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index faff4a3f96e6e..f52d0ba91a770 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -678,6 +678,15 @@ void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
 		ptr = &ring->fence_drv.fences[i];
 		old = rcu_dereference_protected(*ptr, 1);
 		if (old && old->ops == &amdgpu_job_fence_ops) {
+			struct amdgpu_job *job;
+
+			/* For non-scheduler bad job, i.e. failed ib test, we need to signal
+			 * it right here or we won't be able to track them in fence_drv
+			 * and they will remain unsignaled during sa_bo free.
+			 */
+			job = container_of(old, struct amdgpu_job, hw_fence);
+			if (!job->base.s_fence && !dma_fence_is_signaled(old))
+				dma_fence_signal(old);
 			RCU_INIT_POINTER(*ptr, NULL);
 			dma_fence_put(old);
 		}
-- 
2.39.2

