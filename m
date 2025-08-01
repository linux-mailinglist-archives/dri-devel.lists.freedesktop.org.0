Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29743B18025
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 12:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C17D10E3C9;
	Fri,  1 Aug 2025 10:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="luQphZq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19810E82C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:31:07 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250801103106euoutp0120416e23095bf84ce98414f5fb213a9f~Xnfd5lT2f2763627636euoutp019
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:31:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250801103106euoutp0120416e23095bf84ce98414f5fb213a9f~Xnfd5lT2f2763627636euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1754044266;
 bh=13CbFbRowhmFlbOcL4SBnR0PIDJYNoScTnm59i8nQ4I=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=luQphZq7n6aW8H2TH+l1WBtwJt4y0YDjmkCCqUzBObRB6vkLYKXsF1vkMwj9wVswy
 WiFUwz1sbP/sr1g9RchNvxNwkQEYaKgY7D191/ZKrcqg0Zno2s+WkZRwuTFXNDNjL9
 7yv2Sht3tc5BYnsTYbIYX2Vtb1vwAo3gF7len1R4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250801103105eucas1p21a6f0f33fa2d015c566ff9e23d4c760f~XnfdbmTHH2713827138eucas1p2q;
 Fri,  1 Aug 2025 10:31:05 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250801103104eusmtip1c42a53636e086d4acd0ebef63cf8d024~XnfccHQ_E0400104001eusmtip1h;
 Fri,  1 Aug 2025 10:31:04 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 01 Aug 2025 12:31:01 +0200
Subject: [PATCH v10 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-apr_14_for_sending-v10-1-e85802902a29@samsung.com>
In-Reply-To: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250801103105eucas1p21a6f0f33fa2d015c566ff9e23d4c760f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250801103105eucas1p21a6f0f33fa2d015c566ff9e23d4c760f
X-EPHeader: CA
X-CMS-RootMailID: 20250801103105eucas1p21a6f0f33fa2d015c566ff9e23d4c760f
References: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
 <CGME20250801103105eucas1p21a6f0f33fa2d015c566ff9e23d4c760f@eucas1p2.samsung.com>
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

Update the Imagination PVR DRM driver to leverage the pwrseq framework
for managing the complex power sequence of the GPU on the T-HEAD TH1520
SoC.

To cleanly separate platform-specific logic from the generic driver,
this patch introduces an `init` callback to the `pwr_power_sequence_ops`
struct. This allows for different power management strategies to be
selected at probe time based on the device's compatible string.

A `pvr_device_data` struct, associated with each compatible in the
of_device_id table, points to the appropriate ops table (manual or
pwrseq).

At probe time, the driver now calls the `->init()` op. For pwrseq-based
platforms, this callback calls `devm_pwrseq_get("gpu-power")`, deferring
probe if the sequencer is not yet available. For other platforms, it
falls back to the existing manual clock and reset handling. The runtime
PM callbacks continue to call the appropriate functions via the ops
table.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_device.c |  22 +---
 drivers/gpu/drm/imagination/pvr_device.h |  22 ++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  27 ++++-
 drivers/gpu/drm/imagination/pvr_power.c  | 174 ++++++++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_power.h  |  19 +++-
 5 files changed, 203 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..294b6019b4155bb7fdb7de73ccf7fa8ad867811f 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -23,6 +23,7 @@
 #include <linux/firmware.h>
 #include <linux/gfp.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -121,21 +122,6 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
-static int pvr_device_reset_init(struct pvr_device *pvr_dev)
-{
-	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	struct reset_control *reset;
-
-	reset = devm_reset_control_get_optional_exclusive(drm_dev->dev, NULL);
-	if (IS_ERR(reset))
-		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
-				     "failed to get gpu reset line\n");
-
-	pvr_dev->reset = reset;
-
-	return 0;
-}
-
 /**
  * pvr_device_process_active_queues() - Process all queue related events.
  * @pvr_dev: PowerVR device to check
@@ -618,6 +604,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	struct device *dev = drm_dev->dev;
 	int err;
 
+	/* Get the platform-specific data based on the compatible string. */
+	pvr_dev->device_data = of_device_get_match_data(dev);
+
 	/*
 	 * Setup device parameters. We do this first in case other steps
 	 * depend on them.
@@ -631,8 +620,7 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
-	/* Get the reset line for the GPU */
-	err = pvr_device_reset_init(pvr_dev);
+	err = pvr_dev->device_data->pwr_ops->init(pvr_dev);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..0c970255f90805a569d7d19e35ec5f4ca7f02f7a 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -37,6 +37,9 @@ struct clk;
 /* Forward declaration from <linux/firmware.h>. */
 struct firmware;
 
