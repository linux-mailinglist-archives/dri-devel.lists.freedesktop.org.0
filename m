Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1A905736
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9974B10E8A0;
	Wed, 12 Jun 2024 15:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B7F10E854
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:17 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52c8342af5eso4112984e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200395; x=1718805195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EO6vHdYF0qUQNQ075RQix7pt/urGkASDc+XUE7j9ryg=;
 b=MyxvncrUvsToe8yjlSGOfJWB4piFHRs6+Dub7PUPhalSvcm4DDDsO72ohcmlgtV03M
 ZC5pqxTPPbsl8y4lFmPFsgoI+4yDyNBuGpAHEfJdQg6Ah2Zf5hLOb7ObZ/bZsef3gQId
 3EjG7m+MUUdffG6NvpF4OG0ygoLL98Q5mwGglAfOVd51sbl8PxkvidcAVVFgPb/+YtHw
 gGs2TfZICZ3Vvzfo1t3YsaUysS5sK/Klge/4Cr6Uh95Bb6HCbnAdPWW28Qd1/JAaOBo3
 1I08V2pFgwTgHrQ5uf3N4KMELHlx6p0BLOgMHPKYftlTovSuFWjKQ+WIFs1/mD3t5aVk
 I++A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrhEcLNUdc22CLqofXrGuGRkNdYpd3SVcyNxDS/lDQv91NZ44dyjhh3+qDjDtg0HS4TQRtnO7AqTvAToOw4CH0vc2sM92+TC/PmBDKdm55
X-Gm-Message-State: AOJu0YyRJGURoagejczsAogWL/Yp8f5Qw8cvhWP+JT9YfkVYpjUbUkpY
 Cm44LaPGrJlD1IYgRimJ6ZgYMIHuO5gRvkdUUpo7/zYHTxWV0brV
X-Google-Smtp-Source: AGHT+IHBCdxrCLjCA4mZAQDKDWazi8vDZcSqP8BjDQy8Myfc+41akFZ+gzmnbm1SHCCjKbAKdpds1A==
X-Received: by 2002:a05:6512:baa:b0:52b:c1d4:7df3 with SMTP id
 2adb3069b0e04-52c9a3df094mr1642791e87.35.1718200395053; 
 Wed, 12 Jun 2024 06:53:15 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:59 +0200
Subject: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Wed, 12 Jun 2024 15:43:15 +0000
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 MAINTAINERS                             |    8 +
 drivers/accel/Kconfig                   |    1 +
 drivers/accel/Makefile                  |    1 +
 drivers/accel/rocket/Kconfig            |   13 +
 drivers/accel/rocket/Makefile           |    8 +
 drivers/accel/rocket/rocket_core.c      |  149 ++
 drivers/accel/rocket/rocket_core.h      |   32 +
 drivers/accel/rocket/rocket_device.c    |   37 +
 drivers/accel/rocket/rocket_device.h    |   38 +
 drivers/accel/rocket/rocket_drv.c       |  221 ++
 drivers/accel/rocket/rocket_drv.h       |   13 +
 drivers/accel/rocket/rocket_registers.h | 4449 +++++++++++++++++++++++++++++++
 include/uapi/drm/rocket_accel.h         |   19 +
 13 files changed, 4989 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..5a42ee39e2e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6731,6 +6731,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/ivpu/
 F:	include/uapi/drm/ivpu_accel.h
 
