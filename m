Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC516B3D735
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 05:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D43510E2FA;
	Mon,  1 Sep 2025 03:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i0m1TxZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C1A10E0F4;
 Mon,  1 Sep 2025 03:22:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A76D44276;
 Mon,  1 Sep 2025 03:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 525BDC4CEF0;
 Mon,  1 Sep 2025 03:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756696968;
 bh=StUO5VnhJhQRZVLn1enpkS9EijuU3kKL+eiOOBaeQXs=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=i0m1TxZSSnC/OxLH80SkMF9g3QlpfYwVDzF82LT7nXzMTSo1G7+rA3RKdRNDuema+
 DxzZqaGIzOLQPiY6+hfB/SzpuFukiSjXbEDfl+UcPZfiY9TQBctuEchAckEb/UZXx5
 KblOJJnWprBcJ4sLuFxpYsxS20lQ2B53soVrD/K41/KDmL3Gbdk+tENAR1ubt1t19R
 zOAXTINOvtg3h0mgktWxqULhhogV27sagagxl7zrubYQXaA41YCXQavTe8pU78wGEa
 etE34QEBAsqX3+YXiZzc4mpAnbajV0pz6Ik1AeIWWN5ZY0L4cZr3gxreiMmVgy5WkY
 UyMjK4UBvaAPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4059DCA0FFD;
 Mon,  1 Sep 2025 03:22:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 31 Aug 2025 22:22:25 -0500
Subject: [PATCH] drm/nouveau: Support devfreq for Tegra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-gk20a-devfreq-v1-1-c25a8f1169a8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHARtWgC/02OSw7CMBBDr1LNmkiTT5umV0FdJOlMiaAfUqiQE
 HcnohsWXjzLtvyGjXKiDbrqDZn2tKVlLiBPFcSLn0cSaSgMClWNrUYxXhV6MdDOme6CtGOrnQ/
 SSSidNROn12/v3B9cYs8y+zhMCH4jEZdpSo+uitIGW2PQfnBsalahYUtFbBrrWmOUMYzBwf+dr
 jrOKCXGVWIQmeJtiVdhbWDdINa+bbpdQf/5fAHxV/GN4AAAAA==
X-Change-ID: 20250830-gk20a-devfreq-e39f739ab191
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756696967; l=20029;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Xr6hXQu4yzVCR1Bkrqzjln5SWhf5njgdwi7PmzNazsM=;
 b=WJj5Skx/w1G03phy8wC70SdoCzGiH4vX0bhPpB4tjeKRuluNXXs6VFhfkZPnm55D7k38MER4r
 /3EgcC1+B0PAdL8YkrFXegFVChSyVB3RjWEBBM/dNUyhK2in4I+1ciZ
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aaron Kling <webgeek1234@gmail.com>

Using pmu counters for usage stats. This enables dynamic frequency
scaling on all of the currently supported Tegra gpus.

The register offsets are valid for gk20a, gm20b, gp10b, and gv11b. If
support is added for ga10b, this will need rearchitected.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/nouveau/Kconfig                    |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |   2 +
 drivers/gpu/drm/nouveau/nouveau_platform.c         |  20 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild     |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c    |   5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h    |   1 +
 .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c    | 319 +++++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h    |  24 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |   5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c    |   5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h    |   1 +
 12 files changed, 388 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index d1587639ebb04f904d57bcc09933d1e3662594d3..803b9eb234b7b51fa2e55b778a864622ccadbcef 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -28,6 +28,7 @@ config DRM_NOUVEAU
 	select THERMAL if ACPI && X86
 	select ACPI_VIDEO if ACPI && X86
 	select SND_HDA_COMPONENT if SND_HDA_CORE
