Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA37AD0043
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 12:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B71210EA3F;
	Fri,  6 Jun 2025 10:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Ty5lZLr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4834710EA31
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749205119;
 bh=a+EsI82mHbvvmnTBVeeYKQ4LLJKeBi58DeBQSliDaWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ty5lZLr2sgeO+QE+D5VlwMFst4VeXOMfhNfJIMt774ioI08vXSyrH2k7NDXBO2mTJ
 zn5L/4yqzmhLAK/8F6sFwufRP/J5R3hZKCpu41pBoWVj7aDxZDkO//fRkCrIFB8f3h
 mYJWMtDz50nkO6qshjtb8YdT+96t0sa+IvTah5ER+p7F/p4qZR6f76QJupFltBNUfC
 jbQY3abTkceKhPMwPGhbjidDg41r/unPy1YD5HxHzbgaZ5MVzw3ioyfDGPiqbfjqXC
 T/Byu6BOQ4AmN4cEwLHg/uCi4fTjcsBw81W/tZDcIDdHi9patKbHZkviWn9ZaXPUmv
 JKYJCW41rRz3g==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0399217E101A;
 Fri,  6 Jun 2025 12:18:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com
Subject: [PATCH v5 2/2] drm/panthor: Clean up 64-bit register definitions
Date: Fri,  6 Jun 2025 12:18:35 +0200
Message-ID: <20250606101835.41840-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606101835.41840-1-boris.brezillon@collabora.com>
References: <20250606101835.41840-1-boris.brezillon@collabora.com>
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

From: Karunika Choo <karunika.choo@arm.com>

With the introduction of 64-bit register accessors, the separate *_HI
definitions are no longer necessary. This change removes them and
renames the corresponding *_LO entries for cleaner and more consistent
register definitions.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c  |  4 +-
 drivers/gpu/drm/panthor/panthor_gpu.c  |  8 +--
 drivers/gpu/drm/panthor/panthor_gpu.h  | 10 +--
 drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++---
 drivers/gpu/drm/panthor/panthor_regs.h | 84 +++++++++-----------------
 5 files changed, 47 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 4517eb1e3a94..1116f2d2826e 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -772,8 +772,8 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 #else
 	arg->timestamp_frequency = 0;
 #endif
