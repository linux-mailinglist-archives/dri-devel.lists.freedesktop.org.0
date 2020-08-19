Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23617249C4A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D326E25E;
	Wed, 19 Aug 2020 11:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A666E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0C2822CB3;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837584;
 bh=J5n0KkLfDIjQPKx0LxQ/37LHhOeQP5oxBGbt5NVuggU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ilw+LVzJYMepqOK+MAYnbkm68RIz9gS5ZZuNYgODVVgwTRonYHaK06BdelGNR6zNs
 FistKj0nbvXxkCB4cFyxAZIJZdIWrSpYnMA7suIBzZKtV12JBdqiN2o/H0Gf5qIDYK
 lRICgRlleoowYcifIhkd1xq5LLpE38OpDVI56gfw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Euc2-GA; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 43/49] staging: hikey9xx/gpu: get rid of DRM_HISI_KIRIN970
Date: Wed, 19 Aug 2020 13:46:11 +0200
Message-Id: <0c8071a5a6245e36bc67458b38f6db8a2d0f4426.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Liuyao An <anliuyao@huawei.com>,
 Rongrong Zou <zourongrong@gmail.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are lots of ifdefs checking if the SoC version is
960 or 970. Replace them all by runtime definitions.

With that, the same DRM driver should work with both versions.

The behavior will dynamically change depending on the
OF compatible strings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/Makefile         |   1 +
 drivers/staging/hikey9xx/gpu/kirin960_defs.c  | 378 ++++++++++
 .../staging/hikey9xx/gpu/kirin960_dpe_reg.h   |  21 -
 drivers/staging/hikey9xx/gpu/kirin970_defs.c  | 381 ++++++++++
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   |  23 -
 .../hikey9xx/gpu}/kirin9xx_dpe.h              |  30 +-
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     |  29 +-
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.h     |  21 +
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.c   |   4 +-
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.h   |   3 +-
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   | 174 ++---
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c | 697 +-----------------
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        | 275 +++----
 drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c   |   6 +-
 14 files changed, 1074 insertions(+), 969 deletions(-)
 create mode 100644 drivers/staging/hikey9xx/gpu/kirin960_defs.c
 create mode 100644 drivers/staging/hikey9xx/gpu/kirin970_defs.c
 rename drivers/{gpu/drm/hisilicon/kirin => staging/hikey9xx/gpu}/kirin9xx_dpe.h (99%)

diff --git a/drivers/staging/hikey9xx/gpu/Makefile b/drivers/staging/hikey9xx/gpu/Makefile
index 9df7894ccb42..9177c3006b14 100644
--- a/drivers/staging/hikey9xx/gpu/Makefile
+++ b/drivers/staging/hikey9xx/gpu/Makefile
@@ -2,6 +2,7 @@
 kirin9xx-drm-y := kirin9xx_drm_drv.o \
 		  kirin9xx_drm_dss.o \
 		  kirin9xx_drm_dpe_utils.o \
+		  kirin970_defs.o kirin960_defs.o \
 		  kirin9xx_drm_overlay_utils.o
 
 obj-$(CONFIG_DRM_HISI_KIRIN9XX) += kirin9xx-drm.o kirin9xx_pwm.o
