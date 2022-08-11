Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580BE58FFB3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6DBB4406;
	Thu, 11 Aug 2022 15:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A7EB4405;
 Thu, 11 Aug 2022 15:33:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD5BEB82157;
 Thu, 11 Aug 2022 15:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC002C433D6;
 Thu, 11 Aug 2022 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231996;
 bh=KfQaVgWres62C/86ChqTdJmTDD2+hCoGEybwHudOPAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tO7kdzDLI0d7eO6JX2e/Mam1XVrjida4tVtZa4htXSTiVHRsFzVgQv2W5GPUBzUXm
 yNuMHJCNaK57ybv7ZFoRXMFz5h4qO0ruFRC1VgUTIFHzqEq59E8k4Iclz8lJ7CYHQB
 CqDRld619MuDKDtqFzrnmfVnejEUwoJLeJyahaBbbeBB9ifxjnpypU0r+CZwhOxswO
 mHONbVDK+21byFthODXzVj2ICFE35rb08Jb8R8+ViCioqj0UQhUnYb0HBi3nqR7XW5
 tBLv6rIOl9ULGVcc65/ntAVsd4NjfocBEsPOmaCwIDBQt/0uqtx9Nk6y5BBt9E/qI6
 r6Gug+64aAMNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 044/105] drm/amdkfd: Free queue after unmap queue
 success
Date: Thu, 11 Aug 2022 11:27:28 -0400
Message-Id: <20220811152851.1520029-44-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
 airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Graham Sider <Graham.Sider@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit ab8529b0cdb271d9b222cbbddb2641f3fca5df8f ]

After queue unmap or remove from MES successfully, free queue sysfs
entries, doorbell and remove from queue list. Otherwise, application may
destroy queue again, cause below kernel warning or crash backtrace.

For outstanding queues, either application forget to destroy or failed
to destroy, kfd_process_notifier_release will remove queue sysfs
entries, kfd_process_wq_release will free queue doorbell.

v2: decrement_queue_count for MES queue

 refcount_t: underflow; use-after-free.
 WARNING: CPU: 7 PID: 3053 at lib/refcount.c:28
  Call Trace:
   kobject_put+0xd6/0x1a0
   kfd_procfs_del_queue+0x27/0x30 [amdgpu]
   pqm_destroy_queue+0xeb/0x240 [amdgpu]
   kfd_ioctl_destroy_queue+0x32/0x70 [amdgpu]
   kfd_ioctl+0x27d/0x500 [amdgpu]
   do_syscall_64+0x35/0x80

 WARNING: CPU: 2 PID: 3053 at drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:400
  Call Trace:
   deallocate_doorbell.isra.0+0x39/0x40 [amdgpu]
   destroy_queue_cpsch+0xb3/0x270 [amdgpu]
   pqm_destroy_queue+0x108/0x240 [amdgpu]
   kfd_ioctl_destroy_queue+0x32/0x70 [amdgpu]
   kfd_ioctl+0x27d/0x500 [amdgpu]

 general protection fault, probably for non-canonical address
0xdead000000000108:
 Call Trace:
  pqm_destroy_queue+0xf0/0x200 [amdgpu]
  kfd_ioctl_destroy_queue+0x2f/0x60 [amdgpu]
  kfd_ioctl+0x19b/0x600 [amdgpu]

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Graham Sider <Graham.Sider@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 28 +++++++++++--------
 .../amd/amdkfd/kfd_process_queue_manager.c    |  2 +-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index e1797657b04c..e017b4240472 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1873,6 +1873,22 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 
 	}
 
+	if (q->properties.is_active) {
+		if (!dqm->dev->shared_resources.enable_mes) {
+			retval = execute_queues_cpsch(dqm,
+						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+			if (retval == -ETIME)
+				qpd->reset_wavefronts = true;
+		} else {
+			retval = remove_queue_mes(dqm, q, qpd);
+		}
+
+		if (retval)
+			goto failed_unmap_queue;
+
+		decrement_queue_count(dqm, qpd, q);
+	}
+
 	mqd_mgr = dqm->mqd_mgrs[get_mqd_type_from_queue_type(
 			q->properties.type)];
 
@@ -1886,17 +1902,6 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 
 	list_del(&q->list);
 	qpd->queue_count--;
-	if (q->properties.is_active) {
-		if (!dqm->dev->shared_resources.enable_mes) {
-			decrement_queue_count(dqm, qpd, q);
-			retval = execute_queues_cpsch(dqm,
-						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
-			if (retval == -ETIME)
-				qpd->reset_wavefronts = true;
-		} else {
-			retval = remove_queue_mes(dqm, q, qpd);
-		}
-	}
 
 	/*
 	 * Unconditionally decrement this counter, regardless of the queue's
@@ -1913,6 +1918,7 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 
 	return retval;
 
+failed_unmap_queue:
 failed_try_destroy_debugged_queue:
 
 	dqm_unlock(dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index dc00484ff484..99f2a6412201 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -419,7 +419,6 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
 	}
 
 	if (pqn->q) {
-		kfd_procfs_del_queue(pqn->q);
 		dqm = pqn->q->device->dqm;
 		retval = dqm->ops.destroy_queue(dqm, &pdd->qpd, pqn->q);
 		if (retval) {
@@ -439,6 +438,7 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
 		if (dev->shared_resources.enable_mes)
 			amdgpu_amdkfd_free_gtt_mem(dev->adev,
 						   pqn->q->gang_ctx_bo);
+		kfd_procfs_del_queue(pqn->q);
 		uninit_queue(pqn->q);
 	}
 
-- 
2.35.1

