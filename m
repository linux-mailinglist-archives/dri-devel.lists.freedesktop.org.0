Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77104B02FFE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5510E152;
	Sun, 13 Jul 2025 08:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CFF10E149
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:04 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso714439366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395943; x=1753000743;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMiXIrmKsUVlfBcC+Mvov3+rHZjXokr3HXS7jyEvnoY=;
 b=C6ImoeYJqL0f4qw+COxzsbQtRpHCWrhUODB0U8BgpvvHeOtMUf60AVaW9cii8J/uMq
 rN+AGapGu91e5FeRZAsH8N+/BimouDkMoGHyNbPcHOh2r2OllrArqVZ8bnXFxc9rM0Z7
 ZNAHyokFNEFD5ZCKf045HLnI/OM/H63s7cBjN8UejCy54958mSEa4/Qen7VirbpHl/7C
 y1gQ4EDISnTe1AvQQ5LkLSY1obJCSHrb8fhJ0gUziT3xQbHO6d/maUIupWGWvvPCaAPw
 CHL045i/syX4KdVEMb9Fn8LfHe+yWSbpU8ORu7FbFYERLGFAXEzdaZ3oh/N7kQl/4Dyk
 t+ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHkhOJghulMUIjwo4LVV5xy9zWVsMCitrPHVt0x6RI1BOLIsf0zOwVBahvcnZUOZPl4l3wGdNTZqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAfDs/cILzAXF8UP7rjdLMvzQvP0XpzZunVMhKohvgdABpQt8Q
 FXNPuBXIi2hpdWGFFZGJtRdu+FiP1lFCTOqz8ElEk9XwLhdctbo57lLT
X-Gm-Gg: ASbGnctTjHYOXXuYQAi6sjR1k5SRXNYGfNsPfiJdcVZDXbOONB5bDhUYkADHLHWUNwY
 AzaGp1K8SzIuRuo+e4uoHeO3fZbLFXZIjhJh9kBkNl0gdoyvfXYytsPnSCoXry/cT4Rc0BnwuF2
 z/hHA4jXpC5PPzr66Fczmr6S0EqrtVqvWvM+YNnuWYcXKRfzwoP9H36PiZKXn/EnJ/eDXgevRmS
 CS8Ig/l93frqvy8Os/5TPi/oZ18wIH+Gwm3AlsCr3ryXdKl3S+XhxvnLGtyIuxTDMWFzz4VQ+lU
 YD1Ock4n35SRAlAb3p17xBG1ycnqDAmquRoPa0nHuZdHPLCV3bXD+lCFbzRFhB4BAGaL7D+uA4E
 zLgkksmk5hn+omGFVfdJPWDRQYUpYBQ79GcY4nQkir+O9VnlMgVYwCLtK
X-Google-Smtp-Source: AGHT+IEEapecy6If7fMnnNG7jf95Ga8/Go2zDEV8xGXASa+XFZ8RHznsn0vImZSZkEQwMwklzQauIQ==
X-Received: by 2002:a17:907:c301:b0:ae6:de90:9e26 with SMTP id
 a640c23a62f3a-ae6fcc78a61mr914298066b.56.1752395942986; 
 Sun, 13 Jul 2025 01:39:02 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:02 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:52 +0200
Subject: [PATCH v8 02/10] accel/rocket: Add a new driver for Rockchip's NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.14.2
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

This initial version supports the NPU as shipped in the RK3588 SoC and
described in the first part of its TRM, in Chapter 36.

This NPU contains 3 independent cores that the driver can submit jobs
to.

This commit adds just hardware initialization and power management.

v2:
- Split cores and IOMMUs as independent devices (Sebastian Reichel)
- Add some documentation (Jeffrey Hugo)
- Be more explicit in the Kconfig documentation (Jeffrey Hugo)
- Remove resets, as these haven't been found useful so far (Zenghui Yu)
- Repack structs (Jeffrey Hugo)
- Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
- Use devm_drm_dev_alloc (Jeffrey Hugo)
- Use probe log helper (Jeffrey Hugo)
- Introduce UABI header in a later patch (Jeffrey Hugo)

v3:
- Adapt to a split of the register block in the DT bindings (Nicolas
  Frattaroli)
- Move registers header to its own commit (Thomas Zimmermann)
- Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
- Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
- PM improvements (Nicolas Frattaroli)

