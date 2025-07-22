Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1569B0E6CF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 00:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D31510E740;
	Tue, 22 Jul 2025 22:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQtzRQF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38910E73F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 22:59:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5CF70A5647E;
 Tue, 22 Jul 2025 22:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7459C4CEF9;
 Tue, 22 Jul 2025 22:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753225161;
 bh=VRR3KLOr2z3CFWt2qDM+S9KOoMbpZ2NNU6k7ueE/+NE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JQtzRQF4wOZofS0iH1x5+PmKUiDqEBchn95bivuqkPo6NmZi0ZuG8WlWyh8/q8cwC
 Qd9IwtNf2NLaCff0eMzZE8EllyfcY/oMcPo4Y8XVw3lCwWX6AaoQ7VpBAGDSQ5FSlz
 yj0mqiAr7dGdFW6UPQz2ATe7xyngCuOh0z7SbcioK2tB2RVC3h3zM10zCthX1it092
 FHiEP/VIZ+zXEpIoIpSip9y6T8kS8EJx09N1VtJCECqsBKTsRXHkZwjV+o3SH6IqAy
 Tm0G4rSuKOrysDXJvOTu3erlP4QhbuNNniOoyk3lF3x7xQheOy0N/HrBPKRs1yrC3R
 rRH46Q2K6GKSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 22 Jul 2025 17:58:57 -0500
Subject: [PATCH RFC 2/2] accel: Add Arm Ethos-U NPU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-ethos-v1-2-cc1c5a0cbbfb@kernel.org>
References: <20250722-ethos-v1-0-cc1c5a0cbbfb@kernel.org>
In-Reply-To: <20250722-ethos-v1-0-cc1c5a0cbbfb@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>
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

Tested on i.MX93 platform (U65) with WIP Mesa Teflon support.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Open issues/TODO:
 - Fix "Memory manager not clean during takedown." warning
 - U85 support (minor changes and testing needed)
 - Improve AXI bus config. This needs to be per platform probably and is
   also different for U85. The downstream driver parameterizes
   everything into DT properties (and a whole other driver!). There's
   little reason to parameterize everything for a couple of fixed
   registers to initialize. All that should be needed is per platform
   match data.
 - Automatic h/w clock/power gating with Q channel. (Perhaps not needed
   with runtime PM?)
 - SRAM support not working on i.MX93 as some DMA writes to SRAM are
   corrupted/dropped (AXI bus config?)
---
 MAINTAINERS                        |   9 +
 drivers/accel/Kconfig              |   1 +
 drivers/accel/Makefile             |   1 +
 drivers/accel/ethos/Kconfig        |  10 +
 drivers/accel/ethos/Makefile       |   4 +
 drivers/accel/ethos/ethos_device.h | 186 ++++++++++
 drivers/accel/ethos/ethos_drv.c    | 412 +++++++++++++++++++++
 drivers/accel/ethos/ethos_drv.h    |  15 +
 drivers/accel/ethos/ethos_gem.c    | 707 +++++++++++++++++++++++++++++++++++++
 drivers/accel/ethos/ethos_gem.h    |  46 +++
 drivers/accel/ethos/ethos_job.c    | 527 +++++++++++++++++++++++++++
 drivers/accel/ethos/ethos_job.h    |  41 +++
 include/uapi/drm/ethos_accel.h     | 262 ++++++++++++++
 13 files changed, 2221 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..e748eb565fad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1954,6 +1954,15 @@ F:	arch/arm/include/asm/arch_timer.h
 F:	arch/arm64/include/asm/arch_timer.h
 F:	drivers/clocksource/arm_arch_timer.c
 
+ARM ETHOS-U NPU DRIVER
+M:	Rob Herring (Arm) <robh@kernel.org>
+M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/accel/ethos/
+F:	include/uapi/drm/ethos_accel.h
+
 ARM GENERIC INTERRUPT CONTROLLER DRIVERS
 M:	Marc Zyngier <maz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 5b9490367a39..6317644b6a5a 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
 	  and debugfs).
 
 source "drivers/accel/amdxdna/Kconfig"
