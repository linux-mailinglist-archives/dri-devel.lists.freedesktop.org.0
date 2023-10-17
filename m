Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C17CC2B4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E2E10E2D8;
	Tue, 17 Oct 2023 12:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451310E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697544838; x=1729080838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wzPTejCp35NJsBws5NeTkdDHG20tz8JR5hsM7lX7lBk=;
 b=LfSPQiPGIn5Wh+u3CZDUJdAar7oKAbDxSHP31k2AhX1qYzIZOO65PgHT
 rAzTKs/fETlzSw7JNEBKtQt7Ubdg78b5j0S5563aCsvzkW/S+uKrzvVAt
 EBvv0DSrhn6pzD3E6oiMyiNK4OGpzZFn6hgukpwdlwJXFv3HjFQavTH6t
 z6FRfQqJV0OfEp881JL3xEI0JZTQ0W+UwvEJfwpbSXIXQroacpR6tT/qq
 XH4sJ9t0oAxW9rBncC5/T66W80Q7/ZefhVCCncyIpJeNkRCJtOmlhr4xJ
 8fboRvE78HLDMbcqXaUMZpKzpX+eXSFxXEqglR1jmg4xuf5LxnoCmMBHK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="471991718"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="471991718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 05:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="899895830"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="899895830"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 05:11:54 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "accel/ivpu: Use cached buffers for FW loading"
Date: Tue, 17 Oct 2023 14:13:53 +0200
Message-Id: <20231017121353.532466-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 645d694559cab36fe6a57c717efcfa27d9321396.

The commit cause issues with memory access from the device side.
Switch back to write-combined memory mappings until the issues
will be properly addressed.

Add extra wmb() needed when boot_params->save_restore_ret_address() is
modified.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c  | 9 ++++-----
 drivers/accel/ivpu/ivpu_gem.h | 5 -----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 0191cf8e5964..a277bbae78fc 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -220,8 +220,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size,
-					 DRM_IVPU_BO_CACHED | DRM_IVPU_BO_NOSNOOP);
+	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, DRM_IVPU_BO_WC);
 	if (!fw->mem) {
 		ivpu_err(vdev, "Failed to allocate firmware runtime memory\n");
 		return -ENOMEM;
@@ -331,7 +330,7 @@ int ivpu_fw_load(struct ivpu_device *vdev)
 		memset(start, 0, size);
 	}
 
-	clflush_cache_range(fw->mem->kvaddr, fw->mem->base.size);
+	wmb(); /* Flush WC buffers after writing fw->mem */
 
 	return 0;
 }
@@ -433,7 +432,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	if (!ivpu_fw_is_cold_boot(vdev)) {
 		boot_params->save_restore_ret_address = 0;
 		vdev->pm->is_warmboot = true;
-		clflush_cache_range(vdev->fw->mem->kvaddr, SZ_4K);
+		wmb(); /* Flush WC buffers after writing save_restore_ret_address */
 		return;
 	}
 
@@ -495,7 +494,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
 
-	clflush_cache_range(vdev->fw->mem->kvaddr, SZ_4K);
+	wmb(); /* Flush WC buffers after writing bootparams */
 
 	ivpu_fw_boot_params_print(vdev, boot_params);
 }
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index f4130586ff1b..6b0ceda5f253 100644
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
2.25.1