diff --git a/drivers/staging/hikey9xx/gpu/kirin960_defs.c b/drivers/staging/hikey9xx/gpu/kirin960_defs.c
new file mode 100644
index 000000000000..720f4f80a518
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/kirin960_defs.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2008-2011, Hisilicon Tech. Co., Ltd. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "kirin9xx_drm_dpe_utils.h"
+#include "kirin9xx_drm_drv.h"
+#include "kirin960_dpe_reg.h"
+
+/*
+ * dss_chn_idx
+ * DSS_RCHN_D2 = 0,	DSS_RCHN_D3,	DSS_RCHN_V0,	DSS_RCHN_G0,	DSS_RCHN_V1,
+ * DSS_RCHN_G1,	DSS_RCHN_D0,	DSS_RCHN_D1,	DSS_WCHN_W0,	DSS_WCHN_W1,
+ * DSS_RCHN_V2,   DSS_WCHN_W2,
+ */
+static const u32 kirin960_g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
+	/* D0 */
+	{
+	MIF_CH0_OFFSET,
+	AIF0_CH0_OFFSET,
+	AIF1_CH0_OFFSET,
+	MCTL_CTL_MUTEX_RCH0,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD0_DBG,
+	DSS_RCH_D0_DMA_OFFSET,
+	DSS_RCH_D0_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_RCH_D0_CSC_OFFSET,
+	},
+
+	/* D1 */
+	{
+	MIF_CH1_OFFSET,
+	AIF0_CH1_OFFSET,
+	AIF1_CH1_OFFSET,
+	MCTL_CTL_MUTEX_RCH1,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD1_DBG,
+	DSS_RCH_D1_DMA_OFFSET,
+	DSS_RCH_D1_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_RCH_D1_CSC_OFFSET,
+	},
+
+	/* V0 */
+	{
+	MIF_CH2_OFFSET,
+	AIF0_CH2_OFFSET,
+	AIF1_CH2_OFFSET,
+	MCTL_CTL_MUTEX_RCH2,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD2_DBG,
+	DSS_RCH_VG0_DMA_OFFSET,
+	DSS_RCH_VG0_DFC_OFFSET,
+	DSS_RCH_VG0_SCL_OFFSET,
+	DSS_RCH_VG0_SCL_LUT_OFFSET,
+	DSS_RCH_VG0_ARSR_OFFSET,
+	DSS_RCH_VG0_ARSR_LUT_OFFSET,
+	DSS_RCH_VG0_POST_CLIP_OFFSET,
+	DSS_RCH_VG0_PCSC_OFFSET,
+	DSS_RCH_VG0_CSC_OFFSET,
+	},
+
+	/* G0 */
+	{
+	MIF_CH3_OFFSET,
+	AIF0_CH3_OFFSET,
+	AIF1_CH3_OFFSET,
+	MCTL_CTL_MUTEX_RCH3,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD3_DBG,
+	DSS_RCH_G0_DMA_OFFSET,
+	DSS_RCH_G0_DFC_OFFSET,
+	DSS_RCH_G0_SCL_OFFSET,
+	0,
+	0,
+	0,
+	DSS_RCH_G0_POST_CLIP_OFFSET,
+	0,
+	DSS_RCH_G0_CSC_OFFSET,
+	},
+
+	/* V1 */
+	{
+	MIF_CH4_OFFSET,
+	AIF0_CH4_OFFSET,
+	AIF1_CH4_OFFSET,
+	MCTL_CTL_MUTEX_RCH4,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD4_DBG,
+	DSS_RCH_VG1_DMA_OFFSET,
+	DSS_RCH_VG1_DFC_OFFSET,
+	DSS_RCH_VG1_SCL_OFFSET,
+	DSS_RCH_VG1_SCL_LUT_OFFSET,
+	0,
+	0,
+	DSS_RCH_VG1_POST_CLIP_OFFSET,
+	0,
+	DSS_RCH_VG1_CSC_OFFSET,
+	},
+
+	/* G1 */
+	{
+	MIF_CH5_OFFSET,
+	AIF0_CH5_OFFSET,
+	AIF1_CH5_OFFSET,
+	MCTL_CTL_MUTEX_RCH5,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD5_DBG,
+	DSS_RCH_G1_DMA_OFFSET,
+	DSS_RCH_G1_DFC_OFFSET,
+	DSS_RCH_G1_SCL_OFFSET,
+	0,
+	0,
+	0,
+	DSS_RCH_G1_POST_CLIP_OFFSET,
+	0,
+	DSS_RCH_G1_CSC_OFFSET,
+	},
+
+	/* D2 */
+	{
+	MIF_CH6_OFFSET,
+	AIF0_CH6_OFFSET,
+	AIF1_CH6_OFFSET,
+	MCTL_CTL_MUTEX_RCH6,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD6_DBG,
+	DSS_RCH_D2_DMA_OFFSET,
+	DSS_RCH_D2_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_RCH_D2_CSC_OFFSET,
+	},
+
+	/* D3 */
+	{
+	MIF_CH7_OFFSET,
+	AIF0_CH7_OFFSET,
+	AIF1_CH7_OFFSET,
+	MCTL_CTL_MUTEX_RCH7,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_OV_OEN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_STARTY,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD7_DBG,
+	DSS_RCH_D3_DMA_OFFSET,
+	DSS_RCH_D3_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_RCH_D3_CSC_OFFSET,
+	},
+
+	/* W0 */
+	{
+	MIF_CH8_OFFSET,
+	AIF0_CH8_OFFSET,
+	AIF1_CH8_OFFSET,
+	MCTL_CTL_MUTEX_WCH0,
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_OV_IEN,
+	0,
+	0,
+	DSS_WCH0_DMA_OFFSET,
+	DSS_WCH0_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_WCH0_CSC_OFFSET,
+	},
+
+	/* W1 */
+	{
+	MIF_CH9_OFFSET,
+	AIF0_CH9_OFFSET,
+	AIF1_CH9_OFFSET,
+	MCTL_CTL_MUTEX_WCH1,
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_FLUSH_EN,
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_OV_IEN,
+	0,
+	0,
+	DSS_WCH1_DMA_OFFSET,
+	DSS_WCH1_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_WCH1_CSC_OFFSET,
+	},
+	/* V2 */
+	{
+	MIF_CH10_OFFSET,
+	AIF0_CH11_OFFSET,
+	AIF1_CH11_OFFSET,
+	MCTL_CTL_MUTEX_RCH8,
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_FLUSH_EN,
+	0,
+	0,
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD8_DBG,
+	DSS_RCH_VG2_DMA_OFFSET,
+	DSS_RCH_VG2_DFC_OFFSET,
+	DSS_RCH_VG2_SCL_OFFSET,
+	DSS_RCH_VG2_SCL_LUT_OFFSET,
+	0,
+	0,
+	DSS_RCH_VG2_POST_CLIP_OFFSET,
+	0,
+	DSS_RCH_VG2_CSC_OFFSET,
+	},
+	/* W2 */
+	{
+	MIF_CH11_OFFSET,
+	AIF0_CH12_OFFSET,
+	AIF1_CH12_OFFSET,
+	MCTL_CTL_MUTEX_WCH2,
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH2_FLUSH_EN,
+	0,
+	0,
+	0,
+	DSS_WCH2_DMA_OFFSET,
+	DSS_WCH2_DFC_OFFSET,
+	0,
+	0,
+	0,
+	0,
+	0,
+	0,
+	DSS_WCH2_CSC_OFFSET,
+	},
+};
+
+static const u32 kirin960_g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
+	{DSS_OVL0_OFFSET,
+	DSS_MCTRL_CTL0_OFFSET},
+
+	{DSS_OVL1_OFFSET,
+	DSS_MCTRL_CTL1_OFFSET},
+
+	{DSS_OVL2_OFFSET,
+	DSS_MCTRL_CTL2_OFFSET},
+
+	{DSS_OVL3_OFFSET,
+	DSS_MCTRL_CTL3_OFFSET},
+
+	{0,
+	DSS_MCTRL_CTL4_OFFSET},
+
+	{0,
+	DSS_MCTRL_CTL5_OFFSET},
+};
+
+/*SCF_LUT_CHN coef_idx*/
+static const int kirin960_g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE] = {
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
+};
+
+static const u32 kirin960_g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
+	/* D2 */
+	{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
+	/* D3 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+	/* V0 */
+	{0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1},
+	/* G0 */
+	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
+	/* V1 */
+	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
+	/* G1 */
+	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
+	/* D0 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+	/* D1 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+
+	/* W0 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+	/* W1 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+
+	/* V2 */
+	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
+	/* W2 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+};
+
+/* number of smrx idx for each channel */
+static const u32 kirin960_g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
+	4, 1, 4, 4, 4, 4, 1, 1, 3, 3, 3, 2
+};
+
+/* start idx of each channel */
+/* smrx_idx = g_dss_smmu_smrx_idx[chn_idx] + (0 ~ g_dss_chn_sid_num[chn_idx]) */
+static const u32 kirin960_g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
+	0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 32
+};
+
+static const u32 kirin960_g_dss_mif_sid_map[DSS_CHN_MAX] = {
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+void kirin960_dpe_defs(struct dss_hw_ctx *ctx)
+{
+	memcpy(&ctx->g_dss_module_base, &kirin960_g_dss_module_base,
+		sizeof(kirin960_g_dss_module_base));
+	memcpy(&ctx->g_dss_module_ovl_base, &kirin960_g_dss_module_ovl_base,
+		sizeof(kirin960_g_dss_module_ovl_base));
+	memcpy(&ctx->g_scf_lut_chn_coef_idx, &kirin960_g_scf_lut_chn_coef_idx,
+		sizeof(kirin960_g_scf_lut_chn_coef_idx));
+	memcpy(&ctx->g_dss_module_cap, &kirin960_g_dss_module_cap,
+		sizeof(kirin960_g_dss_module_cap));
+	memcpy(&ctx->g_dss_chn_sid_num, &kirin960_g_dss_chn_sid_num,
+		sizeof(kirin960_g_dss_chn_sid_num));
+	memcpy(&ctx->g_dss_smmu_smrx_idx, &kirin960_g_dss_smmu_smrx_idx,
+		sizeof(kirin960_g_dss_smmu_smrx_idx));
+
+	ctx->smmu_offset = DSS_SMMU_OFFSET;
+	ctx->afbc_header_addr_align = AFBC_HEADER_ADDR_ALIGN;
+	ctx->dss_mmbuf_clk_rate_power_off = DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF;
+	ctx->rot_mem_ctrl = ROT_MEM_CTRL;
+	ctx->dither_mem_ctrl = DITHER_MEM_CTRL;
+	ctx->arsr2p_lb_mem_ctrl = ARSR2P_LB_MEM_CTRL;
+	ctx->pxl0_clk_rate_power_off = DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF;
+}
diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index 14604e90dea0..895952762e5c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -22,27 +22,6 @@
 #define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF	(277000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF	(238000000UL)
 
-enum dss_chn_module {
-	MODULE_MIF_CHN,
-	MODULE_AIF0_CHN,
-	MODULE_AIF1_CHN,
-	MODULE_MCTL_CHN_MUTEX,
-	MODULE_MCTL_CHN_FLUSH_EN,
-	MODULE_MCTL_CHN_OV_OEN,
-	MODULE_MCTL_CHN_STARTY,
-	MODULE_MCTL_CHN_MOD_DBG,
-	MODULE_DMA,
-	MODULE_DFC,
-	MODULE_SCL,
-	MODULE_SCL_LUT,
-	MODULE_ARSR2P,
-	MODULE_ARSR2P_LUT,
-	MODULE_POST_CLIP,
-	MODULE_PCSC,
-	MODULE_CSC,
-	MODULE_CHN_MAX,
-};
-
 /*****************************************************************************/
 
 #define SCPWREN	(0x0D0)
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_defs.c b/drivers/staging/hikey9xx/gpu/kirin970_defs.c
new file mode 100644
index 000000000000..749e37dbd4c0
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/kirin970_defs.c
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2008-2011, Hisilicon Tech. Co., Ltd. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "kirin9xx_drm_dpe_utils.h"
+#include "kirin9xx_drm_drv.h"
+#include "kirin970_dpe_reg.h"
+
+static const u32 kirin970_g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
+	// D0
+	{
+	MIF_CH0_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH0_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH0_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH0,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD0_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D0_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D0_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// D1
+	{
+	MIF_CH1_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH1_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH1_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH1,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD1_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D1_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D1_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// V0
+	{
+	MIF_CH2_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH2_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH2_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH2,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD2_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_VG0_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_VG0_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_VG0_SCL_OFFSET,  //MODULE_SCL
+	DSS_RCH_VG0_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
+	DSS_RCH_VG0_ARSR_OFFSET,  //MODULE_ARSR2P
+	DSS_RCH_VG0_ARSR_LUT_OFFSET,  //MODULE_ARSR2P_LUT
+	DSS_RCH_VG0_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_VG0_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	DSS_RCH_VG0_PCSC_OFFSET,  //MODULE_PCSC
+	DSS_RCH_VG0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// G0
+	{
+	MIF_CH3_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH3_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH3_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH3,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD3_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_G0_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_G0_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_G0_SCL_OFFSET,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_G0_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_G0_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_G0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// V1
+	{
+	MIF_CH4_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH4_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH4_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH4,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD4_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_VG1_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_VG1_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_VG1_SCL_OFFSET,  //MODULE_SCL
+	DSS_RCH_VG1_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_VG1_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_VG1_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_VG1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// G1
+	{
+	MIF_CH5_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH5_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH5_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH5,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD5_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_G1_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_G1_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_G1_SCL_OFFSET,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_G1_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_G1_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_G1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// D2
+	{
+	MIF_CH6_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH6_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH6_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH6,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD6_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D2_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D2_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D2_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// D3
+	{
+	MIF_CH7_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH7_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH7_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH7,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD7_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D3_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D3_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D3_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// W0
+	{
+	MIF_CH8_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH8_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH8_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_WCH0,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_OV_IEN,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	0,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_WCH0_DMA_OFFSET,  //MODULE_DMA
+	DSS_WCH0_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_WCH0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// W1
+	{
+	MIF_CH9_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH9_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH9_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_WCH1,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_OV_IEN,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	0,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_WCH1_DMA_OFFSET,  //MODULE_DMA
+	DSS_WCH1_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_WCH1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// V2
+	{
+	MIF_CH10_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH11_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH11_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH8,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD8_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_VG2_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_VG2_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_VG2_SCL_OFFSET,  //MODULE_SCL
+	DSS_RCH_VG2_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_VG2_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_VG2_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_VG2_CSC_OFFSET,  //MODULE_CSC
+	},
+	// W2
+	{
+	MIF_CH11_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH12_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH12_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_WCH2,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH2_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	0,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	0,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_WCH2_DMA_OFFSET,  //MODULE_DMA
+	DSS_WCH2_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_WCH2_CSC_OFFSET,  //MODULE_CSC
+	},
+};
+
+static const u32 kirin970_g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
+	{DSS_OVL0_OFFSET,
+	DSS_MCTRL_CTL0_OFFSET},
+
+	{DSS_OVL1_OFFSET,
+	DSS_MCTRL_CTL1_OFFSET},
+
+	{DSS_OVL2_OFFSET,
+	DSS_MCTRL_CTL2_OFFSET},
+
+	{DSS_OVL3_OFFSET,
+	DSS_MCTRL_CTL3_OFFSET},
+
+	{0,
+	DSS_MCTRL_CTL4_OFFSET},
+
+	{0,
+	DSS_MCTRL_CTL5_OFFSET},
+};
+
+//SCF_LUT_CHN coef_idx
+static const int kirin970_g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE] = {
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
+};
+
+static const u32 kirin970_g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
+	/* D2 */
+	{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
+	/* D3 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+	/* V0 */
+	{0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1},
+	/* G0 */
+	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
+	/* V1 */
+	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
+	/* G1 */
+	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
+	/* D0 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+	/* D1 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+
+	/* W0 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+	/* W1 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+
+	/* V2 */
+	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
+	/* W2 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+};
+
+/* number of smrx idx for each channel */
+static const u32 kirin970_g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
+	4, 1, 4, 4, 4, 4, 1, 1, 3, 4, 3, 3
+};
+
+/* start idx of each channel */
+/* smrx_idx = g_dss_smmu_smrx_idx[chn_idx] + (0 ~ g_dss_chn_sid_num[chn_idx]) */
+static const u32 kirin970_g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
+	0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 36
+};
+
+void kirin970_dpe_defs(struct dss_hw_ctx *ctx)
+{
+	memcpy(&ctx->g_dss_module_base, &kirin970_g_dss_module_base,
+		sizeof(kirin970_g_dss_module_base));
+	memcpy(&ctx->g_dss_module_ovl_base, &kirin970_g_dss_module_ovl_base,
+		sizeof(kirin970_g_dss_module_ovl_base));
+	memcpy(&ctx->g_scf_lut_chn_coef_idx, &kirin970_g_scf_lut_chn_coef_idx,
+		sizeof(kirin970_g_scf_lut_chn_coef_idx));
+	memcpy(&ctx->g_dss_module_cap, &kirin970_g_dss_module_cap,
+		sizeof(kirin970_g_dss_module_cap));
+	memcpy(&ctx->g_dss_chn_sid_num, &kirin970_g_dss_chn_sid_num,
+		sizeof(kirin970_g_dss_chn_sid_num));
+	memcpy(&ctx->g_dss_smmu_smrx_idx, &kirin970_g_dss_smmu_smrx_idx,
+		sizeof(kirin970_g_dss_smmu_smrx_idx));
+
+	ctx->smmu_offset = DSS_SMMU_OFFSET;
+	ctx->afbc_header_addr_align = AFBC_HEADER_ADDR_ALIGN;
+	ctx->dss_mmbuf_clk_rate_power_off = DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF;
+	ctx->rot_mem_ctrl = ROT_MEM_CTRL;
+	ctx->dither_mem_ctrl = DITHER_MEM_CTRL;
+	ctx->arsr2p_lb_mem_ctrl = ARSR2P_LB_MEM_CTRL;
+	ctx->pxl0_clk_rate_power_off = DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF;
+}
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 033975b7edef..a4e9e0e84eec 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -48,28 +48,6 @@
 #define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF	(238000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF	(208000000UL)
 
-enum dss_chn_module {
-	MODULE_MIF_CHN,
-	MODULE_AIF0_CHN,
-	MODULE_AIF1_CHN,
-	MODULE_MCTL_CHN_MUTEX,
-	MODULE_MCTL_CHN_FLUSH_EN,
-	MODULE_MCTL_CHN_OV_OEN,
-	MODULE_MCTL_CHN_STARTY,
-	MODULE_MCTL_CHN_MOD_DBG,
-	MODULE_DMA,
-	MODULE_DFC,
-	MODULE_SCL,
-	MODULE_SCL_LUT,
-	MODULE_ARSR2P,
-	MODULE_ARSR2P_LUT,
-	MODULE_POST_CLIP_ES,
-	MODULE_POST_CLIP,
-	MODULE_PCSC,
-	MODULE_CSC,
-	MODULE_CHN_MAX,
-};
-
 /*****************************************************************************/
 
 #define PEREN4	(0x040)
@@ -1186,7 +1164,6 @@ enum dss_chn_module {
 #define AUTO_ULPS_ENTER_DELAY	(0x00E4)
 #define AUTO_ULPS_WAKEUP_TIME	(0x00E8)
 #define AUTO_ULPS_MIN_TIME  (0xF8)
-#define PHY_MODE (0xFC)
 #define DSI_MEM_CTRL  (0x0194)
 #define DSI_PM_CTRL  (0x0198)
 #define DSI_DEBUG  (0x019C)
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h b/drivers/staging/hikey9xx/gpu/kirin9xx_dpe.h
similarity index 99%
rename from drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h
rename to drivers/staging/hikey9xx/gpu/kirin9xx_dpe.h
index e35e8ebb53e1..9139647e9fe5 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dpe.h
@@ -217,8 +217,6 @@ enum dss_axi_idx {
 	AXI_CHN_MAX,
 };
 
-
-
 enum dss_rdma_idx {
 	DSS_RDMA0 = 0,
 	DSS_RDMA1,
@@ -228,6 +226,29 @@ enum dss_rdma_idx {
 	DSS_RDMA_MAX,
 };
 
+enum dss_chn_module {
+	MODULE_MIF_CHN,
+	MODULE_AIF0_CHN,
+	MODULE_AIF1_CHN,
+	MODULE_MCTL_CHN_MUTEX,
+	MODULE_MCTL_CHN_FLUSH_EN,
+	MODULE_MCTL_CHN_OV_OEN,
+	MODULE_MCTL_CHN_STARTY,
+	MODULE_MCTL_CHN_MOD_DBG,
+	MODULE_DMA,
+	MODULE_DFC,
+	MODULE_SCL,
+	MODULE_SCL_LUT,
+	MODULE_ARSR2P,
+	MODULE_ARSR2P_LUT,
+	MODULE_POST_CLIP,
+	MODULE_PCSC,
+	MODULE_CSC,
+	MODULE_POST_CLIP_ES,	/* Only for Kirin 970 */
+	MODULE_CHN_MAX,
+};
+
+
 /*****************************************************************************/
 
 #define FB_ACCEL_HI62xx	0x1
@@ -243,6 +264,11 @@ enum dss_rdma_idx {
 #define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
 #define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
 
+/* Kirin 970 specific data from MPI DSI */
+
+#define KIRIN970_DSI_MEM_CTRL	(0x0194)
+#define KIRIN970_PHY_MODE	(0xFC)
+
 /******************************************************************************/
 
 #define DSS_WCH_MAX  (2)
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index 4781194266c4..82a0edb95953 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -16,19 +16,10 @@
 #include <drm/drm_mipi_dsi.h>
 
 #include "kirin9xx_drm_dpe_utils.h"
-
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#include "kirin970_dpe_reg.h"
-#else
-#include "kirin960_dpe_reg.h"
-#endif
-
-static int g_debug_set_reg_val;
+#include "kirin9xx_dpe.h"
 
 DEFINE_SEMAPHORE(hisi_fb_dss_regulator_sem);
 
-extern u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX];
-
 struct mipi_ifbc_division g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
 	/*single mipi*/
 	{
@@ -715,7 +706,7 @@ void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx)
 	writel(0x00000888, dss_base + DSS_DSC_OFFSET + DSC_MEM_CTRL);
 	writel(0x00000008, dss_base + DSS_LDI0_OFFSET + LDI_MEM_CTRL);
 	writel(0x00000008, dss_base + DSS_DBUF0_OFFSET + DBUF_MEM_CTRL);
-	writel(0x00000008, dss_base + DSS_DPP_DITHER_OFFSET + DITHER_MEM_CTRL);
+	writel(0x00000008, dss_base + DSS_DPP_DITHER_OFFSET + ctx->dither_mem_ctrl);
 }
 
 void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
@@ -737,7 +728,7 @@ void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
 	writel(0x00000008,
 	       dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_LB_MEM_CTRL);/*rch_v0 ,scf mem*/
 	writel(0x00000008,
-	       dss_base + DSS_RCH_VG0_ARSR_OFFSET + ARSR2P_LB_MEM_CTRL);/*rch_v0 ,arsr2p mem*/
+	       dss_base + DSS_RCH_VG0_ARSR_OFFSET + ctx->arsr2p_lb_mem_ctrl);/*rch_v0 ,arsr2p mem*/
 	writel(0x00000008, dss_base + DSS_RCH_VG0_DMA_OFFSET + VPP_MEM_CTRL);/*rch_v0 ,vpp mem*/
 	writel(0x00000008,
 	       dss_base + DSS_RCH_VG0_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_v0 ,dma_buf mem*/
@@ -796,10 +787,10 @@ void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
 
 	writel(0x00000008, dss_base + DSS_WCH0_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*wch0 DMA/AFBCE mem*/
 	writel(0x00000888, dss_base + DSS_WCH0_DMA_OFFSET + AFBCE_MEM_CTRL);/*wch0 DMA/AFBCE mem*/
-	writel(0x00000008, dss_base + DSS_WCH0_DMA_OFFSET + ROT_MEM_CTRL);/*wch0 rot mem*/
+	writel(0x00000008, dss_base + DSS_WCH0_DMA_OFFSET + ctx->rot_mem_ctrl);/*wch0 rot mem*/
 	writel(0x00000008, dss_base + DSS_WCH1_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*wch1 DMA/AFBCE mem*/
 	writel(0x00000888, dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL);/*wch1 DMA/AFBCE mem*/
-	writel(0x00000008, dss_base + DSS_WCH1_DMA_OFFSET + ROT_MEM_CTRL);/*wch1 rot mem*/
+	writel(0x00000008, dss_base + DSS_WCH1_DMA_OFFSET + ctx->rot_mem_ctrl);/*wch1 rot mem*/
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
 		writel(0x00000088,
 		       dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_COEF_MEM_CTRL);
@@ -810,7 +801,7 @@ void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
 		writel(0x00000008,
 		       dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*wch2 DMA/AFBCE mem*/
 		writel(0x00000008,
-		       dss_base + DSS_WCH2_DMA_OFFSET + ROT_MEM_CTRL);/*wch2 rot mem*/
+		       dss_base + DSS_WCH2_DMA_OFFSET + ctx->rot_mem_ctrl);/*wch2 rot mem*/
 		//outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
 		//outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
 	}
@@ -1035,10 +1026,10 @@ int dpe_regulator_disable(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 
-	#if defined(CONFIG_DRM_HISI_KIRIN970)
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
 		dpe_set_pixel_clk_rate_on_pll0(ctx);
 		dpe_set_common_clk_rate_on_pll0(ctx);
-	#endif
+	}
 
 	ret = regulator_disable(ctx->dpe_regulator);
 	if (ret != 0) {
@@ -1139,7 +1130,7 @@ int dpe_set_pixel_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 
-	clk_rate = DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF;
+	clk_rate = ctx->pxl0_clk_rate_power_off;
 	ret = clk_set_rate(ctx->dss_pxl0_clk, clk_rate);
 	if (ret < 0) {
 		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n",
@@ -1163,7 +1154,7 @@ int dpe_set_common_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 
-	clk_rate = DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF;
+	clk_rate = ctx->dss_mmbuf_clk_rate_power_off;
 	ret = clk_set_rate(ctx->dss_mmbuf_clk, clk_rate);
 	if (ret < 0) {
 		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n",
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
index 13e51a725579..444ddc148416 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
@@ -16,10 +16,13 @@
 #ifndef KIRIN_DRM_DPE_UTILS_H
 #define KIRIN_DRM_DPE_UTILS_H
 
+#include <linux/kernel.h>
+
 #include <drm/drm_plane.h>
 #include <drm/drm_crtc.h>
 
 #include "kirin9xx_drm_drv.h"
+#include "kirin9xx_dpe.h"
 
 enum dss_channel {
 	DSS_CH1 = 0,	/* channel 1 for primary plane */
@@ -110,8 +113,26 @@ struct dss_hw_ctx {
 	char __iomem *screen_base;
 	unsigned long smem_start;
 	unsigned long screen_size;
+
+	/* Version-specific data */
+	u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX];
+	u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX];
+	int g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE];
+	u32 g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX];
+	u32 g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE];
+	u32 g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE];
+	u32 smmu_offset;
+	u32 afbc_header_addr_align;
+	u32 dss_mmbuf_clk_rate_power_off;
+	u32 rot_mem_ctrl;
+	u32 dither_mem_ctrl;
+	u32 arsr2p_lb_mem_ctrl;
+	u32 pxl0_clk_rate_power_off;
 };
 
+void kirin960_dpe_defs(struct dss_hw_ctx *ctx);
+void kirin970_dpe_defs(struct dss_hw_ctx *ctx);
+
 struct dss_clk_rate {
 	u64 dss_pri_clk_rate;
 	u64 dss_pclk_dss_rate;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index acb8420e332a..18fec5a1b59d 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -340,10 +340,10 @@ static int kirin_drm_platform_resume(struct platform_device *pdev)
 
 static const struct of_device_id kirin_drm_dt_ids[] = {
 	{ .compatible = "hisilicon,kirin960-dpe",
-	  .data = &dss_dc_ops,
+	  .data = &kirin960_dss_dc_ops,
 	},
 	{ .compatible = "hisilicon,kirin970-dpe",
-	  .data = &dss_dc_ops,
+	  .data = &kirin970_dss_dc_ops,
 	},
 	{ /* end node */ },
 };
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
index 232e88441bd1..fb33d5826ef8 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
@@ -47,7 +47,8 @@ struct kirin_fbdev {
 	int shared_fd;
 };
 
-extern const struct kirin_dc_ops dss_dc_ops;
+extern const struct kirin_dc_ops kirin960_dss_dc_ops;
+extern const struct kirin_dc_ops kirin970_dss_dc_ops;
 void dsi_set_output_client(struct drm_device *dev);
 
 struct drm_framebuffer *kirin_framebuffer_init(struct drm_device *dev,
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index 6792ac6fa8dc..e3a1f85bdbd2 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -40,20 +40,10 @@
 
 #include "kirin9xx_drm_drv.h"
 #include "kirin9xx_drm_dpe_utils.h"
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#include "kirin970_dpe_reg.h"
-#else
-#include "kirin960_dpe_reg.h"
-#endif
+#include "kirin9xx_dpe.h"
 
 //#define DSS_POWER_UP_ON_UEFI
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#define DTS_COMP_DSS_NAME "hisilicon,kirin970-dpe"
-#else
-#define DTS_COMP_DSS_NAME "hisilicon,hi3660-dpe"
-#endif
-
 #define DSS_DEBUG	0
 
 static const struct dss_format dss_formats[] = {
@@ -322,45 +312,45 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 	int ret = 0;
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	mediacrg_regulator_enable(ctx);
-	dpe_common_clk_enable(ctx);
-	dpe_inner_clk_enable(ctx);
-	#ifndef DSS_POWER_UP_ON_UEFI
-	dpe_regulator_enable(ctx);
-	#endif
-	dpe_set_clk_rate(ctx);
-#else
-	ret = clk_prepare_enable(ctx->dss_pxl0_clk);
-	if (ret) {
-		DRM_ERROR("failed to enable dss_pxl0_clk (%d)\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(ctx->dss_pri_clk);
-	if (ret) {
-		DRM_ERROR("failed to enable dss_pri_clk (%d)\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(ctx->dss_pclk_dss_clk);
-	if (ret) {
-		DRM_ERROR("failed to enable dss_pclk_dss_clk (%d)\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(ctx->dss_axi_clk);
-	if (ret) {
-		DRM_ERROR("failed to enable dss_axi_clk (%d)\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(ctx->dss_mmbuf_clk);
-	if (ret) {
-		DRM_ERROR("failed to enable dss_mmbuf_clk (%d)\n", ret);
-		return ret;
-	}
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		mediacrg_regulator_enable(ctx);
+		dpe_common_clk_enable(ctx);
+		dpe_inner_clk_enable(ctx);
+#ifndef DSS_POWER_UP_ON_UEFI
+		dpe_regulator_enable(ctx);
 #endif
+		dpe_set_clk_rate(ctx);
+	} else {
+		ret = clk_prepare_enable(ctx->dss_pxl0_clk);
+		if (ret) {
+			DRM_ERROR("failed to enable dss_pxl0_clk (%d)\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(ctx->dss_pri_clk);
+		if (ret) {
+			DRM_ERROR("failed to enable dss_pri_clk (%d)\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(ctx->dss_pclk_dss_clk);
+		if (ret) {
+			DRM_ERROR("failed to enable dss_pclk_dss_clk (%d)\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(ctx->dss_axi_clk);
+		if (ret) {
+			DRM_ERROR("failed to enable dss_axi_clk (%d)\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(ctx->dss_mmbuf_clk);
+		if (ret) {
+			DRM_ERROR("failed to enable dss_mmbuf_clk (%d)\n", ret);
+			return ret;
+		}
+	}
 
 	dss_inner_clk_common_enable(ctx);
 	dss_inner_clk_pdp_enable(ctx);
@@ -797,27 +787,25 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = NULL;
-	u32 dss_version_tag;
+	const char *compatible;
 	int ret = 0;
 
-	np = of_find_compatible_node(NULL, NULL, DTS_COMP_DSS_NAME);
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
+		compatible = "hisilicon,kirin970-dpe";
+	else
+		compatible = "hisilicon,hi3660-dpe";
+
+	np = of_find_compatible_node(NULL, NULL, compatible);
 	if (!np) {
-		DRM_ERROR("NOT FOUND device node %s!\n",
-			  DTS_COMP_DSS_NAME);
+		DRM_ERROR("NOT FOUND device node %s!\n", compatible);
 		return -ENXIO;
 	}
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	ret = of_property_read_u32(np, "dss_version_tag", &dss_version_tag);
-	if (ret)
-		DRM_ERROR("failed to get dss_version_tag.\n");
-
-	ctx->g_dss_version_tag = dss_version_tag;
-	DRM_INFO("dss_version_tag=0x%x.\n", ctx->g_dss_version_tag);
-#else
-	ctx->g_dss_version_tag = FB_ACCEL_HI366x;
-	DRM_INFO("dss_version_tag=0x%x.\n", ctx->g_dss_version_tag);
-#endif
+	/* Initialize version-specific data */
+	if (ctx->g_dss_version_tag == FB_ACCEL_HI366x)
+		kirin960_dpe_defs(ctx);
+	else
+		kirin970_dpe_defs(ctx);
 
 	ctx->base = of_iomap(np, 0);
 	if (!(ctx->base)) {
@@ -857,19 +845,19 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 		return -ENXIO;
 	}
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	ctx->pmctrl_base = of_iomap(np, 5);
-	if (!(ctx->pmctrl_base)) {
-		DRM_ERROR("failed to get dss pmctrl_base resource.\n");
-		return -ENXIO;
-	}
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		ctx->pmctrl_base = of_iomap(np, 5);
+		if (!(ctx->pmctrl_base)) {
+			DRM_ERROR("failed to get dss pmctrl_base resource.\n");
+			return -ENXIO;
+		}
 
-	ctx->media_crg_base = of_iomap(np, 6);
-	if (!(ctx->media_crg_base)) {
-		DRM_ERROR("failed to get dss media_crg_base resource.\n");
-		return -ENXIO;
+		ctx->media_crg_base = of_iomap(np, 6);
+		if (!(ctx->media_crg_base)) {
+			DRM_ERROR("failed to get dss media_crg_base resource.\n");
+			return -ENXIO;
+		}
 	}
-#endif
 
 	/* get irq no */
 	ctx->irq = irq_of_parse_and_map(np, 0);
@@ -880,13 +868,13 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 
 	DRM_INFO("dss irq = %d.\n", ctx->irq);
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	ctx->dpe_regulator = devm_regulator_get(dev, REGULATOR_PDP_NAME);
-	if (!ctx->dpe_regulator) {
-		DRM_ERROR("failed to get dpe_regulator resource! ret=%d.\n", ret);
-		return -ENXIO;
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		ctx->dpe_regulator = devm_regulator_get(dev, REGULATOR_PDP_NAME);
+		if (!ctx->dpe_regulator) {
+			DRM_ERROR("failed to get dpe_regulator resource! ret=%d.\n", ret);
+			return -ENXIO;
+		}
 	}
-#endif
 
 	ctx->dss_mmbuf_clk = devm_clk_get(dev, "clk_dss_axi_mm");
 	if (!ctx->dss_mmbuf_clk) {
@@ -948,7 +936,7 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 	return 0;
 }
 
-static int dss_drm_init(struct drm_device *dev)
+static int dss_drm_init(struct drm_device *dev, u32 g_dss_version_tag)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct dss_data *dss;
@@ -971,6 +959,7 @@ static int dss_drm_init(struct drm_device *dev)
 	acrtc->ctx = ctx;
 	acrtc->out_format = LCD_RGB888;
 	acrtc->bgr_fmt = LCD_RGB;
+	ctx->g_dss_version_tag = g_dss_version_tag;
 
 	ret = dss_dts_parse(pdev, ctx);
 	if (ret)
@@ -1049,8 +1038,25 @@ static int  dss_drm_resume(struct platform_device *pdev)
 	return 0;
 }
 
-const struct kirin_dc_ops dss_dc_ops = {
-	.init = dss_drm_init,
+static int kirin960_dss_drm_init(struct drm_device *dev)
+{
+	return dss_drm_init(dev, FB_ACCEL_HI366x);
+}
+
+const struct kirin_dc_ops kirin960_dss_dc_ops = {
+	.init = kirin960_dss_drm_init,
+	.cleanup = dss_drm_cleanup,
+	.suspend = dss_drm_suspend,
+	.resume = dss_drm_resume,
+};
+
+static int kirin970_dss_drm_init(struct drm_device *dev)
+{
+	return dss_drm_init(dev, FB_ACCEL_KIRIN970);
+}
+
+const struct kirin_dc_ops kirin970_dss_dc_ops = {
+	.init = kirin970_dss_drm_init,
 	.cleanup = dss_drm_cleanup,
 	.suspend = dss_drm_suspend,
 	.resume = dss_drm_resume,
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 335f4d9fba15..5ac7f4b31d99 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -24,671 +24,12 @@
 
 #include "kirin9xx_drm_dpe_utils.h"
 #include "kirin9xx_drm_drv.h"
-
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#include "kirin970_dpe_reg.h"
-#else
-#include "kirin960_dpe_reg.h"
-#endif
+#include "kirin9xx_dpe.h"
 
 static const int mid_array[DSS_CHN_MAX_DEFINE] = {
 	0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0
 };
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-static const u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
-	// D0
-	{
-	MIF_CH0_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH0_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH0_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH0,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD0_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_D0_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_D0_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_D0_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// D1
-	{
-	MIF_CH1_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH1_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH1_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH1,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD1_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_D1_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_D1_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_D1_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// V0
-	{
-	MIF_CH2_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH2_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH2_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH2,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD2_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_VG0_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_VG0_DFC_OFFSET,  //MODULE_DFC
-	DSS_RCH_VG0_SCL_OFFSET,  //MODULE_SCL
-	DSS_RCH_VG0_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
-	DSS_RCH_VG0_ARSR_OFFSET,  //MODULE_ARSR2P
-	DSS_RCH_VG0_ARSR_LUT_OFFSET,  //MODULE_ARSR2P_LUT
-	DSS_RCH_VG0_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
-	DSS_RCH_VG0_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
-	DSS_RCH_VG0_PCSC_OFFSET,  //MODULE_PCSC
-	DSS_RCH_VG0_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// G0
-	{
-	MIF_CH3_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH3_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH3_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH3,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD3_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_G0_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_G0_DFC_OFFSET,  //MODULE_DFC
-	DSS_RCH_G0_SCL_OFFSET,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	DSS_RCH_G0_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
-	DSS_RCH_G0_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_G0_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// V1
-	{
-	MIF_CH4_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH4_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH4_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH4,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD4_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_VG1_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_VG1_DFC_OFFSET,  //MODULE_DFC
-	DSS_RCH_VG1_SCL_OFFSET,  //MODULE_SCL
-	DSS_RCH_VG1_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	DSS_RCH_VG1_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
-	DSS_RCH_VG1_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_VG1_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// G1
-	{
-	MIF_CH5_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH5_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH5_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH5,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD5_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_G1_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_G1_DFC_OFFSET,  //MODULE_DFC
-	DSS_RCH_G1_SCL_OFFSET,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	DSS_RCH_G1_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
-	DSS_RCH_G1_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_G1_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// D2
-	{
-	MIF_CH6_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH6_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH6_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH6,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD6_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_D2_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_D2_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_D2_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// D3
-	{
-	MIF_CH7_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH7_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH7_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH7,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_STARTY,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD7_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_D3_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_D3_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_D3_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// W0
-	{
-	MIF_CH8_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH8_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH8_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_WCH0,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_OV_IEN,  //MODULE_MCTL_CHN_OV_OEN
-	0,  //MODULE_MCTL_CHN_STARTY
-	0,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_WCH0_DMA_OFFSET,  //MODULE_DMA
-	DSS_WCH0_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_WCH0_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// W1
-	{
-	MIF_CH9_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH9_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH9_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_WCH1,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_OV_IEN,  //MODULE_MCTL_CHN_OV_OEN
-	0,  //MODULE_MCTL_CHN_STARTY
-	0,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_WCH1_DMA_OFFSET,  //MODULE_DMA
-	DSS_WCH1_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_WCH1_CSC_OFFSET,  //MODULE_CSC
-	},
-
-	// V2
-	{
-	MIF_CH10_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH11_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH11_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_RCH8,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
-	0,  //MODULE_MCTL_CHN_STARTY
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD8_DBG,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_RCH_VG2_DMA_OFFSET,  //MODULE_DMA
-	DSS_RCH_VG2_DFC_OFFSET,  //MODULE_DFC
-	DSS_RCH_VG2_SCL_OFFSET,  //MODULE_SCL
-	DSS_RCH_VG2_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	DSS_RCH_VG2_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
-	DSS_RCH_VG2_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_RCH_VG2_CSC_OFFSET,  //MODULE_CSC
-	},
-	// W2
-	{
-	MIF_CH11_OFFSET,   //MODULE_MIF_CHN
-	AIF0_CH12_OFFSET,  //MODULE_AIF0_CHN
-	AIF1_CH12_OFFSET,  //MODULE_AIF1_CHN
-	MCTL_CTL_MUTEX_WCH2,  //MODULE_MCTL_CHN_MUTEX
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH2_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
-	0,  //MODULE_MCTL_CHN_OV_OEN
-	0,  //MODULE_MCTL_CHN_STARTY
-	0,  //MODULE_MCTL_CHN_MOD_DBG
-	DSS_WCH2_DMA_OFFSET,  //MODULE_DMA
-	DSS_WCH2_DFC_OFFSET,  //MODULE_DFC
-	0,  //MODULE_SCL
-	0,  //MODULE_SCL_LUT
-	0,  //MODULE_ARSR2P
-	0,  //MODULE_ARSR2P_LUT
-	0, //MODULE_POST_CLIP_ES
-	0,  //MODULE_POST_CLIP
-	0,  //MODULE_PCSC
-	DSS_WCH2_CSC_OFFSET,  //MODULE_CSC
-	},
-};
-
-static const u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
-	{DSS_OVL0_OFFSET,
-	DSS_MCTRL_CTL0_OFFSET},
-
-	{DSS_OVL1_OFFSET,
-	DSS_MCTRL_CTL1_OFFSET},
-
-	{DSS_OVL2_OFFSET,
-	DSS_MCTRL_CTL2_OFFSET},
-
-	{DSS_OVL3_OFFSET,
-	DSS_MCTRL_CTL3_OFFSET},
-
-	{0,
-	DSS_MCTRL_CTL4_OFFSET},
-
-	{0,
-	DSS_MCTRL_CTL5_OFFSET},
-};
-
-//SCF_LUT_CHN coef_idx
-int g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
-
-u32 g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
-	/* D2 */
-	{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
-	/* D3 */
-	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
-	/* V0 */
-	{0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1},
-	/* G0 */
-	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
-	/* V1 */
-	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
-	/* G1 */
-	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
-	/* D0 */
-	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
-	/* D1 */
-	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
-
-	/* W0 */
-	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
-	/* W1 */
-	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
-
-	/* V2 */
-	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
-	/* W2 */
-	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
-};
-
-/* number of smrx idx for each channel */
-u32 g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
-	4, 1, 4, 4, 4, 4, 1, 1, 3, 4, 3, 3
-};
-
-/* start idx of each channel */
-/* smrx_idx = g_dss_smmu_smrx_idx[chn_idx] + (0 ~ g_dss_chn_sid_num[chn_idx]) */
-u32 g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
-	0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 36
-};
-#else
-/*
- * dss_chn_idx
- * DSS_RCHN_D2 = 0,	DSS_RCHN_D3,	DSS_RCHN_V0,	DSS_RCHN_G0,	DSS_RCHN_V1,
- * DSS_RCHN_G1,	DSS_RCHN_D0,	DSS_RCHN_D1,	DSS_WCHN_W0,	DSS_WCHN_W1,
- * DSS_RCHN_V2,   DSS_WCHN_W2,
- */
-u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
-	/* D0 */
-	{
-	MIF_CH0_OFFSET,
-	AIF0_CH0_OFFSET,
-	AIF1_CH0_OFFSET,
-	MCTL_CTL_MUTEX_RCH0,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD0_DBG,
-	DSS_RCH_D0_DMA_OFFSET,
-	DSS_RCH_D0_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_RCH_D0_CSC_OFFSET,
-	},
-
-	/* D1 */
-	{
-	MIF_CH1_OFFSET,
-	AIF0_CH1_OFFSET,
-	AIF1_CH1_OFFSET,
-	MCTL_CTL_MUTEX_RCH1,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD1_DBG,
-	DSS_RCH_D1_DMA_OFFSET,
-	DSS_RCH_D1_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_RCH_D1_CSC_OFFSET,
-	},
-
-	/* V0 */
-	{
-	MIF_CH2_OFFSET,
-	AIF0_CH2_OFFSET,
-	AIF1_CH2_OFFSET,
-	MCTL_CTL_MUTEX_RCH2,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD2_DBG,
-	DSS_RCH_VG0_DMA_OFFSET,
-	DSS_RCH_VG0_DFC_OFFSET,
-	DSS_RCH_VG0_SCL_OFFSET,
-	DSS_RCH_VG0_SCL_LUT_OFFSET,
-	DSS_RCH_VG0_ARSR_OFFSET,
-	DSS_RCH_VG0_ARSR_LUT_OFFSET,
-	DSS_RCH_VG0_POST_CLIP_OFFSET,
-	DSS_RCH_VG0_PCSC_OFFSET,
-	DSS_RCH_VG0_CSC_OFFSET,
-	},
-
-	/* G0 */
-	{
-	MIF_CH3_OFFSET,
-	AIF0_CH3_OFFSET,
-	AIF1_CH3_OFFSET,
-	MCTL_CTL_MUTEX_RCH3,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD3_DBG,
-	DSS_RCH_G0_DMA_OFFSET,
-	DSS_RCH_G0_DFC_OFFSET,
-	DSS_RCH_G0_SCL_OFFSET,
-	0,
-	0,
-	0,
-	DSS_RCH_G0_POST_CLIP_OFFSET,
-	0,
-	DSS_RCH_G0_CSC_OFFSET,
-	},
-
-	/* V1 */
-	{
-	MIF_CH4_OFFSET,
-	AIF0_CH4_OFFSET,
-	AIF1_CH4_OFFSET,
-	MCTL_CTL_MUTEX_RCH4,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD4_DBG,
-	DSS_RCH_VG1_DMA_OFFSET,
-	DSS_RCH_VG1_DFC_OFFSET,
-	DSS_RCH_VG1_SCL_OFFSET,
-	DSS_RCH_VG1_SCL_LUT_OFFSET,
-	0,
-	0,
-	DSS_RCH_VG1_POST_CLIP_OFFSET,
-	0,
-	DSS_RCH_VG1_CSC_OFFSET,
-	},
-
-	/* G1 */
-	{
-	MIF_CH5_OFFSET,
-	AIF0_CH5_OFFSET,
-	AIF1_CH5_OFFSET,
-	MCTL_CTL_MUTEX_RCH5,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD5_DBG,
-	DSS_RCH_G1_DMA_OFFSET,
-	DSS_RCH_G1_DFC_OFFSET,
-	DSS_RCH_G1_SCL_OFFSET,
-	0,
-	0,
-	0,
-	DSS_RCH_G1_POST_CLIP_OFFSET,
-	0,
-	DSS_RCH_G1_CSC_OFFSET,
-	},
-
-	/* D2 */
-	{
-	MIF_CH6_OFFSET,
-	AIF0_CH6_OFFSET,
-	AIF1_CH6_OFFSET,
-	MCTL_CTL_MUTEX_RCH6,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD6_DBG,
-	DSS_RCH_D2_DMA_OFFSET,
-	DSS_RCH_D2_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_RCH_D2_CSC_OFFSET,
-	},
-
-	/* D3 */
-	{
-	MIF_CH7_OFFSET,
-	AIF0_CH7_OFFSET,
-	AIF1_CH7_OFFSET,
-	MCTL_CTL_MUTEX_RCH7,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_OV_OEN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_STARTY,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD7_DBG,
-	DSS_RCH_D3_DMA_OFFSET,
-	DSS_RCH_D3_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_RCH_D3_CSC_OFFSET,
-	},
-
-	/* W0 */
-	{
-	MIF_CH8_OFFSET,
-	AIF0_CH8_OFFSET,
-	AIF1_CH8_OFFSET,
-	MCTL_CTL_MUTEX_WCH0,
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_OV_IEN,
-	0,
-	0,
-	DSS_WCH0_DMA_OFFSET,
-	DSS_WCH0_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_WCH0_CSC_OFFSET,
-	},
-
-	/* W1 */
-	{
-	MIF_CH9_OFFSET,
-	AIF0_CH9_OFFSET,
-	AIF1_CH9_OFFSET,
-	MCTL_CTL_MUTEX_WCH1,
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_FLUSH_EN,
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_OV_IEN,
-	0,
-	0,
-	DSS_WCH1_DMA_OFFSET,
-	DSS_WCH1_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_WCH1_CSC_OFFSET,
-	},
-	/* V2 */
-	{
-	MIF_CH10_OFFSET,
-	AIF0_CH11_OFFSET,
-	AIF1_CH11_OFFSET,
-	MCTL_CTL_MUTEX_RCH8,
-	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_FLUSH_EN,
-	0,
-	0,
-	DSS_MCTRL_SYS_OFFSET + MCTL_MOD8_DBG,
-	DSS_RCH_VG2_DMA_OFFSET,
-	DSS_RCH_VG2_DFC_OFFSET,
-	DSS_RCH_VG2_SCL_OFFSET,
-	DSS_RCH_VG2_SCL_LUT_OFFSET,
-	0,
-	0,
-	DSS_RCH_VG2_POST_CLIP_OFFSET,
-	0,
-	DSS_RCH_VG2_CSC_OFFSET,
-	},
-	/* W2 */
-	{
-	MIF_CH11_OFFSET,
-	AIF0_CH12_OFFSET,
-	AIF1_CH12_OFFSET,
-	MCTL_CTL_MUTEX_WCH2,
-	DSS_MCTRL_SYS_OFFSET + MCTL_WCH2_FLUSH_EN,
-	0,
-	0,
-	0,
-	DSS_WCH2_DMA_OFFSET,
-	DSS_WCH2_DFC_OFFSET,
-	0,
-	0,
-	0,
-	0,
-	0,
-	0,
-	DSS_WCH2_CSC_OFFSET,
-	},
-};
-
-u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
-	{DSS_OVL0_OFFSET,
-	DSS_MCTRL_CTL0_OFFSET},
-
-	{DSS_OVL1_OFFSET,
-	DSS_MCTRL_CTL1_OFFSET},
-
-	{DSS_OVL2_OFFSET,
-	DSS_MCTRL_CTL2_OFFSET},
-
-	{DSS_OVL3_OFFSET,
-	DSS_MCTRL_CTL3_OFFSET},
-
-	{0,
-	DSS_MCTRL_CTL4_OFFSET},
-
-	{0,
-	DSS_MCTRL_CTL5_OFFSET},
-};
-
-/*SCF_LUT_CHN coef_idx*/
-int g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
-
-u32 g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
-	/* D2 */
-	{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
-	/* D3 */
-	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
-	/* V0 */
-	{0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1},
-	/* G0 */
-	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
-	/* V1 */
-	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
-	/* G1 */
-	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
-	/* D0 */
-	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
-	/* D1 */
-	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
-
-	/* W0 */
-	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
-	/* W1 */
-	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
-
-	/* V2 */
-	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
-	/* W2 */
-	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
-};
-
-/* number of smrx idx for each channel */
-u32 g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
-	4, 1, 4, 4, 4, 4, 1, 1, 3, 3, 3, 2
-};
-
-/* start idx of each channel */
-/* smrx_idx = g_dss_smmu_smrx_idx[chn_idx] + (0 ~ g_dss_chn_sid_num[chn_idx]) */
-u32 g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
-	0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 32
-};
-
-u32 g_dss_mif_sid_map[DSS_CHN_MAX] = {
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
-};
-#endif
 static int hisi_pixel_format_hal2dma(int format)
 {
 	int ret = 0;
@@ -864,7 +205,7 @@ static int hisi_dss_aif_ch_config(struct dss_hw_ctx *ctx, int chn_idx)
 	}
 
 	mid = mid_array[chn_idx];
-	aif0_ch_base = ctx->base + g_dss_module_base[chn_idx][MODULE_AIF0_CHN];
+	aif0_ch_base = ctx->base + ctx->g_dss_module_base[chn_idx][MODULE_AIF0_CHN];
 
 	set_reg(aif0_ch_base, 0x0, 1, 0);
 	set_reg(aif0_ch_base, (uint32_t)mid, 4, 4);
@@ -882,10 +223,10 @@ static int hisi_dss_smmu_config(struct dss_hw_ctx *ctx, int chn_idx, bool mmu_en
 		return -1;
 	}
 
-	smmu_base = ctx->base + DSS_SMMU_OFFSET;
+	smmu_base = ctx->base + ctx->smmu_offset;
 
-	for (i = 0; i < g_dss_chn_sid_num[chn_idx]; i++) {
-		idx = g_dss_smmu_smrx_idx[chn_idx] + i;
+	for (i = 0; i < ctx->g_dss_chn_sid_num[chn_idx]; i++) {
+		idx = ctx->g_dss_smmu_smrx_idx[chn_idx] + i;
 		if (!mmu_enable) {
 			set_reg(smmu_base + SMMU_SMRx_NS + idx * 0x4, 1, 32, 0);
 		} else {
@@ -909,7 +250,7 @@ static int hisi_dss_mif_config(struct dss_hw_ctx *ctx, int chn_idx, bool mmu_ena
 
 	mif_base = ctx->base + DSS_MIF_OFFSET;
 	mif_ch_base = ctx->base +
-		g_dss_module_base[chn_idx][MODULE_MIF_CHN];
+		ctx->g_dss_module_base[chn_idx][MODULE_MIF_CHN];
 
 	if (!mmu_enable)
 		set_reg(mif_ch_base + MIF_CTRL1, 0x1, 1, 5);
@@ -929,7 +270,7 @@ int hisi_dss_mctl_mutex_lock(struct dss_hw_ctx *ctx)
 	}
 
 	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
 
 	set_reg(mctl_base + MCTL_CTL_MUTEX, 0x1, 1, 0);
 
@@ -946,7 +287,7 @@ int hisi_dss_mctl_mutex_unlock(struct dss_hw_ctx *ctx)
 	}
 
 	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
 
 	set_reg(mctl_base + MCTL_CTL_MUTEX, 0x0, 1, 0);
 
@@ -966,7 +307,7 @@ static int hisi_dss_mctl_ov_config(struct dss_hw_ctx *ctx, int chn_idx)
 	mctl_rch_offset = (uint32_t)(MCTL_CTL_MUTEX_RCH0 + chn_idx * 0x4);
 
 	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
 
 	set_reg(mctl_base + MCTL_CTL_EN, 0x1, 32, 0);
 	set_reg(mctl_base + MCTL_CTL_TOP, 0x2, 32, 0); /*auto mode*/
@@ -1051,7 +392,7 @@ static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
 		rdma_bpp = 0x0;
 
 	rdma_base = ctx->base +
-		g_dss_module_base[chn_idx][MODULE_DMA];
+		ctx->g_dss_module_base[chn_idx][MODULE_DMA];
 
 	aligned_pixel = DMA_ALIGN_BYTES / bpp;
 	rdma_oft_x0 = rect->left / aligned_pixel;
@@ -1071,10 +412,10 @@ static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
 		mm_base_0 = ALIGN_UP(mm_base_0, MMBUF_ADDR_ALIGN);
 		mm_base_1 = ALIGN_UP(mm_base_1, MMBUF_ADDR_ALIGN);
 
-		if ((((rect->right - rect->left) + 1) & (AFBC_HEADER_ADDR_ALIGN - 1)) ||
+		if ((((rect->right - rect->left) + 1) & (ctx->afbc_header_addr_align - 1)) ||
 		    (((rect->bottom - rect->top) + 1) & (AFBC_BLOCK_ALIGN - 1))) {
 			DRM_ERROR("img width(%d) is not %d bytes aligned, or img heigh(%d) is not %d bytes aligned!\n",
-				  ((rect->right - rect->left) + 1), AFBC_HEADER_ADDR_ALIGN,
+				  ((rect->right - rect->left) + 1), ctx->afbc_header_addr_align,
 				  ((rect->bottom - rect->top) + 1), AFBC_BLOCK_ALIGN);
 		}
 
@@ -1168,7 +509,7 @@ static int hisi_dss_rdfc_config(struct dss_hw_ctx *ctx,
 	}
 
 	rdfc_base = ctx->base +
-		g_dss_module_base[chn_idx][MODULE_DFC];
+		ctx->g_dss_module_base[chn_idx][MODULE_DFC];
 
 	dfc_pix_in_num = (bpp <= 2) ? 0x1 : 0x0;
 	size_hrz = rect->right - rect->left;
@@ -1203,9 +544,9 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 
 	mctl_sys_base = ctx->base + DSS_MCTRL_SYS_OFFSET;
 	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
 	ovl0_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_OVL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_OVL0][MODULE_OVL_BASE];
 
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
 		set_reg(ovl0_base + OV8_REG_DEFAULT, 0x1, 32, 0);
@@ -1250,7 +591,7 @@ static int hisi_dss_ovl_config(struct dss_hw_ctx *ctx,
 	}
 
 	ovl0_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_OVL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_OVL0][MODULE_OVL_BASE];
 
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
 		set_reg(ovl0_base + OV8_REG_DEFAULT, 0x1, 32, 0);
@@ -1360,7 +701,7 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 		return;
 	}
 
-	smmu_base = ctx->base + DSS_SMMU_OFFSET;
+	smmu_base = ctx->base + ctx->smmu_offset;
 
 	set_reg(smmu_base + SMMU_SCR, 0x0, 1, 0);  /*global bypass cancel*/
 	set_reg(smmu_base + SMMU_SCR, 0x1, 8, 20); /*ptw_mid*/
@@ -1412,7 +753,7 @@ void hisi_dss_mctl_on(struct dss_hw_ctx *ctx)
 		return;
 	}
 	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_MCTL0][MODULE_MCTL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_MCTL0][MODULE_MCTL_BASE];
 	mctl_sys_base = ctx->base + DSS_MCTRL_SYS_OFFSET;
 
 	set_reg(mctl_base + MCTL_CTL_EN, 0x1, 32, 0);
@@ -1457,7 +798,7 @@ void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
 	}
 
 	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_MCTL0][MODULE_MCTL_BASE];
+		ctx->g_dss_module_ovl_base[DSS_MCTL0][MODULE_MCTL_BASE];
 
 	if (mctl_base)
 		set_reg(mctl_base + MCTL_CTL_CLEAR, 0x1, 1, 0);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 3a77945038c4..49f4b1b9151d 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -16,6 +16,7 @@
 
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/iopoll.h>
 #include <video/mipi_display.h>
@@ -32,20 +33,10 @@
 #include <drm/drm_probe_helper.h>
 
 #include "kirin9xx_dw_dsi_reg.h"
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#include "kirin970_dpe_reg.h"
-#else
-#include "kirin960_dpe_reg.h"
-#endif
+#include "kirin9xx_dpe.h"
 #include "kirin9xx_drm_drv.h"
 #include "kirin9xx_drm_dpe_utils.h"
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#define DTS_COMP_DSI_NAME "hisilicon,kirin970-dsi"
-#else
-#define DTS_COMP_DSI_NAME "hisilicon,kirin960-dsi"
-#endif
-
 #define ROUND(x, y)		((x) / (y) + \
 				((x) % (y) * 10 / (y) >= 5 ? 1 : 0))
 #define ROUND1(x, y)	((x) / (y) + ((x) % (y)  ? 1 : 0))
@@ -142,6 +133,8 @@ struct dsi_hw_ctx {
 	char __iomem *peri_crg_base;
 	void __iomem *pctrl_base;
 
+	u32 g_dss_version_tag;
+
 	struct clk *dss_dphy0_ref_clk;
 	struct clk *dss_dphy1_ref_clk;
 	struct clk *dss_dphy0_cfg_clk;
@@ -317,9 +310,8 @@ void dsi_set_output_client(struct drm_device *dev)
 }
 EXPORT_SYMBOL(dsi_set_output_client);
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
-			      struct mipi_phy_params *phy_ctrl, u32 id)
+static void kirin970_get_dsi_dphy_ctrl(struct dw_dsi *dsi,
+				       struct mipi_phy_params *phy_ctrl, u32 id)
 {
 	struct mipi_panel_info *mipi = NULL;
 	struct drm_display_mode *mode = NULL;
@@ -548,9 +540,9 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 		phy_ctrl->data_lane_hs2lp_time,
 		phy_ctrl->phy_stop_wait_time);
 }
-#else
-static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
-			     struct mipi_phy_params *phy_ctrl, u32 id)
+
+static void kirin960_get_dsi_phy_ctrl(struct dw_dsi *dsi,
+				      struct mipi_phy_params *phy_ctrl, u32 id)
 {
 	struct mipi_panel_info *mipi = NULL;
 	struct drm_display_mode *mode = NULL;
@@ -880,7 +872,6 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 		phy_ctrl->data_lane_hs2lp_time,
 		phy_ctrl->phy_stop_wait_time);
 }
-#endif
 
 static void dw_dsi_set_mode(struct dw_dsi *dsi, enum dsi_work_mode mode)
 {
@@ -1022,6 +1013,7 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi,
 static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 			  u32 id)
 {
+	struct dsi_hw_ctx *ctx = dsi->ctx;
 	u32 hline_time = 0;
 	u32 hsa_time = 0;
 	u32 hbp_time = 0;
@@ -1033,9 +1025,6 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	struct dss_rect rect;
 	u32 cmp_stopstate_val = 0;
 	u32 lanes;
-#if !defined(CONFIG_DRM_HISI_KIRIN970)
-	int i = 0;
-#endif
 
 	WARN_ON(!dsi);
 	WARN_ON(!mipi_dsi_base);
@@ -1051,11 +1040,10 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	memset(&dsi->phy, 0, sizeof(struct mipi_phy_params));
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	get_dsi_dphy_ctrl(dsi, &dsi->phy, id);
-#else
-	get_dsi_phy_ctrl(dsi, &dsi->phy, id);
-#endif
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
+		kirin970_get_dsi_dphy_ctrl(dsi, &dsi->phy, id);
+	else
+		kirin960_get_dsi_phy_ctrl(dsi, &dsi->phy, id);
 
 	rect.x = 0;
 	rect.y = 0;
@@ -1074,115 +1062,119 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	writel(0x00000001, mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
 	writel(0x00000000, mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	dsi_phy_tst_set(mipi_dsi_base, 0x0042, 0x21);
-	//PLL configuration I
-	dsi_phy_tst_set(mipi_dsi_base, 0x0046, dsi->phy.rg_cp + (dsi->phy.rg_lpf_r << 4));
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		dsi_phy_tst_set(mipi_dsi_base, 0x0042, 0x21);
+		//PLL configuration I
+		dsi_phy_tst_set(mipi_dsi_base, 0x0046,
+				dsi->phy.rg_cp + (dsi->phy.rg_lpf_r << 4));
 
-	//PLL configuration II
-	dsi_phy_tst_set(mipi_dsi_base, 0x0048, dsi->phy.rg_0p8v + (dsi->phy.rg_2p5g << 1) +
-		(dsi->phy.rg_320m << 2) + (dsi->phy.rg_band_sel << 3));
+		//PLL configuration II
+		dsi_phy_tst_set(mipi_dsi_base, 0x0048,
+				dsi->phy.rg_0p8v + (dsi->phy.rg_2p5g << 1) +
+				(dsi->phy.rg_320m << 2) + (dsi->phy.rg_band_sel << 3));
 
-	//PLL configuration III
-	dsi_phy_tst_set(mipi_dsi_base, 0x0049, dsi->phy.rg_pre_div);
+		//PLL configuration III
+		dsi_phy_tst_set(mipi_dsi_base, 0x0049, dsi->phy.rg_pre_div);
 
-	//PLL configuration IV
-	dsi_phy_tst_set(mipi_dsi_base, 0x004A, dsi->phy.rg_div);
+		//PLL configuration IV
+		dsi_phy_tst_set(mipi_dsi_base, 0x004A, dsi->phy.rg_div);
 
-	dsi_phy_tst_set(mipi_dsi_base, 0x004F, 0xf0);
-	dsi_phy_tst_set(mipi_dsi_base, 0x0050, 0xc0);
-	dsi_phy_tst_set(mipi_dsi_base, 0x0051, 0x22);
+		dsi_phy_tst_set(mipi_dsi_base, 0x004F, 0xf0);
+		dsi_phy_tst_set(mipi_dsi_base, 0x0050, 0xc0);
+		dsi_phy_tst_set(mipi_dsi_base, 0x0051, 0x22);
 
-	dsi_phy_tst_set(mipi_dsi_base, 0x0053, dsi->phy.rg_vrefsel_vcm);
+		dsi_phy_tst_set(mipi_dsi_base, 0x0053, dsi->phy.rg_vrefsel_vcm);
 
-	/*enable BTA*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x0054, 0x03);
+		/*enable BTA*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x0054, 0x03);
 
-	//PLL update control
-	dsi_phy_tst_set(mipi_dsi_base, 0x004B, 0x1);
+		//PLL update control
+		dsi_phy_tst_set(mipi_dsi_base, 0x004B, 0x1);
 
-	//set dphy spec parameter
-	mipi_config_dphy_spec1v2_parameter(dsi, mipi_dsi_base, id);
-#else
-	/* physical configuration PLL I*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x14,
-			(dsi->phy.rg_pll_fbd_s << 4) + (dsi->phy.rg_pll_enswc << 3) +
-		(dsi->phy.rg_pll_enbwt << 2) + dsi->phy.rg_pll_chp);
+		//set dphy spec parameter
+		mipi_config_dphy_spec1v2_parameter(dsi, mipi_dsi_base, id);
+	} else {
+		int i = 0;
 
-	/* physical configuration PLL II, M*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x15, dsi->phy.rg_pll_fbd_p);
+		/* physical configuration PLL I*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x14,
+				(dsi->phy.rg_pll_fbd_s << 4) + (dsi->phy.rg_pll_enswc << 3) +
+				(dsi->phy.rg_pll_enbwt << 2) + dsi->phy.rg_pll_chp);
 
-	/* physical configuration PLL III*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x16,
-			(dsi->phy.rg_pll_cp << 5) + (dsi->phy.rg_pll_lpf_cs << 4) +
-		dsi->phy.rg_pll_refsel);
+		/* physical configuration PLL II, M*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x15, dsi->phy.rg_pll_fbd_p);
 
-	/* physical configuration PLL IV, N*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x17, dsi->phy.rg_pll_pre_p);
+		/* physical configuration PLL III*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x16,
+				(dsi->phy.rg_pll_cp << 5) + (dsi->phy.rg_pll_lpf_cs << 4) +
+				dsi->phy.rg_pll_refsel);
 
-	/* sets the analog characteristic of V reference in D-PHY TX*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x1D, dsi->phy.rg_vrefsel_vcm);
+		/* physical configuration PLL IV, N*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x17, dsi->phy.rg_pll_pre_p);
 
-	/* MISC AFE Configuration*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x1E,
-			(dsi->phy.rg_pll_cp_p << 5) + (dsi->phy.reload_sel << 4) +
-		(dsi->phy.rg_phase_gen_en << 3) + (dsi->phy.rg_band_sel << 2) +
-		(dsi->phy.pll_power_down << 1) + dsi->phy.pll_register_override);
+		/* sets the analog characteristic of V reference in D-PHY TX*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x1D, dsi->phy.rg_vrefsel_vcm);
 
-	/*reload_command*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x1F, dsi->phy.load_command);
+		/* MISC AFE Configuration*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x1E,
+				(dsi->phy.rg_pll_cp_p << 5) + (dsi->phy.reload_sel << 4) +
+				(dsi->phy.rg_phase_gen_en << 3) + (dsi->phy.rg_band_sel << 2) +
+				(dsi->phy.pll_power_down << 1) + dsi->phy.pll_register_override);
 
-	/* pre_delay of clock lane request setting*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x20, DSS_REDUCE(dsi->phy.clk_pre_delay));
+		/*reload_command*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x1F, dsi->phy.load_command);
 
-	/* post_delay of clock lane request setting*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x21, DSS_REDUCE(dsi->phy.clk_post_delay));
+		/* pre_delay of clock lane request setting*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x20, DSS_REDUCE(dsi->phy.clk_pre_delay));
 
-	/* clock lane timing ctrl - t_lpx*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x22, DSS_REDUCE(dsi->phy.clk_t_lpx));
+		/* post_delay of clock lane request setting*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x21, DSS_REDUCE(dsi->phy.clk_post_delay));
 
-	/* clock lane timing ctrl - t_hs_prepare*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x23, DSS_REDUCE(dsi->phy.clk_t_hs_prepare));
+		/* clock lane timing ctrl - t_lpx*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x22, DSS_REDUCE(dsi->phy.clk_t_lpx));
 
-	/* clock lane timing ctrl - t_hs_zero*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x24, DSS_REDUCE(dsi->phy.clk_t_hs_zero));
+		/* clock lane timing ctrl - t_hs_prepare*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x23, DSS_REDUCE(dsi->phy.clk_t_hs_prepare));
 
-	/* clock lane timing ctrl - t_hs_trial*/
-	dsi_phy_tst_set(mipi_dsi_base, 0x25, dsi->phy.clk_t_hs_trial);
+		/* clock lane timing ctrl - t_hs_zero*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x24, DSS_REDUCE(dsi->phy.clk_t_hs_zero));
 
-	for (i = 0; i <= lanes; i++) {
-		/* data lane pre_delay*/
-		tmp = 0x30 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_pre_delay));
+		/* clock lane timing ctrl - t_hs_trial*/
+		dsi_phy_tst_set(mipi_dsi_base, 0x25, dsi->phy.clk_t_hs_trial);
 
-		/*data lane post_delay*/
-		tmp = 0x31 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_post_delay));
+		for (i = 0; i <= lanes; i++) {
+			/* data lane pre_delay*/
+			tmp = 0x30 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_pre_delay));
 
-		/* data lane timing ctrl - t_lpx*/
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_lpx));
+			/*data lane post_delay*/
+			tmp = 0x31 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_post_delay));
 
-		/* data lane timing ctrl - t_hs_prepare*/
-		tmp = 0x33 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_hs_prepare));
+			/* data lane timing ctrl - t_lpx*/
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_lpx));
 
-		/* data lane timing ctrl - t_hs_zero*/
-		tmp = 0x34 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_hs_zero));
+			/* data lane timing ctrl - t_hs_prepare*/
+			tmp = 0x33 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_hs_prepare));
 
-		/* data lane timing ctrl - t_hs_trial*/
-		tmp = 0x35 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_hs_trial));
+			/* data lane timing ctrl - t_hs_zero*/
+			tmp = 0x34 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_hs_zero));
 
