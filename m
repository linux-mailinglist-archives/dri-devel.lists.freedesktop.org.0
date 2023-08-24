Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A4787541
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 18:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FD010E5A1;
	Thu, 24 Aug 2023 16:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A36810E592;
 Thu, 24 Aug 2023 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/kdAy1qPc5Qv0WtsGr5qezqfWH6QagnMlc4kAqWcRsc=; b=jFHYD6T3RJNHsiFU1LISCK8BPj
 B1IQnPZ1gUZ/0BHWRrILHIxdpGwK5jGEBfH847fetowQeTbHW87nZwCzx/xJhg4apbZDGBgFEQL9S
 eFvhwbnzHoIh1t3SgiNHwB+LJ6SjqB7HuIwO7fVgw0naoeZfFnte2KqJ88G8QYj27LHjZtqeQRqB9
 ItSLjNdLxE3JOJJpT0OkzIIR5FSPrWbEwV5875TwwyBdV5pQfWkcnA2ts9gjnnwc/CcrMFnCJqXKe
 ij0M0iyg2cudgI/elUGctQMSCUPnp3pfJkd1+OYoOXP5UXMl7WyTft6jNxc4I8InKKSnBySjdVvi7
 aEnhG/bA==;
Received: from [187.35.42.59] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qZD99-00F0DK-Um; Thu, 24 Aug 2023 18:25:24 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu: Create an option to disable soft recovery
Date: Thu, 24 Aug 2023 13:25:05 -0300
Message-ID: <20230824162505.173399-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824162505.173399-1-andrealmeid@igalia.com>
References: <20230824162505.173399-1-andrealmeid@igalia.com>
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

Create a module option to disable soft recoveries on amdgpu, making
every recovery go through the device reset path. This option makes
easier to force device resets for testing and debugging purposes.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 6 +++++-
 drivers/gpu/drm/amd/include/amd_shared.h | 1 +
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 4de074243c4d..8f4a93890345 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -189,6 +189,7 @@ extern uint amdgpu_force_long_training;
 extern int amdgpu_lbpw;
 extern int amdgpu_compute_multipipe;
 extern int amdgpu_gpu_recovery;
+extern bool amdgpu_soft_recovery;
 extern int amdgpu_emu_mode;
 extern uint amdgpu_smu_memory_pool_size;
 extern int amdgpu_smu_pptable_id;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d53e4097acc0..7d6c39b547cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -163,6 +163,7 @@ uint amdgpu_force_long_training;
 int amdgpu_lbpw = -1;
 int amdgpu_compute_multipipe = -1;
 int amdgpu_gpu_recovery = -1; /* auto */
+bool amdgpu_soft_recovery = true;
 int amdgpu_emu_mode;
 uint amdgpu_smu_memory_pool_size;
 int amdgpu_smu_pptable_id = -1;
@@ -2891,6 +2892,11 @@ static void amdgpu_init_debug_options(void)
 		pr_info("debug: enabled simulating large-bar capability on non-large bar system\n");
 		debug_largebar = true;
 	}
+
+	if (amdgpu_debug_mask & DEBUG_DISABLE_GPU_SOFT_RECOVERY) {
+		pr_info("debug: soft reset for GPU recovery disabled\n");
+		amdgpu_soft_recovery = false;
+	}
 }
 
 static int __init amdgpu_init(void)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 80d6e132e409..40678d9fb17e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -434,8 +434,12 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
 			       struct dma_fence *fence)
 {
 	unsigned long flags;
+	ktime_t deadline;
 
-	ktime_t deadline = ktime_add_us(ktime_get(), 10000);
+	if (!amdgpu_soft_recovery)
+		return false;
+
+	deadline = ktime_add_us(ktime_get(), 10000);
 
 	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
 		return false;
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 6fa644c249a5..afcbacce0a13 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -264,6 +264,7 @@ enum AMDGPU_DEBUG_MASK {
 	DEBUG_VERBOSE_EVICTIONS = (1 << 0),		// 0x1
 	DEBUG_VM = (1 << 1),				// 0x2
 	DEBUG_LARGEBAR = (1 << 2),			// 0x4
+	DEBUG_DISABLE_GPU_SOFT_RECOVERY = (1 << 3),	// 0x8
 };
 
 /**
-- 
2.41.0

