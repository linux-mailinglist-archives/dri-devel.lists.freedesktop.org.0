Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9803C8BFE9A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08651129B6;
	Wed,  8 May 2024 13:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7Zc2Xy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8181C1129B6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174487; x=1746710487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fu97RWIie/f/Eh3HbKFV0M21iqFAmQy3XzyMebqgv+8=;
 b=I7Zc2Xy0NFjSR6LUbbJwM3cP/2TQCRjDvDTVdCPkzcqyAUCr/nJPNTdX
 usQ7BbFVh3qcAsToE4I0sVb8cnl4PBUz6/7D1wAYx5Ax1bBM6mDbzREPC
 L6zYAJDOHt7RY1RrJgQCmTc7A/1OxZGyLgVjNJZO+3ivNab2Ej8lrQH4T
 IRCnyk98cxWjdjkL48sRduN3uAvHrQy0wt63iG0YUURhEu32oPE4JpANQ
 /qwAGMv8wec8JP1gACelDiCpdcGqldGNxeJY32zXo8AGHcoSnAxRFCKOn
 SNonHyGyjXBVogWII64yUWAQ5ElxSRtPE7ngTWuK4f5FWNj20CZwSgn17 Q==;
X-CSE-ConnectionGUID: JC/dsnC8TBCjbSfO08gD6Q==
X-CSE-MsgGUID: BQN/jiiARCWitaRpPraD/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540082"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540082"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:27 -0700
X-CSE-ConnectionGUID: B99W7vteQEW7V0wwji2T3Q==
X-CSE-MsgGUID: mdmtvp0HSe6SNyAMHM1xCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289398"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:25 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 09/12] accel/ivpu: Add force snoop module parameter
Date: Wed,  8 May 2024 15:21:06 +0200
Message-ID: <20240508132106.2387464-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Add module parameter that enforces snooping for all NPU accesses,
both through MMU PTEs mappings and through TCU page table walk
override register bits for MMU page walks / configuration access.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     |  4 ++++
 drivers/accel/ivpu/ivpu_drv.h     |  6 ++++++
 drivers/accel/ivpu/ivpu_gem.h     | 11 +++++++----
 drivers/accel/ivpu/ivpu_hw_37xx.c |  6 +++++-
 drivers/accel/ivpu/ivpu_hw_40xx.c |  6 +++++-
 drivers/accel/ivpu/ivpu_mmu.c     | 12 ++++++++----
 6 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ece6b212aaf8..87c48fa8d719 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -60,6 +60,10 @@ bool ivpu_disable_mmu_cont_pages;
 module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0644);
 MODULE_PARM_DESC(disable_mmu_cont_pages, "Disable MMU contiguous pages optimization");
 
+bool ivpu_force_snoop;
+module_param_named(force_snoop, ivpu_force_snoop, bool, 0644);
+MODULE_PARM_DESC(force_snoop, "Force snooping for NPU host memory access");
+
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 0f42a3a9e59c..d55f0bdffd71 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -167,6 +167,7 @@ extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
 extern bool ivpu_sched_mode;
 extern bool ivpu_disable_mmu_cont_pages;
+extern bool ivpu_force_snoop;
 
 #define IVPU_TEST_MODE_FW_TEST            BIT(0)
 #define IVPU_TEST_MODE_NULL_HW            BIT(1)
@@ -241,4 +242,9 @@ static inline bool ivpu_is_fpga(struct ivpu_device *vdev)
 	return ivpu_get_platform(vdev) == IVPU_PLATFORM_FPGA;
 }
 
+static inline bool ivpu_is_force_snoop_enabled(struct ivpu_device *vdev)
+{
+	return ivpu_force_snoop;
+}
+
 #endif /* __IVPU_DRV_H__ */
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index fb7117c13eec..d975000abd78 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -60,14 +60,17 @@ static inline u32 ivpu_bo_cache_mode(struct ivpu_bo *bo)
 	return bo->flags & DRM_IVPU_BO_CACHE_MASK;
 }
 
-static inline bool ivpu_bo_is_snooped(struct ivpu_bo *bo)
+static inline struct ivpu_device *ivpu_bo_to_vdev(struct ivpu_bo *bo)
 {
-	return ivpu_bo_cache_mode(bo) == DRM_IVPU_BO_CACHED;
+	return to_ivpu_device(bo->base.base.dev);
 }
 
