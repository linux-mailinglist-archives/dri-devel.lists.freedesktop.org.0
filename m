Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE1B7D565
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBC010E829;
	Wed, 17 Sep 2025 12:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Cugyvuxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1B10E824
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 12:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758111850; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=efzNOgL8/i0qj5JM/vfzJI22nY5Q2On4qmuSJ7dZPfRzOQWIUFSlWNlPfDPoxNmK1mmTAA+kPKvIy5y/u1Qvj81DHz5zWRUTBvMcfe5I5S0ncRnHHrb2x51HNaYWMKUL0VR+WAm4LYeRXc51E78voAARnGXygtw4tLYNNbjSvS4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758111850;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gjnpJe7OvNQx8BVFibgbqd6R/nPyOkeSAAUQxJENU28=; 
 b=gpVb4xepXc/gHiVDyvXwmm2V10ikLz46KYcbgIJklFqybv7MrfyeTvgkG3XyfXTmkRTySmEUyk/UrcgoAS14udMBYdJL3qkeSFghlRIrUh3WkE/u1hGKRweBVnPQJ6gL1224yFGLqjqFyskLHPVfyMGZ/TQ0PBNYGfDvL9yIIc4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111850; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=gjnpJe7OvNQx8BVFibgbqd6R/nPyOkeSAAUQxJENU28=;
 b=CugyvuxuKr3liHU26ij5S5ZigHC671Xpz/93aDxDgcPoJg+h9vrZER+eeSvnyZ2e
 /+eeo3wyIb3tYdwFZnXjzHFY7+7SHvLB+nUpHd/kQpakRTMRkFDk13ECbg5DnDYRqE2
 2sQcLSee+EBWlW5WZ9tIPfhV0gqo0J9YIK07gDIU=
Received: by mx.zohomail.com with SMTPS id 1758111847514772.0305687016033;
 Wed, 17 Sep 2025 05:24:07 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Sep 2025 14:22:41 +0200
Subject: [PATCH v3 10/10] drm/panthor: add support for MediaTek MFlexGraphics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-mt8196-gpufreq-v3-10-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

MediaTek uses some glue logic to control frequency and power on some of
their GPUs. This is best exposed as a devfreq driver, as it saves us
from having to hardcode OPPs into the device tree, and can be extended
with additional devfreq-y logic like more clever governors that use the
hardware's GPUEB MCU to set frame time targets and power limits.

Add this driver to the panthor subdirectory. It needs to live here as it
needs to call into panthor's devfreq layer to register itself as a
provider.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/Kconfig        |  13 +
 drivers/gpu/drm/panthor/Makefile       |   2 +
 drivers/gpu/drm/panthor/mediatek_mfg.c | 946 +++++++++++++++++++++++++++++++++
 3 files changed, 961 insertions(+)

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b0779e0c434469ddc874ff74fde27..c4d2599c05df9e0e009b8e99b3d29c220269ca0d 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -21,3 +21,16 @@ config DRM_PANTHOR
 
 	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
 	  be supported with the panfrost driver as they are not CSF GPUs.
+
+config DRM_PANTHOR_MEDIATEK_MFG
+	tristate "MediaTek MFlexGraphics Extensions for Panthor"
+	depends on (DRM_PANTHOR && ARCH_MEDIATEK) || COMPILE_TEST
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select PM_DEVFREQ
+	select MTK_GPUEB_MBOX
+	help
+	  Support for power and clock control in Panthor for MediaTek
+	  MFlexGraphics devices, such as the GPU on the MT8196 or MT6991 SoCs.
+
+	  These extensions are required for the GPU to work on these platforms,
+	  as they control the glue logic that powers on the GPU.
diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 02db21748c125688d2ef20ed254b5ebd7ff642e4..e0ebfdfb20bd78e0003c860c86c040746248fb89 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -12,4 +12,6 @@ panthor-y := \
 	panthor_mmu.o \
 	panthor_sched.o
 