-	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
-	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
+	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP);
+	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET);
 
 	pm_runtime_put(ptdev->base.dev);
 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index fa8420f80635..534735518824 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,9 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -149,7 +149,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 53abdc7839a6..7c17a8c06858 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -30,9 +30,9 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_on(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_on(ptdev, #type, \
-				  type ## _PWRON_LO, \
-				  type ## _PWRTRANS_LO, \
-				  type ## _READY_LO, \
+				  type ## _PWRON, \
+				  type ## _PWRTRANS, \
+				  type ## _READY, \
 				  mask, timeout_us)
 
 /**
@@ -42,8 +42,8 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_off(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_off(ptdev, #type, \
-				   type ## _PWROFF_LO, \
-				   type ## _PWRTRANS_LO, \
+				   type ## _PWROFF, \
+				   type ## _PWRTRANS, \
 				   mask, timeout_us)
 
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 2fb99804645d..b39ea6acc6a9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -564,7 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
+	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -614,9 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -629,9 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1670,7 +1670,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index ce670a8b53a7..48bbfd40138c 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -63,20 +63,16 @@
 #define   GPU_STATUS_DBG_ENABLED			BIT(8)
 
 #define GPU_FAULT_STATUS				0x3C
-#define GPU_FAULT_ADDR_LO				0x40
-#define GPU_FAULT_ADDR_HI				0x44
+#define GPU_FAULT_ADDR					0x40
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
-#define GPU_TIMESTAMP_OFFSET_LO				0x88
-#define GPU_TIMESTAMP_OFFSET_HI				0x8C
-#define GPU_CYCLE_COUNT_LO				0x90
-#define GPU_CYCLE_COUNT_HI				0x94
-#define GPU_TIMESTAMP_LO				0x98
-#define GPU_TIMESTAMP_HI				0x9C
+#define GPU_TIMESTAMP_OFFSET				0x88
+#define GPU_CYCLE_COUNT					0x90
+#define GPU_TIMESTAMP					0x98
 
 #define GPU_THREAD_MAX_THREADS				0xA0
 #define GPU_THREAD_MAX_WORKGROUP_SIZE			0xA4
@@ -85,47 +81,29 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
-#define GPU_SHADER_PRESENT_LO				0x100
-#define GPU_SHADER_PRESENT_HI				0x104
-#define GPU_TILER_PRESENT_LO				0x110
-#define GPU_TILER_PRESENT_HI				0x114
-#define GPU_L2_PRESENT_LO				0x120
-#define GPU_L2_PRESENT_HI				0x124
+#define GPU_SHADER_PRESENT				0x100
+#define GPU_TILER_PRESENT				0x110
+#define GPU_L2_PRESENT					0x120
 
-#define SHADER_READY_LO					0x140
-#define SHADER_READY_HI					0x144
-#define TILER_READY_LO					0x150
-#define TILER_READY_HI					0x154
-#define L2_READY_LO					0x160
-#define L2_READY_HI					0x164
+#define SHADER_READY					0x140
+#define TILER_READY					0x150
+#define L2_READY					0x160
 
-#define SHADER_PWRON_LO					0x180
-#define SHADER_PWRON_HI					0x184
-#define TILER_PWRON_LO					0x190
-#define TILER_PWRON_HI					0x194
-#define L2_PWRON_LO					0x1A0
-#define L2_PWRON_HI					0x1A4
+#define SHADER_PWRON					0x180
+#define TILER_PWRON					0x190
+#define L2_PWRON					0x1A0
 
-#define SHADER_PWROFF_LO				0x1C0
-#define SHADER_PWROFF_HI				0x1C4
-#define TILER_PWROFF_LO					0x1D0
-#define TILER_PWROFF_HI					0x1D4
-#define L2_PWROFF_LO					0x1E0
-#define L2_PWROFF_HI					0x1E4
+#define SHADER_PWROFF					0x1C0
+#define TILER_PWROFF					0x1D0
+#define L2_PWROFF					0x1E0
 
-#define SHADER_PWRTRANS_LO				0x200
-#define SHADER_PWRTRANS_HI				0x204
-#define TILER_PWRTRANS_LO				0x210
-#define TILER_PWRTRANS_HI				0x214
-#define L2_PWRTRANS_LO					0x220
-#define L2_PWRTRANS_HI					0x224
+#define SHADER_PWRTRANS					0x200
+#define TILER_PWRTRANS					0x210
+#define L2_PWRTRANS					0x220
 
-#define SHADER_PWRACTIVE_LO				0x240
-#define SHADER_PWRACTIVE_HI				0x244
-#define TILER_PWRACTIVE_LO				0x250
-#define TILER_PWRACTIVE_HI				0x254
-#define L2_PWRACTIVE_LO					0x260
-#define L2_PWRACTIVE_HI					0x264
+#define SHADER_PWRACTIVE				0x240
+#define TILER_PWRACTIVE					0x250
+#define L2_PWRACTIVE					0x260
 
 #define GPU_REVID					0x280
 
@@ -168,10 +146,8 @@
 #define MMU_AS_SHIFT					6
 #define MMU_AS(as)					(MMU_BASE + ((as) << MMU_AS_SHIFT))
 
-#define AS_TRANSTAB_LO(as)				(MMU_AS(as) + 0x0)
-#define AS_TRANSTAB_HI(as)				(MMU_AS(as) + 0x4)
-#define AS_MEMATTR_LO(as)				(MMU_AS(as) + 0x8)
-#define AS_MEMATTR_HI(as)				(MMU_AS(as) + 0xC)
+#define AS_TRANSTAB(as)					(MMU_AS(as) + 0x0)
+#define AS_MEMATTR(as)					(MMU_AS(as) + 0x8)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
 							 ((w) ? BIT(0) : 0) | \
@@ -183,8 +159,7 @@
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
 #define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
-#define AS_LOCKADDR_LO(as)				(MMU_AS(as) + 0x10)
-#define AS_LOCKADDR_HI(as)				(MMU_AS(as) + 0x14)
+#define AS_LOCKADDR(as)					(MMU_AS(as) + 0x10)
 #define AS_COMMAND(as)					(MMU_AS(as) + 0x18)
 #define   AS_COMMAND_NOP				0
 #define   AS_COMMAND_UPDATE				1
@@ -199,12 +174,10 @@
 #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
-#define AS_FAULTADDRESS_LO(as)				(MMU_AS(as) + 0x20)
-#define AS_FAULTADDRESS_HI(as)				(MMU_AS(as) + 0x24)
+#define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
 #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
 #define   AS_STATUS_AS_ACTIVE				BIT(0)
-#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
-#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
+#define AS_TRANSCFG(as)					(MMU_AS(as) + 0x30)
 #define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
 #define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
 #define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
@@ -222,8 +195,7 @@
 #define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
 #define   AS_TRANSCFG_WXN				BIT(35)
 #define   AS_TRANSCFG_XREADABLE				BIT(36)
-#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
-#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
+#define AS_FAULTEXTRA(as)				(MMU_AS(as) + 0x38)
 
 #define CSF_GPU_LATEST_FLUSH_ID				0x10000
 
-- 
2.49.0