-static inline struct ivpu_device *ivpu_bo_to_vdev(struct ivpu_bo *bo)
+static inline bool ivpu_bo_is_snooped(struct ivpu_bo *bo)
 {
-	return to_ivpu_device(bo->base.base.dev);
+	if (ivpu_is_force_snoop_enabled(ivpu_bo_to_vdev(bo)))
+		return true;
+
+	return ivpu_bo_cache_mode(bo) == DRM_IVPU_BO_CACHED;
 }
 
 static inline void *ivpu_to_cpu_addr(struct ivpu_bo *bo, u32 vpu_addr)
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index ce664b6515aa..250291cc1f3a 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -514,7 +514,11 @@ static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 
 	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, NOSNOOP_OVERRIDE_EN, val);
 	val = REG_CLR_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AW_NOSNOOP_OVERRIDE, val);
-	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AR_NOSNOOP_OVERRIDE, val);
+
+	if (ivpu_is_force_snoop_enabled(vdev))
+		val = REG_CLR_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AR_NOSNOOP_OVERRIDE, val);
+	else
+		val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AR_NOSNOOP_OVERRIDE, val);
 
 	REGV_WR32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, val);
 }
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 186cd87079c2..e64ee705d00c 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -531,7 +531,11 @@ static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 
 	val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, SNOOP_OVERRIDE_EN, val);
 	val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AW_SNOOP_OVERRIDE, val);
-	val = REG_CLR_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AR_SNOOP_OVERRIDE, val);
+
+	if (ivpu_is_force_snoop_enabled(vdev))
+		val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AR_SNOOP_OVERRIDE, val);
+	else
+		val = REG_CLR_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AR_SNOOP_OVERRIDE, val);
 
 	REGV_WR32(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, val);
 }
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 2e46b322c450..8682e6145520 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -519,7 +519,8 @@ static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	clflush_cache_range(q->base, IVPU_MMU_CMDQ_SIZE);
+	if (!ivpu_is_force_snoop_enabled(vdev))
+		clflush_cache_range(q->base, IVPU_MMU_CMDQ_SIZE);
 	REGV_WR32(IVPU_MMU_REG_CMDQ_PROD, q->prod);
 
 	ret = ivpu_mmu_cmdq_wait_for_cons(vdev);
@@ -567,7 +568,8 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	int ret;
 
 	memset(mmu->cmdq.base, 0, IVPU_MMU_CMDQ_SIZE);
-	clflush_cache_range(mmu->cmdq.base, IVPU_MMU_CMDQ_SIZE);
+	if (!ivpu_is_force_snoop_enabled(vdev))
+		clflush_cache_range(mmu->cmdq.base, IVPU_MMU_CMDQ_SIZE);
 	mmu->cmdq.prod = 0;
 	mmu->cmdq.cons = 0;
 
@@ -661,7 +663,8 @@ static void ivpu_mmu_strtab_link_cd(struct ivpu_device *vdev, u32 sid)
 	WRITE_ONCE(entry[1], str[1]);
 	WRITE_ONCE(entry[0], str[0]);
 
-	clflush_cache_range(entry, IVPU_MMU_STRTAB_ENT_SIZE);
+	if (!ivpu_is_force_snoop_enabled(vdev))
+		clflush_cache_range(entry, IVPU_MMU_STRTAB_ENT_SIZE);
 
 	ivpu_dbg(vdev, MMU, "STRTAB write entry (SSID=%u): 0x%llx, 0x%llx\n", sid, str[0], str[1]);
 }
@@ -735,7 +738,8 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 	WRITE_ONCE(entry[3], cd[3]);
 	WRITE_ONCE(entry[0], cd[0]);
 
-	clflush_cache_range(entry, IVPU_MMU_CDTAB_ENT_SIZE);
+	if (!ivpu_is_force_snoop_enabled(vdev))
+		clflush_cache_range(entry, IVPU_MMU_CDTAB_ENT_SIZE);
 
 	ivpu_dbg(vdev, MMU, "CDTAB %s entry (SSID=%u, dma=%pad): 0x%llx, 0x%llx, 0x%llx, 0x%llx\n",
 		 cd_dma ? "write" : "clear", ssid, &cd_dma, cd[0], cd[1], cd[2], cd[3]);
-- 
2.43.2