-		/* data lane timing ctrl - t_ta_go*/
-		tmp = 0x36 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_ta_go));
+			/* data lane timing ctrl - t_hs_trial*/
+			tmp = 0x35 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_hs_trial));
 
-		/* data lane timing ctrl - t_ta_get*/
-		tmp = 0x37 + (i << 4);
-		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_ta_get));
+			/* data lane timing ctrl - t_ta_go*/
+			tmp = 0x36 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_ta_go));
+
+			/* data lane timing ctrl - t_ta_get*/
+			tmp = 0x37 + (i << 4);
+			dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_ta_get));
+		}
 	}
-#endif
 
 	writel(0x00000007, mipi_dsi_base + MIPIDSI_PHY_RSTZ_OFFSET);
 
@@ -1324,12 +1316,12 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET,
 		dsi->phy.data_lane_hs2lp_time, 10, 16);
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	//16~19bit:pclk_en, pclk_sel, dpipclk_en, dpipclk_sel
-	set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, 0x5, 4, 16);
-	//0:dphy
-	set_reg(mipi_dsi_base + PHY_MODE, 0x0, 1, 0);
-#endif
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)  {
+		//16~19bit:pclk_en, pclk_sel, dpipclk_en, dpipclk_sel
+		set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, 0x5, 4, 16);
+		//0:dphy
+		set_reg(mipi_dsi_base + KIRIN970_PHY_MODE, 0x0, 1, 0);
+	}
 
 	/* Waking up Core*/
 	set_reg(mipi_dsi_base + MIPIDSI_PWR_UP_OFFSET, 0x1, 1, 0);
