Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5007DAF28
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6372D10E1AC;
	Sun, 29 Oct 2023 22:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1AF10E1AC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 22:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49E8B60E9F;
 Sun, 29 Oct 2023 22:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151A4C4339A;
 Sun, 29 Oct 2023 22:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620224;
 bh=7Q9FhoPe2eraIBXpik0bjdEAkFsAsPzqbrBnYZf+BvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=po0gwspoSZ5pO/MJmwPXzmQ56RsbCmcAZpleQa06FQZDpN7vaPo7JRZb7hueLpaXG
 GlBvIO7dW11mlsKT3Yd2M03rU+KX+JHROpsOviA0C75nknDEslVMQllHSO6LGd1hZ3
 aRLxkAzFfklD+gxghbXBNLDeOCPG/dYHv6t2mkxTHr9v+JcpR8VZXG17RkNUNkRUYI
 N6AKB9T+O1Aa938/ojAeAhEABCbTAKwTnC/DbG044fyBcPz0NU+k0dLFB/aDOC07fU
 Lz6wDhcW9gglm2TuB3LxvKPZA58GsVKpu889ZL4ABouoTyIH2A4RFg+i1ne8klzpdf
 Pbyo7OaT/S4IQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 50/52] Revert "accel/ivpu: Use cached buffers for
 FW loading"
Date: Sun, 29 Oct 2023 18:53:37 -0400
Message-ID: <20231029225441.789781-50-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
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
Cc: Sasha Levin <sashal@kernel.org>,
 Karol Wachowski <karol.wachowski@linux.intel.com>, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

[ Upstream commit 610b5d219d1ccac8064556310cc0e62e3c202389 ]

This reverts commit 645d694559cab36fe6a57c717efcfa27d9321396.

The commit cause issues with memory access from the device side.
Switch back to write-combined memory mappings until the issues
will be properly addressed.

Add extra wmb() needed when boot_params->save_restore_ret_address() is
modified.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231017121353.532466-1-stanislaw.gruszka@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_fw.c  | 9 ++++-----
 drivers/accel/ivpu/ivpu_gem.h | 5 -----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 93c69aaa6218d..34e4026c77589 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -195,8 +195,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size,
-					 DRM_IVPU_BO_CACHED | DRM_IVPU_BO_NOSNOOP);
+	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, DRM_IVPU_BO_WC);
 	if (!fw->mem) {
 		ivpu_err(vdev, "Failed to allocate firmware runtime memory\n");
 		return -ENOMEM;
@@ -273,7 +272,7 @@ int ivpu_fw_load(struct ivpu_device *vdev)
 		memset(start, 0, size);
 	}
 
-	clflush_cache_range(fw->mem->kvaddr, fw->mem->base.size);
+	wmb(); /* Flush WC buffers after writing fw->mem */
 
 	return 0;
 }
@@ -375,7 +374,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	if (!ivpu_fw_is_cold_boot(vdev)) {
 		boot_params->save_restore_ret_address = 0;
 		vdev->pm->is_warmboot = true;
-		clflush_cache_range(vdev->fw->mem->kvaddr, SZ_4K);
+		wmb(); /* Flush WC buffers after writing save_restore_ret_address */
 		return;
 	}
 
@@ -430,7 +429,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
 
-	clflush_cache_range(vdev->fw->mem->kvaddr, SZ_4K);
+	wmb(); /* Flush WC buffers after writing bootparams */
 
 	ivpu_fw_boot_params_print(vdev, boot_params);
 }
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index f4130586ff1b2..6b0ceda5f2537 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -8,8 +8,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_mm.h>
 
-#define DRM_IVPU_BO_NOSNOOP       0x10000000
-
 struct dma_buf;
 struct ivpu_bo_ops;
 struct ivpu_file_priv;
@@ -85,9 +83,6 @@ static inline u32 ivpu_bo_cache_mode(struct ivpu_bo *bo)
 
 static inline bool ivpu_bo_is_snooped(struct ivpu_bo *bo)
 {
-	if (bo->flags & DRM_IVPU_BO_NOSNOOP)
-		return false;
-
 	return ivpu_bo_cache_mode(bo) == DRM_IVPU_BO_CACHED;
 }
 
-- 
2.42.0

