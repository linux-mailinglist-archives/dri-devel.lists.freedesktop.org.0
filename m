Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6E590158
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4796A469B;
	Thu, 11 Aug 2022 15:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F8B941F3;
 Thu, 11 Aug 2022 15:55:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DAAB0B82123;
 Thu, 11 Aug 2022 15:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A73EC433D7;
 Thu, 11 Aug 2022 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233305;
 bh=hA0CbCQBPVva8D3GlDoaAaRKzzOR71O29paA4GmohtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QchCgp15XaEDceRQtHcgX+P77gi0VchT54iESdO7+E7Pger8QN04rDDmC04DU2RYI
 Pp1dxoeE5GRuf6cmKyVDG8Y5HiltfBjuxGCERHZ11enhAX9Yj04m6U/JUnpIkSJAQG
 0DJQCtY0iEDPUekW8no5GSJRKo3TfOEAR1jtNQVldq+ZyXou8jMm1gyN4YViQHA71p
 Q0mzt3yPHGnjYUJjkErXZ8WaYFooNG1nAYEXwlmCF6CZJHGnliN2dyMUEuTRbuayHr
 BersatxIcMXMmMXT1zI3VopUbxIqlpJEipONZ7oGIUrguWbZdqRCat7VJ0ZUG9ljz1
 BldQM+5LDxQmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 83/93] drm/amdkfd: Process notifier release
 callback don't take mutex
Date: Thu, 11 Aug 2022 11:42:17 -0400
Message-Id: <20220811154237.1531313-83-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 74097f9fd2f5ebdae04fcba59da345386415cbf3 ]

Move process queues cleanup to deferred work kfd_process_wq_release, to
avoid potential deadlock circular locking warning:

 WARNING: possible circular locking dependency detected
               the existing dependency chain (in reverse order) is:
      -> #2
        ((work_completion)(&svms->deferred_list_work)){+.+.}-{0:0}:
        __flush_work+0x343/0x4a0
        svm_range_list_lock_and_flush_work+0x39/0xc0
        svm_range_set_attr+0xe8/0x1080 [amdgpu]
        kfd_ioctl+0x19b/0x600 [amdgpu]
        __x64_sys_ioctl+0x81/0xb0
        do_syscall_64+0x34/0x80
        entry_SYSCALL_64_after_hwframe+0x44/0xae

      -> #1 (&info->lock#2){+.+.}-{3:3}:
        __mutex_lock+0xa4/0x940
        amdgpu_amdkfd_gpuvm_acquire_process_vm+0x2e3/0x590
        kfd_process_device_init_vm+0x61/0x200 [amdgpu]
        kfd_ioctl_acquire_vm+0x83/0xb0 [amdgpu]
        kfd_ioctl+0x19b/0x600 [amdgpu]
        __x64_sys_ioctl+0x81/0xb0
        do_syscall_64+0x34/0x80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

      -> #0 (&process->mutex){+.+.}-{3:3}:
        __lock_acquire+0x1365/0x23d0
        lock_acquire+0xc9/0x2e0
        __mutex_lock+0xa4/0x940
        kfd_process_notifier_release+0x96/0xe0 [amdgpu]
        __mmu_notifier_release+0x94/0x210
        exit_mmap+0x35/0x1f0
        mmput+0x63/0x120
        svm_range_deferred_list_work+0x177/0x2c0 [amdgpu]
        process_one_work+0x2a4/0x600
        worker_thread+0x39/0x3e0
        kthread+0x16d/0x1a0

  Possible unsafe locking scenario:

      CPU0                    CPU1
        ----                    ----
   lock((work_completion)(&svms->deferred_list_work));
                                lock(&info->lock#2);
             lock((work_completion)(&svms->deferred_list_work));
   lock(&process->mutex);

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 19d4089a0b1c..3f2383db1b73 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1111,6 +1111,15 @@ static void kfd_process_wq_release(struct work_struct *work)
 	struct kfd_process *p = container_of(work, struct kfd_process,
 					     release_work);
 
+	kfd_process_dequeue_from_all_devices(p);
+	pqm_uninit(&p->pqm);
+
+	/* Signal the eviction fence after user mode queues are
+	 * destroyed. This allows any BOs to be freed without
+	 * triggering pointless evictions or waiting for fences.
+	 */
+	dma_fence_signal(p->ef);
+
 	kfd_process_remove_sysfs(p);
 	kfd_iommu_unbind_process(p);
 
@@ -1175,20 +1184,8 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
 
-	mutex_lock(&p->mutex);
-
-	kfd_process_dequeue_from_all_devices(p);
-	pqm_uninit(&p->pqm);
-
 	/* Indicate to other users that MM is no longer valid */
 	p->mm = NULL;
-	/* Signal the eviction fence after user mode queues are
-	 * destroyed. This allows any BOs to be freed without
-	 * triggering pointless evictions or waiting for fences.
-	 */
-	dma_fence_signal(p->ef);
-
-	mutex_unlock(&p->mutex);
 
 	mmu_notifier_put(&p->mmu_notifier);
 }
-- 
2.35.1

