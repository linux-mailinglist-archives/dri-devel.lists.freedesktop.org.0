Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F088E985AE1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB6810E81B;
	Wed, 25 Sep 2024 12:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GDRyHqYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3D10E819;
 Wed, 25 Sep 2024 12:15:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 406235C49BB;
 Wed, 25 Sep 2024 12:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522CEC4CECD;
 Wed, 25 Sep 2024 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266527;
 bh=XiQIFmprWkUi9N/cUrGzN3PDYbjr1hO7g8ROWTNg/5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GDRyHqYxxqcEDD6lSQcwmsqiUvtwJRI8H0GVKlfEmHtp+1zcF+KV4Wr/Mv2RsepOY
 hv9FI+SAvg/BZfPKnOhKYYj6/Me/oFmiyY5FW2sgbYxe/ECsKEf+eawsV8L+TgIXQS
 eS4QqBGclIWPlrBW2nk0GCXNtui1Dfp4LdpG0UDDIyHrzIAA5YbbESCHefxtGKsqqy
 hNKHnvio3eKfDPiE/xKTtCJUOWs6L8uJEYuyfWlGKL4CV3eiYG6Y6TVzlb7mwmgm67
 jaKJ5y8iu78Q88Yn2ZTJHqVRPNHGH03GGXv1hNm9rVXlbTxRNrRVv/eAN06jOt0d8/
 v0w6MrS1cPiyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 086/139] drm/amdkfd: amdkfd_free_gtt_mem clear the
 correct pointer
Date: Wed, 25 Sep 2024 08:08:26 -0400
Message-ID: <20240925121137.1307574-86-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
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

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit c86ad39140bbcb9dc75a10046c2221f657e8083b ]

Pass pointer reference to amdgpu_bo_unref to clear the correct pointer,
otherwise amdgpu_bo_unref clear the local variable, the original pointer
not set to NULL, this could cause use-after-free bug.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  4 ++--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 25d5fda5b243e..af6c6d89e63af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -335,15 +335,15 @@ int amdgpu_amdkfd_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
 	return r;
 }
 
-void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void *mem_obj)
+void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void **mem_obj)
 {
-	struct amdgpu_bo *bo = (struct amdgpu_bo *) mem_obj;
+	struct amdgpu_bo **bo = (struct amdgpu_bo **) mem_obj;
 
-	amdgpu_bo_reserve(bo, true);
-	amdgpu_bo_kunmap(bo);
-	amdgpu_bo_unpin(bo);
-	amdgpu_bo_unreserve(bo);
-	amdgpu_bo_unref(&(bo));
+	amdgpu_bo_reserve(*bo, true);
+	amdgpu_bo_kunmap(*bo);
+	amdgpu_bo_unpin(*bo);
+	amdgpu_bo_unreserve(*bo);
+	amdgpu_bo_unref(bo);
 }
 
 int amdgpu_amdkfd_alloc_gws(struct amdgpu_device *adev, size_t size,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index db5b1c6beba75..3134e6ad81d1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -221,7 +221,7 @@ int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
 int amdgpu_amdkfd_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
 				void **mem_obj, uint64_t *gpu_addr,
 				void **cpu_ptr, bool mqd_gfx9);
-void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void *mem_obj);
+void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void **mem_obj);
 int amdgpu_amdkfd_alloc_gws(struct amdgpu_device *adev, size_t size,
 				void **mem_obj);
 void amdgpu_amdkfd_free_gws(struct amdgpu_device *adev, void *mem_obj);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9d10530283705..19d46be639429 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -417,7 +417,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 
 err_create_queue:
 	if (wptr_bo)
-		amdgpu_amdkfd_free_gtt_mem(dev->adev, wptr_bo);
+		amdgpu_amdkfd_free_gtt_mem(dev->adev, (void **)&wptr_bo);
 err_wptr_map_gart:
 err_bind_process:
 err_pdd:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 0c94bdfadaabf..9d0b0bf70ad1e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -838,7 +838,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 kfd_doorbell_error:
 	kfd_gtt_sa_fini(kfd);
 kfd_gtt_sa_init_error:
-	amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
+	amdgpu_amdkfd_free_gtt_mem(kfd->adev, &kfd->gtt_mem);
 alloc_gtt_mem_failure:
 	dev_err(kfd_device,
 		"device %x:%x NOT added due to errors\n",
@@ -856,7 +856,7 @@ void kgd2kfd_device_exit(struct kfd_dev *kfd)
 		kfd_doorbell_fini(kfd);
 		ida_destroy(&kfd->doorbell_ida);
 		kfd_gtt_sa_fini(kfd);
-		amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
+		amdgpu_amdkfd_free_gtt_mem(kfd->adev, &kfd->gtt_mem);
 	}
 
 	kfree(kfd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 60d98301ef041..4d9a406925e18 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2610,7 +2610,7 @@ static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
 {
 	WARN(!mqd, "No hiq sdma mqd trunk to free");
 
-	amdgpu_amdkfd_free_gtt_mem(dev->adev, mqd->gtt_mem);
+	amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
 }
 
 void device_queue_manager_uninit(struct device_queue_manager *dqm)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 447829c22295c..4c3f379803117 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -223,7 +223,7 @@ void kfd_free_mqd_cp(struct mqd_manager *mm, void *mqd,
 	      struct kfd_mem_obj *mqd_mem_obj)
 {
 	if (mqd_mem_obj->gtt_mem) {
-		amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, mqd_mem_obj->gtt_mem);
+		amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, &mqd_mem_obj->gtt_mem);
 		kfree(mqd_mem_obj);
 	} else {
 		kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d98e45aec76b4..43f520b379670 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1047,7 +1047,7 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 
 		if (pdd->dev->kfd->shared_resources.enable_mes)
 			amdgpu_amdkfd_free_gtt_mem(pdd->dev->adev,
-						   pdd->proc_ctx_bo);
+						   &pdd->proc_ctx_bo);
 		/*
 		 * before destroying pdd, make sure to report availability
 		 * for auto suspend
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 8aca92624a77e..dbc75ca84375a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -199,9 +199,9 @@ static void pqm_clean_queue_resource(struct process_queue_manager *pqm,
 	}
 
 	if (dev->kfd->shared_resources.enable_mes) {
-		amdgpu_amdkfd_free_gtt_mem(dev->adev, pqn->q->gang_ctx_bo);
+		amdgpu_amdkfd_free_gtt_mem(dev->adev, &pqn->q->gang_ctx_bo);
 		if (pqn->q->wptr_bo)
-			amdgpu_amdkfd_free_gtt_mem(dev->adev, pqn->q->wptr_bo);
+			amdgpu_amdkfd_free_gtt_mem(dev->adev, (void **)&pqn->q->wptr_bo);
 	}
 }
 
-- 
2.43.0