+/* Forward declaration from <linux/pwrseq/consumer.h> */
+struct pwrseq_desc;
+
 /**
  * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
  * @b: Branch ID.
@@ -57,6 +60,14 @@ struct pvr_fw_version {
 	u16 major, minor;
 };
 
+/**
+ * struct pvr_device_data - Platform specific data associated with a compatible string.
+ * @pwr_ops: Pointer to a structure with platform-specific power functions.
+ */
+struct pvr_device_data {
+	const struct pvr_power_sequence_ops *pwr_ops;
+};
+
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
  */
@@ -98,6 +109,9 @@ struct pvr_device {
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
+	/** @device_data: Pointer to platform-specific data. */
+	const struct pvr_device_data *device_data;
+
 	/** @regs_resource: Resource representing device control registers. */
 	struct resource *regs_resource;
 
@@ -148,6 +162,14 @@ struct pvr_device {
 	 */
 	struct reset_control *reset;
 
+	/**
+	 * @pwrseq: Pointer to a power sequencer, if one is used.
+	 *
+	 * Note: This member should only be accessed when
+	 * IS_ENABLED(CONFIG_POWER_SEQUENCING) is true.
+	 */
+	struct pwrseq_desc *pwrseq;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..af830e565646daf19555197df492438ef48d5e44 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1480,15 +1480,37 @@ static void pvr_remove(struct platform_device *plat_dev)
 	pvr_power_domains_fini(pvr_dev);
 }
 
+static const struct pvr_device_data pvr_device_data_manual = {
+	.pwr_ops = &pvr_power_sequence_ops_manual,
+};
+
+#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
+static const struct pvr_device_data pvr_device_data_pwrseq = {
+	.pwr_ops = &pvr_power_sequence_ops_pwrseq,
+};
+#endif
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "img,img-rogue", .data = NULL },
+#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
+	{
+		.compatible = "thead,th1520-gpu",
+		.data = &pvr_device_data_pwrseq,
+	},
+#endif
+	{
+		.compatible = "img,img-rogue",
+		.data = &pvr_device_data_manual,
+	},
 
 	/*
 	 * This legacy compatible string was introduced early on before the more generic
 	 * "img,img-rogue" was added. Keep it around here for compatibility, but never use
 	 * "img,img-axe" in new devicetrees.
 	 */
-	{ .compatible = "img,img-axe", .data = NULL },
+	{
+		.compatible = "img,img-axe",
+		.data = &pvr_device_data_manual,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
@@ -1513,4 +1535,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
 MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 187a07e0bd9adb2f0713ac2c8e091229f4027354..58e0e812894de19c834e1dfca427208b343eaa1c 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -18,6 +18,9 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
+#include <linux/pwrseq/consumer.h>
+#endif
 #include <linux/reset.h>
 #include <linux/timer.h>
 #include <linux/types.h>
@@ -234,6 +237,132 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+static int pvr_power_init_manual(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct reset_control *reset;
+
+	reset = devm_reset_control_get_optional_exclusive(drm_dev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
+				     "failed to get gpu reset line\n");
+
+	pvr_dev->reset = reset;
+
+	return 0;
+}
+
+static int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	err = clk_prepare_enable(pvr_dev->core_clk);
+	if (err)
+		return err;
+
+	err = clk_prepare_enable(pvr_dev->sys_clk);
+	if (err)
+		goto err_core_clk_disable;
+
+	err = clk_prepare_enable(pvr_dev->mem_clk);
+	if (err)
+		goto err_sys_clk_disable;
+
+	/*
+	 * According to the hardware manual, a delay of at least 32 clock
+	 * cycles is required between de-asserting the clkgen reset and
+	 * de-asserting the GPU reset. Assuming a worst-case scenario with
+	 * a very high GPU clock frequency, a delay of 1 microsecond is
+	 * sufficient to ensure this requirement is met across all
+	 * feasible GPU clock speeds.
+	 */
+	udelay(1);
+
+	err = reset_control_deassert(pvr_dev->reset);
+	if (err)
+		goto err_mem_clk_disable;
+
+	return 0;
+
+err_mem_clk_disable:
+	clk_disable_unprepare(pvr_dev->mem_clk);
+
+err_sys_clk_disable:
+	clk_disable_unprepare(pvr_dev->sys_clk);
+
+err_core_clk_disable:
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	return err;
+}
+
+static int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	err = reset_control_assert(pvr_dev->reset);
+
+	clk_disable_unprepare(pvr_dev->mem_clk);
+	clk_disable_unprepare(pvr_dev->sys_clk);
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	return err;
+}
+
+const struct pvr_power_sequence_ops pvr_power_sequence_ops_manual = {
+	.init = pvr_power_init_manual,
+	.power_on = pvr_power_on_sequence_manual,
+	.power_off = pvr_power_off_sequence_manual,
+};
+
+#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
+static int pvr_power_init_pwrseq(struct pvr_device *pvr_dev)
+{
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+
+	pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
+	if (IS_ERR(pvr_dev->pwrseq)) {
+		/*
+		 * This platform requires a sequencer. If we can't get it, we
+		 * must return the error (including -EPROBE_DEFER to wait for
+		 * the provider to appear)
+		 */
+		return dev_err_probe(dev, PTR_ERR(pvr_dev->pwrseq),
+				     "Failed to get required power sequencer\n");
+	}
+
+	return 0;
+}
+
+static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
+{
+	return pwrseq_power_on(pvr_dev->pwrseq);
+}
+
+static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
+{
+	return pwrseq_power_off(pvr_dev->pwrseq);
+}
+
+const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq = {
+	.init = pvr_power_init_pwrseq,
+	.power_on = pvr_power_on_sequence_pwrseq,
+	.power_off = pvr_power_off_sequence_pwrseq,
+};
+#else /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
+static int pvr_power_sequence_stub(struct pvr_device *pvr_dev)
+{
+	WARN_ONCE(1, "pwrseq support not enabled in kernel config\n");
+	return -EOPNOTSUPP;
+}
+
+const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq = {
+	.init = pvr_power_sequence_stub,
+	.power_on = pvr_power_sequence_stub,
+	.power_off = pvr_power_sequence_stub,
+};
+#endif /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
+
 int
 pvr_power_device_suspend(struct device *dev)
 {
@@ -252,11 +381,7 @@ pvr_power_device_suspend(struct device *dev)
 			goto err_drm_dev_exit;
 	}
 
