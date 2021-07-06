Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662B3BCCCA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E971D6E24D;
	Tue,  6 Jul 2021 11:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832526E24D;
 Tue,  6 Jul 2021 11:18:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FA1C61D09;
 Tue,  6 Jul 2021 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570324;
 bh=LmPYPspyED4WBFtx+BnP0s9Gg5Ua+lcvDotTG9WIFAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NOuhUcqF3cWAmPfTlmKNa74aEdfKLF/l40Ad9tJ27vKNK4r1Jf7PqH2mYyibcUivN
 /BAOmKzPF1hIRTI05mi4dI38W2nGY1G7zz/fVUgczoXYWqoF8HpwuSUoE6VqWU9O3l
 hsgcn5ZphCboPQRxUBy0d6MFyfi87nxIGobhNh/CuvBJ/9gqOfdGA6Wyxs31UhPyrj
 PYkJgPp1hhgJvq7iTkNt31dwZjaSg7sY12VMhCw/mo+QDGJEn7OoJTu7+Egvi8IBOW
 mg1/IVTUGSET+JbJH0IPC1iVlKWNutaQ8WJLANDHZeObG5yhbSwTXCaZn5Y/ICu9Vr
 9pwHBRIOphRjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 012/160] drm/amdgpu: change the default timeout
 for kernel compute queues
Date: Tue,  6 Jul 2021 07:15:58 -0400
Message-Id: <20210706111827.2060499-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 67387dfe0f6630f2d4f412ce77debec23a49db7a ]

Change to 60s.  This matches what we already do in virtualization.
Infinite timeout can lead to deadlocks in the kernel.

Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a32b41e4c24e..1b69aa74056d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3141,8 +3141,8 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	int ret = 0;
 
 	/*
-	 * By default timeout for non compute jobs is 10000.
-	 * And there is no timeout enforced on compute jobs.
+	 * By default timeout for non compute jobs is 10000
+	 * and 60000 for compute jobs.
 	 * In SR-IOV or passthrough mode, timeout for compute
 	 * jobs are 60000 by default.
 	 */
@@ -3151,10 +3151,8 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	if (amdgpu_sriov_vf(adev))
 		adev->compute_timeout = amdgpu_sriov_is_pp_one_vf(adev) ?
 					msecs_to_jiffies(60000) : msecs_to_jiffies(10000);
-	else if (amdgpu_passthrough(adev))
-		adev->compute_timeout =  msecs_to_jiffies(60000);
 	else
-		adev->compute_timeout = MAX_SCHEDULE_TIMEOUT;
+		adev->compute_timeout =  msecs_to_jiffies(60000);
 
 	if (strnlen(input, AMDGPU_MAX_TIMEOUT_PARAM_LENGTH)) {
 		while ((timeout_setting = strsep(&input, ",")) &&
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e92e7dea71da..f9728ee10298 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -272,9 +272,9 @@ module_param_named(msi, amdgpu_msi, int, 0444);
  *   for SDMA and Video.
  *
  * By default(with no lockup_timeout settings), the timeout for all non-compute(GFX, SDMA and Video)
- * jobs is 10000. And there is no timeout enforced on compute jobs.
+ * jobs is 10000. The timeout for compute is 60000.
  */
-MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default: for bare metal 10000 for non-compute jobs and infinity timeout for compute jobs; "
+MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default: for bare metal 10000 for non-compute jobs and 60000 for compute jobs; "
 		"for passthrough or sriov, 10000 for all jobs."
 		" 0: keep default value. negative: infinity timeout), "
 		"format: for bare metal [Non-Compute] or [GFX,Compute,SDMA,Video]; "
-- 
2.30.2

