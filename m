Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1039769C03
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923010E2C5;
	Mon, 31 Jul 2023 16:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE00810E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819998; x=1722355998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D7wn5JU4z6JXGq+uGxZ1MXoYuMfTAo1vRpkna6Vked0=;
 b=gaj2T0p0PIYzIn0HmKsJBywIzmrExQrpYWv2WdzZeeTTahEauEd3eUQf
 zDBf7RiVfSXLVacXdRQ0iwpLXfObQFQTgg9i4YuNa8BwJUU6ZdCele6qa
 F4iRvcGwkujoB0hO3vwOn7a2n6gNF5dmg33MJt899LvuyliF9vqqyqncK
 TYg18KkeJpvQT40AIcBLFa2Awarr8jYixreKhD5nyS0vDzjDjgKoZWdrT
 M+FryOuVxmtbvO2bkSAcFQx0SpsZvBAnSWpc5jp7UyeFsjLRauPiC/S3D
 ejXHrpFuo2GwtRqHajI98ruK3GcvSvBfqvtshsLCOpOHmRdIuYbS/KT88 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400007891"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="400007891"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818396411"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="818396411"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:17 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] accel/ivpu: Refactor memory ranges logic
Date: Mon, 31 Jul 2023 18:12:57 +0200
Message-Id: <20230731161258.2987564-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Add new dma range and change naming convention for virtual address
memory ranges managed by KMD.

New available ranges are named as follows:
 * global range - global context accessible by FW
 * aliased range - user context accessible by FW
 * dma range - user context accessible by DMA
 * shave range - user context accessible by shaves
 * global shave range - global context accessible by shave nn

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         |  4 ++--
 drivers/accel/ivpu/ivpu_fw.c          | 18 ++++++++----------
 drivers/accel/ivpu/ivpu_gem.c         | 10 ++++++----
 drivers/accel/ivpu/ivpu_hw.h          |  9 ++++-----
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  9 ++++-----
 drivers/accel/ivpu/ivpu_mmu_context.c |  8 ++++----
 include/uapi/drm/ivpu_accel.h         |  5 ++++-
 7 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index d33eb17007bf..3da15890bc59 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -122,7 +122,7 @@ static int ivpu_get_capabilities(struct ivpu_device *vdev, struct drm_ivpu_param
 		args->value = 0;
 		break;
 	case DRM_IVPU_CAP_DMA_MEMORY_RANGE:
-		args->value = 0;
+		args->value = 1;
 		break;
 	default:
 		return -EINVAL;
@@ -160,7 +160,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 		args->value = ivpu_get_context_count(vdev);
 		break;
 	case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
-		args->value = vdev->hw->ranges.user_low.start;
+		args->value = vdev->hw->ranges.user.start;
 		break;
 	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
 		args->value = file_priv->priority;
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 7caf90a169a3..7e75439dec60 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -204,7 +204,7 @@ static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
 		return -EINVAL;
 	}
 
-	ivpu_hw_init_range(&vdev->hw->ranges.global_low, start, size);
+	ivpu_hw_init_range(&vdev->hw->ranges.global, start, size);
 	return 0;
 }
 
@@ -245,7 +245,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	}
 
 	if (fw->shave_nn_size) {
-		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.global_high.start,
+		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.shave.start,
 							  fw->shave_nn_size, DRM_IVPU_BO_UNCACHED);
 		if (!fw->mem_shave_nn) {
 			ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
@@ -443,9 +443,9 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	 * Uncached region of VPU address space, covers IPC buffers, job queues
 	 * and log buffers, programmable to L2$ Uncached by VPU MTRR
 	 */
-	boot_params->shared_region_base = vdev->hw->ranges.global_low.start;
-	boot_params->shared_region_size = vdev->hw->ranges.global_low.end -
-					  vdev->hw->ranges.global_low.start;
+	boot_params->shared_region_base = vdev->hw->ranges.global.start;
+	boot_params->shared_region_size = vdev->hw->ranges.global.end -
+					  vdev->hw->ranges.global.start;
 
 	boot_params->ipc_header_area_start = ipc_mem_rx->vpu_addr;
 	boot_params->ipc_header_area_size = ipc_mem_rx->base.size / 2;
@@ -453,10 +453,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->ipc_payload_area_start = ipc_mem_rx->vpu_addr + ipc_mem_rx->base.size / 2;
 	boot_params->ipc_payload_area_size = ipc_mem_rx->base.size / 2;
 
-	boot_params->global_aliased_pio_base =
-		vdev->hw->ranges.global_aliased_pio.start;
-	boot_params->global_aliased_pio_size =
-		ivpu_hw_range_size(&vdev->hw->ranges.global_aliased_pio);
+	boot_params->global_aliased_pio_base = vdev->hw->ranges.user.start;
+	boot_params->global_aliased_pio_size = ivpu_hw_range_size(&vdev->hw->ranges.user);
 
 	/* Allow configuration for L2C_PAGE_TABLE with boot param value */
 	boot_params->autoconfig = 1;
@@ -464,7 +462,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	/* Enable L2 cache for first 2GB of high memory */
 	boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].use = 1;
 	boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg =
-		ADDR_TO_L2_CACHE_CFG(vdev->hw->ranges.global_high.start);
+		ADDR_TO_L2_CACHE_CFG(vdev->hw->ranges.shave.start);
 
 	if (vdev->fw->mem_shave_nn)
 		boot_params->shave_nn_fw_base = vdev->fw->mem_shave_nn->vpu_addr;
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 52b339aefadc..2981bb32c755 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -279,10 +279,12 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 	int ret;
 
 	if (!range) {
-		if (bo->flags & DRM_IVPU_BO_HIGH_MEM)
-			range = &vdev->hw->ranges.user_high;
+		if (bo->flags & DRM_IVPU_BO_SHAVE_MEM)
+			range = &vdev->hw->ranges.shave;
+		else if (bo->flags & DRM_IVPU_BO_DMA_MEM)
+			range = &vdev->hw->ranges.dma;
 		else
-			range = &vdev->hw->ranges.user_low;
+			range = &vdev->hw->ranges.user;
 	}
 
 	mutex_lock(&ctx->lock);
@@ -570,7 +572,7 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 		fixed_range.end = vpu_addr + size;
 		range = &fixed_range;
 	} else {
-		range = &vdev->hw->ranges.global_low;
+		range = &vdev->hw->ranges.global;
 	}
 
 	bo = ivpu_bo_alloc(vdev, &vdev->gctx, size, flags, &internal_ops, range, 0);
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 335b7f707752..69e52d21cd10 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -38,11 +38,10 @@ struct ivpu_addr_range {
 struct ivpu_hw_info {
 	const struct ivpu_hw_ops *ops;
 	struct {
-		struct ivpu_addr_range global_low;
-		struct ivpu_addr_range global_high;
-		struct ivpu_addr_range user_low;
-		struct ivpu_addr_range user_high;
-		struct ivpu_addr_range global_aliased_pio;
+		struct ivpu_addr_range global;
+		struct ivpu_addr_range user;
+		struct ivpu_addr_range shave;
+		struct ivpu_addr_range dma;
 	} ranges;
 	struct {
 		u8 min_ratio;
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 2cda8e4c4a3d..9eae1c241bc0 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -620,11 +620,10 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 
 	ivpu_pll_init_frequency_ratios(vdev);
 
-	ivpu_hw_init_range(&hw->ranges.global_low, 0x80000000, SZ_512M);
-	ivpu_hw_init_range(&hw->ranges.global_high, 0x180000000, SZ_2M);
-	ivpu_hw_init_range(&hw->ranges.user_low, 0xc0000000, 255 * SZ_1M);
-	ivpu_hw_init_range(&hw->ranges.user_high, 0x180000000, SZ_2G);
-	hw->ranges.global_aliased_pio = hw->ranges.user_low;
+	ivpu_hw_init_range(&hw->ranges.global, 0x80000000, SZ_512M);
+	ivpu_hw_init_range(&hw->ranges.user,   0xc0000000, 255 * SZ_1M);
+	ivpu_hw_init_range(&hw->ranges.shave, 0x180000000, SZ_2G);
+	ivpu_hw_init_range(&hw->ranges.dma,   0x200000000, SZ_8G);
 
 	return 0;
 }
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 465a82298476..1d2e554e2c4a 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -431,11 +431,11 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
 		return ret;
 
 	if (!context_id) {
-		start = vdev->hw->ranges.global_low.start;
-		end = vdev->hw->ranges.global_high.end;
+		start = vdev->hw->ranges.global.start;
+		end = vdev->hw->ranges.shave.end;
 	} else {
-		start = vdev->hw->ranges.user_low.start;
-		end = vdev->hw->ranges.user_high.end;
+		start = vdev->hw->ranges.user.start;
+		end = vdev->hw->ranges.dma.end;
 	}
 
 	drm_mm_init(&ctx->mm, start, end - start);
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 3e99b74eef04..a58a14c9f222 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -133,8 +133,10 @@ struct drm_ivpu_param {
 	__u64 value;
 };
 
-#define DRM_IVPU_BO_HIGH_MEM   0x00000001
+#define DRM_IVPU_BO_SHAVE_MEM  0x00000001
+#define DRM_IVPU_BO_HIGH_MEM   DRM_IVPU_BO_SHAVE_MEM
 #define DRM_IVPU_BO_MAPPABLE   0x00000002
+#define DRM_IVPU_BO_DMA_MEM    0x00000004
 
 #define DRM_IVPU_BO_CACHED     0x00000000
 #define DRM_IVPU_BO_UNCACHED   0x00010000
@@ -144,6 +146,7 @@ struct drm_ivpu_param {
 #define DRM_IVPU_BO_FLAGS \
 	(DRM_IVPU_BO_HIGH_MEM | \
 	 DRM_IVPU_BO_MAPPABLE | \
+	 DRM_IVPU_BO_DMA_MEM | \
 	 DRM_IVPU_BO_CACHE_MASK)
 
 /**
-- 
2.25.1

