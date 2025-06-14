Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ED8AD9EAE
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 20:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F67210E146;
	Sat, 14 Jun 2025 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lrQkUdGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEC110E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:09:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250614180913euoutp0133468a0c5203f34282554ee540a2f1bb~I_xwK2Rnq0844108441euoutp01M
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:09:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250614180913euoutp0133468a0c5203f34282554ee540a2f1bb~I_xwK2Rnq0844108441euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749924553;
 bh=M0s7IutSo5tq42gggjm+PQse5ytk+fd/mNMNmSsZmxU=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=lrQkUdGGfSn4L9p4tghlHvXAadrCMQSk30bjjq/TmRrfS25lWL2TQ1UbZzXbX70FA
 ECCihduVRR1Gza5YAfi04keP8hmgRHju7u3oSbayBXOUHsFZSwsvPzS7xFNKKuRTL8
 Yeya0uBZcZJA7xCxuFhltJ6CBcjvBuoZLUrO4blQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70~I_xuur5ty2846328463eucas1p1C;
 Sat, 14 Jun 2025 18:09:11 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250614180909eusmtip19b262cb80a01cdeca9bf3f9a45e0d37a~I_xtF6JoX1758317583eusmtip1p;
 Sat, 14 Jun 2025 18:09:09 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 14 Jun 2025 20:06:10 +0200
