Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9628BF3370
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 21:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EE410E4CF;
	Mon, 20 Oct 2025 19:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NYRMMdpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CD910E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:33:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B6F941771;
 Mon, 20 Oct 2025 19:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7A3C116C6;
 Mon, 20 Oct 2025 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760988824;
 bh=9mNcYrJKHaWVZMLwbiBJLCyNxJTAx21MX6bq40CjnJ8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NYRMMdpK4mhmZ++JXnqOlZ8nLSNqVdJA6JZ0Reu/619lv9vXl8WV2ZToT3fWWRCcZ
 2LrXPBRpxAzvm5Qsn+NRYdS0lHwamluDeY4zuO6LRgC9PP45bSBAJtH9A65CbnKGqT
 oMGxjQYkCcvYxbf8nPTDo5gilOtea9hm8XMyqIYZ2ox8fV8dvYtKnA+Cz6hkBm9JBE
 5CEzp54gpGubnzEwDe2w31mSAOWjkkyQw6AaaZoiTH7PHFIBp8rF9xgiLrQ1fwgHCf
 wPT9ITkAp4QefFrUqSdLSSQkH+JAsz6BZ0Ce62WL3LAnsol60M9syeUxZxmwW34Z/K
 lzJPeh7MTD27A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 20 Oct 2025 14:33:28 -0500
Subject: [PATCH v6 2/2] accel: Add Arm Ethos-U NPU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-ethos-v6-2-ecebc383c4b7@kernel.org>
References: <20251020-ethos-v6-0-ecebc383c4b7@kernel.org>
In-Reply-To: <20251020-ethos-v6-0-ecebc383c4b7@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.15-dev
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

Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
relatively simple interface with single command stream to describe
buffers, operation settings, and network operations. It supports up to 8
memory regions (though no h/w bounds on a region). The Ethos NPUs
are designed to use an SRAM for scratch memory. Region 2 is reserved
for SRAM (like the downstream driver stack and compiler). Userspace
doesn't need access to the SRAM.

The h/w has no MMU nor external IOMMU and is a DMA engine which can
read and write anywhere in memory without h/w bounds checks. The user
submitted command streams must be validated against the bounds of the
GEM BOs. This is similar to the VC4 design which validates shaders.

The job submit is based on the rocket driver for the Rockchip NPU
utilizing the GPU scheduler. It is simpler as there's only 1 core rather
than 3.

Tested on i.MX93 platform (U65) and FVP (U85) with Mesa Teflon
support.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v6:
- Rework job submit to avoid potential deadlocks with allocations/reclaim
  in the fence signaling paths. ethosu_acquire_object_fences() and the job
  done_fence allocation are moved earlier. The runtime-pm resume now before
  the job is pushed and autosuspend is done when the job is freed.
- Drop unused ethosu_job_is_idle()

v5:
- Rework Runtime PM init in probe
- Use __free() cleanups where possible
- Use devm_mutex_init()
- Handle U85 NPU_SET_WEIGHT2_BASE and NPU_SET_WEIGHT2_LENGTH

v4:
- Use bulk clk API
- Various whitespace fixes mostly due to ethos->ethosu rename
- Drop error check on dma_set_mask_and_coherent()
- Drop unnecessary pm_runtime_mark_last_busy() call
- Move variable declarations out of switch (a riscv/clang build failure)
- Use lowercase hex in all defines
- Drop unused ethosu_device.coherent member
- Add comments on all locks

v3:
 - Rework and improve job submit validation
 - Rename ethos to ethosu. There was an Ethos-Nxx that's unrelated.
 - Add missing init for sched_lock mutex
 - Drop some prints to debug level
 - Fix i.MX93 SRAM accesses (AXI config)
 - Add U85 AXI configuration
 - Print the current cmd value on timeout

v2:
 - Rebase on v6.17-rc1 adapting to scheduler changes
 - scheduler: Drop the reset workqueue. According to the scheduler docs,
   we don't need it since we have a single h/w queue.
 - scheduler: Rework the timeout handling to continue running if we are
   making progress.
 - Reset the NPU on resume so it's in a known state
 - Add error handling on clk_get() calls
 - Fix drm_mm splat on module unload. We were missing a put on the
   cmdstream BO in the scheduler clean-up.
 - Fix 0-day report needing explicit bitfield.h include
---
 MAINTAINERS                          |   9 +
 drivers/accel/Kconfig                |   1 +
 drivers/accel/Makefile               |   1 +
 drivers/accel/ethosu/Kconfig         |  10 +
 drivers/accel/ethosu/Makefile        |   4 +
 drivers/accel/ethosu/ethosu_device.h | 195 ++++++++++
 drivers/accel/ethosu/ethosu_drv.c    | 403 ++++++++++++++++++++
 drivers/accel/ethosu/ethosu_drv.h    |  15 +
 drivers/accel/ethosu/ethosu_gem.c    | 704 +++++++++++++++++++++++++++++++++++
 drivers/accel/ethosu/ethosu_gem.h    |  46 +++
 drivers/accel/ethosu/ethosu_job.c    | 496 ++++++++++++++++++++++++
 drivers/accel/ethosu/ethosu_job.h    |  40 ++
 include/uapi/drm/ethosu_accel.h      | 261 +++++++++++++
 13 files changed, 2185 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..9b4642830b51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2017,6 +2017,15 @@ F:	arch/arm64/include/asm/arch_timer.h
 F:	drivers/clocksource/arm_arch_timer.c
 F:	drivers/clocksource/arm_arch_timer_mmio.c
 
+ARM ETHOS-U NPU DRIVER
+M:	Rob Herring (Arm) <robh@kernel.org>
+M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/accel/ethosu/
+F:	include/uapi/drm/ethosu_accel.h
+
 ARM GENERIC INTERRUPT CONTROLLER DRIVERS
 M:	Marc Zyngier <maz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bb01cebc42bf..bdf48ccafcf2 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
 	  and debugfs).
 
 source "drivers/accel/amdxdna/Kconfig"
