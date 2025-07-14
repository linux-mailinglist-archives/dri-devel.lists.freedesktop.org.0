Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED4B04B95
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 01:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EE310E0E4;
	Mon, 14 Jul 2025 23:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U9RZnG1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA210E0C2;
 Mon, 14 Jul 2025 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sp2yQbswrREJtfqafGU+yIg1DE/0Flki6JHDnfcBK7E=; b=U9RZnG1Vn0UE6WIKopznNZozSR
 XFb5bduOpwbKp59SbWxf9XZFeXQntmZBkSFvWauHNyMn2NlToUsN0URTudIFU9ZB1P/xnR7kRXS9O
 ZeHJYkKOEOocE7wqpENyw6tLVezsxmPWm7ALAbPDwPAFbk7e//0PRN2Wddc7hVGLJ2b4BMVjHvl3e
 gmKE1Bydby06HjbhxNt2ZH6cwY7OCZi2Nj2Xe2JQWJhHWcWvXYtb3IrTU47zDuPs7C1vGUXEGt7Th
 as9gJFVWFIsLnZL8WvUVXX8YbH0Ho0wgVvecAr413xx2ho9W1uFbcjxLGuohmMfR0JgSEwG4FDYxO
 oNyE7oPA==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1ubSHq-00Gbq3-A9; Tue, 15 Jul 2025 01:08:42 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/msm: Remove unused global fault counter
Date: Mon, 14 Jul 2025 20:08:07 -0300
Message-ID: <20250714230813.46279-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.50.0
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

The global fault counter is no longer used since commit 12578c075f89
("drm/msm/gpu: Skip retired submits in recover worker"). Additionally,
with commit eab7766c79fd ("drm/msm: Remove vram carveout support"), all
supported devices now have a defined virtual memory address space, which
eliminates the need for a global fault counter.

Hence, remove the global faults counter. While here, s/unusuable/unusable.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +----
 drivers/gpu/drm/msm/msm_gpu.c           | 23 +++++++++++------------
 drivers/gpu/drm/msm/msm_gpu.h           |  6 ------
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f1230465bf0d..5bb00b9c998a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -416,10 +416,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		if (vm)
-			*value = gpu->global_faults + to_msm_vm(vm)->faults;
-		else
-			*value = gpu->global_faults;
+		*value = vm ? to_msm_vm(vm)->faults : 0;
 		return 0;
 	case MSM_PARAM_SUSPENDS:
 		*value = gpu->suspend_count;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162..3d5a76d2901c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -463,6 +463,7 @@ static void recover_worker(struct kthread_work *work)
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_submit *submit;
+	struct msm_gem_vm *vm;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
 	int i;
@@ -482,20 +483,18 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm) {
-		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
 
-		vm->faults++;
+	vm = to_msm_vm(submit->vm);
+	vm->faults++;
 
-		/*
-		 * If userspace has opted-in to VM_BIND (and therefore userspace
-		 * management of the VM), faults mark the VM as unusuable.  This
-		 * matches vulkan expectations (vulkan is the main target for
-		 * VM_BIND)
-		 */
-		if (!vm->managed)
-			msm_gem_vm_unusable(submit->vm);
-	}
+	/*
+	 * If userspace has opted-in to VM_BIND (and therefore userspace
+	 * management of the VM), faults mark the VM as unusable. This
+	 * matches vulkan expectations (vulkan is the main target for
+	 * VM_BIND)
+	 */
+	if (!vm->managed)
+		msm_gem_vm_unusable(submit->vm);
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b2a96544f92a..88d8ddef616b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -226,12 +226,6 @@ struct msm_gpu {
 	/* does gpu need hw_init? */
 	bool needs_hw_init;
 
-	/**
-	 * global_faults: number of GPU hangs not attributed to a particular
-	 * address space
-	 */
-	int global_faults;
-
 	void __iomem *mmio;
 	int irq;
 
-- 
2.50.0

