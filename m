Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD16B0B85B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 23:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7610E100;
	Sun, 20 Jul 2025 21:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UE3zeXDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5292310E054;
 Sun, 20 Jul 2025 21:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQJYSnwRkchY3zI6tgHZy5FwvAi9hVv3Wew3x0xU9LE=; b=UE3zeXDwfUbpuBZACGcl6rb2kQ
 tCboNXf/Yo+YEov623V3qJA/Xd1NdvmEEpmj3j7U+dkL31RnJL2K2xVGUlR5Dc8OPKygwr4gGiZt9
 EMi7hTsnNM2nOdJsuN1UafcrmpDz0sK0hmERfPQybPZvKmEcA726/Z0q2KH6URlxKkssDXUBEEPpR
 /EL+lpSVgreV85oNUhiEqdRzuu6lsDO3h88ysVRusT/Iycy+SPjMe/DIPJK5SPAvFwnUtSXU2q0Gn
 4MswkI+5cH16eR/Y3G6L09Zm7X55D/MYQWdQObw3WT20ZU1+Qs5vr7AxJra/mrD6xhCNxnXLw6Kek
 YcG9il/g==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1udbqI-001SKK-Bt; Sun, 20 Jul 2025 23:45:10 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2] drm/msm: Update global fault counter when faulty process
 has already ended
Date: Sun, 20 Jul 2025 18:42:31 -0300
Message-ID: <20250720214458.22193-1-mcanal@igalia.com>
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
("drm/msm/gpu: Skip retired submits in recover worker"). However, it's
still needed, as we need to handle cases where a GPU fault occurs after
the faulting process has already ended.

Hence, increment the global fault counter when the submitting process
had already ended. This way, the number of faults returned by
MSM_PARAM_FAULTS will stay consistent.

While here, s/unusuable/unusable.

Fixes: 12578c075f89 ("drm/msm/gpu: Skip retired submits in recover worker")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20250714230813.46279-1-mcanal@igalia.com/T/

* Don't delete the global fault, but instead, increment it when the we get
	a fault after the faulting process has ended (Rob Clark)
* Rewrite the commit message based on the changes.

 drivers/gpu/drm/msm/msm_gpu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162..416d47185ef0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -465,6 +465,7 @@ static void recover_worker(struct kthread_work *work)
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	struct task_struct *task;
 	int i;
 
 	mutex_lock(&gpu->lock);
@@ -482,16 +483,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm) {
+
+	task = get_pid_task(submit->pid, PIDTYPE_PID);
+	if (!task)
+		gpu->global_faults++;
+	else {
 		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
 
 		vm->faults++;
 
 		/*
 		 * If userspace has opted-in to VM_BIND (and therefore userspace
-		 * management of the VM), faults mark the VM as unusuable.  This
+		 * management of the VM), faults mark the VM as unusable. This
 		 * matches vulkan expectations (vulkan is the main target for
-		 * VM_BIND)
+		 * VM_BIND).
 		 */
 		if (!vm->managed)
 			msm_gem_vm_unusable(submit->vm);
-- 
2.50.0

