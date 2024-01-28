Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D6583F68B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727E11126EA;
	Sun, 28 Jan 2024 16:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82CC1126EA;
 Sun, 28 Jan 2024 16:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F45661BAA;
 Sun, 28 Jan 2024 16:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90087C433A6;
 Sun, 28 Jan 2024 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458430;
 bh=YQxG6SF6UMB/tSrGXxlg5ZxSf6zRK+U+SLh8s5R23xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xb3wBw4sd8kPC2uYCMUDur2nvDEIq6wUCPP6CkNXV2zE/ofycIObTVYkXeo4VFPig
 m41gRhzb3cbpkx+W5mjzT32Cer1eiczQ9N+WFBnlElMSgyHN+sLs0BsiwuhQDMf2mQ
 QdarlQixAoSBcjWGV2UXeSoNR6TWzLS8oWlzsGFK5tUiZ3BK9zBK6+ptwXyO0gThyh
 Wvg/KBV+mDUJGeub5Jq4uBHejbxFmj5euIHe3+4hVwgYRHclyDVZZFrdre8+WG9cDE
 P6xogfruAkRQwrPIEEjb4yxdpvd4+QXgPGmkIVQAGAnkNeFV5EGYCiizrQYbWUtUhA
 LFyc5gbTzHthQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 20/31] drm/amdkfd: Fix lock dependency warning
 with srcu
Date: Sun, 28 Jan 2024 11:12:50 -0500
Message-ID: <20240128161315.201999-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161315.201999-1-sashal@kernel.org>
References: <20240128161315.201999-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.14
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
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 2a9de42e8d3c82c6990d226198602be44f43f340 ]

======================================================
WARNING: possible circular locking dependency detected
6.5.0-kfd-yangp #2289 Not tainted
------------------------------------------------------
kworker/0:2/996 is trying to acquire lock:
        (srcu){.+.+}-{0:0}, at: __synchronize_srcu+0x5/0x1a0

but task is already holding lock:
        ((work_completion)(&svms->deferred_list_work)){+.+.}-{0:0}, at:
	process_one_work+0x211/0x560

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #3 ((work_completion)(&svms->deferred_list_work)){+.+.}-{0:0}:
        __flush_work+0x88/0x4f0
        svm_range_list_lock_and_flush_work+0x3d/0x110 [amdgpu]
        svm_range_set_attr+0xd6/0x14c0 [amdgpu]
        kfd_ioctl+0x1d1/0x630 [amdgpu]
        __x64_sys_ioctl+0x88/0xc0

-> #2 (&info->lock#2){+.+.}-{3:3}:
        __mutex_lock+0x99/0xc70
        amdgpu_amdkfd_gpuvm_restore_process_bos+0x54/0x740 [amdgpu]
        restore_process_helper+0x22/0x80 [amdgpu]
        restore_process_worker+0x2d/0xa0 [amdgpu]
        process_one_work+0x29b/0x560
        worker_thread+0x3d/0x3d0

-> #1 ((work_completion)(&(&process->restore_work)->work)){+.+.}-{0:0}:
        __flush_work+0x88/0x4f0
        __cancel_work_timer+0x12c/0x1c0
        kfd_process_notifier_release_internal+0x37/0x1f0 [amdgpu]
        __mmu_notifier_release+0xad/0x240
        exit_mmap+0x6a/0x3a0
        mmput+0x6a/0x120
        do_exit+0x322/0xb90
        do_group_exit+0x37/0xa0
        __x64_sys_exit_group+0x18/0x20
        do_syscall_64+0x38/0x80

-> #0 (srcu){.+.+}-{0:0}:
        __lock_acquire+0x1521/0x2510
        lock_sync+0x5f/0x90
        __synchronize_srcu+0x4f/0x1a0
        __mmu_notifier_release+0x128/0x240
        exit_mmap+0x6a/0x3a0
        mmput+0x6a/0x120
        svm_range_deferred_list_work+0x19f/0x350 [amdgpu]
        process_one_work+0x29b/0x560
        worker_thread+0x3d/0x3d0

other info that might help us debug this:
Chain exists of:
  srcu --> &info->lock#2 --> (work_completion)(&svms->deferred_list_work)

Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
        lock((work_completion)(&svms->deferred_list_work));
                        lock(&info->lock#2);
			lock((work_completion)(&svms->deferred_list_work));
        sync(srcu);

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index a4c911fa1675..b51224a85a38 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2343,8 +2343,10 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 		mutex_unlock(&svms->lock);
 		mmap_write_unlock(mm);
 
-		/* Pairs with mmget in svm_range_add_list_work */
-		mmput(mm);
+		/* Pairs with mmget in svm_range_add_list_work. If dropping the
+		 * last mm refcount, schedule release work to avoid circular locking
+		 */
+		mmput_async(mm);
 
 		spin_lock(&svms->deferred_list_lock);
 	}
-- 
2.43.0

