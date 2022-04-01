Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A574EF077
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5752110EEE9;
	Fri,  1 Apr 2022 14:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6067610EEEF;
 Fri,  1 Apr 2022 14:33:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08AA4B82511;
 Fri,  1 Apr 2022 14:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4A6C36AE2;
 Fri,  1 Apr 2022 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823627;
 bh=h4Y8GhbrW7EbudaAIpKpL6s0aQrBD6+OdBbGGRuK+/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F69YJscgqHxxpIRaGnl8FGqC4KfS2yZ/MDrPpu7p2lPZiII4xOyMoqfo8EI3Z6H9T
 azu7+4zrGLp8PJqJmbw4ocexUZ1Z6EesvoRbiDsHIEdWVd59hRg+OaHo1ZvDdYFaje
 etExlQ91dR4vXmUTkl0bvK35I4/Pd6utoqzBwsK2O6r3IPrIMFAKeajZMrUsaISB4B
 0KihtLOob6KN2brUxd94Lpi9y6oxcqPamsXhGf+435oMFtcu8sYl4RhJYe5EvhYVpw
 oJUnlSLATpn4sI8Z+ywoDHHvzrhnU83YlOxEDlbuqQhpffn1GesQu5fES3a1KLmIcu
 VIQsAGggBwzTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 017/109] drm/amdkfd: svm range restore work
 deadlock when process exit
Date: Fri,  1 Apr 2022 10:31:24 -0400
Message-Id: <20220401143256.1950537-17-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
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
 Ruili Ji <ruili.ji@amd.com>, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 6225bb3a88d22594aacea2485dc28ca12d596721 ]

kfd_process_notifier_release flush svm_range_restore_work
which calls svm_range_list_lock_and_flush_work to flush deferred_list
work, but if deferred_list work mmput release the last user, it will
call exit_mmap -> notifier_release, it is deadlock with below backtrace.

Move flush svm_range_restore_work to kfd_process_wq_release to avoid
deadlock. Then svm_range_restore_work take task->mm ref to avoid mm is
gone while validating and mapping ranges to GPU.

Workqueue: events svm_range_deferred_list_work [amdgpu]
Call Trace:
 wait_for_completion+0x94/0x100
 __flush_work+0x12a/0x1e0
 __cancel_work_timer+0x10e/0x190
 cancel_delayed_work_sync+0x13/0x20
 kfd_process_notifier_release+0x98/0x2a0 [amdgpu]
 __mmu_notifier_release+0x74/0x1f0
 exit_mmap+0x170/0x200
 mmput+0x5d/0x130
 svm_range_deferred_list_work+0x104/0x230 [amdgpu]
 process_one_work+0x220/0x3c0

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reported-by: Ruili Ji <ruili.ji@amd.com>
Tested-by: Ruili Ji <ruili.ji@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 15 +++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index b993011cfa64..990228711108 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1150,7 +1150,6 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
-	cancel_delayed_work_sync(&p->svms.restore_work);
 
 	mutex_lock(&p->mutex);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ea1c5aaf659a..a1b0c6bda803 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1589,13 +1589,14 @@ static void svm_range_restore_work(struct work_struct *work)
 
 	pr_debug("restore svm ranges\n");
 
-	/* kfd_process_notifier_release destroys this worker thread. So during
-	 * the lifetime of this thread, kfd_process and mm will be valid.
-	 */
 	p = container_of(svms, struct kfd_process, svms);
-	mm = p->mm;
-	if (!mm)
+
+	/* Keep mm reference when svm_range_validate_and_map ranges */
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_debug("svms 0x%p process mm gone\n", svms);
 		return;
+	}
 
 	svm_range_list_lock_and_flush_work(svms, mm);
 	mutex_lock(&svms->lock);
@@ -1649,6 +1650,7 @@ static void svm_range_restore_work(struct work_struct *work)
 out_reschedule:
 	mutex_unlock(&svms->lock);
 	mmap_write_unlock(mm);
+	mmput(mm);
 
 	/* If validation failed, reschedule another attempt */
 	if (evicted_ranges) {
@@ -2779,6 +2781,8 @@ void svm_range_list_fini(struct kfd_process *p)
 
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
 
+	cancel_delayed_work_sync(&p->svms.restore_work);
+
 	/* Ensure list work is finished before process is destroyed */
 	flush_work(&p->svms.deferred_list_work);
 
@@ -2789,7 +2793,6 @@ void svm_range_list_fini(struct kfd_process *p)
 	atomic_inc(&p->svms.drain_pagefaults);
 	svm_range_drain_retry_fault(&p->svms);
 
-
 	list_for_each_entry_safe(prange, next, &p->svms.list, list) {
 		svm_range_unlink(prange);
 		svm_range_remove_notifier(prange);
-- 
2.34.1

