Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B31AAA386
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6AC10E606;
	Mon,  5 May 2025 23:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZpUCQov2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8510E604;
 Mon,  5 May 2025 23:16:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 659FC442FB;
 Mon,  5 May 2025 23:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03BDC4CEE4;
 Mon,  5 May 2025 23:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486967;
 bh=o0k/fz02cM04EIEC+yg35Hy+YF9JGw/rAp4Wh6uYPAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZpUCQov21va+3VN5GK4myqIfUcuhQfRd0UCBFwXScyMaQ5AAWbGIe+5BdRVCaF0E2
 uayGt+UH55VBJ9fyOHoKOkXz5ZArg6ETMsxYEGDyHQnDU6j/TkkKbGrmwju7tRhBs3
 bryLmoOviTmUE+B1jsCMReqZ6/zqgB3LwxitkXEG546B928dCe5z5Z53KK7giUBX4x
 19fEBOVzpMj13GUNPt5ePFrWx3EvYJ+2PmiA7I/1j5Pqs1M66dErX+4KJDx9FMrUZO
 d8tElCHW14zQIGSCBPG8R2y3HNRIvhd7HcYEQmdhh08HKM9rzZOCSppsrUdswvzK2O
 jOdyGcP8/G+CQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 084/153] drm/amdkfd: KFD release_work possible
 circular locking
Date: Mon,  5 May 2025 19:12:11 -0400
Message-Id: <20250505231320.2695319-84-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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

[ Upstream commit 1b9366c601039d60546794c63fbb83ce8e53b978 ]

If waiting for gpu reset done in KFD release_work, thers is WARNING:
possible circular locking dependency detected

  #2  kfd_create_process
        kfd_process_mutex
          flush kfd release work

  #1  kfd release work
        wait for amdgpu reset work

  #0  amdgpu_device_gpu_reset
        kgd2kfd_pre_reset
          kfd_process_mutex

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock((work_completion)(&p->release_work));
                  lock((wq_completion)kfd_process_wq);
                  lock((work_completion)(&p->release_work));
   lock((wq_completion)amdgpu-reset-dev);

To fix this, KFD create process move flush release work outside
kfd_process_mutex.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 49810642bc2b8..7ef6e61aa0431 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -807,6 +807,14 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	if (thread->group_leader->mm != thread->mm)
 		return ERR_PTR(-EINVAL);
 
+	/* If the process just called exec(3), it is possible that the
+	 * cleanup of the kfd_process (following the release of the mm
+	 * of the old process image) is still in the cleanup work queue.
+	 * Make sure to drain any job before trying to recreate any
+	 * resource for this process.
+	 */
+	flush_workqueue(kfd_process_wq);
+
 	/*
 	 * take kfd processes mutex before starting of process creation
 	 * so there won't be a case where two threads of the same process
@@ -819,14 +827,6 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	if (process) {
 		pr_debug("Process already found\n");
 	} else {
-		/* If the process just called exec(3), it is possible that the
-		 * cleanup of the kfd_process (following the release of the mm
-		 * of the old process image) is still in the cleanup work queue.
-		 * Make sure to drain any job before trying to recreate any
-		 * resource for this process.
-		 */
-		flush_workqueue(kfd_process_wq);
-
 		process = create_process(thread);
 		if (IS_ERR(process))
 			goto out;
-- 
2.39.5

