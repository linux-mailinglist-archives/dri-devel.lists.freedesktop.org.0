Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460FCAD94A3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E7910EA3F;
	Fri, 13 Jun 2025 18:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S939APoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9110E99D;
 Fri, 13 Jun 2025 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fpk+ehOaQJ0s95miGn1Ez8px3wlt6Oawad6Q66DHOjU=; b=S939APoIsq6qoj2YPu1pqM+TfA
 xvORIeAUjZevu8HWvOhiNN+gfHlO68WxcMwYMG9zVv0WQ3JprFlbQFVdmzRkl3gObOaVu7lXVaKWm
 FJHmFunkBWRZ3gYx1t7jyBcscpW/elsnmbf1YGzQ9P1Vtcsbd0QYGg/SbTpkBHboklfCZusprABmi
 uJPtVVsvfDTe9z7hDEb1gSN/2skHgkuBiorxZ622CI5BrajiaK3yyvGoOV5BHj6MMJtNB+9oovXRy
 T1M0tnJ5Pd2PtYokTXBT6wYeFT6feledj2PcH3jivhqbDBzS9op1RdmVwwZf+8yG1fYISsVEUH21s
 /SOk+X6w==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ9Nf-003AD0-P4; Fri, 13 Jun 2025 20:44:00 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 "Raag Jadav" <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 1/5] drm: amdgpu: Create amdgpu_vm_print_task_info()
Date: Fri, 13 Jun 2025 15:43:44 -0300
Message-ID: <20250613184348.1761020-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613184348.1761020-1-andrealmeid@igalia.com>
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

To avoid repetitive code in amdgpu, create a function that prints the
content of struct amdgpu_task_info.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v7: new patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 3 +++
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   | 4 +---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 5 +----
 8 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 75262ce8db27..3d887428ca2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -124,9 +124,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
 	if (ti) {
-		dev_err(adev->dev,
-			"Process information: process %s pid %d thread %s pid %d\n",
-			ti->process_name, ti->tgid, ti->task_name, ti->pid);
+		amdgpu_vm_print_task_info(adev, ti);
 		amdgpu_vm_put_task_info(ti);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..f2a0132521c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3156,3 +3156,12 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
 {
 	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
 }
+
+inline void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
+				      struct amdgpu_task_info *task_info)
+{
+	dev_err(adev->dev,
+		" Process %s pid %d thread %s pid %d\n",
+		task_info->process_name, task_info->tgid,
+		task_info->task_name, task_info->pid);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f3ad687125ad..3862a256b9b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -668,4 +668,7 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
 				 struct amdgpu_vm *vm,
 				 struct dma_fence **fence);
 
+inline void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
+			       struct amdgpu_task_info *task_info);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index a3e2787501f1..7923f491cf73 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -164,10 +164,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 		entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
 	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 	if (task_info) {
-		dev_err(adev->dev,
-			" in process %s pid %d thread %s pid %d\n",
-			task_info->process_name, task_info->tgid,
-			task_info->task_name, task_info->pid);
+		amdgpu_vm_print_task_info(adev, task_info);
 		amdgpu_vm_put_task_info(task_info);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 72211409227b..f15d691e9a20 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -134,10 +134,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
 			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
-			dev_err(adev->dev,
-				" in process %s pid %d thread %s pid %d)\n",
-				task_info->process_name, task_info->tgid,
-				task_info->task_name, task_info->pid);
+			amdgpu_vm_print_task_info(adev, task_info);
 			amdgpu_vm_put_task_info(task_info);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index b645d3e6a6c8..de763105fdfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -127,10 +127,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
 			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
-			dev_err(adev->dev,
-				" in process %s pid %d thread %s pid %d)\n",
-				task_info->process_name, task_info->tgid,
-				task_info->task_name, task_info->pid);
+			amdgpu_vm_print_task_info(adev, task_info);
 			amdgpu_vm_put_task_info(task_info);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 99ca08e9bdb5..b45fa0cea9d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1458,9 +1458,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
 
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
-			dev_err(adev->dev, " for process %s pid %d thread %s pid %d\n",
-				task_info->process_name, task_info->tgid,
-				task_info->task_name, task_info->pid);
+			amdgpu_vm_print_task_info(adev, task_info);
 			amdgpu_vm_put_task_info(task_info);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 282197f4ffb1..78f65aea03f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -641,10 +641,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 
 	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 	if (task_info) {
-		dev_err(adev->dev,
-			" for process %s pid %d thread %s pid %d)\n",
-			task_info->process_name, task_info->tgid,
-			task_info->task_name, task_info->pid);
+		amdgpu_vm_print_task_info(adev, task_info);
 		amdgpu_vm_put_task_info(task_info);
 	}
 
-- 
2.49.0

