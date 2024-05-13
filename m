Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0588C4068
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D51B10E717;
	Mon, 13 May 2024 12:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvAw15Vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBAC10E720
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601889; x=1747137889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yWITvAumCyZY6MPbesmLTtW6j79PTyharkZIDPoR750=;
 b=gvAw15VbyAhRsZjBfXNpiC4GYdU4ABOV7KHm8Vya9zvtEHfHMePk1aM7
 IRxO2959Tk/fI13LDMaaRuognPvB38ZrBERxaC18lvDtNZF1Jqyw0HNsI
 CcfOEJ+M8J67MaqnJSe1Lt18BJHxe9zqHWIpoNtPgdJp+sGp5e6JXmuyr
 +LxvpcrNvDQC9vcUb1Xjpe+VeGckLPyjyTE4iQ4+RjQ5CY/ylbei0KvGM
 OCChq02f7+fiZlhOGYiuME8wALap/AyJvtUBd1Kb/eTPwxct5M0p7YkcV
 SS9zEF4MyV+V0vS1ffj1mrHoy4m0Fw57ZGGP694MyYuTyF2fBjecYlynt A==;
X-CSE-ConnectionGUID: 2B1MASOlSWel6HFJQJAsow==
X-CSE-MsgGUID: STcPtDiQSbKZfetD4XT0kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131757"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:49 -0700
X-CSE-ConnectionGUID: v5NncI3UQrOXMON7yUINug==
X-CSE-MsgGUID: iL6l3UQmSQqWD0bJbSNjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341094"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:47 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 09/12] accel/ivpu: Add force snoop module parameter
Date: Mon, 13 May 2024 14:04:28 +0200
Message-ID: <20240513120431.3187212-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_drv.c     |  4 ++++
 drivers/accel/ivpu/ivpu_drv.h     |  6 ++++++
 drivers/accel/ivpu/ivpu_gem.h     | 11 +++++++----
 drivers/accel/ivpu/ivpu_hw_37xx.c |  6 +++++-
 drivers/accel/ivpu/ivpu_hw_40xx.c |  6 +++++-
 drivers/accel/ivpu/ivpu_mmu.c     | 12 ++++++++----
 6 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index a02a1929f5a1..bd702401216c 100644
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
index 55341762b9d9..973f8ded23e9 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -167,6 +167,7 @@ extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
 extern int ivpu_sched_mode;
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