v4:
- Use bulk clk API (Krzysztof Kozlowski)

v6:
- Remove mention to NVDLA, as the hardware is only incidentally related
  (Kever Yang)
- Use calloc instead of GFP_ZERO (Jeff Hugo)
- Explicitly include linux/container_of.h (Jeff Hugo)
- pclk and npu clocks are now needed by all cores (Rob Herring)

v7:
- Assign its own IOMMU domain to each client, for isolation (Daniel
  Stone and Robin Murphy)

v8:
- Kconfig: fix depends to be more explicit about Rockchip, and remove
  superfluous selects (Robin Murphy)
- Use reset lines to reset the cores (Robin Murphy)
- Reference count the module
- Set dma_set_max_seg_size
- Correctly acquire a reference to the IOMMU (Robin Murphy)
- Remove notion of top core (Robin Murphy)

Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 Documentation/accel/index.rst        |   1 +
 Documentation/accel/rocket/index.rst |  19 +++
 MAINTAINERS                          |  10 ++
 drivers/accel/Kconfig                |   1 +
 drivers/accel/Makefile               |   1 +
 drivers/accel/rocket/Kconfig         |  24 ++++
 drivers/accel/rocket/Makefile        |   8 ++
 drivers/accel/rocket/rocket_core.c   | 100 ++++++++++++++
 drivers/accel/rocket/rocket_core.h   |  49 +++++++
 drivers/accel/rocket/rocket_device.c |  56 ++++++++
 drivers/accel/rocket/rocket_device.h |  28 ++++
 drivers/accel/rocket/rocket_drv.c    | 261 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_drv.h    |  23 +++
 13 files changed, 581 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index bc85f26533d88891dde482f91e26c99991b22869..d8fa332d60a890dbb617454d2a26d9b6f9b196aa 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,6 +10,7 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   rocket/index
 
 .. only::  subproject and html
 
diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
new file mode 100644
index 0000000000000000000000000000000000000000..70f97bccf100022550ac7a0718dc77094f1a8c28
--- /dev/null
+++ b/Documentation/accel/rocket/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================
+ accel/rocket Rockchip NPU driver
+=====================================
+
+The accel/rocket driver supports the Neural Processing Units (NPUs) inside some
+Rockchip SoCs such as the RK3588. Rockchip calls it RKNN and sometimes RKNPU.
+
+The hardware is described in chapter 36 in the RK3588 TRM.
+
+This driver just powers the hardware on and off, allocates and maps buffers to
+the device and submits jobs to the frontend unit. Everything else is done in
+userspace, as a Gallium driver (also called rocket) that is part of the Mesa3D
+project.
+
+Hardware currently supported:
+
+* RK3588
diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..3ae890e178d1455d99323a5941972a50e82b70b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7390,6 +7390,16 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/ivpu/
 F:	include/uapi/drm/ivpu_accel.h
 
