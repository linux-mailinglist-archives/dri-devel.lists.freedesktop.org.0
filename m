Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC9186062
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF806E225;
	Sun, 15 Mar 2020 23:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66A6E2B0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 13:23:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i13so5237502pfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B279Y4lL9oL2Rj9sTxPqADku8sko8sl3B/nuAo/JgRw=;
 b=TSBUa1xjboWgkscWDDWMGHu2LrTBabsR1C0IHfhkymN5Lf13JwK9K+nFC+EbzsGHVt
 vvK0V7VyTz5tTTn+x0mS1J+qhCSMq5lLTqpfuJxnh7VvCv0RRb5pN0O7YZh91gh9VAHk
 DlK++H6dea/Z5iw0N9K+GvRfVOWIfZFn6/sdBdfF6GYhcatlFWRgj06hINpHG86Lw+wQ
 2KyulzO35gzdWP6IjLelfTdeb91MsH2VY/6WryZm0gK4zxwMYemCRM2Q11FPiAlT4wPJ
 fOQDCI74JV8krm85ogQBd3xqiK+hFqxGDdSIf1r4xyXGdas/nikCCiU4obVyTyihUEoH
 dzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B279Y4lL9oL2Rj9sTxPqADku8sko8sl3B/nuAo/JgRw=;
 b=POKtywWfmMfZz6s+4TL+GX3SaKIA+pkrHz07Ek/l53l/vJ19TttI7DNr7g8VLi6Nzi
 MeE4BpMqEnqmcwx44KaoduUZ6Hthh92pG+soUlX6X3tH86XRd0sPenOFFAPUOuuSzXpd
 TOeD9+xJBWM85fW9kTOoZcN63cFohykfRxZEfzVcRU1mGEOvszauaVcQF316HmcQSMrN
 bmfgKouSnAwc8cDbh7pei84QmlPbc/rAFVQyjvDe8nvOh8sMNytJ1vPzVZuW1rSQRnx+
 Pp3uACZNIWBNcKIfI8VuNCiXDsimbsYYtpltGqhcgCA56KcRFKjLe7dOLvofybUyYWGr
 pYnA==
X-Gm-Message-State: ANhLgQ2tN5koXce59iiAg7ICr7KKYIDTWguSicye7qBKtk7g810EGMpE
 84Cctr0LjdzjW2+ar4jo6ww=
X-Google-Smtp-Source: ADFU+vvLvmh64LQf/+1nXUO2HmMYrkP81RgKMYKT1FXghOLcVDvi0mmUZ77SotARG6mzwzJNeIAtDw==
X-Received: by 2002:a63:8c12:: with SMTP id m18mr12678163pgd.192.1584105789787; 
 Fri, 13 Mar 2020 06:23:09 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y9sm21490296pgo.80.2020.03.13.06.23.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 13 Mar 2020 06:23:09 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v5 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Date: Fri, 13 Mar 2020 21:22:45 +0800
Message-Id: <1584105767-11963-5-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
References: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds DPU(Display Processor Unit) support for the Unisoc's display subsystem.
It's support multi planes, scaler, rotation, PQ(Picture Quality) and more.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/sprd/Makefile       |   5 +-
 drivers/gpu/drm/sprd/dpu/Makefile   |   7 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 750 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.c     | 501 ++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h     | 170 ++++++++
 drivers/gpu/drm/sprd/sprd_drm.c     |   1 +
 drivers/gpu/drm/sprd/sprd_drm.h     |   2 +
 7 files changed, 1435 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h

diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
index 86d95d9..88ab32a 100644
--- a/drivers/gpu/drm/sprd/Makefile
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -2,4 +2,7 @@
 
 subdir-ccflags-y += -I$(srctree)/$(src)
 
