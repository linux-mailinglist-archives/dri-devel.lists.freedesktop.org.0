Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340776EC377
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 03:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB510E10C;
	Mon, 24 Apr 2023 01:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647EE10E01F;
 Mon, 24 Apr 2023 01:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Sf6LJiinXD0+Z04+CoBCjhP6xRPg9WnwCH4CvJn44g=; b=JIcVwiky7ofsROMjxVeNT+AQEL
 gSU2A0P4XNRrWSyZwXgZi/+FOiKwNjUmXLgtMSC3hz+vOL4g/EYOnY170TdlZqVgSFfImBxA5+sFo
 iPTnAFTQhlifb5rJHjqGpyfhf49jz7pt0yN/UHMkYNQhAgwyslyIB6BdsBlZIenn4GiL/Fv98NYDA
 gDjFSgCcyQTeR6ls08+hXDWYDf3aGeA9zCejqkMaiEnzaEcH089aZc9Mdl5B++z2groTyLjc1dsvd
 uEwnjUDOTomCjEfvzlCCPNtq5LZI0vv+SN0/hE1Ll2yuZ85HzJY2PD2SVyNZWUA3DjgMnj0HnB+It
 xX5CGfEQ==;
Received: from [152.249.146.45] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqlFV-00AeE7-4w; Mon, 24 Apr 2023 03:44:13 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Date: Sun, 23 Apr 2023 22:43:24 -0300
Message-Id: <20230424014324.218531-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.40.0
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a DRM job timeout, the GPU is probably hang and amdgpu have some
ways to deal with that, ranging from soft recoveries to full device
reset. Anyway, when userspace ask the kernel the state of the context
(via AMDGPU_CTX_OP_QUERY_STATE), the kernel reports that the device was
reset, regardless if a full reset happened or not.

However, amdgpu only marks a context guilty in the ASIC reset path. This
makes the userspace report incomplete, given that on soft recovery path
the guilty context is not told that it's the guilty one.

Fix this by marking the context guilty for every type of reset when a
job timeouts.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 +++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ac78caa7cba8..ea169d1689e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4771,9 +4771,6 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 
 	amdgpu_fence_driver_isr_toggle(adev, false);
 
-	if (job && job->vm)
-		drm_sched_increase_karma(&job->base);
-
 	r = amdgpu_reset_prepare_hwcontext(adev, reset_context);
 	/* If reset handler not implemented, continue; otherwise return */
 	if (r == -ENOSYS)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..097ed8f06865 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -51,6 +51,13 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 	adev->job_hang = true;
 
+	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
+
+	if (job && job->vm) {
+		DRM_INFO("marking %s context as guilty", ti.process_name);
+		drm_sched_increase_karma(&job->base);
+	}
+
 	if (amdgpu_gpu_recovery &&
 	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		DRM_ERROR("ring %s timeout, but soft recovered\n",
@@ -58,7 +65,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		goto exit;
 	}
 
-	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
 	DRM_ERROR("ring %s timeout, signaled seq=%u, emitted seq=%u\n",
 		  job->base.sched->name, atomic_read(&ring->fence_drv.last_seq),
 		  ring->fence_drv.sync_seq);
-- 
2.40.0