Subject: [PATCH v4 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
 Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70
X-EPHeader: CA
X-CMS-RootMailID: 20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70
References: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
 <CGME20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70@eucas1p1.samsung.com>
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
for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.

To cleanly handle the TH1520's specific power requirements in the
generic driver, this patch implements the "driver match data" pattern. A
has_pwrseq flag in a new pvr_soc_data struct is now associated with
thead,th1520-gpu compatible string in the of_device_id table.

At probe time, the driver checks this flag. If true, it calls
devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
probe on failure. In this mode, all power and reset control is delegated
to the pwrseq provider. If the flag is false, the driver skips this
logic and falls back to its standard manual power management. Clock
handles are still acquired directly by this driver in both cases for
other purposes like devfreq.

The runtime PM callbacks, pvr_power_device_resume() and
pvr_power_device_suspend(), are modified to call pwrseq_power_on() and
pwrseq_power_off() respectively when the sequencer is present.  A helper
function, pvr_power_off_sequence_manual(), is introduced to encapsulate
the manual power-down logic.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig      |  1 +
 drivers/gpu/drm/imagination/pvr_device.c | 31 ++++++++++--
 drivers/gpu/drm/imagination/pvr_device.h | 17 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  6 +++
 drivers/gpu/drm/imagination/pvr_power.c  | 82 +++++++++++++++++++++-----------
 5 files changed, 104 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..5f9fff43d6baadc42ebf48d91729bfbf27e06caa 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -11,6 +11,7 @@ config DRM_POWERVR
 	select DRM_SCHED
 	select DRM_GPUVM
 	select FW_LOADER
+	select POWER_SEQUENCING
 	help
 	  Choose this option if you have a system that has an Imagination
 	  Technologies PowerVR (Series 6 or later) or IMG GPU.
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..2f71c9501b157e6e14a6f3033e02db40ce5c74c7 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -23,8 +23,10 @@
 #include <linux/firmware.h>
 #include <linux/gfp.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
@@ -618,6 +620,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	struct device *dev = drm_dev->dev;
 	int err;
 
+	/* Get the platform-specific data based on the compatible string. */
+	pvr_dev->soc_data = of_device_get_match_data(dev);
+
 	/*
 	 * Setup device parameters. We do this first in case other steps
 	 * depend on them.
@@ -631,10 +636,28 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
-	/* Get the reset line for the GPU */
-	err = pvr_device_reset_init(pvr_dev);
-	if (err)
-		return err;
+	/*
+	 * For platforms that require it, get the power sequencer.
+	 * For all others, perform manual reset initialization.
+	 */
+	if (pvr_dev->soc_data && pvr_dev->soc_data->has_pwrseq) {
+		pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
+		if (IS_ERR(pvr_dev->pwrseq)) {
+			/*
+			 * This platform requires a sequencer. If we can't get
+			 * it, we must return the error (including -EPROBE_DEFER
+			 * to wait for the provider to appear)
+			 */
+			return dev_err_probe(
+				dev, PTR_ERR(pvr_dev->pwrseq),
+				"Failed to get required power sequencer\n");
+		}
+	} else {
+		/* This platform does not use a sequencer, init reset manually. */
+		err = pvr_device_reset_init(pvr_dev);
+		if (err)
+			return err;
+	}
 
 	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
 	err = pm_runtime_resume_and_get(dev);
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..5182f06ca7e2071777bdaa9d07757df5ef869fe3 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -37,6 +37,9 @@ struct clk;
 /* Forward declaration from <linux/firmware.h>. */
 struct firmware;
 
+/* Forward declaration from <linux/pwrseq/consumer.h */
+struct pwrseq_desc;
+
 /**
  * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
  * @b: Branch ID.
@@ -57,6 +60,14 @@ struct pvr_fw_version {
 	u16 major, minor;
 };
 
+/*
+ * struct pvr_soc_data - Platform specific data associated with a compatible string.
+ * @has_pwrseq: True if the platform requires power management via the pwrseq framework.
+ */
+struct pvr_soc_data {
+	bool has_pwrseq;
+};
+
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
  */
@@ -98,6 +109,9 @@ struct pvr_device {
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
+	/** @soc_data: Pointer to platform-specific quirk data. */
+	const struct pvr_soc_data *soc_data;
+
 	/** @regs_resource: Resource representing device control registers. */
 	struct resource *regs_resource;
 
@@ -148,6 +162,9 @@ struct pvr_device {
 	 */
 	struct reset_control *reset;
 
+	/** @pwrseq: Pointer to a power sequencer, if one is used. */
+	struct pwrseq_desc *pwrseq;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..7756d85dcbf214279ae242c30b349d20eed7cab2 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1481,6 +1481,11 @@ static void pvr_remove(struct platform_device *plat_dev)
 }
 
 static const struct of_device_id dt_match[] = {
+	{
+		.compatible = "thead,th1520-gpu",
+		.data = &(struct pvr_soc_data){ .has_pwrseq = true },
+	},
+
 	{ .compatible = "img,img-rogue", .data = NULL },
 
 	/*
@@ -1513,4 +1518,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
 MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 41f5d89e78b854cf6993838868a4416a220b490a..7797bbae73c9264d2a490193138ae8636c144af0 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/reset.h>
 #include <linux/timer.h>
 #include <linux/types.h>
@@ -234,6 +235,19 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
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
 int
 pvr_power_device_suspend(struct device *dev)
 {
@@ -252,11 +266,10 @@ pvr_power_device_suspend(struct device *dev)
 			goto err_drm_dev_exit;
 	}
 
-	clk_disable_unprepare(pvr_dev->mem_clk);
-	clk_disable_unprepare(pvr_dev->sys_clk);
-	clk_disable_unprepare(pvr_dev->core_clk);
-
-	err = reset_control_assert(pvr_dev->reset);
+	if (pvr_dev->pwrseq)
+		err = pwrseq_power_off(pvr_dev->pwrseq);
+	else
+		err = pvr_power_off_sequence_manual(pvr_dev);
 
 err_drm_dev_exit:
 	drm_dev_exit(idx);
@@ -276,44 +289,55 @@ pvr_power_device_resume(struct device *dev)
 	if (!drm_dev_enter(drm_dev, &idx))
 		return -EIO;
 
-	err = clk_prepare_enable(pvr_dev->core_clk);
-	if (err)
-		goto err_drm_dev_exit;
+	if (pvr_dev->pwrseq) {
+		err = pwrseq_power_on(pvr_dev->pwrseq);
+		if (err)
+			goto err_drm_dev_exit;
+	} else {
+		err = clk_prepare_enable(pvr_dev->core_clk);
+		if (err)
+			goto err_drm_dev_exit;
 
-	err = clk_prepare_enable(pvr_dev->sys_clk);
-	if (err)
-		goto err_core_clk_disable;
+		err = clk_prepare_enable(pvr_dev->sys_clk);
+		if (err)
+			goto err_core_clk_disable;
 
-	err = clk_prepare_enable(pvr_dev->mem_clk);
-	if (err)
-		goto err_sys_clk_disable;
+		err = clk_prepare_enable(pvr_dev->mem_clk);
+		if (err)
+			goto err_sys_clk_disable;
 
-	/*
-	 * According to the hardware manual, a delay of at least 32 clock
-	 * cycles is required between de-asserting the clkgen reset and
-	 * de-asserting the GPU reset. Assuming a worst-case scenario with
-	 * a very high GPU clock frequency, a delay of 1 microsecond is
-	 * sufficient to ensure this requirement is met across all
-	 * feasible GPU clock speeds.
-	 */
-	udelay(1);
+		/*
+		 * According to the hardware manual, a delay of at least 32 clock
+		 * cycles is required between de-asserting the clkgen reset and
+		 * de-asserting the GPU reset. Assuming a worst-case scenario with
+		 * a very high GPU clock frequency, a delay of 1 microsecond is
+		 * sufficient to ensure this requirement is met across all
+		 * feasible GPU clock speeds.
+		 */
+		udelay(1);
 
-	err = reset_control_deassert(pvr_dev->reset);
-	if (err)
-		goto err_mem_clk_disable;
+		err = reset_control_deassert(pvr_dev->reset);
+		if (err)
+			goto err_mem_clk_disable;
+	}
 
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
+err_power_off:
+	if (pvr_dev->pwrseq)
+		pwrseq_power_off(pvr_dev->pwrseq);
+	else
+		pvr_power_off_sequence_manual(pvr_dev);
+
+	goto err_drm_dev_exit;
 
 err_mem_clk_disable:
 	clk_disable_unprepare(pvr_dev->mem_clk);

-- 
2.34.1

