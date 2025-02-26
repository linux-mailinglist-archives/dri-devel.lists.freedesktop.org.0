Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51757A4605F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C093210E914;
	Wed, 26 Feb 2025 13:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SLaeXKrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528E010E90C;
 Wed, 26 Feb 2025 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VWcU7yMm2YN0QLOsb6yyKZ0nl0TCOlQKOQKYheBKv+M=; b=SLaeXKrrmUNKF6OXzyS6A8UFzR
 57i5ricWO1V10tV7/8HRnQaAV9XbXno14qYY7MOBPn9Dp5+EPXGHhMdEppwUuCxjOyv/SE+IPCIoW
 Amj1KwDWNZKgc6VmmR/pZ6Yt3uvH4RSZ3FKXR4T6/scGWLVJoyChg05zD/iqyO9K8NQbuvC86mCtt
 ciwoKfXdbuF6KggNd3y8YuQ2mTIkmUztMcdBEH8kWfgpjbNE4UuZnb4Aah4bx2u5alJMn3gmRPee6
 i7pvDbZYKPK7LJ161YGwLKX9Jidwxr6bkEiQ89wyHyZt+iTzrgqClRLmjVCZEGk3/EHRWui8WzbPb
 6WNZKmtQ==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnHC1-000yOs-3B; Wed, 26 Feb 2025 14:11:23 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, siqueira@igalia.com
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH] drm/amdgpu: Create a debug option to disable ring reset
Date: Wed, 26 Feb 2025 10:11:18 -0300
Message-ID: <20250226131118.1012223-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.48.1
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

Prior to the addition of ring reset, the debug option
`debug_disable_soft_recovery` could be used to force a full device
reset. Now that we have ring reset, create a debug option to disable
them in amdgpu, forcing the driver to go with the full device
reset path again when both options are combined.

This option is useful for testing and debugging purposes when one wants
to test the full reset from userspace.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 69895fccb474..75dc4b962d64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1186,6 +1186,7 @@ struct amdgpu_device {
 	bool                            debug_use_vram_fw_buf;
 	bool                            debug_enable_ras_aca;
 	bool                            debug_exp_resets;
+	bool                            debug_disable_gpu_ring_reset;
 
 	bool				enforce_isolation[MAX_XCP];
 	/* Added this mutex for cleaner shader isolation between GFX and compute processes */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 95a05b03f799..edeb12c816e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -136,6 +136,7 @@ enum AMDGPU_DEBUG_MASK {
 	AMDGPU_DEBUG_USE_VRAM_FW_BUF = BIT(3),
 	AMDGPU_DEBUG_ENABLE_RAS_ACA = BIT(4),
 	AMDGPU_DEBUG_ENABLE_EXP_RESETS = BIT(5),
+	AMDGPU_DEBUG_DISABLE_GPU_RING_RESET = BIT(6),
 };
 
 unsigned int amdgpu_vram_limit = UINT_MAX;
@@ -2221,6 +2222,11 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
 		pr_info("debug: enable experimental reset features\n");
 		adev->debug_exp_resets = true;
 	}
+
+	if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_GPU_RING_RESET) {
+		pr_info("debug: ring reset disabled\n");
+		adev->debug_disable_gpu_ring_reset = true;
+	}
 }
 
 static unsigned long amdgpu_fix_asic_type(struct pci_dev *pdev, unsigned long flags)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 7b79b0f39ba1..8ab23182127e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -137,8 +137,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
 
 	/* attempt a per ring reset */
-	if (amdgpu_gpu_recovery &&
-	    ring->funcs->reset) {
+	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
+		dev_err(adev->dev, "Ring reset disabled by debug mask\n");
+	} else if (amdgpu_gpu_recovery && ring->funcs->reset) {
 		dev_err(adev->dev, "Starting %s ring reset\n", s_job->sched->name);
 		/* stop the scheduler, but don't mess with the
 		 * bad job yet because if ring reset fails
-- 
2.48.1

