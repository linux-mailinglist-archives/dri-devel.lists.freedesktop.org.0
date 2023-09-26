Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D527AEC2B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395910E3B8;
	Tue, 26 Sep 2023 12:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4358310E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695730189; x=1727266189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nNLGTEcSr7G+foLcymbR716m4JYbN5Ug45Ulyx5qY/c=;
 b=MC03aqt0ltIGIfSxT+tPZBhsbnhxnKU2ZqoHjPzbjgTua/Dr5yVItxq+
 2wO5UzljW7kO6TFHrroTZTkA2hf+s1kwnPsAl6/9ZYccJtTadl0T1O2QT
 313YeQrQtGRk6PLg/IKY6IDDFsCgodssQJM7o/qisFgzfQdtOI2gXI/lN
 izhwu9wKEtn6q2V+EuHmUdQwSdL0uGQvMqukSCdjmGXHCWP45vZmgMCKk
 DAYJBQmH3KgdZwSVg9ZV+ZSXw+KKJSvl9xkFSKFDag4IISTZ7WSV8BARq
 AhIpA/dZva/JIJ6OrSLbpSmccz3lyfewqKw/Er8MwAhcw+pG2/RCmJUtm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412465873"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412465873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="778117437"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="778117437"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:09:46 -0700
Date: Tue, 26 Sep 2023 14:09:43 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] accel/ivpu: Use cached buffers for FW loading
Message-ID: <20230926120943.GD846747@linux.intel.com>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
 <20230925121137.872158-7-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925121137.872158-7-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Create buffers with cache coherency on the CPU side (write-back) while
disabling snooping on the VPU side. These buffers require an explicit
cache flush after each CPU-side modification.

Configuring pages as write-combined may introduce significant delays,
potentially taking hundreds of milliseconds for 64 MB buffers.

Added internal DRM_IVPU_BO_NOSNOOP mask which disables snooping on the
VPU side. Allocate FW runtime memory buffer (64 MB) as cached with
snooping-disabled.

This fixes random long FW loading times and boot params memory
corruption on warmboot (due to missed wmb).

Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: Actually use DRM_IVPU_BO_CACHED instead of DRM_IVPU_BO_WC..

 drivers/accel/ivpu/ivpu_fw.c  | 8 +++++---
 drivers/accel/ivpu/ivpu_gem.h | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 9827ea4d7b83..0191cf8e5964 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -220,7 +220,8 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, DRM_IVPU_BO_WC);
+	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size,
+					 DRM_IVPU_BO_CACHED | DRM_IVPU_BO_NOSNOOP);
 	if (!fw->mem) {
 		ivpu_err(vdev, "Failed to allocate firmware runtime memory\n");
 		return -ENOMEM;
@@ -330,7 +331,7 @@ int ivpu_fw_load(struct ivpu_device *vdev)
 		memset(start, 0, size);
 	}
 
-	wmb(); /* Flush WC buffers after writing fw->mem */
+	clflush_cache_range(fw->mem->kvaddr, fw->mem->base.size);
 
 	return 0;
 }
@@ -432,6 +433,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	if (!ivpu_fw_is_cold_boot(vdev)) {
 		boot_params->save_restore_ret_address = 0;
 		vdev->pm->is_warmboot = true;
+		clflush_cache_range(vdev->fw->mem->kvaddr, SZ_4K);
 		return;
 	}
 
@@ -493,7 +495,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
 
-	wmb(); /* Flush WC buffers after writing bootparams */
+	clflush_cache_range(vdev->fw->mem->kvaddr, SZ_4K);
 
 	ivpu_fw_boot_params_print(vdev, boot_params);
 }
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 6b0ceda5f253..f4130586ff1b 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -8,6 +8,8 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_mm.h>
 
+#define DRM_IVPU_BO_NOSNOOP       0x10000000
+
 struct dma_buf;
 struct ivpu_bo_ops;
 struct ivpu_file_priv;
@@ -83,6 +85,9 @@ static inline u32 ivpu_bo_cache_mode(struct ivpu_bo *bo)
 
 static inline bool ivpu_bo_is_snooped(struct ivpu_bo *bo)
 {
+	if (bo->flags & DRM_IVPU_BO_NOSNOOP)
+		return false;
+
 	return ivpu_bo_cache_mode(bo) == DRM_IVPU_BO_CACHED;
 }
 
-- 
2.25.1

