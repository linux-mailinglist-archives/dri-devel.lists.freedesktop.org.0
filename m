Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3179AA7F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 19:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A20010E345;
	Mon, 11 Sep 2023 17:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE410E343;
 Mon, 11 Sep 2023 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y0rAAye4zMNBjSASBqB4b1RQtLpL4q4XWxq6q2Rv4gM=; b=puMbAwoDDgER5jDqbmXb9wQME0
 X4k97rYD7YiYsXSYvj88a++AAHscWTxawqcEPyJc6M8Gf1vRAENuopl0fVR70bTLXRzK0cX2lvHCw
 xjP4GeRMZ01twMjld5Sw3FmHbjDMwX5vxcS7LpVuVy7rGQq+mnR/wTLtgZwDWQMJtjrecZsjXecwp
 JP03uZrcDEc6tbql52fpXuKhvLZojB2S6yvleno4yosY8EqEEpQ/MWu/jbrA73uoKcKt+YKXlj8ku
 89tv2+n/jllkFG8sPwK/qNwhIAA5kYworadG/KWxl82afeZ8bx44rNaJXM49cAJrpLChvZA+00teY
 DowJckIw==;
Received: from [187.10.203.89] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qfkTC-002OoM-Gm; Mon, 11 Sep 2023 19:13:06 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/amdgpu: Create an option to disable soft recovery
Date: Mon, 11 Sep 2023 14:12:55 -0300
Message-ID: <20230911171255.143992-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911171255.143992-1-andrealmeid@igalia.com>
References: <20230911171255.143992-1-andrealmeid@igalia.com>
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
 Shashank Sharma <shashank.sharma@amd.com>, hamza.mahfooz@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a module option to disable soft recoveries on amdgpu, making
every recovery go through the device reset path. This option makes
easier to force device resets for testing and debugging purposes.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 7 ++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 37eb9b3790a0..f30490abb3fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1103,6 +1103,7 @@ struct amdgpu_device {
 	/* Debug */
 	bool                            debug_vm;
 	bool                            debug_largebar;
+	bool                            debug_disable_soft_recovery;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 830146bd61c0..3ab7eac131e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -124,6 +124,7 @@
 enum AMDGPU_DEBUG_MASK {
 	AMDGPU_DEBUG_VM = BIT(0),
 	AMDGPU_DEBUG_LARGEBAR = BIT(1),
+	AMDGPU_DEBUG_DISABLE_GPU_SOFT_RECOVERY = BIT(2),
 };
 
 unsigned int amdgpu_vram_limit = UINT_MAX;
@@ -945,6 +946,7 @@ MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics
  * - 0x2: Enable simulating large-bar capability on non-large bar system. This
  *   limits the VRAM size reported to ROCm applications to the visible
  *   size, usually 256MB.
+ * - 0x4: Disable GPU soft recovery, always do a full reset
  */
 MODULE_PARM_DESC(debug_mask, "debug options for amdgpu, disabled by default");
 module_param_named(debug_mask, amdgpu_debug_mask, uint, 0444);
@@ -2064,6 +2066,11 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
 		pr_info("debug: enabled simulating large-bar capability on non-large bar system\n");
 		adev->debug_largebar = true;
 	}
+
+	if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_GPU_SOFT_RECOVERY) {
+		pr_info("debug: soft reset for GPU recovery disabled\n");
+		adev->debug_disable_soft_recovery = true;
+	}
 }
 
 static int amdgpu_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index da26c555af24..231d49132a56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -433,7 +433,12 @@ void amdgpu_ring_emit_reg_write_reg_wait_helper(struct amdgpu_ring *ring,
 bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
 			       struct dma_fence *fence)
 {
-	ktime_t deadline = ktime_add_us(ktime_get(), 10000);
+	ktime_t deadline;
+
+	if (unlikely(ring->adev->debug_disable_soft_recovery))
+		return false;
+
+	deadline = ktime_add_us(ktime_get(), 10000);
 
 	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
 		return false;
-- 
2.42.0