@@ -1366,15 +1358,16 @@ static void dsi_encoder_disable(struct drm_encoder *encoder)
 static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 			    u32 id)
 {
+	struct dsi_hw_ctx *ctx = dsi->ctx;
+
 	WARN_ON(!mipi_dsi_base);
 
 	/* mipi init */
 	dsi_mipi_init(dsi, mipi_dsi_base, id);
 
 	/* dsi memory init */
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	writel(0x02600008, mipi_dsi_base + DSI_MEM_CTRL);
-#endif
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
+		writel(0x02600008, mipi_dsi_base + KIRIN970_DSI_MEM_CTRL);
 
 	/* switch to cmd mode */
 	set_reg(mipi_dsi_base + MIPIDSI_MODE_CFG_OFFSET, 0x1, 1, 0);
@@ -1391,6 +1384,8 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 {
+	struct dsi_hw_ctx *ctx = dsi->ctx;
+
 	u64 pctrl_dphytx_stopcnt = 0;
 
 	WARN_ON(!mipi_dsi_base);
@@ -1404,16 +1399,16 @@ static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	/* enable generate High Speed clock, continue clock */
 	set_reg(mipi_dsi_base + MIPIDSI_LPCLK_CTRL_OFFSET, 0x1, 2, 0);
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	// init: wait DPHY 4 data lane stopstate
-	pctrl_dphytx_stopcnt = (u64)(dsi->ldi.h_back_porch +
-		dsi->ldi.h_front_porch + dsi->ldi.h_pulse_width + dsi->cur_mode.hdisplay + 5) *
-		DEFAULT_PCLK_PCTRL_RATE / (dsi->cur_mode.clock * 1000);
-	DRM_DEBUG("pctrl_dphytx_stopcnt = %llu\n", pctrl_dphytx_stopcnt);
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		// init: wait DPHY 4 data lane stopstate
+		pctrl_dphytx_stopcnt = (u64)(dsi->ldi.h_back_porch +
+			dsi->ldi.h_front_porch + dsi->ldi.h_pulse_width + dsi->cur_mode.hdisplay + 5) *
+			DEFAULT_PCLK_PCTRL_RATE / (dsi->cur_mode.clock * 1000);
+		DRM_DEBUG("pctrl_dphytx_stopcnt = %llu\n", pctrl_dphytx_stopcnt);
 
-	//FIXME:
-	writel((u32)pctrl_dphytx_stopcnt, dsi->ctx->pctrl_base + PERI_CTRL29);
-#endif
+		//FIXME:
+		writel((u32)pctrl_dphytx_stopcnt, dsi->ctx->pctrl_base + PERI_CTRL29);
+	}
 
 	return 0;
 }