+source "drivers/accel/ethos/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4..f18868037484 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
+obj-$(CONFIG_DRM_ACCEL_ARM_ETHOS)	+= ethos/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
diff --git a/drivers/accel/ethos/Kconfig b/drivers/accel/ethos/Kconfig
new file mode 100644
index 000000000000..127afbae43f0
--- /dev/null
+++ b/drivers/accel/ethos/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_ARM_ETHOS
+	tristate "Arm Ethos-U65/U85 NPU"
+	depends on HAS_IOMEM
+	depends on DRM_ACCEL
+	select DRM_GEM_DMA_HELPER
+	select DRM_SCHED
+	help
+	  Enables driver for Arm Ethos-U65/U85 NPUs
diff --git a/drivers/accel/ethos/Makefile b/drivers/accel/ethos/Makefile
new file mode 100644
index 000000000000..8b4a8bbf41d4
--- /dev/null
+++ b/drivers/accel/ethos/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_ACCEL_ARM_ETHOS) := ethos.o
+ethos-y += ethos_drv.o ethos_gem.o ethos_job.o
diff --git a/drivers/accel/ethos/ethos_device.h b/drivers/accel/ethos/ethos_device.h
new file mode 100644
index 000000000000..3b2643002465
--- /dev/null
+++ b/drivers/accel/ethos/ethos_device.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0-only or MIT */
+/* Copyright 2025 Arm, Ltd. */
+
+#ifndef __ETHOS_DEVICE_H__
+#define __ETHOS_DEVICE_H__
+
+#include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
+
+#include <drm/ethos_accel.h>
+
+struct clk;
+struct gen_pool;
+
+#define NPU_REG_ID		0x0000
+#define NPU_REG_STATUS		0x0004
+#define NPU_REG_CMD		0x0008
+#define NPU_REG_RESET		0x000C
+#define NPU_REG_QBASE		0x0010
+#define NPU_REG_QBASE_HI	0x0014
+#define NPU_REG_QREAD		0x0018
+#define NPU_REG_QCONFIG		0x001C
+#define NPU_REG_QSIZE		0x0020
+#define NPU_REG_PROT		0x0024
+#define NPU_REG_CONFIG		0x0028
+#define NPU_REG_REGIONCFG	0x003C
+#define NPU_REG_AXILIMIT0	0x0040
+#define NPU_REG_AXILIMIT1	0x0044
+#define NPU_REG_AXILIMIT2	0x0048
+#define NPU_REG_AXILIMIT3	0x004c
+
+#define NPU_REG_BASEP(x)	(0x0080 + (x)*8)
+#define NPU_REG_BASEP_HI(x)	(0x0084 + (x)*8)
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
+enum ethos_cmds {
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
+#define ETHOS_SRAM_REGION	2	/* Matching Vela compiler */
+
+/**
+ * struct ethos_device - Ethos device
+ */
+struct ethos_device {
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
+	struct clk *core_clk;
+	struct clk *apb_clk;
+
+	int irq;
+
+	bool coherent;
+
+	struct drm_ethos_npu_info npu_info;
+
+	struct ethos_job *in_flight_job;
+	struct mutex job_lock;
+	spinlock_t fence_lock;
+
+	struct {
+		struct workqueue_struct *wq;
+		struct work_struct work;
+		atomic_t pending;
+	} reset;
+
+	struct drm_gpu_scheduler sched;
+	struct mutex sched_lock;
+	u64 fence_context;
+	u64 emit_seqno;
+};
+
+#define to_ethos_device(drm_dev) \
+	((struct ethos_device *)container_of(drm_dev, struct ethos_device, base))
+
+#endif
diff --git a/drivers/accel/ethos/ethos_drv.c b/drivers/accel/ethos/ethos_drv.c
new file mode 100644
index 000000000000..40f96e945b16
--- /dev/null
+++ b/drivers/accel/ethos/ethos_drv.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+// Copyright (C) 2025 Arm, Ltd.
+
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
+#include <drm/ethos_accel.h>
+
+#include "ethos_drv.h"
+#include "ethos_device.h"
+#include "ethos_gem.h"
+#include "ethos_job.h"
+
+static int ethos_ioctl_dev_query(struct drm_device *ddev, void *data,
+				 struct drm_file *file)
+{
+	struct ethos_device *ethosdev = to_ethos_device(ddev);
+	struct drm_ethos_dev_query *args = data;
+
+	if (!args->pointer) {
+		switch (args->type) {
+		case DRM_ETHOS_DEV_QUERY_NPU_INFO:
+			args->size = sizeof(ethosdev->npu_info);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->type) {
+	case DRM_ETHOS_DEV_QUERY_NPU_INFO:
+		if (args->size < offsetofend(struct drm_ethos_npu_info, sram_size))
+			return -EINVAL;
+		return copy_struct_to_user(u64_to_user_ptr(args->pointer),
+					   args->size,
+					   &ethosdev->npu_info,
+					   sizeof(ethosdev->npu_info), NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+#define ETHOS_BO_FLAGS		DRM_ETHOS_BO_NO_MMAP
+
+static int ethos_ioctl_bo_create(struct drm_device *ddev, void *data,
+				 struct drm_file *file)
+{
+	struct drm_ethos_bo_create *args = data;
+	int cookie, ret;
+
+	if (!drm_dev_enter(ddev, &cookie))
+		return -ENODEV;
+
+	if (!args->size || (args->flags & ~ETHOS_BO_FLAGS)) {
+		ret = -EINVAL;
+		goto out_dev_exit;
+	}
+
+	ret = ethos_gem_create_with_handle(file, ddev, &args->size,
+					   args->flags, &args->handle);
+
+out_dev_exit:
+	drm_dev_exit(cookie);
+	return ret;
+}
+
+static int ethos_ioctl_bo_wait(struct drm_device *ddev, void *data,
+			       struct drm_file *file)
+{
+	struct drm_ethos_bo_wait *args = data;
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
+static int ethos_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
+				      struct drm_file *file)
+{
+	struct drm_ethos_bo_mmap_offset *args = data;
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
+static int ethos_ioctl_cmdstream_bo_create(struct drm_device *ddev, void *data,
+					   struct drm_file *file)
+{
+	struct drm_ethos_cmdstream_bo_create *args = data;
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
+	args->flags |= DRM_ETHOS_BO_NO_MMAP;
+
+	ret = ethos_gem_cmdstream_create(file, ddev, args->size, args->data,
+					 args->flags, &args->handle);
+
+out_dev_exit:
+	drm_dev_exit(cookie);
+	return ret;
+}
+
+static int ethos_open(struct drm_device *ddev, struct drm_file *file)
+{
+	int ret = 0;
+	struct ethos_file_priv *priv;
+
+	if (!try_module_get(THIS_MODULE))
+		return -EINVAL;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err_put_mod;
+	}
+	priv->edev = to_ethos_device(ddev);
+
+	ret = ethos_job_open(priv);
+	if (ret)
+		goto err_free;
+
+	file->driver_priv = priv;
+	return 0;
+
+err_free:
+	kfree(priv);
+err_put_mod:
+	module_put(THIS_MODULE);
+	return ret;
+}
+
+static void ethos_postclose(struct drm_device *ddev, struct drm_file *file)
+{
+	ethos_job_close(file->driver_priv);
+	kfree(file->driver_priv);
+	module_put(THIS_MODULE);
+}
+
+static const struct drm_ioctl_desc ethos_drm_driver_ioctls[] = {
+#define ETHOS_IOCTL(n, func, flags) \
+	DRM_IOCTL_DEF_DRV(ETHOS_##n, ethos_ioctl_##func, flags)
+
+	ETHOS_IOCTL(DEV_QUERY, dev_query, 0),
+	ETHOS_IOCTL(BO_CREATE, bo_create, 0),
+	ETHOS_IOCTL(BO_WAIT, bo_wait, 0),
+	ETHOS_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset, 0),
+	ETHOS_IOCTL(CMDSTREAM_BO_CREATE, cmdstream_bo_create, 0),
+	ETHOS_IOCTL(SUBMIT, submit, 0),
+};
+
+DEFINE_DRM_ACCEL_FOPS(ethos_drm_driver_fops);
+
+/*
+ * Ethos driver version:
+ * - 1.0 - initial interface
+ */
+static const struct drm_driver ethos_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
+	.open = ethos_open,
+	.postclose = ethos_postclose,
+	.ioctls = ethos_drm_driver_ioctls,
+	.num_ioctls = ARRAY_SIZE(ethos_drm_driver_ioctls),
+	.fops = &ethos_drm_driver_fops,
+	.name = "ethos",
+	.desc = "Arm Ethos Accel driver",
+	.major = 1,
+	.minor = 0,
+
+	.gem_create_object = ethos_gem_create_object,
+};
+
+static int ethos_device_resume(struct device *dev)
+{
+	struct ethos_device *ethosdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(ethosdev->core_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(ethosdev->apb_clk);
+	if (ret)
+		goto err_disable_core_clk;
+
+	return 0;
+
+err_disable_core_clk:
+	clk_disable_unprepare(ethosdev->core_clk);
+	return ret;
+}
+
+static int ethos_device_suspend(struct device *dev)
+{
+	struct ethos_device *ethosdev = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ethosdev->apb_clk);
+	clk_disable_unprepare(ethosdev->core_clk);
+	return 0;
+}
+
+static bool ethos_is_u65(const struct ethos_device *ethosdev)
+{
+	return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosdev->npu_info.id) == 1;
+}
+
+#define AXI_LIMIT_CFG 0x1f3f0000
+
+static int ethos_reset(struct ethos_device *ethosdev)
+{
+	int ret;
+	u32 reg;
+
+	writel_relaxed(RESET_PENDING_CSL, ethosdev->regs + NPU_REG_RESET);
+	ret = readl_poll_timeout(ethosdev->regs + NPU_REG_STATUS, reg,
+				 !FIELD_GET(STATUS_RESET_STATUS, reg),
+				 USEC_PER_MSEC, USEC_PER_SEC);
+	if (ret)
+		return ret;
+
+	if (!FIELD_GET(PROT_ACTIVE_CSL, readl_relaxed(ethosdev->regs + NPU_REG_PROT))) {
+		dev_warn(ethosdev->base.dev, "Could not reset to non-secure mode (PROT = %x)\n",
+			 readl_relaxed(ethosdev->regs + NPU_REG_PROT));
+	}
+
+	if (ethos_is_u65(ethosdev)) {
+		/* Assign region 2 to AXI M0, everything else to AXI M1*/
+		writel_relaxed(0x0000aa8a, ethosdev->regs + NPU_REG_REGIONCFG);
+		writel_relaxed(AXI_LIMIT_CFG, ethosdev->regs + NPU_REG_AXILIMIT0);
+		writel_relaxed(AXI_LIMIT_CFG, ethosdev->regs + NPU_REG_AXILIMIT1);
+		writel_relaxed(AXI_LIMIT_CFG, ethosdev->regs + NPU_REG_AXILIMIT2);
+		writel_relaxed(AXI_LIMIT_CFG, ethosdev->regs + NPU_REG_AXILIMIT3);
+	}
+
+	if (ethosdev->sram)
+		memset_io(ethosdev->sram, 0, ethosdev->npu_info.sram_size);
+
+	return 0;
+}
+
+static int ethos_sram_init(struct ethos_device *ethosdev)
+{
+	ethosdev->npu_info.sram_size = 0;
+
+	ethosdev->srampool = of_gen_pool_get(ethosdev->base.dev->of_node, "sram", 0);
+	if (!ethosdev->srampool)
+		return 0;
+
+	ethosdev->npu_info.sram_size = gen_pool_size(ethosdev->srampool);
+
+	ethosdev->sram = (void __iomem *)gen_pool_dma_alloc(ethosdev->srampool,
+							    ethosdev->npu_info.sram_size,
+							    &ethosdev->sramphys);
+	if (!ethosdev->sram) {
+		dev_err(ethosdev->base.dev, "failed to allocate from SRAM pool\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int ethos_init(struct ethos_device *ethosdev)
+{
+	int ret;
+	u32 id, config;
+
+	ret = devm_pm_runtime_enable(ethosdev->base.dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(ethosdev->base.dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(ethosdev->base.dev, 50);
+	pm_runtime_use_autosuspend(ethosdev->base.dev);
+
+	/* If PM is disabled, we need to call ethos_device_resume() manually. */
+	if (!IS_ENABLED(CONFIG_PM)) {
+		ret = ethos_device_resume(ethosdev->base.dev);
+		if (ret)
+			return ret;
+	}
+
+	ethosdev->npu_info.id = id = readl_relaxed(ethosdev->regs + NPU_REG_ID);
+	ethosdev->npu_info.config = config = readl_relaxed(ethosdev->regs + NPU_REG_CONFIG);
+
+	ethos_sram_init(ethosdev);
+
+	dev_info(ethosdev->base.dev,
+		"Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
+		FIELD_GET(ID_ARCH_MAJOR_MASK, id),
+		FIELD_GET(ID_ARCH_MINOR_MASK, id),
+		FIELD_GET(ID_ARCH_PATCH_MASK, id),
+		FIELD_GET(ID_VER_MAJOR_MASK, id),
+		FIELD_GET(ID_VER_MINOR_MASK, id),
+		FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
+		1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config),
+		ethosdev->npu_info.sram_size / 1024);
+
+	return ethos_reset(ethosdev);
+}
+
+static int ethos_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct ethos_device *ethosdev;
+
+	ethosdev = devm_drm_dev_alloc(&pdev->dev, &ethos_drm_driver,
+				      struct ethos_device, base);
+	if (IS_ERR(ethosdev))
+		return -ENOMEM;
+	platform_set_drvdata(pdev, ethosdev);
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
+	if (ret)
+		return ret;
+
+	ethosdev->regs = devm_platform_ioremap_resource(pdev, 0);
+
+	ethosdev->core_clk = devm_clk_get(&pdev->dev, "core");
+
+	ethosdev->apb_clk = devm_clk_get_optional(&pdev->dev, "apb");
+
+	ret = ethos_job_init(ethosdev);
+	if (ret)
+		return ret;
+
+	ret = ethos_init(ethosdev);
+	if (ret)
+		return ret;
+
+	ret = drm_dev_register(&ethosdev->base, 0);
+	if (ret)
+		pm_runtime_dont_use_autosuspend(ethosdev->base.dev);
+
+	pm_runtime_put_autosuspend(ethosdev->base.dev);
+	return ret;
+}
+
+static void ethos_remove(struct platform_device *pdev)
+{
+	struct ethos_device *ethosdev = dev_get_drvdata(&pdev->dev);
+
+	drm_dev_unregister(&ethosdev->base);
+	ethos_job_fini(ethosdev);
+	if (ethosdev->sram)
+		gen_pool_free(ethosdev->srampool, (unsigned long)ethosdev->sram,
+			      ethosdev->npu_info.sram_size);
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "arm,ethos-u65" },
+	{ .compatible = "arm,ethos-u85" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ethos_pm_ops,
+				 ethos_device_suspend,
+				 ethos_device_resume,
+				 NULL);
+
+static struct platform_driver ethos_driver = {
+	.probe = ethos_probe,
+	.remove = ethos_remove,
+	.driver = {
+		.name = "ethos",
+		.pm = pm_ptr(&ethos_pm_ops),
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(ethos_driver);
+
+MODULE_AUTHOR("Rob Herring <robh@kernel.org>");
+MODULE_DESCRIPTION("Arm Ethos Accel Driver");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/accel/ethos/ethos_drv.h b/drivers/accel/ethos/ethos_drv.h
new file mode 100644
index 000000000000..39a55c1a6bd6
--- /dev/null
+++ b/drivers/accel/ethos/ethos_drv.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright 2025 Arm, Ltd. */
+#ifndef __ETHOS_DRV_H__
+#define __ETHOS_DRV_H__
+
+#include <drm/gpu_scheduler.h>
+
+struct ethos_device;
+
+struct ethos_file_priv {
+	struct ethos_device *edev;
+	struct drm_sched_entity sched_entity;
+};
+
+#endif
diff --git a/drivers/accel/ethos/ethos_gem.c b/drivers/accel/ethos/ethos_gem.c
new file mode 100644
index 000000000000..7f24661d5655
--- /dev/null
+++ b/drivers/accel/ethos/ethos_gem.c
@@ -0,0 +1,707 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/* Copyright 2025 Arm, Ltd. */
+
+#include <linux/err.h>
+#include <linux/slab.h>
+
+#include <drm/ethos_accel.h>
+
+#include "ethos_device.h"
+#include "ethos_gem.h"
+
+static void ethos_gem_free_object(struct drm_gem_object *obj)
+{
+	struct ethos_gem_object *bo = to_ethos_bo(obj);
+
+	kfree(bo->info);
+	drm_gem_free_mmap_offset(&bo->base.base);
+	drm_gem_dma_free(&bo->base);
+}
+
+static int ethos_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct ethos_gem_object *bo = to_ethos_bo(obj);
+
+	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
+	if (bo->flags & DRM_ETHOS_BO_NO_MMAP)
+		return -EINVAL;
+
+	return drm_gem_dma_object_mmap(obj, vma);
+}
+
+static const struct drm_gem_object_funcs ethos_gem_funcs = {
+	.free = ethos_gem_free_object,
+	.print_info = drm_gem_dma_object_print_info,
+	.get_sg_table = drm_gem_dma_object_get_sg_table,
+	.vmap = drm_gem_dma_object_vmap,
+	.mmap = ethos_gem_mmap,
+	.vm_ops = &drm_gem_dma_vm_ops,
+};
+
+/**
+ * ethos_gem_create_object - Implementation of driver->gem_create_object.
+ * @ddev: DRM device
+ * @size: Size in bytes of the memory the object will reference
+ *
+ * This lets the GEM helpers allocate object structs for us, and keep
+ * our BO stats correct.
+ */
+struct drm_gem_object *ethos_gem_create_object(struct drm_device *ddev, size_t size)
+{
+	struct ethos_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &ethos_gem_funcs;
+	return &obj->base.base;
+}
+
+/**
+ * ethos_gem_create_with_handle() - Create a GEM object and attach it to a handle.
+ * @file: DRM file.
+ * @ddev: DRM device.
+ * @size: Size of the GEM object to allocate.
+ * @flags: Combination of drm_ethos_bo_flags flags.
+ * @handle: Pointer holding the handle pointing to the new GEM object.
+ *
+ * Return: Zero on success
+ */
+int ethos_gem_create_with_handle(struct drm_file *file,
+				 struct drm_device *ddev,
+				 u64 *size, u32 flags, u32 *handle)
+{
+	int ret;
+	struct drm_gem_dma_object *mem;
+	struct ethos_gem_object *bo;
+
+	mem = drm_gem_dma_create(ddev, *size);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	bo = to_ethos_bo(&mem->base);
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
+static u64 dma_length(struct ethos_validated_cmdstream_info *info,
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
+static u64 feat_matrix_length(struct ethos_validated_cmdstream_info *info,
+			      struct feat_matrix *fm,
+			      u32 x, u32 y, u32 c)
+{
+	int storage = fm->precision >> 14;
+	int tile = 0;
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
+	u64 addr = fm->base[tile] + y * fm->stride_y;
+
+	switch ((fm->precision >> 6) & 0x3) { // format
+	case 0: //nhwc:
+		addr += x * fm->stride_x + c;
+		break;
+	case 1: //nhcwb16:
+		u32 element_size = BIT((fm->precision >> 1) & 0x3);
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
+		      struct ethos_validated_cmdstream_info *info,
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
+			       struct ethos_validated_cmdstream_info *info,
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
+		dev_info(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
+			 op, st->ifm.region, st->ifm.base[0], len);
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
+static int ethos_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
+						 u32 __user *ucmds,
+						 struct ethos_gem_object *bo,
+						 u32 size)
+{
+	struct ethos_validated_cmdstream_info *info;
+	u32 *bocmds = bo->base.vaddr;
+	struct cmd_state st;
+	int i, ret;
+
+	cmd_state_init(&st);
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+	info->cmd_size = size;
+
+	for (i = 0; i < size/4; i++) {
+		bool use_ifm, use_ifm2, use_scale;
+		u16 cmd, param;
+		u32 cmds[2];
+		u64 addr;
+
+		if (get_user(cmds[0], ucmds++)) {
+			ret = -EFAULT;
+			goto fault;
+		}
+		bocmds[i] = cmds[0];
+
+		cmd = cmds[0];
+		param = cmds[0] >> 16;
+
+		if (cmd & 0x4000) {
+			if (get_user(cmds[1], ucmds++)) {
+				ret = -EFAULT;
+				goto fault;
+			}
+			i++;
+			bocmds[i] = cmds[1];
+			addr = cmd_to_addr(cmds);
+		}
+
+		switch (cmd) {
+		case NPU_OP_DMA_START:
+			u64 srclen = dma_length(info, &st.dma, &st.dma.src);
+			u64 dstlen = dma_length(info, &st.dma, &st.dma.dst);
+
+			if (st.dma.dst.region >= 0)
+				info->output_region[st.dma.dst.region] = true;
+			dev_info(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
+				 st.dma.src.region, st.dma.src.offset, srclen,
+				 st.dma.dst.region, st.dma.dst.offset, dstlen);
+			break;
+		case NPU_OP_CONV:
+		case NPU_OP_DEPTHWISE:
+			use_ifm2 = param & 0x1;  // weights_ifm2
+			use_scale = !(st.ofm.precision & 0x100);
+			ret = calc_sizes(ddev, info, cmd, &st, true, use_ifm2,
+					 !use_ifm2, use_scale);
+			if (ret)
+				goto fault;
+			break;
+		case NPU_OP_POOL:
+			use_ifm = param != 0x4;  // pooling mode
+			use_scale = !(st.ofm.precision & 0x100);
+			ret = calc_sizes(ddev, info, cmd, &st, use_ifm, false,
+					 false, use_scale);
+			if (ret)
+				goto fault;
+			break;
+		case NPU_OP_ELEMENTWISE:
+			use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) ||
+				(param == 6) || (param == 7) || (param == 0x24));
+			use_ifm = st.ifm.broadcast != 8;
+			ret = calc_sizes_elemwise(ddev, info, cmd, &st, use_ifm, use_ifm2);
+			if (ret)
+				goto fault;
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
+			if (0 /*U85*/)
+				st.weight[2].base = addr;
+			else
+				st.scale[1].base = addr;
+			break;
+		case NPU_SET_SCALE1_LENGTH: // NPU_SET_WEIGHT2_LENGTH (U85)
+			if (0 /*U85*/)
+				st.weight[1].length = cmds[1];
+			else
+				st.scale[1].length = cmds[1];
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
+
+	}
+
+	for (i = 0; i < NPU_BASEP_REGION_MAX; i++) {
+		if (!info->region_size[i])
+			continue;
+		dev_dbg(ddev->dev, "region %d max size: 0x%llx\n",
+			i, info->region_size[i]);
+	}
+
+	bo->info = info;
+	return 0;
+
+fault:
+	kfree(info);
+	return ret;
+}
+
+/**
+ * ethos_gem_cmdstream_create() - Create a GEM object and attach it to a handle.
+ * @file: DRM file.
+ * @ddev: DRM device.
+ * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
+ * @size: Size of the GEM object to allocate.
+ * @flags: Combination of drm_ethos_bo_flags flags.
+ * @handle: Pointer holding the handle pointing to the new GEM object.
+ *
+ * Return: Zero on success
+ */
+int ethos_gem_cmdstream_create(struct drm_file *file,
+			       struct drm_device *ddev,
+			       u32 size, u64 data, u32 flags, u32 *handle)
+{
+	int ret;
+	struct drm_gem_dma_object *mem;
+	struct ethos_gem_object *bo;
+
+	mem = drm_gem_dma_create(ddev, size);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	bo = to_ethos_bo(&mem->base);
+	bo->flags = flags;
+
+	ret = ethos_gem_cmdstream_copy_and_validate(ddev, (void __user *)(uintptr_t)data, bo, size);
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
diff --git a/drivers/accel/ethos/ethos_gem.h b/drivers/accel/ethos/ethos_gem.h
new file mode 100644
index 000000000000..2bcca7524af5
--- /dev/null
+++ b/drivers/accel/ethos/ethos_gem.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Arm, Ltd. */
+
+#ifndef __ETHOS_GEM_H__
+#define __ETHOS_GEM_H__
+
+#include "ethos_device.h"
+#include <drm/drm_gem_dma_helper.h>
+
+struct ethos_validated_cmdstream_info {
+	u32 cmd_size;
+	u64 region_size[NPU_BASEP_REGION_MAX];
+	bool output_region[NPU_BASEP_REGION_MAX];
+};
+
+/**
+ * struct ethos_gem_object - Driver specific GEM object.
+ */
+struct ethos_gem_object {
+	/** @base: Inherit from drm_gem_shmem_object. */
+	struct drm_gem_dma_object base;
+
+	struct ethos_validated_cmdstream_info *info;
+
+	/** @flags: Combination of drm_ethos_bo_flags flags. */
+	u32 flags;
+};
+
+static inline
+struct ethos_gem_object *to_ethos_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_dma_obj(obj), struct ethos_gem_object, base);
+}
+
+struct drm_gem_object *ethos_gem_create_object(struct drm_device *ddev,
+					       size_t size);
+
+int ethos_gem_create_with_handle(struct drm_file *file,
+				 struct drm_device *ddev,
+				 u64 *size, u32 flags, uint32_t *handle);
+
+int ethos_gem_cmdstream_create(struct drm_file *file,
+			       struct drm_device *ddev,
+			       u32 size, u64 data, u32 flags, u32 *handle);
+
+#endif /* __ETHOS_GEM_H__ */
diff --git a/drivers/accel/ethos/ethos_job.c b/drivers/accel/ethos/ethos_job.c
new file mode 100644
index 000000000000..0fa57fc14a54
--- /dev/null
+++ b/drivers/accel/ethos/ethos_job.c
@@ -0,0 +1,527 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+/* Copyright 2025 Arm, Ltd. */
+
+#include <linux/genalloc.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/ethos_accel.h>
+
+#include "ethos_device.h"
+#include "ethos_drv.h"
+#include "ethos_gem.h"
+#include "ethos_job.h"
+
+#define JOB_TIMEOUT_MS 500
+
+static struct ethos_job *to_ethos_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct ethos_job, base);
+}
+
+static const char *ethos_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "ethos";
+}
+
+static const char *ethos_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "ethos-npu";
+}
+
+static const struct dma_fence_ops ethos_fence_ops = {
+	.get_driver_name = ethos_fence_get_driver_name,
+	.get_timeline_name = ethos_fence_get_timeline_name,
+};
+
+static struct dma_fence *ethos_fence_create(struct ethos_device *dev)
+{
+	struct dma_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(fence, &ethos_fence_ops, &dev->fence_lock,
+		       dev->fence_context, ++dev->emit_seqno);
+
+	return fence;
+}
+
+static void ethos_job_hw_submit(struct ethos_device *dev, struct ethos_job *job)
+{
+	struct drm_gem_dma_object *cmd_bo = to_drm_gem_dma_obj(job->cmd_bo);
+	struct ethos_validated_cmdstream_info *cmd_info = to_ethos_bo(job->cmd_bo)->info;
+
+	/* Don't queue the job if a reset is in progress */
+	if (atomic_read(&dev->reset.pending))
+		return;
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
+			       dev->regs + NPU_REG_BASEP(ETHOS_SRAM_REGION));
+		writel_relaxed(upper_32_bits(dev->sramphys),
+			       dev->regs + NPU_REG_BASEP_HI(ETHOS_SRAM_REGION));
+		dev_dbg(dev->base.dev, "Region %d base addr = %pad (SRAM)\n",
+			 ETHOS_SRAM_REGION, &dev->sramphys);
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
+static int ethos_acquire_object_fences(struct ethos_job *job)
+{
+	int i, ret;
+	struct drm_gem_object **bos = job->region_bo;
+	struct ethos_validated_cmdstream_info *info = to_ethos_bo(job->cmd_bo)->info;
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
+static void ethos_attach_object_fences(struct ethos_job *job)
+{
+	int i;
+	struct dma_fence *fence = job->inference_done_fence;
+	struct drm_gem_object **bos = job->region_bo;
+	struct ethos_validated_cmdstream_info *info = to_ethos_bo(job->cmd_bo)->info;
+
+	for (i = 0; i < job->region_cnt; i++)
+		if (info->output_region[job->region_bo_num[i]])
+			dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
+}
+
+static int ethos_job_do_push(struct ethos_job *job)
+{
+	struct ethos_device *dev = job->dev;
+	int ret;
+
+	guard(mutex)(&dev->sched_lock);
+
+	drm_sched_job_arm(&job->base);
+
+	job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	ret = ethos_acquire_object_fences(job);
+	if (ret)
+		return ret;
+
+	kref_get(&job->refcount); /* put by scheduler job completion */
+
+	drm_sched_entity_push_job(&job->base);
+
+	return 0;
+}
+
+static int ethos_job_push(struct ethos_job *job)
+{
+	struct ww_acquire_ctx acquire_ctx;
+	int ret;
+
+	ret = drm_gem_lock_reservations(job->region_bo, job->region_cnt, &acquire_ctx);
+	if (ret)
+		return ret;
+
+	ret = ethos_job_do_push(job);
+	if (!ret)
+		ethos_attach_object_fences(job);
+
+	drm_gem_unlock_reservations(job->region_bo, job->region_cnt, &acquire_ctx);
+	return ret;
+}
+
+static void ethos_job_cleanup(struct kref *ref)
+{
+	struct ethos_job *job = container_of(ref, struct ethos_job,
+						refcount);
+	unsigned int i;
+
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->inference_done_fence);
+
+	for (i = 0; i < job->region_cnt; i++)
+		drm_gem_object_put(job->region_bo[i]);
+
+	kfree(job);
+}
+
+static void ethos_job_put(struct ethos_job *job)
+{
+	kref_put(&job->refcount, ethos_job_cleanup);
+}
+
+static void ethos_job_free(struct drm_sched_job *sched_job)
+{
+	struct ethos_job *job = to_ethos_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+	ethos_job_put(job);
+}
+
+static struct dma_fence *ethos_job_run(struct drm_sched_job *sched_job)
+{
+	struct ethos_job *job = to_ethos_job(sched_job);
+	struct ethos_device *dev = job->dev;
+	struct dma_fence *fence = NULL;
+	int ret;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	fence = ethos_fence_create(dev);
+	if (IS_ERR(fence))
+		return fence;
+
+	if (job->done_fence)
+		dma_fence_put(job->done_fence);
+	job->done_fence = dma_fence_get(fence);
+
+	ret = pm_runtime_get_sync(dev->base.dev);
+	if (ret < 0)
+		return fence;
+
+	scoped_guard(mutex, &dev->job_lock) {
+		dev->in_flight_job = job;
+		ethos_job_hw_submit(dev, job);
+	}
+
+	return fence;
+}
+
+static void ethos_job_handle_irq(struct ethos_device *dev)
+{
+	u32 status;
+
+	pm_runtime_mark_last_busy(dev->base.dev);
+
+	status = readl_relaxed(dev->regs + NPU_REG_STATUS);
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
+			pm_runtime_put_autosuspend(dev->base.dev);
+			dev->in_flight_job = NULL;
+		}
+	}
+}
+
+static irqreturn_t ethos_job_irq_handler_thread(int irq, void *data)
+{
+	struct ethos_device *dev = data;
+
+	ethos_job_handle_irq(dev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ethos_job_irq_handler(int irq, void *data)
+{
+	struct ethos_device *dev = data;
+	u32 status = readl_relaxed(dev->regs + NPU_REG_STATUS);
+
+	if (!(status & STATUS_IRQ_RAISED))
+		return IRQ_NONE;
+
+	writel_relaxed(CMD_CLEAR_IRQ, dev->regs + NPU_REG_CMD);
+	return IRQ_WAKE_THREAD;
+}
+
+static void ethos_reset(struct ethos_device *dev, struct drm_sched_job *bad)
+{
+	if (!atomic_read(&dev->reset.pending))
+		return;
+
+	drm_sched_stop(&dev->sched, bad);
+
+	/*
+	 * Remaining interrupts have been handled, but we might still have
+	 * stuck jobs. Let's make sure the PM counters stay balanced by
+	 * manually calling pm_runtime_put_noidle().
+	 */
+	scoped_guard(mutex, &dev->job_lock) {
+		if (dev->in_flight_job)
+			pm_runtime_put_noidle(dev->base.dev);
+
+		dev->in_flight_job = NULL;
+	}
+
+	/* Proceed with reset now. */
+	pm_runtime_force_suspend(dev->base.dev);
+	pm_runtime_force_resume(dev->base.dev);
+
+	/* NPU has been reset, we can clear the reset pending bit. */
+	atomic_set(&dev->reset.pending, 0);
+
+	/* Restart the scheduler */
+	drm_sched_start(&dev->sched, 0);
+}
+
+static enum drm_gpu_sched_stat ethos_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct ethos_device *dev = to_ethos_job(sched_job)->dev;
+
+	dev_err(dev->base.dev, "NPU sched timed out\n");
+
+	atomic_set(&dev->reset.pending, 1);
+	ethos_reset(dev, sched_job);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+static void ethos_reset_work(struct work_struct *work)
+{
+	struct ethos_device *dev;
+
+	dev = container_of(work, struct ethos_device, reset.work);
+	ethos_reset(dev, NULL);
+}
+
+static const struct drm_sched_backend_ops ethos_sched_ops = {
+	.run_job = ethos_job_run,
+	.timedout_job = ethos_job_timedout,
+	.free_job = ethos_job_free
+};
+
+int ethos_job_init(struct ethos_device *dev)
+{
+	struct drm_sched_init_args args = {
+		.ops = &ethos_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.name = dev_name(dev->base.dev),
+		.dev = dev->base.dev,
+	};
+	int ret;
+
+	INIT_WORK(&dev->reset.work, ethos_reset_work);
+	spin_lock_init(&dev->fence_lock);
+	mutex_init(&dev->job_lock);
+
+	dev->irq = platform_get_irq(to_platform_device(dev->base.dev), 0);
+	if (dev->irq < 0)
+		return dev->irq;
+
+	ret = devm_request_threaded_irq(dev->base.dev, dev->irq,
+					ethos_job_irq_handler,
+					ethos_job_irq_handler_thread,
+					IRQF_SHARED, KBUILD_MODNAME,
+					dev);
+	if (ret) {
+		dev_err(dev->base.dev, "failed to request irq");
+		return ret;
+	}
+
+	dev->reset.wq = alloc_ordered_workqueue("ethos-reset", 0);
+	if (!dev->reset.wq)
+		return -ENOMEM;
+
+	dev->fence_context = dma_fence_context_alloc(1);
+
+	args.timeout_wq = dev->reset.wq;
+	ret = drm_sched_init(&dev->sched, &args);
+	if (ret) {
+		dev_err(dev->base.dev, "Failed to create scheduler: %d.", ret);
+		goto err_sched;
+	}
+
+	return 0;
+
+err_sched:
+	drm_sched_fini(&dev->sched);
+
+	destroy_workqueue(dev->reset.wq);
+	return ret;
+}
+
+void ethos_job_fini(struct ethos_device *dev)
+{
+	drm_sched_fini(&dev->sched);
+
+	cancel_work_sync(&dev->reset.work);
+	destroy_workqueue(dev->reset.wq);
+}
+
+int ethos_job_open(struct ethos_file_priv *ethos_priv)
+{
+	struct ethos_device *dev = ethos_priv->edev;
+	struct drm_gpu_scheduler *sched = &dev->sched;
+	int ret;
+
+	ret = drm_sched_entity_init(&ethos_priv->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    &sched, 1, NULL);
+	return WARN_ON(ret);
+}
+
+void ethos_job_close(struct ethos_file_priv *ethos_priv)
+{
+	struct drm_sched_entity *entity = &ethos_priv->sched_entity;
+
+	drm_sched_entity_destroy(entity);
+}
+
+int ethos_job_is_idle(struct ethos_device *dev)
+{
+	/* If there are any jobs in this HW queue, we're not idle */
+	if (atomic_read(&dev->sched.credit_count))
+		return false;
+
+	return true;
+}
+
+static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
+				   struct drm_ethos_job *job)
+{
+	struct ethos_device *edev = to_ethos_device(dev);
+	struct ethos_file_priv *file_priv = file->driver_priv;
+	struct ethos_job *ejob = NULL;
+	struct ethos_validated_cmdstream_info *cmd_info;
+	int ret = 0;
+
+	/* BO region 2 is reserved if SRAM is used */
+	if (job->region_bo_handles[ETHOS_SRAM_REGION] && job->sram_size)
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
+	ret = drm_sched_job_init(&ejob->base,
+				 &file_priv->sched_entity,
+				 1, NULL);
+	if (ret)
+		goto out_put_job;
+
+	ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
+	cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
+	if (!ejob->cmd_bo)
+		goto out_cleanup_job;
+
+	for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
+		struct drm_gem_object *gem;
+
+		if (job->region_bo_handles[i] == 0)
+			continue;
+
+		/* Don't allow a region to point to the cmd BO */
+		if (job->region_bo_handles[i] == job->cmd_bo) {
+			ret = -EINVAL;
+			goto out_cleanup_job;
+		}
+
+		gem = drm_gem_object_lookup(file, job->region_bo_handles[i]);
+
+		/* Verify the command stream doesn't have accesses outside the BO */
+		if (cmd_info->region_size[i] > gem->size) {
+			dev_err(dev->dev,
+				"cmd stream region %d size greater than BO size (%llu > %zu)\n",
+				i, cmd_info->region_size[i], gem->size);
+			ret = -EOVERFLOW;
+			goto out_cleanup_job;
+		}
+
+		ejob->region_bo[ejob->region_cnt] = gem;
+		ejob->region_bo_num[ejob->region_cnt] = i;
+		ejob->region_cnt++;
+	}
+	ret = ethos_job_push(ejob);
+	if (ret)
+		goto out_cleanup_job;
+
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&ejob->base);
+out_put_job:
+	ethos_job_put(ejob);
+
+	return ret;
+}
+
+int ethos_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_ethos_submit *args = data;
+	struct drm_ethos_job *jobs;
+	int ret = 0;
+	unsigned int i = 0;
+
+	if (args->pad) {
+		drm_dbg(dev, "Reserved field in drm_ethos_submit struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
+	if (!jobs)
+		return -ENOMEM;
+
+	if (copy_from_user(jobs,
+			   (void __user *)(uintptr_t)args->jobs,
+			   args->job_count * sizeof(*jobs))) {
+		ret = -EFAULT;
+		drm_dbg(dev, "Failed to copy incoming job array\n");
+		goto exit;
+	}
+
+	for (i = 0; i < args->job_count; i++) {
+		ret = ethos_ioctl_submit_job(dev, file, &jobs[i]);
+		if (ret)
+			break;
+	}
+
+exit:
+	kfree(jobs);
+
+	return ret;
+}
diff --git a/drivers/accel/ethos/ethos_job.h b/drivers/accel/ethos/ethos_job.h
new file mode 100644
index 000000000000..c6bfe7361b4f
--- /dev/null
+++ b/drivers/accel/ethos/ethos_job.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+/* Copyright 2025 Arm, Ltd. */
+
+#ifndef __ETHOS_JOB_H__
+#define __ETHOS_JOB_H__
+
+#include <linux/kref.h>
+#include <drm/gpu_scheduler.h>
+
+struct ethos_device;
+struct ethos_file_priv;
+
+struct ethos_job {
+	struct drm_sched_job base;
+	struct ethos_device *dev;
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
+int ethos_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
+
+int ethos_job_init(struct ethos_device *dev);
+void ethos_job_fini(struct ethos_device *dev);
+int ethos_job_open(struct ethos_file_priv *ethos_priv);
+void ethos_job_close(struct ethos_file_priv *ethos_priv);
+int ethos_job_is_idle(struct ethos_device *dev);
+
+#endif
diff --git a/include/uapi/drm/ethos_accel.h b/include/uapi/drm/ethos_accel.h
new file mode 100644
index 000000000000..43f8d86c70b5
--- /dev/null
+++ b/include/uapi/drm/ethos_accel.h
@@ -0,0 +1,262 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright (C) 2025 Arm, Ltd. */
+#ifndef _ETHOS_DRM_H_
+#define _ETHOS_DRM_H_
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
+ * enum drm_ethos_ioctl_id - IOCTL IDs
+ *
+ * Place new ioctls at the end, don't re-order, don't replace or remove entries.
+ *
+ * These IDs are not meant to be used directly. Use the DRM_IOCTL_ETHOS_xxx
+ * definitions instead.
+ */
+enum drm_ethos_ioctl_id {
+	/** @DRM_ETHOS_DEV_QUERY: Query device information. */
+	DRM_ETHOS_DEV_QUERY = 0,
+
+	/** @DRM_ETHOS_BO_CREATE: Create a buffer object. */
+	DRM_ETHOS_BO_CREATE,
+
+	/** @DRM_ETHOS_BO_WAIT: Wait on a buffer object's fence. */
+	DRM_ETHOS_BO_WAIT,
+
+	/**
+	 * @DRM_ETHOS_BO_MMAP_OFFSET: Get the file offset to pass to
+	 * mmap to map a GEM object.
+	 */
+	DRM_ETHOS_BO_MMAP_OFFSET,
+
+	/**
+	 * @DRM_ETHOS_CMDSTREAM_BO_CREATE: Create a command stream buffer
+	 * object.
+	 */
+	DRM_ETHOS_CMDSTREAM_BO_CREATE,
+
+	/** @DRM_ETHOS_SUBMIT: Submit a job and BOs to run. */
+	DRM_ETHOS_SUBMIT,
+};
+
+/**
+ * DOC: IOCTL arguments
+ */
+
+/**
+ * enum drm_ethos_dev_query_type - Query type
+ *
+ * Place new types at the end, don't re-order, don't remove or replace.
+ */
+enum drm_ethos_dev_query_type {
+	/** @DRM_ETHOS_DEV_QUERY_NPU_INFO: Query NPU information. */
+	DRM_ETHOS_DEV_QUERY_NPU_INFO = 0,
+};
+
+/**
+ * struct drm_ethos_gpu_info - NPU information
+ *
+ * Structure grouping all queryable information relating to the NPU.
+ */
+struct drm_ethos_npu_info {
+	/** @id : NPU ID. */
+	__u32 id;
+#define DRM_ETHOS_ARCH_MAJOR(x)			((x) >> 28)
+#define DRM_ETHOS_ARCH_MINOR(x)			(((x) >> 20) & 0xff)
+#define DRM_ETHOS_ARCH_PATCH(x)			(((x) >> 16) & 0xf)
+#define DRM_ETHOS_PRODUCT_MAJOR(x)		(((x) >> 12) & 0xf)
+#define DRM_ETHOS_VERSION_MAJOR(x)		(((x) >> 8) & 0xf)
+#define DRM_ETHOS_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
+#define DRM_ETHOS_VERSION_STATUS(x)		((x) & 0xf)
+
+	/** @gpu_rev: GPU revision. */
+	__u32 config;
+
+	__u32 sram_size;
+};
+/**
+ * struct drm_ethos_dev_query - Arguments passed to DRM_ETHOS_IOCTL_DEV_QUERY
+ */
+struct drm_ethos_dev_query {
+	/** @type: the query type (see drm_ethos_dev_query_type). */
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
+ * enum drm_ethos_bo_flags - Buffer object flags, passed at creation time.
+ */
+enum drm_ethos_bo_flags {
+	/**
+	 * @DRM_ETHOS_BO_NO_MMAP: The buffer object will never be CPU-mapped
+	 * in userspace.
+	 */
+	DRM_ETHOS_BO_NO_MMAP = (1 << 0),
+};
+
+/**
+ * struct drm_ethos_bo_create - Arguments passed to DRM_IOCTL_ETHOS_BO_CREATE.
+ */
+struct drm_ethos_bo_create {
+	/**
+	 * @size: Requested size for the object
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 */
+	__u64 size;
+
+	/**
+	 * @flags: Flags. Must be a combination of drm_ethos_bo_flags flags.
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
+ * struct drm_ethos_bo_mmap_offset - Arguments passed to DRM_IOCTL_ETHOS_BO_MMAP_OFFSET.
+ */
+struct drm_ethos_bo_mmap_offset {
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
+ * struct drm_ethos_wait_bo - ioctl argument for waiting for
+ * completion of the last DRM_ETHOS_SUBMIT on a BO.
+ *
+ * This is useful for cases where multiple processes might be
+ * rendering to a BO and you want to wait for all rendering to be
+ * completed.
+ */
+struct drm_ethos_bo_wait {
+	__u32 handle;
+	__u32 pad;
+	__s64 timeout_ns;	/* absolute */
+};
+
+
+struct drm_ethos_cmdstream_bo_create {
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
+ * struct drm_ethos_job - A job to be run on the NPU
+ *
+ * The kernel will schedule the execution of this job taking into account its
+ * dependencies with other jobs. All tasks in the same job will be executed
+ * sequentially on the same core, to benefit from memory residency in SRAM.
+ */
+struct drm_ethos_job {
+	/** Input: BO handle for cmdstream. */
+	__u32 cmd_bo;
+
+	/** Input: Amount of SRAM to use. */
+	__u32 sram_size;
+
+#define ETHOS_MAX_REGIONS	8
+	/** Input: Array of BO handles for each region. */
+	__u32 region_bo_handles[ETHOS_MAX_REGIONS];
+};
+
+/**
+ * struct drm_ethos_submit - ioctl argument for submitting commands to the NPU.
+ *
+ * The kernel will schedule the execution of these jobs in dependency order.
+ */
+struct drm_ethos_submit {
+	/** Input: Pointer to an array of struct drm_ethos_job. */
+	__u64 jobs;
+
+	/** Input: Number of jobs passed in. */
+	__u32 job_count;
+
+	/** Reserved, must be zero. */
+	__u32 pad;
+};
+
+
+/**
+ * DRM_IOCTL_ETHOS() - Build a ethos IOCTL number
+ * @__access: Access type. Must be R, W or RW.
+ * @__id: One of the DRM_ETHOS_xxx id.
+ * @__type: Suffix of the type being passed to the IOCTL.
+ *
+ * Don't use this macro directly, use the DRM_IOCTL_ETHOS_xxx
+ * values instead.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define DRM_IOCTL_ETHOS(__access, __id, __type) \
+	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_ETHOS_ ## __id, \
+			   struct drm_ethos_ ## __type)
+
+enum {
+	DRM_IOCTL_ETHOS_DEV_QUERY =
+		DRM_IOCTL_ETHOS(WR, DEV_QUERY, dev_query),
+	DRM_IOCTL_ETHOS_BO_CREATE =
+		DRM_IOCTL_ETHOS(WR, BO_CREATE, bo_create),
+	DRM_IOCTL_ETHOS_BO_WAIT =
+		DRM_IOCTL_ETHOS(WR, BO_WAIT, bo_wait),
+	DRM_IOCTL_ETHOS_BO_MMAP_OFFSET =
+		DRM_IOCTL_ETHOS(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_ETHOS_CMDSTREAM_BO_CREATE =
+		DRM_IOCTL_ETHOS(WR, CMDSTREAM_BO_CREATE, cmdstream_bo_create),
+	DRM_IOCTL_ETHOS_SUBMIT =
+		DRM_IOCTL_ETHOS(WR, SUBMIT, submit),
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _ETHOS_DRM_H_ */

-- 
2.47.2