+	select PM_DEVFREQ if ARCH_TEGRA
 	help
 	  Choose this option for open-source NVIDIA support.
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
index 22f74fc88cd7554334e68bdf2eb72c31848e0304..57bc542780bbe5ffc5c30f18c139cb099b6d07ed 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -9,6 +9,8 @@ struct nvkm_device_tegra {
 	struct nvkm_device device;
 	struct platform_device *pdev;
 
+	void __iomem *regs;
+
 	struct reset_control *rst;
 	struct clk *clk;
 	struct clk *clk_ref;
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index a5ce8eb4a3be7a20988ea5515e8b58b1801e5842..164aaf09112b6617da2d42899d0fbf9ff75fc4af 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -21,6 +21,8 @@
  */
 #include "nouveau_platform.h"
 
+#include <nvkm/subdev/clk/gk20a_devfreq.h>
+
 static int nouveau_platform_probe(struct platform_device *pdev)
 {
 	const struct nvkm_device_tegra_func *func;
@@ -43,6 +45,21 @@ static void nouveau_platform_remove(struct platform_device *pdev)
 	nouveau_drm_device_remove(drm);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int nouveau_suspend(struct device *dev)
+{
+	return gk20a_devfreq_suspend(dev);
+}
+
+static int nouveau_resume(struct device *dev)
+{
+	return gk20a_devfreq_resume(dev);
+}
+
+static SIMPLE_DEV_PM_OPS(nouveau_pm_ops, nouveau_suspend,
+			 nouveau_resume);
+#endif
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct nvkm_device_tegra_func gk20a_platform_data = {
 	.iommu_bit = 34,
@@ -84,6 +101,9 @@ struct platform_driver nouveau_platform_driver = {
 	.driver = {
 		.name = "nouveau",
 		.of_match_table = of_match_ptr(nouveau_platform_match),
+#ifdef CONFIG_PM_SLEEP
+		.pm = &nouveau_pm_ops,
+#endif
 	},
 	.probe = nouveau_platform_probe,
 	.remove = nouveau_platform_remove,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 114e50ca18270c90c32ad85f8bd8469740a950cb..03aa6f09ec89345225c302f7e5943055d9b715ba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -259,6 +259,10 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 	tdev->func = func;
 	tdev->pdev = pdev;
 
+	tdev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(tdev->regs))
+		return PTR_ERR(tdev->regs);
+
 	if (func->require_vdd) {
 		tdev->vdd = devm_regulator_get(&pdev->dev, "vdd");
 		if (IS_ERR(tdev->vdd)) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild
index 9fe394740f568909de71a8c420cc8b6d8dc2235f..be8f3283ee16f88842e3f0444a63e69cb149d2e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild
@@ -11,6 +11,7 @@ nvkm-y += nvkm/subdev/clk/gk104.o
 nvkm-y += nvkm/subdev/clk/gk20a.o
 nvkm-y += nvkm/subdev/clk/gm20b.o
 nvkm-y += nvkm/subdev/clk/gp10b.o
+nvkm-$(CONFIG_PM_DEVFREQ) += nvkm/subdev/clk/gk20a_devfreq.o
 
 nvkm-y += nvkm/subdev/clk/pllnv04.o
 nvkm-y += nvkm/subdev/clk/pllgt215.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
index d573fb0917fc535437a0b81bc3d88c56b036fb22..65f5d0f1f3bfcf88df68db32a3764e0868bcd6e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
@@ -23,6 +23,7 @@
  *
  */
 #include "priv.h"
+#include "gk20a_devfreq.h"
 #include "gk20a.h"
 
 #include <core/tegra.h>
@@ -589,6 +590,10 @@ gk20a_clk_init(struct nvkm_clk *base)
 		return ret;
 	}
 
+	ret = gk20a_devfreq_init(base, &clk->devfreq);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
index 286413ff4a9ec7f2273c9446ac7a15eb1a843aeb..ea5b0bab4ccec6e4999531593c2cb03de7599c74 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
@@ -118,6 +118,7 @@ struct gk20a_clk {
 	const struct gk20a_clk_pllg_params *params;
 	struct gk20a_pll pll;
 	u32 parent_rate;
+	struct gk20a_devfreq *devfreq;
 
 	u32 (*div_to_pl)(u32);
 	u32 (*pl_to_div)(u32);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c
new file mode 100644
index 0000000000000000000000000000000000000000..8362b1d9cc1fd7aeceba04f83b28d0d73db467dd
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: MIT
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+
+#include <drm/drm_managed.h>
+
+#include <subdev/clk.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_chan.h"
+#include "priv.h"
+#include "gk20a_devfreq.h"
+#include "gk20a.h"
+#include "gp10b.h"
+
+#define PMU_BUSY_CYCLES_NORM_MAX		1000U
+
+#define PWR_PMU_IDLE_COUNTER_TOTAL		0U
+#define PWR_PMU_IDLE_COUNTER_BUSY		4U
+
+#define PWR_PMU_IDLE_COUNT_REG_OFFSET		0x0010A508U
+#define PWR_PMU_IDLE_COUNT_REG_SIZE		16U
+#define PWR_PMU_IDLE_COUNT_MASK			0x7FFFFFFFU
+#define PWR_PMU_IDLE_COUNT_RESET_VALUE		(0x1U << 31U)
+
+#define PWR_PMU_IDLE_INTR_REG_OFFSET		0x0010A9E8U
+#define PWR_PMU_IDLE_INTR_ENABLE_VALUE		0U
+
+#define PWR_PMU_IDLE_INTR_STATUS_REG_OFFSET	0x0010A9ECU
+#define PWR_PMU_IDLE_INTR_STATUS_MASK		0x00000001U
+#define PWR_PMU_IDLE_INTR_STATUS_RESET_VALUE	0x1U
+
+#define PWR_PMU_IDLE_THRESHOLD_REG_OFFSET	0x0010A8A0U
+#define PWR_PMU_IDLE_THRESHOLD_REG_SIZE		4U
+#define PWR_PMU_IDLE_THRESHOLD_MAX_VALUE	0x7FFFFFFFU
+
+#define PWR_PMU_IDLE_CTRL_REG_OFFSET		0x0010A50CU
+#define PWR_PMU_IDLE_CTRL_REG_SIZE		16U
+#define PWR_PMU_IDLE_CTRL_VALUE_MASK		0x3U
+#define PWR_PMU_IDLE_CTRL_VALUE_BUSY		0x2U
+#define PWR_PMU_IDLE_CTRL_VALUE_ALWAYS		0x3U
+#define PWR_PMU_IDLE_CTRL_FILTER_MASK		(0x1U << 2)
+#define PWR_PMU_IDLE_CTRL_FILTER_DISABLED	0x0U
+
+#define PWR_PMU_IDLE_MASK_REG_OFFSET		0x0010A504U
+#define PWR_PMU_IDLE_MASK_REG_SIZE		16U
+#define PWM_PMU_IDLE_MASK_GR_ENABLED		0x1U
+#define PWM_PMU_IDLE_MASK_CE_2_ENABLED		0x200000U
+
+/**
+ * struct gk20a_devfreq - Device frequency management
+ */
+struct gk20a_devfreq {
+	/** @devfreq: devfreq device. */
+	struct devfreq *devfreq;
+
+	/** @regs: Device registers. */
+	void __iomem *regs;
+
+	/** @gov_data: Governor data. */
+	struct devfreq_simple_ondemand_data gov_data;
+
+	/** @busy_time: Busy time. */
+	ktime_t busy_time;
+
+	/** @total_time: Total time. */
+	ktime_t total_time;
+
+	/** @time_last_update: Last update time. */
+	ktime_t time_last_update;
+};
+
+static struct gk20a_devfreq *dev_to_gk20a_devfreq(struct device *dev)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct nvkm_subdev *subdev = nvkm_device_subdev(drm->nvkm, NVKM_SUBDEV_CLK, 0);
+	struct nvkm_clk *base = nvkm_clk(subdev);
+
+	switch (drm->nvkm->chipset) {
+	case 0x13b: return gp10b_clk(base)->devfreq; break;
+	default: return gk20a_clk(base)->devfreq; break;
+	}
+}
+
+static void gk20a_pmu_init_perfmon_counter(struct gk20a_devfreq *gdevfreq)
+{
+	u32 data;
+
+	// Set pmu idle intr status bit on total counter overflow
+	writel(PWR_PMU_IDLE_INTR_ENABLE_VALUE,
+	       gdevfreq->regs + PWR_PMU_IDLE_INTR_REG_OFFSET);
+
+	writel(PWR_PMU_IDLE_THRESHOLD_MAX_VALUE,
+	       gdevfreq->regs + PWR_PMU_IDLE_THRESHOLD_REG_OFFSET +
+	       (PWR_PMU_IDLE_COUNTER_TOTAL * PWR_PMU_IDLE_THRESHOLD_REG_SIZE));
+
+	// Setup counter for total cycles
+	data = readl(gdevfreq->regs + PWR_PMU_IDLE_CTRL_REG_OFFSET +
+		     (PWR_PMU_IDLE_COUNTER_TOTAL * PWR_PMU_IDLE_CTRL_REG_SIZE));
+	data &= ~(PWR_PMU_IDLE_CTRL_VALUE_MASK | PWR_PMU_IDLE_CTRL_FILTER_MASK);
+	data |= PWR_PMU_IDLE_CTRL_VALUE_ALWAYS | PWR_PMU_IDLE_CTRL_FILTER_DISABLED;
+	writel(data, gdevfreq->regs + PWR_PMU_IDLE_CTRL_REG_OFFSET +
+		     (PWR_PMU_IDLE_COUNTER_TOTAL * PWR_PMU_IDLE_CTRL_REG_SIZE));
+
+	// Setup counter for busy cycles
+	writel(PWM_PMU_IDLE_MASK_GR_ENABLED | PWM_PMU_IDLE_MASK_CE_2_ENABLED,
+	       gdevfreq->regs + PWR_PMU_IDLE_MASK_REG_OFFSET +
+	       (PWR_PMU_IDLE_COUNTER_BUSY * PWR_PMU_IDLE_MASK_REG_SIZE));
+
+	data = readl(gdevfreq->regs + PWR_PMU_IDLE_CTRL_REG_OFFSET +
+		     (PWR_PMU_IDLE_COUNTER_BUSY * PWR_PMU_IDLE_CTRL_REG_SIZE));
+	data &= ~(PWR_PMU_IDLE_CTRL_VALUE_MASK | PWR_PMU_IDLE_CTRL_FILTER_MASK);
+	data |= PWR_PMU_IDLE_CTRL_VALUE_BUSY | PWR_PMU_IDLE_CTRL_FILTER_DISABLED;
+	writel(data, gdevfreq->regs + PWR_PMU_IDLE_CTRL_REG_OFFSET +
+		     (PWR_PMU_IDLE_COUNTER_BUSY * PWR_PMU_IDLE_CTRL_REG_SIZE));
+}
+
+static u32 gk20a_pmu_read_idle_counter(struct gk20a_devfreq *gdevfreq, u32 counter_id)
+{
+	u32 ret;
+
+	ret = readl(gdevfreq->regs + PWR_PMU_IDLE_COUNT_REG_OFFSET +
+		    (counter_id * PWR_PMU_IDLE_COUNT_REG_SIZE));
+
+	return ret & PWR_PMU_IDLE_COUNT_MASK;
+}
+
+static void gk20a_pmu_reset_idle_counter(struct gk20a_devfreq *gdevfreq, u32 counter_id)
+{
+	writel(PWR_PMU_IDLE_COUNT_RESET_VALUE, gdevfreq->regs + PWR_PMU_IDLE_COUNT_REG_OFFSET +
+					       (counter_id * PWR_PMU_IDLE_COUNT_REG_SIZE));
+}
+
+static u32 gk20a_pmu_read_idle_intr_status(struct gk20a_devfreq *gdevfreq)
+{
+	u32 ret;
+
+	ret = readl(gdevfreq->regs + PWR_PMU_IDLE_INTR_STATUS_REG_OFFSET);
+
+	return ret & PWR_PMU_IDLE_INTR_STATUS_MASK;
+}
+
+static void gk20a_pmu_clear_idle_intr_status(struct gk20a_devfreq *gdevfreq)
+{
+	writel(PWR_PMU_IDLE_INTR_STATUS_RESET_VALUE,
+	       gdevfreq->regs + PWR_PMU_IDLE_INTR_STATUS_REG_OFFSET);
+}
+
+static void gk20a_devfreq_update_utilization(struct gk20a_devfreq *gdevfreq)
+{
+	ktime_t now, last;
+	u64 busy_cycles, total_cycles;
+	u32 norm, intr_status;
+
+	now = ktime_get();
+	last = gdevfreq->time_last_update;
+	gdevfreq->total_time = ktime_us_delta(now, last);
+
+	busy_cycles = gk20a_pmu_read_idle_counter(gdevfreq, PWR_PMU_IDLE_COUNTER_BUSY);
+	total_cycles = gk20a_pmu_read_idle_counter(gdevfreq, PWR_PMU_IDLE_COUNTER_TOTAL);
+	intr_status = gk20a_pmu_read_idle_intr_status(gdevfreq);
+
+	gk20a_pmu_reset_idle_counter(gdevfreq, PWR_PMU_IDLE_COUNTER_BUSY);
+	gk20a_pmu_reset_idle_counter(gdevfreq, PWR_PMU_IDLE_COUNTER_TOTAL);
+
+	if (intr_status != 0UL) {
+		norm = PMU_BUSY_CYCLES_NORM_MAX;
+		gk20a_pmu_clear_idle_intr_status(gdevfreq);
+	} else if (total_cycles == 0ULL || busy_cycles > total_cycles) {
+		norm = PMU_BUSY_CYCLES_NORM_MAX;
+	} else {
+		norm = (u32)(busy_cycles * PMU_BUSY_CYCLES_NORM_MAX
+				/ total_cycles);
+	}
+
+	gdevfreq->busy_time = (gdevfreq->total_time * norm) / PMU_BUSY_CYCLES_NORM_MAX;
+	gdevfreq->time_last_update = now;
+}
+
+static int gk20a_devfreq_target(struct device *dev, unsigned long *freq,
+				  u32 flags)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct nvkm_subdev *subdev = nvkm_device_subdev(drm->nvkm, NVKM_SUBDEV_CLK, 0);
+	struct nvkm_clk *base = nvkm_clk(subdev);
+	struct nvkm_pstate *pstates = base->func->pstates;
+	int nr_pstates = base->func->nr_pstates;
+	int i, ret;
+
+	for (i = 0; i < nr_pstates - 1; i++)
+		if (pstates[i].base.domain[nv_clk_src_gpc] * GK20A_CLK_GPC_MDIV >= *freq)
+			break;
+
+	ret = nvkm_clk_ustate(base, pstates[i].pstate, 0);
+	ret |= nvkm_clk_ustate(base, pstates[i].pstate, 1);
+	if (ret) {
+		nvkm_error(subdev, "cannot update clock\n");
+		return ret;
+	}
+
+	*freq = pstates[i].base.domain[nv_clk_src_gpc] * GK20A_CLK_GPC_MDIV;
+
+	return 0;
+}
+
+static int gk20a_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct nvkm_subdev *subdev = nvkm_device_subdev(drm->nvkm, NVKM_SUBDEV_CLK, 0);
+	struct nvkm_clk *base = nvkm_clk(subdev);
+
+	*freq = nvkm_clk_read(base, nv_clk_src_gpc) * GK20A_CLK_GPC_MDIV;
+
+	return 0;
+}
+
+static void gk20a_devfreq_reset(struct gk20a_devfreq *gdevfreq)
+{
+	gk20a_pmu_reset_idle_counter(gdevfreq, PWR_PMU_IDLE_COUNTER_BUSY);
+	gk20a_pmu_reset_idle_counter(gdevfreq, PWR_PMU_IDLE_COUNTER_TOTAL);
+	gk20a_pmu_clear_idle_intr_status(gdevfreq);
+
+	gdevfreq->busy_time = 0;
+	gdevfreq->total_time = 0;
+	gdevfreq->time_last_update = ktime_get();
+}
+
+static int gk20a_devfreq_get_dev_status(struct device *dev,
+					struct devfreq_dev_status *status)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct gk20a_devfreq *gdevfreq = dev_to_gk20a_devfreq(dev);
+
+	gk20a_devfreq_get_cur_freq(dev, &status->current_frequency);
+
+	gk20a_devfreq_update_utilization(gdevfreq);
+
+	status->busy_time = ktime_to_ns(gdevfreq->busy_time);
+	status->total_time = ktime_to_ns(gdevfreq->total_time);
+
+	gk20a_devfreq_reset(gdevfreq);
+
+	NV_DEBUG(drm, "busy %lu total %lu %lu %% freq %lu MHz\n",
+		 status->busy_time, status->total_time,
+		 status->busy_time / (status->total_time / 100),
+		 status->current_frequency / 1000 / 1000);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile gk20a_devfreq_profile = {
+	.timer = DEVFREQ_TIMER_DELAYED,
+	.polling_ms = 50,
+	.target = gk20a_devfreq_target,
+	.get_cur_freq = gk20a_devfreq_get_cur_freq,
+	.get_dev_status = gk20a_devfreq_get_dev_status,
+};
+
+int gk20a_devfreq_init(struct nvkm_clk *base, struct gk20a_devfreq **gdevfreq)
+{
+	struct nvkm_device *device = base->subdev.device;
+	struct nouveau_drm *drm = dev_get_drvdata(device->dev);
+	struct nvkm_device_tegra *tdev = device->func->tegra(device);
+	struct nvkm_pstate *pstates = base->func->pstates;
+	int nr_pstates = base->func->nr_pstates;
+	struct gk20a_devfreq *new_gdevfreq;
+	int i;
+
+	new_gdevfreq = drmm_kzalloc(drm->dev, sizeof(struct gk20a_devfreq), GFP_KERNEL);
+	if (!new_gdevfreq)
+		return -ENOMEM;
+
+	new_gdevfreq->regs = tdev->regs;
+
+	for (i = 0; i < nr_pstates; i++)
+		dev_pm_opp_add(base->subdev.device->dev,
+			       pstates[i].base.domain[nv_clk_src_gpc] * GK20A_CLK_GPC_MDIV, 0);
+
+	gk20a_pmu_init_perfmon_counter(new_gdevfreq);
+	gk20a_devfreq_reset(new_gdevfreq);
+
+	gk20a_devfreq_profile.initial_freq =
+		nvkm_clk_read(base, nv_clk_src_gpc) * GK20A_CLK_GPC_MDIV;
+
+	new_gdevfreq->gov_data.upthreshold = 45;
+	new_gdevfreq->gov_data.downdifferential = 5;
+
+	new_gdevfreq->devfreq = devm_devfreq_add_device(device->dev,
+							&gk20a_devfreq_profile,
+							DEVFREQ_GOV_SIMPLE_ONDEMAND,
+							&new_gdevfreq->gov_data);
+	if (IS_ERR(new_gdevfreq->devfreq))
+		return PTR_ERR(new_gdevfreq->devfreq);
+
+	*gdevfreq = new_gdevfreq;
+
+	return 0;
+}
+
+int gk20a_devfreq_resume(struct device *dev)
+{
+	struct gk20a_devfreq *gdevfreq = dev_to_gk20a_devfreq(dev);
+
+	if (!gdevfreq || !gdevfreq->devfreq)
+		return 0;
+
+	return devfreq_resume_device(gdevfreq->devfreq);
+}
+
+int gk20a_devfreq_suspend(struct device *dev)
+{
+	struct gk20a_devfreq *gdevfreq = dev_to_gk20a_devfreq(dev);
+
+	if (!gdevfreq || !gdevfreq->devfreq)
+		return 0;
+
+	return devfreq_suspend_device(gdevfreq->devfreq);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h
new file mode 100644
index 0000000000000000000000000000000000000000..5b7ca8a7a5cdc050872743ea940efef6f033b7b9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __GK20A_DEVFREQ_H__
+#define __GK20A_DEVFREQ_H__
+
+#include <linux/devfreq.h>
+
+struct gk20a_devfreq;
+
+#if defined(CONFIG_PM_DEVFREQ)
+int gk20a_devfreq_init(struct nvkm_clk *base, struct gk20a_devfreq **devfreq);
+
+int gk20a_devfreq_resume(struct device *dev);
+int gk20a_devfreq_suspend(struct device *dev);
+#else
+static inline int gk20a_devfreq_init(struct nvkm_clk *base, struct gk20a_devfreq **devfreq)
+{
+	return 0;
+}
+
+static inline int gk20a_devfreq_resume(struct device dev) { return 0; }
+static inline int gk20a_devfreq_suspend(struct device *dev) { return 0; }
+#endif /* CONFIG_PM_DEVFREQ */
+
+#endif /* __GK20A_DEVFREQ_H__ */
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
index 7c33542f651b2ad011967a1e6ca8003b7b2e6fc5..fa8ca53acbd1a298c26444f23570bd4ca039d328 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
@@ -27,6 +27,7 @@
 #include <core/tegra.h>
 
 #include "priv.h"
+#include "gk20a_devfreq.h"
 #include "gk20a.h"
 
 #define GPCPLL_CFG_SYNC_MODE	BIT(2)
@@ -869,6 +870,10 @@ gm20b_clk_init(struct nvkm_clk *base)
 		return ret;
 	}
 
+	ret = gk20a_devfreq_init(base, &clk->devfreq);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
index a0be53ffeb4479e4c229bd6bde86bb6bdb082b56..492b62c0ee9633c08538330f1106cf01d6b62771 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
@@ -5,6 +5,7 @@
 #include <core/tegra.h>
 
 #include "priv.h"
+#include "gk20a_devfreq.h"
 #include "gk20a.h"
 #include "gp10b.h"
 
@@ -23,6 +24,10 @@ gp10b_clk_init(struct nvkm_clk *base)
 		return ret;
 	}
 
+	ret = gk20a_devfreq_init(base, &clk->devfreq);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
index 2f65a921a426e3f6339a31e964397f6eefa50250..1dd1c550484be7c643e86a6105d7282c536fe7ed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
@@ -5,6 +5,7 @@
 struct gp10b_clk {
 	/* currently applied parameters */
 	struct nvkm_clk base;
+	struct gk20a_devfreq *devfreq;
 	struct clk *clk;
 	u32 rate;
 

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250830-gk20a-devfreq-e39f739ab191
prerequisite-change-id: 20250822-gp10b-reclock-77bf36005a86:v2
prerequisite-patch-id: c4a76f247e85ffbcb8b7e1c4736764796754c3b4

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