@@ -1964,13 +1959,17 @@ static int dsi_parse_endpoint(struct dw_dsi *dsi,
 static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
+	const char *compatible;
 	int ret = 0;
 	struct device_node *np = NULL;
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
+		compatible = "hisilicon,kirin970-dsi";
+	else
+		compatible = "hisilicon,kirin960-dsi";
 
-	np = of_find_compatible_node(NULL, NULL, DTS_COMP_DSI_NAME);
+	np = of_find_compatible_node(NULL, NULL, compatible);
 	if (!np) {
-		DRM_ERROR("NOT FOUND device node %s!\n",
-			  DTS_COMP_DSI_NAME);
+		DRM_ERROR("NOT FOUND device node %s!\n", compatible);
 		return -ENXIO;
 	}
 
@@ -1986,13 +1985,13 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 		return -ENXIO;
 	}
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-	ctx->pctrl_base = of_iomap(np, 2);
-	if (!(ctx->pctrl_base)) {
-		DRM_ERROR("failed to get dss pctrl_base resource.\n");
-		return -ENXIO;
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		ctx->pctrl_base = of_iomap(np, 2);
+		if (!(ctx->pctrl_base)) {
+			DRM_ERROR("failed to get dss pctrl_base resource.\n");
+			return -ENXIO;
+		}
 	}
