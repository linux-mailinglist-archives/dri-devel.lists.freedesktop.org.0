Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A840AD0041
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 12:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34E410E029;
	Fri,  6 Jun 2025 10:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YdWL7pSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4885710EA3D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749205118;
 bh=6Fe2JhzbOM/bvF9JeO3HDeqiPf29i3BTWdDD9M7m6+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YdWL7pSP8kv9SHphSjcO9OMGMI5tkuLgjGN0vF6lOUxX4FkS78scLn21pfPjaq7Te
 ob75NSFeG4K9/SOHTUQcA/ZpNShk6fU1+t++YxHTOAc8Y476xxBEj940GXy6YOJW2h
 gKLhCuC+JJTaBTnITubNJOdhVSdM/pKdvnJ/CwPC5xplSZTXsiJrqWRIPXg5H7Orwc
 YdWm4GWVvKr3fjwW4N+tEqQlyBw4FWBBfVLnbS1yA3dw9dnP+qAbPSocr+N4NIjLCG
 tqewZjiVhb5l6HvUNjPHicw/04xZw6+p/1bqbSi7hq2JM++/OSN2vxW9ogF9wicxFc
 7fyI0122PLcmw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DD7417E0FA8;
 Fri,  6 Jun 2025 12:18:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com
Subject: [PATCH v5 1/2] drm/panthor: Add 64-bit and poll register accessors
Date: Fri,  6 Jun 2025 12:18:34 +0200
Message-ID: <20250606101835.41840-2-boris.brezillon@collabora.com>
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

This patch adds 64-bit register accessors to simplify register access in
Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.

This patch also updates Panthor to use the new 64-bit accessors and poll
functions.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    |   4 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 159 +++++------------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |   2 -
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++---
 drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
 7 files changed, 124 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a4ce2a4c626d..4fc7cf2aeed5 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -455,4 +455,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 
 extern struct workqueue_struct *panthor_cleanup_wq;
 
+static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
+{
+	writel(data, ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
+{
+	return readl(ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return readl_relaxed(ptdev->iomem + reg);
+}
+
+static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
+{
+	gpu_write(ptdev, reg, lower_32_bits(data));
+	gpu_write(ptdev, reg + 4, upper_32_bits(data));
+}
+
+static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read_relaxed(ptdev, reg) |
+		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
+{
+	u32 lo, hi1, hi2;
+	do {
+		hi1 = gpu_read(ptdev, reg + 4);
+		lo = gpu_read(ptdev, reg);
+		hi2 = gpu_read(ptdev, reg + 4);
+	} while (hi1 != hi2);
+	return lo | ((u64)hi2 << 32);
+}
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				     timeout_us)				\
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				       timeout_us)				\
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us,	\
+					     timeout_us)			\
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
+				 timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,		\
+					timeout_us)				\
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
+			  false, dev, reg)
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 3b4c35ce4461..4517eb1e3a94 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -772,8 +772,8 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 #else
 	arg->timestamp_frequency = 0;
 #endif
-	arg->current_timestamp = panthor_gpu_read_timestamp(ptdev);
-	arg->timestamp_offset = panthor_gpu_read_timestamp_offset(ptdev);
+	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
+	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
 
 	pm_runtime_put(ptdev->base.dev);
 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 7bc38e635329..36f1034839c2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1063,8 +1063,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 	u32 status;
 
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-			       status == MCU_STATUS_DISABLED, 10, 100000))
+	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
@@ -1089,8 +1089,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000)) {
+		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+					   status == MCU_STATUS_HALT, 10,
+					   100000)) {
 			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 32d678a0114e..fa8420f80635 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
-	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -154,8 +149,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
-			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -246,45 +240,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				u32 pwroff_reg, u32 pwrtrans_reg,
 				u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwroff_reg, mask);
+	gpu_write64(ptdev, pwroff_reg, mask);
 
-	if (mask >> 32)
-		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
 	return 0;
@@ -307,45 +283,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 			       u32 pwron_reg, u32 pwrtrans_reg,
 			       u32 rdy_reg, u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwron_reg, mask);
+	gpu_write64(ptdev, pwron_reg, mask);
 
-	if (mask >> 32)
-		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
-						 val, (mask32 & val) == mask32,
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
+			blk_name, mask);
+		return ret;
 	}
 
 	return 0;
@@ -494,49 +451,3 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_gpu_l2_power_on(ptdev);
 }
 
-/**
- * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
- * @ptdev: Device.
- * @reg: The offset of the register to read.
- *
- * Return: The counter value.
- */
-static u64
-panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
-{
-	u32 hi, lo;
-
-	do {
-		hi = gpu_read(ptdev, reg + 0x4);
-		lo = gpu_read(ptdev, reg);
-	} while (hi != gpu_read(ptdev, reg + 0x4));
-
-	return ((u64)hi << 32) | lo;
-}
-
-/**
- * panthor_gpu_read_timestamp() - Read the timestamp register.
- * @ptdev: Device.
- *
- * Return: The GPU timestamp value.
- */
-u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
-{
-	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
-}
-
-/**
- * panthor_gpu_read_timestamp_offset() - Read the timestamp offset register.
- * @ptdev: Device.
- *
- * Return: The GPU timestamp offset value.
- */
-u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
-{
-	u32 hi, lo;
-
-	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
-	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
-
-	return ((u64)hi << 32) | lo;
-}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7f6133a66127..53abdc7839a6 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -50,7 +50,5 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
 int panthor_gpu_soft_reset(struct panthor_device *ptdev);
-u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev);
-u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev);
 
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4ae72b211793..2fb99804645d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	/* Wait for the MMU status to indicate there is no active command, in
 	 * case one is pending.
 	 */
-	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
-						val, !(val & AS_STATUS_AS_ACTIVE),
-						10, 100000);
+	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
+						   !(val & AS_STATUS_AS_ACTIVE),
+						   10, 100000);
 
 	if (ret) {
 		panthor_device_schedule_reset(ptdev);
@@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
-	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
+	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1681,8 +1670,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index a7a323dc5cf9..ce670a8b53a7 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -230,10 +230,4 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0
 
-#define gpu_write(dev, reg, data) \
-	writel(data, (dev)->iomem + (reg))
-
-#define gpu_read(dev, reg) \
-	readl((dev)->iomem + (reg))
-
 #endif
-- 
2.49.0