-obj-y := sprd_drm.o
+obj-y := sprd_drm.o \
+	sprd_dpu.o
+
+obj-y += dpu/
diff --git a/drivers/gpu/drm/sprd/dpu/Makefile b/drivers/gpu/drm/sprd/dpu/Makefile
new file mode 100644
index 0000000..73bd497
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dpu/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifdef CONFIG_ARM64
+KBUILD_CFLAGS += -mstrict-align
+endif
+
+obj-y += dpu_r2p0.o
diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
new file mode 100644
index 0000000..226b107
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
@@ -0,0 +1,750 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#include "sprd_dpu.h"
+
+#define DPU_INT_FBC_PLD_ERR_MASK	BIT(8)
+#define DPU_INT_FBC_HDR_ERR_MASK	BIT(9)
+
+#define DPU_INT_MMU_INV_WR_MASK		BIT(19)
+#define DPU_INT_MMU_INV_RD_MASK		BIT(18)
+#define DPU_INT_MMU_VAOR_WR_MASK	BIT(17)
+#define DPU_INT_MMU_VAOR_RD_MASK	BIT(16)
+
+/**
+ * Sprd DPU Layer registers layout structure
+ *
+ * Each DPU layer has the same register organization,
+ * depends on the Sprd DPU IP version, the maximum number of layers
+ * supported will be different.
+ *
+ * @addr: buffer DMA base address
+ * @ctrl: layer config register
+ * @size: layer size, it's pixel unit.
+ * @pitch: layer pitch, it's pixel unit.
+ * @pos: layer display position
+ * @alpha: layer alpha
+ * @ck: layer Color-Key Value
+ * @pallete: layer pallete RGB
+ * @crop_start: layer crop start position, it's pixel unit.
+ */
+struct layer_reg {
+	u32 addr[4];
+	u32 ctrl;
+	u32 size;
+	u32 pitch;
+	u32 pos;
+	u32 alpha;
+	u32 ck;
+	u32 pallete;
+	u32 crop_start;
+};
+
+/**
+ * Sprd DPU Write Back register structure
+ *
+ * DPU_R2P0 IP verison, write back is disabled.
+ *
+ * @pos: writeback region position
+ * @size: writeback region size
+ */
+struct wb_region_reg {
+	u32 pos;
+	u32 size;
+};
+
+/**
+ * Sprd DPU controller registers structure
+ *
+ * This structure decribes the display controller registers and
+ * depends on the Sprd DPU IP version
+ *
+ * See Sprd's datasheet for a detailled description of these registers.
+ */
+struct dpu_reg {
+	u32 dpu_version;
+	u32 dpu_ctrl;
+	u32 dpu_cfg0;
+	u32 dpu_cfg1;
+	u32 dpu_cfg2;
+	u32 dpu_secure;
+	u32 reserved_0x0018_0x001C[2];
+	u32 panel_size;
+	u32 blend_size;
+	u32 reserved_0x0028;
+	u32 bg_color;
+	struct layer_reg layers[8];
+	u32 wb_base_addr;
+	u32 wb_ctrl;
+	u32 wb_cfg;
+	u32 wb_pitch;
+	struct wb_region_reg region[3];
+	u32 reserved_0x01D8_0x01DC[2];
+	u32 dpu_int_en;
+	u32 dpu_int_clr;
+	u32 dpu_int_sts;
+	u32 dpu_int_raw;
+	u32 dpi_ctrl;
+	u32 dpi_h_timing;
+	u32 dpi_v_timing;
+	u32 reserved_0x01FC;
+	u32 dpu_enhance_cfg;
+	u32 reserved_0x0204_0x020C[3];
+	u32 epf_epsilon;
+	u32 epf_gain0_3;
+	u32 epf_gain4_7;
+	u32 epf_diff;
+	u32 reserved_0x0220_0x023C[8];
+	u32 hsv_lut_addr;
+	u32 hsv_lut_wdata;
+	u32 hsv_lut_rdata;
+	u32 reserved_0x024C_0x027C[13];
+	u32 cm_coef01_00;
+	u32 cm_coef03_02;
+	u32 cm_coef11_10;
+	u32 cm_coef13_12;
+	u32 cm_coef21_20;
+	u32 cm_coef23_22;
+	u32 reserved_0x0298_0x02BC[10];
+	u32 slp_cfg0;
+	u32 slp_cfg1;
+	u32 reserved_0x02C8_0x02FC[14];
+	u32 gamma_lut_addr;
+	u32 gamma_lut_wdata;
+	u32 gamma_lut_rdata;
+	u32 reserved_0x030C_0x033C[13];
+	u32 checksum_en;
+	u32 checksum0_start_pos;
+	u32 checksum0_end_pos;
+	u32 checksum1_start_pos;
+	u32 checksum1_end_pos;
+	u32 checksum0_result;
+	u32 checksum1_result;
+	u32 reserved_0x035C;
+	u32 dpu_sts[18];
+	u32 reserved_0x03A8_0x03AC[2];
+	u32 dpu_fbc_cfg0;
+	u32 dpu_fbc_cfg1;
+	u32 reserved_0x03B8_0x03EC[14];
+	u32 rf_ram_addr;
+	u32 rf_ram_rdata_low;
+	u32 rf_ram_rdata_high;
+	u32 reserved_0x03FC_0x07FC[257];
+	u32 mmu_en;
+	u32 mmu_update;
+	u32 mmu_min_vpn;
+	u32 mmu_vpn_range;
+	u32 mmu_pt_addr;
+	u32 mmu_default_page;
+	u32 mmu_vaor_addr_rd;
+	u32 mmu_vaor_addr_wr;
+	u32 mmu_inv_addr_rd;
+	u32 mmu_inv_addr_wr;
+	u32 mmu_uns_addr_rd;
+	u32 mmu_uns_addr_wr;
+	u32 mmu_miss_cnt;
+	u32 mmu_pt_update_qos;
+	u32 mmu_version;
+	u32 mmu_min_ppn1;
+	u32 mmu_ppn_range1;
+	u32 mmu_min_ppn2;
+	u32 mmu_ppn_range2;
+	u32 mmu_vpn_paor_rd;
+	u32 mmu_vpn_paor_wr;
+	u32 mmu_ppn_paor_rd;
+	u32 mmu_ppn_paor_wr;
+	u32 mmu_reg_au_manage;
+	u32 mmu_page_rd_ch;
+	u32 mmu_page_wr_ch;
+	u32 mmu_read_page_cmd_cnt;
+	u32 mmu_read_page_latency_cnt;
+	u32 mmu_page_max_latency;
+};
+
+static void dpu_dump(struct dpu_context *ctx)
+{
+	u32 *reg = (u32 *)ctx->base;
+	int i;
+
+	DRM_INFO("      0          4          8          C\n");
+	for (i = 0; i < 256; i += 4) {
+		DRM_INFO("%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i + 3]);
+	}
+}
+
+static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	u32 mmu_mask = DPU_INT_MMU_VAOR_RD_MASK |
+			DPU_INT_MMU_VAOR_WR_MASK |
+			DPU_INT_MMU_INV_RD_MASK |
+			DPU_INT_MMU_INV_WR_MASK;
+	u32 val = reg_val & mmu_mask;
+
+	if (val) {
+		DRM_ERROR("--- iommu interrupt err: 0x%04x ---\n", val);
+
+		DRM_ERROR("iommu invalid read error, addr: 0x%08x\n",
+			reg->mmu_inv_addr_rd);
+		DRM_ERROR("iommu invalid write error, addr: 0x%08x\n",
+			reg->mmu_inv_addr_wr);
+		DRM_ERROR("iommu va out of range read error, addr: 0x%08x\n",
+			reg->mmu_vaor_addr_rd);
+		DRM_ERROR("iommu va out of range write error, addr: 0x%08x\n",
+			reg->mmu_vaor_addr_wr);
+		DRM_ERROR("BUG: iommu failure at %s:%d/%s()!\n",
+			__FILE__, __LINE__, __func__);
+
+		dpu_dump(ctx);
+	}
+
+	return val;
+}
+
+static void dpu_clean_all(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(reg->layers); i++)
+		reg->layers[i].ctrl = 0;
+}
+
+static u32 dpu_isr(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	u32 reg_val, int_mask = 0;
+
+	reg_val = reg->dpu_int_sts;
+
+	/* disable err interrupt */
+	if (reg_val & DPU_INT_ERR_MASK)
+		int_mask |= DPU_INT_ERR_MASK;
+
+	/* dpu update done isr */
+	if (reg_val & DPU_INT_UPDATE_DONE_MASK) {
+		ctx->evt_update = true;
+		wake_up_interruptible_all(&ctx->wait_queue);
+	}
+
+	/* dpu stop done isr */
+	if (reg_val & DPU_INT_DONE_MASK) {
+		ctx->evt_stop = true;
+		wake_up_interruptible_all(&ctx->wait_queue);
+	}
+
+	/* dpu ifbc payload error isr */
+	if (reg_val & DPU_INT_FBC_PLD_ERR_MASK) {
+		int_mask |= DPU_INT_FBC_PLD_ERR_MASK;
+		DRM_ERROR("dpu ifbc payload error\n");
+	}
+
+	/* dpu ifbc header error isr */
+	if (reg_val & DPU_INT_FBC_HDR_ERR_MASK) {
+		int_mask |= DPU_INT_FBC_HDR_ERR_MASK;
+		DRM_ERROR("dpu ifbc header error\n");
+	}
+
+	int_mask |= check_mmu_isr(ctx, reg_val);
+
+	reg->dpu_int_clr = reg_val;
+	reg->dpu_int_en &= ~int_mask;
+
+	return reg_val;
+}
+
+static int dpu_wait_stop_done(struct dpu_context *ctx)
+{
+	int rc;
+
+	if (ctx->stopped)
+		return 0;
+
+	rc = wait_event_interruptible_timeout(ctx->wait_queue, ctx->evt_stop,
+					       msecs_to_jiffies(500));
+	ctx->evt_stop = false;
+
+	ctx->stopped = true;
+
+	if (!rc) {
+		DRM_ERROR("dpu wait for stop done time out!\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int dpu_wait_update_done(struct dpu_context *ctx)
+{
+	int rc;
+
+	ctx->evt_update = false;
+
+	rc = wait_event_interruptible_timeout(ctx->wait_queue, ctx->evt_update,
+					       msecs_to_jiffies(500));
+
+	if (!rc) {
+		DRM_ERROR("dpu wait for reg update done time out!\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void dpu_stop(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	if (ctx->if_type == SPRD_DPU_IF_DPI)
+		reg->dpu_ctrl |= BIT(1);
+
+	dpu_wait_stop_done(ctx);
+}
+
+static void dpu_run(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_ctrl |= BIT(0);
+
+	ctx->stopped = false;
+}
+
+static void dpu_init(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	u32 size;
+
+	reg->bg_color = 0;
+
+	size = (ctx->vm.vactive << 16) | ctx->vm.hactive;
+	reg->panel_size = size;
+	reg->blend_size = size;
+
+	reg->dpu_cfg0 = BIT(4) | BIT(5);
+
+	reg->dpu_cfg1 = 0x004466da;
+	reg->dpu_cfg2 = 0;
+
+	if (ctx->stopped)
+		dpu_clean_all(ctx);
+
+	reg->mmu_en = 0;
+	reg->mmu_min_ppn1 = 0;
+	reg->mmu_ppn_range1 = 0xffff;
+	reg->mmu_min_ppn2 = 0;
+	reg->mmu_ppn_range2 = 0xffff;
+	reg->mmu_vpn_range = 0x1ffff;
+
+	reg->dpu_int_clr = 0xffff;
+}
+
+static void dpu_fini(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_int_en = 0;
+	reg->dpu_int_clr = 0xff;
+}
+
+enum {
+	DPU_LAYER_FORMAT_YUV422_2PLANE,
+	DPU_LAYER_FORMAT_YUV420_2PLANE,
+	DPU_LAYER_FORMAT_YUV420_3PLANE,
+	DPU_LAYER_FORMAT_ARGB8888,
+	DPU_LAYER_FORMAT_RGB565,
+	DPU_LAYER_FORMAT_MAX_TYPES,
+};
+
+enum {
+	DPU_LAYER_ROTATION_0,
+	DPU_LAYER_ROTATION_90,
+	DPU_LAYER_ROTATION_180,
+	DPU_LAYER_ROTATION_270,
+	DPU_LAYER_ROTATION_0_M,
+	DPU_LAYER_ROTATION_90_M,
+	DPU_LAYER_ROTATION_180_M,
+	DPU_LAYER_ROTATION_270_M,
+};
+
+static u32 to_dpu_rotation(u32 angle)
+{
+	u32 rot = DPU_LAYER_ROTATION_0;
+
+	switch (angle) {
+	case DRM_MODE_ROTATE_0:
+		rot = DPU_LAYER_ROTATION_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		rot = DPU_LAYER_ROTATION_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		rot = DPU_LAYER_ROTATION_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		rot = DPU_LAYER_ROTATION_270;
+		break;
+	case DRM_MODE_REFLECT_Y:
+		rot = DPU_LAYER_ROTATION_180_M;
+		break;
+	case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
+		rot = DPU_LAYER_ROTATION_90_M;
+		break;
+	case DRM_MODE_REFLECT_X:
+		rot = DPU_LAYER_ROTATION_0_M;
+		break;
+	case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
+		rot = DPU_LAYER_ROTATION_270_M;
+		break;
+	default:
+		/* Do nothing */
+		break;
+	}
+
+	return rot;
+}
+
+static u32 dpu_img_ctrl(u32 format, u32 blending, u32 rotation)
+{
+	int reg_val = 0;
+
+	/* layer enable */
+	reg_val |= BIT(0);
+
+	switch (format) {
+	case DRM_FORMAT_BGRA8888:
+		/* BGRA8888 -> ARGB8888 */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
+		reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
+		break;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+		/* RGBA8888 -> ABGR8888 */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
+		/* FALLTHRU */
+	case DRM_FORMAT_ABGR8888:
+		/* rb switch */
+		reg_val |= BIT(10);
+		/* FALLTHRU */
+	case DRM_FORMAT_ARGB8888:
+		reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
+		break;
+	case DRM_FORMAT_XBGR8888:
+		/* rb switch */
+		reg_val |= BIT(10);
+		/* FALLTHRU */
+	case DRM_FORMAT_XRGB8888:
+		reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
+		break;
+	case DRM_FORMAT_BGR565:
+		/* rb switch */
+		reg_val |= BIT(10);
+		/* FALLTHRU */
+	case DRM_FORMAT_RGB565:
+		reg_val |= (DPU_LAYER_FORMAT_RGB565 << 4);
+		break;
+	case DRM_FORMAT_NV12:
+		/* 2-Lane: Yuv420 */
+		reg_val |= DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
+		/* Y endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
+		/* UV endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
+		break;
+	case DRM_FORMAT_NV21:
+		/* 2-Lane: Yuv420 */
+		reg_val |= DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
+		/* Y endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
+		/* UV endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
+		break;
+	case DRM_FORMAT_NV16:
+		/* 2-Lane: Yuv422 */
+		reg_val |= DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
+		/* Y endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
+		/* UV endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
+		break;
+	case DRM_FORMAT_NV61:
+		/* 2-Lane: Yuv422 */
+		reg_val |= DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
+		/* Y endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
+		/* UV endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
+		break;
+	case DRM_FORMAT_YUV420:
+		reg_val |= DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
+		/* Y endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
+		/* UV endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
+		break;
+	case DRM_FORMAT_YVU420:
+		reg_val |= DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
+		/* Y endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
+		/* UV endian */
+		reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
+		break;
+	default:
+		/* Do nothing */
+		break;
+	}
+
+	switch (blending) {
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		/* don't do blending, maybe RGBX */
+		/* alpha mode select - layer alpha */
+		reg_val |= BIT(2);
+		break;
+	case DRM_MODE_BLEND_COVERAGE:
+		/* alpha mode select - combo alpha */
+		reg_val |= BIT(3);
+		/* Normal mode */
+		reg_val &= (~BIT(16));
+		break;
+	case DRM_MODE_BLEND_PREMULTI:
+		/* alpha mode select - combo alpha */
+		reg_val |= BIT(3);
+		/* Pre-mult mode */
+		reg_val |= BIT(16);
+		break;
+	default:
+		/* Do nothing */
+		break;
+	}
+
+	rotation = to_dpu_rotation(rotation);
+	reg_val |= (rotation & 0x7) << 20;
+
+	return reg_val;
+}
+
+static void dpu_layer(struct dpu_context *ctx,
+		    struct dpu_layer *hwlayer)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	const struct drm_format_info *info = drm_format_info(hwlayer->format);
+	struct layer_reg *layer;
+	u32 addr, size, offset;
+	int i;
+
+	layer = &reg->layers[hwlayer->index];
+	offset = (hwlayer->dst_x & 0xffff) | ((hwlayer->dst_y) << 16);
+
+	if (hwlayer->src_w && hwlayer->src_h)
+		size = (hwlayer->src_w & 0xffff) | ((hwlayer->src_h) << 16);
+	else
+		size = (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) << 16);
+
+	for (i = 0; i < hwlayer->planes; i++) {
+		addr = hwlayer->addr[i];
+
+		if (addr % 16)
+			DRM_ERROR("layer addr[%d] is not 16 bytes align, it's 0x%08x\n",
+				i, addr);
+		layer->addr[i] = addr;
+	}
+
+	layer->pos = offset;
+	layer->size = size;
+	layer->crop_start = (hwlayer->src_y << 16) | hwlayer->src_x;
+	layer->alpha = hwlayer->alpha;
+
+	if (hwlayer->planes == 3)
+		/* UV pitch is 1/2 of Y pitch*/
+		layer->pitch = (hwlayer->pitch[0] / info->cpp[0]) |
+				(hwlayer->pitch[0] / info->cpp[0] << 15);
+	else
+		layer->pitch = hwlayer->pitch[0] / info->cpp[0];
+
+	layer->ctrl = dpu_img_ctrl(hwlayer->format, hwlayer->blending,
+		hwlayer->rotation);
+
+	DRM_DEBUG("dst_x = %d, dst_y = %d, dst_w = %d, dst_h = %d\n",
+				hwlayer->dst_x, hwlayer->dst_y,
+				hwlayer->dst_w, hwlayer->dst_h);
+	DRM_DEBUG("start_x = %d, start_y = %d, start_w = %d, start_h = %d\n",
+				hwlayer->src_x, hwlayer->src_y,
+				hwlayer->src_w, hwlayer->src_h);
+}
+
+static void dpu_flip(struct dpu_context *ctx,
+		     struct dpu_layer layers[], u8 count)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	int i;
+
+	/*
+	 * Make sure the dpu is in stop status. DPU_R2P0 has no shadow
+	 * registers in EDPI mode. So the config registers can only be
+	 * updated in the rising edge of DPU_RUN bit.
+	 */
+	if (ctx->if_type == SPRD_DPU_IF_EDPI)
+		dpu_wait_stop_done(ctx);
+
+	/* reset the bgcolor to black */
+	reg->bg_color = 0;
+
+	/* disable all the layers */
+	dpu_clean_all(ctx);
+
+	/* start configure dpu layers */
+	for (i = 0; i < count; i++)
+		dpu_layer(ctx, &layers[i]);
+
+	/* update trigger and wait */
+	if (ctx->if_type == SPRD_DPU_IF_DPI) {
+		if (!ctx->stopped) {
+			reg->dpu_ctrl |= BIT(2);
+			dpu_wait_update_done(ctx);
+		}
+
+		reg->dpu_int_en |= DPU_INT_ERR_MASK;
+
+	} else if (ctx->if_type == SPRD_DPU_IF_EDPI) {
+		reg->dpu_ctrl |= BIT(0);
+
+		ctx->stopped = false;
+	}
+
+	/*
+	 * If the following interrupt was disabled in isr,
+	 * re-enable it.
+	 */
+	reg->dpu_int_en |= DPU_INT_FBC_PLD_ERR_MASK |
+			   DPU_INT_FBC_HDR_ERR_MASK |
+			   DPU_INT_MMU_VAOR_RD_MASK |
+			   DPU_INT_MMU_VAOR_WR_MASK |
+			   DPU_INT_MMU_INV_RD_MASK |
+			   DPU_INT_MMU_INV_WR_MASK;
+}
+
+static void dpu_dpi_init(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	u32 int_mask = 0;
+
+	if (ctx->if_type == SPRD_DPU_IF_DPI) {
+		/* use dpi as interface */
+		reg->dpu_cfg0 &= ~BIT(0);
+
+		/* disable Halt function for SPRD DSI */
+		reg->dpi_ctrl &= ~BIT(16);
+
+		/* select te from external pad */
+		reg->dpi_ctrl |= BIT(10);
+
+		/* set dpi timing */
+		reg->dpi_h_timing = (ctx->vm.hsync_len << 0) |
+				    (ctx->vm.hback_porch << 8) |
+				    (ctx->vm.hfront_porch << 20);
+		reg->dpi_v_timing = (ctx->vm.vsync_len << 0) |
+				    (ctx->vm.vback_porch << 8) |
+				    (ctx->vm.vfront_porch << 20);
+		if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
+			DRM_WARN("Warning: (vsync + vbp) < 32, "
+				"underflow risk!\n");
+
+		/* enable dpu update done INT */
+		int_mask |= DPU_INT_UPDATE_DONE_MASK;
+		/* enable dpu DONE  INT */
+		int_mask |= DPU_INT_DONE_MASK;
+		/* enable dpu dpi vsync */
+		int_mask |= DPU_INT_DPI_VSYNC_MASK;
+		/* enable dpu TE INT */
+		int_mask |= DPU_INT_TE_MASK;
+		/* enable underflow err INT */
+		int_mask |= DPU_INT_ERR_MASK;
+		/* enable write back done INT */
+		int_mask |= DPU_INT_WB_DONE_MASK;
+		/* enable write back fail INT */
+		int_mask |= DPU_INT_WB_FAIL_MASK;
+
+	} else if (ctx->if_type == SPRD_DPU_IF_EDPI) {
+		/* use edpi as interface */
+		reg->dpu_cfg0 |= BIT(0);
+
+		/* use external te */
+		reg->dpi_ctrl |= BIT(10);
+
+		/* enable te */
+		reg->dpi_ctrl |= BIT(8);
+
+		/* enable stop DONE INT */
+		int_mask |= DPU_INT_DONE_MASK;
+		/* enable TE INT */
+		int_mask |= DPU_INT_TE_MASK;
+	}
+
+	/* enable ifbc payload error INT */
+	int_mask |= DPU_INT_FBC_PLD_ERR_MASK;
+	/* enable ifbc header error INT */
+	int_mask |= DPU_INT_FBC_HDR_ERR_MASK;
+	/* enable iommu va out of range read error INT */
+	int_mask |= DPU_INT_MMU_VAOR_RD_MASK;
+	/* enable iommu va out of range write error INT */
+	int_mask |= DPU_INT_MMU_VAOR_WR_MASK;
+	/* enable iommu invalid read error INT */
+	int_mask |= DPU_INT_MMU_INV_RD_MASK;
+	/* enable iommu invalid write error INT */
+	int_mask |= DPU_INT_MMU_INV_WR_MASK;
+
+	reg->dpu_int_en = int_mask;
+}
+
+static void enable_vsync(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_int_en |= DPU_INT_DPI_VSYNC_MASK;
+}
+
+static void disable_vsync(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_int_en &= ~DPU_INT_DPI_VSYNC_MASK;
+}
+
+static const u32 primary_fmts[] = {
+	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBX8888, DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
+	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16, DRM_FORMAT_NV61,
+	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
+};
+
+static void dpu_capability(struct dpu_context *ctx,
+			struct dpu_capability *cap)
+{
+	cap->max_layers = 6;
+	cap->fmts_ptr = primary_fmts;
+	cap->fmts_cnt = ARRAY_SIZE(primary_fmts);
+}
+
+const struct dpu_core_ops sharkl3_dpu_core_ops = {
+	.init = dpu_init,
+	.fini = dpu_fini,
+	.run = dpu_run,
+	.stop = dpu_stop,
+	.isr = dpu_isr,
+	.ifconfig = dpu_dpi_init,
+	.capability = dpu_capability,
+	.flip = dpu_flip,
+	.enable_vsync = enable_vsync,
+	.disable_vsync = disable_vsync,
+};
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
new file mode 100644
index 0000000..241b0af
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/dma-buf.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "sprd_drm.h"
+#include "sprd_dpu.h"
+
+struct sprd_plane {
+	struct drm_plane plane;
+	u32 index;
+};
+
+static int sprd_dpu_init(struct sprd_dpu *dpu);
+static int sprd_dpu_fini(struct sprd_dpu *dpu);
+
+static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct sprd_plane, plane);
+}
+
+static int sprd_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_plane_state *state)
+{
+	DRM_DEBUG("%s()\n", __func__);
+
+	return 0;
+}
+
+static void sprd_plane_atomic_update(struct drm_plane *plane,
+				    struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_gem_cma_object *cma_obj;
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_dpu *dpu = crtc_to_dpu(plane->state->crtc);
+	struct dpu_layer *layer = &dpu->layers[p->index];
+	int i;
+
+	if (plane->state->crtc->state->active_changed) {
+		DRM_DEBUG("resume or suspend, no need to update plane\n");
+		return;
+	}
+
+	layer->index = p->index;
+	layer->src_x = state->src_x >> 16;
+	layer->src_y = state->src_y >> 16;
+	layer->src_w = state->src_w >> 16;
+	layer->src_h = state->src_h >> 16;
+	layer->dst_x = state->crtc_x;
+	layer->dst_y = state->crtc_y;
+	layer->dst_w = state->crtc_w;
+	layer->dst_h = state->crtc_h;
+	layer->alpha = state->alpha;
+	layer->blending = state->pixel_blend_mode;
+	layer->rotation = state->rotation;
+	layer->planes = fb->format->num_planes;
+	layer->format = fb->format->format;
+
+	DRM_DEBUG("%s() alpha = %u, blending = %u, rotation = %u\n",
+		  __func__, layer->alpha, layer->blending, layer->rotation);
+
+	for (i = 0; i < layer->planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(fb, i);
+		layer->addr[i] = cma_obj->paddr + fb->offsets[i];
+		layer->pitch[i] = fb->pitches[i];
+	}
+
+	dpu->pending_planes++;
+}
+
+static void sprd_plane_atomic_disable(struct drm_plane *plane,
+				     struct drm_plane_state *old_state)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+
+	/*
+	 * NOTE:
+	 * The dpu->core->flip() will disable all the planes each time.
+	 * So there is no need to impliment the atomic_disable() function.
+	 * But this function can not be removed, because it will change
+	 * to call atomic_update() callback instead. Which will cause
+	 * kernel panic in sprd_plane_atomic_update().
+	 *
+	 * We do nothing here but just print a debug log.
+	 */
+	DRM_DEBUG("%s() layer_id = %u\n", __func__, p->index);
+}
+
+static void sprd_plane_create_properties(struct sprd_plane *p, int index)
+{
+	unsigned int supported_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+				       BIT(DRM_MODE_BLEND_PREMULTI) |
+				       BIT(DRM_MODE_BLEND_COVERAGE);
+
+	/* create rotation property */
+	drm_plane_create_rotation_property(&p->plane,
+					   DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_MASK |
+					   DRM_MODE_REFLECT_MASK);
+
+	/* create alpha property */
+	drm_plane_create_alpha_property(&p->plane);
+
+	/* create blend mode property */
+	drm_plane_create_blend_mode_property(&p->plane, supported_modes);
+
+	/* create zpos property */
+	drm_plane_create_zpos_immutable_property(&p->plane, index);
+}
+
+static const struct drm_plane_helper_funcs sprd_plane_helper_funcs = {
+	.atomic_check = sprd_plane_atomic_check,
+	.atomic_update = sprd_plane_atomic_update,
+	.atomic_disable = sprd_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs sprd_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+static struct drm_plane *sprd_plane_init(struct drm_device *drm,
+					struct sprd_dpu *dpu)
+{
+	struct drm_plane *primary = NULL;
+	struct sprd_plane *p = NULL;
+	struct dpu_capability cap = {};
+	int ret, i;
+
+	dpu->core->capability(&dpu->ctx, &cap);
+
+	dpu->layers = devm_kcalloc(drm->dev, cap.max_layers,
+				  sizeof(struct dpu_layer), GFP_KERNEL);
+	if (!dpu->layers)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < cap.max_layers; i++) {
+
+		p = devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return ERR_PTR(-ENOMEM);
+
+		ret = drm_universal_plane_init(drm, &p->plane, 1,
+					       &sprd_plane_funcs, cap.fmts_ptr,
+					       cap.fmts_cnt, NULL,
+					       DRM_PLANE_TYPE_PRIMARY, NULL);
+		if (ret) {
+			DRM_ERROR("fail to init primary plane\n");
+			return ERR_PTR(ret);
+		}
+
+		drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs);
+
+		sprd_plane_create_properties(p, i);
+
+		p->index = i;
+		if (i == 0)
+			primary = &p->plane;
+	}
+
+	return primary;
+}
+
+static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc,
+					const struct drm_display_mode *mode)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	DRM_DEBUG("%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode));
+
+	if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+		drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
+
+		if ((mode->hdisplay == mode->htotal) ||
+		    (mode->vdisplay == mode->vtotal))
+			dpu->ctx.if_type = SPRD_DPU_IF_EDPI;
+		else
+			dpu->ctx.if_type = SPRD_DPU_IF_DPI;
+	}
+
+	return MODE_OK;
+}
+
+static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_state)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	sprd_dpu_init(dpu);
+
+	enable_irq(dpu->ctx.irq);
+}
+
+static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_crtc_state *old_state)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+	struct drm_device *drm = dpu->crtc.dev;
+
+	disable_irq(dpu->ctx.irq);
+
+	sprd_dpu_fini(dpu);
+
+	spin_lock_irq(&drm->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&drm->event_lock);
+}
+
+static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
+				 struct drm_crtc_state *state)
+{
+	DRM_DEBUG("%s()\n", __func__);
+
+	return 0;
+}
+
+static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,
+				  struct drm_crtc_state *old_state)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	memset(dpu->layers, 0, sizeof(*dpu->layers) * dpu->pending_planes);
+
+	dpu->pending_planes = 0;
+}
+
+static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_crtc_state *old_state)
+
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+	struct drm_device *drm = dpu->crtc.dev;
+
+	if (dpu->pending_planes)
+		dpu->core->flip(&dpu->ctx, dpu->layers, dpu->pending_planes);
+
+	spin_lock_irq(&drm->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&drm->event_lock);
+}
+
+static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	if (dpu->core->enable_vsync)
+		dpu->core->enable_vsync(&dpu->ctx);
+
+	return 0;
+}
+
+static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	if (dpu->core->disable_vsync)
+		dpu->core->disable_vsync(&dpu->ctx);
+}
+
+static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs = {
+	.mode_valid	= sprd_crtc_mode_valid,
+	.atomic_check	= sprd_crtc_atomic_check,
+	.atomic_begin	= sprd_crtc_atomic_begin,
+	.atomic_flush	= sprd_crtc_atomic_flush,
+	.atomic_enable	= sprd_crtc_atomic_enable,
+	.atomic_disable	= sprd_crtc_atomic_disable,
+};
+
+static const struct drm_crtc_funcs sprd_crtc_funcs = {
+	.destroy	= drm_crtc_cleanup,
+	.set_config	= drm_atomic_helper_set_config,
+	.page_flip	= drm_atomic_helper_page_flip,
+	.reset		= drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank	= sprd_crtc_enable_vblank,
+	.disable_vblank	= sprd_crtc_disable_vblank,
+};
+
+static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *crtc,
+			 struct drm_plane *primary)
+{
+	struct device_node *port;
+	int ret;
+
+	/*
+	 * set crtc port so that drm_of_find_possible_crtcs call works
+	 */
+	port = of_parse_phandle(drm->dev->of_node, "ports", 0);
+	if (!port) {
+		DRM_ERROR("find 'ports' phandle of %s failed\n",
+			  drm->dev->of_node->full_name);
+		return -EINVAL;
+	}
+	of_node_put(port);
+	crtc->port = port;
+
+	ret = drm_crtc_init_with_planes(drm, crtc, primary, NULL,
+					&sprd_crtc_funcs, NULL);
+	if (ret) {
+		DRM_ERROR("failed to init crtc.\n");
+		return ret;
+	}
+
+	drm_mode_crtc_set_gamma_size(crtc, 256);
+
+	drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
+
+	return 0;
+}
+
+static int sprd_dpu_init(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	if (dpu->core->init)
+		dpu->core->init(ctx);
+	if (dpu->core->ifconfig)
+		dpu->core->ifconfig(ctx);
+
+	return 0;
+}
+
+static int sprd_dpu_fini(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	if (dpu->core->fini)
+		dpu->core->fini(ctx);
+
+	return 0;
+}
+
+static irqreturn_t sprd_dpu_isr(int irq, void *data)
+{
+	struct sprd_dpu *dpu = data;
+	struct dpu_context *ctx = &dpu->ctx;
+	u32 int_mask = 0;
+
+	int_mask = dpu->core->isr(ctx);
+
+	if (int_mask & DPU_INT_ERR_MASK)
+		DRM_WARN("Warning: dpu underflow!\n");
+
+	if ((int_mask & DPU_INT_DPI_VSYNC_MASK))
+		drm_crtc_handle_vblank(&dpu->crtc);
+
+	return IRQ_HANDLED;
+}
+
+static int sprd_dpu_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct sprd_dpu *dpu = dev_get_drvdata(dev);
+	struct drm_plane *plane;
+	int ret;
+
+	plane = sprd_plane_init(drm, dpu);
+	if (IS_ERR_OR_NULL(plane)) {
+		ret = PTR_ERR(plane);
+		return ret;
+	}
+
+	ret = sprd_crtc_init(drm, &dpu->crtc, plane);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void sprd_dpu_unbind(struct device *dev, struct device *master,
+	void *data)
+{
+	struct sprd_dpu *dpu = dev_get_drvdata(dev);
+
+	drm_crtc_cleanup(&dpu->crtc);
+}
+
+static const struct component_ops dpu_component_ops = {
+	.bind = sprd_dpu_bind,
+	.unbind = sprd_dpu_unbind,
+};
+
+static int sprd_dpu_context_init(struct sprd_dpu *dpu,
+				struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_context *ctx = &dpu->ctx;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ctx->base = (unsigned long)devm_ioremap(dev, res->start,
+					resource_size(res));
+	if (ctx->base == 0) {
+		DRM_ERROR("failed to map dpu registers\n");
+		return -EFAULT;
+	}
+
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq < 0) {
+		DRM_ERROR("failed to get dpu irq\n");
+		return ctx->irq;
+	}
+
+	irq_set_status_flags(ctx->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(dev, ctx->irq, sprd_dpu_isr,
+					0, "DPU", dpu);
+	if (ret) {
+		DRM_ERROR("failed to register dpu irq handler\n");
+		return ret;
+	}
+
+	init_waitqueue_head(&ctx->wait_queue);
+
+	return 0;
+}
+
+static const struct sprd_dpu_ops sharkl3_dpu = {
+	.core = &sharkl3_dpu_core_ops,
+};
+
+static const struct of_device_id dpu_match_table[] = {
+	{ .compatible = "sprd,sharkl3-dpu",
+	  .data = &sharkl3_dpu },
+	{ /* sentinel */ },
+};
+
+static int sprd_dpu_probe(struct platform_device *pdev)
+{
+	const struct sprd_dpu_ops *pdata;
+	struct sprd_dpu *dpu;
+	int ret;
+
+	dpu = devm_kzalloc(&pdev->dev, sizeof(*dpu), GFP_KERNEL);
+	if (!dpu)
+		return -ENOMEM;
+
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (pdata) {
+		dpu->core = pdata->core;
+	} else {
+		DRM_ERROR("No matching driver data found\n");
+		return -EINVAL;
+	}
+
+	ret = sprd_dpu_context_init(dpu, &pdev->dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, dpu);
+
+	return component_add(&pdev->dev, &dpu_component_ops);
+}
+
+static int sprd_dpu_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dpu_component_ops);
+	return 0;
+}
+
+struct platform_driver sprd_dpu_driver = {
+	.probe = sprd_dpu_probe,
+	.remove = sprd_dpu_remove,
+	.driver = {
+		.name = "sprd-dpu-drv",
+		.of_match_table = dpu_match_table,
+	},
+};
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc Display Controller Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sprd_dpu.h
new file mode 100644
index 0000000..e50b8b6
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef __SPRD_DPU_H__
+#define __SPRD_DPU_H__
+
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <video/videomode.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+#include <uapi/drm/drm_mode.h>
+
+#define DPU_INT_DONE_MASK		BIT(0)
+#define DPU_INT_TE_MASK	    	BIT(1)
+#define DPU_INT_ERR_MASK		BIT(2)
+#define DPU_INT_EDPI_TE_MASK		BIT(3)
+#define DPU_INT_UPDATE_DONE_MASK	BIT(4)
+#define DPU_INT_DPI_VSYNC_MASK		BIT(5)
+#define DPU_INT_WB_DONE_MASK		BIT(6)
+#define DPU_INT_WB_FAIL_MASK		BIT(7)
+
+enum {
+	SPRD_DPU_IF_DBI = 0,
+	SPRD_DPU_IF_DPI,
+	SPRD_DPU_IF_EDPI,
+	SPRD_DPU_IF_LIMIT
+};
+
+enum {
+	SPRD_IMG_DATA_ENDIAN_B0B1B2B3 = 0,
+	SPRD_IMG_DATA_ENDIAN_B3B2B1B0,
+	SPRD_IMG_DATA_ENDIAN_B2B3B0B1,
+	SPRD_IMG_DATA_ENDIAN_B1B0B3B2,
+	SPRD_IMG_DATA_ENDIAN_LIMIT
+};
+
+struct dpu_layer {
+	u8 index;
+	u8 planes;
+	u32 addr[4];
+	u32 pitch[4];
+	s16 src_x;
+	s16 src_y;
+	s16 src_w;
+	s16 src_h;
+	s16 dst_x;
+	s16 dst_y;
+	u16 dst_w;
+	u16 dst_h;
+	u32 format;
+	u32 alpha;
+	u32 blending;
+	u32 rotation;
+};
+
+/**
+ * Sprd DPU capability structure
+ *
+ * @max_layers: maximum number of layers available
+ * @fmts_ptr: A pointer to array of supported pixel formats
+ * @fmts_cnt: the number of format on @fmts_ptr
+ */
+struct dpu_capability {
+	u32 max_layers;
+	const u32 *fmts_ptr;
+	u32 fmts_cnt;
+};
+
+/**
+ * Sprd DPU core callback ops
+ *
+ * This structure decribes the display controller common
+ * callback ops
+ *
+ * @init: initial DPU core
+ * @fini: cleanup DPU core
+ * @run: enable DPU output
+ * @stop: disable DPU output
+ * @enable_vsync: enable vblank interrupt
+ * @disable_vsync: disable vblank interrupt
+ * @isr: function pointer to the isr
+ * @ifconfig: initial DPI interface
+ * @flip: commit CRTC planes to DPU
+ * @capability: callback for DPU capabilities
+ */
+struct dpu_context;
+struct dpu_core_ops {
+	void (*init)(struct dpu_context *ctx);
+	void (*fini)(struct dpu_context *ctx);
+	void (*run)(struct dpu_context *ctx);
+	void (*stop)(struct dpu_context *ctx);
+	void (*enable_vsync)(struct dpu_context *ctx);
+	void (*disable_vsync)(struct dpu_context *ctx);
+	u32 (*isr)(struct dpu_context *ctx);
+	void (*ifconfig)(struct dpu_context *ctx);
+	void (*flip)(struct dpu_context *ctx,
+		     struct dpu_layer layers[], u8 count);
+	void (*capability)(struct dpu_context *ctx,
+			struct dpu_capability *cap);
+};
+
+/**
+ * Sprd DPU context structure
+ *
+ * @base: DPU controller base address
+ * @irq: IRQ number to install the handler for
+ * @if_type: The type of DPI interface, default is DPI mode.
+ * @vm: videomode structure to use for DPU and DPI initialization
+ * @stopped: indicates whether DPU are stopped
+ * @wait_queue: wait queue, used to wait for DPU shadow register update done and
+ * DPU stop register done interrupt signal.
+ * @evt_update: wait queue condition for DPU shadow register
+ * @evt_stop: wait queue condition for DPU stop register
+ */
+struct dpu_context {
+	unsigned long base;
+	int irq;
+	u8 if_type;
+	struct videomode vm;
+	bool stopped;
+	wait_queue_head_t wait_queue;
+	bool evt_update;
+	bool evt_stop;
+};
+
+/**
+ * Sprd DPU device structure
+ *
+ * @crtc: DRM crtc
+ * @ctx: A pointer to the DPU's implementation specific context
+ * @core: pointer to callbacks for DPU core functionality
+ * @layers: active DPU layers ready to commit
+ * @pending_planes: the number of layers on @layers
+ */
+struct sprd_dpu {
+	struct drm_crtc crtc;
+	struct dpu_context ctx;
+	const struct dpu_core_ops *core;
+	struct dpu_layer *layers;
+	u8 pending_planes;
+};
+
+/**
+ * Sprd DPU H/W callback ops match table structure
+ * The structure used for matching a specific device callback ops
+ *
+ * @core: pointer to callbacks for DPU core functionality
+ */
+struct sprd_dpu_ops {
+	const struct dpu_core_ops *core;
+};
+
+static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)
+{
+	return crtc ? container_of(crtc, struct sprd_dpu, crtc) : NULL;
+}
+
+extern const struct dpu_core_ops sharkl3_dpu_core_ops;
+
+#endif
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index 4706185..200020f 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -200,6 +200,7 @@ static struct platform_driver sprd_drm_driver = {
 
 static struct platform_driver *sprd_drm_drivers[]  = {
 	&sprd_drm_driver,
+	&sprd_dpu_driver,
 };
 
 static int __init sprd_drm_init(void)
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
index edf0881..3c32f3a 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.h
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -13,4 +13,6 @@ struct sprd_drm {
 	struct drm_device *drm;
 };
 
+extern struct platform_driver sprd_dpu_driver;
+
 #endif /* _SPRD_DRM_H_ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