+DRM ACCEL DRIVER FOR ROCKCHIP NPU
+M:	Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/accel/rocket/
+F:	include/uapi/drm/rocket_accel.h
+
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 64065fb8922b..8f79eea29e29 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -27,5 +27,6 @@ menuconfig DRM_ACCEL
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index ab3df932937f..117844f94fc9 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
new file mode 100644
index 000000000000..d50eaabb42cb
--- /dev/null
+++ b/drivers/accel/rocket/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_ACCEL_ROCKET
+       tristate "Rocket (DRM support for Rockchip NPUs)"
+       depends on DRM
+       depends on ARM64 || COMPILE_TEST
+       depends on MMU
+       select DRM_SCHED
+       select IOMMU_SUPPORT
+       select IOMMU_IO_PGTABLE_LPAE
+       select DRM_GEM_SHMEM_HELPER
+       help
+         DRM driver for Rockchip NPUs.
diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
new file mode 100644
index 000000000000..73a7280d260c
--- /dev/null
+++ b/drivers/accel/rocket/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
+
+rocket-y := \
+	rocket_core.o \
+	rocket_device.o \
+	rocket_drv.o
diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
new file mode 100644
index 000000000000..d6680b00fb2f
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <asm-generic/delay.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/reset.h>
+
+#include "rocket_core.h"
+#include "rocket_device.h"
+#include "rocket_registers.h"
+
+static int rocket_clk_init(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->dev;
+	int err;
+
+	core->a_clk = devm_clk_get_enabled(rdev->dev, rdev->comp->clocks_a_names[core->index]);
+	if (IS_ERR(core->a_clk)) {
+		err = PTR_ERR(core->a_clk);
+		dev_err(rdev->dev, "devm_clk_get_enabled failed %d for core %d\n", err, core->index);
+		return err;
+	}
+
+	core->h_clk = devm_clk_get_enabled(rdev->dev, rdev->comp->clocks_h_names[core->index]);
+	if (IS_ERR(core->h_clk)) {
+		err = PTR_ERR(core->h_clk);
+		dev_err(rdev->dev, "devm_clk_get_enabled failed %d for core %d\n", err, core->index);
+		clk_disable_unprepare(core->a_clk);
+		return err;
+	}
+
+	return 0;
+}
+
+static int rocket_reset_init(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->dev;
+	struct reset_control *a_reset = NULL;
+	struct reset_control *h_reset = NULL;
+
+	a_reset = devm_reset_control_get(
+		rdev->dev,
+		rdev->comp->resets_a_names[core->index]);
+	if (IS_ERR(a_reset))
+		return PTR_ERR(a_reset);
+
+	core->a_reset = a_reset;
+
+	h_reset = devm_reset_control_get(
+		rdev->dev,
+		rdev->comp->resets_h_names[core->index]);
+	if (IS_ERR(h_reset))
+		return PTR_ERR(h_reset);
+
+	core->h_reset = h_reset;
+
+	return 0;
+}
+
+static int rocket_pmdomain_init(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->dev;
+	const char *pm_domain_name = rdev->comp->pm_domain_names[core->index];
+	int err = 0;
+
+	core->pm_domain = dev_pm_domain_attach_by_name(rdev->dev, pm_domain_name);
+	if (IS_ERR_OR_NULL(core->pm_domain)) {
+		err = PTR_ERR(core->pm_domain) ? : -ENODATA;
+		core->pm_domain = NULL;
+		dev_err(rdev->dev,
+			"failed to get pm-domain %s(%d): %d\n",
+			pm_domain_name, core->index, err);
+		return err;
+	}
+
+	core->pm_domain_link = device_link_add(rdev->dev,
+			core->pm_domain,
+			DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
+	if (!core->pm_domain_link) {
+		dev_err(core->pm_domain, "adding device link failed!\n");
+		dev_pm_domain_detach(core->pm_domain, true);
+		return -ENODEV;
+	}
+
+	return err;
+}
+
+static void rocket_pmdomain_fini(struct rocket_core *core)
+{
+	dev_pm_domain_detach(core->pm_domain, true);
+}
+
+int rocket_core_init(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->dev;
+	uint32_t version;
+	int err = 0;
+
+	err = rocket_clk_init(core);
+	if (err) {
+		dev_err(rdev->dev, "clk init failed %d\n", err);
+		return err;
+	}
+
+	err = rocket_reset_init(core);
+	if (err) {
+		dev_err(rdev->dev, "reset init failed %d\n", err);
+		return err;
+	}
+
+	err = rocket_pmdomain_init(core);
+	if (err < 0)
+		return err;
+
+	core->iomem = devm_platform_ioremap_resource(rdev->pdev, core->index);
+	if (IS_ERR(core->iomem)) {
+		err = PTR_ERR(core->iomem);
+		goto out_pm_domain;
+	}
+
+	version = rocket_read(core, REG_PC_VERSION) + (rocket_read(core, REG_PC_VERSION_NUM) & 0xffff);
+	dev_info(rdev->dev, "Rockchip NPU core %d version: %d\n", core->index, version);
+
+	return 0;
+
+out_pm_domain:
+	rocket_pmdomain_fini(core);
+	return err;
+}
+
+void rocket_core_fini(struct rocket_core *core)
+{
+	rocket_pmdomain_fini(core);
+}
+
+void rocket_core_reset(struct rocket_core *core)
+{
+	reset_control_assert(core->a_reset);
+	reset_control_assert(core->h_reset);
+
+	udelay(10);
+
+	reset_control_deassert(core->a_reset);
+	reset_control_deassert(core->h_reset);
+}
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
new file mode 100644
index 000000000000..e5d4c848c9f4
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_CORE_H__
+#define __ROCKET_CORE_H__
+
+#include <linux/mutex_types.h>
+#include <asm/io.h>
+#include <asm-generic/io.h>
+
+#define rocket_read(core, reg) readl((core)->iomem + (reg))
+#define rocket_write(core, reg, value) writel(value, (core)->iomem + (reg))
+
+struct rocket_core {
+	struct rocket_device *dev;
+	unsigned int index;
+
+	struct reset_control *a_reset;
+	struct reset_control *h_reset;
+	void __iomem *iomem;
+	int irq;
+	struct clk *a_clk;
+	struct clk *h_clk;
+	struct device *pm_domain;
+	struct device_link *pm_domain_link;
+};
+
+int rocket_core_init(struct rocket_core *core);
+void rocket_core_fini(struct rocket_core *core);
+void rocket_core_reset(struct rocket_core *core);
+
+#endif
\ No newline at end of file
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
new file mode 100644
index 000000000000..3bd23f22d06a
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_drv.h"
+#include "rocket_device.h"
+
+int rocket_device_init(struct rocket_device *rdev)
+{
+	int core, err;
+
+	rdev->clk_npu = devm_clk_get_enabled(rdev->dev, "clk_npu");
+	rdev->pclk = devm_clk_get_enabled(rdev->dev, "pclk");
+
+	for (core = 0; core < rdev->comp->num_cores; core++) {
+		rdev->cores[core].dev = rdev;
+		rdev->cores[core].index = core;
+
+		err = rocket_core_init(&rdev->cores[core]);
+		if (err) {
+			rocket_device_fini(rdev);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+void rocket_device_fini(struct rocket_device *rdev)
+{
+	int core;
+
+	for (core = 0; core < rdev->comp->num_cores; core++)
+		rocket_core_fini(&rdev->cores[core]);
+}
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
new file mode 100644
index 000000000000..6765d944a2c8
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DEVICE_H__
+#define __ROCKET_DEVICE_H__
+
+#include "rocket_core.h"
+
+#define MAX_NUM_CORES 3
+
+struct rocket_compatible {
+	int num_cores;
+	const char * const *resets_a_names;
+	const char * const *resets_h_names;
+	const char * const *clocks_a_names;
+	const char * const *clocks_h_names;
+	const char * const *pm_domain_names;
+	const char * const *irq_names;
+};
+
+struct rocket_device {
+	struct device *dev;
+	struct drm_device *ddev;
+	struct platform_device *pdev;
+
+	const struct rocket_compatible *comp;
+
+	struct rocket_core cores[MAX_NUM_CORES];
+
+	struct clk *clk_npu;
+	struct clk *pclk;
+};
+
+int rocket_device_init(struct rocket_device *rdev);
+void rocket_device_fini(struct rocket_device *rdev);
+void rocket_device_reset(struct rocket_device *rdev);
+
+#endif
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
new file mode 100644
index 000000000000..e339c337fcf9
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include "linux/clk.h"
+#include "linux/dma-mapping.h"
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_accel.h>
+#include <drm/drm_gem.h>
+
+#include "rocket_drv.h"
+#include "rocket_device.h"
+
+static const char * const rk3588_pm_domains[] = { "npu0", "npu1", "npu2" };
+static const char * const rk3588_resets_a[] = { "srst_a0", "srst_a1", "srst_a2" };
+static const char * const rk3588_resets_h[] = { "srst_h0", "srst_h1", "srst_h2" };
+static const char * const rk3588_clocks_a[] = { "aclk0", "aclk1", "aclk2" };
+static const char * const rk3588_clocks_h[] = { "hclk0", "hclk1", "hclk2" };
+static const char * const rk3588_irqs[] = { "npu0_irq", "npu1_irq", "npu2_irq" };
+static const struct rocket_compatible rk3588_data = {
+	.num_cores = ARRAY_SIZE(rk3588_pm_domains),
+	.pm_domain_names = rk3588_pm_domains,
+	.resets_a_names = rk3588_resets_a,
+	.resets_h_names = rk3588_resets_h,
+	.clocks_a_names = rk3588_clocks_a,
+	.clocks_h_names = rk3588_clocks_h,
+	.irq_names = rk3588_irqs,
+};
+
+static int
+rocket_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_device *rdev = dev->dev_private;
+	struct rocket_file_priv *rocket_priv;
+
+	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
+	if (!rocket_priv)
+		return -ENOMEM;
+
+	rocket_priv->rdev = rdev;
+	file->driver_priv = rocket_priv;
+
+	return 0;
+}
+
+static void
+rocket_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	kfree(rocket_priv);
+}
+
+static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
+#define ROCKET_IOCTL(n, func) \
+	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+};
+
+static const struct file_operations rocket_drm_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_ACCEL_FOPS,
+};
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
+	.fops			= &rocket_drm_driver_fops,
+	.name			= "rocket",
+	.desc			= "rocket DRM",
+	.date			= "20240521",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static int rocket_probe(struct platform_device *pdev)
+{
+	struct rocket_device *rdev;
+	struct drm_device *ddev;
+	int err;
+
+	BUILD_BUG_ON(rk3588_data.num_cores > MAX_NUM_CORES);
+
+	rdev = devm_kzalloc(&pdev->dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->pdev = pdev;
+	rdev->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, rdev);
+
+	rdev->comp = of_device_get_match_data(&pdev->dev);
+	if (!rdev->comp)
+		return -ENODEV;
+
+	/* Allocate and initialize the DRM device. */
+	ddev = drm_dev_alloc(&rocket_drm_driver, &pdev->dev);
+	if (IS_ERR(ddev))
+		return PTR_ERR(ddev);
+
+	ddev->dev_private = rdev;
+	rdev->ddev = ddev;
+
+	err = dma_set_mask_and_coherent(rdev->ddev->dev, DMA_BIT_MASK(40));
+	if (err)
+		goto err_drm_dev;
+
+	err = rocket_device_init(rdev);
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Fatal error during NPU init\n");
+		goto err_drm_dev;
+	}
+
+	pm_runtime_use_autosuspend(rdev->dev);
+	pm_runtime_set_autosuspend_delay(rdev->dev, 50); /* ~3 frames */
+	pm_runtime_set_active(rdev->dev);
+	pm_runtime_enable(rdev->dev);
+	pm_runtime_mark_last_busy(rdev->dev);
+
+	/*
+	 * Register the DRM device with the core and the connectors with
+	 * sysfs
+	 */
+	err = drm_dev_register(ddev, 0);
+	if (err < 0)
+		goto err_pm_runtime;
+
+	return 0;
+
+err_pm_runtime:
+	pm_runtime_disable(rdev->dev);
+	rocket_device_fini(rdev);
+	pm_runtime_set_suspended(rdev->dev);
+err_drm_dev:
+	drm_dev_put(ddev);
+	return err;
+}
+
+static void rocket_remove(struct platform_device *pdev)
+{
+	struct rocket_device *rdev = platform_get_drvdata(pdev);
+	struct drm_device *ddev = rdev->ddev;
+
+	drm_dev_unregister(ddev);
+
+	pm_runtime_disable(rdev->dev);
+	rocket_device_fini(rdev);
+	pm_runtime_set_suspended(rdev->dev);
+
+	drm_dev_put(ddev);
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "rockchip,rk3588-rknn", .data = &rk3588_data, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static int rocket_device_runtime_resume(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core;
+
+	clk_prepare_enable(rdev->clk_npu);
+	clk_prepare_enable(rdev->pclk);
+
+	for (core = 0; core < rdev->comp->num_cores; core++) {
+		clk_prepare_enable(rdev->cores[core].a_clk);
+		clk_prepare_enable(rdev->cores[core].h_clk);
+	}
+
+	return 0;
+}
+
+static int rocket_device_runtime_suspend(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core;
+
+	for (core = 0; core < rdev->comp->num_cores; core++) {
+		clk_disable_unprepare(rdev->cores[core].a_clk);
+		clk_disable_unprepare(rdev->cores[core].h_clk);
+	}
+
+	clk_disable_unprepare(rdev->pclk);
+	clk_disable_unprepare(rdev->clk_npu);
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
+	.remove_new = rocket_remove,
+	.driver	 = {
+		.name = "rocket",
+		.pm = pm_ptr(&rocket_pm_ops),
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(rocket_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
+MODULE_AUTHOR("Tomeu Vizoso");
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
new file mode 100644
index 000000000000..e1d9407c46d7
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DRV_H__
+#define __ROCKET_DRV_H__
+
+#include <linux/io.h>
+
+struct rocket_file_priv {
+       struct rocket_device *rdev;
+};
+
+#endif
diff --git a/drivers/accel/rocket/rocket_registers.h b/drivers/accel/rocket/rocket_registers.h
new file mode 100644
index 000000000000..9043fa922db5
--- /dev/null
+++ b/drivers/accel/rocket/rocket_registers.h
@@ -0,0 +1,4449 @@
+#ifndef REGISTERS_XML
+#define REGISTERS_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
+
+The rules-ng-ng source files this header was generated from are:
+
+- /home/tomeu/src/mesa/src/gallium/drivers/rocket/registers.xml (  60076 bytes, from Wed Jun 12 10:02:25 2024)
+
+Copyright (C) 2024-2024 by the following authors:
+- Tomeu Vizoso <tomeu@tomeuvizoso.net> Tomeu Vizoso
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+*/
+
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
+
+enum target {
+	PC = 0x00000100,
+	CNA = 0x00000200,
+	CORE = 0x00000800,
+	DPU = 0x00001000,
+	DPU_RDMA = 0x00002000,
+	PPU = 0x00004000,
+	PPU_RDMA = 0x00008000,
+	DDMA = 0x00010000,
+	SDMA = 0x00020000,
+	GLOBAL = 0x00040000,
+};
+
+#define REG_PC_VERSION						0x00000000
+#define PC_VERSION_VERSION__MASK				0xffffffff
+#define PC_VERSION_VERSION__SHIFT				0
+static inline uint32_t PC_VERSION_VERSION(uint32_t val)
+{
+	return ((val) << PC_VERSION_VERSION__SHIFT) & PC_VERSION_VERSION__MASK;
+}
+
+#define REG_PC_VERSION_NUM					0x00000004
+#define PC_VERSION_NUM_VERSION_NUM__MASK			0xffffffff
+#define PC_VERSION_NUM_VERSION_NUM__SHIFT			0
+static inline uint32_t PC_VERSION_NUM_VERSION_NUM(uint32_t val)
+{
+	return ((val) << PC_VERSION_NUM_VERSION_NUM__SHIFT) & PC_VERSION_NUM_VERSION_NUM__MASK;
+}
+
+#define REG_PC_OPERATION_ENABLE					0x00000008
+#define PC_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
+#define PC_OPERATION_ENABLE_RESERVED_0__SHIFT			1
+static inline uint32_t PC_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_OPERATION_ENABLE_RESERVED_0__SHIFT) & PC_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define PC_OPERATION_ENABLE_OP_EN__MASK				0x00000001
+#define PC_OPERATION_ENABLE_OP_EN__SHIFT			0
+static inline uint32_t PC_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << PC_OPERATION_ENABLE_OP_EN__SHIFT) & PC_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_PC_BASE_ADDRESS					0x00000010
+#define PC_BASE_ADDRESS_PC_SOURCE_ADDR__MASK			0xfffffff0
+#define PC_BASE_ADDRESS_PC_SOURCE_ADDR__SHIFT			4
+static inline uint32_t PC_BASE_ADDRESS_PC_SOURCE_ADDR(uint32_t val)
+{
+	return ((val) << PC_BASE_ADDRESS_PC_SOURCE_ADDR__SHIFT) & PC_BASE_ADDRESS_PC_SOURCE_ADDR__MASK;
+}
+#define PC_BASE_ADDRESS_RESERVED_0__MASK			0x0000000e
+#define PC_BASE_ADDRESS_RESERVED_0__SHIFT			1
+static inline uint32_t PC_BASE_ADDRESS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_BASE_ADDRESS_RESERVED_0__SHIFT) & PC_BASE_ADDRESS_RESERVED_0__MASK;
+}
+#define PC_BASE_ADDRESS_PC_SEL__MASK				0x00000001
+#define PC_BASE_ADDRESS_PC_SEL__SHIFT				0
+static inline uint32_t PC_BASE_ADDRESS_PC_SEL(uint32_t val)
+{
+	return ((val) << PC_BASE_ADDRESS_PC_SEL__SHIFT) & PC_BASE_ADDRESS_PC_SEL__MASK;
+}
+
+#define REG_PC_REGISTER_AMOUNTS					0x00000014
+#define PC_REGISTER_AMOUNTS_RESERVED_0__MASK			0xffff0000
+#define PC_REGISTER_AMOUNTS_RESERVED_0__SHIFT			16
+static inline uint32_t PC_REGISTER_AMOUNTS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_REGISTER_AMOUNTS_RESERVED_0__SHIFT) & PC_REGISTER_AMOUNTS_RESERVED_0__MASK;
+}
+#define PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__MASK		0x0000ffff
+#define PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__SHIFT		0
+static inline uint32_t PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT(uint32_t val)
+{
+	return ((val) << PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__SHIFT) & PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__MASK;
+}
+
+#define REG_PC_INTERRUPT_MASK					0x00000020
+#define PC_INTERRUPT_MASK_RESERVED_0__MASK			0xffffc000
+#define PC_INTERRUPT_MASK_RESERVED_0__SHIFT			14
+static inline uint32_t PC_INTERRUPT_MASK_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_INTERRUPT_MASK_RESERVED_0__SHIFT) & PC_INTERRUPT_MASK_RESERVED_0__MASK;
+}
+#define PC_INTERRUPT_MASK_DMA_WRITE_ERROR			0x00002000
+#define PC_INTERRUPT_MASK_DMA_READ_ERROR			0x00001000
+#define PC_INTERRUPT_MASK_PPU_1					0x00000800
+#define PC_INTERRUPT_MASK_PPU_0					0x00000400
+#define PC_INTERRUPT_MASK_DPU_1					0x00000200
+#define PC_INTERRUPT_MASK_DPU_0					0x00000100
+#define PC_INTERRUPT_MASK_CORE_1				0x00000080
+#define PC_INTERRUPT_MASK_CORE_0				0x00000040
+#define PC_INTERRUPT_MASK_CNA_CSC_1				0x00000020
+#define PC_INTERRUPT_MASK_CNA_CSC_0				0x00000010
+#define PC_INTERRUPT_MASK_CNA_WEIGHT_1				0x00000008
+#define PC_INTERRUPT_MASK_CNA_WEIGHT_0				0x00000004
+#define PC_INTERRUPT_MASK_CNA_FEATURE_1				0x00000002
+#define PC_INTERRUPT_MASK_CNA_FEATURE_0				0x00000001
+
+#define REG_PC_INTERRUPT_CLEAR					0x00000024
+#define PC_INTERRUPT_CLEAR_RESERVED_0__MASK			0xffffc000
+#define PC_INTERRUPT_CLEAR_RESERVED_0__SHIFT			14
+static inline uint32_t PC_INTERRUPT_CLEAR_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_INTERRUPT_CLEAR_RESERVED_0__SHIFT) & PC_INTERRUPT_CLEAR_RESERVED_0__MASK;
+}
+#define PC_INTERRUPT_CLEAR_DMA_WRITE_ERROR			0x00002000
+#define PC_INTERRUPT_CLEAR_DMA_READ_ERROR			0x00001000
+#define PC_INTERRUPT_CLEAR_PPU_1				0x00000800
+#define PC_INTERRUPT_CLEAR_PPU_0				0x00000400
+#define PC_INTERRUPT_CLEAR_DPU_1				0x00000200
+#define PC_INTERRUPT_CLEAR_DPU_0				0x00000100
+#define PC_INTERRUPT_CLEAR_CORE_1				0x00000080
+#define PC_INTERRUPT_CLEAR_CORE_0				0x00000040
+#define PC_INTERRUPT_CLEAR_CNA_CSC_1				0x00000020
+#define PC_INTERRUPT_CLEAR_CNA_CSC_0				0x00000010
+#define PC_INTERRUPT_CLEAR_CNA_WEIGHT_1				0x00000008
+#define PC_INTERRUPT_CLEAR_CNA_WEIGHT_0				0x00000004
+#define PC_INTERRUPT_CLEAR_CNA_FEATURE_1			0x00000002
+#define PC_INTERRUPT_CLEAR_CNA_FEATURE_0			0x00000001
+
+#define REG_PC_INTERRUPT_STATUS					0x00000028
+#define PC_INTERRUPT_STATUS_RESERVED_0__MASK			0xffffc000
+#define PC_INTERRUPT_STATUS_RESERVED_0__SHIFT			14
+static inline uint32_t PC_INTERRUPT_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_INTERRUPT_STATUS_RESERVED_0__SHIFT) & PC_INTERRUPT_STATUS_RESERVED_0__MASK;
+}
+#define PC_INTERRUPT_STATUS_DMA_WRITE_ERROR			0x00002000
+#define PC_INTERRUPT_STATUS_DMA_READ_ERROR			0x00001000
+#define PC_INTERRUPT_STATUS_PPU_1				0x00000800
+#define PC_INTERRUPT_STATUS_PPU_0				0x00000400
+#define PC_INTERRUPT_STATUS_DPU_1				0x00000200
+#define PC_INTERRUPT_STATUS_DPU_0				0x00000100
+#define PC_INTERRUPT_STATUS_CORE_1				0x00000080
+#define PC_INTERRUPT_STATUS_CORE_0				0x00000040
+#define PC_INTERRUPT_STATUS_CNA_CSC_1				0x00000020
+#define PC_INTERRUPT_STATUS_CNA_CSC_0				0x00000010
+#define PC_INTERRUPT_STATUS_CNA_WEIGHT_1			0x00000008
+#define PC_INTERRUPT_STATUS_CNA_WEIGHT_0			0x00000004
+#define PC_INTERRUPT_STATUS_CNA_FEATURE_1			0x00000002
+#define PC_INTERRUPT_STATUS_CNA_FEATURE_0			0x00000001
+
+#define REG_PC_INTERRUPT_RAW_STATUS				0x0000002c
+#define PC_INTERRUPT_RAW_STATUS_RESERVED_0__MASK		0xffffc000
+#define PC_INTERRUPT_RAW_STATUS_RESERVED_0__SHIFT		14
+static inline uint32_t PC_INTERRUPT_RAW_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_INTERRUPT_RAW_STATUS_RESERVED_0__SHIFT) & PC_INTERRUPT_RAW_STATUS_RESERVED_0__MASK;
+}
+#define PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR			0x00002000
+#define PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR			0x00001000
+#define PC_INTERRUPT_RAW_STATUS_PPU_1				0x00000800
+#define PC_INTERRUPT_RAW_STATUS_PPU_0				0x00000400
+#define PC_INTERRUPT_RAW_STATUS_DPU_1				0x00000200
+#define PC_INTERRUPT_RAW_STATUS_DPU_0				0x00000100
+#define PC_INTERRUPT_RAW_STATUS_CORE_1				0x00000080
+#define PC_INTERRUPT_RAW_STATUS_CORE_0				0x00000040
+#define PC_INTERRUPT_RAW_STATUS_CNA_CSC_1			0x00000020
+#define PC_INTERRUPT_RAW_STATUS_CNA_CSC_0			0x00000010
+#define PC_INTERRUPT_RAW_STATUS_CNA_WEIGHT_1			0x00000008
+#define PC_INTERRUPT_RAW_STATUS_CNA_WEIGHT_0			0x00000004
+#define PC_INTERRUPT_RAW_STATUS_CNA_FEATURE_1			0x00000002
+#define PC_INTERRUPT_RAW_STATUS_CNA_FEATURE_0			0x00000001
+
+#define REG_PC_TASK_CON						0x00000030
+#define PC_TASK_CON_RESERVED_0__MASK				0xffffc000
+#define PC_TASK_CON_RESERVED_0__SHIFT				14
+static inline uint32_t PC_TASK_CON_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_TASK_CON_RESERVED_0__SHIFT) & PC_TASK_CON_RESERVED_0__MASK;
+}
+#define PC_TASK_CON_TASK_COUNT_CLEAR__MASK			0x00002000
+#define PC_TASK_CON_TASK_COUNT_CLEAR__SHIFT			13
+static inline uint32_t PC_TASK_CON_TASK_COUNT_CLEAR(uint32_t val)
+{
+	return ((val) << PC_TASK_CON_TASK_COUNT_CLEAR__SHIFT) & PC_TASK_CON_TASK_COUNT_CLEAR__MASK;
+}
+#define PC_TASK_CON_TASK_PP_EN__MASK				0x00001000
+#define PC_TASK_CON_TASK_PP_EN__SHIFT				12
+static inline uint32_t PC_TASK_CON_TASK_PP_EN(uint32_t val)
+{
+	return ((val) << PC_TASK_CON_TASK_PP_EN__SHIFT) & PC_TASK_CON_TASK_PP_EN__MASK;
+}
+#define PC_TASK_CON_TASK_NUMBER__MASK				0x00000fff
+#define PC_TASK_CON_TASK_NUMBER__SHIFT				0
+static inline uint32_t PC_TASK_CON_TASK_NUMBER(uint32_t val)
+{
+	return ((val) << PC_TASK_CON_TASK_NUMBER__SHIFT) & PC_TASK_CON_TASK_NUMBER__MASK;
+}
+
+#define REG_PC_TASK_DMA_BASE_ADDR				0x00000034
+#define PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__MASK		0xfffffff0
+#define PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__SHIFT		4
+static inline uint32_t PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR(uint32_t val)
+{
+	return ((val) << PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__SHIFT) & PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__MASK;
+}
+#define PC_TASK_DMA_BASE_ADDR_RESERVED_0__MASK			0x0000000f
+#define PC_TASK_DMA_BASE_ADDR_RESERVED_0__SHIFT			0
+static inline uint32_t PC_TASK_DMA_BASE_ADDR_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_TASK_DMA_BASE_ADDR_RESERVED_0__SHIFT) & PC_TASK_DMA_BASE_ADDR_RESERVED_0__MASK;
+}
+
+#define REG_PC_TASK_STATUS					0x0000003c
+#define PC_TASK_STATUS_RESERVED_0__MASK				0xf0000000
+#define PC_TASK_STATUS_RESERVED_0__SHIFT			28
+static inline uint32_t PC_TASK_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PC_TASK_STATUS_RESERVED_0__SHIFT) & PC_TASK_STATUS_RESERVED_0__MASK;
+}
+#define PC_TASK_STATUS_TASK_STATUS__MASK			0x0fffffff
+#define PC_TASK_STATUS_TASK_STATUS__SHIFT			0
+static inline uint32_t PC_TASK_STATUS_TASK_STATUS(uint32_t val)
+{
+	return ((val) << PC_TASK_STATUS_TASK_STATUS__SHIFT) & PC_TASK_STATUS_TASK_STATUS__MASK;
+}
+
+#define REG_CNA_S_STATUS					0x00001000
+#define CNA_S_STATUS_RESERVED_0__MASK				0xfffc0000
+#define CNA_S_STATUS_RESERVED_0__SHIFT				18
+static inline uint32_t CNA_S_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_S_STATUS_RESERVED_0__SHIFT) & CNA_S_STATUS_RESERVED_0__MASK;
+}
+#define CNA_S_STATUS_STATUS_1__MASK				0x00030000
+#define CNA_S_STATUS_STATUS_1__SHIFT				16
+static inline uint32_t CNA_S_STATUS_STATUS_1(uint32_t val)
+{
+	return ((val) << CNA_S_STATUS_STATUS_1__SHIFT) & CNA_S_STATUS_STATUS_1__MASK;
+}
+#define CNA_S_STATUS_RESERVED_1__MASK				0x0000fffc
+#define CNA_S_STATUS_RESERVED_1__SHIFT				2
+static inline uint32_t CNA_S_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_S_STATUS_RESERVED_1__SHIFT) & CNA_S_STATUS_RESERVED_1__MASK;
+}
+#define CNA_S_STATUS_STATUS_0__MASK				0x00000003
+#define CNA_S_STATUS_STATUS_0__SHIFT				0
+static inline uint32_t CNA_S_STATUS_STATUS_0(uint32_t val)
+{
+	return ((val) << CNA_S_STATUS_STATUS_0__SHIFT) & CNA_S_STATUS_STATUS_0__MASK;
+}
+
+#define REG_CNA_S_POINTER					0x00001004
+#define CNA_S_POINTER_RESERVED_0__MASK				0xfffe0000
+#define CNA_S_POINTER_RESERVED_0__SHIFT				17
+static inline uint32_t CNA_S_POINTER_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_RESERVED_0__SHIFT) & CNA_S_POINTER_RESERVED_0__MASK;
+}
+#define CNA_S_POINTER_EXECUTER__MASK				0x00010000
+#define CNA_S_POINTER_EXECUTER__SHIFT				16
+static inline uint32_t CNA_S_POINTER_EXECUTER(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_EXECUTER__SHIFT) & CNA_S_POINTER_EXECUTER__MASK;
+}
+#define CNA_S_POINTER_RESERVED_1__MASK				0x0000ffc0
+#define CNA_S_POINTER_RESERVED_1__SHIFT				6
+static inline uint32_t CNA_S_POINTER_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_RESERVED_1__SHIFT) & CNA_S_POINTER_RESERVED_1__MASK;
+}
+#define CNA_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
+#define CNA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
+static inline uint32_t CNA_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & CNA_S_POINTER_EXECUTER_PP_CLEAR__MASK;
+}
+#define CNA_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
+#define CNA_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
+static inline uint32_t CNA_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_POINTER_PP_CLEAR__SHIFT) & CNA_S_POINTER_POINTER_PP_CLEAR__MASK;
+}
+#define CNA_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
+#define CNA_S_POINTER_POINTER_PP_MODE__SHIFT			3
+static inline uint32_t CNA_S_POINTER_POINTER_PP_MODE(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_POINTER_PP_MODE__SHIFT) & CNA_S_POINTER_POINTER_PP_MODE__MASK;
+}
+#define CNA_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
+#define CNA_S_POINTER_EXECUTER_PP_EN__SHIFT			2
+static inline uint32_t CNA_S_POINTER_EXECUTER_PP_EN(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_EXECUTER_PP_EN__SHIFT) & CNA_S_POINTER_EXECUTER_PP_EN__MASK;
+}
+#define CNA_S_POINTER_POINTER_PP_EN__MASK			0x00000002
+#define CNA_S_POINTER_POINTER_PP_EN__SHIFT			1
+static inline uint32_t CNA_S_POINTER_POINTER_PP_EN(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_POINTER_PP_EN__SHIFT) & CNA_S_POINTER_POINTER_PP_EN__MASK;
+}
+#define CNA_S_POINTER_POINTER__MASK				0x00000001
+#define CNA_S_POINTER_POINTER__SHIFT				0
+static inline uint32_t CNA_S_POINTER_POINTER(uint32_t val)
+{
+	return ((val) << CNA_S_POINTER_POINTER__SHIFT) & CNA_S_POINTER_POINTER__MASK;
+}
+
+#define REG_CNA_OPERATION_ENABLE				0x00001008
+#define CNA_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
+#define CNA_OPERATION_ENABLE_RESERVED_0__SHIFT			1
+static inline uint32_t CNA_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_OPERATION_ENABLE_RESERVED_0__SHIFT) & CNA_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define CNA_OPERATION_ENABLE_OP_EN__MASK			0x00000001
+#define CNA_OPERATION_ENABLE_OP_EN__SHIFT			0
+static inline uint32_t CNA_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << CNA_OPERATION_ENABLE_OP_EN__SHIFT) & CNA_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_CNA_CONV_CON1					0x0000100c
+#define CNA_CONV_CON1_RESERVED_0__MASK				0x80000000
+#define CNA_CONV_CON1_RESERVED_0__SHIFT				31
+static inline uint32_t CNA_CONV_CON1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_RESERVED_0__SHIFT) & CNA_CONV_CON1_RESERVED_0__MASK;
+}
+#define CNA_CONV_CON1_NONALIGN_DMA__MASK			0x40000000
+#define CNA_CONV_CON1_NONALIGN_DMA__SHIFT			30
+static inline uint32_t CNA_CONV_CON1_NONALIGN_DMA(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_NONALIGN_DMA__SHIFT) & CNA_CONV_CON1_NONALIGN_DMA__MASK;
+}
+#define CNA_CONV_CON1_GROUP_LINE_OFF__MASK			0x20000000
+#define CNA_CONV_CON1_GROUP_LINE_OFF__SHIFT			29
+static inline uint32_t CNA_CONV_CON1_GROUP_LINE_OFF(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_GROUP_LINE_OFF__SHIFT) & CNA_CONV_CON1_GROUP_LINE_OFF__MASK;
+}
+#define CNA_CONV_CON1_RESERVED_1__MASK				0x1ffe0000
+#define CNA_CONV_CON1_RESERVED_1__SHIFT				17
+static inline uint32_t CNA_CONV_CON1_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_RESERVED_1__SHIFT) & CNA_CONV_CON1_RESERVED_1__MASK;
+}
+#define CNA_CONV_CON1_DECONV__MASK				0x00010000
+#define CNA_CONV_CON1_DECONV__SHIFT				16
+static inline uint32_t CNA_CONV_CON1_DECONV(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_DECONV__SHIFT) & CNA_CONV_CON1_DECONV__MASK;
+}
+#define CNA_CONV_CON1_ARGB_IN__MASK				0x0000f000
+#define CNA_CONV_CON1_ARGB_IN__SHIFT				12
+static inline uint32_t CNA_CONV_CON1_ARGB_IN(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_ARGB_IN__SHIFT) & CNA_CONV_CON1_ARGB_IN__MASK;
+}
+#define CNA_CONV_CON1_RESERVED_2__MASK				0x00000c00
+#define CNA_CONV_CON1_RESERVED_2__SHIFT				10
+static inline uint32_t CNA_CONV_CON1_RESERVED_2(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_RESERVED_2__SHIFT) & CNA_CONV_CON1_RESERVED_2__MASK;
+}
+#define CNA_CONV_CON1_PROC_PRECISION__MASK			0x00000380
+#define CNA_CONV_CON1_PROC_PRECISION__SHIFT			7
+static inline uint32_t CNA_CONV_CON1_PROC_PRECISION(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_PROC_PRECISION__SHIFT) & CNA_CONV_CON1_PROC_PRECISION__MASK;
+}
+#define CNA_CONV_CON1_IN_PRECISION__MASK			0x00000070
+#define CNA_CONV_CON1_IN_PRECISION__SHIFT			4
+static inline uint32_t CNA_CONV_CON1_IN_PRECISION(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_IN_PRECISION__SHIFT) & CNA_CONV_CON1_IN_PRECISION__MASK;
+}
+#define CNA_CONV_CON1_CONV_MODE__MASK				0x0000000f
+#define CNA_CONV_CON1_CONV_MODE__SHIFT				0
+static inline uint32_t CNA_CONV_CON1_CONV_MODE(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON1_CONV_MODE__SHIFT) & CNA_CONV_CON1_CONV_MODE__MASK;
+}
+
+#define REG_CNA_CONV_CON2					0x00001010
+#define CNA_CONV_CON2_RESERVED_0__MASK				0xff000000
+#define CNA_CONV_CON2_RESERVED_0__SHIFT				24
+static inline uint32_t CNA_CONV_CON2_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_RESERVED_0__SHIFT) & CNA_CONV_CON2_RESERVED_0__MASK;
+}
+#define CNA_CONV_CON2_KERNEL_GROUP__MASK			0x00ff0000
+#define CNA_CONV_CON2_KERNEL_GROUP__SHIFT			16
+static inline uint32_t CNA_CONV_CON2_KERNEL_GROUP(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_KERNEL_GROUP__SHIFT) & CNA_CONV_CON2_KERNEL_GROUP__MASK;
+}
+#define CNA_CONV_CON2_RESERVED_1__MASK				0x0000c000
+#define CNA_CONV_CON2_RESERVED_1__SHIFT				14
+static inline uint32_t CNA_CONV_CON2_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_RESERVED_1__SHIFT) & CNA_CONV_CON2_RESERVED_1__MASK;
+}
+#define CNA_CONV_CON2_FEATURE_GRAINS__MASK			0x00003ff0
+#define CNA_CONV_CON2_FEATURE_GRAINS__SHIFT			4
+static inline uint32_t CNA_CONV_CON2_FEATURE_GRAINS(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_FEATURE_GRAINS__SHIFT) & CNA_CONV_CON2_FEATURE_GRAINS__MASK;
+}
+#define CNA_CONV_CON2_RESERVED_2__MASK				0x00000008
+#define CNA_CONV_CON2_RESERVED_2__SHIFT				3
+static inline uint32_t CNA_CONV_CON2_RESERVED_2(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_RESERVED_2__SHIFT) & CNA_CONV_CON2_RESERVED_2__MASK;
+}
+#define CNA_CONV_CON2_CSC_WO_EN__MASK				0x00000004
+#define CNA_CONV_CON2_CSC_WO_EN__SHIFT				2
+static inline uint32_t CNA_CONV_CON2_CSC_WO_EN(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_CSC_WO_EN__SHIFT) & CNA_CONV_CON2_CSC_WO_EN__MASK;
+}
+#define CNA_CONV_CON2_CSC_DO_EN__MASK				0x00000002
+#define CNA_CONV_CON2_CSC_DO_EN__SHIFT				1
+static inline uint32_t CNA_CONV_CON2_CSC_DO_EN(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_CSC_DO_EN__SHIFT) & CNA_CONV_CON2_CSC_DO_EN__MASK;
+}
+#define CNA_CONV_CON2_CMD_FIFO_SRST__MASK			0x00000001
+#define CNA_CONV_CON2_CMD_FIFO_SRST__SHIFT			0
+static inline uint32_t CNA_CONV_CON2_CMD_FIFO_SRST(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON2_CMD_FIFO_SRST__SHIFT) & CNA_CONV_CON2_CMD_FIFO_SRST__MASK;
+}
+
+#define REG_CNA_CONV_CON3					0x00001014
+#define CNA_CONV_CON3_RESERVED_0__MASK				0x80000000
+#define CNA_CONV_CON3_RESERVED_0__SHIFT				31
+static inline uint32_t CNA_CONV_CON3_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_RESERVED_0__SHIFT) & CNA_CONV_CON3_RESERVED_0__MASK;
+}
+#define CNA_CONV_CON3_NN_MODE__MASK				0x70000000
+#define CNA_CONV_CON3_NN_MODE__SHIFT				28
+static inline uint32_t CNA_CONV_CON3_NN_MODE(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_NN_MODE__SHIFT) & CNA_CONV_CON3_NN_MODE__MASK;
+}
+#define CNA_CONV_CON3_RESERVED_1__MASK				0x0c000000
+#define CNA_CONV_CON3_RESERVED_1__SHIFT				26
+static inline uint32_t CNA_CONV_CON3_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_RESERVED_1__SHIFT) & CNA_CONV_CON3_RESERVED_1__MASK;
+}
+#define CNA_CONV_CON3_ATROUS_Y_DILATION__MASK			0x03e00000
+#define CNA_CONV_CON3_ATROUS_Y_DILATION__SHIFT			21
+static inline uint32_t CNA_CONV_CON3_ATROUS_Y_DILATION(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_ATROUS_Y_DILATION__SHIFT) & CNA_CONV_CON3_ATROUS_Y_DILATION__MASK;
+}
+#define CNA_CONV_CON3_ATROUS_X_DILATION__MASK			0x001f0000
+#define CNA_CONV_CON3_ATROUS_X_DILATION__SHIFT			16
+static inline uint32_t CNA_CONV_CON3_ATROUS_X_DILATION(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_ATROUS_X_DILATION__SHIFT) & CNA_CONV_CON3_ATROUS_X_DILATION__MASK;
+}
+#define CNA_CONV_CON3_RESERVED_2__MASK				0x0000c000
+#define CNA_CONV_CON3_RESERVED_2__SHIFT				14
+static inline uint32_t CNA_CONV_CON3_RESERVED_2(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_RESERVED_2__SHIFT) & CNA_CONV_CON3_RESERVED_2__MASK;
+}
+#define CNA_CONV_CON3_DECONV_Y_STRIDE__MASK			0x00003800
+#define CNA_CONV_CON3_DECONV_Y_STRIDE__SHIFT			11
+static inline uint32_t CNA_CONV_CON3_DECONV_Y_STRIDE(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_DECONV_Y_STRIDE__SHIFT) & CNA_CONV_CON3_DECONV_Y_STRIDE__MASK;
+}
+#define CNA_CONV_CON3_DECONV_X_STRIDE__MASK			0x00000700
+#define CNA_CONV_CON3_DECONV_X_STRIDE__SHIFT			8
+static inline uint32_t CNA_CONV_CON3_DECONV_X_STRIDE(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_DECONV_X_STRIDE__SHIFT) & CNA_CONV_CON3_DECONV_X_STRIDE__MASK;
+}
+#define CNA_CONV_CON3_RESERVED_3__MASK				0x000000c0
+#define CNA_CONV_CON3_RESERVED_3__SHIFT				6
+static inline uint32_t CNA_CONV_CON3_RESERVED_3(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_RESERVED_3__SHIFT) & CNA_CONV_CON3_RESERVED_3__MASK;
+}
+#define CNA_CONV_CON3_CONV_Y_STRIDE__MASK			0x00000038
+#define CNA_CONV_CON3_CONV_Y_STRIDE__SHIFT			3
+static inline uint32_t CNA_CONV_CON3_CONV_Y_STRIDE(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_CONV_Y_STRIDE__SHIFT) & CNA_CONV_CON3_CONV_Y_STRIDE__MASK;
+}
+#define CNA_CONV_CON3_CONV_X_STRIDE__MASK			0x00000007
+#define CNA_CONV_CON3_CONV_X_STRIDE__SHIFT			0
+static inline uint32_t CNA_CONV_CON3_CONV_X_STRIDE(uint32_t val)
+{
+	return ((val) << CNA_CONV_CON3_CONV_X_STRIDE__SHIFT) & CNA_CONV_CON3_CONV_X_STRIDE__MASK;
+}
+
+#define REG_CNA_DATA_SIZE0					0x00001020
+#define CNA_DATA_SIZE0_RESERVED_0__MASK				0xf8000000
+#define CNA_DATA_SIZE0_RESERVED_0__SHIFT			27
+static inline uint32_t CNA_DATA_SIZE0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE0_RESERVED_0__SHIFT) & CNA_DATA_SIZE0_RESERVED_0__MASK;
+}
+#define CNA_DATA_SIZE0_DATAIN_WIDTH__MASK			0x07ff0000
+#define CNA_DATA_SIZE0_DATAIN_WIDTH__SHIFT			16
+static inline uint32_t CNA_DATA_SIZE0_DATAIN_WIDTH(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE0_DATAIN_WIDTH__SHIFT) & CNA_DATA_SIZE0_DATAIN_WIDTH__MASK;
+}
+#define CNA_DATA_SIZE0_RESERVED_1__MASK				0x0000f800
+#define CNA_DATA_SIZE0_RESERVED_1__SHIFT			11
+static inline uint32_t CNA_DATA_SIZE0_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE0_RESERVED_1__SHIFT) & CNA_DATA_SIZE0_RESERVED_1__MASK;
+}
+#define CNA_DATA_SIZE0_DATAIN_HEIGHT__MASK			0x000007ff
+#define CNA_DATA_SIZE0_DATAIN_HEIGHT__SHIFT			0
+static inline uint32_t CNA_DATA_SIZE0_DATAIN_HEIGHT(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE0_DATAIN_HEIGHT__SHIFT) & CNA_DATA_SIZE0_DATAIN_HEIGHT__MASK;
+}
+
+#define REG_CNA_DATA_SIZE1					0x00001024
+#define CNA_DATA_SIZE1_RESERVED_0__MASK				0xc0000000
+#define CNA_DATA_SIZE1_RESERVED_0__SHIFT			30
+static inline uint32_t CNA_DATA_SIZE1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE1_RESERVED_0__SHIFT) & CNA_DATA_SIZE1_RESERVED_0__MASK;
+}
+#define CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__MASK		0x3fff0000
+#define CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__SHIFT		16
+static inline uint32_t CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__SHIFT) & CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__MASK;
+}
+#define CNA_DATA_SIZE1_DATAIN_CHANNEL__MASK			0x0000ffff
+#define CNA_DATA_SIZE1_DATAIN_CHANNEL__SHIFT			0
+static inline uint32_t CNA_DATA_SIZE1_DATAIN_CHANNEL(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE1_DATAIN_CHANNEL__SHIFT) & CNA_DATA_SIZE1_DATAIN_CHANNEL__MASK;
+}
+
+#define REG_CNA_DATA_SIZE2					0x00001028
+#define CNA_DATA_SIZE2_RESERVED_0__MASK				0xfffff800
+#define CNA_DATA_SIZE2_RESERVED_0__SHIFT			11
+static inline uint32_t CNA_DATA_SIZE2_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE2_RESERVED_0__SHIFT) & CNA_DATA_SIZE2_RESERVED_0__MASK;
+}
+#define CNA_DATA_SIZE2_DATAOUT_WIDTH__MASK			0x000007ff
+#define CNA_DATA_SIZE2_DATAOUT_WIDTH__SHIFT			0
+static inline uint32_t CNA_DATA_SIZE2_DATAOUT_WIDTH(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE2_DATAOUT_WIDTH__SHIFT) & CNA_DATA_SIZE2_DATAOUT_WIDTH__MASK;
+}
+
+#define REG_CNA_DATA_SIZE3					0x0000102c
+#define CNA_DATA_SIZE3_RESERVED_0__MASK				0xff000000
+#define CNA_DATA_SIZE3_RESERVED_0__SHIFT			24
+static inline uint32_t CNA_DATA_SIZE3_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE3_RESERVED_0__SHIFT) & CNA_DATA_SIZE3_RESERVED_0__MASK;
+}
+#define CNA_DATA_SIZE3_SURF_MODE__MASK				0x00c00000
+#define CNA_DATA_SIZE3_SURF_MODE__SHIFT				22
+static inline uint32_t CNA_DATA_SIZE3_SURF_MODE(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE3_SURF_MODE__SHIFT) & CNA_DATA_SIZE3_SURF_MODE__MASK;
+}
+#define CNA_DATA_SIZE3_DATAOUT_ATOMICS__MASK			0x003fffff
+#define CNA_DATA_SIZE3_DATAOUT_ATOMICS__SHIFT			0
+static inline uint32_t CNA_DATA_SIZE3_DATAOUT_ATOMICS(uint32_t val)
+{
+	return ((val) << CNA_DATA_SIZE3_DATAOUT_ATOMICS__SHIFT) & CNA_DATA_SIZE3_DATAOUT_ATOMICS__MASK;
+}
+
+#define REG_CNA_WEIGHT_SIZE0					0x00001030
+#define CNA_WEIGHT_SIZE0_WEIGHT_BYTES__MASK			0xffffffff
+#define CNA_WEIGHT_SIZE0_WEIGHT_BYTES__SHIFT			0
+static inline uint32_t CNA_WEIGHT_SIZE0_WEIGHT_BYTES(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE0_WEIGHT_BYTES__SHIFT) & CNA_WEIGHT_SIZE0_WEIGHT_BYTES__MASK;
+}
+
+#define REG_CNA_WEIGHT_SIZE1					0x00001034
+#define CNA_WEIGHT_SIZE1_RESERVED_0__MASK			0xfff80000
+#define CNA_WEIGHT_SIZE1_RESERVED_0__SHIFT			19
+static inline uint32_t CNA_WEIGHT_SIZE1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE1_RESERVED_0__SHIFT) & CNA_WEIGHT_SIZE1_RESERVED_0__MASK;
+}
+#define CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__MASK		0x0007ffff
+#define CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__SHIFT		0
+static inline uint32_t CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__SHIFT) & CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__MASK;
+}
+
+#define REG_CNA_WEIGHT_SIZE2					0x00001038
+#define CNA_WEIGHT_SIZE2_RESERVED_0__MASK			0xe0000000
+#define CNA_WEIGHT_SIZE2_RESERVED_0__SHIFT			29
+static inline uint32_t CNA_WEIGHT_SIZE2_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE2_RESERVED_0__SHIFT) & CNA_WEIGHT_SIZE2_RESERVED_0__MASK;
+}
+#define CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__MASK			0x1f000000
+#define CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__SHIFT			24
+static inline uint32_t CNA_WEIGHT_SIZE2_WEIGHT_WIDTH(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__SHIFT) & CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__MASK;
+}
+#define CNA_WEIGHT_SIZE2_RESERVED_1__MASK			0x00e00000
+#define CNA_WEIGHT_SIZE2_RESERVED_1__SHIFT			21
+static inline uint32_t CNA_WEIGHT_SIZE2_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE2_RESERVED_1__SHIFT) & CNA_WEIGHT_SIZE2_RESERVED_1__MASK;
+}
+#define CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__MASK			0x001f0000
+#define CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__SHIFT			16
+static inline uint32_t CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__SHIFT) & CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__MASK;
+}
+#define CNA_WEIGHT_SIZE2_RESERVED_2__MASK			0x0000c000
+#define CNA_WEIGHT_SIZE2_RESERVED_2__SHIFT			14
+static inline uint32_t CNA_WEIGHT_SIZE2_RESERVED_2(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE2_RESERVED_2__SHIFT) & CNA_WEIGHT_SIZE2_RESERVED_2__MASK;
+}
+#define CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__MASK			0x00003fff
+#define CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__SHIFT			0
+static inline uint32_t CNA_WEIGHT_SIZE2_WEIGHT_KERNELS(uint32_t val)
+{
+	return ((val) << CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__SHIFT) & CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__MASK;
+}
+
+#define REG_CNA_CBUF_CON0					0x00001040
+#define CNA_CBUF_CON0_RESERVED_0__MASK				0xffffc000
+#define CNA_CBUF_CON0_RESERVED_0__SHIFT				14
+static inline uint32_t CNA_CBUF_CON0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_RESERVED_0__SHIFT) & CNA_CBUF_CON0_RESERVED_0__MASK;
+}
+#define CNA_CBUF_CON0_WEIGHT_REUSE__MASK			0x00002000
+#define CNA_CBUF_CON0_WEIGHT_REUSE__SHIFT			13
+static inline uint32_t CNA_CBUF_CON0_WEIGHT_REUSE(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_WEIGHT_REUSE__SHIFT) & CNA_CBUF_CON0_WEIGHT_REUSE__MASK;
+}
+#define CNA_CBUF_CON0_DATA_REUSE__MASK				0x00001000
+#define CNA_CBUF_CON0_DATA_REUSE__SHIFT				12
+static inline uint32_t CNA_CBUF_CON0_DATA_REUSE(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_DATA_REUSE__SHIFT) & CNA_CBUF_CON0_DATA_REUSE__MASK;
+}
+#define CNA_CBUF_CON0_RESERVED_1__MASK				0x00000800
+#define CNA_CBUF_CON0_RESERVED_1__SHIFT				11
+static inline uint32_t CNA_CBUF_CON0_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_RESERVED_1__SHIFT) & CNA_CBUF_CON0_RESERVED_1__MASK;
+}
+#define CNA_CBUF_CON0_FC_DATA_BANK__MASK			0x00000700
+#define CNA_CBUF_CON0_FC_DATA_BANK__SHIFT			8
+static inline uint32_t CNA_CBUF_CON0_FC_DATA_BANK(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_FC_DATA_BANK__SHIFT) & CNA_CBUF_CON0_FC_DATA_BANK__MASK;
+}
+#define CNA_CBUF_CON0_WEIGHT_BANK__MASK				0x000000f0
+#define CNA_CBUF_CON0_WEIGHT_BANK__SHIFT			4
+static inline uint32_t CNA_CBUF_CON0_WEIGHT_BANK(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_WEIGHT_BANK__SHIFT) & CNA_CBUF_CON0_WEIGHT_BANK__MASK;
+}
+#define CNA_CBUF_CON0_DATA_BANK__MASK				0x0000000f
+#define CNA_CBUF_CON0_DATA_BANK__SHIFT				0
+static inline uint32_t CNA_CBUF_CON0_DATA_BANK(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON0_DATA_BANK__SHIFT) & CNA_CBUF_CON0_DATA_BANK__MASK;
+}
+
+#define REG_CNA_CBUF_CON1					0x00001044
+#define CNA_CBUF_CON1_RESERVED_0__MASK				0xffffc000
+#define CNA_CBUF_CON1_RESERVED_0__SHIFT				14
+static inline uint32_t CNA_CBUF_CON1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON1_RESERVED_0__SHIFT) & CNA_CBUF_CON1_RESERVED_0__MASK;
+}
+#define CNA_CBUF_CON1_DATA_ENTRIES__MASK			0x00003fff
+#define CNA_CBUF_CON1_DATA_ENTRIES__SHIFT			0
+static inline uint32_t CNA_CBUF_CON1_DATA_ENTRIES(uint32_t val)
+{
+	return ((val) << CNA_CBUF_CON1_DATA_ENTRIES__SHIFT) & CNA_CBUF_CON1_DATA_ENTRIES__MASK;
+}
+
+#define REG_CNA_CVT_CON0					0x0000104c
+#define CNA_CVT_CON0_RESERVED_0__MASK				0xf0000000
+#define CNA_CVT_CON0_RESERVED_0__SHIFT				28
+static inline uint32_t CNA_CVT_CON0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_RESERVED_0__SHIFT) & CNA_CVT_CON0_RESERVED_0__MASK;
+}
+#define CNA_CVT_CON0_CVT_TRUNCATE_3__MASK			0x0fc00000
+#define CNA_CVT_CON0_CVT_TRUNCATE_3__SHIFT			22
+static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_3(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_3__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_3__MASK;
+}
+#define CNA_CVT_CON0_CVT_TRUNCATE_2__MASK			0x003f0000
+#define CNA_CVT_CON0_CVT_TRUNCATE_2__SHIFT			16
+static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_2(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_2__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_2__MASK;
+}
+#define CNA_CVT_CON0_CVT_TRUNCATE_1__MASK			0x0000fc00
+#define CNA_CVT_CON0_CVT_TRUNCATE_1__SHIFT			10
+static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_1(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_1__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_1__MASK;
+}
+#define CNA_CVT_CON0_CVT_TRUNCATE_0__MASK			0x000003f0
+#define CNA_CVT_CON0_CVT_TRUNCATE_0__SHIFT			4
+static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_0(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_0__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_0__MASK;
+}
+#define CNA_CVT_CON0_DATA_SIGN__MASK				0x00000008
+#define CNA_CVT_CON0_DATA_SIGN__SHIFT				3
+static inline uint32_t CNA_CVT_CON0_DATA_SIGN(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_DATA_SIGN__SHIFT) & CNA_CVT_CON0_DATA_SIGN__MASK;
+}
+#define CNA_CVT_CON0_ROUND_TYPE__MASK				0x00000004
+#define CNA_CVT_CON0_ROUND_TYPE__SHIFT				2
+static inline uint32_t CNA_CVT_CON0_ROUND_TYPE(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_ROUND_TYPE__SHIFT) & CNA_CVT_CON0_ROUND_TYPE__MASK;
+}
+#define CNA_CVT_CON0_CVT_TYPE__MASK				0x00000002
+#define CNA_CVT_CON0_CVT_TYPE__SHIFT				1
+static inline uint32_t CNA_CVT_CON0_CVT_TYPE(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_CVT_TYPE__SHIFT) & CNA_CVT_CON0_CVT_TYPE__MASK;
+}
+#define CNA_CVT_CON0_CVT_BYPASS__MASK				0x00000001
+#define CNA_CVT_CON0_CVT_BYPASS__SHIFT				0
+static inline uint32_t CNA_CVT_CON0_CVT_BYPASS(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON0_CVT_BYPASS__SHIFT) & CNA_CVT_CON0_CVT_BYPASS__MASK;
+}
+
+#define REG_CNA_CVT_CON1					0x00001050
+#define CNA_CVT_CON1_CVT_SCALE0__MASK				0xffff0000
+#define CNA_CVT_CON1_CVT_SCALE0__SHIFT				16
+static inline uint32_t CNA_CVT_CON1_CVT_SCALE0(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON1_CVT_SCALE0__SHIFT) & CNA_CVT_CON1_CVT_SCALE0__MASK;
+}
+#define CNA_CVT_CON1_CVT_OFFSET0__MASK				0x0000ffff
+#define CNA_CVT_CON1_CVT_OFFSET0__SHIFT				0
+static inline uint32_t CNA_CVT_CON1_CVT_OFFSET0(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON1_CVT_OFFSET0__SHIFT) & CNA_CVT_CON1_CVT_OFFSET0__MASK;
+}
+
+#define REG_CNA_CVT_CON2					0x00001054
+#define CNA_CVT_CON2_CVT_SCALE1__MASK				0xffff0000
+#define CNA_CVT_CON2_CVT_SCALE1__SHIFT				16
+static inline uint32_t CNA_CVT_CON2_CVT_SCALE1(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON2_CVT_SCALE1__SHIFT) & CNA_CVT_CON2_CVT_SCALE1__MASK;
+}
+#define CNA_CVT_CON2_CVT_OFFSET1__MASK				0x0000ffff
+#define CNA_CVT_CON2_CVT_OFFSET1__SHIFT				0
+static inline uint32_t CNA_CVT_CON2_CVT_OFFSET1(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON2_CVT_OFFSET1__SHIFT) & CNA_CVT_CON2_CVT_OFFSET1__MASK;
+}
+
+#define REG_CNA_CVT_CON3					0x00001058
+#define CNA_CVT_CON3_CVT_SCALE2__MASK				0xffff0000
+#define CNA_CVT_CON3_CVT_SCALE2__SHIFT				16
+static inline uint32_t CNA_CVT_CON3_CVT_SCALE2(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON3_CVT_SCALE2__SHIFT) & CNA_CVT_CON3_CVT_SCALE2__MASK;
+}
+#define CNA_CVT_CON3_CVT_OFFSET2__MASK				0x0000ffff
+#define CNA_CVT_CON3_CVT_OFFSET2__SHIFT				0
+static inline uint32_t CNA_CVT_CON3_CVT_OFFSET2(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON3_CVT_OFFSET2__SHIFT) & CNA_CVT_CON3_CVT_OFFSET2__MASK;
+}
+
+#define REG_CNA_CVT_CON4					0x0000105c
+#define CNA_CVT_CON4_CVT_SCALE3__MASK				0xffff0000
+#define CNA_CVT_CON4_CVT_SCALE3__SHIFT				16
+static inline uint32_t CNA_CVT_CON4_CVT_SCALE3(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON4_CVT_SCALE3__SHIFT) & CNA_CVT_CON4_CVT_SCALE3__MASK;
+}
+#define CNA_CVT_CON4_CVT_OFFSET3__MASK				0x0000ffff
+#define CNA_CVT_CON4_CVT_OFFSET3__SHIFT				0
+static inline uint32_t CNA_CVT_CON4_CVT_OFFSET3(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON4_CVT_OFFSET3__SHIFT) & CNA_CVT_CON4_CVT_OFFSET3__MASK;
+}
+
+#define REG_CNA_FC_CON0						0x00001060
+#define CNA_FC_CON0_FC_SKIP_DATA__MASK				0xffff0000
+#define CNA_FC_CON0_FC_SKIP_DATA__SHIFT				16
+static inline uint32_t CNA_FC_CON0_FC_SKIP_DATA(uint32_t val)
+{
+	return ((val) << CNA_FC_CON0_FC_SKIP_DATA__SHIFT) & CNA_FC_CON0_FC_SKIP_DATA__MASK;
+}
+#define CNA_FC_CON0_RESERVED_0__MASK				0x0000fffe
+#define CNA_FC_CON0_RESERVED_0__SHIFT				1
+static inline uint32_t CNA_FC_CON0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_FC_CON0_RESERVED_0__SHIFT) & CNA_FC_CON0_RESERVED_0__MASK;
+}
+#define CNA_FC_CON0_FC_SKIP_EN__MASK				0x00000001
+#define CNA_FC_CON0_FC_SKIP_EN__SHIFT				0
+static inline uint32_t CNA_FC_CON0_FC_SKIP_EN(uint32_t val)
+{
+	return ((val) << CNA_FC_CON0_FC_SKIP_EN__SHIFT) & CNA_FC_CON0_FC_SKIP_EN__MASK;
+}
+
+#define REG_CNA_FC_CON1						0x00001064
+#define CNA_FC_CON1_RESERVED_0__MASK				0xfffe0000
+#define CNA_FC_CON1_RESERVED_0__SHIFT				17
+static inline uint32_t CNA_FC_CON1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_FC_CON1_RESERVED_0__SHIFT) & CNA_FC_CON1_RESERVED_0__MASK;
+}
+#define CNA_FC_CON1_DATA_OFFSET__MASK				0x0001ffff
+#define CNA_FC_CON1_DATA_OFFSET__SHIFT				0
+static inline uint32_t CNA_FC_CON1_DATA_OFFSET(uint32_t val)
+{
+	return ((val) << CNA_FC_CON1_DATA_OFFSET__SHIFT) & CNA_FC_CON1_DATA_OFFSET__MASK;
+}
+
+#define REG_CNA_PAD_CON0					0x00001068
+#define CNA_PAD_CON0_RESERVED_0__MASK				0xffffff00
+#define CNA_PAD_CON0_RESERVED_0__SHIFT				8
+static inline uint32_t CNA_PAD_CON0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_PAD_CON0_RESERVED_0__SHIFT) & CNA_PAD_CON0_RESERVED_0__MASK;
+}
+#define CNA_PAD_CON0_PAD_LEFT__MASK				0x000000f0
+#define CNA_PAD_CON0_PAD_LEFT__SHIFT				4
+static inline uint32_t CNA_PAD_CON0_PAD_LEFT(uint32_t val)
+{
+	return ((val) << CNA_PAD_CON0_PAD_LEFT__SHIFT) & CNA_PAD_CON0_PAD_LEFT__MASK;
+}
+#define CNA_PAD_CON0_PAD_TOP__MASK				0x0000000f
+#define CNA_PAD_CON0_PAD_TOP__SHIFT				0
+static inline uint32_t CNA_PAD_CON0_PAD_TOP(uint32_t val)
+{
+	return ((val) << CNA_PAD_CON0_PAD_TOP__SHIFT) & CNA_PAD_CON0_PAD_TOP__MASK;
+}
+
+#define REG_CNA_FEATURE_DATA_ADDR				0x00001070
+#define CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__MASK		0xffffffff
+#define CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__SHIFT		0
+static inline uint32_t CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR(uint32_t val)
+{
+	return ((val) << CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__SHIFT) & CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__MASK;
+}
+
+#define REG_CNA_FC_CON2						0x00001074
+#define CNA_FC_CON2_RESERVED_0__MASK				0xfffe0000
+#define CNA_FC_CON2_RESERVED_0__SHIFT				17
+static inline uint32_t CNA_FC_CON2_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_FC_CON2_RESERVED_0__SHIFT) & CNA_FC_CON2_RESERVED_0__MASK;
+}
+#define CNA_FC_CON2_WEIGHT_OFFSET__MASK				0x0001ffff
+#define CNA_FC_CON2_WEIGHT_OFFSET__SHIFT			0
+static inline uint32_t CNA_FC_CON2_WEIGHT_OFFSET(uint32_t val)
+{
+	return ((val) << CNA_FC_CON2_WEIGHT_OFFSET__SHIFT) & CNA_FC_CON2_WEIGHT_OFFSET__MASK;
+}
+
+#define REG_CNA_DMA_CON0					0x00001078
+#define CNA_DMA_CON0_OV4K_BYPASS__MASK				0x80000000
+#define CNA_DMA_CON0_OV4K_BYPASS__SHIFT				31
+static inline uint32_t CNA_DMA_CON0_OV4K_BYPASS(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON0_OV4K_BYPASS__SHIFT) & CNA_DMA_CON0_OV4K_BYPASS__MASK;
+}
+#define CNA_DMA_CON0_RESERVED_0__MASK				0x7ff00000
+#define CNA_DMA_CON0_RESERVED_0__SHIFT				20
+static inline uint32_t CNA_DMA_CON0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON0_RESERVED_0__SHIFT) & CNA_DMA_CON0_RESERVED_0__MASK;
+}
+#define CNA_DMA_CON0_WEIGHT_BURST_LEN__MASK			0x000f0000
+#define CNA_DMA_CON0_WEIGHT_BURST_LEN__SHIFT			16
+static inline uint32_t CNA_DMA_CON0_WEIGHT_BURST_LEN(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON0_WEIGHT_BURST_LEN__SHIFT) & CNA_DMA_CON0_WEIGHT_BURST_LEN__MASK;
+}
+#define CNA_DMA_CON0_RESERVED_1__MASK				0x0000fff0
+#define CNA_DMA_CON0_RESERVED_1__SHIFT				4
+static inline uint32_t CNA_DMA_CON0_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON0_RESERVED_1__SHIFT) & CNA_DMA_CON0_RESERVED_1__MASK;
+}
+#define CNA_DMA_CON0_DATA_BURST_LEN__MASK			0x0000000f
+#define CNA_DMA_CON0_DATA_BURST_LEN__SHIFT			0
+static inline uint32_t CNA_DMA_CON0_DATA_BURST_LEN(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON0_DATA_BURST_LEN__SHIFT) & CNA_DMA_CON0_DATA_BURST_LEN__MASK;
+}
+
+#define REG_CNA_DMA_CON1					0x0000107c
+#define CNA_DMA_CON1_RESERVED_0__MASK				0xf0000000
+#define CNA_DMA_CON1_RESERVED_0__SHIFT				28
+static inline uint32_t CNA_DMA_CON1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON1_RESERVED_0__SHIFT) & CNA_DMA_CON1_RESERVED_0__MASK;
+}
+#define CNA_DMA_CON1_LINE_STRIDE__MASK				0x0fffffff
+#define CNA_DMA_CON1_LINE_STRIDE__SHIFT				0
+static inline uint32_t CNA_DMA_CON1_LINE_STRIDE(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON1_LINE_STRIDE__SHIFT) & CNA_DMA_CON1_LINE_STRIDE__MASK;
+}
+
+#define REG_CNA_DMA_CON2					0x00001080
+#define CNA_DMA_CON2_RESERVED_0__MASK				0xf0000000
+#define CNA_DMA_CON2_RESERVED_0__SHIFT				28
+static inline uint32_t CNA_DMA_CON2_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON2_RESERVED_0__SHIFT) & CNA_DMA_CON2_RESERVED_0__MASK;
+}
+#define CNA_DMA_CON2_SURF_STRIDE__MASK				0x0fffffff
+#define CNA_DMA_CON2_SURF_STRIDE__SHIFT				0
+static inline uint32_t CNA_DMA_CON2_SURF_STRIDE(uint32_t val)
+{
+	return ((val) << CNA_DMA_CON2_SURF_STRIDE__SHIFT) & CNA_DMA_CON2_SURF_STRIDE__MASK;
+}
+
+#define REG_CNA_FC_DATA_SIZE0					0x00001084
+#define CNA_FC_DATA_SIZE0_RESERVED_0__MASK			0xc0000000
+#define CNA_FC_DATA_SIZE0_RESERVED_0__SHIFT			30
+static inline uint32_t CNA_FC_DATA_SIZE0_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_FC_DATA_SIZE0_RESERVED_0__SHIFT) & CNA_FC_DATA_SIZE0_RESERVED_0__MASK;
+}
+#define CNA_FC_DATA_SIZE0_DMA_WIDTH__MASK			0x3fff0000
+#define CNA_FC_DATA_SIZE0_DMA_WIDTH__SHIFT			16
+static inline uint32_t CNA_FC_DATA_SIZE0_DMA_WIDTH(uint32_t val)
+{
+	return ((val) << CNA_FC_DATA_SIZE0_DMA_WIDTH__SHIFT) & CNA_FC_DATA_SIZE0_DMA_WIDTH__MASK;
+}
+#define CNA_FC_DATA_SIZE0_RESERVED_1__MASK			0x0000f800
+#define CNA_FC_DATA_SIZE0_RESERVED_1__SHIFT			11
+static inline uint32_t CNA_FC_DATA_SIZE0_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_FC_DATA_SIZE0_RESERVED_1__SHIFT) & CNA_FC_DATA_SIZE0_RESERVED_1__MASK;
+}
+#define CNA_FC_DATA_SIZE0_DMA_HEIGHT__MASK			0x000007ff
+#define CNA_FC_DATA_SIZE0_DMA_HEIGHT__SHIFT			0
+static inline uint32_t CNA_FC_DATA_SIZE0_DMA_HEIGHT(uint32_t val)
+{
+	return ((val) << CNA_FC_DATA_SIZE0_DMA_HEIGHT__SHIFT) & CNA_FC_DATA_SIZE0_DMA_HEIGHT__MASK;
+}
+
+#define REG_CNA_FC_DATA_SIZE1					0x00001088
+#define CNA_FC_DATA_SIZE1_RESERVED_0__MASK			0xffff0000
+#define CNA_FC_DATA_SIZE1_RESERVED_0__SHIFT			16
+static inline uint32_t CNA_FC_DATA_SIZE1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_FC_DATA_SIZE1_RESERVED_0__SHIFT) & CNA_FC_DATA_SIZE1_RESERVED_0__MASK;
+}
+#define CNA_FC_DATA_SIZE1_DMA_CHANNEL__MASK			0x0000ffff
+#define CNA_FC_DATA_SIZE1_DMA_CHANNEL__SHIFT			0
+static inline uint32_t CNA_FC_DATA_SIZE1_DMA_CHANNEL(uint32_t val)
+{
+	return ((val) << CNA_FC_DATA_SIZE1_DMA_CHANNEL__SHIFT) & CNA_FC_DATA_SIZE1_DMA_CHANNEL__MASK;
+}
+
+#define REG_CNA_CLK_GATE					0x00001090
+#define CNA_CLK_GATE_RESERVED_0__MASK				0xffffffe0
+#define CNA_CLK_GATE_RESERVED_0__SHIFT				5
+static inline uint32_t CNA_CLK_GATE_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_CLK_GATE_RESERVED_0__SHIFT) & CNA_CLK_GATE_RESERVED_0__MASK;
+}
+#define CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__MASK		0x00000010
+#define CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__SHIFT		4
+static inline uint32_t CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE(uint32_t val)
+{
+	return ((val) << CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__MASK;
+}
+#define CNA_CLK_GATE_RESERVED_1__MASK				0x00000008
+#define CNA_CLK_GATE_RESERVED_1__SHIFT				3
+static inline uint32_t CNA_CLK_GATE_RESERVED_1(uint32_t val)
+{
+	return ((val) << CNA_CLK_GATE_RESERVED_1__SHIFT) & CNA_CLK_GATE_RESERVED_1__MASK;
+}
+#define CNA_CLK_GATE_CSC_DISABLE_CLKGATE__MASK			0x00000004
+#define CNA_CLK_GATE_CSC_DISABLE_CLKGATE__SHIFT			2
+static inline uint32_t CNA_CLK_GATE_CSC_DISABLE_CLKGATE(uint32_t val)
+{
+	return ((val) << CNA_CLK_GATE_CSC_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CSC_DISABLE_CLKGATE__MASK;
+}
+#define CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__MASK		0x00000002
+#define CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__SHIFT		1
+static inline uint32_t CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE(uint32_t val)
+{
+	return ((val) << CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__MASK;
+}
+#define CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__MASK		0x00000001
+#define CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__SHIFT		0
+static inline uint32_t CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE(uint32_t val)
+{
+	return ((val) << CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__MASK;
+}
+
+#define REG_CNA_DCOMP_CTRL					0x00001100
+#define CNA_DCOMP_CTRL_RESERVED_0__MASK				0xfffffff0
+#define CNA_DCOMP_CTRL_RESERVED_0__SHIFT			4
+static inline uint32_t CNA_DCOMP_CTRL_RESERVED_0(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_CTRL_RESERVED_0__SHIFT) & CNA_DCOMP_CTRL_RESERVED_0__MASK;
+}
+#define CNA_DCOMP_CTRL_WT_DEC_BYPASS__MASK			0x00000008
+#define CNA_DCOMP_CTRL_WT_DEC_BYPASS__SHIFT			3
+static inline uint32_t CNA_DCOMP_CTRL_WT_DEC_BYPASS(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_CTRL_WT_DEC_BYPASS__SHIFT) & CNA_DCOMP_CTRL_WT_DEC_BYPASS__MASK;
+}
+#define CNA_DCOMP_CTRL_DECOMP_CONTROL__MASK			0x00000007
+#define CNA_DCOMP_CTRL_DECOMP_CONTROL__SHIFT			0
+static inline uint32_t CNA_DCOMP_CTRL_DECOMP_CONTROL(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_CTRL_DECOMP_CONTROL__SHIFT) & CNA_DCOMP_CTRL_DECOMP_CONTROL__MASK;
+}
+
+#define REG_CNA_DCOMP_REGNUM					0x00001104
+#define CNA_DCOMP_REGNUM_DCOMP_REGNUM__MASK			0xffffffff
+#define CNA_DCOMP_REGNUM_DCOMP_REGNUM__SHIFT			0
+static inline uint32_t CNA_DCOMP_REGNUM_DCOMP_REGNUM(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_REGNUM_DCOMP_REGNUM__SHIFT) & CNA_DCOMP_REGNUM_DCOMP_REGNUM__MASK;
+}
+
+#define REG_CNA_DCOMP_ADDR0					0x00001110
+#define CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__MASK			0xffffffff
+#define CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__SHIFT			0
+static inline uint32_t CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__SHIFT) & CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT0					0x00001140
+#define CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__SHIFT) & CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT1					0x00001144
+#define CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__SHIFT) & CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT2					0x00001148
+#define CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__SHIFT) & CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT3					0x0000114c
+#define CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__SHIFT) & CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT4					0x00001150
+#define CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__SHIFT) & CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT5					0x00001154
+#define CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__SHIFT) & CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT6					0x00001158
+#define CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__SHIFT) & CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT7					0x0000115c
+#define CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__SHIFT) & CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT8					0x00001160
+#define CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__SHIFT) & CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT9					0x00001164
+#define CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__SHIFT			0
+static inline uint32_t CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__SHIFT) & CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT10					0x00001168
+#define CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__SHIFT		0
+static inline uint32_t CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__SHIFT) & CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT11					0x0000116c
+#define CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__SHIFT		0
+static inline uint32_t CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__SHIFT) & CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT12					0x00001170
+#define CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__SHIFT		0
+static inline uint32_t CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__SHIFT) & CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT13					0x00001174
+#define CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__SHIFT		0
+static inline uint32_t CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__SHIFT) & CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT14					0x00001178
+#define CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__SHIFT		0
+static inline uint32_t CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__SHIFT) & CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__MASK;
+}
+
+#define REG_CNA_DCOMP_AMOUNT15					0x0000117c
+#define CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__MASK			0xffffffff
+#define CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__SHIFT		0
+static inline uint32_t CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15(uint32_t val)
+{
+	return ((val) << CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__SHIFT) & CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__MASK;
+}
+
+#define REG_CNA_CVT_CON5					0x00001180
+#define CNA_CVT_CON5_PER_CHANNEL_CVT_EN__MASK			0xffffffff
+#define CNA_CVT_CON5_PER_CHANNEL_CVT_EN__SHIFT			0
+static inline uint32_t CNA_CVT_CON5_PER_CHANNEL_CVT_EN(uint32_t val)
+{
+	return ((val) << CNA_CVT_CON5_PER_CHANNEL_CVT_EN__SHIFT) & CNA_CVT_CON5_PER_CHANNEL_CVT_EN__MASK;
+}
+
+#define REG_CNA_PAD_CON1					0x00001184
+#define CNA_PAD_CON1_PAD_VALUE__MASK				0xffffffff
+#define CNA_PAD_CON1_PAD_VALUE__SHIFT				0
+static inline uint32_t CNA_PAD_CON1_PAD_VALUE(uint32_t val)
+{
+	return ((val) << CNA_PAD_CON1_PAD_VALUE__SHIFT) & CNA_PAD_CON1_PAD_VALUE__MASK;
+}
+
+#define REG_CORE_S_STATUS					0x00003000
+#define CORE_S_STATUS_RESERVED_0__MASK				0xfffc0000
+#define CORE_S_STATUS_RESERVED_0__SHIFT				18
+static inline uint32_t CORE_S_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_S_STATUS_RESERVED_0__SHIFT) & CORE_S_STATUS_RESERVED_0__MASK;
+}
+#define CORE_S_STATUS_STATUS_1__MASK				0x00030000
+#define CORE_S_STATUS_STATUS_1__SHIFT				16
+static inline uint32_t CORE_S_STATUS_STATUS_1(uint32_t val)
+{
+	return ((val) << CORE_S_STATUS_STATUS_1__SHIFT) & CORE_S_STATUS_STATUS_1__MASK;
+}
+#define CORE_S_STATUS_RESERVED_1__MASK				0x0000fffc
+#define CORE_S_STATUS_RESERVED_1__SHIFT				2
+static inline uint32_t CORE_S_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << CORE_S_STATUS_RESERVED_1__SHIFT) & CORE_S_STATUS_RESERVED_1__MASK;
+}
+#define CORE_S_STATUS_STATUS_0__MASK				0x00000003
+#define CORE_S_STATUS_STATUS_0__SHIFT				0
+static inline uint32_t CORE_S_STATUS_STATUS_0(uint32_t val)
+{
+	return ((val) << CORE_S_STATUS_STATUS_0__SHIFT) & CORE_S_STATUS_STATUS_0__MASK;
+}
+
+#define REG_CORE_S_POINTER					0x00003004
+#define CORE_S_POINTER_RESERVED_0__MASK				0xfffe0000
+#define CORE_S_POINTER_RESERVED_0__SHIFT			17
+static inline uint32_t CORE_S_POINTER_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_RESERVED_0__SHIFT) & CORE_S_POINTER_RESERVED_0__MASK;
+}
+#define CORE_S_POINTER_EXECUTER__MASK				0x00010000
+#define CORE_S_POINTER_EXECUTER__SHIFT				16
+static inline uint32_t CORE_S_POINTER_EXECUTER(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_EXECUTER__SHIFT) & CORE_S_POINTER_EXECUTER__MASK;
+}
+#define CORE_S_POINTER_RESERVED_1__MASK				0x0000ffc0
+#define CORE_S_POINTER_RESERVED_1__SHIFT			6
+static inline uint32_t CORE_S_POINTER_RESERVED_1(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_RESERVED_1__SHIFT) & CORE_S_POINTER_RESERVED_1__MASK;
+}
+#define CORE_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
+#define CORE_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
+static inline uint32_t CORE_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & CORE_S_POINTER_EXECUTER_PP_CLEAR__MASK;
+}
+#define CORE_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
+#define CORE_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
+static inline uint32_t CORE_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_POINTER_PP_CLEAR__SHIFT) & CORE_S_POINTER_POINTER_PP_CLEAR__MASK;
+}
+#define CORE_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
+#define CORE_S_POINTER_POINTER_PP_MODE__SHIFT			3
+static inline uint32_t CORE_S_POINTER_POINTER_PP_MODE(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_POINTER_PP_MODE__SHIFT) & CORE_S_POINTER_POINTER_PP_MODE__MASK;
+}
+#define CORE_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
+#define CORE_S_POINTER_EXECUTER_PP_EN__SHIFT			2
+static inline uint32_t CORE_S_POINTER_EXECUTER_PP_EN(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_EXECUTER_PP_EN__SHIFT) & CORE_S_POINTER_EXECUTER_PP_EN__MASK;
+}
+#define CORE_S_POINTER_POINTER_PP_EN__MASK			0x00000002
+#define CORE_S_POINTER_POINTER_PP_EN__SHIFT			1
+static inline uint32_t CORE_S_POINTER_POINTER_PP_EN(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_POINTER_PP_EN__SHIFT) & CORE_S_POINTER_POINTER_PP_EN__MASK;
+}
+#define CORE_S_POINTER_POINTER__MASK				0x00000001
+#define CORE_S_POINTER_POINTER__SHIFT				0
+static inline uint32_t CORE_S_POINTER_POINTER(uint32_t val)
+{
+	return ((val) << CORE_S_POINTER_POINTER__SHIFT) & CORE_S_POINTER_POINTER__MASK;
+}
+
+#define REG_CORE_OPERATION_ENABLE				0x00003008
+#define CORE_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
+#define CORE_OPERATION_ENABLE_RESERVED_0__SHIFT			1
+static inline uint32_t CORE_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_OPERATION_ENABLE_RESERVED_0__SHIFT) & CORE_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define CORE_OPERATION_ENABLE_OP_EN__MASK			0x00000001
+#define CORE_OPERATION_ENABLE_OP_EN__SHIFT			0
+static inline uint32_t CORE_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << CORE_OPERATION_ENABLE_OP_EN__SHIFT) & CORE_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_CORE_MAC_GATING					0x0000300c
+#define CORE_MAC_GATING_RESERVED_0__MASK			0xf8000000
+#define CORE_MAC_GATING_RESERVED_0__SHIFT			27
+static inline uint32_t CORE_MAC_GATING_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_MAC_GATING_RESERVED_0__SHIFT) & CORE_MAC_GATING_RESERVED_0__MASK;
+}
+#define CORE_MAC_GATING_SLCG_OP_EN__MASK			0x07ffffff
+#define CORE_MAC_GATING_SLCG_OP_EN__SHIFT			0
+static inline uint32_t CORE_MAC_GATING_SLCG_OP_EN(uint32_t val)
+{
+	return ((val) << CORE_MAC_GATING_SLCG_OP_EN__SHIFT) & CORE_MAC_GATING_SLCG_OP_EN__MASK;
+}
+
+#define REG_CORE_MISC_CFG					0x00003010
+#define CORE_MISC_CFG_RESERVED_0__MASK				0xfff00000
+#define CORE_MISC_CFG_RESERVED_0__SHIFT				20
+static inline uint32_t CORE_MISC_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_RESERVED_0__SHIFT) & CORE_MISC_CFG_RESERVED_0__MASK;
+}
+#define CORE_MISC_CFG_SOFT_GATING__MASK				0x000fc000
+#define CORE_MISC_CFG_SOFT_GATING__SHIFT			14
+static inline uint32_t CORE_MISC_CFG_SOFT_GATING(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_SOFT_GATING__SHIFT) & CORE_MISC_CFG_SOFT_GATING__MASK;
+}
+#define CORE_MISC_CFG_RESERVED_1__MASK				0x00003800
+#define CORE_MISC_CFG_RESERVED_1__SHIFT				11
+static inline uint32_t CORE_MISC_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_RESERVED_1__SHIFT) & CORE_MISC_CFG_RESERVED_1__MASK;
+}
+#define CORE_MISC_CFG_PROC_PRECISION__MASK			0x00000700
+#define CORE_MISC_CFG_PROC_PRECISION__SHIFT			8
+static inline uint32_t CORE_MISC_CFG_PROC_PRECISION(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_PROC_PRECISION__SHIFT) & CORE_MISC_CFG_PROC_PRECISION__MASK;
+}
+#define CORE_MISC_CFG_RESERVED_2__MASK				0x000000fc
+#define CORE_MISC_CFG_RESERVED_2__SHIFT				2
+static inline uint32_t CORE_MISC_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_RESERVED_2__SHIFT) & CORE_MISC_CFG_RESERVED_2__MASK;
+}
+#define CORE_MISC_CFG_DW_EN__MASK				0x00000002
+#define CORE_MISC_CFG_DW_EN__SHIFT				1
+static inline uint32_t CORE_MISC_CFG_DW_EN(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_DW_EN__SHIFT) & CORE_MISC_CFG_DW_EN__MASK;
+}
+#define CORE_MISC_CFG_QD_EN__MASK				0x00000001
+#define CORE_MISC_CFG_QD_EN__SHIFT				0
+static inline uint32_t CORE_MISC_CFG_QD_EN(uint32_t val)
+{
+	return ((val) << CORE_MISC_CFG_QD_EN__SHIFT) & CORE_MISC_CFG_QD_EN__MASK;
+}
+
+#define REG_CORE_DATAOUT_SIZE_0					0x00003014
+#define CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__MASK		0xffff0000
+#define CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__SHIFT		16
+static inline uint32_t CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT(uint32_t val)
+{
+	return ((val) << CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__SHIFT) & CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__MASK;
+}
+#define CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__MASK			0x0000ffff
+#define CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__SHIFT		0
+static inline uint32_t CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH(uint32_t val)
+{
+	return ((val) << CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__SHIFT) & CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__MASK;
+}
+
+#define REG_CORE_DATAOUT_SIZE_1					0x00003018
+#define CORE_DATAOUT_SIZE_1_RESERVED_0__MASK			0xffff0000
+#define CORE_DATAOUT_SIZE_1_RESERVED_0__SHIFT			16
+static inline uint32_t CORE_DATAOUT_SIZE_1_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_DATAOUT_SIZE_1_RESERVED_0__SHIFT) & CORE_DATAOUT_SIZE_1_RESERVED_0__MASK;
+}
+#define CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__MASK		0x0000ffff
+#define CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__SHIFT		0
+static inline uint32_t CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL(uint32_t val)
+{
+	return ((val) << CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__SHIFT) & CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__MASK;
+}
+
+#define REG_CORE_CLIP_TRUNCATE					0x0000301c
+#define CORE_CLIP_TRUNCATE_RESERVED_0__MASK			0xffffff80
+#define CORE_CLIP_TRUNCATE_RESERVED_0__SHIFT			7
+static inline uint32_t CORE_CLIP_TRUNCATE_RESERVED_0(uint32_t val)
+{
+	return ((val) << CORE_CLIP_TRUNCATE_RESERVED_0__SHIFT) & CORE_CLIP_TRUNCATE_RESERVED_0__MASK;
+}
+#define CORE_CLIP_TRUNCATE_ROUND_TYPE__MASK			0x00000040
+#define CORE_CLIP_TRUNCATE_ROUND_TYPE__SHIFT			6
+static inline uint32_t CORE_CLIP_TRUNCATE_ROUND_TYPE(uint32_t val)
+{
+	return ((val) << CORE_CLIP_TRUNCATE_ROUND_TYPE__SHIFT) & CORE_CLIP_TRUNCATE_ROUND_TYPE__MASK;
+}
+#define CORE_CLIP_TRUNCATE_RESERVED_1__MASK			0x00000020
+#define CORE_CLIP_TRUNCATE_RESERVED_1__SHIFT			5
+static inline uint32_t CORE_CLIP_TRUNCATE_RESERVED_1(uint32_t val)
+{
+	return ((val) << CORE_CLIP_TRUNCATE_RESERVED_1__SHIFT) & CORE_CLIP_TRUNCATE_RESERVED_1__MASK;
+}
+#define CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__MASK			0x0000001f
+#define CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__SHIFT			0
+static inline uint32_t CORE_CLIP_TRUNCATE_CLIP_TRUNCATE(uint32_t val)
+{
+	return ((val) << CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__SHIFT) & CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__MASK;
+}
+
+#define REG_DPU_S_STATUS					0x00004000
+#define DPU_S_STATUS_RESERVED_0__MASK				0xfffc0000
+#define DPU_S_STATUS_RESERVED_0__SHIFT				18
+static inline uint32_t DPU_S_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_S_STATUS_RESERVED_0__SHIFT) & DPU_S_STATUS_RESERVED_0__MASK;
+}
+#define DPU_S_STATUS_STATUS_1__MASK				0x00030000
+#define DPU_S_STATUS_STATUS_1__SHIFT				16
+static inline uint32_t DPU_S_STATUS_STATUS_1(uint32_t val)
+{
+	return ((val) << DPU_S_STATUS_STATUS_1__SHIFT) & DPU_S_STATUS_STATUS_1__MASK;
+}
+#define DPU_S_STATUS_RESERVED_1__MASK				0x0000fffc
+#define DPU_S_STATUS_RESERVED_1__SHIFT				2
+static inline uint32_t DPU_S_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_S_STATUS_RESERVED_1__SHIFT) & DPU_S_STATUS_RESERVED_1__MASK;
+}
+#define DPU_S_STATUS_STATUS_0__MASK				0x00000003
+#define DPU_S_STATUS_STATUS_0__SHIFT				0
+static inline uint32_t DPU_S_STATUS_STATUS_0(uint32_t val)
+{
+	return ((val) << DPU_S_STATUS_STATUS_0__SHIFT) & DPU_S_STATUS_STATUS_0__MASK;
+}
+
+#define REG_DPU_S_POINTER					0x00004004
+#define DPU_S_POINTER_RESERVED_0__MASK				0xfffe0000
+#define DPU_S_POINTER_RESERVED_0__SHIFT				17
+static inline uint32_t DPU_S_POINTER_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_RESERVED_0__SHIFT) & DPU_S_POINTER_RESERVED_0__MASK;
+}
+#define DPU_S_POINTER_EXECUTER__MASK				0x00010000
+#define DPU_S_POINTER_EXECUTER__SHIFT				16
+static inline uint32_t DPU_S_POINTER_EXECUTER(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_EXECUTER__SHIFT) & DPU_S_POINTER_EXECUTER__MASK;
+}
+#define DPU_S_POINTER_RESERVED_1__MASK				0x0000ffc0
+#define DPU_S_POINTER_RESERVED_1__SHIFT				6
+static inline uint32_t DPU_S_POINTER_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_RESERVED_1__SHIFT) & DPU_S_POINTER_RESERVED_1__MASK;
+}
+#define DPU_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
+#define DPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
+static inline uint32_t DPU_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & DPU_S_POINTER_EXECUTER_PP_CLEAR__MASK;
+}
+#define DPU_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
+#define DPU_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
+static inline uint32_t DPU_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_POINTER_PP_CLEAR__SHIFT) & DPU_S_POINTER_POINTER_PP_CLEAR__MASK;
+}
+#define DPU_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
+#define DPU_S_POINTER_POINTER_PP_MODE__SHIFT			3
+static inline uint32_t DPU_S_POINTER_POINTER_PP_MODE(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_POINTER_PP_MODE__SHIFT) & DPU_S_POINTER_POINTER_PP_MODE__MASK;
+}
+#define DPU_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
+#define DPU_S_POINTER_EXECUTER_PP_EN__SHIFT			2
+static inline uint32_t DPU_S_POINTER_EXECUTER_PP_EN(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_EXECUTER_PP_EN__SHIFT) & DPU_S_POINTER_EXECUTER_PP_EN__MASK;
+}
+#define DPU_S_POINTER_POINTER_PP_EN__MASK			0x00000002
+#define DPU_S_POINTER_POINTER_PP_EN__SHIFT			1
+static inline uint32_t DPU_S_POINTER_POINTER_PP_EN(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_POINTER_PP_EN__SHIFT) & DPU_S_POINTER_POINTER_PP_EN__MASK;
+}
+#define DPU_S_POINTER_POINTER__MASK				0x00000001
+#define DPU_S_POINTER_POINTER__SHIFT				0
+static inline uint32_t DPU_S_POINTER_POINTER(uint32_t val)
+{
+	return ((val) << DPU_S_POINTER_POINTER__SHIFT) & DPU_S_POINTER_POINTER__MASK;
+}
+
+#define REG_DPU_OPERATION_ENABLE				0x00004008
+#define DPU_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
+#define DPU_OPERATION_ENABLE_RESERVED_0__SHIFT			1
+static inline uint32_t DPU_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_OPERATION_ENABLE_RESERVED_0__SHIFT) & DPU_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define DPU_OPERATION_ENABLE_OP_EN__MASK			0x00000001
+#define DPU_OPERATION_ENABLE_OP_EN__SHIFT			0
+static inline uint32_t DPU_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << DPU_OPERATION_ENABLE_OP_EN__SHIFT) & DPU_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_DPU_FEATURE_MODE_CFG				0x0000400c
+#define DPU_FEATURE_MODE_CFG_COMB_USE__MASK			0x80000000
+#define DPU_FEATURE_MODE_CFG_COMB_USE__SHIFT			31
+static inline uint32_t DPU_FEATURE_MODE_CFG_COMB_USE(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_COMB_USE__SHIFT) & DPU_FEATURE_MODE_CFG_COMB_USE__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_TP_EN__MASK			0x40000000
+#define DPU_FEATURE_MODE_CFG_TP_EN__SHIFT			30
+static inline uint32_t DPU_FEATURE_MODE_CFG_TP_EN(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_TP_EN__SHIFT) & DPU_FEATURE_MODE_CFG_TP_EN__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_RGP_TYPE__MASK			0x3c000000
+#define DPU_FEATURE_MODE_CFG_RGP_TYPE__SHIFT			26
+static inline uint32_t DPU_FEATURE_MODE_CFG_RGP_TYPE(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_RGP_TYPE__SHIFT) & DPU_FEATURE_MODE_CFG_RGP_TYPE__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_NONALIGN__MASK			0x02000000
+#define DPU_FEATURE_MODE_CFG_NONALIGN__SHIFT			25
+static inline uint32_t DPU_FEATURE_MODE_CFG_NONALIGN(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_NONALIGN__SHIFT) & DPU_FEATURE_MODE_CFG_NONALIGN__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_SURF_LEN__MASK			0x01fffe00
+#define DPU_FEATURE_MODE_CFG_SURF_LEN__SHIFT			9
+static inline uint32_t DPU_FEATURE_MODE_CFG_SURF_LEN(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_SURF_LEN__SHIFT) & DPU_FEATURE_MODE_CFG_SURF_LEN__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_BURST_LEN__MASK			0x000001e0
+#define DPU_FEATURE_MODE_CFG_BURST_LEN__SHIFT			5
+static inline uint32_t DPU_FEATURE_MODE_CFG_BURST_LEN(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_BURST_LEN__SHIFT) & DPU_FEATURE_MODE_CFG_BURST_LEN__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_CONV_MODE__MASK			0x00000018
+#define DPU_FEATURE_MODE_CFG_CONV_MODE__SHIFT			3
+static inline uint32_t DPU_FEATURE_MODE_CFG_CONV_MODE(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_CONV_MODE__SHIFT) & DPU_FEATURE_MODE_CFG_CONV_MODE__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_OUTPUT_MODE__MASK			0x00000006
+#define DPU_FEATURE_MODE_CFG_OUTPUT_MODE__SHIFT			1
+static inline uint32_t DPU_FEATURE_MODE_CFG_OUTPUT_MODE(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_OUTPUT_MODE__SHIFT) & DPU_FEATURE_MODE_CFG_OUTPUT_MODE__MASK;
+}
+#define DPU_FEATURE_MODE_CFG_FLYING_MODE__MASK			0x00000001
+#define DPU_FEATURE_MODE_CFG_FLYING_MODE__SHIFT			0
+static inline uint32_t DPU_FEATURE_MODE_CFG_FLYING_MODE(uint32_t val)
+{
+	return ((val) << DPU_FEATURE_MODE_CFG_FLYING_MODE__SHIFT) & DPU_FEATURE_MODE_CFG_FLYING_MODE__MASK;
+}
+
+#define REG_DPU_DATA_FORMAT					0x00004010
+#define DPU_DATA_FORMAT_OUT_PRECISION__MASK			0xe0000000
+#define DPU_DATA_FORMAT_OUT_PRECISION__SHIFT			29
+static inline uint32_t DPU_DATA_FORMAT_OUT_PRECISION(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_OUT_PRECISION__SHIFT) & DPU_DATA_FORMAT_OUT_PRECISION__MASK;
+}
+#define DPU_DATA_FORMAT_IN_PRECISION__MASK			0x1c000000
+#define DPU_DATA_FORMAT_IN_PRECISION__SHIFT			26
+static inline uint32_t DPU_DATA_FORMAT_IN_PRECISION(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_IN_PRECISION__SHIFT) & DPU_DATA_FORMAT_IN_PRECISION__MASK;
+}
+#define DPU_DATA_FORMAT_EW_TRUNCATE_NEG__MASK			0x03ff0000
+#define DPU_DATA_FORMAT_EW_TRUNCATE_NEG__SHIFT			16
+static inline uint32_t DPU_DATA_FORMAT_EW_TRUNCATE_NEG(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_EW_TRUNCATE_NEG__SHIFT) & DPU_DATA_FORMAT_EW_TRUNCATE_NEG__MASK;
+}
+#define DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__MASK		0x0000fc00
+#define DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__SHIFT		10
+static inline uint32_t DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__SHIFT) & DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__MASK;
+}
+#define DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__MASK		0x000003f0
+#define DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__SHIFT		4
+static inline uint32_t DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__SHIFT) & DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__MASK;
+}
+#define DPU_DATA_FORMAT_MC_SURF_OUT__MASK			0x00000008
+#define DPU_DATA_FORMAT_MC_SURF_OUT__SHIFT			3
+static inline uint32_t DPU_DATA_FORMAT_MC_SURF_OUT(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_MC_SURF_OUT__SHIFT) & DPU_DATA_FORMAT_MC_SURF_OUT__MASK;
+}
+#define DPU_DATA_FORMAT_PROC_PRECISION__MASK			0x00000007
+#define DPU_DATA_FORMAT_PROC_PRECISION__SHIFT			0
+static inline uint32_t DPU_DATA_FORMAT_PROC_PRECISION(uint32_t val)
+{
+	return ((val) << DPU_DATA_FORMAT_PROC_PRECISION__SHIFT) & DPU_DATA_FORMAT_PROC_PRECISION__MASK;
+}
+
+#define REG_DPU_OFFSET_PEND					0x00004014
+#define DPU_OFFSET_PEND_RESERVED_0__MASK			0xffff0000
+#define DPU_OFFSET_PEND_RESERVED_0__SHIFT			16
+static inline uint32_t DPU_OFFSET_PEND_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_OFFSET_PEND_RESERVED_0__SHIFT) & DPU_OFFSET_PEND_RESERVED_0__MASK;
+}
+#define DPU_OFFSET_PEND_OFFSET_PEND__MASK			0x0000ffff
+#define DPU_OFFSET_PEND_OFFSET_PEND__SHIFT			0
+static inline uint32_t DPU_OFFSET_PEND_OFFSET_PEND(uint32_t val)
+{
+	return ((val) << DPU_OFFSET_PEND_OFFSET_PEND__SHIFT) & DPU_OFFSET_PEND_OFFSET_PEND__MASK;
+}
+
+#define REG_DPU_DST_BASE_ADDR					0x00004020
+#define DPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK			0xffffffff
+#define DPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT			0
+static inline uint32_t DPU_DST_BASE_ADDR_DST_BASE_ADDR(uint32_t val)
+{
+	return ((val) << DPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT) & DPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK;
+}
+
+#define REG_DPU_DST_SURF_STRIDE					0x00004024
+#define DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK		0xfffffff0
+#define DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT		4
+static inline uint32_t DPU_DST_SURF_STRIDE_DST_SURF_STRIDE(uint32_t val)
+{
+	return ((val) << DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT) & DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK;
+}
+#define DPU_DST_SURF_STRIDE_RESERVED_0__MASK			0x0000000f
+#define DPU_DST_SURF_STRIDE_RESERVED_0__SHIFT			0
+static inline uint32_t DPU_DST_SURF_STRIDE_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_DST_SURF_STRIDE_RESERVED_0__SHIFT) & DPU_DST_SURF_STRIDE_RESERVED_0__MASK;
+}
+
+#define REG_DPU_DATA_CUBE_WIDTH					0x00004030
+#define DPU_DATA_CUBE_WIDTH_RESERVED_0__MASK			0xffffe000
+#define DPU_DATA_CUBE_WIDTH_RESERVED_0__SHIFT			13
+static inline uint32_t DPU_DATA_CUBE_WIDTH_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_WIDTH_RESERVED_0__SHIFT) & DPU_DATA_CUBE_WIDTH_RESERVED_0__MASK;
+}
+#define DPU_DATA_CUBE_WIDTH_WIDTH__MASK				0x00001fff
+#define DPU_DATA_CUBE_WIDTH_WIDTH__SHIFT			0
+static inline uint32_t DPU_DATA_CUBE_WIDTH_WIDTH(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_WIDTH_WIDTH__SHIFT) & DPU_DATA_CUBE_WIDTH_WIDTH__MASK;
+}
+
+#define REG_DPU_DATA_CUBE_HEIGHT				0x00004034
+#define DPU_DATA_CUBE_HEIGHT_RESERVED_0__MASK			0xfe000000
+#define DPU_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT			25
+static inline uint32_t DPU_DATA_CUBE_HEIGHT_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT) & DPU_DATA_CUBE_HEIGHT_RESERVED_0__MASK;
+}
+#define DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__MASK			0x01c00000
+#define DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__SHIFT			22
+static inline uint32_t DPU_DATA_CUBE_HEIGHT_MINMAX_CTL(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__SHIFT) & DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__MASK;
+}
+#define DPU_DATA_CUBE_HEIGHT_RESERVED_1__MASK			0x003fe000
+#define DPU_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT			13
+static inline uint32_t DPU_DATA_CUBE_HEIGHT_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT) & DPU_DATA_CUBE_HEIGHT_RESERVED_1__MASK;
+}
+#define DPU_DATA_CUBE_HEIGHT_HEIGHT__MASK			0x00001fff
+#define DPU_DATA_CUBE_HEIGHT_HEIGHT__SHIFT			0
+static inline uint32_t DPU_DATA_CUBE_HEIGHT_HEIGHT(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_HEIGHT_HEIGHT__SHIFT) & DPU_DATA_CUBE_HEIGHT_HEIGHT__MASK;
+}
+
+#define REG_DPU_DATA_CUBE_NOTCH_ADDR				0x00004038
+#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__MASK		0xe0000000
+#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__SHIFT		29
+static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__MASK;
+}
+#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__MASK		0x1fff0000
+#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__SHIFT		16
+static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__MASK;
+}
+#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__MASK		0x0000e000
+#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__SHIFT		13
+static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__MASK;
+}
+#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__MASK		0x00001fff
+#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__SHIFT		0
+static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__MASK;
+}
+
+#define REG_DPU_DATA_CUBE_CHANNEL				0x0000403c
+#define DPU_DATA_CUBE_CHANNEL_RESERVED_0__MASK			0xe0000000
+#define DPU_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT			29
+static inline uint32_t DPU_DATA_CUBE_CHANNEL_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT) & DPU_DATA_CUBE_CHANNEL_RESERVED_0__MASK;
+}
+#define DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__MASK		0x1fff0000
+#define DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__SHIFT		16
+static inline uint32_t DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__SHIFT) & DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__MASK;
+}
+#define DPU_DATA_CUBE_CHANNEL_RESERVED_1__MASK			0x0000e000
+#define DPU_DATA_CUBE_CHANNEL_RESERVED_1__SHIFT			13
+static inline uint32_t DPU_DATA_CUBE_CHANNEL_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_CHANNEL_RESERVED_1__SHIFT) & DPU_DATA_CUBE_CHANNEL_RESERVED_1__MASK;
+}
+#define DPU_DATA_CUBE_CHANNEL_CHANNEL__MASK			0x00001fff
+#define DPU_DATA_CUBE_CHANNEL_CHANNEL__SHIFT			0
+static inline uint32_t DPU_DATA_CUBE_CHANNEL_CHANNEL(uint32_t val)
+{
+	return ((val) << DPU_DATA_CUBE_CHANNEL_CHANNEL__SHIFT) & DPU_DATA_CUBE_CHANNEL_CHANNEL__MASK;
+}
+
+#define REG_DPU_BS_CFG						0x00004040
+#define DPU_BS_CFG_RESERVED_0__MASK				0xfff00000
+#define DPU_BS_CFG_RESERVED_0__SHIFT				20
+static inline uint32_t DPU_BS_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_RESERVED_0__SHIFT) & DPU_BS_CFG_RESERVED_0__MASK;
+}
+#define DPU_BS_CFG_BS_ALU_ALGO__MASK				0x000f0000
+#define DPU_BS_CFG_BS_ALU_ALGO__SHIFT				16
+static inline uint32_t DPU_BS_CFG_BS_ALU_ALGO(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_ALU_ALGO__SHIFT) & DPU_BS_CFG_BS_ALU_ALGO__MASK;
+}
+#define DPU_BS_CFG_RESERVED_1__MASK				0x0000fe00
+#define DPU_BS_CFG_RESERVED_1__SHIFT				9
+static inline uint32_t DPU_BS_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_RESERVED_1__SHIFT) & DPU_BS_CFG_RESERVED_1__MASK;
+}
+#define DPU_BS_CFG_BS_ALU_SRC__MASK				0x00000100
+#define DPU_BS_CFG_BS_ALU_SRC__SHIFT				8
+static inline uint32_t DPU_BS_CFG_BS_ALU_SRC(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_ALU_SRC__SHIFT) & DPU_BS_CFG_BS_ALU_SRC__MASK;
+}
+#define DPU_BS_CFG_BS_RELUX_EN__MASK				0x00000080
+#define DPU_BS_CFG_BS_RELUX_EN__SHIFT				7
+static inline uint32_t DPU_BS_CFG_BS_RELUX_EN(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_RELUX_EN__SHIFT) & DPU_BS_CFG_BS_RELUX_EN__MASK;
+}
+#define DPU_BS_CFG_BS_RELU_BYPASS__MASK				0x00000040
+#define DPU_BS_CFG_BS_RELU_BYPASS__SHIFT			6
+static inline uint32_t DPU_BS_CFG_BS_RELU_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_RELU_BYPASS__SHIFT) & DPU_BS_CFG_BS_RELU_BYPASS__MASK;
+}
+#define DPU_BS_CFG_BS_MUL_PRELU__MASK				0x00000020
+#define DPU_BS_CFG_BS_MUL_PRELU__SHIFT				5
+static inline uint32_t DPU_BS_CFG_BS_MUL_PRELU(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_MUL_PRELU__SHIFT) & DPU_BS_CFG_BS_MUL_PRELU__MASK;
+}
+#define DPU_BS_CFG_BS_MUL_BYPASS__MASK				0x00000010
+#define DPU_BS_CFG_BS_MUL_BYPASS__SHIFT				4
+static inline uint32_t DPU_BS_CFG_BS_MUL_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_MUL_BYPASS__SHIFT) & DPU_BS_CFG_BS_MUL_BYPASS__MASK;
+}
+#define DPU_BS_CFG_RESERVED_2__MASK				0x0000000c
+#define DPU_BS_CFG_RESERVED_2__SHIFT				2
+static inline uint32_t DPU_BS_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_RESERVED_2__SHIFT) & DPU_BS_CFG_RESERVED_2__MASK;
+}
+#define DPU_BS_CFG_BS_ALU_BYPASS__MASK				0x00000002
+#define DPU_BS_CFG_BS_ALU_BYPASS__SHIFT				1
+static inline uint32_t DPU_BS_CFG_BS_ALU_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_ALU_BYPASS__SHIFT) & DPU_BS_CFG_BS_ALU_BYPASS__MASK;
+}
+#define DPU_BS_CFG_BS_BYPASS__MASK				0x00000001
+#define DPU_BS_CFG_BS_BYPASS__SHIFT				0
+static inline uint32_t DPU_BS_CFG_BS_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BS_CFG_BS_BYPASS__SHIFT) & DPU_BS_CFG_BS_BYPASS__MASK;
+}
+
+#define REG_DPU_BS_ALU_CFG					0x00004044
+#define DPU_BS_ALU_CFG_BS_ALU_OPERAND__MASK			0xffffffff
+#define DPU_BS_ALU_CFG_BS_ALU_OPERAND__SHIFT			0
+static inline uint32_t DPU_BS_ALU_CFG_BS_ALU_OPERAND(uint32_t val)
+{
+	return ((val) << DPU_BS_ALU_CFG_BS_ALU_OPERAND__SHIFT) & DPU_BS_ALU_CFG_BS_ALU_OPERAND__MASK;
+}
+
+#define REG_DPU_BS_MUL_CFG					0x00004048
+#define DPU_BS_MUL_CFG_BS_MUL_OPERAND__MASK			0xffff0000
+#define DPU_BS_MUL_CFG_BS_MUL_OPERAND__SHIFT			16
+static inline uint32_t DPU_BS_MUL_CFG_BS_MUL_OPERAND(uint32_t val)
+{
+	return ((val) << DPU_BS_MUL_CFG_BS_MUL_OPERAND__SHIFT) & DPU_BS_MUL_CFG_BS_MUL_OPERAND__MASK;
+}
+#define DPU_BS_MUL_CFG_RESERVED_0__MASK				0x0000c000
+#define DPU_BS_MUL_CFG_RESERVED_0__SHIFT			14
+static inline uint32_t DPU_BS_MUL_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_BS_MUL_CFG_RESERVED_0__SHIFT) & DPU_BS_MUL_CFG_RESERVED_0__MASK;
+}
+#define DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__MASK			0x00003f00
+#define DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__SHIFT		8
+static inline uint32_t DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE(uint32_t val)
+{
+	return ((val) << DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__SHIFT) & DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__MASK;
+}
+#define DPU_BS_MUL_CFG_RESERVED_1__MASK				0x000000fc
+#define DPU_BS_MUL_CFG_RESERVED_1__SHIFT			2
+static inline uint32_t DPU_BS_MUL_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_BS_MUL_CFG_RESERVED_1__SHIFT) & DPU_BS_MUL_CFG_RESERVED_1__MASK;
+}
+#define DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__MASK			0x00000002
+#define DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__SHIFT			1
+static inline uint32_t DPU_BS_MUL_CFG_BS_TRUNCATE_SRC(uint32_t val)
+{
+	return ((val) << DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__SHIFT) & DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__MASK;
+}
+#define DPU_BS_MUL_CFG_BS_MUL_SRC__MASK				0x00000001
+#define DPU_BS_MUL_CFG_BS_MUL_SRC__SHIFT			0
+static inline uint32_t DPU_BS_MUL_CFG_BS_MUL_SRC(uint32_t val)
+{
+	return ((val) << DPU_BS_MUL_CFG_BS_MUL_SRC__SHIFT) & DPU_BS_MUL_CFG_BS_MUL_SRC__MASK;
+}
+
+#define REG_DPU_BS_RELUX_CMP_VALUE				0x0000404c
+#define DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__MASK		0xffffffff
+#define DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__SHIFT		0
+static inline uint32_t DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT(uint32_t val)
+{
+	return ((val) << DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__SHIFT) & DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__MASK;
+}
+
+#define REG_DPU_BS_OW_CFG					0x00004050
+#define DPU_BS_OW_CFG_RGP_CNTER__MASK				0xf0000000
+#define DPU_BS_OW_CFG_RGP_CNTER__SHIFT				28
+static inline uint32_t DPU_BS_OW_CFG_RGP_CNTER(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_RGP_CNTER__SHIFT) & DPU_BS_OW_CFG_RGP_CNTER__MASK;
+}
+#define DPU_BS_OW_CFG_TP_ORG_EN__MASK				0x08000000
+#define DPU_BS_OW_CFG_TP_ORG_EN__SHIFT				27
+static inline uint32_t DPU_BS_OW_CFG_TP_ORG_EN(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_TP_ORG_EN__SHIFT) & DPU_BS_OW_CFG_TP_ORG_EN__MASK;
+}
+#define DPU_BS_OW_CFG_RESERVED_0__MASK				0x07fff800
+#define DPU_BS_OW_CFG_RESERVED_0__SHIFT				11
+static inline uint32_t DPU_BS_OW_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_RESERVED_0__SHIFT) & DPU_BS_OW_CFG_RESERVED_0__MASK;
+}
+#define DPU_BS_OW_CFG_SIZE_E_2__MASK				0x00000700
+#define DPU_BS_OW_CFG_SIZE_E_2__SHIFT				8
+static inline uint32_t DPU_BS_OW_CFG_SIZE_E_2(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_SIZE_E_2__SHIFT) & DPU_BS_OW_CFG_SIZE_E_2__MASK;
+}
+#define DPU_BS_OW_CFG_SIZE_E_1__MASK				0x000000e0
+#define DPU_BS_OW_CFG_SIZE_E_1__SHIFT				5
+static inline uint32_t DPU_BS_OW_CFG_SIZE_E_1(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_SIZE_E_1__SHIFT) & DPU_BS_OW_CFG_SIZE_E_1__MASK;
+}
+#define DPU_BS_OW_CFG_SIZE_E_0__MASK				0x0000001c
+#define DPU_BS_OW_CFG_SIZE_E_0__SHIFT				2
+static inline uint32_t DPU_BS_OW_CFG_SIZE_E_0(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_SIZE_E_0__SHIFT) & DPU_BS_OW_CFG_SIZE_E_0__MASK;
+}
+#define DPU_BS_OW_CFG_OD_BYPASS__MASK				0x00000002
+#define DPU_BS_OW_CFG_OD_BYPASS__SHIFT				1
+static inline uint32_t DPU_BS_OW_CFG_OD_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_OD_BYPASS__SHIFT) & DPU_BS_OW_CFG_OD_BYPASS__MASK;
+}
+#define DPU_BS_OW_CFG_OW_SRC__MASK				0x00000001
+#define DPU_BS_OW_CFG_OW_SRC__SHIFT				0
+static inline uint32_t DPU_BS_OW_CFG_OW_SRC(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_CFG_OW_SRC__SHIFT) & DPU_BS_OW_CFG_OW_SRC__MASK;
+}
+
+#define REG_DPU_BS_OW_OP					0x00004054
+#define DPU_BS_OW_OP_RESERVED_0__MASK				0xffff0000
+#define DPU_BS_OW_OP_RESERVED_0__SHIFT				16
+static inline uint32_t DPU_BS_OW_OP_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_OP_RESERVED_0__SHIFT) & DPU_BS_OW_OP_RESERVED_0__MASK;
+}
+#define DPU_BS_OW_OP_OW_OP__MASK				0x0000ffff
+#define DPU_BS_OW_OP_OW_OP__SHIFT				0
+static inline uint32_t DPU_BS_OW_OP_OW_OP(uint32_t val)
+{
+	return ((val) << DPU_BS_OW_OP_OW_OP__SHIFT) & DPU_BS_OW_OP_OW_OP__MASK;
+}
+
+#define REG_DPU_WDMA_SIZE_0					0x00004058
+#define DPU_WDMA_SIZE_0_RESERVED_0__MASK			0xf0000000
+#define DPU_WDMA_SIZE_0_RESERVED_0__SHIFT			28
+static inline uint32_t DPU_WDMA_SIZE_0_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_0_RESERVED_0__SHIFT) & DPU_WDMA_SIZE_0_RESERVED_0__MASK;
+}
+#define DPU_WDMA_SIZE_0_TP_PRECISION__MASK			0x08000000
+#define DPU_WDMA_SIZE_0_TP_PRECISION__SHIFT			27
+static inline uint32_t DPU_WDMA_SIZE_0_TP_PRECISION(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_0_TP_PRECISION__SHIFT) & DPU_WDMA_SIZE_0_TP_PRECISION__MASK;
+}
+#define DPU_WDMA_SIZE_0_SIZE_C_WDMA__MASK			0x07ff0000
+#define DPU_WDMA_SIZE_0_SIZE_C_WDMA__SHIFT			16
+static inline uint32_t DPU_WDMA_SIZE_0_SIZE_C_WDMA(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_0_SIZE_C_WDMA__SHIFT) & DPU_WDMA_SIZE_0_SIZE_C_WDMA__MASK;
+}
+#define DPU_WDMA_SIZE_0_RESERVED_1__MASK			0x0000e000
+#define DPU_WDMA_SIZE_0_RESERVED_1__SHIFT			13
+static inline uint32_t DPU_WDMA_SIZE_0_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_0_RESERVED_1__SHIFT) & DPU_WDMA_SIZE_0_RESERVED_1__MASK;
+}
+#define DPU_WDMA_SIZE_0_CHANNEL_WDMA__MASK			0x00001fff
+#define DPU_WDMA_SIZE_0_CHANNEL_WDMA__SHIFT			0
+static inline uint32_t DPU_WDMA_SIZE_0_CHANNEL_WDMA(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_0_CHANNEL_WDMA__SHIFT) & DPU_WDMA_SIZE_0_CHANNEL_WDMA__MASK;
+}
+
+#define REG_DPU_WDMA_SIZE_1					0x0000405c
+#define DPU_WDMA_SIZE_1_RESERVED_0__MASK			0xe0000000
+#define DPU_WDMA_SIZE_1_RESERVED_0__SHIFT			29
+static inline uint32_t DPU_WDMA_SIZE_1_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_1_RESERVED_0__SHIFT) & DPU_WDMA_SIZE_1_RESERVED_0__MASK;
+}
+#define DPU_WDMA_SIZE_1_HEIGHT_WDMA__MASK			0x1fff0000
+#define DPU_WDMA_SIZE_1_HEIGHT_WDMA__SHIFT			16
+static inline uint32_t DPU_WDMA_SIZE_1_HEIGHT_WDMA(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_1_HEIGHT_WDMA__SHIFT) & DPU_WDMA_SIZE_1_HEIGHT_WDMA__MASK;
+}
+#define DPU_WDMA_SIZE_1_RESERVED_1__MASK			0x0000e000
+#define DPU_WDMA_SIZE_1_RESERVED_1__SHIFT			13
+static inline uint32_t DPU_WDMA_SIZE_1_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_1_RESERVED_1__SHIFT) & DPU_WDMA_SIZE_1_RESERVED_1__MASK;
+}
+#define DPU_WDMA_SIZE_1_WIDTH_WDMA__MASK			0x00001fff
+#define DPU_WDMA_SIZE_1_WIDTH_WDMA__SHIFT			0
+static inline uint32_t DPU_WDMA_SIZE_1_WIDTH_WDMA(uint32_t val)
+{
+	return ((val) << DPU_WDMA_SIZE_1_WIDTH_WDMA__SHIFT) & DPU_WDMA_SIZE_1_WIDTH_WDMA__MASK;
+}
+
+#define REG_DPU_BN_CFG						0x00004060
+#define DPU_BN_CFG_RESERVED_0__MASK				0xfff00000
+#define DPU_BN_CFG_RESERVED_0__SHIFT				20
+static inline uint32_t DPU_BN_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_RESERVED_0__SHIFT) & DPU_BN_CFG_RESERVED_0__MASK;
+}
+#define DPU_BN_CFG_BN_ALU_ALGO__MASK				0x000f0000
+#define DPU_BN_CFG_BN_ALU_ALGO__SHIFT				16
+static inline uint32_t DPU_BN_CFG_BN_ALU_ALGO(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_ALU_ALGO__SHIFT) & DPU_BN_CFG_BN_ALU_ALGO__MASK;
+}
+#define DPU_BN_CFG_RESERVED_1__MASK				0x0000fe00
+#define DPU_BN_CFG_RESERVED_1__SHIFT				9
+static inline uint32_t DPU_BN_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_RESERVED_1__SHIFT) & DPU_BN_CFG_RESERVED_1__MASK;
+}
+#define DPU_BN_CFG_BN_ALU_SRC__MASK				0x00000100
+#define DPU_BN_CFG_BN_ALU_SRC__SHIFT				8
+static inline uint32_t DPU_BN_CFG_BN_ALU_SRC(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_ALU_SRC__SHIFT) & DPU_BN_CFG_BN_ALU_SRC__MASK;
+}
+#define DPU_BN_CFG_BN_RELUX_EN__MASK				0x00000080
+#define DPU_BN_CFG_BN_RELUX_EN__SHIFT				7
+static inline uint32_t DPU_BN_CFG_BN_RELUX_EN(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_RELUX_EN__SHIFT) & DPU_BN_CFG_BN_RELUX_EN__MASK;
+}
+#define DPU_BN_CFG_BN_RELU_BYPASS__MASK				0x00000040
+#define DPU_BN_CFG_BN_RELU_BYPASS__SHIFT			6
+static inline uint32_t DPU_BN_CFG_BN_RELU_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_RELU_BYPASS__SHIFT) & DPU_BN_CFG_BN_RELU_BYPASS__MASK;
+}
+#define DPU_BN_CFG_BN_MUL_PRELU__MASK				0x00000020
+#define DPU_BN_CFG_BN_MUL_PRELU__SHIFT				5
+static inline uint32_t DPU_BN_CFG_BN_MUL_PRELU(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_MUL_PRELU__SHIFT) & DPU_BN_CFG_BN_MUL_PRELU__MASK;
+}
+#define DPU_BN_CFG_BN_MUL_BYPASS__MASK				0x00000010
+#define DPU_BN_CFG_BN_MUL_BYPASS__SHIFT				4
+static inline uint32_t DPU_BN_CFG_BN_MUL_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_MUL_BYPASS__SHIFT) & DPU_BN_CFG_BN_MUL_BYPASS__MASK;
+}
+#define DPU_BN_CFG_RESERVED_2__MASK				0x0000000c
+#define DPU_BN_CFG_RESERVED_2__SHIFT				2
+static inline uint32_t DPU_BN_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_RESERVED_2__SHIFT) & DPU_BN_CFG_RESERVED_2__MASK;
+}
+#define DPU_BN_CFG_BN_ALU_BYPASS__MASK				0x00000002
+#define DPU_BN_CFG_BN_ALU_BYPASS__SHIFT				1
+static inline uint32_t DPU_BN_CFG_BN_ALU_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_ALU_BYPASS__SHIFT) & DPU_BN_CFG_BN_ALU_BYPASS__MASK;
+}
+#define DPU_BN_CFG_BN_BYPASS__MASK				0x00000001
+#define DPU_BN_CFG_BN_BYPASS__SHIFT				0
+static inline uint32_t DPU_BN_CFG_BN_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_BN_CFG_BN_BYPASS__SHIFT) & DPU_BN_CFG_BN_BYPASS__MASK;
+}
+
+#define REG_DPU_BN_ALU_CFG					0x00004064
+#define DPU_BN_ALU_CFG_BN_ALU_OPERAND__MASK			0xffffffff
+#define DPU_BN_ALU_CFG_BN_ALU_OPERAND__SHIFT			0
+static inline uint32_t DPU_BN_ALU_CFG_BN_ALU_OPERAND(uint32_t val)
+{
+	return ((val) << DPU_BN_ALU_CFG_BN_ALU_OPERAND__SHIFT) & DPU_BN_ALU_CFG_BN_ALU_OPERAND__MASK;
+}
+
+#define REG_DPU_BN_MUL_CFG					0x00004068
+#define DPU_BN_MUL_CFG_BN_MUL_OPERAND__MASK			0xffff0000
+#define DPU_BN_MUL_CFG_BN_MUL_OPERAND__SHIFT			16
+static inline uint32_t DPU_BN_MUL_CFG_BN_MUL_OPERAND(uint32_t val)
+{
+	return ((val) << DPU_BN_MUL_CFG_BN_MUL_OPERAND__SHIFT) & DPU_BN_MUL_CFG_BN_MUL_OPERAND__MASK;
+}
+#define DPU_BN_MUL_CFG_RESERVED_0__MASK				0x0000c000
+#define DPU_BN_MUL_CFG_RESERVED_0__SHIFT			14
+static inline uint32_t DPU_BN_MUL_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_BN_MUL_CFG_RESERVED_0__SHIFT) & DPU_BN_MUL_CFG_RESERVED_0__MASK;
+}
+#define DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__MASK			0x00003f00
+#define DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__SHIFT		8
+static inline uint32_t DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE(uint32_t val)
+{
+	return ((val) << DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__SHIFT) & DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__MASK;
+}
+#define DPU_BN_MUL_CFG_RESERVED_1__MASK				0x000000fc
+#define DPU_BN_MUL_CFG_RESERVED_1__SHIFT			2
+static inline uint32_t DPU_BN_MUL_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_BN_MUL_CFG_RESERVED_1__SHIFT) & DPU_BN_MUL_CFG_RESERVED_1__MASK;
+}
+#define DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__MASK			0x00000002
+#define DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__SHIFT			1
+static inline uint32_t DPU_BN_MUL_CFG_BN_TRUNCATE_SRC(uint32_t val)
+{
+	return ((val) << DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__SHIFT) & DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__MASK;
+}
+#define DPU_BN_MUL_CFG_BN_MUL_SRC__MASK				0x00000001
+#define DPU_BN_MUL_CFG_BN_MUL_SRC__SHIFT			0
+static inline uint32_t DPU_BN_MUL_CFG_BN_MUL_SRC(uint32_t val)
+{
+	return ((val) << DPU_BN_MUL_CFG_BN_MUL_SRC__SHIFT) & DPU_BN_MUL_CFG_BN_MUL_SRC__MASK;
+}
+
+#define REG_DPU_BN_RELUX_CMP_VALUE				0x0000406c
+#define DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__MASK		0xffffffff
+#define DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__SHIFT		0
+static inline uint32_t DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT(uint32_t val)
+{
+	return ((val) << DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__SHIFT) & DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__MASK;
+}
+
+#define REG_DPU_EW_CFG						0x00004070
+#define DPU_EW_CFG_EW_CVT_TYPE__MASK				0x80000000
+#define DPU_EW_CFG_EW_CVT_TYPE__SHIFT				31
+static inline uint32_t DPU_EW_CFG_EW_CVT_TYPE(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_CVT_TYPE__SHIFT) & DPU_EW_CFG_EW_CVT_TYPE__MASK;
+}
+#define DPU_EW_CFG_EW_CVT_ROUND__MASK				0x40000000
+#define DPU_EW_CFG_EW_CVT_ROUND__SHIFT				30
+static inline uint32_t DPU_EW_CFG_EW_CVT_ROUND(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_CVT_ROUND__SHIFT) & DPU_EW_CFG_EW_CVT_ROUND__MASK;
+}
+#define DPU_EW_CFG_EW_DATA_MODE__MASK				0x30000000
+#define DPU_EW_CFG_EW_DATA_MODE__SHIFT				28
+static inline uint32_t DPU_EW_CFG_EW_DATA_MODE(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_DATA_MODE__SHIFT) & DPU_EW_CFG_EW_DATA_MODE__MASK;
+}
+#define DPU_EW_CFG_RESERVED_0__MASK				0x0f000000
+#define DPU_EW_CFG_RESERVED_0__SHIFT				24
+static inline uint32_t DPU_EW_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_RESERVED_0__SHIFT) & DPU_EW_CFG_RESERVED_0__MASK;
+}
+#define DPU_EW_CFG_EDATA_SIZE__MASK				0x00c00000
+#define DPU_EW_CFG_EDATA_SIZE__SHIFT				22
+static inline uint32_t DPU_EW_CFG_EDATA_SIZE(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EDATA_SIZE__SHIFT) & DPU_EW_CFG_EDATA_SIZE__MASK;
+}
+#define DPU_EW_CFG_EW_EQUAL_EN__MASK				0x00200000
+#define DPU_EW_CFG_EW_EQUAL_EN__SHIFT				21
+static inline uint32_t DPU_EW_CFG_EW_EQUAL_EN(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_EQUAL_EN__SHIFT) & DPU_EW_CFG_EW_EQUAL_EN__MASK;
+}
+#define DPU_EW_CFG_EW_BINARY_EN__MASK				0x00100000
+#define DPU_EW_CFG_EW_BINARY_EN__SHIFT				20
+static inline uint32_t DPU_EW_CFG_EW_BINARY_EN(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_BINARY_EN__SHIFT) & DPU_EW_CFG_EW_BINARY_EN__MASK;
+}
+#define DPU_EW_CFG_EW_ALU_ALGO__MASK				0x000f0000
+#define DPU_EW_CFG_EW_ALU_ALGO__SHIFT				16
+static inline uint32_t DPU_EW_CFG_EW_ALU_ALGO(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_ALU_ALGO__SHIFT) & DPU_EW_CFG_EW_ALU_ALGO__MASK;
+}
+#define DPU_EW_CFG_RESERVED_1__MASK				0x0000f800
+#define DPU_EW_CFG_RESERVED_1__SHIFT				11
+static inline uint32_t DPU_EW_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_RESERVED_1__SHIFT) & DPU_EW_CFG_RESERVED_1__MASK;
+}
+#define DPU_EW_CFG_EW_RELUX_EN__MASK				0x00000400
+#define DPU_EW_CFG_EW_RELUX_EN__SHIFT				10
+static inline uint32_t DPU_EW_CFG_EW_RELUX_EN(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_RELUX_EN__SHIFT) & DPU_EW_CFG_EW_RELUX_EN__MASK;
+}
+#define DPU_EW_CFG_EW_RELU_BYPASS__MASK				0x00000200
+#define DPU_EW_CFG_EW_RELU_BYPASS__SHIFT			9
+static inline uint32_t DPU_EW_CFG_EW_RELU_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_RELU_BYPASS__SHIFT) & DPU_EW_CFG_EW_RELU_BYPASS__MASK;
+}
+#define DPU_EW_CFG_EW_OP_CVT_BYPASS__MASK			0x00000100
+#define DPU_EW_CFG_EW_OP_CVT_BYPASS__SHIFT			8
+static inline uint32_t DPU_EW_CFG_EW_OP_CVT_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_OP_CVT_BYPASS__SHIFT) & DPU_EW_CFG_EW_OP_CVT_BYPASS__MASK;
+}
+#define DPU_EW_CFG_EW_LUT_BYPASS__MASK				0x00000080
+#define DPU_EW_CFG_EW_LUT_BYPASS__SHIFT				7
+static inline uint32_t DPU_EW_CFG_EW_LUT_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_LUT_BYPASS__SHIFT) & DPU_EW_CFG_EW_LUT_BYPASS__MASK;
+}
+#define DPU_EW_CFG_EW_OP_SRC__MASK				0x00000040
+#define DPU_EW_CFG_EW_OP_SRC__SHIFT				6
+static inline uint32_t DPU_EW_CFG_EW_OP_SRC(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_OP_SRC__SHIFT) & DPU_EW_CFG_EW_OP_SRC__MASK;
+}
+#define DPU_EW_CFG_EW_MUL_PRELU__MASK				0x00000020
+#define DPU_EW_CFG_EW_MUL_PRELU__SHIFT				5
+static inline uint32_t DPU_EW_CFG_EW_MUL_PRELU(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_MUL_PRELU__SHIFT) & DPU_EW_CFG_EW_MUL_PRELU__MASK;
+}
+#define DPU_EW_CFG_RESERVED_2__MASK				0x00000018
+#define DPU_EW_CFG_RESERVED_2__SHIFT				3
+static inline uint32_t DPU_EW_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_RESERVED_2__SHIFT) & DPU_EW_CFG_RESERVED_2__MASK;
+}
+#define DPU_EW_CFG_EW_OP_TYPE__MASK				0x00000004
+#define DPU_EW_CFG_EW_OP_TYPE__SHIFT				2
+static inline uint32_t DPU_EW_CFG_EW_OP_TYPE(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_OP_TYPE__SHIFT) & DPU_EW_CFG_EW_OP_TYPE__MASK;
+}
+#define DPU_EW_CFG_EW_OP_BYPASS__MASK				0x00000002
+#define DPU_EW_CFG_EW_OP_BYPASS__SHIFT				1
+static inline uint32_t DPU_EW_CFG_EW_OP_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_OP_BYPASS__SHIFT) & DPU_EW_CFG_EW_OP_BYPASS__MASK;
+}
+#define DPU_EW_CFG_EW_BYPASS__MASK				0x00000001
+#define DPU_EW_CFG_EW_BYPASS__SHIFT				0
+static inline uint32_t DPU_EW_CFG_EW_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_EW_CFG_EW_BYPASS__SHIFT) & DPU_EW_CFG_EW_BYPASS__MASK;
+}
+
+#define REG_DPU_EW_CVT_OFFSET_VALUE				0x00004074
+#define DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__MASK		0xffffffff
+#define DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__SHIFT		0
+static inline uint32_t DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET(uint32_t val)
+{
+	return ((val) << DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__SHIFT) & DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__MASK;
+}
+
+#define REG_DPU_EW_CVT_SCALE_VALUE				0x00004078
+#define DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__MASK		0xffc00000
+#define DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__SHIFT		22
+static inline uint32_t DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE(uint32_t val)
+{
+	return ((val) << DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__SHIFT) & DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__MASK;
+}
+#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__MASK		0x003f0000
+#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__SHIFT		16
+static inline uint32_t DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT(uint32_t val)
+{
+	return ((val) << DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__SHIFT) & DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__MASK;
+}
+#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__MASK		0x0000ffff
+#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__SHIFT		0
+static inline uint32_t DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE(uint32_t val)
+{
+	return ((val) << DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__SHIFT) & DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__MASK;
+}
+
+#define REG_DPU_EW_RELUX_CMP_VALUE				0x0000407c
+#define DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__MASK		0xffffffff
+#define DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__SHIFT		0
+static inline uint32_t DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT(uint32_t val)
+{
+	return ((val) << DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__SHIFT) & DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__MASK;
+}
+
+#define REG_DPU_OUT_CVT_OFFSET					0x00004080
+#define DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__MASK			0xffffffff
+#define DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__SHIFT		0
+static inline uint32_t DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__SHIFT) & DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__MASK;
+}
+
+#define REG_DPU_OUT_CVT_SCALE					0x00004084
+#define DPU_OUT_CVT_SCALE_RESERVED_0__MASK			0xfffe0000
+#define DPU_OUT_CVT_SCALE_RESERVED_0__SHIFT			17
+static inline uint32_t DPU_OUT_CVT_SCALE_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SCALE_RESERVED_0__SHIFT) & DPU_OUT_CVT_SCALE_RESERVED_0__MASK;
+}
+#define DPU_OUT_CVT_SCALE_FP32TOFP16_EN__MASK			0x00010000
+#define DPU_OUT_CVT_SCALE_FP32TOFP16_EN__SHIFT			16
+static inline uint32_t DPU_OUT_CVT_SCALE_FP32TOFP16_EN(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SCALE_FP32TOFP16_EN__SHIFT) & DPU_OUT_CVT_SCALE_FP32TOFP16_EN__MASK;
+}
+#define DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__MASK			0x0000ffff
+#define DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__SHIFT			0
+static inline uint32_t DPU_OUT_CVT_SCALE_OUT_CVT_SCALE(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__SHIFT) & DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__MASK;
+}
+
+#define REG_DPU_OUT_CVT_SHIFT					0x00004088
+#define DPU_OUT_CVT_SHIFT_CVT_TYPE__MASK			0x80000000
+#define DPU_OUT_CVT_SHIFT_CVT_TYPE__SHIFT			31
+static inline uint32_t DPU_OUT_CVT_SHIFT_CVT_TYPE(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SHIFT_CVT_TYPE__SHIFT) & DPU_OUT_CVT_SHIFT_CVT_TYPE__MASK;
+}
+#define DPU_OUT_CVT_SHIFT_CVT_ROUND__MASK			0x40000000
+#define DPU_OUT_CVT_SHIFT_CVT_ROUND__SHIFT			30
+static inline uint32_t DPU_OUT_CVT_SHIFT_CVT_ROUND(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SHIFT_CVT_ROUND__SHIFT) & DPU_OUT_CVT_SHIFT_CVT_ROUND__MASK;
+}
+#define DPU_OUT_CVT_SHIFT_RESERVED_0__MASK			0x3ff00000
+#define DPU_OUT_CVT_SHIFT_RESERVED_0__SHIFT			20
+static inline uint32_t DPU_OUT_CVT_SHIFT_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SHIFT_RESERVED_0__SHIFT) & DPU_OUT_CVT_SHIFT_RESERVED_0__MASK;
+}
+#define DPU_OUT_CVT_SHIFT_MINUS_EXP__MASK			0x000ff000
+#define DPU_OUT_CVT_SHIFT_MINUS_EXP__SHIFT			12
+static inline uint32_t DPU_OUT_CVT_SHIFT_MINUS_EXP(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SHIFT_MINUS_EXP__SHIFT) & DPU_OUT_CVT_SHIFT_MINUS_EXP__MASK;
+}
+#define DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__MASK			0x00000fff
+#define DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__SHIFT			0
+static inline uint32_t DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT(uint32_t val)
+{
+	return ((val) << DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__SHIFT) & DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_0					0x00004090
+#define DPU_EW_OP_VALUE_0_EW_OPERAND_0__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_0_EW_OPERAND_0__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_0_EW_OPERAND_0(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_0_EW_OPERAND_0__SHIFT) & DPU_EW_OP_VALUE_0_EW_OPERAND_0__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_1					0x00004094
+#define DPU_EW_OP_VALUE_1_EW_OPERAND_1__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_1_EW_OPERAND_1__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_1_EW_OPERAND_1(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_1_EW_OPERAND_1__SHIFT) & DPU_EW_OP_VALUE_1_EW_OPERAND_1__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_2					0x00004098
+#define DPU_EW_OP_VALUE_2_EW_OPERAND_2__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_2_EW_OPERAND_2__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_2_EW_OPERAND_2(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_2_EW_OPERAND_2__SHIFT) & DPU_EW_OP_VALUE_2_EW_OPERAND_2__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_3					0x0000409c
+#define DPU_EW_OP_VALUE_3_EW_OPERAND_3__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_3_EW_OPERAND_3__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_3_EW_OPERAND_3(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_3_EW_OPERAND_3__SHIFT) & DPU_EW_OP_VALUE_3_EW_OPERAND_3__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_4					0x000040a0
+#define DPU_EW_OP_VALUE_4_EW_OPERAND_4__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_4_EW_OPERAND_4__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_4_EW_OPERAND_4(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_4_EW_OPERAND_4__SHIFT) & DPU_EW_OP_VALUE_4_EW_OPERAND_4__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_5					0x000040a4
+#define DPU_EW_OP_VALUE_5_EW_OPERAND_5__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_5_EW_OPERAND_5__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_5_EW_OPERAND_5(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_5_EW_OPERAND_5__SHIFT) & DPU_EW_OP_VALUE_5_EW_OPERAND_5__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_6					0x000040a8
+#define DPU_EW_OP_VALUE_6_EW_OPERAND_6__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_6_EW_OPERAND_6__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_6_EW_OPERAND_6(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_6_EW_OPERAND_6__SHIFT) & DPU_EW_OP_VALUE_6_EW_OPERAND_6__MASK;
+}
+
+#define REG_DPU_EW_OP_VALUE_7					0x000040ac
+#define DPU_EW_OP_VALUE_7_EW_OPERAND_7__MASK			0xffffffff
+#define DPU_EW_OP_VALUE_7_EW_OPERAND_7__SHIFT			0
+static inline uint32_t DPU_EW_OP_VALUE_7_EW_OPERAND_7(uint32_t val)
+{
+	return ((val) << DPU_EW_OP_VALUE_7_EW_OPERAND_7__SHIFT) & DPU_EW_OP_VALUE_7_EW_OPERAND_7__MASK;
+}
+
+#define REG_DPU_SURFACE_ADD					0x000040c0
+#define DPU_SURFACE_ADD_SURF_ADD__MASK				0xfffffff0
+#define DPU_SURFACE_ADD_SURF_ADD__SHIFT				4
+static inline uint32_t DPU_SURFACE_ADD_SURF_ADD(uint32_t val)
+{
+	return ((val) << DPU_SURFACE_ADD_SURF_ADD__SHIFT) & DPU_SURFACE_ADD_SURF_ADD__MASK;
+}
+#define DPU_SURFACE_ADD_RESERVED_0__MASK			0x0000000f
+#define DPU_SURFACE_ADD_RESERVED_0__SHIFT			0
+static inline uint32_t DPU_SURFACE_ADD_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_SURFACE_ADD_RESERVED_0__SHIFT) & DPU_SURFACE_ADD_RESERVED_0__MASK;
+}
+
+#define REG_DPU_LUT_ACCESS_CFG					0x00004100
+#define DPU_LUT_ACCESS_CFG_RESERVED_0__MASK			0xfffc0000
+#define DPU_LUT_ACCESS_CFG_RESERVED_0__SHIFT			18
+static inline uint32_t DPU_LUT_ACCESS_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_CFG_RESERVED_0__SHIFT) & DPU_LUT_ACCESS_CFG_RESERVED_0__MASK;
+}
+#define DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__MASK		0x00020000
+#define DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__SHIFT		17
+static inline uint32_t DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__SHIFT) & DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__MASK;
+}
+#define DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__MASK			0x00010000
+#define DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__SHIFT			16
+static inline uint32_t DPU_LUT_ACCESS_CFG_LUT_TABLE_ID(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__SHIFT) & DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__MASK;
+}
+#define DPU_LUT_ACCESS_CFG_RESERVED_1__MASK			0x0000fc00
+#define DPU_LUT_ACCESS_CFG_RESERVED_1__SHIFT			10
+static inline uint32_t DPU_LUT_ACCESS_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_CFG_RESERVED_1__SHIFT) & DPU_LUT_ACCESS_CFG_RESERVED_1__MASK;
+}
+#define DPU_LUT_ACCESS_CFG_LUT_ADDR__MASK			0x000003ff
+#define DPU_LUT_ACCESS_CFG_LUT_ADDR__SHIFT			0
+static inline uint32_t DPU_LUT_ACCESS_CFG_LUT_ADDR(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_CFG_LUT_ADDR__SHIFT) & DPU_LUT_ACCESS_CFG_LUT_ADDR__MASK;
+}
+
+#define REG_DPU_LUT_ACCESS_DATA					0x00004104
+#define DPU_LUT_ACCESS_DATA_RESERVED_0__MASK			0xffff0000
+#define DPU_LUT_ACCESS_DATA_RESERVED_0__SHIFT			16
+static inline uint32_t DPU_LUT_ACCESS_DATA_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_DATA_RESERVED_0__SHIFT) & DPU_LUT_ACCESS_DATA_RESERVED_0__MASK;
+}
+#define DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__MASK		0x0000ffff
+#define DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__SHIFT		0
+static inline uint32_t DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA(uint32_t val)
+{
+	return ((val) << DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__SHIFT) & DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__MASK;
+}
+
+#define REG_DPU_LUT_CFG						0x00004108
+#define DPU_LUT_CFG_RESERVED_0__MASK				0xffffff00
+#define DPU_LUT_CFG_RESERVED_0__SHIFT				8
+static inline uint32_t DPU_LUT_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_RESERVED_0__SHIFT) & DPU_LUT_CFG_RESERVED_0__MASK;
+}
+#define DPU_LUT_CFG_LUT_CAL_SEL__MASK				0x00000080
+#define DPU_LUT_CFG_LUT_CAL_SEL__SHIFT				7
+static inline uint32_t DPU_LUT_CFG_LUT_CAL_SEL(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_CAL_SEL__SHIFT) & DPU_LUT_CFG_LUT_CAL_SEL__MASK;
+}
+#define DPU_LUT_CFG_LUT_HYBRID_PRIORITY__MASK			0x00000040
+#define DPU_LUT_CFG_LUT_HYBRID_PRIORITY__SHIFT			6
+static inline uint32_t DPU_LUT_CFG_LUT_HYBRID_PRIORITY(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_HYBRID_PRIORITY__SHIFT) & DPU_LUT_CFG_LUT_HYBRID_PRIORITY__MASK;
+}
+#define DPU_LUT_CFG_LUT_OFLOW_PRIORITY__MASK			0x00000020
+#define DPU_LUT_CFG_LUT_OFLOW_PRIORITY__SHIFT			5
+static inline uint32_t DPU_LUT_CFG_LUT_OFLOW_PRIORITY(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_OFLOW_PRIORITY__SHIFT) & DPU_LUT_CFG_LUT_OFLOW_PRIORITY__MASK;
+}
+#define DPU_LUT_CFG_LUT_UFLOW_PRIORITY__MASK			0x00000010
+#define DPU_LUT_CFG_LUT_UFLOW_PRIORITY__SHIFT			4
+static inline uint32_t DPU_LUT_CFG_LUT_UFLOW_PRIORITY(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_UFLOW_PRIORITY__SHIFT) & DPU_LUT_CFG_LUT_UFLOW_PRIORITY__MASK;
+}
+#define DPU_LUT_CFG_LUT_LO_LE_MUX__MASK				0x0000000c
+#define DPU_LUT_CFG_LUT_LO_LE_MUX__SHIFT			2
+static inline uint32_t DPU_LUT_CFG_LUT_LO_LE_MUX(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_LO_LE_MUX__SHIFT) & DPU_LUT_CFG_LUT_LO_LE_MUX__MASK;
+}
+#define DPU_LUT_CFG_LUT_EXPAND_EN__MASK				0x00000002
+#define DPU_LUT_CFG_LUT_EXPAND_EN__SHIFT			1
+static inline uint32_t DPU_LUT_CFG_LUT_EXPAND_EN(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_EXPAND_EN__SHIFT) & DPU_LUT_CFG_LUT_EXPAND_EN__MASK;
+}
+#define DPU_LUT_CFG_LUT_ROAD_SEL__MASK				0x00000001
+#define DPU_LUT_CFG_LUT_ROAD_SEL__SHIFT				0
+static inline uint32_t DPU_LUT_CFG_LUT_ROAD_SEL(uint32_t val)
+{
+	return ((val) << DPU_LUT_CFG_LUT_ROAD_SEL__SHIFT) & DPU_LUT_CFG_LUT_ROAD_SEL__MASK;
+}
+
+#define REG_DPU_LUT_INFO					0x0000410c
+#define DPU_LUT_INFO_RESERVED_0__MASK				0xff000000
+#define DPU_LUT_INFO_RESERVED_0__SHIFT				24
+static inline uint32_t DPU_LUT_INFO_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_LUT_INFO_RESERVED_0__SHIFT) & DPU_LUT_INFO_RESERVED_0__MASK;
+}
+#define DPU_LUT_INFO_LUT_LO_INDEX_SELECT__MASK			0x00ff0000
+#define DPU_LUT_INFO_LUT_LO_INDEX_SELECT__SHIFT			16
+static inline uint32_t DPU_LUT_INFO_LUT_LO_INDEX_SELECT(uint32_t val)
+{
+	return ((val) << DPU_LUT_INFO_LUT_LO_INDEX_SELECT__SHIFT) & DPU_LUT_INFO_LUT_LO_INDEX_SELECT__MASK;
+}
+#define DPU_LUT_INFO_LUT_LE_INDEX_SELECT__MASK			0x0000ff00
+#define DPU_LUT_INFO_LUT_LE_INDEX_SELECT__SHIFT			8
+static inline uint32_t DPU_LUT_INFO_LUT_LE_INDEX_SELECT(uint32_t val)
+{
+	return ((val) << DPU_LUT_INFO_LUT_LE_INDEX_SELECT__SHIFT) & DPU_LUT_INFO_LUT_LE_INDEX_SELECT__MASK;
+}
+#define DPU_LUT_INFO_RESERVED_1__MASK				0x000000ff
+#define DPU_LUT_INFO_RESERVED_1__SHIFT				0
+static inline uint32_t DPU_LUT_INFO_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_LUT_INFO_RESERVED_1__SHIFT) & DPU_LUT_INFO_RESERVED_1__MASK;
+}
+
+#define REG_DPU_LUT_LE_START					0x00004110
+#define DPU_LUT_LE_START_LUT_LE_START__MASK			0xffffffff
+#define DPU_LUT_LE_START_LUT_LE_START__SHIFT			0
+static inline uint32_t DPU_LUT_LE_START_LUT_LE_START(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_START_LUT_LE_START__SHIFT) & DPU_LUT_LE_START_LUT_LE_START__MASK;
+}
+
+#define REG_DPU_LUT_LE_END					0x00004114
+#define DPU_LUT_LE_END_LUT_LE_END__MASK				0xffffffff
+#define DPU_LUT_LE_END_LUT_LE_END__SHIFT			0
+static inline uint32_t DPU_LUT_LE_END_LUT_LE_END(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_END_LUT_LE_END__SHIFT) & DPU_LUT_LE_END_LUT_LE_END__MASK;
+}
+
+#define REG_DPU_LUT_LO_START					0x00004118
+#define DPU_LUT_LO_START_LUT_LO_START__MASK			0xffffffff
+#define DPU_LUT_LO_START_LUT_LO_START__SHIFT			0
+static inline uint32_t DPU_LUT_LO_START_LUT_LO_START(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_START_LUT_LO_START__SHIFT) & DPU_LUT_LO_START_LUT_LO_START__MASK;
+}
+
+#define REG_DPU_LUT_LO_END					0x0000411c
+#define DPU_LUT_LO_END_LUT_LO_END__MASK				0xffffffff
+#define DPU_LUT_LO_END_LUT_LO_END__SHIFT			0
+static inline uint32_t DPU_LUT_LO_END_LUT_LO_END(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_END_LUT_LO_END__SHIFT) & DPU_LUT_LO_END_LUT_LO_END__MASK;
+}
+
+#define REG_DPU_LUT_LE_SLOPE_SCALE				0x00004120
+#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__MASK	0xffff0000
+#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__SHIFT	16
+static inline uint32_t DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__SHIFT) & DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__MASK;
+}
+#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__MASK	0x0000ffff
+#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__SHIFT	0
+static inline uint32_t DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__SHIFT) & DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__MASK;
+}
+
+#define REG_DPU_LUT_LE_SLOPE_SHIFT				0x00004124
+#define DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__MASK			0xfffffc00
+#define DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__SHIFT		10
+static inline uint32_t DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__SHIFT) & DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__MASK;
+}
+#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__MASK	0x000003e0
+#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__SHIFT	5
+static inline uint32_t DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__SHIFT) & DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__MASK;
+}
+#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__MASK	0x0000001f
+#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__SHIFT	0
+static inline uint32_t DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT(uint32_t val)
+{
+	return ((val) << DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__SHIFT) & DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__MASK;
+}
+
+#define REG_DPU_LUT_LO_SLOPE_SCALE				0x00004128
+#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__MASK	0xffff0000
+#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__SHIFT	16
+static inline uint32_t DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__SHIFT) & DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__MASK;
+}
+#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__MASK	0x0000ffff
+#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__SHIFT	0
+static inline uint32_t DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__SHIFT) & DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__MASK;
+}
+
+#define REG_DPU_LUT_LO_SLOPE_SHIFT				0x0000412c
+#define DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__MASK			0xfffffc00
+#define DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__SHIFT		10
+static inline uint32_t DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__SHIFT) & DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__MASK;
+}
+#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__MASK	0x000003e0
+#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__SHIFT	5
+static inline uint32_t DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__SHIFT) & DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__MASK;
+}
+#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__MASK	0x0000001f
+#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__SHIFT	0
+static inline uint32_t DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT(uint32_t val)
+{
+	return ((val) << DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__SHIFT) & DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_S_STATUS				0x00005000
+#define DPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK			0xfffc0000
+#define DPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT		18
+static inline uint32_t DPU_RDMA_RDMA_S_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK			0x00030000
+#define DPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT			16
+static inline uint32_t DPU_RDMA_RDMA_S_STATUS_STATUS_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT) & DPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK;
+}
+#define DPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK			0x0000fffc
+#define DPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT		2
+static inline uint32_t DPU_RDMA_RDMA_S_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK;
+}
+#define DPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK			0x00000003
+#define DPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT			0
+static inline uint32_t DPU_RDMA_RDMA_S_STATUS_STATUS_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT) & DPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_S_POINTER				0x00005004
+#define DPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK		0xfffe0000
+#define DPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT		17
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK			0x00010000
+#define DPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT			16
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_EXECUTER(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT) & DPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK		0x0000ffc0
+#define DPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT		6
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK		0x00000020
+#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT	5
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK		0x00000010
+#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT		4
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK		0x00000008
+#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT		3
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK		0x00000004
+#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT		2
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT) & DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK		0x00000002
+#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT		1
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK;
+}
+#define DPU_RDMA_RDMA_S_POINTER_POINTER__MASK			0x00000001
+#define DPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT			0
+static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_OPERATION_ENABLE			0x00005008
+#define DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK		0xfffffffe
+#define DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT	1
+static inline uint32_t DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK		0x00000001
+#define DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT) & DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_DATA_CUBE_WIDTH			0x0000500c
+#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__MASK		0xffffe000
+#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__SHIFT		13
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__MASK		0x00001fff
+#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_DATA_CUBE_HEIGHT			0x00005010
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__MASK		0xe0000000
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT	29
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__MASK	0x1fff0000
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__SHIFT	16
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__MASK;
+}
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__MASK		0x0000e000
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT	13
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__MASK;
+}
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__MASK		0x00001fff
+#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_DATA_CUBE_CHANNEL			0x00005014
+#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__MASK	0xffffe000
+#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT	13
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__MASK		0x00001fff
+#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_SRC_BASE_ADDR				0x00005018
+#define DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK		0xffffffff
+#define DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT	0
+static inline uint32_t DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_BRDMA_CFG				0x0000501c
+#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__MASK		0xffffffe0
+#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__SHIFT		5
+static inline uint32_t DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__MASK		0x0000001e
+#define DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__SHIFT		1
+static inline uint32_t DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__SHIFT) & DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__MASK;
+}
+#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__MASK		0x00000001
+#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_BS_BASE_ADDR				0x00005020
+#define DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__MASK		0xffffffff
+#define DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_NRDMA_CFG				0x00005028
+#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__MASK		0xffffffe0
+#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__SHIFT		5
+static inline uint32_t DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__MASK		0x0000001e
+#define DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__SHIFT		1
+static inline uint32_t DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__SHIFT) & DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__MASK;
+}
+#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__MASK		0x00000001
+#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_BN_BASE_ADDR				0x0000502c
+#define DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__MASK		0xffffffff
+#define DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_ERDMA_CFG				0x00005034
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__MASK		0xc0000000
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__SHIFT		30
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__MASK;
+}
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__MASK		0x20000000
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__SHIFT		29
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__MASK;
+}
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__MASK		0x10000000
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__SHIFT		28
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__MASK;
+}
+#define DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__MASK		0x0ffffff0
+#define DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__SHIFT		4
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__MASK		0x0000000c
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__SHIFT		2
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__MASK;
+}
+#define DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__MASK		0x00000002
+#define DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__SHIFT		1
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__MASK;
+}
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__MASK		0x00000001
+#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_EW_BASE_ADDR				0x00005038
+#define DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__MASK		0xffffffff
+#define DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_EW_SURF_STRIDE			0x00005040
+#define DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__MASK	0xfffffff0
+#define DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__SHIFT	4
+static inline uint32_t DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__SHIFT) & DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__MASK;
+}
+#define DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__MASK		0x0000000f
+#define DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_FEATURE_MODE_CFG			0x00005044
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__MASK		0xfffc0000
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__SHIFT	18
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__MASK	0x00038000
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__SHIFT	15
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__MASK		0x00007800
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__SHIFT		11
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__MASK		0x00000700
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__SHIFT		8
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__MASK	0x000000e0
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__SHIFT	5
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__MASK	0x00000010
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__SHIFT	4
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__MASK	0x00000008
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__SHIFT	3
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__MASK		0x00000006
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__SHIFT		1
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__MASK;
+}
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__MASK	0x00000001
+#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__SHIFT	0
+static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_SRC_DMA_CFG				0x00005048
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__MASK		0xfff80000
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__SHIFT	19
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__MASK		0x0007c000
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__SHIFT		14
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__MASK		0x00002000
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__SHIFT		13
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__MASK		0x00001000
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__SHIFT		12
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__MASK	0x00000e00
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__SHIFT	9
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__MASK	0x000001c0
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__SHIFT	6
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__MASK		0x00000038
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__SHIFT		3
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__MASK;
+}
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__MASK		0x00000007
+#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_SURF_NOTCH				0x0000504c
+#define DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__MASK		0xfffffff0
+#define DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__SHIFT		4
+static inline uint32_t DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__SHIFT) & DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__MASK;
+}
+#define DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__MASK		0x0000000f
+#define DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_PAD_CFG				0x00005064
+#define DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__MASK			0xffff0000
+#define DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__SHIFT			16
+static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__MASK;
+}
+#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__MASK			0x0000ff80
+#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__SHIFT			7
+static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__MASK;
+}
+#define DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__MASK			0x00000070
+#define DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__SHIFT			4
+static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_PAD_TOP(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__MASK;
+}
+#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__MASK			0x00000008
+#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__SHIFT			3
+static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__MASK;
+}
+#define DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__MASK			0x00000007
+#define DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__SHIFT			0
+static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_WEIGHT				0x00005068
+#define DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__MASK			0xff000000
+#define DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__SHIFT			24
+static inline uint32_t DPU_RDMA_RDMA_WEIGHT_E_WEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__MASK;
+}
+#define DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__MASK			0x00ff0000
+#define DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__SHIFT			16
+static inline uint32_t DPU_RDMA_RDMA_WEIGHT_N_WEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__MASK;
+}
+#define DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__MASK			0x0000ff00
+#define DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__SHIFT			8
+static inline uint32_t DPU_RDMA_RDMA_WEIGHT_B_WEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__MASK;
+}
+#define DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__MASK			0x000000ff
+#define DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__SHIFT			0
+static inline uint32_t DPU_RDMA_RDMA_WEIGHT_M_WEIGHT(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__MASK;
+}
+
+#define REG_DPU_RDMA_RDMA_EW_SURF_NOTCH				0x0000506c
+#define DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__MASK		0xfffffff0
+#define DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__SHIFT	4
+static inline uint32_t DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__SHIFT) & DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__MASK;
+}
+#define DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__MASK		0x0000000f
+#define DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__SHIFT		0
+static inline uint32_t DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0(uint32_t val)
+{
+	return ((val) << DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__MASK;
+}
+
+#define REG_PPU_S_STATUS					0x00006000
+#define PPU_S_STATUS_RESERVED_0__MASK				0xfffc0000
+#define PPU_S_STATUS_RESERVED_0__SHIFT				18
+static inline uint32_t PPU_S_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_S_STATUS_RESERVED_0__SHIFT) & PPU_S_STATUS_RESERVED_0__MASK;
+}
+#define PPU_S_STATUS_STATUS_1__MASK				0x00030000
+#define PPU_S_STATUS_STATUS_1__SHIFT				16
+static inline uint32_t PPU_S_STATUS_STATUS_1(uint32_t val)
+{
+	return ((val) << PPU_S_STATUS_STATUS_1__SHIFT) & PPU_S_STATUS_STATUS_1__MASK;
+}
+#define PPU_S_STATUS_RESERVED_1__MASK				0x0000fffc
+#define PPU_S_STATUS_RESERVED_1__SHIFT				2
+static inline uint32_t PPU_S_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_S_STATUS_RESERVED_1__SHIFT) & PPU_S_STATUS_RESERVED_1__MASK;
+}
+#define PPU_S_STATUS_STATUS_0__MASK				0x00000003
+#define PPU_S_STATUS_STATUS_0__SHIFT				0
+static inline uint32_t PPU_S_STATUS_STATUS_0(uint32_t val)
+{
+	return ((val) << PPU_S_STATUS_STATUS_0__SHIFT) & PPU_S_STATUS_STATUS_0__MASK;
+}
+
+#define REG_PPU_S_POINTER					0x00006004
+#define PPU_S_POINTER_RESERVED_0__MASK				0xfffe0000
+#define PPU_S_POINTER_RESERVED_0__SHIFT				17
+static inline uint32_t PPU_S_POINTER_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_RESERVED_0__SHIFT) & PPU_S_POINTER_RESERVED_0__MASK;
+}
+#define PPU_S_POINTER_EXECUTER__MASK				0x00010000
+#define PPU_S_POINTER_EXECUTER__SHIFT				16
+static inline uint32_t PPU_S_POINTER_EXECUTER(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_EXECUTER__SHIFT) & PPU_S_POINTER_EXECUTER__MASK;
+}
+#define PPU_S_POINTER_RESERVED_1__MASK				0x0000ffc0
+#define PPU_S_POINTER_RESERVED_1__SHIFT				6
+static inline uint32_t PPU_S_POINTER_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_RESERVED_1__SHIFT) & PPU_S_POINTER_RESERVED_1__MASK;
+}
+#define PPU_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
+#define PPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
+static inline uint32_t PPU_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & PPU_S_POINTER_EXECUTER_PP_CLEAR__MASK;
+}
+#define PPU_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
+#define PPU_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
+static inline uint32_t PPU_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_POINTER_PP_CLEAR__SHIFT) & PPU_S_POINTER_POINTER_PP_CLEAR__MASK;
+}
+#define PPU_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
+#define PPU_S_POINTER_POINTER_PP_MODE__SHIFT			3
+static inline uint32_t PPU_S_POINTER_POINTER_PP_MODE(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_POINTER_PP_MODE__SHIFT) & PPU_S_POINTER_POINTER_PP_MODE__MASK;
+}
+#define PPU_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
+#define PPU_S_POINTER_EXECUTER_PP_EN__SHIFT			2
+static inline uint32_t PPU_S_POINTER_EXECUTER_PP_EN(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_EXECUTER_PP_EN__SHIFT) & PPU_S_POINTER_EXECUTER_PP_EN__MASK;
+}
+#define PPU_S_POINTER_POINTER_PP_EN__MASK			0x00000002
+#define PPU_S_POINTER_POINTER_PP_EN__SHIFT			1
+static inline uint32_t PPU_S_POINTER_POINTER_PP_EN(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_POINTER_PP_EN__SHIFT) & PPU_S_POINTER_POINTER_PP_EN__MASK;
+}
+#define PPU_S_POINTER_POINTER__MASK				0x00000001
+#define PPU_S_POINTER_POINTER__SHIFT				0
+static inline uint32_t PPU_S_POINTER_POINTER(uint32_t val)
+{
+	return ((val) << PPU_S_POINTER_POINTER__SHIFT) & PPU_S_POINTER_POINTER__MASK;
+}
+
+#define REG_PPU_OPERATION_ENABLE				0x00006008
+#define PPU_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
+#define PPU_OPERATION_ENABLE_RESERVED_0__SHIFT			1
+static inline uint32_t PPU_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_ENABLE_RESERVED_0__SHIFT) & PPU_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define PPU_OPERATION_ENABLE_OP_EN__MASK			0x00000001
+#define PPU_OPERATION_ENABLE_OP_EN__SHIFT			0
+static inline uint32_t PPU_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_ENABLE_OP_EN__SHIFT) & PPU_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_PPU_DATA_CUBE_IN_WIDTH				0x0000600c
+#define PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__MASK			0xffffe000
+#define PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_DATA_CUBE_IN_WIDTH_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__SHIFT) & PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__MASK;
+}
+#define PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK		0x00001fff
+#define PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT		0
+static inline uint32_t PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT) & PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK;
+}
+
+#define REG_PPU_DATA_CUBE_IN_HEIGHT				0x00006010
+#define PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__MASK		0xffffe000
+#define PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT) & PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__MASK;
+}
+#define PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK		0x00001fff
+#define PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT		0
+static inline uint32_t PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT) & PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK;
+}
+
+#define REG_PPU_DATA_CUBE_IN_CHANNEL				0x00006014
+#define PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__MASK		0xffffe000
+#define PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT) & PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__MASK;
+}
+#define PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK		0x00001fff
+#define PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT		0
+static inline uint32_t PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT) & PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK;
+}
+
+#define REG_PPU_DATA_CUBE_OUT_WIDTH				0x00006018
+#define PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__MASK		0xffffe000
+#define PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__SHIFT) & PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__MASK;
+}
+#define PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__MASK		0x00001fff
+#define PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__SHIFT		0
+static inline uint32_t PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__SHIFT) & PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__MASK;
+}
+
+#define REG_PPU_DATA_CUBE_OUT_HEIGHT				0x0000601c
+#define PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__MASK		0xffffe000
+#define PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__SHIFT) & PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__MASK;
+}
+#define PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__MASK		0x00001fff
+#define PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__SHIFT		0
+static inline uint32_t PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__SHIFT) & PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__MASK;
+}
+
+#define REG_PPU_DATA_CUBE_OUT_CHANNEL				0x00006020
+#define PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__MASK		0xffffe000
+#define PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__SHIFT) & PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__MASK;
+}
+#define PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__MASK	0x00001fff
+#define PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__SHIFT	0
+static inline uint32_t PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL(uint32_t val)
+{
+	return ((val) << PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__SHIFT) & PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__MASK;
+}
+
+#define REG_PPU_OPERATION_MODE_CFG				0x00006024
+#define PPU_OPERATION_MODE_CFG_RESERVED_0__MASK			0x80000000
+#define PPU_OPERATION_MODE_CFG_RESERVED_0__SHIFT		31
+static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_0__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_0__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_INDEX_EN__MASK			0x40000000
+#define PPU_OPERATION_MODE_CFG_INDEX_EN__SHIFT			30
+static inline uint32_t PPU_OPERATION_MODE_CFG_INDEX_EN(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_INDEX_EN__SHIFT) & PPU_OPERATION_MODE_CFG_INDEX_EN__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_RESERVED_1__MASK			0x20000000
+#define PPU_OPERATION_MODE_CFG_RESERVED_1__SHIFT		29
+static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_1__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_1__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_NOTCH_ADDR__MASK			0x1fff0000
+#define PPU_OPERATION_MODE_CFG_NOTCH_ADDR__SHIFT		16
+static inline uint32_t PPU_OPERATION_MODE_CFG_NOTCH_ADDR(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_NOTCH_ADDR__SHIFT) & PPU_OPERATION_MODE_CFG_NOTCH_ADDR__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_RESERVED_2__MASK			0x0000ff00
+#define PPU_OPERATION_MODE_CFG_RESERVED_2__SHIFT		8
+static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_2__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_2__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_USE_CNT__MASK			0x000000e0
+#define PPU_OPERATION_MODE_CFG_USE_CNT__SHIFT			5
+static inline uint32_t PPU_OPERATION_MODE_CFG_USE_CNT(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_USE_CNT__SHIFT) & PPU_OPERATION_MODE_CFG_USE_CNT__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_FLYING_MODE__MASK		0x00000010
+#define PPU_OPERATION_MODE_CFG_FLYING_MODE__SHIFT		4
+static inline uint32_t PPU_OPERATION_MODE_CFG_FLYING_MODE(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_FLYING_MODE__SHIFT) & PPU_OPERATION_MODE_CFG_FLYING_MODE__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_RESERVED_3__MASK			0x0000000c
+#define PPU_OPERATION_MODE_CFG_RESERVED_3__SHIFT		2
+static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_3(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_3__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_3__MASK;
+}
+#define PPU_OPERATION_MODE_CFG_POOLING_METHOD__MASK		0x00000003
+#define PPU_OPERATION_MODE_CFG_POOLING_METHOD__SHIFT		0
+static inline uint32_t PPU_OPERATION_MODE_CFG_POOLING_METHOD(uint32_t val)
+{
+	return ((val) << PPU_OPERATION_MODE_CFG_POOLING_METHOD__SHIFT) & PPU_OPERATION_MODE_CFG_POOLING_METHOD__MASK;
+}
+
+#define REG_PPU_POOLING_KERNEL_CFG				0x00006034
+#define PPU_POOLING_KERNEL_CFG_RESERVED_0__MASK			0xff000000
+#define PPU_POOLING_KERNEL_CFG_RESERVED_0__SHIFT		24
+static inline uint32_t PPU_POOLING_KERNEL_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_RESERVED_0__SHIFT) & PPU_POOLING_KERNEL_CFG_RESERVED_0__MASK;
+}
+#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__MASK	0x00f00000
+#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__SHIFT	20
+static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__MASK;
+}
+#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__MASK	0x000f0000
+#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__SHIFT	16
+static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__MASK;
+}
+#define PPU_POOLING_KERNEL_CFG_RESERVED_1__MASK			0x0000f000
+#define PPU_POOLING_KERNEL_CFG_RESERVED_1__SHIFT		12
+static inline uint32_t PPU_POOLING_KERNEL_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_RESERVED_1__SHIFT) & PPU_POOLING_KERNEL_CFG_RESERVED_1__MASK;
+}
+#define PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__MASK		0x00000f00
+#define PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__SHIFT		8
+static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__MASK;
+}
+#define PPU_POOLING_KERNEL_CFG_RESERVED_2__MASK			0x000000f0
+#define PPU_POOLING_KERNEL_CFG_RESERVED_2__SHIFT		4
+static inline uint32_t PPU_POOLING_KERNEL_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_RESERVED_2__SHIFT) & PPU_POOLING_KERNEL_CFG_RESERVED_2__MASK;
+}
+#define PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__MASK		0x0000000f
+#define PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__SHIFT		0
+static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH(uint32_t val)
+{
+	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__MASK;
+}
+
+#define REG_PPU_RECIP_KERNEL_WIDTH				0x00006038
+#define PPU_RECIP_KERNEL_WIDTH_RESERVED_0__MASK			0xfffe0000
+#define PPU_RECIP_KERNEL_WIDTH_RESERVED_0__SHIFT		17
+static inline uint32_t PPU_RECIP_KERNEL_WIDTH_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RECIP_KERNEL_WIDTH_RESERVED_0__SHIFT) & PPU_RECIP_KERNEL_WIDTH_RESERVED_0__MASK;
+}
+#define PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__MASK		0x0001ffff
+#define PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__SHIFT	0
+static inline uint32_t PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH(uint32_t val)
+{
+	return ((val) << PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__SHIFT) & PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__MASK;
+}
+
+#define REG_PPU_RECIP_KERNEL_HEIGHT				0x0000603c
+#define PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__MASK		0xfffe0000
+#define PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__SHIFT		17
+static inline uint32_t PPU_RECIP_KERNEL_HEIGHT_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__SHIFT) & PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__MASK;
+}
+#define PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__MASK	0x0001ffff
+#define PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__SHIFT	0
+static inline uint32_t PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT(uint32_t val)
+{
+	return ((val) << PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__SHIFT) & PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__MASK;
+}
+
+#define REG_PPU_POOLING_PADDING_CFG				0x00006040
+#define PPU_POOLING_PADDING_CFG_RESERVED_0__MASK		0xffff8000
+#define PPU_POOLING_PADDING_CFG_RESERVED_0__SHIFT		15
+static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_0__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_0__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_PAD_BOTTOM__MASK		0x00007000
+#define PPU_POOLING_PADDING_CFG_PAD_BOTTOM__SHIFT		12
+static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_BOTTOM(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_PAD_BOTTOM__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_BOTTOM__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_RESERVED_1__MASK		0x00000800
+#define PPU_POOLING_PADDING_CFG_RESERVED_1__SHIFT		11
+static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_1__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_1__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_PAD_RIGHT__MASK			0x00000700
+#define PPU_POOLING_PADDING_CFG_PAD_RIGHT__SHIFT		8
+static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_RIGHT(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_PAD_RIGHT__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_RIGHT__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_RESERVED_2__MASK		0x00000080
+#define PPU_POOLING_PADDING_CFG_RESERVED_2__SHIFT		7
+static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_2(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_2__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_2__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_PAD_TOP__MASK			0x00000070
+#define PPU_POOLING_PADDING_CFG_PAD_TOP__SHIFT			4
+static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_TOP(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_PAD_TOP__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_TOP__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_RESERVED_3__MASK		0x00000008
+#define PPU_POOLING_PADDING_CFG_RESERVED_3__SHIFT		3
+static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_3(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_3__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_3__MASK;
+}
+#define PPU_POOLING_PADDING_CFG_PAD_LEFT__MASK			0x00000007
+#define PPU_POOLING_PADDING_CFG_PAD_LEFT__SHIFT			0
+static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_LEFT(uint32_t val)
+{
+	return ((val) << PPU_POOLING_PADDING_CFG_PAD_LEFT__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_LEFT__MASK;
+}
+
+#define REG_PPU_PADDING_VALUE_1_CFG				0x00006044
+#define PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__MASK		0xffffffff
+#define PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__SHIFT		0
+static inline uint32_t PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0(uint32_t val)
+{
+	return ((val) << PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__SHIFT) & PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__MASK;
+}
+
+#define REG_PPU_PADDING_VALUE_2_CFG				0x00006048
+#define PPU_PADDING_VALUE_2_CFG_RESERVED_0__MASK		0xfffffff8
+#define PPU_PADDING_VALUE_2_CFG_RESERVED_0__SHIFT		3
+static inline uint32_t PPU_PADDING_VALUE_2_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_PADDING_VALUE_2_CFG_RESERVED_0__SHIFT) & PPU_PADDING_VALUE_2_CFG_RESERVED_0__MASK;
+}
+#define PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__MASK		0x00000007
+#define PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__SHIFT		0
+static inline uint32_t PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1(uint32_t val)
+{
+	return ((val) << PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__SHIFT) & PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__MASK;
+}
+
+#define REG_PPU_DST_BASE_ADDR					0x00006070
+#define PPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK			0xfffffff0
+#define PPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT			4
+static inline uint32_t PPU_DST_BASE_ADDR_DST_BASE_ADDR(uint32_t val)
+{
+	return ((val) << PPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT) & PPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK;
+}
+#define PPU_DST_BASE_ADDR_RESERVED_0__MASK			0x0000000f
+#define PPU_DST_BASE_ADDR_RESERVED_0__SHIFT			0
+static inline uint32_t PPU_DST_BASE_ADDR_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DST_BASE_ADDR_RESERVED_0__SHIFT) & PPU_DST_BASE_ADDR_RESERVED_0__MASK;
+}
+
+#define REG_PPU_DST_SURF_STRIDE					0x0000607c
+#define PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK		0xfffffff0
+#define PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT		4
+static inline uint32_t PPU_DST_SURF_STRIDE_DST_SURF_STRIDE(uint32_t val)
+{
+	return ((val) << PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT) & PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK;
+}
+#define PPU_DST_SURF_STRIDE_RESERVED_0__MASK			0x0000000f
+#define PPU_DST_SURF_STRIDE_RESERVED_0__SHIFT			0
+static inline uint32_t PPU_DST_SURF_STRIDE_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_DST_SURF_STRIDE_RESERVED_0__SHIFT) & PPU_DST_SURF_STRIDE_RESERVED_0__MASK;
+}
+
+#define REG_PPU_DATA_FORMAT					0x00006084
+#define PPU_DATA_FORMAT_INDEX_ADD__MASK				0xfffffff0
+#define PPU_DATA_FORMAT_INDEX_ADD__SHIFT			4
+static inline uint32_t PPU_DATA_FORMAT_INDEX_ADD(uint32_t val)
+{
+	return ((val) << PPU_DATA_FORMAT_INDEX_ADD__SHIFT) & PPU_DATA_FORMAT_INDEX_ADD__MASK;
+}
+#define PPU_DATA_FORMAT_DPU_FLYIN__MASK				0x00000008
+#define PPU_DATA_FORMAT_DPU_FLYIN__SHIFT			3
+static inline uint32_t PPU_DATA_FORMAT_DPU_FLYIN(uint32_t val)
+{
+	return ((val) << PPU_DATA_FORMAT_DPU_FLYIN__SHIFT) & PPU_DATA_FORMAT_DPU_FLYIN__MASK;
+}
+#define PPU_DATA_FORMAT_PROC_PRECISION__MASK			0x00000007
+#define PPU_DATA_FORMAT_PROC_PRECISION__SHIFT			0
+static inline uint32_t PPU_DATA_FORMAT_PROC_PRECISION(uint32_t val)
+{
+	return ((val) << PPU_DATA_FORMAT_PROC_PRECISION__SHIFT) & PPU_DATA_FORMAT_PROC_PRECISION__MASK;
+}
+
+#define REG_PPU_MISC_CTRL					0x000060dc
+#define PPU_MISC_CTRL_SURF_LEN__MASK				0xffff0000
+#define PPU_MISC_CTRL_SURF_LEN__SHIFT				16
+static inline uint32_t PPU_MISC_CTRL_SURF_LEN(uint32_t val)
+{
+	return ((val) << PPU_MISC_CTRL_SURF_LEN__SHIFT) & PPU_MISC_CTRL_SURF_LEN__MASK;
+}
+#define PPU_MISC_CTRL_RESERVED_0__MASK				0x0000fe00
+#define PPU_MISC_CTRL_RESERVED_0__SHIFT				9
+static inline uint32_t PPU_MISC_CTRL_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_MISC_CTRL_RESERVED_0__SHIFT) & PPU_MISC_CTRL_RESERVED_0__MASK;
+}
+#define PPU_MISC_CTRL_MC_SURF_OUT__MASK				0x00000100
+#define PPU_MISC_CTRL_MC_SURF_OUT__SHIFT			8
+static inline uint32_t PPU_MISC_CTRL_MC_SURF_OUT(uint32_t val)
+{
+	return ((val) << PPU_MISC_CTRL_MC_SURF_OUT__SHIFT) & PPU_MISC_CTRL_MC_SURF_OUT__MASK;
+}
+#define PPU_MISC_CTRL_NONALIGN__MASK				0x00000080
+#define PPU_MISC_CTRL_NONALIGN__SHIFT				7
+static inline uint32_t PPU_MISC_CTRL_NONALIGN(uint32_t val)
+{
+	return ((val) << PPU_MISC_CTRL_NONALIGN__SHIFT) & PPU_MISC_CTRL_NONALIGN__MASK;
+}
+#define PPU_MISC_CTRL_RESERVED_1__MASK				0x00000070
+#define PPU_MISC_CTRL_RESERVED_1__SHIFT				4
+static inline uint32_t PPU_MISC_CTRL_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_MISC_CTRL_RESERVED_1__SHIFT) & PPU_MISC_CTRL_RESERVED_1__MASK;
+}
+#define PPU_MISC_CTRL_BURST_LEN__MASK				0x0000000f
+#define PPU_MISC_CTRL_BURST_LEN__SHIFT				0
+static inline uint32_t PPU_MISC_CTRL_BURST_LEN(uint32_t val)
+{
+	return ((val) << PPU_MISC_CTRL_BURST_LEN__SHIFT) & PPU_MISC_CTRL_BURST_LEN__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_S_STATUS				0x00007000
+#define PPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK			0xfffc0000
+#define PPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT		18
+static inline uint32_t PPU_RDMA_RDMA_S_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK			0x00030000
+#define PPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT			16
+static inline uint32_t PPU_RDMA_RDMA_S_STATUS_STATUS_1(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT) & PPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK;
+}
+#define PPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK			0x0000fffc
+#define PPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT		2
+static inline uint32_t PPU_RDMA_RDMA_S_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT) & PPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK;
+}
+#define PPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK			0x00000003
+#define PPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT			0
+static inline uint32_t PPU_RDMA_RDMA_S_STATUS_STATUS_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT) & PPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_S_POINTER				0x00007004
+#define PPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK		0xfffe0000
+#define PPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT		17
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK			0x00010000
+#define PPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT			16
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_EXECUTER(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT) & PPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK		0x0000ffc0
+#define PPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT		6
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_RESERVED_1(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT) & PPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK		0x00000020
+#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT	5
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK		0x00000010
+#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT		4
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK		0x00000008
+#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT		3
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK		0x00000004
+#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT		2
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT) & PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK		0x00000002
+#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT		1
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK;
+}
+#define PPU_RDMA_RDMA_S_POINTER_POINTER__MASK			0x00000001
+#define PPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT			0
+static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_OPERATION_ENABLE			0x00007008
+#define PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK		0xfffffffe
+#define PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT	1
+static inline uint32_t PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK		0x00000001
+#define PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT		0
+static inline uint32_t PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT) & PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_CUBE_IN_WIDTH				0x0000700c
+#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__MASK		0xffffe000
+#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK		0x00001fff
+#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT	0
+static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_CUBE_IN_HEIGHT			0x00007010
+#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__MASK		0xffffe000
+#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK	0x00001fff
+#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT	0
+static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_CUBE_IN_CHANNEL			0x00007014
+#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__MASK		0xffffe000
+#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT		13
+static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK	0x00001fff
+#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT	0
+static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_SRC_BASE_ADDR				0x0000701c
+#define PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK		0xffffffff
+#define PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT	0
+static inline uint32_t PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT) & PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_SRC_LINE_STRIDE			0x00007024
+#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__MASK	0xfffffff0
+#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__SHIFT	4
+static inline uint32_t PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__SHIFT) & PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__MASK;
+}
+#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__MASK		0x0000000f
+#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__SHIFT		0
+static inline uint32_t PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_SRC_SURF_STRIDE			0x00007028
+#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__MASK	0xfffffff0
+#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__SHIFT	4
+static inline uint32_t PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__SHIFT) & PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__MASK;
+}
+#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__MASK		0x0000000f
+#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__SHIFT		0
+static inline uint32_t PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__MASK;
+}
+
+#define REG_PPU_RDMA_RDMA_DATA_FORMAT				0x00007030
+#define PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__MASK		0xfffffffc
+#define PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__SHIFT		2
+static inline uint32_t PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__MASK;
+}
+#define PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__MASK		0x00000003
+#define PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__SHIFT		0
+static inline uint32_t PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION(uint32_t val)
+{
+	return ((val) << PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__SHIFT) & PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__MASK;
+}
+
+#define REG_DDMA_CFG_OUTSTANDING				0x00008000
+#define DDMA_CFG_OUTSTANDING_RESERVED_0__MASK			0xffff0000
+#define DDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT			16
+static inline uint32_t DDMA_CFG_OUTSTANDING_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT) & DDMA_CFG_OUTSTANDING_RESERVED_0__MASK;
+}
+#define DDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK			0x0000ff00
+#define DDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT			8
+static inline uint32_t DDMA_CFG_OUTSTANDING_WR_OS_CNT(uint32_t val)
+{
+	return ((val) << DDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT) & DDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK;
+}
+#define DDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK			0x000000ff
+#define DDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT			0
+static inline uint32_t DDMA_CFG_OUTSTANDING_RD_OS_CNT(uint32_t val)
+{
+	return ((val) << DDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT) & DDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK;
+}
+
+#define REG_DDMA_RD_WEIGHT_0					0x00008004
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK			0xff000000
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT			24
+static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP(uint32_t val)
+{
+	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK;
+}
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK			0x00ff0000
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT			16
+static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU(uint32_t val)
+{
+	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK;
+}
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK			0x0000ff00
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT		8
+static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL(uint32_t val)
+{
+	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK;
+}
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK		0x000000ff
+#define DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT		0
+static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE(uint32_t val)
+{
+	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK;
+}
+
+#define REG_DDMA_WR_WEIGHT_0					0x00008008
+#define DDMA_WR_WEIGHT_0_RESERVED_0__MASK			0xffff0000
+#define DDMA_WR_WEIGHT_0_RESERVED_0__SHIFT			16
+static inline uint32_t DDMA_WR_WEIGHT_0_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_WR_WEIGHT_0_RESERVED_0__SHIFT) & DDMA_WR_WEIGHT_0_RESERVED_0__MASK;
+}
+#define DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK			0x0000ff00
+#define DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT			8
+static inline uint32_t DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP(uint32_t val)
+{
+	return ((val) << DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT) & DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK;
+}
+#define DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK			0x000000ff
+#define DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT			0
+static inline uint32_t DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU(uint32_t val)
+{
+	return ((val) << DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT) & DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK;
+}
+
+#define REG_DDMA_CFG_ID_ERROR					0x0000800c
+#define DDMA_CFG_ID_ERROR_RESERVED_0__MASK			0xfffffc00
+#define DDMA_CFG_ID_ERROR_RESERVED_0__SHIFT			10
+static inline uint32_t DDMA_CFG_ID_ERROR_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_ID_ERROR_RESERVED_0__SHIFT) & DDMA_CFG_ID_ERROR_RESERVED_0__MASK;
+}
+#define DDMA_CFG_ID_ERROR_WR_RESP_ID__MASK			0x000003c0
+#define DDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT			6
+static inline uint32_t DDMA_CFG_ID_ERROR_WR_RESP_ID(uint32_t val)
+{
+	return ((val) << DDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT) & DDMA_CFG_ID_ERROR_WR_RESP_ID__MASK;
+}
+#define DDMA_CFG_ID_ERROR_RESERVED_1__MASK			0x00000020
+#define DDMA_CFG_ID_ERROR_RESERVED_1__SHIFT			5
+static inline uint32_t DDMA_CFG_ID_ERROR_RESERVED_1(uint32_t val)
+{
+	return ((val) << DDMA_CFG_ID_ERROR_RESERVED_1__SHIFT) & DDMA_CFG_ID_ERROR_RESERVED_1__MASK;
+}
+#define DDMA_CFG_ID_ERROR_RD_RESP_ID__MASK			0x0000001f
+#define DDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT			0
+static inline uint32_t DDMA_CFG_ID_ERROR_RD_RESP_ID(uint32_t val)
+{
+	return ((val) << DDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT) & DDMA_CFG_ID_ERROR_RD_RESP_ID__MASK;
+}
+
+#define REG_DDMA_RD_WEIGHT_1					0x00008010
+#define DDMA_RD_WEIGHT_1_RESERVED_0__MASK			0xffffff00
+#define DDMA_RD_WEIGHT_1_RESERVED_0__SHIFT			8
+static inline uint32_t DDMA_RD_WEIGHT_1_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_RD_WEIGHT_1_RESERVED_0__SHIFT) & DDMA_RD_WEIGHT_1_RESERVED_0__MASK;
+}
+#define DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK			0x000000ff
+#define DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT			0
+static inline uint32_t DDMA_RD_WEIGHT_1_RD_WEIGHT_PC(uint32_t val)
+{
+	return ((val) << DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT) & DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK;
+}
+
+#define REG_DDMA_CFG_DMA_FIFO_CLR				0x00008014
+#define DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK			0xfffffffe
+#define DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT			1
+static inline uint32_t DDMA_CFG_DMA_FIFO_CLR_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT) & DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK;
+}
+#define DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK		0x00000001
+#define DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT		0
+static inline uint32_t DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT) & DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK;
+}
+
+#define REG_DDMA_CFG_DMA_ARB					0x00008018
+#define DDMA_CFG_DMA_ARB_RESERVED_0__MASK			0xfffffc00
+#define DDMA_CFG_DMA_ARB_RESERVED_0__SHIFT			10
+static inline uint32_t DDMA_CFG_DMA_ARB_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_RESERVED_0__SHIFT) & DDMA_CFG_DMA_ARB_RESERVED_0__MASK;
+}
+#define DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK			0x00000200
+#define DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT			9
+static inline uint32_t DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT) & DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK;
+}
+#define DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK			0x00000100
+#define DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT			8
+static inline uint32_t DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT) & DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK;
+}
+#define DDMA_CFG_DMA_ARB_RESERVED_1__MASK			0x00000080
+#define DDMA_CFG_DMA_ARB_RESERVED_1__SHIFT			7
+static inline uint32_t DDMA_CFG_DMA_ARB_RESERVED_1(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_RESERVED_1__SHIFT) & DDMA_CFG_DMA_ARB_RESERVED_1__MASK;
+}
+#define DDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK			0x00000070
+#define DDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT			4
+static inline uint32_t DDMA_CFG_DMA_ARB_WR_FIX_ARB(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT) & DDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK;
+}
+#define DDMA_CFG_DMA_ARB_RESERVED_2__MASK			0x00000008
+#define DDMA_CFG_DMA_ARB_RESERVED_2__SHIFT			3
+static inline uint32_t DDMA_CFG_DMA_ARB_RESERVED_2(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_RESERVED_2__SHIFT) & DDMA_CFG_DMA_ARB_RESERVED_2__MASK;
+}
+#define DDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK			0x00000007
+#define DDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT			0
+static inline uint32_t DDMA_CFG_DMA_ARB_RD_FIX_ARB(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT) & DDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK;
+}
+
+#define REG_DDMA_CFG_DMA_RD_QOS					0x00008020
+#define DDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK			0xfffffc00
+#define DDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT			10
+static inline uint32_t DDMA_CFG_DMA_RD_QOS_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT) & DDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK;
+}
+#define DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK			0x00000300
+#define DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT			8
+static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_PC_QOS(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK;
+}
+#define DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK			0x000000c0
+#define DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT			6
+static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK;
+}
+#define DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK			0x00000030
+#define DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT			4
+static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK;
+}
+#define DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK			0x0000000c
+#define DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT		2
+static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK;
+}
+#define DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK		0x00000003
+#define DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT		0
+static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK;
+}
+
+#define REG_DDMA_CFG_DMA_RD_CFG					0x00008024
+#define DDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK			0xffffe000
+#define DDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT			13
+static inline uint32_t DDMA_CFG_DMA_RD_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT) & DDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK;
+}
+#define DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK			0x00001000
+#define DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT			12
+static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARLOCK(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK;
+}
+#define DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK			0x00000f00
+#define DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT			8
+static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARCACHE(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK;
+}
+#define DDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK			0x000000e0
+#define DDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT			5
+static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARPROT(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK;
+}
+#define DDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK			0x00000018
+#define DDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT			3
+static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARBURST(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK;
+}
+#define DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK			0x00000007
+#define DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT			0
+static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARSIZE(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK;
+}
+
+#define REG_DDMA_CFG_DMA_WR_CFG					0x00008028
+#define DDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK			0xffffe000
+#define DDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT			13
+static inline uint32_t DDMA_CFG_DMA_WR_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT) & DDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK;
+}
+#define DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK			0x00001000
+#define DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT			12
+static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWLOCK(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK;
+}
+#define DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK			0x00000f00
+#define DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT			8
+static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWCACHE(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK;
+}
+#define DDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK			0x000000e0
+#define DDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT			5
+static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWPROT(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK;
+}
+#define DDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK			0x00000018
+#define DDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT			3
+static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWBURST(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK;
+}
+#define DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK			0x00000007
+#define DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT			0
+static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWSIZE(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK;
+}
+
+#define REG_DDMA_CFG_DMA_WSTRB					0x0000802c
+#define DDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK			0xffffffff
+#define DDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT			0
+static inline uint32_t DDMA_CFG_DMA_WSTRB_WR_WSTRB(uint32_t val)
+{
+	return ((val) << DDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT) & DDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK;
+}
+
+#define REG_DDMA_CFG_STATUS					0x00008030
+#define DDMA_CFG_STATUS_RESERVED_0__MASK			0xfffffe00
+#define DDMA_CFG_STATUS_RESERVED_0__SHIFT			9
+static inline uint32_t DDMA_CFG_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << DDMA_CFG_STATUS_RESERVED_0__SHIFT) & DDMA_CFG_STATUS_RESERVED_0__MASK;
+}
+#define DDMA_CFG_STATUS_IDEL__MASK				0x00000100
+#define DDMA_CFG_STATUS_IDEL__SHIFT				8
+static inline uint32_t DDMA_CFG_STATUS_IDEL(uint32_t val)
+{
+	return ((val) << DDMA_CFG_STATUS_IDEL__SHIFT) & DDMA_CFG_STATUS_IDEL__MASK;
+}
+#define DDMA_CFG_STATUS_RESERVED_1__MASK			0x000000ff
+#define DDMA_CFG_STATUS_RESERVED_1__SHIFT			0
+static inline uint32_t DDMA_CFG_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << DDMA_CFG_STATUS_RESERVED_1__SHIFT) & DDMA_CFG_STATUS_RESERVED_1__MASK;
+}
+
+#define REG_SDMA_CFG_OUTSTANDING				0x00009000
+#define SDMA_CFG_OUTSTANDING_RESERVED_0__MASK			0xffff0000
+#define SDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT			16
+static inline uint32_t SDMA_CFG_OUTSTANDING_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT) & SDMA_CFG_OUTSTANDING_RESERVED_0__MASK;
+}
+#define SDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK			0x0000ff00
+#define SDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT			8
+static inline uint32_t SDMA_CFG_OUTSTANDING_WR_OS_CNT(uint32_t val)
+{
+	return ((val) << SDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT) & SDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK;
+}
+#define SDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK			0x000000ff
+#define SDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT			0
+static inline uint32_t SDMA_CFG_OUTSTANDING_RD_OS_CNT(uint32_t val)
+{
+	return ((val) << SDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT) & SDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK;
+}
+
+#define REG_SDMA_RD_WEIGHT_0					0x00009004
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK			0xff000000
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT			24
+static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP(uint32_t val)
+{
+	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK;
+}
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK			0x00ff0000
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT			16
+static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU(uint32_t val)
+{
+	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK;
+}
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK			0x0000ff00
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT		8
+static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL(uint32_t val)
+{
+	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK;
+}
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK		0x000000ff
+#define SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT		0
+static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE(uint32_t val)
+{
+	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK;
+}
+
+#define REG_SDMA_WR_WEIGHT_0					0x00009008
+#define SDMA_WR_WEIGHT_0_RESERVED_0__MASK			0xffff0000
+#define SDMA_WR_WEIGHT_0_RESERVED_0__SHIFT			16
+static inline uint32_t SDMA_WR_WEIGHT_0_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_WR_WEIGHT_0_RESERVED_0__SHIFT) & SDMA_WR_WEIGHT_0_RESERVED_0__MASK;
+}
+#define SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK			0x0000ff00
+#define SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT			8
+static inline uint32_t SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP(uint32_t val)
+{
+	return ((val) << SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT) & SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK;
+}
+#define SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK			0x000000ff
+#define SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT			0
+static inline uint32_t SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU(uint32_t val)
+{
+	return ((val) << SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT) & SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK;
+}
+
+#define REG_SDMA_CFG_ID_ERROR					0x0000900c
+#define SDMA_CFG_ID_ERROR_RESERVED_0__MASK			0xfffffc00
+#define SDMA_CFG_ID_ERROR_RESERVED_0__SHIFT			10
+static inline uint32_t SDMA_CFG_ID_ERROR_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_ID_ERROR_RESERVED_0__SHIFT) & SDMA_CFG_ID_ERROR_RESERVED_0__MASK;
+}
+#define SDMA_CFG_ID_ERROR_WR_RESP_ID__MASK			0x000003c0
+#define SDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT			6
+static inline uint32_t SDMA_CFG_ID_ERROR_WR_RESP_ID(uint32_t val)
+{
+	return ((val) << SDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT) & SDMA_CFG_ID_ERROR_WR_RESP_ID__MASK;
+}
+#define SDMA_CFG_ID_ERROR_RESERVED_1__MASK			0x00000020
+#define SDMA_CFG_ID_ERROR_RESERVED_1__SHIFT			5
+static inline uint32_t SDMA_CFG_ID_ERROR_RESERVED_1(uint32_t val)
+{
+	return ((val) << SDMA_CFG_ID_ERROR_RESERVED_1__SHIFT) & SDMA_CFG_ID_ERROR_RESERVED_1__MASK;
+}
+#define SDMA_CFG_ID_ERROR_RD_RESP_ID__MASK			0x0000001f
+#define SDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT			0
+static inline uint32_t SDMA_CFG_ID_ERROR_RD_RESP_ID(uint32_t val)
+{
+	return ((val) << SDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT) & SDMA_CFG_ID_ERROR_RD_RESP_ID__MASK;
+}
+
+#define REG_SDMA_RD_WEIGHT_1					0x00009010
+#define SDMA_RD_WEIGHT_1_RESERVED_0__MASK			0xffffff00
+#define SDMA_RD_WEIGHT_1_RESERVED_0__SHIFT			8
+static inline uint32_t SDMA_RD_WEIGHT_1_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_RD_WEIGHT_1_RESERVED_0__SHIFT) & SDMA_RD_WEIGHT_1_RESERVED_0__MASK;
+}
+#define SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK			0x000000ff
+#define SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT			0
+static inline uint32_t SDMA_RD_WEIGHT_1_RD_WEIGHT_PC(uint32_t val)
+{
+	return ((val) << SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT) & SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK;
+}
+
+#define REG_SDMA_CFG_DMA_FIFO_CLR				0x00009014
+#define SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK			0xfffffffe
+#define SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT			1
+static inline uint32_t SDMA_CFG_DMA_FIFO_CLR_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT) & SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK;
+}
+#define SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK		0x00000001
+#define SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT		0
+static inline uint32_t SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT) & SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK;
+}
+
+#define REG_SDMA_CFG_DMA_ARB					0x00009018
+#define SDMA_CFG_DMA_ARB_RESERVED_0__MASK			0xfffffc00
+#define SDMA_CFG_DMA_ARB_RESERVED_0__SHIFT			10
+static inline uint32_t SDMA_CFG_DMA_ARB_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_RESERVED_0__SHIFT) & SDMA_CFG_DMA_ARB_RESERVED_0__MASK;
+}
+#define SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK			0x00000200
+#define SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT			9
+static inline uint32_t SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT) & SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK;
+}
+#define SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK			0x00000100
+#define SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT			8
+static inline uint32_t SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT) & SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK;
+}
+#define SDMA_CFG_DMA_ARB_RESERVED_1__MASK			0x00000080
+#define SDMA_CFG_DMA_ARB_RESERVED_1__SHIFT			7
+static inline uint32_t SDMA_CFG_DMA_ARB_RESERVED_1(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_RESERVED_1__SHIFT) & SDMA_CFG_DMA_ARB_RESERVED_1__MASK;
+}
+#define SDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK			0x00000070
+#define SDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT			4
+static inline uint32_t SDMA_CFG_DMA_ARB_WR_FIX_ARB(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT) & SDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK;
+}
+#define SDMA_CFG_DMA_ARB_RESERVED_2__MASK			0x00000008
+#define SDMA_CFG_DMA_ARB_RESERVED_2__SHIFT			3
+static inline uint32_t SDMA_CFG_DMA_ARB_RESERVED_2(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_RESERVED_2__SHIFT) & SDMA_CFG_DMA_ARB_RESERVED_2__MASK;
+}
+#define SDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK			0x00000007
+#define SDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT			0
+static inline uint32_t SDMA_CFG_DMA_ARB_RD_FIX_ARB(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT) & SDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK;
+}
+
+#define REG_SDMA_CFG_DMA_RD_QOS					0x00009020
+#define SDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK			0xfffffc00
+#define SDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT			10
+static inline uint32_t SDMA_CFG_DMA_RD_QOS_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT) & SDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK;
+}
+#define SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK			0x00000300
+#define SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT			8
+static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_PC_QOS(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK;
+}
+#define SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK			0x000000c0
+#define SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT			6
+static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK;
+}
+#define SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK			0x00000030
+#define SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT			4
+static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK;
+}
+#define SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK			0x0000000c
+#define SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT		2
+static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK;
+}
+#define SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK		0x00000003
+#define SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT		0
+static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK;
+}
+
+#define REG_SDMA_CFG_DMA_RD_CFG					0x00009024
+#define SDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK			0xffffe000
+#define SDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT			13
+static inline uint32_t SDMA_CFG_DMA_RD_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT) & SDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK;
+}
+#define SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK			0x00001000
+#define SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT			12
+static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARLOCK(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK;
+}
+#define SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK			0x00000f00
+#define SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT			8
+static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARCACHE(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK;
+}
+#define SDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK			0x000000e0
+#define SDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT			5
+static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARPROT(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK;
+}
+#define SDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK			0x00000018
+#define SDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT			3
+static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARBURST(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK;
+}
+#define SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK			0x00000007
+#define SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT			0
+static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARSIZE(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK;
+}
+
+#define REG_SDMA_CFG_DMA_WR_CFG					0x00009028
+#define SDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK			0xffffe000
+#define SDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT			13
+static inline uint32_t SDMA_CFG_DMA_WR_CFG_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT) & SDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK;
+}
+#define SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK			0x00001000
+#define SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT			12
+static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWLOCK(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK;
+}
+#define SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK			0x00000f00
+#define SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT			8
+static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWCACHE(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK;
+}
+#define SDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK			0x000000e0
+#define SDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT			5
+static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWPROT(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK;
+}
+#define SDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK			0x00000018
+#define SDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT			3
+static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWBURST(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK;
+}
+#define SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK			0x00000007
+#define SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT			0
+static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWSIZE(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK;
+}
+
+#define REG_SDMA_CFG_DMA_WSTRB					0x0000902c
+#define SDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK			0xffffffff
+#define SDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT			0
+static inline uint32_t SDMA_CFG_DMA_WSTRB_WR_WSTRB(uint32_t val)
+{
+	return ((val) << SDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT) & SDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK;
+}
+
+#define REG_SDMA_CFG_STATUS					0x00009030
+#define SDMA_CFG_STATUS_RESERVED_0__MASK			0xfffffe00
+#define SDMA_CFG_STATUS_RESERVED_0__SHIFT			9
+static inline uint32_t SDMA_CFG_STATUS_RESERVED_0(uint32_t val)
+{
+	return ((val) << SDMA_CFG_STATUS_RESERVED_0__SHIFT) & SDMA_CFG_STATUS_RESERVED_0__MASK;
+}
+#define SDMA_CFG_STATUS_IDEL__MASK				0x00000100
+#define SDMA_CFG_STATUS_IDEL__SHIFT				8
+static inline uint32_t SDMA_CFG_STATUS_IDEL(uint32_t val)
+{
+	return ((val) << SDMA_CFG_STATUS_IDEL__SHIFT) & SDMA_CFG_STATUS_IDEL__MASK;
+}
+#define SDMA_CFG_STATUS_RESERVED_1__MASK			0x000000ff
+#define SDMA_CFG_STATUS_RESERVED_1__SHIFT			0
+static inline uint32_t SDMA_CFG_STATUS_RESERVED_1(uint32_t val)
+{
+	return ((val) << SDMA_CFG_STATUS_RESERVED_1__SHIFT) & SDMA_CFG_STATUS_RESERVED_1__MASK;
+}
+
+#define REG_GLOBAL_OPERATION_ENABLE				0x0000f008
+#define GLOBAL_OPERATION_ENABLE_RESERVED_0__MASK		0xffffff80
+#define GLOBAL_OPERATION_ENABLE_RESERVED_0__SHIFT		7
+static inline uint32_t GLOBAL_OPERATION_ENABLE_RESERVED_0(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_RESERVED_0__SHIFT) & GLOBAL_OPERATION_ENABLE_RESERVED_0__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__MASK		0x00000040
+#define GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__SHIFT		6
+static inline uint32_t GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_PPU_OP_EN__MASK			0x00000020
+#define GLOBAL_OPERATION_ENABLE_PPU_OP_EN__SHIFT		5
+static inline uint32_t GLOBAL_OPERATION_ENABLE_PPU_OP_EN(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_PPU_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_PPU_OP_EN__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__MASK		0x00000010
+#define GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__SHIFT		4
+static inline uint32_t GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_DPU_OP_EN__MASK			0x00000008
+#define GLOBAL_OPERATION_ENABLE_DPU_OP_EN__SHIFT		3
+static inline uint32_t GLOBAL_OPERATION_ENABLE_DPU_OP_EN(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_DPU_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_DPU_OP_EN__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_CORE_OP_EN__MASK		0x00000004
+#define GLOBAL_OPERATION_ENABLE_CORE_OP_EN__SHIFT		2
+static inline uint32_t GLOBAL_OPERATION_ENABLE_CORE_OP_EN(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_CORE_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_CORE_OP_EN__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_RESERVED_1__MASK		0x00000002
+#define GLOBAL_OPERATION_ENABLE_RESERVED_1__SHIFT		1
+static inline uint32_t GLOBAL_OPERATION_ENABLE_RESERVED_1(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_RESERVED_1__SHIFT) & GLOBAL_OPERATION_ENABLE_RESERVED_1__MASK;
+}
+#define GLOBAL_OPERATION_ENABLE_CNA_OP_EN__MASK			0x00000001
+#define GLOBAL_OPERATION_ENABLE_CNA_OP_EN__SHIFT		0
+static inline uint32_t GLOBAL_OPERATION_ENABLE_CNA_OP_EN(uint32_t val)
+{
+	return ((val) << GLOBAL_OPERATION_ENABLE_CNA_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_CNA_OP_EN__MASK;
+}
+
+#endif /* REGISTERS_XML */
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
new file mode 100644
index 000000000000..7a179731ffe4
--- /dev/null
+++ b/include/uapi/drm/rocket_accel.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Tomeu Vizoso
+ */
+#ifndef _ROCKET_DRM_H_
+#define _ROCKET_DRM_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _ROCKET_DRM_H_ */

-- 
2.45.2