+DRM ACCEL DRIVER FOR ROCKCHIP NPU
+M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/rocket/
+F:	Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
+F:	drivers/accel/rocket/
+F:	include/uapi/drm/rocket_accel.h
+
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 5b9490367a39fd12d35a8d9021768aa186c09308..bb01cebc42bf16ebf02e938040f339ff94869e33 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4c515430175c5e2ba9190f6dc9158..ffc3fa58866616d933184a7659573cd4d4780a8d 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..43d6cd98ec8e4e3448df4d032da720932e2db9c3
--- /dev/null
+++ b/drivers/accel/rocket/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_ROCKET
+       tristate "Rocket (support for Rockchip NPUs)"
+       depends on DRM
+       depends on (ARCH_ROCKCHIP && ARM64) || COMPILE_TEST
+       depends on ROCKCHIP_IOMMU || COMPILE_TEST
+       depends on MMU
+       select DRM_SCHED
+       select DRM_GEM_SHMEM_HELPER
+       help
+	  Choose this option if you have a Rockchip SoC that contains a
+	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
+	  Rockchip either RKNN or RKNPU, it accelerates inference of neural
+	  networks.
+
+	  The interface exposed to userspace is described in
+	  include/uapi/drm/rocket_accel.h and is used by the Rocket userspace
+	  driver in Mesa3D.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rocket.
diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96
--- /dev/null
+++ b/drivers/accel/rocket/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
+
+rocket-y := \
+	rocket_core.o \
+	rocket_device.o \
+	rocket_drv.o
diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
new file mode 100644
index 0000000000000000000000000000000000000000..9be964b5fbaef31f9b283b8da6fe15e6c540e916
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/iommu.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include "rocket_core.h"
+
+int rocket_core_init(struct rocket_core *core)
+{
+	struct device *dev = core->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	u32 version;
+	int err = 0;
+
+	core->resets[0].id = "srst_a";
+	core->resets[1].id = "srst_h";
+	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
+						    core->resets);
+	if (err)
+		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
+
+	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
+	if (err)
+		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
+
+	core->pc_iomem = devm_platform_ioremap_resource_byname(pdev, "pc");
+	if (IS_ERR(core->pc_iomem)) {
+		dev_err(dev, "couldn't find PC registers %ld\n", PTR_ERR(core->pc_iomem));
+		return PTR_ERR(core->pc_iomem);
+	}
+
+	core->cna_iomem = devm_platform_ioremap_resource_byname(pdev, "cna");
+	if (IS_ERR(core->cna_iomem)) {
+		dev_err(dev, "couldn't find CNA registers %ld\n", PTR_ERR(core->cna_iomem));
+		return PTR_ERR(core->cna_iomem);
+	}
+
+	core->core_iomem = devm_platform_ioremap_resource_byname(pdev, "core");
+	if (IS_ERR(core->core_iomem)) {
+		dev_err(dev, "couldn't find CORE registers %ld\n", PTR_ERR(core->core_iomem));
+		return PTR_ERR(core->core_iomem);
+	}
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	if (err)
+		return err;
+
+	core->iommu_group = iommu_group_get(dev);
+
+	pm_runtime_use_autosuspend(dev);
+
+	/*
+	 * As this NPU will be most often used as part of a media pipeline that
+	 * ends presenting in a display, choose 50 ms (~3 frames at 60Hz) as an
+	 * autosuspend delay as that will keep the device powered up while the
+	 * pipeline is running.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 50);
+
+	pm_runtime_enable(dev);
+
+	err = pm_runtime_get_sync(dev);
+
+	version = rocket_pc_readl(core, VERSION);
+	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
+
+	return 0;
+}
+
+void rocket_core_fini(struct rocket_core *core)
+{
+	pm_runtime_dont_use_autosuspend(core->dev);
+	pm_runtime_disable(core->dev);
+	iommu_group_put(core->iommu_group);
+	core->iommu_group = NULL;
+}
+
+void rocket_core_reset(struct rocket_core *core)
+{
+	reset_control_bulk_assert(ARRAY_SIZE(core->resets), core->resets);
+
+	udelay(10);
+
+	reset_control_bulk_deassert(ARRAY_SIZE(core->resets), core->resets);
+}
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
new file mode 100644
index 0000000000000000000000000000000000000000..660de2d70f7d9294bc4db8b235b3796941136307
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_CORE_H__
+#define __ROCKET_CORE_H__
+
+#include <drm/gpu_scheduler.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mutex_types.h>
+#include <linux/reset.h>
+
+#include "rocket_registers.h"
+
+#define rocket_pc_readl(core, reg) \
+	readl((core)->pc_iomem + (REG_PC_##reg))
+#define rocket_pc_writel(core, reg, value) \
+	writel(value, (core)->pc_iomem + (REG_PC_##reg))
+
+#define rocket_cna_readl(core, reg) \
+	readl((core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
+#define rocket_cna_writel(core, reg, value) \
+	writel(value, (core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
+
+#define rocket_core_readl(core, reg) \
+	readl((core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
+#define rocket_core_writel(core, reg, value) \
+	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
+
+struct rocket_core {
+	struct device *dev;
+	struct rocket_device *rdev;
+	unsigned int index;
+
+	int irq;
+	void __iomem *pc_iomem;
+	void __iomem *cna_iomem;
+	void __iomem *core_iomem;
+	struct clk_bulk_data clks[4];
+	struct reset_control_bulk_data resets[2];
+
+	struct iommu_group *iommu_group;
+};
+
+int rocket_core_init(struct rocket_core *core);
+void rocket_core_fini(struct rocket_core *core);
+void rocket_core_reset(struct rocket_core *core);
+
+#endif
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
new file mode 100644
index 0000000000000000000000000000000000000000..b05a0df91d48385ce4ada22137842b3e819f8266
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_drv.h>
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include "rocket_device.h"
+
+struct rocket_device *rocket_device_init(struct platform_device *pdev,
+					 const struct drm_driver *rocket_drm_driver)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *core_node;
+	struct rocket_device *rdev;
+	struct drm_device *ddev;
+	unsigned int num_cores = 0;
+	int err;
+
+	rdev = devm_drm_dev_alloc(dev, rocket_drm_driver, struct rocket_device, ddev);
+	if (IS_ERR(rdev))
+		return rdev;
+
+	ddev = &rdev->ddev;
+	dev_set_drvdata(dev, rdev);
+
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
+		if (of_device_is_available(core_node))
+			num_cores++;
+
+	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
+	if (!rdev->cores)
+		return ERR_PTR(-ENOMEM);
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	if (err)
+		return ERR_PTR(err);
+
+	err = drm_dev_register(ddev, 0);
+	if (err)
+		return ERR_PTR(err);
+
+	return rdev;
+}
+
+void rocket_device_fini(struct rocket_device *rdev)
+{
+	WARN_ON(rdev->num_cores > 0);
+
+	drm_dev_unregister(&rdev->ddev);
+}
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
new file mode 100644
index 0000000000000000000000000000000000000000..a5a5857bb1991161ebfbdcbffacd75bbb579c572
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DEVICE_H__
+#define __ROCKET_DEVICE_H__
+
+#include <drm/drm_device.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/iommu.h>
+#include <linux/platform_device.h>
+
+#include "rocket_core.h"
+
+struct rocket_device {
+	struct drm_device ddev;
+
+	struct rocket_core *cores;
+	unsigned int num_cores;
+};
+
+struct rocket_device *rocket_device_init(struct platform_device *pdev,
+					 const struct drm_driver *rocket_drm_driver);
+void rocket_device_fini(struct rocket_device *rdev);
+#define to_rocket_device(drm_dev) \
+	((struct rocket_device *)(container_of((drm_dev), struct rocket_device, ddev)))
+
+#endif /* __ROCKET_DEVICE_H__ */
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
new file mode 100644
index 0000000000000000000000000000000000000000..a5df94f6b1259ae335fbccd0105ba44f3432999c
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/iommu.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_drv.h"
+
+/*
+ * Facade device, used to expose a single DRM device to userspace, that
+ * schedules jobs to any RKNN cores in the system.
+ */
+static struct platform_device *drm_dev;
+static struct rocket_device *rdev;
+
+static void
+rocket_iommu_domain_destroy(struct kref *kref)
+{
+	struct rocket_iommu_domain *domain = container_of(kref, struct rocket_iommu_domain, kref);
+
+	iommu_domain_free(domain->domain);
+	domain->domain = NULL;
+	kfree(domain);
+}
+
+static struct rocket_iommu_domain*
+rocket_iommu_domain_create(struct device *dev)
+{
+	struct rocket_iommu_domain *domain = kmalloc(sizeof(*domain), GFP_KERNEL);
+	void *err;
+
+	if (!domain)
+		return ERR_PTR(-ENOMEM);
+
+	domain->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(domain->domain)) {
+		err = ERR_CAST(domain->domain);
+		kfree(domain);
+		return err;
+	}
+	kref_init(&domain->kref);
+
+	return domain;
+}
+
+struct rocket_iommu_domain *
+rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv)
+{
+	kref_get(&rocket_priv->domain->kref);
+	return rocket_priv->domain;
+}
+
+void
+rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
+{
+	kref_put(&domain->kref, rocket_iommu_domain_destroy);
+}
+
+static int
+rocket_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct rocket_file_priv *rocket_priv;
+	int ret;
+
+	if (!try_module_get(THIS_MODULE))
+		return -EINVAL;
+
+	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
+	if (!rocket_priv) {
+		ret = -ENOMEM;
+		goto err_put_mod;
+	}
+
+	rocket_priv->rdev = rdev;
+	rocket_priv->domain = rocket_iommu_domain_create(rdev->cores[0].dev);
+	if (IS_ERR(rocket_priv->domain)) {
+		ret = PTR_ERR(rocket_priv->domain);
+		goto err_free;
+	}
+
+	file->driver_priv = rocket_priv;
+
+	return 0;
+
+err_free:
+	kfree(rocket_priv);
+err_put_mod:
+	module_put(THIS_MODULE);
+	return ret;
+}
+
+static void
+rocket_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	rocket_iommu_domain_put(rocket_priv->domain);
+	kfree(rocket_priv);
+	module_put(THIS_MODULE);
+}
+
+static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
+#define ROCKET_IOCTL(n, func) \
+	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+};
+
+DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+
+/*
+ * Rocket driver version:
+ * - 1.0 - initial interface
+ */
+static const struct drm_driver rocket_drm_driver = {
+	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.open			= rocket_open,
+	.postclose		= rocket_postclose,
+	.ioctls			= rocket_drm_driver_ioctls,
+	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
+	.fops			= &rocket_accel_driver_fops,
+	.name			= "rocket",
+	.desc			= "rocket DRM",
+};
+
+static int rocket_probe(struct platform_device *pdev)
+{
+	if (rdev == NULL) {
+		/* First core probing, initialize DRM device. */
+		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to initialize rocket device\n");
+			return PTR_ERR(rdev);
+		}
+	}
+
+	unsigned int core = rdev->num_cores;
+
+	dev_set_drvdata(&pdev->dev, rdev);
+
+	rdev->cores[core].rdev = rdev;
+	rdev->cores[core].dev = &pdev->dev;
+	rdev->cores[core].index = core;
+
+	rdev->num_cores++;
+
+	return rocket_core_init(&rdev->cores[core]);
+}
+
+static void rocket_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+		if (rdev->cores[core].dev == dev) {
+			rocket_core_fini(&rdev->cores[core]);
+			rdev->num_cores--;
+			break;
+		}
+	}
+
+	if (rdev->num_cores == 0) {
+		/* Last core removed, deinitialize DRM device. */
+		rocket_device_fini(rdev);
+		rdev = NULL;
+	}
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static int find_core_for_dev(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+
+	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+		if (dev == rdev->cores[core].dev)
+			return core;
+	}
+
+	return -1;
+}
+
+static int rocket_device_runtime_resume(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core = find_core_for_dev(dev);
+	int err = 0;
+
+	if (core < 0)
+		return -ENODEV;
+
+	err = clk_bulk_prepare_enable(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+	if (err) {
+		dev_err(dev, "failed to enable (%d) clocks for core %d\n", err, core);
+		return err;
+	}
+
+	return 0;
+}
+
+static int rocket_device_runtime_suspend(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core = find_core_for_dev(dev);
+
+	if (core < 0)
+		return -ENODEV;
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+
+	return 0;
+}
+
+EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
+	RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static struct platform_driver rocket_driver = {
+	.probe = rocket_probe,
+	.remove = rocket_remove,
+	.driver	 = {
+		.name = "rocket",
+		.pm = pm_ptr(&rocket_pm_ops),
+		.of_match_table = dt_match,
+	},
+};
+
+static int __init rocket_register(void)
+{
+	drm_dev = platform_device_register_simple("rknn", -1, NULL, 0);
+	if (IS_ERR(drm_dev))
+		return PTR_ERR(drm_dev);
+
+	return platform_driver_register(&rocket_driver);
+}
+
+static void __exit rocket_unregister(void)
+{
+	platform_driver_unregister(&rocket_driver);
+
+	platform_device_unregister(drm_dev);
+}
+
+module_init(rocket_register);
+module_exit(rocket_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
+MODULE_AUTHOR("Tomeu Vizoso");
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
new file mode 100644
index 0000000000000000000000000000000000000000..36b1291b0ead388b8843965758c57a0405315519
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DRV_H__
+#define __ROCKET_DRV_H__
+
+#include "rocket_device.h"
+
+struct rocket_iommu_domain {
+	struct iommu_domain *domain;
+	struct kref kref;
+};
+
+struct rocket_file_priv {
+	struct rocket_device *rdev;
+
+	struct rocket_iommu_domain *domain;
+};
+
+struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
+void rocket_iommu_domain_put(struct rocket_iommu_domain *domain);
+
+#endif

-- 
2.50.0