-#endif
 
 	dsi->gpio_mux = devm_gpiod_get(&pdev->dev, "mux", GPIOD_OUT_HIGH);
 	if (IS_ERR(dsi->gpio_mux))
@@ -2066,6 +2065,8 @@ static int dsi_probe(struct platform_device *pdev)
 	ctx = &data->ctx;
 	dsi->ctx = ctx;
 
+	ctx->g_dss_version_tag = (long)of_device_get_match_data(dev);
+
 	/* parse HDMI bridge endpoint */
 	ret = dsi_parse_endpoint(dsi, np, OUT_HDMI);
 	if (ret)
@@ -2105,7 +2106,13 @@ static int dsi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dsi_of_match[] = {
-	{.compatible = DTS_COMP_DSI_NAME},
+	{
+		.compatible = "hisilicon,kirin960-dsi",
+		.data = (void *)FB_ACCEL_HI366x
+	}, {
+		.compatible = "hisilicon,kirin970-dsi",
+		.data = (void *)FB_ACCEL_KIRIN970
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dsi_of_match);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
index d0b1be278367..d686664b8627 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
@@ -27,11 +27,7 @@
 #include "kirin9xx_fb_panel.h"
 #include "kirin9xx_dw_dsi_reg.h"
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#include "kirin970_dpe_reg.h"
-#else
-#include "kirin960_dpe_reg.h"
-#endif
+#include "kirin9xx_dpe.h"
 
 /* default pwm clk */
 #define DEFAULT_PWM_CLK_RATE	(80 * 1000000L)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