+source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index ffc3fa588666..1d3a7251b950 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
+obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
diff --git a/drivers/accel/ethosu/Kconfig b/drivers/accel/ethosu/Kconfig
new file mode 100644
index 000000000000..bd762c2c21ce
--- /dev/null
+++ b/drivers/accel/ethosu/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_ARM_ETHOSU
+	tristate "Arm Ethos-U65/U85 NPU"
+	depends on HAS_IOMEM
+	depends on DRM_ACCEL
+	select DRM_GEM_DMA_HELPER
+	select DRM_SCHED
+	help
+	  Enables driver for Arm Ethos-U65/U85 NPUs
diff --git a/drivers/accel/ethosu/Makefile b/drivers/accel/ethosu/Makefile
new file mode 100644
index 000000000000..17db5a600416
--- /dev/null
+++ b/drivers/accel/ethosu/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU) := ethosu.o
+ethosu-y += ethosu_drv.o ethosu_gem.o ethosu_job.o
diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
new file mode 100644
index 000000000000..b5e1509b403d
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0-only or MIT */
+/* Copyright 2025 Arm, Ltd. */
+
+#ifndef __ETHOSU_DEVICE_H__
+#define __ETHOSU_DEVICE_H__
+
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
+
+#include <drm/ethosu_accel.h>
+
+struct clk;
+struct gen_pool;
+
+#define NPU_REG_ID		0x0000
+#define NPU_REG_STATUS		0x0004
+#define NPU_REG_CMD		0x0008
+#define NPU_REG_RESET		0x000c
+#define NPU_REG_QBASE		0x0010
+#define NPU_REG_QBASE_HI	0x0014
+#define NPU_REG_QREAD		0x0018
+#define NPU_REG_QCONFIG		0x001c
+#define NPU_REG_QSIZE		0x0020
+#define NPU_REG_PROT		0x0024
+#define NPU_REG_CONFIG		0x0028
+#define NPU_REG_REGIONCFG	0x003c
+#define NPU_REG_AXILIMIT0	0x0040		// U65
+#define NPU_REG_AXILIMIT1	0x0044		// U65
+#define NPU_REG_AXILIMIT2	0x0048		// U65
+#define NPU_REG_AXILIMIT3	0x004c		// U65
+#define NPU_REG_MEM_ATTR0	0x0040		// U85
+#define NPU_REG_MEM_ATTR1	0x0044		// U85
+#define NPU_REG_MEM_ATTR2	0x0048		// U85
+#define NPU_REG_MEM_ATTR3	0x004c		// U85
+#define NPU_REG_AXI_SRAM	0x0050		// U85
+#define NPU_REG_AXI_EXT		0x0054		// U85
+
+#define NPU_REG_BASEP(x)	(0x0080 + (x) * 8)
+#define NPU_REG_BASEP_HI(x)	(0x0084 + (x) * 8)
+#define NPU_BASEP_REGION_MAX	8
+
+#define ID_ARCH_MAJOR_MASK	GENMASK(31, 28)
+#define ID_ARCH_MINOR_MASK	GENMASK(27, 20)
+#define ID_ARCH_PATCH_MASK	GENMASK(19, 16)
+#define ID_VER_MAJOR_MASK	GENMASK(11, 8)
+#define ID_VER_MINOR_MASK	GENMASK(7, 4)
+
+#define CONFIG_MACS_PER_CC_MASK	GENMASK(3, 0)
+#define CONFIG_CMD_STREAM_VER_MASK	GENMASK(7, 4)
+
+#define STATUS_STATE_RUNNING	BIT(0)
+#define STATUS_IRQ_RAISED	BIT(1)
+#define STATUS_BUS_STATUS	BIT(2)
+#define STATUS_RESET_STATUS	BIT(3)
+#define STATUS_CMD_PARSE_ERR	BIT(4)
+#define STATUS_CMD_END_REACHED	BIT(5)
+
+#define CMD_CLEAR_IRQ		BIT(1)
+#define CMD_TRANSITION_TO_RUN	BIT(0)
+
+#define RESET_PENDING_CSL	BIT(1)
+#define RESET_PENDING_CPL	BIT(0)
+
+#define PROT_ACTIVE_CSL		BIT(1)
+
+enum ethosu_cmds {
+	NPU_OP_CONV = 0x2,
+	NPU_OP_DEPTHWISE = 0x3,
+	NPU_OP_POOL = 0x5,
+	NPU_OP_ELEMENTWISE = 0x6,
+	NPU_OP_RESIZE = 0x7,	// U85 only
+	NPU_OP_DMA_START = 0x10,
+	NPU_SET_IFM_PAD_TOP = 0x100,
+	NPU_SET_IFM_PAD_LEFT = 0x101,
+	NPU_SET_IFM_PAD_RIGHT = 0x102,
+	NPU_SET_IFM_PAD_BOTTOM = 0x103,
+	NPU_SET_IFM_DEPTH_M1 = 0x104,
+	NPU_SET_IFM_PRECISION = 0x105,
+	NPU_SET_IFM_BROADCAST = 0x108,
+	NPU_SET_IFM_WIDTH0_M1 = 0x10a,
+	NPU_SET_IFM_HEIGHT0_M1 = 0x10b,
+	NPU_SET_IFM_HEIGHT1_M1 = 0x10c,
+	NPU_SET_IFM_REGION = 0x10f,
+	NPU_SET_OFM_WIDTH_M1 = 0x111,
+	NPU_SET_OFM_HEIGHT_M1 = 0x112,
+	NPU_SET_OFM_DEPTH_M1 = 0x113,
+	NPU_SET_OFM_PRECISION = 0x114,
+	NPU_SET_OFM_WIDTH0_M1 = 0x11a,
+	NPU_SET_OFM_HEIGHT0_M1 = 0x11b,
+	NPU_SET_OFM_HEIGHT1_M1 = 0x11c,
+	NPU_SET_OFM_REGION = 0x11f,
+	NPU_SET_KERNEL_WIDTH_M1 = 0x120,
+	NPU_SET_KERNEL_HEIGHT_M1 = 0x121,
+	NPU_SET_KERNEL_STRIDE = 0x122,
+	NPU_SET_WEIGHT_REGION = 0x128,
+	NPU_SET_SCALE_REGION = 0x129,
+	NPU_SET_DMA0_SRC_REGION = 0x130,
+	NPU_SET_DMA0_DST_REGION = 0x131,
+	NPU_SET_DMA0_SIZE0 = 0x132,
+	NPU_SET_DMA0_SIZE1 = 0x133,
+	NPU_SET_IFM2_BROADCAST = 0x180,
+	NPU_SET_IFM2_PRECISION = 0x185,
+	NPU_SET_IFM2_WIDTH0_M1 = 0x18a,
+	NPU_SET_IFM2_HEIGHT0_M1 = 0x18b,
+	NPU_SET_IFM2_HEIGHT1_M1 = 0x18c,
+	NPU_SET_IFM2_REGION = 0x18f,
+	NPU_SET_IFM_BASE0 = 0x4000,
+	NPU_SET_IFM_BASE1 = 0x4001,
+	NPU_SET_IFM_BASE2 = 0x4002,
+	NPU_SET_IFM_BASE3 = 0x4003,
+	NPU_SET_IFM_STRIDE_X = 0x4004,
+	NPU_SET_IFM_STRIDE_Y = 0x4005,
+	NPU_SET_IFM_STRIDE_C = 0x4006,
+	NPU_SET_OFM_BASE0 = 0x4010,
+	NPU_SET_OFM_BASE1 = 0x4011,
+	NPU_SET_OFM_BASE2 = 0x4012,
+	NPU_SET_OFM_BASE3 = 0x4013,
+	NPU_SET_OFM_STRIDE_X = 0x4014,
+	NPU_SET_OFM_STRIDE_Y = 0x4015,
+	NPU_SET_OFM_STRIDE_C = 0x4016,
+	NPU_SET_WEIGHT_BASE = 0x4020,
+	NPU_SET_WEIGHT_LENGTH = 0x4021,
+	NPU_SET_SCALE_BASE = 0x4022,
+	NPU_SET_SCALE_LENGTH = 0x4023,
+	NPU_SET_DMA0_SRC = 0x4030,
+	NPU_SET_DMA0_DST = 0x4031,
+	NPU_SET_DMA0_LEN = 0x4032,
+	NPU_SET_DMA0_SRC_STRIDE0 = 0x4033,
+	NPU_SET_DMA0_SRC_STRIDE1 = 0x4034,
+	NPU_SET_DMA0_DST_STRIDE0 = 0x4035,
+	NPU_SET_DMA0_DST_STRIDE1 = 0x4036,
+	NPU_SET_IFM2_BASE0 = 0x4080,
+	NPU_SET_IFM2_BASE1 = 0x4081,
+	NPU_SET_IFM2_BASE2 = 0x4082,
+	NPU_SET_IFM2_BASE3 = 0x4083,
+	NPU_SET_IFM2_STRIDE_X = 0x4084,
+	NPU_SET_IFM2_STRIDE_Y = 0x4085,
+	NPU_SET_IFM2_STRIDE_C = 0x4086,
+	NPU_SET_WEIGHT1_BASE = 0x4090,
+	NPU_SET_WEIGHT1_LENGTH = 0x4091,
+	NPU_SET_SCALE1_BASE = 0x4092,
+	NPU_SET_WEIGHT2_BASE = 0x4092,
+	NPU_SET_SCALE1_LENGTH = 0x4093,
+	NPU_SET_WEIGHT2_LENGTH = 0x4093,
+	NPU_SET_WEIGHT3_BASE = 0x4094,
+	NPU_SET_WEIGHT3_LENGTH = 0x4095,
+};
+
+#define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
+
+/**
+ * struct ethosu_device - Ethosu device
+ */
+struct ethosu_device {
+	/** @base: Base drm_device. */
+	struct drm_device base;
+
+	/** @iomem: CPU mapping of the registers. */
+	void __iomem *regs;
+
+	void __iomem *sram;
+	struct gen_pool *srampool;
+	dma_addr_t sramphys;
+
+	struct clk_bulk_data *clks;
+	int num_clks;
+	int irq;
+
+	struct drm_ethosu_npu_info npu_info;
+
+	struct ethosu_job *in_flight_job;
+	/* For in_flight_job and ethosu_job_hw_submit() */
+	struct mutex job_lock;
+
+	/* For dma_fence */
+	spinlock_t fence_lock;
+
+	struct drm_gpu_scheduler sched;
+	/* For ethosu_job_do_push() */
+	struct mutex sched_lock;
+	u64 fence_context;
+	u64 emit_seqno;
+};
+
+#define to_ethosu_device(drm_dev) \
+	((struct ethosu_device *)container_of(drm_dev, struct ethosu_device, base))
+
+static inline bool ethosu_is_u65(const struct ethosu_device *ethosudev)
+{
+	return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
+}
+
+#endif
diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
new file mode 100644
index 000000000000..e05a69bf5574
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+// Copyright (C) 2025 Arm, Ltd.
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/genalloc.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_utils.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_accel.h>
+#include <drm/ethosu_accel.h>
+
+#include "ethosu_drv.h"
+#include "ethosu_device.h"
+#include "ethosu_gem.h"
+#include "ethosu_job.h"
+
+static int ethosu_ioctl_dev_query(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct ethosu_device *ethosudev = to_ethosu_device(ddev);
+	struct drm_ethosu_dev_query *args = data;
+
+	if (!args->pointer) {
+		switch (args->type) {
+		case DRM_ETHOSU_DEV_QUERY_NPU_INFO:
+			args->size = sizeof(ethosudev->npu_info);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->type) {
+	case DRM_ETHOSU_DEV_QUERY_NPU_INFO:
+		if (args->size < offsetofend(struct drm_ethosu_npu_info, sram_size))
+			return -EINVAL;
+		return copy_struct_to_user(u64_to_user_ptr(args->pointer),
+					   args->size,
+					   &ethosudev->npu_info,
+					   sizeof(ethosudev->npu_info), NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+#define ETHOSU_BO_FLAGS		DRM_ETHOSU_BO_NO_MMAP
+
+static int ethosu_ioctl_bo_create(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_ethosu_bo_create *args = data;
+	int cookie, ret;
+
+	if (!drm_dev_enter(ddev, &cookie))
+		return -ENODEV;
+
+	if (!args->size || (args->flags & ~ETHOSU_BO_FLAGS)) {
+		ret = -EINVAL;
+		goto out_dev_exit;
+	}
+
+	ret = ethosu_gem_create_with_handle(file, ddev, &args->size,
+					    args->flags, &args->handle);
+
+out_dev_exit:
+	drm_dev_exit(cookie);
+	return ret;
+}
+
+static int ethosu_ioctl_bo_wait(struct drm_device *ddev, void *data,
+				struct drm_file *file)
+{
+	struct drm_ethosu_bo_wait *args = data;
+	int cookie, ret;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (!drm_dev_enter(ddev, &cookie))
+		return -ENODEV;
+
+	ret = drm_gem_dma_resv_wait(file, args->handle, true, timeout);
+
+	drm_dev_exit(cookie);
+	return ret;
+}
+
+static int ethosu_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
+				       struct drm_file *file)
+{
+	struct drm_ethosu_bo_mmap_offset *args = data;
+	struct drm_gem_object *obj;
+
+	if (args->pad)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
+	drm_gem_object_put(obj);
+	return 0;
+}
+
+static int ethosu_ioctl_cmdstream_bo_create(struct drm_device *ddev, void *data,
+					    struct drm_file *file)
+{
+	struct drm_ethosu_cmdstream_bo_create *args = data;
+	int cookie, ret;
+
+	if (!drm_dev_enter(ddev, &cookie))
+		return -ENODEV;
+
+	if (!args->size || !args->data || args->pad || args->flags) {
+		ret = -EINVAL;
+		goto out_dev_exit;
+	}
+
+	args->flags |= DRM_ETHOSU_BO_NO_MMAP;
+
+	ret = ethosu_gem_cmdstream_create(file, ddev, args->size, args->data,
+					  args->flags, &args->handle);
+
+out_dev_exit:
+	drm_dev_exit(cookie);
+	return ret;
+}
+
+static int ethosu_open(struct drm_device *ddev, struct drm_file *file)
+{
+	int ret = 0;
+
+	if (!try_module_get(THIS_MODULE))
+		return -EINVAL;
+
+	struct ethosu_file_priv __free(kfree) *priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err_put_mod;
+	}
+	priv->edev = to_ethosu_device(ddev);
+
+	ret = ethosu_job_open(priv);
+	if (ret)
+		goto err_put_mod;
+
+	file->driver_priv = no_free_ptr(priv);
+	return 0;
+
+err_put_mod:
+	module_put(THIS_MODULE);
+	return ret;
+}
+
+static void ethosu_postclose(struct drm_device *ddev, struct drm_file *file)
+{
+	ethosu_job_close(file->driver_priv);
+	kfree(file->driver_priv);
+	module_put(THIS_MODULE);
+}
+
+static const struct drm_ioctl_desc ethosu_drm_driver_ioctls[] = {
+#define ETHOSU_IOCTL(n, func, flags) \
+	DRM_IOCTL_DEF_DRV(ETHOSU_##n, ethosu_ioctl_##func, flags)
+
+	ETHOSU_IOCTL(DEV_QUERY, dev_query, 0),
+	ETHOSU_IOCTL(BO_CREATE, bo_create, 0),
+	ETHOSU_IOCTL(BO_WAIT, bo_wait, 0),
+	ETHOSU_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset, 0),
+	ETHOSU_IOCTL(CMDSTREAM_BO_CREATE, cmdstream_bo_create, 0),
+	ETHOSU_IOCTL(SUBMIT, submit, 0),
+};
+
+DEFINE_DRM_ACCEL_FOPS(ethosu_drm_driver_fops);
+
+/*
+ * Ethosu driver version:
+ * - 1.0 - initial interface
+ */
+static const struct drm_driver ethosu_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
+	.open = ethosu_open,
+	.postclose = ethosu_postclose,
+	.ioctls = ethosu_drm_driver_ioctls,
+	.num_ioctls = ARRAY_SIZE(ethosu_drm_driver_ioctls),
+	.fops = &ethosu_drm_driver_fops,
+	.name = "ethosu",
+	.desc = "Arm Ethos-U Accel driver",
+	.major = 1,
+	.minor = 0,
+
+	.gem_create_object = ethosu_gem_create_object,
+};
+
+#define U65_DRAM_AXI_LIMIT_CFG	0x1f3f0002
+#define U65_SRAM_AXI_LIMIT_CFG	0x1f3f00b0
+#define U85_AXI_EXT_CFG		0x00021f3f
+#define U85_AXI_SRAM_CFG	0x00021f3f
+#define U85_MEM_ATTR0_CFG	0x00000000
+#define U85_MEM_ATTR2_CFG	0x000000b7
+
+static int ethosu_reset(struct ethosu_device *ethosudev)
+{
+	int ret;
+	u32 reg;
+
+	writel_relaxed(RESET_PENDING_CSL, ethosudev->regs + NPU_REG_RESET);
+	ret = readl_poll_timeout(ethosudev->regs + NPU_REG_STATUS, reg,
+				 !FIELD_GET(STATUS_RESET_STATUS, reg),
+				 USEC_PER_MSEC, USEC_PER_SEC);
+	if (ret)
+		return ret;
+
+	if (!FIELD_GET(PROT_ACTIVE_CSL, readl_relaxed(ethosudev->regs + NPU_REG_PROT))) {
+		dev_warn(ethosudev->base.dev, "Could not reset to non-secure mode (PROT = %x)\n",
+			 readl_relaxed(ethosudev->regs + NPU_REG_PROT));
+	}
+
+	/*
+	 * Assign region 2 (SRAM) to AXI M0 (AXILIMIT0),
+	 * everything else to AXI M1 (AXILIMIT2)
+	 */
+	writel_relaxed(0x0000aa8a, ethosudev->regs + NPU_REG_REGIONCFG);
+	if (ethosu_is_u65(ethosudev)) {
+		writel_relaxed(U65_SRAM_AXI_LIMIT_CFG, ethosudev->regs + NPU_REG_AXILIMIT0);
+		writel_relaxed(U65_DRAM_AXI_LIMIT_CFG, ethosudev->regs + NPU_REG_AXILIMIT2);
+	} else {
+		writel_relaxed(U85_AXI_SRAM_CFG, ethosudev->regs + NPU_REG_AXI_SRAM);
+		writel_relaxed(U85_AXI_EXT_CFG, ethosudev->regs + NPU_REG_AXI_EXT);
+		writel_relaxed(U85_MEM_ATTR0_CFG, ethosudev->regs + NPU_REG_MEM_ATTR0);	// SRAM
+		writel_relaxed(U85_MEM_ATTR2_CFG, ethosudev->regs + NPU_REG_MEM_ATTR2);	// DRAM
+	}
+
+	if (ethosudev->sram)
+		memset_io(ethosudev->sram, 0, ethosudev->npu_info.sram_size);
+
+	return 0;
+}
+
+static int ethosu_device_resume(struct device *dev)
+{
+	struct ethosu_device *ethosudev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(ethosudev->num_clks, ethosudev->clks);
+	if (ret)
+		return ret;
+
+	ret = ethosu_reset(ethosudev);
+	if (!ret)
+		return 0;
+
+	clk_bulk_disable_unprepare(ethosudev->num_clks, ethosudev->clks);
+	return ret;
+}
+
+static int ethosu_device_suspend(struct device *dev)
+{
+	struct ethosu_device *ethosudev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ethosudev->num_clks, ethosudev->clks);
+	return 0;
+}
+
+static int ethosu_sram_init(struct ethosu_device *ethosudev)
+{
+	ethosudev->npu_info.sram_size = 0;
+
+	ethosudev->srampool = of_gen_pool_get(ethosudev->base.dev->of_node, "sram", 0);
+	if (!ethosudev->srampool)
+		return 0;
+
+	ethosudev->npu_info.sram_size = gen_pool_size(ethosudev->srampool);
+
+	ethosudev->sram = (void __iomem *)gen_pool_dma_alloc(ethosudev->srampool,
+							     ethosudev->npu_info.sram_size,
+							     &ethosudev->sramphys);
+	if (!ethosudev->sram) {
+		dev_err(ethosudev->base.dev, "failed to allocate from SRAM pool\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int ethosu_init(struct ethosu_device *ethosudev)
+{
+	int ret;
+	u32 id, config;
+
+	ret = ethosu_device_resume(ethosudev->base.dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
+	pm_runtime_use_autosuspend(ethosudev->base.dev);
+	ret = devm_pm_runtime_set_active_enabled(ethosudev->base.dev);
+	if (ret)
+		return ret;
+	pm_runtime_get_noresume(ethosudev->base.dev);
+
+	ethosudev->npu_info.id = id = readl_relaxed(ethosudev->regs + NPU_REG_ID);
+	ethosudev->npu_info.config = config = readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);
+
+	ethosu_sram_init(ethosudev);
+
+	dev_info(ethosudev->base.dev,
+		 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
+		 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
+		 FIELD_GET(ID_ARCH_MINOR_MASK, id),
+		 FIELD_GET(ID_ARCH_PATCH_MASK, id),
+		 FIELD_GET(ID_VER_MAJOR_MASK, id),
+		 FIELD_GET(ID_VER_MINOR_MASK, id),
+		 FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
+		 1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config),
+		 ethosudev->npu_info.sram_size / 1024);
+
+	return 0;
+}
+
+static int ethosu_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct ethosu_device *ethosudev;
+
+	ethosudev = devm_drm_dev_alloc(&pdev->dev, &ethosu_drm_driver,
+				       struct ethosu_device, base);
+	if (IS_ERR(ethosudev))
+		return -ENOMEM;
+	platform_set_drvdata(pdev, ethosudev);
+
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
+
+	ethosudev->regs = devm_platform_ioremap_resource(pdev, 0);
+
+	ethosudev->num_clks = devm_clk_bulk_get_all(&pdev->dev, &ethosudev->clks);
+	if (ethosudev->num_clks < 0)
+		return ethosudev->num_clks;
+
+	ret = ethosu_job_init(ethosudev);
+	if (ret)
+		return ret;
+
+	ret = ethosu_init(ethosudev);
+	if (ret)
+		return ret;
+
+	ret = drm_dev_register(&ethosudev->base, 0);
+	if (ret)
+		pm_runtime_dont_use_autosuspend(ethosudev->base.dev);
+
+	pm_runtime_put_autosuspend(ethosudev->base.dev);
+	return ret;
+}
+
+static void ethosu_remove(struct platform_device *pdev)
+{
+	struct ethosu_device *ethosudev = dev_get_drvdata(&pdev->dev);
+
+	drm_dev_unregister(&ethosudev->base);
+	ethosu_job_fini(ethosudev);
+	if (ethosudev->sram)
+		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
+			      ethosudev->npu_info.sram_size);
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "arm,ethos-u65" },
+	{ .compatible = "arm,ethos-u85" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ethosu_pm_ops,
+				 ethosu_device_suspend,
+				 ethosu_device_resume,
+				 NULL);
+
+static struct platform_driver ethosu_driver = {
+	.probe = ethosu_probe,
+	.remove = ethosu_remove,
+	.driver = {
+		.name = "ethosu",
+		.pm = pm_ptr(&ethosu_pm_ops),
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(ethosu_driver);
+
+MODULE_AUTHOR("Rob Herring <robh@kernel.org>");
+MODULE_DESCRIPTION("Arm Ethos-U Accel Driver");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/accel/ethosu/ethosu_drv.h b/drivers/accel/ethosu/ethosu_drv.h
new file mode 100644
index 000000000000..9e21dfe94184
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_drv.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright 2025 Arm, Ltd. */
+#ifndef __ETHOSU_DRV_H__
+#define __ETHOSU_DRV_H__
+
+#include <drm/gpu_scheduler.h>
+
+struct ethosu_device;
+
+struct ethosu_file_priv {
+	struct ethosu_device *edev;
+	struct drm_sched_entity sched_entity;
+};
+
+#endif
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
new file mode 100644
index 000000000000..473b5f5d7514
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -0,0 +1,704 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/* Copyright 2025 Arm, Ltd. */
+
+#include <linux/err.h>
+#include <linux/slab.h>
+
+#include <drm/ethosu_accel.h>
+
+#include "ethosu_device.h"
+#include "ethosu_gem.h"
+
+static void ethosu_gem_free_object(struct drm_gem_object *obj)
+{
+	struct ethosu_gem_object *bo = to_ethosu_bo(obj);
+
+	kfree(bo->info);
+	drm_gem_free_mmap_offset(&bo->base.base);
+	drm_gem_dma_free(&bo->base);
+}
+
+static int ethosu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct ethosu_gem_object *bo = to_ethosu_bo(obj);
+
+	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
+	if (bo->flags & DRM_ETHOSU_BO_NO_MMAP)
+		return -EINVAL;
+
+	return drm_gem_dma_object_mmap(obj, vma);
+}
+
+static const struct drm_gem_object_funcs ethosu_gem_funcs = {
+	.free = ethosu_gem_free_object,
+	.print_info = drm_gem_dma_object_print_info,
+	.get_sg_table = drm_gem_dma_object_get_sg_table,
+	.vmap = drm_gem_dma_object_vmap,
+	.mmap = ethosu_gem_mmap,
+	.vm_ops = &drm_gem_dma_vm_ops,
+};
+
+/**
+ * ethosu_gem_create_object - Implementation of driver->gem_create_object.
+ * @ddev: DRM device
+ * @size: Size in bytes of the memory the object will reference
+ *
+ * This lets the GEM helpers allocate object structs for us, and keep
+ * our BO stats correct.
+ */
+struct drm_gem_object *ethosu_gem_create_object(struct drm_device *ddev, size_t size)
+{
+	struct ethosu_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &ethosu_gem_funcs;
+	return &obj->base.base;
+}
+
+/**
+ * ethosu_gem_create_with_handle() - Create a GEM object and attach it to a handle.
+ * @file: DRM file.
+ * @ddev: DRM device.
+ * @size: Size of the GEM object to allocate.
+ * @flags: Combination of drm_ethosu_bo_flags flags.
+ * @handle: Pointer holding the handle pointing to the new GEM object.
+ *
+ * Return: Zero on success
+ */
+int ethosu_gem_create_with_handle(struct drm_file *file,
+				  struct drm_device *ddev,
+				  u64 *size, u32 flags, u32 *handle)
+{
+	struct drm_gem_dma_object *mem;
+	struct ethosu_gem_object *bo;
+	int ret;
+
+	mem = drm_gem_dma_create(ddev, *size);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	bo = to_ethosu_bo(&mem->base);
+	bo->flags = flags;
+
+	/*
+	 * Allocate an id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file, &mem->base, handle);
+	if (!ret)
+		*size = bo->base.base.size;
+
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&mem->base);
+
+	return ret;
+}
+
+struct dma {
+	s8 region;
+	u64 len;
+	u64 offset;
+	s64 stride[2];
+};
+
+struct dma_state {
+	u16 size0;
+	u16 size1;
+	s8 mode;
+	struct dma src;
+	struct dma dst;
+};
+
+struct buffer {
+	u64 base;
+	u32 length;
+	s8 region;
+};
+
+struct feat_matrix {
+	u64 base[4];
+	s64 stride_x;
+	s64 stride_y;
+	s64 stride_c;
+	s8 region;
+	u8 broadcast;
+	u16 stride_kernel;
+	u16 precision;
+	u16 depth;
+	u16 width;
+	u16 width0;
+	u16 height[3];
+	u8 pad_top;
+	u8 pad_left;
+	u8 pad_bottom;
+	u8 pad_right;
+};
+
+struct cmd_state {
+	struct dma_state dma;
+	struct buffer scale[2];
+	struct buffer weight[4];
+	struct feat_matrix ofm;
+	struct feat_matrix ifm;
+	struct feat_matrix ifm2;
+};
+
+static void cmd_state_init(struct cmd_state *st)
+{
+	/* Initialize to all 1s to detect missing setup */
+	memset(st, 0xff, sizeof(*st));
+}
+
+static u64 cmd_to_addr(u32 *cmd)
+{
+	return ((u64)((cmd[0] & 0xff0000) << 16)) | cmd[1];
+}
+
+static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
+		      struct dma_state *dma_st, struct dma *dma)
+{
+	s8 mode = dma_st->mode;
+	u64 len = dma->len;
+
+	if (mode >= 1) {
+		len += dma->stride[0];
+		len *= dma_st->size0;
+	}
+	if (mode == 2) {
+		len += dma->stride[1];
+		len *= dma_st->size1;
+	}
+	if (dma->region >= 0)
+		info->region_size[dma->region] = max(info->region_size[dma->region],
+						     len + dma->offset);
+
+	return len;
+}
+
+static u64 feat_matrix_length(struct ethosu_validated_cmdstream_info *info,
+			      struct feat_matrix *fm,
+			      u32 x, u32 y, u32 c)
+{
+	u32 element_size, storage = fm->precision >> 14;
+	int tile = 0;
+	u64 addr;
+
+	if (fm->region < 0)
+		return U64_MAX;
+
+	switch (storage) {
+	case 0:
+		if (x >= fm->width0 + 1) {
+			x -= fm->width0 + 1;
+			tile += 1;
+		}
+		if (y >= fm->height[tile] + 1) {
+			y -= fm->height[tile] + 1;
+			tile += 2;
+		}
+		break;
+	case 1:
+		if (y >= fm->height[1] + 1) {
+			y -= fm->height[1] + 1;
+			tile = 2;
+		} else if (y >= fm->height[0] + 1) {
+			y -= fm->height[0] + 1;
+			tile = 1;
+		}
+		break;
+	}
+	if (fm->base[tile] == U64_MAX)
+		return U64_MAX;
+
+	addr = fm->base[tile] + y * fm->stride_y;
+
+	switch ((fm->precision >> 6) & 0x3) { // format
+	case 0: //nhwc:
+		addr += x * fm->stride_x + c;
+		break;
+	case 1: //nhcwb16:
+		element_size = BIT((fm->precision >> 1) & 0x3);
+
+		addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
+		break;
+	}
+
+	info->region_size[fm->region] = max(info->region_size[fm->region], addr + 1);
+
+	return addr;
+}
+
+static int calc_sizes(struct drm_device *ddev,
+		      struct ethosu_validated_cmdstream_info *info,
+		      u16 op, struct cmd_state *st,
+		      bool ifm, bool ifm2, bool weight, bool scale)
+{
+	u64 len;
+
+	if (ifm) {
+		if (st->ifm.stride_kernel == U16_MAX)
+			return -EINVAL;
+		u32 stride_y = ((st->ifm.stride_kernel >> 8) & 0x2) +
+			((st->ifm.stride_kernel >> 1) & 0x1) + 1;
+		u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +
+			(st->ifm.stride_kernel & 0x1) + 1;
+		u32 ifm_height = st->ofm.height[2] * stride_y +
+			st->ifm.height[2] - (st->ifm.pad_top + st->ifm.pad_bottom);
+		u32 ifm_width  = st->ofm.width * stride_x +
+			st->ifm.width - (st->ifm.pad_left + st->ifm.pad_right);
+
+		len = feat_matrix_length(info, &st->ifm, ifm_width,
+					 ifm_height, st->ifm.depth);
+		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
+			op, st->ifm.region, st->ifm.base[0], len);
+		if (len == U64_MAX)
+			return -EINVAL;
+	}
+
+	if (ifm2) {
+		len = feat_matrix_length(info, &st->ifm2, st->ifm.depth,
+					 0, st->ofm.depth);
+		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
+			op, st->ifm2.region, st->ifm2.base[0], len);
+		if (len == U64_MAX)
+			return -EINVAL;
+	}
+
+	if (weight) {
+		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
+			op, st->weight[0].region, st->weight[0].base,
+			st->weight[0].base + st->weight[0].length - 1);
+		if (st->weight[0].region < 0 || st->weight[0].base == U64_MAX ||
+		    st->weight[0].length == U32_MAX)
+			return -EINVAL;
+		info->region_size[st->weight[0].region] =
+			max(info->region_size[st->weight[0].region],
+			    st->weight[0].base + st->weight[0].length);
+	}
+
+	if (scale) {
+		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
+			op, st->scale[0].region, st->scale[0].base,
+			st->scale[0].base + st->scale[0].length - 1);
+		if (st->scale[0].region < 0 || st->scale[0].base == U64_MAX ||
+		    st->scale[0].length == U32_MAX)
+			return -EINVAL;
+		info->region_size[st->scale[0].region] =
+			max(info->region_size[st->scale[0].region],
+			    st->scale[0].base + st->scale[0].length);
+	}
+
+	len = feat_matrix_length(info, &st->ofm, st->ofm.width,
+				 st->ofm.height[2], st->ofm.depth);
+	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
+		op, st->ofm.region, st->ofm.base[0], len);
+	if (len == U64_MAX)
+		return -EINVAL;
+	info->output_region[st->ofm.region] = true;
+
+	return 0;
+}
+
+static int calc_sizes_elemwise(struct drm_device *ddev,
+			       struct ethosu_validated_cmdstream_info *info,
+			       u16 op, struct cmd_state *st,
+			       bool ifm, bool ifm2)
+{
+	u32 height, width, depth;
+	u64 len;
+
+	if (ifm) {
+		height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
+		width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
+		depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
+
+		len = feat_matrix_length(info, &st->ifm, width,
+					 height, depth);
+		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
+			op, st->ifm.region, st->ifm.base[0], len);
+		if (len == U64_MAX)
+			return -EINVAL;
+	}
+
+	if (ifm2) {
+		height = st->ifm2.broadcast & 0x1 ? 0 : st->ofm.height[2];
+		width = st->ifm2.broadcast & 0x2 ? 0 : st->ofm.width;
+		depth = st->ifm2.broadcast & 0x4 ? 0 : st->ofm.depth;
+
+		len = feat_matrix_length(info, &st->ifm2, width,
+					 height, depth);
+		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
+			op, st->ifm2.region, st->ifm2.base[0], len);
+		if (len == U64_MAX)
+			return -EINVAL;
+	}
+
+	len = feat_matrix_length(info, &st->ofm, st->ofm.width,
+				 st->ofm.height[2], st->ofm.depth);
+	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
+		op, st->ofm.region, st->ofm.base[0], len);
+	if (len == U64_MAX)
+		return -EINVAL;
+	info->output_region[st->ofm.region] = true;
+
+	return 0;
+}
+
+static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
+						  u32 __user *ucmds,
+						  struct ethosu_gem_object *bo,
+						  u32 size)
+{
+	struct ethosu_validated_cmdstream_info __free(kfree) *info = kzalloc(sizeof(*info), GFP_KERNEL);
+	struct ethosu_device *edev = to_ethosu_device(ddev);
+	u32 *bocmds = bo->base.vaddr;
+	struct cmd_state st;
+	int i, ret;
+
+	if (!info)
+		return -ENOMEM;
+	info->cmd_size = size;
+
+	cmd_state_init(&st);
+
+	for (i = 0; i < size / 4; i++) {
+		bool use_ifm, use_ifm2, use_scale;
+		u64 dstlen, srclen;
+		u16 cmd, param;
+		u32 cmds[2];
+		u64 addr;
+
+		if (get_user(cmds[0], ucmds++))
+			return -EFAULT;
+
+		bocmds[i] = cmds[0];
+
+		cmd = cmds[0];
+		param = cmds[0] >> 16;
+
+		if (cmd & 0x4000) {
+			if (get_user(cmds[1], ucmds++))
+				return -EFAULT;
+
+			i++;
+			bocmds[i] = cmds[1];
+			addr = cmd_to_addr(cmds);
+		}
+
+		switch (cmd) {
+		case NPU_OP_DMA_START:
+			srclen = dma_length(info, &st.dma, &st.dma.src);
+			dstlen = dma_length(info, &st.dma, &st.dma.dst);
+
+			if (st.dma.dst.region >= 0)
+				info->output_region[st.dma.dst.region] = true;
+			dev_dbg(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
+				st.dma.src.region, st.dma.src.offset, srclen,
+				st.dma.dst.region, st.dma.dst.offset, dstlen);
+			break;
+		case NPU_OP_CONV:
+		case NPU_OP_DEPTHWISE:
+			use_ifm2 = param & 0x1;  // weights_ifm2
+			use_scale = !(st.ofm.precision & 0x100);
+			ret = calc_sizes(ddev, info, cmd, &st, true, use_ifm2,
+					 !use_ifm2, use_scale);
+			if (ret)
+				return ret;
+			break;
+		case NPU_OP_POOL:
+			use_ifm = param != 0x4;  // pooling mode
+			use_scale = !(st.ofm.precision & 0x100);
+			ret = calc_sizes(ddev, info, cmd, &st, use_ifm, false,
+					 false, use_scale);
+			if (ret)
+				return ret;
+			break;
+		case NPU_OP_ELEMENTWISE:
+			use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) ||
+				(param == 6) || (param == 7) || (param == 0x24));
+			use_ifm = st.ifm.broadcast != 8;
+			ret = calc_sizes_elemwise(ddev, info, cmd, &st, use_ifm, use_ifm2);
+			if (ret)
+				return ret;
+			break;
+		case NPU_OP_RESIZE: // U85 only
+			WARN_ON(1); // TODO
+			break;
+		case NPU_SET_KERNEL_WIDTH_M1:
+			st.ifm.width = param;
+			break;
+		case NPU_SET_KERNEL_HEIGHT_M1:
+			st.ifm.height[2] = param;
+			break;
+		case NPU_SET_KERNEL_STRIDE:
+			st.ifm.stride_kernel = param;
+			break;
+		case NPU_SET_IFM_PAD_TOP:
+			st.ifm.pad_top = param & 0x7f;
+			break;
+		case NPU_SET_IFM_PAD_LEFT:
+			st.ifm.pad_left = param & 0x7f;
+			break;
+		case NPU_SET_IFM_PAD_RIGHT:
+			st.ifm.pad_right = param & 0xff;
+			break;
+		case NPU_SET_IFM_PAD_BOTTOM:
+			st.ifm.pad_bottom = param & 0xff;
+			break;
+		case NPU_SET_IFM_DEPTH_M1:
+			st.ifm.depth = param;
+			break;
+		case NPU_SET_IFM_PRECISION:
+			st.ifm.precision = param;
+			break;
+		case NPU_SET_IFM_BROADCAST:
+			st.ifm.broadcast = param;
+			break;
+		case NPU_SET_IFM_REGION:
+			st.ifm.region = param & 0x7f;
+			break;
+		case NPU_SET_IFM_WIDTH0_M1:
+			st.ifm.width0 = param;
+			break;
+		case NPU_SET_IFM_HEIGHT0_M1:
+			st.ifm.height[0] = param;
+			break;
+		case NPU_SET_IFM_HEIGHT1_M1:
+			st.ifm.height[1] = param;
+			break;
+		case NPU_SET_IFM_BASE0:
+		case NPU_SET_IFM_BASE1:
+		case NPU_SET_IFM_BASE2:
+		case NPU_SET_IFM_BASE3:
+			st.ifm.base[cmd & 0x3] = addr;
+			break;
+		case NPU_SET_IFM_STRIDE_X:
+			st.ifm.stride_x = addr;
+			break;
+		case NPU_SET_IFM_STRIDE_Y:
+			st.ifm.stride_y = addr;
+			break;
+		case NPU_SET_IFM_STRIDE_C:
+			st.ifm.stride_c = addr;
+			break;
+
+		case NPU_SET_OFM_WIDTH_M1:
+			st.ofm.width = param;
+			break;
+		case NPU_SET_OFM_HEIGHT_M1:
+			st.ofm.height[2] = param;
+			break;
+		case NPU_SET_OFM_DEPTH_M1:
+			st.ofm.depth = param;
+			break;
+		case NPU_SET_OFM_PRECISION:
+			st.ofm.precision = param;
+			break;
+		case NPU_SET_OFM_REGION:
+			st.ofm.region = param & 0x7;
+			break;
+		case NPU_SET_OFM_WIDTH0_M1:
+			st.ofm.width0 = param;
+			break;
+		case NPU_SET_OFM_HEIGHT0_M1:
+			st.ofm.height[0] = param;
+			break;
+		case NPU_SET_OFM_HEIGHT1_M1:
+			st.ofm.height[1] = param;
+			break;
+		case NPU_SET_OFM_BASE0:
+		case NPU_SET_OFM_BASE1:
+		case NPU_SET_OFM_BASE2:
+		case NPU_SET_OFM_BASE3:
+			st.ofm.base[cmd & 0x3] = addr;
+			break;
+		case NPU_SET_OFM_STRIDE_X:
+			st.ofm.stride_x = addr;
+			break;
+		case NPU_SET_OFM_STRIDE_Y:
+			st.ofm.stride_y = addr;
+			break;
+		case NPU_SET_OFM_STRIDE_C:
+			st.ofm.stride_c = addr;
+			break;
+
+		case NPU_SET_IFM2_BROADCAST:
+			st.ifm2.broadcast = param;
+			break;
+		case NPU_SET_IFM2_PRECISION:
+			st.ifm2.precision = param;
+			break;
+		case NPU_SET_IFM2_REGION:
+			st.ifm2.region = param & 0x7;
+			break;
+		case NPU_SET_IFM2_WIDTH0_M1:
+			st.ifm2.width0 = param;
+			break;
+		case NPU_SET_IFM2_HEIGHT0_M1:
+			st.ifm2.height[0] = param;
+			break;
+		case NPU_SET_IFM2_HEIGHT1_M1:
+			st.ifm2.height[1] = param;
+			break;
+		case NPU_SET_IFM2_BASE0:
+		case NPU_SET_IFM2_BASE1:
+		case NPU_SET_IFM2_BASE2:
+		case NPU_SET_IFM2_BASE3:
+			st.ifm2.base[cmd & 0x3] = addr;
+			break;
+		case NPU_SET_IFM2_STRIDE_X:
+			st.ifm2.stride_x = addr;
+			break;
+		case NPU_SET_IFM2_STRIDE_Y:
+			st.ifm2.stride_y = addr;
+			break;
+		case NPU_SET_IFM2_STRIDE_C:
+			st.ifm2.stride_c = addr;
+			break;
+
+		case NPU_SET_WEIGHT_REGION:
+			st.weight[0].region = param & 0x7;
+			break;
+		case NPU_SET_SCALE_REGION:
+			st.scale[0].region = param & 0x7;
+			break;
+		case NPU_SET_WEIGHT_BASE:
+			st.weight[0].base = addr;
+			break;
+		case NPU_SET_WEIGHT_LENGTH:
+			st.weight[0].length = cmds[1];
+			break;
+		case NPU_SET_SCALE_BASE:
+			st.scale[0].base = addr;
+			break;
+		case NPU_SET_SCALE_LENGTH:
+			st.scale[0].length = cmds[1];
+			break;
+		case NPU_SET_WEIGHT1_BASE:
+			st.weight[1].base = addr;
+			break;
+		case NPU_SET_WEIGHT1_LENGTH:
+			st.weight[1].length = cmds[1];
+			break;
+		case NPU_SET_SCALE1_BASE: // NPU_SET_WEIGHT2_BASE (U85)
+			if (ethosu_is_u65(edev))
+				st.scale[1].base = addr;
+			else
+				st.weight[2].base = addr;
+			break;
+		case NPU_SET_SCALE1_LENGTH: // NPU_SET_WEIGHT2_LENGTH (U85)
+			if (ethosu_is_u65(edev))
+				st.scale[1].length = cmds[1];
+			else
+				st.weight[1].length = cmds[1];
+			break;
+		case NPU_SET_WEIGHT3_BASE:
+			st.weight[3].base = addr;
+			break;
+		case NPU_SET_WEIGHT3_LENGTH:
+			st.weight[3].length = cmds[1];
+			break;
+
+		case NPU_SET_DMA0_SRC_REGION:
+			if (param & 0x100)
+				st.dma.src.region = -1;
+			else
+				st.dma.src.region = param & 0x7;
+			st.dma.mode = (param >> 9) & 0x3;
+			break;
+		case NPU_SET_DMA0_DST_REGION:
+			if (param & 0x100)
+				st.dma.dst.region = -1;
+			else
+				st.dma.dst.region = param & 0x7;
+			break;
+		case NPU_SET_DMA0_SIZE0:
+			st.dma.size0 = param;
+			break;
+		case NPU_SET_DMA0_SIZE1:
+			st.dma.size1 = param;
+			break;
+		case NPU_SET_DMA0_SRC_STRIDE0:
+			st.dma.src.stride[0] = ((s64)addr << 24) >> 24;
+			break;
+		case NPU_SET_DMA0_SRC_STRIDE1:
+			st.dma.src.stride[1] = ((s64)addr << 24) >> 24;
+			break;
+		case NPU_SET_DMA0_DST_STRIDE0:
+			st.dma.dst.stride[0] = ((s64)addr << 24) >> 24;
+			break;
+		case NPU_SET_DMA0_DST_STRIDE1:
+			st.dma.dst.stride[1] = ((s64)addr << 24) >> 24;
+			break;
+		case NPU_SET_DMA0_SRC:
+			st.dma.src.offset = addr;
+			break;
+		case NPU_SET_DMA0_DST:
+			st.dma.dst.offset = addr;
+			break;
+		case NPU_SET_DMA0_LEN:
+			st.dma.src.len = st.dma.dst.len = addr;
+			break;
+		default:
+			break;
+		}
+	}
+
+	for (i = 0; i < NPU_BASEP_REGION_MAX; i++) {
+		if (!info->region_size[i])
+			continue;
+		dev_dbg(ddev->dev, "region %d max size: 0x%llx\n",
+			i, info->region_size[i]);
+	}
+
+	bo->info = no_free_ptr(info);
+	return 0;
+}
+
+/**
+ * ethosu_gem_cmdstream_create() - Create a GEM object and attach it to a handle.
+ * @file: DRM file.
+ * @ddev: DRM device.
+ * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
+ * @size: Size of the GEM object to allocate.
+ * @flags: Combination of drm_ethosu_bo_flags flags.
+ * @handle: Pointer holding the handle pointing to the new GEM object.
+ *
+ * Return: Zero on success
+ */
+int ethosu_gem_cmdstream_create(struct drm_file *file,
+				struct drm_device *ddev,
+				u32 size, u64 data, u32 flags, u32 *handle)
+{
+	int ret;
+	struct drm_gem_dma_object *mem;
+	struct ethosu_gem_object *bo;
+
+	mem = drm_gem_dma_create(ddev, size);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	bo = to_ethosu_bo(&mem->base);
+	bo->flags = flags;
+
+	ret = ethosu_gem_cmdstream_copy_and_validate(ddev,
+						     (void __user *)(uintptr_t)data,
+						     bo, size);
+	if (ret)
+		goto fail;
+
+	/*
+	 * Allocate an id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file, &mem->base, handle);
+
+fail:
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&mem->base);
+
+	return ret;
+}
diff --git a/drivers/accel/ethosu/ethosu_gem.h b/drivers/accel/ethosu/ethosu_gem.h
new file mode 100644
index 000000000000..3922895a60fb
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_gem.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Arm, Ltd. */
+
+#ifndef __ETHOSU_GEM_H__
+#define __ETHOSU_GEM_H__
+
+#include "ethosu_device.h"
+#include <drm/drm_gem_dma_helper.h>
+
+struct ethosu_validated_cmdstream_info {
+	u32 cmd_size;
+	u64 region_size[NPU_BASEP_REGION_MAX];
+	bool output_region[NPU_BASEP_REGION_MAX];
+};
+
+/**
+ * struct ethosu_gem_object - Driver specific GEM object.
+ */
+struct ethosu_gem_object {
+	/** @base: Inherit from drm_gem_shmem_object. */
+	struct drm_gem_dma_object base;
+
+	struct ethosu_validated_cmdstream_info *info;
+
+	/** @flags: Combination of drm_ethosu_bo_flags flags. */
+	u32 flags;
+};
+
+static inline
+struct ethosu_gem_object *to_ethosu_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_dma_obj(obj), struct ethosu_gem_object, base);
+}
+
+struct drm_gem_object *ethosu_gem_create_object(struct drm_device *ddev,
+						size_t size);
+
+int ethosu_gem_create_with_handle(struct drm_file *file,
+				  struct drm_device *ddev,
+				  u64 *size, u32 flags, uint32_t *handle);
+
+int ethosu_gem_cmdstream_create(struct drm_file *file,
+				struct drm_device *ddev,
+				u32 size, u64 data, u32 flags, u32 *handle);
+
+#endif /* __ETHOSU_GEM_H__ */
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
new file mode 100644
index 000000000000..32b89cbfbaad
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -0,0 +1,496 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+/* Copyright 2025 Arm, Ltd. */
+
+#include <linux/bitfield.h>
+#include <linux/genalloc.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/ethosu_accel.h>
+
+#include "ethosu_device.h"
+#include "ethosu_drv.h"
+#include "ethosu_gem.h"
+#include "ethosu_job.h"
+
+#define JOB_TIMEOUT_MS 500
+
+static struct ethosu_job *to_ethosu_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct ethosu_job, base);
+}
+
+static const char *ethosu_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "ethosu";
+}
+
+static const char *ethosu_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "ethosu-npu";
+}
+
+static const struct dma_fence_ops ethosu_fence_ops = {
+	.get_driver_name = ethosu_fence_get_driver_name,
+	.get_timeline_name = ethosu_fence_get_timeline_name,
+};
+
+static void ethosu_job_hw_submit(struct ethosu_device *dev, struct ethosu_job *job)
+{
+	struct drm_gem_dma_object *cmd_bo = to_drm_gem_dma_obj(job->cmd_bo);
+	struct ethosu_validated_cmdstream_info *cmd_info = to_ethosu_bo(job->cmd_bo)->info;
+
+	for (int i = 0; i < job->region_cnt; i++) {
+		struct drm_gem_dma_object *bo;
+		int region = job->region_bo_num[i];
+
+		bo = to_drm_gem_dma_obj(job->region_bo[i]);
+		writel_relaxed(lower_32_bits(bo->dma_addr), dev->regs + NPU_REG_BASEP(region));
+		writel_relaxed(upper_32_bits(bo->dma_addr), dev->regs + NPU_REG_BASEP_HI(region));
+		dev_dbg(dev->base.dev, "Region %d base addr = %pad\n", region, &bo->dma_addr);
+	}
+
+	if (job->sram_size) {
+		writel_relaxed(lower_32_bits(dev->sramphys),
+			       dev->regs + NPU_REG_BASEP(ETHOSU_SRAM_REGION));
+		writel_relaxed(upper_32_bits(dev->sramphys),
+			       dev->regs + NPU_REG_BASEP_HI(ETHOSU_SRAM_REGION));
+		dev_dbg(dev->base.dev, "Region %d base addr = %pad (SRAM)\n",
+			ETHOSU_SRAM_REGION, &dev->sramphys);
+	}
+
+	writel_relaxed(lower_32_bits(cmd_bo->dma_addr), dev->regs + NPU_REG_QBASE);
+	writel_relaxed(upper_32_bits(cmd_bo->dma_addr), dev->regs + NPU_REG_QBASE_HI);
+	writel_relaxed(cmd_info->cmd_size, dev->regs + NPU_REG_QSIZE);
+
+	writel(CMD_TRANSITION_TO_RUN, dev->regs + NPU_REG_CMD);
+
+	dev_dbg(dev->base.dev,
+		"Submitted cmd at %pad to core\n", &cmd_bo->dma_addr);
+}
+
+static int ethosu_acquire_object_fences(struct ethosu_job *job)
+{
+	int i, ret;
+	struct drm_gem_object **bos = job->region_bo;
+	struct ethosu_validated_cmdstream_info *info = to_ethosu_bo(job->cmd_bo)->info;
+
+	for (i = 0; i < job->region_cnt; i++) {
+		bool is_write;
+
+		if (!bos[i])
+			break;
+
+		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
+		if (ret)
+			return ret;
+
+		is_write = info->output_region[job->region_bo_num[i]];
+		ret = drm_sched_job_add_implicit_dependencies(&job->base, bos[i],
+							      is_write);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void ethosu_attach_object_fences(struct ethosu_job *job)
+{
+	int i;
+	struct dma_fence *fence = job->inference_done_fence;
+	struct drm_gem_object **bos = job->region_bo;
+	struct ethosu_validated_cmdstream_info *info = to_ethosu_bo(job->cmd_bo)->info;
+
+	for (i = 0; i < job->region_cnt; i++)
+		if (info->output_region[job->region_bo_num[i]])
+			dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
+}
+
+static int ethosu_job_push(struct ethosu_job *job)
+{
+	struct ww_acquire_ctx acquire_ctx;
+	int ret;
+
+	ret = drm_gem_lock_reservations(job->region_bo, job->region_cnt, &acquire_ctx);
+	if (ret)
+		return ret;
+
+	ret = ethosu_acquire_object_fences(job);
+	if (ret)
+		goto out;
+
+	ret = pm_runtime_resume_and_get(job->dev->base.dev);
+	if (!ret) {
+		guard(mutex)(&job->dev->sched_lock);
+
+		drm_sched_job_arm(&job->base);
+		job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
+		kref_get(&job->refcount); /* put by scheduler job completion */
+		drm_sched_entity_push_job(&job->base);
+		ethosu_attach_object_fences(job);
+	}
+
+out:
+	drm_gem_unlock_reservations(job->region_bo, job->region_cnt, &acquire_ctx);
+	return ret;
+}
+
+static void ethosu_job_cleanup(struct kref *ref)
+{
+	struct ethosu_job *job = container_of(ref, struct ethosu_job,
+						refcount);
+	unsigned int i;
+
+	pm_runtime_put_autosuspend(job->dev->base.dev);
+
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->inference_done_fence);
+
+	for (i = 0; i < job->region_cnt; i++)
+		drm_gem_object_put(job->region_bo[i]);
+
+	drm_gem_object_put(job->cmd_bo);
+
+	kfree(job);
+}
+
+static void ethosu_job_put(struct ethosu_job *job)
+{
+	kref_put(&job->refcount, ethosu_job_cleanup);
+}
+
+static void ethosu_job_free(struct drm_sched_job *sched_job)
+{
+	struct ethosu_job *job = to_ethosu_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+	ethosu_job_put(job);
+}
+
+static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
+{
+	struct ethosu_job *job = to_ethosu_job(sched_job);
+	struct ethosu_device *dev = job->dev;
+	struct dma_fence *fence = job->done_fence;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	dma_fence_init(fence, &ethosu_fence_ops, &dev->fence_lock,
+		       dev->fence_context, ++dev->emit_seqno);
+	dma_fence_get(fence);
+
+	scoped_guard(mutex, &dev->job_lock) {
+		dev->in_flight_job = job;
+		ethosu_job_hw_submit(dev, job);
+	}
+
+	return fence;
+}
+
+static void ethosu_job_handle_irq(struct ethosu_device *dev)
+{
+	u32 status = readl_relaxed(dev->regs + NPU_REG_STATUS);
+
+	if (status & (STATUS_BUS_STATUS | STATUS_CMD_PARSE_ERR)) {
+		dev_err(dev->base.dev, "Error IRQ - %x\n", status);
+		drm_sched_fault(&dev->sched);
+		return;
+	}
+
+	scoped_guard(mutex, &dev->job_lock) {
+		if (dev->in_flight_job) {
+			dma_fence_signal(dev->in_flight_job->done_fence);
+			dev->in_flight_job = NULL;
+		}
+	}
+}
+
+static irqreturn_t ethosu_job_irq_handler_thread(int irq, void *data)
+{
+	struct ethosu_device *dev = data;
+
+	ethosu_job_handle_irq(dev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ethosu_job_irq_handler(int irq, void *data)
+{
+	struct ethosu_device *dev = data;
+	u32 status = readl_relaxed(dev->regs + NPU_REG_STATUS);
+
+	if (!(status & STATUS_IRQ_RAISED))
+		return IRQ_NONE;
+
+	writel_relaxed(CMD_CLEAR_IRQ, dev->regs + NPU_REG_CMD);
+	return IRQ_WAKE_THREAD;
+}
+
+static enum drm_gpu_sched_stat ethosu_job_timedout(struct drm_sched_job *bad)
+{
+	struct ethosu_job *job = to_ethosu_job(bad);
+	struct ethosu_device *dev = job->dev;
+	bool running;
+	u32 *bocmds = to_drm_gem_dma_obj(job->cmd_bo)->vaddr;
+	u32 cmdaddr;
+
+	cmdaddr = readl_relaxed(dev->regs + NPU_REG_QREAD);
+	running = FIELD_GET(STATUS_STATE_RUNNING, readl_relaxed(dev->regs + NPU_REG_STATUS));
+
+	if (running) {
+		int ret;
+		u32 reg;
+
+		ret = readl_relaxed_poll_timeout(dev->regs + NPU_REG_QREAD,
+						 reg,
+						 reg != cmdaddr,
+						 USEC_PER_MSEC, 100 * USEC_PER_MSEC);
+
+		/* If still running and progress is being made, just return */
+		if (!ret)
+			return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
+
+	dev_err(dev->base.dev, "NPU sched timed out: NPU %s, cmdstream offset 0x%x: 0x%x\n",
+		running ? "running" : "stopped",
+		cmdaddr, bocmds[cmdaddr / 4]);
+
+	drm_sched_stop(&dev->sched, bad);
+
+	scoped_guard(mutex, &dev->job_lock)
+		dev->in_flight_job = NULL;
+
+	/* Proceed with reset now. */
+	pm_runtime_force_suspend(dev->base.dev);
+	pm_runtime_force_resume(dev->base.dev);
+
+	/* Restart the scheduler */
+	drm_sched_start(&dev->sched, 0);
+
+	return DRM_GPU_SCHED_STAT_RESET;
+}
+
+static const struct drm_sched_backend_ops ethosu_sched_ops = {
+	.run_job = ethosu_job_run,
+	.timedout_job = ethosu_job_timedout,
+	.free_job = ethosu_job_free
+};
+
+int ethosu_job_init(struct ethosu_device *edev)
+{
+	struct device *dev = edev->base.dev;
+	struct drm_sched_init_args args = {
+		.ops = &ethosu_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.name = dev_name(dev),
+		.dev = dev,
+	};
+	int ret;
+
+	spin_lock_init(&edev->fence_lock);
+	ret = devm_mutex_init(dev, &edev->job_lock);
+	if (ret)
+		return ret;
+	ret = devm_mutex_init(dev, &edev->sched_lock);
+	if (ret)
+		return ret;
+
+	edev->irq = platform_get_irq(to_platform_device(dev), 0);
+	if (edev->irq < 0)
+		return edev->irq;
+
+	ret = devm_request_threaded_irq(dev, edev->irq,
+					ethosu_job_irq_handler,
+					ethosu_job_irq_handler_thread,
+					IRQF_SHARED, KBUILD_MODNAME,
+					edev);
+	if (ret) {
+		dev_err(dev, "failed to request irq\n");
+		return ret;
+	}
+
+	edev->fence_context = dma_fence_context_alloc(1);
+
+	ret = drm_sched_init(&edev->sched, &args);
+	if (ret) {
+		dev_err(dev, "Failed to create scheduler: %d\n", ret);
+		goto err_sched;
+	}
+
+	return 0;
+
+err_sched:
+	drm_sched_fini(&edev->sched);
+	return ret;
+}
+
+void ethosu_job_fini(struct ethosu_device *dev)
+{
+	drm_sched_fini(&dev->sched);
+}
+
+int ethosu_job_open(struct ethosu_file_priv *ethosu_priv)
+{
+	struct ethosu_device *dev = ethosu_priv->edev;
+	struct drm_gpu_scheduler *sched = &dev->sched;
+	int ret;
+
+	ret = drm_sched_entity_init(&ethosu_priv->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    &sched, 1, NULL);
+	return WARN_ON(ret);
+}
+
+void ethosu_job_close(struct ethosu_file_priv *ethosu_priv)
+{
+	struct drm_sched_entity *entity = &ethosu_priv->sched_entity;
+
+	drm_sched_entity_destroy(entity);
+}
+
+static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
+				   struct drm_ethosu_job *job)
+{
+	struct ethosu_device *edev = to_ethosu_device(dev);
+	struct ethosu_file_priv *file_priv = file->driver_priv;
+	struct ethosu_job *ejob = NULL;
+	struct ethosu_validated_cmdstream_info *cmd_info;
+	int ret = 0;
+
+	/* BO region 2 is reserved if SRAM is used */
+	if (job->region_bo_handles[ETHOSU_SRAM_REGION] && job->sram_size)
+		return -EINVAL;
+
+	if (edev->npu_info.sram_size < job->sram_size)
+		return -EINVAL;
+
+	ejob = kzalloc(sizeof(*ejob), GFP_KERNEL);
+	if (!ejob)
+		return -ENOMEM;
+
+	kref_init(&ejob->refcount);
+
+	ejob->dev = edev;
+	ejob->sram_size = job->sram_size;
+
+	ejob->done_fence = kzalloc(sizeof(*ejob->done_fence), GFP_KERNEL);
+	if (!ejob->done_fence) {
+		ret = -ENOMEM;
+		goto out_cleanup_job;
+	}
+
+	ret = drm_sched_job_init(&ejob->base,
+				 &file_priv->sched_entity,
+				 1, NULL, file->client_id);
+	if (ret)
+		goto out_put_job;
+
+	ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
+	if (!ejob->cmd_bo) {
+		ret = -ENOENT;
+		goto out_cleanup_job;
+	}
+	cmd_info = to_ethosu_bo(ejob->cmd_bo)->info;
+	if (!cmd_info) {
+		ret = -EINVAL;
+		goto out_cleanup_job;
+	}
+
+	for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
+		struct drm_gem_object *gem;
+
+		/* Can only omit a BO handle if the region is not used or used for SRAM */
+		if (!job->region_bo_handles[i] &&
+		    (!cmd_info->region_size[i] || (i == ETHOSU_SRAM_REGION && job->sram_size)))
+			continue;
+
+		if (job->region_bo_handles[i] && !cmd_info->region_size[i]) {
+			dev_err(dev->dev,
+				"Cmdstream BO handle %d set for unused region %d\n",
+				job->region_bo_handles[i], i);
+			ret = -EINVAL;
+			goto out_cleanup_job;
+		}
+
+		gem = drm_gem_object_lookup(file, job->region_bo_handles[i]);
+		if (!gem) {
+			dev_err(dev->dev,
+				"Invalid BO handle %d for region %d\n",
+				job->region_bo_handles[i], i);
+			ret = -ENOENT;
+			goto out_cleanup_job;
+		}
+
+		ejob->region_bo[ejob->region_cnt] = gem;
+		ejob->region_bo_num[ejob->region_cnt] = i;
+		ejob->region_cnt++;
+
+		if (to_ethosu_bo(gem)->info) {
+			dev_err(dev->dev,
+				"Cmdstream BO handle %d used for region %d\n",
+				job->region_bo_handles[i], i);
+			ret = -EINVAL;
+			goto out_cleanup_job;
+		}
+
+		/* Verify the command stream doesn't have accesses outside the BO */
+		if (cmd_info->region_size[i] > gem->size) {
+			dev_err(dev->dev,
+				"cmd stream region %d size greater than BO size (%llu > %zu)\n",
+				i, cmd_info->region_size[i], gem->size);
+			ret = -EOVERFLOW;
+			goto out_cleanup_job;
+		}
+	}
+	ret = ethosu_job_push(ejob);
+
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&ejob->base);
+out_put_job:
+	ethosu_job_put(ejob);
+
+	return ret;
+}
+
+int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_ethosu_submit *args = data;
+	int ret = 0;
+	unsigned int i = 0;
+
+	if (args->pad) {
+		drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	struct drm_ethosu_job __free(kvfree) *jobs =
+		kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
+	if (!jobs)
+		return -ENOMEM;
+
+	if (copy_from_user(jobs,
+			   (void __user *)(uintptr_t)args->jobs,
+			   args->job_count * sizeof(*jobs))) {
+		drm_dbg(dev, "Failed to copy incoming job array\n");
+		return -EFAULT;
+	}
+
+	for (i = 0; i < args->job_count; i++) {
+		ret = ethosu_ioctl_submit_job(dev, file, &jobs[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/accel/ethosu/ethosu_job.h b/drivers/accel/ethosu/ethosu_job.h
new file mode 100644
index 000000000000..ff1cf448d094
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_job.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+/* Copyright 2025 Arm, Ltd. */
+
+#ifndef __ETHOSU_JOB_H__
+#define __ETHOSU_JOB_H__
+
+#include <linux/kref.h>
+#include <drm/gpu_scheduler.h>
+
+struct ethosu_device;
+struct ethosu_file_priv;
+
+struct ethosu_job {
+	struct drm_sched_job base;
+	struct ethosu_device *dev;
+
+	struct drm_gem_object *cmd_bo;
+	struct drm_gem_object *region_bo[NPU_BASEP_REGION_MAX];
+	u8 region_bo_num[NPU_BASEP_REGION_MAX];
+	u8 region_cnt;
+	u32 sram_size;
+
+	/* Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *inference_done_fence;
+
+	/* Fence to be signaled by IRQ handler when the job is complete. */
+	struct dma_fence *done_fence;
+
+	struct kref refcount;
+};
+
+int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
+
+int ethosu_job_init(struct ethosu_device *dev);
+void ethosu_job_fini(struct ethosu_device *dev);
+int ethosu_job_open(struct ethosu_file_priv *ethosu_priv);
+void ethosu_job_close(struct ethosu_file_priv *ethosu_priv);
+
+#endif
diff --git a/include/uapi/drm/ethosu_accel.h b/include/uapi/drm/ethosu_accel.h
new file mode 100644
index 000000000000..af78bb4686d7
--- /dev/null
+++ b/include/uapi/drm/ethosu_accel.h
@@ -0,0 +1,261 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright (C) 2025 Arm, Ltd. */
+#ifndef _ETHOSU_DRM_H_
+#define _ETHOSU_DRM_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * DOC: IOCTL IDs
+ *
+ * enum drm_ethosu_ioctl_id - IOCTL IDs
+ *
+ * Place new ioctls at the end, don't re-order, don't replace or remove entries.
+ *
+ * These IDs are not meant to be used directly. Use the DRM_IOCTL_ETHOSU_xxx
+ * definitions instead.
+ */
+enum drm_ethosu_ioctl_id {
+	/** @DRM_ETHOSU_DEV_QUERY: Query device information. */
+	DRM_ETHOSU_DEV_QUERY = 0,
+
+	/** @DRM_ETHOSU_BO_CREATE: Create a buffer object. */
+	DRM_ETHOSU_BO_CREATE,
+
+	/** @DRM_ETHOSU_BO_WAIT: Wait on a buffer object's fence. */
+	DRM_ETHOSU_BO_WAIT,
+
+	/**
+	 * @DRM_ETHOSU_BO_MMAP_OFFSET: Get the file offset to pass to
+	 * mmap to map a GEM object.
+	 */
+	DRM_ETHOSU_BO_MMAP_OFFSET,
+
+	/**
+	 * @DRM_ETHOSU_CMDSTREAM_BO_CREATE: Create a command stream buffer
+	 * object.
+	 */
+	DRM_ETHOSU_CMDSTREAM_BO_CREATE,
+
+	/** @DRM_ETHOSU_SUBMIT: Submit a job and BOs to run. */
+	DRM_ETHOSU_SUBMIT,
+};
+
+/**
+ * DOC: IOCTL arguments
+ */
+
+/**
+ * enum drm_ethosu_dev_query_type - Query type
+ *
+ * Place new types at the end, don't re-order, don't remove or replace.
+ */
+enum drm_ethosu_dev_query_type {
+	/** @DRM_ETHOSU_DEV_QUERY_NPU_INFO: Query NPU information. */
+	DRM_ETHOSU_DEV_QUERY_NPU_INFO = 0,
+};
+
+/**
+ * struct drm_ethosu_gpu_info - NPU information
+ *
+ * Structure grouping all queryable information relating to the NPU.
+ */
+struct drm_ethosu_npu_info {
+	/** @id : NPU ID. */
+	__u32 id;
+#define DRM_ETHOSU_ARCH_MAJOR(x)			((x) >> 28)
+#define DRM_ETHOSU_ARCH_MINOR(x)			(((x) >> 20) & 0xff)
+#define DRM_ETHOSU_ARCH_PATCH(x)			(((x) >> 16) & 0xf)
+#define DRM_ETHOSU_PRODUCT_MAJOR(x)		(((x) >> 12) & 0xf)
+#define DRM_ETHOSU_VERSION_MAJOR(x)		(((x) >> 8) & 0xf)
+#define DRM_ETHOSU_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
+#define DRM_ETHOSU_VERSION_STATUS(x)		((x) & 0xf)
+
+	/** @gpu_rev: GPU revision. */
+	__u32 config;
+
+	__u32 sram_size;
+};
+
+/**
+ * struct drm_ethosu_dev_query - Arguments passed to DRM_ETHOSU_IOCTL_DEV_QUERY
+ */
+struct drm_ethosu_dev_query {
+	/** @type: the query type (see drm_ethosu_dev_query_type). */
+	__u32 type;
+
+	/**
+	 * @size: size of the type being queried.
+	 *
+	 * If pointer is NULL, size is updated by the driver to provide the
+	 * output structure size. If pointer is not NULL, the driver will
+	 * only copy min(size, actual_structure_size) bytes to the pointer,
+	 * and update the size accordingly. This allows us to extend query
+	 * types without breaking userspace.
+	 */
+	__u32 size;
+
+	/**
+	 * @pointer: user pointer to a query type struct.
+	 *
+	 * Pointer can be NULL, in which case, nothing is copied, but the
+	 * actual structure size is returned. If not NULL, it must point to
+	 * a location that's large enough to hold size bytes.
+	 */
+	__u64 pointer;
+};
+
+/**
+ * enum drm_ethosu_bo_flags - Buffer object flags, passed at creation time.
+ */
+enum drm_ethosu_bo_flags {
+	/**
+	 * @DRM_ETHOSU_BO_NO_MMAP: The buffer object will never be CPU-mapped
+	 * in userspace.
+	 */
+	DRM_ETHOSU_BO_NO_MMAP = (1 << 0),
+};
+
+/**
+ * struct drm_ethosu_bo_create - Arguments passed to DRM_IOCTL_ETHOSU_BO_CREATE.
+ */
+struct drm_ethosu_bo_create {
+	/**
+	 * @size: Requested size for the object
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 */
+	__u64 size;
+
+	/**
+	 * @flags: Flags. Must be a combination of drm_ethosu_bo_flags flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @handle: Returned handle for the object.
+	 *
+	 * Object handles are nonzero.
+	 */
+	__u32 handle;
+};
+
+/**
+ * struct drm_ethosu_bo_mmap_offset - Arguments passed to DRM_IOCTL_ETHOSU_BO_MMAP_OFFSET.
+ */
+struct drm_ethosu_bo_mmap_offset {
+	/** @handle: Handle of the object we want an mmap offset for. */
+	__u32 handle;
+
+	/** @pad: MBZ. */
+	__u32 pad;
+
+	/** @offset: The fake offset to use for subsequent mmap calls. */
+	__u64 offset;
+};
+
+/**
+ * struct drm_ethosu_wait_bo - ioctl argument for waiting for
+ * completion of the last DRM_ETHOSU_SUBMIT on a BO.
+ *
+ * This is useful for cases where multiple processes might be
+ * rendering to a BO and you want to wait for all rendering to be
+ * completed.
+ */
+struct drm_ethosu_bo_wait {
+	__u32 handle;
+	__u32 pad;
+	__s64 timeout_ns;	/* absolute */
+};
+
+struct drm_ethosu_cmdstream_bo_create {
+	/* Size of the data argument. */
+	__u32 size;
+
+	/* Flags, currently must be 0. */
+	__u32 flags;
+
+	/* Pointer to the data. */
+	__u64 data;
+
+	/** Returned GEM handle for the BO. */
+	__u32 handle;
+
+	/* Pad, must be 0. */
+	__u32 pad;
+};
+
+/**
+ * struct drm_ethosu_job - A job to be run on the NPU
+ *
+ * The kernel will schedule the execution of this job taking into account its
+ * dependencies with other jobs. All tasks in the same job will be executed
+ * sequentially on the same core, to benefit from memory residency in SRAM.
+ */
+struct drm_ethosu_job {
+	/** Input: BO handle for cmdstream. */
+	__u32 cmd_bo;
+
+	/** Input: Amount of SRAM to use. */
+	__u32 sram_size;
+
+#define ETHOSU_MAX_REGIONS	8
+	/** Input: Array of BO handles for each region. */
+	__u32 region_bo_handles[ETHOSU_MAX_REGIONS];
+};
+
+/**
+ * struct drm_ethosu_submit - ioctl argument for submitting commands to the NPU.
+ *
+ * The kernel will schedule the execution of these jobs in dependency order.
+ */
+struct drm_ethosu_submit {
+	/** Input: Pointer to an array of struct drm_ethosu_job. */
+	__u64 jobs;
+
+	/** Input: Number of jobs passed in. */
+	__u32 job_count;
+
+	/** Reserved, must be zero. */
+	__u32 pad;
+};
+
+/**
+ * DRM_IOCTL_ETHOSU() - Build a ethosu IOCTL number
+ * @__access: Access type. Must be R, W or RW.
+ * @__id: One of the DRM_ETHOSU_xxx id.
+ * @__type: Suffix of the type being passed to the IOCTL.
+ *
+ * Don't use this macro directly, use the DRM_IOCTL_ETHOSU_xxx
+ * values instead.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define DRM_IOCTL_ETHOSU(__access, __id, __type) \
+	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_ETHOSU_ ## __id, \
+			   struct drm_ethosu_ ## __type)
+
+enum {
+	DRM_IOCTL_ETHOSU_DEV_QUERY =
+		DRM_IOCTL_ETHOSU(WR, DEV_QUERY, dev_query),
+	DRM_IOCTL_ETHOSU_BO_CREATE =
+		DRM_IOCTL_ETHOSU(WR, BO_CREATE, bo_create),
+	DRM_IOCTL_ETHOSU_BO_WAIT =
+		DRM_IOCTL_ETHOSU(WR, BO_WAIT, bo_wait),
+	DRM_IOCTL_ETHOSU_BO_MMAP_OFFSET =
+		DRM_IOCTL_ETHOSU(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_ETHOSU_CMDSTREAM_BO_CREATE =
+		DRM_IOCTL_ETHOSU(WR, CMDSTREAM_BO_CREATE, cmdstream_bo_create),
+	DRM_IOCTL_ETHOSU_SUBMIT =
+		DRM_IOCTL_ETHOSU(WR, SUBMIT, submit),
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _ETHOSU_DRM_H_ */

-- 
2.51.0