-	clk_disable_unprepare(pvr_dev->mem_clk);
-	clk_disable_unprepare(pvr_dev->sys_clk);
-	clk_disable_unprepare(pvr_dev->core_clk);
-
-	err = reset_control_assert(pvr_dev->reset);
+	err = pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
 
 err_drm_dev_exit:
 	drm_dev_exit(idx);
@@ -276,53 +401,22 @@ pvr_power_device_resume(struct device *dev)
 	if (!drm_dev_enter(drm_dev, &idx))
 		return -EIO;
 
-	err = clk_prepare_enable(pvr_dev->core_clk);
+	err = pvr_dev->device_data->pwr_ops->power_on(pvr_dev);
 	if (err)
 		goto err_drm_dev_exit;
 
-	err = clk_prepare_enable(pvr_dev->sys_clk);
-	if (err)
-		goto err_core_clk_disable;
-
-	err = clk_prepare_enable(pvr_dev->mem_clk);
-	if (err)
-		goto err_sys_clk_disable;
-
-	/*
-	 * According to the hardware manual, a delay of at least 32 clock
-	 * cycles is required between de-asserting the clkgen reset and
-	 * de-asserting the GPU reset. Assuming a worst-case scenario with
-	 * a very high GPU clock frequency, a delay of 1 microsecond is
-	 * sufficient to ensure this requirement is met across all
-	 * feasible GPU clock speeds.
-	 */
-	udelay(1);
-
-	err = reset_control_deassert(pvr_dev->reset);
-	if (err)
-		goto err_mem_clk_disable;
-
 	if (pvr_dev->fw_dev.booted) {
 		err = pvr_power_fw_enable(pvr_dev);
 		if (err)
-			goto err_reset_assert;
+			goto err_power_off;
 	}
 
 	drm_dev_exit(idx);
 
 	return 0;
 
-err_reset_assert:
-	reset_control_assert(pvr_dev->reset);
-
-err_mem_clk_disable:
-	clk_disable_unprepare(pvr_dev->mem_clk);
-
-err_sys_clk_disable:
-	clk_disable_unprepare(pvr_dev->sys_clk);
-
-err_core_clk_disable:
-	clk_disable_unprepare(pvr_dev->core_clk);
+err_power_off:
+	pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
 
 err_drm_dev_exit:
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
index ada85674a7ca762dcf92df40424230e1c3910342..f7848f106fb97111a82a6727bb2c860deb64fc56 100644
--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -4,11 +4,11 @@
 #ifndef PVR_POWER_H
 #define PVR_POWER_H
 
-#include "pvr_device.h"
-
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 
+struct pvr_device;
+
 int pvr_watchdog_init(struct pvr_device *pvr_dev);
 void pvr_watchdog_fini(struct pvr_device *pvr_dev);
 
@@ -41,4 +41,19 @@ pvr_power_put(struct pvr_device *pvr_dev)
 int pvr_power_domains_init(struct pvr_device *pvr_dev);
 void pvr_power_domains_fini(struct pvr_device *pvr_dev);
 
+/**
+ * struct pvr_power_sequence_ops - Platform specific power sequence operations.
+ * @init: Pointer to the platform-specific initialization function.
+ * @power_on: Pointer to the platform-specific power on function.
+ * @power_off: Pointer to the platform-specific power off function.
+ */
+struct pvr_power_sequence_ops {
+	int (*init)(struct pvr_device *pvr_dev);
+	int (*power_on)(struct pvr_device *pvr_dev);
+	int (*power_off)(struct pvr_device *pvr_dev);
+};
+
+extern const struct pvr_power_sequence_ops pvr_power_sequence_ops_manual;
+extern const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq;
+
 #endif /* PVR_POWER_H */

-- 
2.34.1

