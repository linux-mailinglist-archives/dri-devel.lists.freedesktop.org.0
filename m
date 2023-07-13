Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4862752C23
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 23:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D8510E786;
	Thu, 13 Jul 2023 21:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A3E10E785;
 Thu, 13 Jul 2023 21:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KtDjAFCYmByWLVDPHSoFeYlAFDkrSIvmPO75H9eHTbY=; b=E+bnIYFMRos4aBzHcV43A+FBuL
 4jGpLItV6oQ3lb/0sdDi/qiRgiSPKhclAVDGTRYlDwtzV2/iw+7qPLpS5J/BnaqZEf+7hYmxwJ7AT
 YpclinzcTa2Up0o7uxyByaC8joJHO6oiP2kkWOblFszr/VXK0jhT8PK/ytveUXjP93caemcOLYlaN
 N0I0heMl5ngmQkEdTermhXwmBEaerHCdqYyDdZ4DO2pWflrWWJLkl7xqxLCbVsE0eBIn6XC2QPV4o
 5fPG2ZxifPT2j4k9kEyv8EDOLUSuWEoJ28Dltw+krT3SWVTDj0SoVfJA4p4FU4kmDFP1rMeI2ewey
 IYw9SvrQ==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qK3w5-00EDEa-Vj; Thu, 13 Jul 2023 23:33:18 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] drm/amdgpu: Create a module param to disable soft
 recovery
Date: Thu, 13 Jul 2023 18:32:37 -0300
Message-ID: <20230713213242.680944-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713213242.680944-1-andrealmeid@igalia.com>
References: <20230713213242.680944-1-andrealmeid@igalia.com>
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
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a module parameter to disable soft recoveries on amdgpu, making
every recovery go through the device reset path. This option makes
easier to force device resets for testing and debugging purposes.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 6 +++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a84bd4a0c421..dbe062a087c5 100644
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
index 3b711babd4e2..7c69f3169aa6 100644
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
@@ -540,6 +541,14 @@ module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
 MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
 module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
 
+/**
+ * DOC: gpu_soft_recovery (bool)
+ * Set true to allow the driver to try soft recoveries if a job get stuck. Set
+ * to false to always force a GPU reset during recovery.
+ */
+MODULE_PARM_DESC(gpu_soft_recovery, "Enable GPU soft recovery mechanism (default: true)");
+module_param_named(gpu_soft_recovery, amdgpu_soft_recovery, bool, 0644);
+
 /**
  * DOC: emu_mode (int)
  * Set value 1 to enable emulation mode. This is only needed when running on an emulator. The default is 0 (disabled).
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
-- 
2.41.0