+obj-$(CONFIG_DRM_PANTHOR_MEDIATEK_MFG) += mediatek_mfg.o
+
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/mediatek_mfg.c b/drivers/gpu/drm/panthor/mediatek_mfg.c
new file mode 100644
index 0000000000000000000000000000000000000000..1b3220d721e91334522b4e158ac3e262dea19d49
--- /dev/null
+++ b/drivers/gpu/drm/panthor/mediatek_mfg.c
@@ -0,0 +1,946 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for MediaTek MFlexGraphics Devices
+ *
+ * Copyright (C) 2025, Collabora Ltd.
+ */
+
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/devfreq.h>
+#include <linux/iopoll.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+#include "panthor_devfreq.h"
+
+#define GPR_LP_STATE		0x0028
+#define   EB_ON_SUSPEND		0x0
+#define   EB_ON_RESUME		0x1
+#define GPR_IPI_MAGIC		0x34
+
+#define RPC_PWR_CON		0x0504
+#define   PWR_ACK_M		GENMASK(31, 30)
+#define RPC_DUMMY_REG_2		0x0658
+#define RPC_GHPM_CFG0_CON	0x0800
+#define   GHPM_ENABLE_M		BIT(0)
+#define   GHPM_ON_SEQ_M		BIT(2)
+#define RPC_GHPM_RO0_CON	0x09A4
+#define   GHPM_STATE_M		GENMASK(7, 0)
+#define   GHPM_PWR_STATE_M	BIT(16)
+
+#define GF_REG_MAGIC			0x0000
+#define GF_REG_GPU_OPP_IDX		0x0004
+#define GF_REG_STK_OPP_IDX		0x0008
+#define GF_REG_GPU_OPP_NUM		0x000c
+#define GF_REG_STK_OPP_NUM		0x0010
+#define GF_REG_GPU_OPP_SNUM		0x0014
+#define GF_REG_STK_OPP_SNUM		0x0018
+#define GF_REG_POWER_COUNT		0x001c
+#define GF_REG_BUCK_COUNT		0x0020
+#define GF_REG_MTCMOS_COUNT		0x0024
+#define GF_REG_CG_COUNT			0x0028 /* CG = Clock Gate? */
+#define GF_REG_ACTIVE_COUNT		0x002C
+#define GF_REG_TEMP_RAW			0x0030
+#define GF_REG_TEMP_NORM_GPU		0x0034
+#define GF_REG_TEMP_HIGH_GPU		0x0038
+#define GF_REG_TEMP_NORM_STK		0x003C
+#define GF_REG_TEMP_HIGH_STK		0x0040
+#define GF_REG_FREQ_CUR_GPU		0x0044
+#define GF_REG_FREQ_CUR_STK		0x0048
+#define GF_REG_FREQ_OUT_GPU		0x004C /* Guess: actual achieved freq */
+#define GF_REG_FREQ_OUT_STK		0x0050 /* Guess: actual achieved freq */
+#define GF_REG_FREQ_METER_GPU		0x0054 /* Seems unused, always 0 */
+#define GF_REG_FREQ_METER_STK		0x0058 /* Seems unused, always 0 */
+#define GF_REG_VOLT_CUR_GPU		0x005C /* in tens of microvolts */
+#define GF_REG_VOLT_CUR_STK		0x0060 /* in tens of microvolts */
+#define GF_REG_VOLT_CUR_GPU_SRAM	0x0064
+#define GF_REG_VOLT_CUR_STK_SRAM	0x0068
+#define GF_REG_VOLT_CUR_GPU_REG		0x006C /* Seems unused, always 0 */
+#define GF_REG_VOLT_CUR_STK_REG		0x0070 /* Seems unused, always 0 */
+#define GF_REG_VOLT_CUR_GPU_REG_SRAM	0x0074
+#define GF_REG_VOLT_CUR_STK_REG_SRAM	0x0078
+#define GF_REG_PWR_CUR_GPU		0x007C /* in milliwatts */
+#define GF_REG_PWR_CUR_STK		0x0080 /* in milliwatts */
+#define GF_REG_PWR_MAX_GPU		0x0084 /* in milliwatts */
+#define GF_REG_PWR_MAX_STK		0x0088 /* in milliwatts */
+#define GF_REG_PWR_MIN_GPU		0x008C /* in milliwatts */
+#define GF_REG_PWR_MIN_STK		0x0090 /* in milliwatts */
+#define GF_REG_LEAKAGE_RT_GPU		0x0094 /* Unknown */
+#define GF_REG_LEAKAGE_RT_STK		0x0098 /* Unknown */
+#define GF_REG_LEAKAGE_RT_SRAM		0x009C /* Unknown */
+#define GF_REG_LEAKAGE_HT_GPU		0x00A0 /* Unknown */
+#define GF_REG_LEAKAGE_HT_STK		0x00A4 /* Unknown */
+#define GF_REG_LEAKAGE_HT_SRAM		0x00A8 /* Unknown */
+#define GF_REG_VOLT_DAC_LOW_GPU		0x00AC /* Seems unused, always 0 */
+#define GF_REG_VOLT_DAC_LOW_STK		0x00B0 /* Seems unused, always 0 */
+#define GF_REG_OPP_CUR_CEIL		0x00B4
+#define GF_REG_OPP_CUR_FLOOR		0x00B8
+#define GF_REG_OPP_CUR_LIMITER_CEIL	0x00BC
+#define GF_REG_OPP_CUR_LIMITER_FLOOR	0x00C0
+#define GF_REG_OPP_PRIORITY_CEIL	0x00C4
+#define GF_REG_OPP_PRIORITY_FLOOR	0x00C8
+#define GF_REG_PWR_CTL			0x00CC
+#define GF_REG_ACTIVE_SLEEP_CTL		0x00D0
+#define GF_REG_DVFS_STATE		0x00D4
+#define GF_REG_SHADER_PRESENT		0x00D8
+#define GF_REG_ASENSOR_ENABLE		0x00DC
+#define GF_REG_AGING_LOAD		0x00E0
+#define GF_REG_AGING_MARGIN		0x00E4
+#define GF_REG_AVS_ENABLE		0x00E8
+#define GF_REG_AVS_MARGIN		0x00EC
+#define GF_REG_CHIP_TYPE		0x00F0
+#define GF_REG_SB_VERSION		0x00F4
+#define GF_REG_PTP_VERSION		0x00F8
+#define GF_REG_DBG_VERSION		0x00FC
+#define GF_REG_KDBG_VERSION		0x0100
+#define GF_REG_GPM1_MODE		0x0104
+#define GF_REG_GPM3_MODE		0x0108
+#define GF_REG_DFD_MODE			0x010C
+#define GF_REG_DUAL_BUCK		0x0110
+#define GF_REG_SEGMENT_ID		0x0114
+#define GF_REG_POWER_TIME_H		0x0118
+#define GF_REG_POWER_TIME_L		0x011C
+#define GF_REG_PWR_STATUS		0x0120
+#define GF_REG_STRESS_TEST		0x0124
+#define GF_REG_TEST_MODE		0x0128
+#define GF_REG_IPS_MODE			0x012C
+#define GF_REG_TEMP_COMP_MODE		0x0130
+#define GF_REG_HT_TEMP_COMP_MODE	0x0134
+#define GF_REG_PWR_TRACKER_MODE		0x0138
+#define GF_REG_OPP_TABLE_GPU		0x0314
+#define GF_REG_OPP_TABLE_STK		0x09A4
+#define GF_REG_OPP_TABLE_GPU_S		0x1034
+#define GF_REG_OPP_TABLE_STK_S		0x16c4
+#define GF_REG_LIMIT_TABLE		0x1d54
+#define GF_REG_GPM3_TABLE		0x223C
+
+#define MFG_MT8196_E2_ID	0x101
+#define GPUEB_SLEEP_MAGIC	0x55667788UL
+#define GPUEB_SRAM_MAGIC	0xBABADADAUL
+
+#define GPUEB_TIMEOUT_US	10000UL
+#define GPUEB_POLL_US		50
+
+#define MAX_OPP_NUM             70
+
+#define MBOX_MAX_RX_SIZE	32	/* in bytes */
+
+/*
+ * This enum is part of the ABI of the GPUEB firmware. Don't change the
+ * numbering, as you would wreak havoc.
+ */
+enum mtk_mfg_ipi_cmd {
+	CMD_INIT_SHARED_MEM		= 0,
+	CMD_GET_FREQ_BY_IDX		= 1,
+	CMD_GET_POWER_BY_IDX		= 2,
+	CMD_GET_OPPIDX_BY_FREQ		= 3,
+	CMD_GET_LEAKAGE_POWER		= 4,
+	CMD_SET_LIMIT			= 5,
+	CMD_POWER_CONTROL		= 6,
+	CMD_ACTIVE_SLEEP_CONTROL	= 7,
+	CMD_COMMIT			= 8,
+	CMD_DUAL_COMMIT			= 9,
+	CMD_PDCA_CONFIG			= 10,
+	CMD_UPDATE_DEBUG_OPP_INFO	= 11,
+	CMD_SWITCH_LIMIT		= 12,
+	CMD_FIX_TARGET_OPPIDX		= 13,
+	CMD_FIX_DUAL_TARGET_OPPIDX	= 14,
+	CMD_FIX_CUSTOM_FREQ_VOLT	= 15,
+	CMD_FIX_DUAL_CUSTOM_FREQ_VOLT	= 16,
+	CMD_SET_MFGSYS_CONFIG		= 17,
+	CMD_MSSV_COMMIT			= 18,
+	CMD_NUM				= 19,
+};
+
+/*
+ * This struct is part of the ABI of the GPUEB firmware. Changing it, or
+ * reordering fields in it, will break things, so don't do it. Thank you.
+ */
+struct __packed mtk_mfg_ipi_msg {
+	__le32 magic;
+	__le32 cmd;
+	__le32 target;
+	/*
+	 * Downstream relies on the compiler to implicitly add the following
+	 * padding, as it declares the struct as non-packed.
+	 */
+	__le32 reserved;
+	union {
+		s32 __bitwise oppidx;
+		s32 __bitwise return_value;
+		__le32 freq;
+		__le32 volt;
+		__le32 power;
+		__le32 power_state;
+		__le32 mode;
+		__le32 value;
+		struct {
+			__le64 base;
+			__le32 size;
+		} shared_mem;
+		struct {
+			__le32 freq;
+			__le32 volt;
+		} custom;
+		struct {
+			__le32 limiter;
+			s32 __bitwise ceiling_info;
+			s32 __bitwise floor_info;
+		} set_limit;
+		struct {
+			__le32 target;
+			__le32 val;
+		} mfg_cfg;
+		struct {
+			__le32 target;
+			__le32 val;
+		} mssv;
+		struct {
+			s32 __bitwise gpu_oppidx;
+			s32 __bitwise stack_oppidx;
+		} dual_commit;
+		struct {
+			__le32 fgpu;
+			__le32 vgpu;
+			__le32 fstack;
+			__le32 vstack;
+		} dual_custom;
+	} u;
+};
+
+struct __packed mtk_mfg_ipi_sleep_msg {
+	__le32 event;
+	__le32 state;
+	__le32 magic;
+};
+
+/**
+ * struct mtk_mfg_opp_entry - OPP table entry from firmware
+ * @freq_khz: The operating point's frequency in kilohertz
+ * @voltage_core: The operating point's core voltage in tens of microvolts
+ * @voltage_sram: The operating point's SRAM voltage in tens of microvolts
+ * @posdiv: exponent of base 2 for PLL frequency divisor used for this OPP
+ * @voltage_margin: Number of tens of microvolts the voltage can be undershot
+ * @power_mw: estimate of power usage at this operating point, in milliwatts
+ *
+ * This struct is part of the ABI with the EB firmware. Do not change it.
+ */
+struct __packed mtk_mfg_opp_entry {
+	__le32 freq_khz;
+	__le32 voltage_core;
+	__le32 voltage_sram;
+	__le32 posdiv;
+	__le32 voltage_margin;
+	__le32 power_mw;
+};
+
+struct mtk_mfg_mbox {
+	struct mbox_client cl;
+	struct completion rx_done;
+	struct mtk_mfg *mfg;
+	struct mbox_chan *ch;
+	void *rx_data;
+};
+
+struct mtk_mfg {
+	struct platform_device *pdev;
+	struct clk *clk_eb;
+	struct clk_bulk_data *gpu_clks;
+	struct regulator_bulk_data *gpu_regs;
+	void __iomem *rpc;
+	void __iomem *gpr;
+	void __iomem *sram;
+	phys_addr_t sram_phys;
+	unsigned int sram_size;
+	unsigned int ghpm_en_reg;
+	u32 ipi_magic;
+	unsigned int num_opps;
+	unsigned int num_unique_gpu_opps;
+	struct dev_pm_opp_data *gpu_opps;
+	struct dev_pm_opp_data *stack_opps;
+	struct mtk_mfg_mbox *gf_mbox;
+	struct mtk_mfg_mbox *slp_mbox;
+	int last_opp;
+	const struct mtk_mfg_variant *variant;
+};
+
+struct mtk_mfg_variant {
+	const char *const *clk_names;
+	unsigned int num_clks;
+	const char *const *regulator_names;
+	unsigned int num_regulators;
+	int (*init)(struct mtk_mfg *mfg);
+};
+
+static inline void mtk_mfg_update_reg_bits(void __iomem *addr, u32 mask, u32 val)
+{
+	writel((readl(addr) & ~mask) | (val & mask), addr);
+}
+
+static inline unsigned long mtk_mfg_read_gpu_freq(struct mtk_mfg *mfg)
+{
+	return readl(mfg->sram + GF_REG_FREQ_CUR_GPU) * 1000UL;
+}
+
+static int mtk_mfg_eb_on(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	u32 val;
+	int ret;
+
+	/*
+	 * If MFG is already on from e.g. the bootloader, we should skip doing
+	 * the power-on sequence, as it wouldn't work without powering it off
+	 * first.
+	 */
+	if ((readl(mfg->rpc + RPC_PWR_CON) & PWR_ACK_M) == PWR_ACK_M)
+		return 0;
+
+	ret = readl_poll_timeout(mfg->rpc + RPC_GHPM_RO0_CON, val,
+				 !(val & (GHPM_PWR_STATE_M | GHPM_STATE_M)),
+				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "timed out waiting for EB to power on\n");
+		return ret;
+	}
+
+	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M,
+				GHPM_ENABLE_M);
+
+	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M, 0);
+	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M,
+				GHPM_ON_SEQ_M);
+
+	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M, 0);
+
+
+	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
+				 (val & PWR_ACK_M) == PWR_ACK_M,
+				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "timed out waiting for EB power ack, val = 0x%X\n",
+			val);
+		return ret;
+	}
+
+	ret = readl_poll_timeout(mfg->gpr + GPR_LP_STATE, val,
+				 (val == EB_ON_RESUME),
+				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "timed out waiting for EB to resume, status = 0x%X\n", val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_mfg_eb_off(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	struct mtk_mfg_ipi_sleep_msg msg = {
+		.event = 0,
+		.state = 0,
+		.magic = GPUEB_SLEEP_MAGIC
+	};
+	u32 val;
+	int ret;
+
+	ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
+	if (ret < 0) {
+		dev_err(dev, "Cannot send sleep command: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
+				 !(val & PWR_ACK_M), GPUEB_POLL_US,
+				 GPUEB_TIMEOUT_US);
+
+	if (ret)
+		dev_err(dev, "timed out waiting for EB to power off, val=0x%08X\n",
+			val);
+
+	return ret;
+}
+
+static int mtk_mfg_send_ipi(struct mtk_mfg *mfg, struct mtk_mfg_ipi_msg *msg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	int ret;
+
+	msg->magic = mfg->ipi_magic;
+
+	ret = mbox_send_message(mfg->gf_mbox->ch, msg);
+	if (ret < 0) {
+		dev_err(dev, "Cannot send GPUFreq IPI command: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	wait_for_completion(&mfg->gf_mbox->rx_done);
+
+	msg = mfg->gf_mbox->rx_data;
+
+	if (msg->u.return_value < 0) {
+		dev_err(dev, "IPI return: %d\n", msg->u.return_value);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	struct mtk_mfg_ipi_msg msg = {};
+	int ret;
+
+	dev_dbg(dev, "clearing GPUEB sram, 0x%X bytes\n", mfg->sram_size);
+	memset_io(mfg->sram, 0, mfg->sram_size);
+
+	msg.cmd = CMD_INIT_SHARED_MEM;
+	msg.u.shared_mem.base = mfg->sram_phys;
+	msg.u.shared_mem.size = mfg->sram_size;
+
+	ret = mtk_mfg_send_ipi(mfg, &msg);
+	if (ret)
+		return ret;
+
+	if (readl(mfg->sram) != GPUEB_SRAM_MAGIC) {
+		dev_err(dev, "EB did not initialise SRAM correctly\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int mtk_mfg_power_control(struct mtk_mfg *mfg, bool enabled)
+{
+	struct mtk_mfg_ipi_msg msg = {};
+
+	msg.cmd = CMD_POWER_CONTROL;
+	msg.u.power_state = enabled ? 1 : 0;
+
+	return mtk_mfg_send_ipi(mfg, &msg);
+}
+
+static int mtk_mfg_set_oppidx(struct mtk_mfg *mfg, int opp_idx)
+{
+	struct mtk_mfg_ipi_msg msg = {};
+	int ret;
+
+	if (!mfg->gpu_opps || !mfg->stack_opps)
+		return 0;
+
+	if (opp_idx >= mfg->num_opps)
+		return -EINVAL;
+
+	if (mfg->last_opp == opp_idx)
+		return 0;
+
+	msg.cmd = CMD_FIX_TARGET_OPPIDX;
+	msg.u.oppidx = opp_idx;
+
+	ret = mtk_mfg_send_ipi(mfg, &msg);
+	if (ret)
+		return ret;
+
+	mfg->last_opp = opp_idx;
+
+	return 0;
+}
+
+static int mtk_mfg_read_opp_tables(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	struct mtk_mfg_opp_entry e = {};
+	unsigned int i;
+	unsigned long long last_freq;
+
+	mfg->num_opps = readl(mfg->sram + GF_REG_GPU_OPP_NUM);
+	if (mfg->num_opps != readl(mfg->sram + GF_REG_STK_OPP_NUM)) {
+		dev_err(dev, "OPP count of GPU and Stack differ, %u vs. %u\n",
+			mfg->num_opps, readl(mfg->sram + GF_REG_STK_OPP_NUM));
+		return -EINVAL;
+	}
+
+	if (mfg->num_opps > MAX_OPP_NUM || mfg->num_opps == 0) {
+		dev_err(dev, "OPP count (%u) out of range %u >= count > 0\n",
+			mfg->num_opps, MAX_OPP_NUM);
+		return -EINVAL;
+	}
+
+	mfg->gpu_opps = devm_kcalloc(dev, mfg->num_opps,
+				     sizeof(struct dev_pm_opp_data), GFP_KERNEL);
+	if (!mfg->gpu_opps)
+		return -ENOMEM;
+
+	mfg->stack_opps = devm_kcalloc(dev, mfg->num_opps,
+				       sizeof(struct dev_pm_opp_data), GFP_KERNEL);
+	if (!mfg->stack_opps)
+		return -ENOMEM;
+
+	for (i = 0; i < mfg->num_opps; i++) {
+		memcpy_fromio(&e, mfg->sram + GF_REG_OPP_TABLE_GPU + i * sizeof(e),
+			      sizeof(e));
+		if (mem_is_zero(&e, sizeof(e))) {
+			dev_err(dev, "ran into an empty GPU OPP at index %u\n",
+				i);
+			return -EINVAL;
+		}
+		mfg->gpu_opps[i].freq = e.freq_khz * 1000ULL;
+		mfg->gpu_opps[i].u_volt = e.voltage_core * 10;
+
+		if (!last_freq || mfg->gpu_opps[i].freq != last_freq)
+			mfg->num_unique_gpu_opps++;
+
+		last_freq = mfg->gpu_opps[i].freq;
+	}
+
+	/*
+	 * Unused at present; we currently use the same OPP index for both GPU
+	 * core and GPU stack, and the way they contain duplicates seems to
+	 * indicate that this is the way to go.
+	 *
+	 * Might still be useful if we want to expose finer-grained adjustments
+	 * or better information about expected power draw.
+	 */
+	for (i = 0; i < mfg->num_opps; i++) {
+		memcpy_fromio(&e, mfg->sram + GF_REG_OPP_TABLE_STK + i * sizeof(e),
+			      sizeof(e));
+		if (mem_is_zero(&e, sizeof(e))) {
+			dev_err(dev, "ran into an empty GPU OPP at index %u\n",
+				i);
+			return -EINVAL;
+		}
+		mfg->stack_opps[i].freq = e.freq_khz * 1000ULL;
+		mfg->stack_opps[i].u_volt = e.voltage_core * 10;
+	}
+
+	return 0;
+}
+
+static inline bool mtk_mfg_opp_idx_match(struct mtk_mfg *mfg, int idx,
+					 unsigned long rate)
+{
+	if ((idx == mfg->num_opps - 1) && mfg->gpu_opps[idx].freq >= rate)
+		return true;
+
+	if (mfg->gpu_opps[idx].freq >= rate && mfg->gpu_opps[idx + 1].freq < rate)
+		return true;
+
+	return false;
+}
+
+/**
+ * mtk_mfg_get_closest_opp_idx - find OPP index for desired GPU frequency
+ * @mfg: pointer to a &struct mtk_mfg driver instance
+ * @gpu_rate: desired rate of the GPU core in Hz
+ *
+ * Given a desired target frequency for the GPU core, find the index of a
+ * matching OPP, or the next higher OPP if no exact match is found, or the
+ * maximum OPP for frequencies exceeding the maximum OPP's frequency.
+ *
+ * For duplicate OPP entries, chooses the highest OPP index, as in, the one
+ * closest to the next lower frequency OPP.
+ *
+ * Returns -EINVAL on error, or the OPP index on success.
+ */
+static int mtk_mfg_get_closest_opp_idx(struct mtk_mfg *mfg, unsigned long gpu_rate)
+{
+	int r = mfg->num_opps - 1;
+	int l = 0;
+	int m;
+
+	if (!mfg->gpu_opps)
+		return -EINVAL;
+
+	if (mfg->gpu_opps[0].freq <= gpu_rate)
+		return 0;
+
+	while (l <= r) {
+		m = l + (r - l) / 2;
+		if (mtk_mfg_opp_idx_match(mfg, m, gpu_rate))
+			return m;
+		if (mfg->gpu_opps[m].freq >= gpu_rate) /* >= for dupes */
+			l = m + 1;
+		else
+			r = m - 1;
+	}
+
+	return -EINVAL;
+}
+
+static int mtk_mfg_devfreq_target(struct device *dev, unsigned long *freq,
+				  u32 flags)
+{
+	struct mtk_mfg *mfg = dev_get_drvdata(dev);
+	int ret, opp;
+
+	opp = mtk_mfg_get_closest_opp_idx(mfg, *freq);
+	if (opp < 0) {
+		dev_err(dev, "Couldn't get closest OPP: %pe\n", ERR_PTR(opp));
+		return opp;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret =  mtk_mfg_set_oppidx(mfg, opp);
+	if (!ret)
+		*freq = mtk_mfg_read_gpu_freq(mfg);
+	else
+		dev_err(dev, "Couldn't set OPP: %pe\n", ERR_PTR(ret));
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static int mtk_mfg_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct mtk_mfg *mfg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	*freq = mtk_mfg_read_gpu_freq(mfg);
+
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static const char *const mtk_mfg_mt8196_clk_names[] = {
+	"core",
+	"stack0",
+	"stack1",
+};
+
+static const char *const mtk_mfg_mt8196_regulators[] = {
+	"core",
+	"stack",
+	"sram",
+};
+
+static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
+{
+	void __iomem *e2_base;
+
+	e2_base = devm_platform_ioremap_resource_byname(mfg->pdev, "hw-revision");
+	if (IS_ERR(e2_base))
+		return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_base),
+				     "Couldn't get hw-revision register\n");
+
+	if (readl(e2_base) == MFG_MT8196_E2_ID)
+		mfg->ghpm_en_reg = RPC_DUMMY_REG_2;
+	else
+		mfg->ghpm_en_reg = RPC_GHPM_CFG0_CON;
+
+	return 0;
+};
+
+static const struct mtk_mfg_variant mtk_mfg_mt8196_variant = {
+	.clk_names = mtk_mfg_mt8196_clk_names,
+	.num_clks = ARRAY_SIZE(mtk_mfg_mt8196_clk_names),
+	.regulator_names = mtk_mfg_mt8196_regulators,
+	.num_regulators = ARRAY_SIZE(mtk_mfg_mt8196_regulators),
+	.init = mtk_mfg_mt8196_init,
+};
+
+static void mtk_mfg_mbox_rx_callback(struct mbox_client *cl, void *mssg)
+{
+	struct mtk_mfg_mbox *mb = container_of(cl, struct mtk_mfg_mbox, cl);
+
+	if (mb->rx_data)
+		mb->rx_data = memcpy(mb->rx_data, mssg, MBOX_MAX_RX_SIZE);
+	complete(&mb->rx_done);
+}
+
+static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	struct mtk_mfg_mbox *gf;
+	struct mtk_mfg_mbox *slp;
+
+	gf = devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
+	if (!gf)
+		return -ENOMEM;
+
+	slp = devm_kzalloc(dev, sizeof(*slp), GFP_KERNEL);
+	if (!slp)
+		return -ENOMEM;
+
+	gf->mfg = mfg;
+	init_completion(&gf->rx_done);
+	gf->cl.dev = dev;
+	gf->cl.rx_callback = mtk_mfg_mbox_rx_callback;
+	gf->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
+	gf->rx_data = devm_kzalloc(dev, MBOX_MAX_RX_SIZE, GFP_KERNEL);
+	if (!gf->rx_data)
+		return -ENOMEM;
+	gf->ch = mbox_request_channel_byname(&gf->cl, "gpufreq");
+	if (IS_ERR(gf->ch))
+		return PTR_ERR(gf->ch);
+
+	mfg->gf_mbox = gf;
+
+	slp->mfg = mfg;
+	init_completion(&slp->rx_done);
+	slp->cl.dev = dev;
+	slp->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
+	slp->cl.tx_block = true;
+	slp->ch = mbox_request_channel_byname(&slp->cl, "sleep");
+	if (IS_ERR(slp->ch))
+		return PTR_ERR(slp->ch);
+
+	mfg->slp_mbox = slp;
+
+	return 0;
+}
+
+static const struct of_device_id mtk_mfg_of_match[] = {
+	{ .compatible = "mediatek,mt8196-gpufreq", .data = &mtk_mfg_mt8196_variant },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_mfg_of_match);
+
+static int mtk_mfg_probe(struct platform_device *pdev)
+{
+	struct device_node *shmem __free(device_node);
+	struct panthor_devfreq_provider *prov;
+	struct mtk_mfg *mfg;
+	struct device *dev = &pdev->dev;
+	const struct mtk_mfg_variant *data = of_device_get_match_data(dev);
+	struct resource res;
+	int ret, i, j;
+
+	mfg = devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
+	if (!mfg)
+		return -ENOMEM;
+
+	prov = devm_kzalloc(dev, sizeof(*prov), GFP_KERNEL);
+	if (!prov)
+		return -ENOMEM;
+
+	prov->dev = dev;
+	prov->get_cur_freq = mtk_mfg_devfreq_get_cur_freq;
+	prov->target = mtk_mfg_devfreq_target;
+
+	mfg->pdev = pdev;
+	mfg->variant = data;
+
+	dev_set_drvdata(dev, mfg);
+
+	mfg->gpr = devm_platform_ioremap_resource_byname(pdev, "gpr");
+	if (IS_ERR(mfg->gpr))
+		return dev_err_probe(dev, PTR_ERR(mfg->gpr),
+				     "Could not retrieve GPR MMIO registers\n");
+
+	mfg->rpc = devm_platform_ioremap_resource_byname(pdev, "rpc");
+	if (IS_ERR(mfg->rpc))
+		return dev_err_probe(dev, PTR_ERR(mfg->rpc),
+				     "Could not retrieve RPC MMIO registers\n");
+
+	mfg->clk_eb = devm_clk_get(dev, "eb");
+	if (IS_ERR(mfg->clk_eb))
+		return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
+				     "Could not get 'eb' clock\n");
+
+	mfg->gpu_clks = devm_kcalloc(dev, data->num_clks, sizeof(*mfg->gpu_clks),
+				     GFP_KERNEL);
+	if (!mfg->gpu_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num_clks; i++)
+		mfg->gpu_clks[i].id = data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "couldn't get GPU clocks\n");
+
+	mfg->gpu_regs = devm_kcalloc(dev, data->num_regulators,
+				     sizeof(*mfg->gpu_regs), GFP_KERNEL);
+	if (!mfg->gpu_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num_regulators; i++)
+		mfg->gpu_regs[i].supply = data->regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, data->num_regulators, mfg->gpu_regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "couldn't get GPU regulators\n");
+
+	shmem = of_parse_phandle(dev->of_node, "shmem", 0);
+	if (!shmem)
+		return dev_err_probe(dev, -ENODEV, "Could not get 'shmem'\n");
+
+	ret = of_address_to_resource(shmem, 0, &res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get GPUEB shared memory\n");
+
+	mfg->sram = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!mfg->sram)
+		return dev_err_probe(dev, -EADDRNOTAVAIL,
+				     "failed to ioremap GPUEB sram\n");
+	mfg->sram_size = resource_size(&res);
+	mfg->sram_phys = res.start;
+
+	if (data->init) {
+		ret = data->init(mfg);
+		if (ret)
+			return dev_err_probe(dev, ret, "Variant init failed\n");
+	}
+
+	ret = clk_prepare_enable(mfg->clk_eb);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to turn on EB clock\n");
+	mfg->ipi_magic = readl(mfg->gpr + GPR_IPI_MAGIC);
+	/* Downstream does this, don't know why. */
+	writel(0x0, mfg->gpr + GPR_IPI_MAGIC);
+
+	ret = mtk_mfg_init_mbox(mfg);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Couldn't initialise mailbox\n");
+		goto out;
+	}
+
+	clk_disable_unprepare(mfg->clk_eb);
+
+	mfg->last_opp = -1;
+
+	devm_pm_runtime_enable(dev);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to power on MFG\n");
+
+	ret = mtk_mfg_init_shared_mem(mfg);
+	if (ret) {
+		dev_err(dev, "Couldn't initialize EB SRAM: %pe\n", ERR_PTR(ret));
+		goto out;
+	}
+
+	ret = mtk_mfg_read_opp_tables(mfg);
+	if (ret) {
+		dev_err(dev, "Error reading OPP tables from EB: %pe\n",
+			ERR_PTR(ret));
+		goto out;
+	}
+
+	/* gpu_opps may contain duplicates and is sorted the other way */
+	prov->opp_table = devm_kmalloc_array(dev, mfg->num_unique_gpu_opps,
+					     sizeof(*prov->opp_table), GFP_KERNEL);
+	if (!prov->opp_table) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	prov->num_opps = mfg->num_unique_gpu_opps;
+
+	j = 0;
+	for (i = mfg->num_opps - 1; i >= 0 && j < mfg->num_unique_gpu_opps; i--)
+		if ((j == 0) || (mfg->gpu_opps[i].freq != prov->opp_table[j - 1]->freq))
+			prov->opp_table[j++] = &mfg->gpu_opps[i];
+
+	ret = panthor_devfreq_register_provider(prov);
+
+out:
+	pm_runtime_put(dev);
+	return ret;
+}
+
+static int mtk_mfg_suspend(struct device *dev)
+{
+	struct mtk_mfg *mfg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = mtk_mfg_power_control(mfg, false);
+	if (ret) {
+		dev_err(dev, "power_control failed: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+	ret = mtk_mfg_eb_off(mfg);
+	if (ret) {
+		dev_err(dev, "eb_off failed: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+	clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
+	clk_disable_unprepare(mfg->clk_eb);
+	ret = regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
+
+	return ret;
+}
+
+static int mtk_mfg_resume(struct device *dev)
+{
+	struct mtk_mfg *mfg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(mfg->variant->num_regulators,
+				    mfg->gpu_regs);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(mfg->clk_eb);
+	if (ret)
+		goto err_disable_regulators;
+
+	ret = clk_bulk_prepare_enable(mfg->variant->num_clks, mfg->gpu_clks);
+	if (ret)
+		goto err_disable_eb_clk;
+
+	ret = mtk_mfg_eb_on(mfg);
+	if (ret)
+		goto err_disable_clks;
+
+	ret = mtk_mfg_power_control(mfg, true);
+	if (ret)
+		goto err_eb_off;
+
+	return 0;
+
+err_eb_off:
+	mtk_mfg_eb_off(mfg);
+err_disable_clks:
+	clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
+err_disable_eb_clk:
+	clk_disable_unprepare(mfg->clk_eb);
+err_disable_regulators:
+	regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
+
+	return ret;
+}
+
+
+static DEFINE_RUNTIME_DEV_PM_OPS(mtk_mfg_pm_ops,
+				 mtk_mfg_suspend,
+				 mtk_mfg_resume,
+				 NULL);
+
+static struct platform_driver mtk_mfg_driver = {
+	.driver = {
+		.name = "panthor-mtk-mfg",
+		.of_match_table = mtk_mfg_of_match,
+		.pm = pm_ptr(&mtk_mfg_pm_ops),
+	},
+	.probe = mtk_mfg_probe,
+};
+module_platform_driver(mtk_mfg_driver);
+
+MODULE_SOFTDEP("pre: panthor");
+MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MFlexGraphics Extension for Panthor");
+MODULE_LICENSE("GPL");

-- 
2.51.0

