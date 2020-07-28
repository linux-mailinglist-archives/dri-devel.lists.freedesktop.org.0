Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB719231291
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FED6E2D5;
	Tue, 28 Jul 2020 19:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E8789B8F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:20 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id c6so4653977pje.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tUVEDb9Ocm53E9blrVDC5i88C/eZRPOxtHvdAZGO71Y=;
 b=GFcZwivrViskqZ9NLrN0iDBxukvrKKnlrbWSUZz55LuQfGeG99xUveGYKUeui76knS
 S2Vr5vk0ShbVdVf9tLYh0wjbyWmACqRpD5MW2cR4hNETTaWag5NbXGD1ojPHvsbt7FKd
 EmXP2GbAoBud+DeoZWBH0cunySGjymqBQgXig/ykIcsvyCqpOXg9yHoUY4DGzaL42rDj
 6GTaNp94Jiyp9Kc7Oqd+fu6W0QCuoYBJ6qcnaFUWXbxasDodKhiV8/9unqeXb4G/nMfK
 VANTFJeqBjpSuslUp9ln/ldruqKHoTgpxnsTNYEphJ8Ea/6BFOUkeyblSObMjAm0nn0J
 cthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tUVEDb9Ocm53E9blrVDC5i88C/eZRPOxtHvdAZGO71Y=;
 b=jP60jZAChcG6Sf0BBV8VuuO+PPzSQCzFDTdDl03M0T6KTxo9NOl7LEiUHxTZ6lZT4Q
 fp7wNXx5jSMSOn7bpMjeE2U85nBzb5h0XXrYfDtPBuwzaEh7F9PAVRuti5s2sS+lqiTX
 2PA/pVvr2sZlrE+IedcfLkPoSvKGhk4CKeFrZT/B9ENi1TrN2JaFT4HngKcLtWfqwjFX
 iHkS5UeMXrFDNFRub2xploG7ThvK9HKjLKIW+mtMLE26jo5LPOkGvez1EDcec+OQGpIF
 ICLCWGukvlYoEZrbNNv92hWEiox8HCx4XbuL//+EMjhiz5P/+2MN40VCBqgpBHi7oI06
 W/cQ==
X-Gm-Message-State: AOAM5301NiNwm0IT8O9aFwqDeGpvrxIOIFZ/0bm57OzIcoM+7qo4YiAO
 x9G+QIiYMAgKEwDIyVpIE8slDQFLriI=
X-Google-Smtp-Source: ABdhPJw9lyIpaM1jnVao3qfU55XksJr2J+JM+vfdV+jS30m9EpQZsMVluUNcoy0pm8ihGZwRCya/xw==
X-Received: by 2002:a17:90b:2350:: with SMTP id
 ms16mr3873633pjb.224.1595930899864; 
 Tue, 28 Jul 2020 03:08:19 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:19 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Date: Tue, 28 Jul 2020 18:07:57 +0800
Message-Id: <1595930879-2478-5-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds DPU(Display Processor Unit) support for the Unisoc's display subsystem.
It's support multi planes, scaler, rotation, PQ(Picture Quality) and more.

RFC v6:
  - Access registers via readl/writel
  - Checking for unsupported KMS properties (format, rotation, blend_mode, etc) on plane_check ops
  - Remove always true checks for dpu core ops

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/sprd/Makefile       |   5 +-
 drivers/gpu/drm/sprd/dpu/Makefile   |   3 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 503 ++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.c     | 646 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h     | 187 +++++++++++
 drivers/gpu/drm/sprd/sprd_drm.c     |   1 +
 drivers/gpu/drm/sprd/sprd_drm.h     |   2 +
 7 files changed, 1346 insertions(+), 1 deletion(-)
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
index 0000000..40278b6
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dpu/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += dpu_r2p0.o
diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
new file mode 100644
index 0000000..4b9521d
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#include "sprd_dpu.h"
+
+/* DPU registers size, 4 Bytes(32 Bits) */
+#define DPU_REG_SIZE	0x04
+
+/* Layer registers offset */
+#define DPU_LAY_REG_OFFSET	0x0C
+
+#define DPU_LAY_REG(reg, index) \
+	(reg + index * DPU_LAY_REG_OFFSET * DPU_REG_SIZE)
+
+#define DPU_REG_RD(reg) readl_relaxed(reg)
+
+#define DPU_REG_WR(reg, mask) writel_relaxed(mask, reg)
+
+#define DPU_REG_SET(reg, mask) \
+	writel_relaxed(readl_relaxed(reg) | mask, reg)
+
+#define DPU_REG_CLR(reg, mask) \
+	writel_relaxed(readl_relaxed(reg) & ~mask, reg)
+
+/* Global control registers */
+#define REG_DPU_CTRL	0x04
+#define REG_DPU_CFG0	0x08
+#define REG_DPU_CFG1	0x0C
+#define REG_DPU_CFG2	0x10
+#define REG_PANEL_SIZE	0x20
+#define REG_BLEND_SIZE	0x24
+#define REG_BG_COLOR	0x2C
+
+/* Layer0 control registers */
+#define REG_LAY_BASE_ADDR0	0x30
+#define REG_LAY_BASE_ADDR1	0x34
+#define REG_LAY_BASE_ADDR2	0x38
+#define REG_LAY_CTRL		0x40
+#define REG_LAY_SIZE		0x44
+#define REG_LAY_PITCH		0x48
+#define REG_LAY_POS		0x4C
+#define REG_LAY_ALPHA		0x50
+#define REG_LAY_PALLETE		0x58
+#define REG_LAY_CROP_START	0x5C
+
+/* Interrupt control registers */
+#define REG_DPU_INT_EN		0x1E0
+#define REG_DPU_INT_CLR		0x1E4
+#define REG_DPU_INT_STS		0x1E8
+
+/* DPI control registers */
+#define REG_DPI_CTRL		0x1F0
+#define REG_DPI_H_TIMING	0x1F4
+#define REG_DPI_V_TIMING	0x1F8
+
+/* MMU control registers */
+#define REG_MMU_EN			0x800
+#define REG_MMU_VPN_RANGE		0x80C
+#define REG_MMU_VAOR_ADDR_RD		0x818
+#define REG_MMU_VAOR_ADDR_WR		0x81C
+#define REG_MMU_INV_ADDR_RD		0x820
+#define REG_MMU_INV_ADDR_WR		0x824
+#define REG_MMU_PPN1			0x83C
+#define REG_MMU_RANGE1			0x840
+#define REG_MMU_PPN2			0x844
+#define REG_MMU_RANGE2			0x848
+
+/* Global control bits */
+#define BIT_DPU_RUN			BIT(0)
+#define BIT_DPU_STOP			BIT(1)
+#define BIT_DPU_REG_UPDATE		BIT(2)
+#define BIT_DPU_IF_EDPI			BIT(0)
+#define BIT_DPU_COEF_NARROW_RANGE		BIT(4)
+#define BIT_DPU_Y2R_COEF_ITU709_STANDARD	BIT(5)
+
+/* Layer control bits */
+#define BIT_DPU_LAY_EN				BIT(0)
+
+/* Interrupt control & status bits */
+#define BIT_DPU_INT_DONE		BIT(0)
+#define BIT_DPU_INT_TE			BIT(1)
+#define BIT_DPU_INT_ERR			BIT(2)
+#define BIT_DPU_INT_UPDATE_DONE		BIT(4)
+#define BIT_DPU_INT_VSYNC		BIT(5)
+#define BIT_DPU_INT_FBC_PLD_ERR		BIT(8)
+#define BIT_DPU_INT_FBC_HDR_ERR		BIT(9)
+#define BIT_DPU_INT_MMU_VAOR_RD		BIT(16)
+#define BIT_DPU_INT_MMU_VAOR_WR		BIT(17)
+#define BIT_DPU_INT_MMU_INV_RD		BIT(18)
+#define BIT_DPU_INT_MMU_INV_WR		BIT(19)
+
+/* DPI control bits */
+#define BIT_DPU_EDPI_TE_EN		BIT(8)
+#define BIT_DPU_EDPI_FROM_EXTERNAL_PAD	BIT(10)
+#define BIT_DPU_DPI_HALT_EN		BIT(16)
+
+
+static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)
+{
+	u32 mmu_mask = BIT_DPU_INT_MMU_VAOR_RD |
+			BIT_DPU_INT_MMU_VAOR_WR |
+			BIT_DPU_INT_MMU_INV_RD |
+			BIT_DPU_INT_MMU_INV_WR;
+	u32 val = reg_val & mmu_mask;
+	int i;
+
+	if (val) {
+		DRM_ERROR("--- iommu interrupt err: 0x%04x ---\n", val);
+
+		if (val & BIT_DPU_INT_MMU_INV_RD)
+			DRM_ERROR("iommu invalid read error, addr: 0x%08x\n",
+				DPU_REG_RD(ctx->base + REG_MMU_INV_ADDR_RD));
+		if (val & BIT_DPU_INT_MMU_INV_WR)
+			DRM_ERROR("iommu invalid write error, addr: 0x%08x\n",
+				DPU_REG_RD(ctx->base + REG_MMU_INV_ADDR_WR));
+		if (val & BIT_DPU_INT_MMU_VAOR_RD)
+			DRM_ERROR("iommu va out of range read error, addr: 0x%08x\n",
+				DPU_REG_RD(ctx->base + REG_MMU_VAOR_ADDR_RD));
+		if (val & BIT_DPU_INT_MMU_VAOR_WR)
+			DRM_ERROR("iommu va out of range write error, addr: 0x%08x\n",
+				DPU_REG_RD(ctx->base + REG_MMU_VAOR_ADDR_WR));
+
+		for (i = 0; i < 8; i++) {
+			reg_val = DPU_REG_RD(ctx->base + DPU_LAY_REG(REG_LAY_CTRL, i));
+			if (reg_val & 0x1)
+				DRM_INFO("layer%d: 0x%08x 0x%08x 0x%08x ctrl: 0x%08x\n", i,
+					DPU_REG_RD(ctx->base + DPU_LAY_REG(REG_LAY_BASE_ADDR0, i)),
+					DPU_REG_RD(ctx->base + DPU_LAY_REG(REG_LAY_BASE_ADDR1, i)),
+					DPU_REG_RD(ctx->base + DPU_LAY_REG(REG_LAY_BASE_ADDR2, i)),
+					DPU_REG_RD(ctx->base + DPU_LAY_REG(REG_LAY_CTRL, i)));
+		}
+	}
+
+	return val;
+}
+
+static void dpu_clean_all(struct dpu_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 8; i++)
+		DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CTRL, i), 0x00);
+}
+
+static u32 dpu_isr(struct dpu_context *ctx)
+{
+	u32 reg_val, int_mask = 0;
+
+	reg_val = DPU_REG_RD(ctx->base + REG_DPU_INT_STS);
+
+	/* disable err interrupt */
+	if (reg_val & BIT_DPU_INT_ERR)
+		int_mask |= BIT_DPU_INT_ERR;
+
+	/* dpu update done isr */
+	if (reg_val & BIT_DPU_INT_UPDATE_DONE) {
+		ctx->evt_update = true;
+		wake_up_interruptible_all(&ctx->wait_queue);
+	}
+
+	/* dpu stop done isr */
+	if (reg_val & BIT_DPU_INT_DONE) {
+		ctx->evt_stop = true;
+		wake_up_interruptible_all(&ctx->wait_queue);
+	}
+
+	/* dpu ifbc payload error isr */
+	if (reg_val & BIT_DPU_INT_FBC_PLD_ERR) {
+		int_mask |= BIT_DPU_INT_FBC_PLD_ERR;
+		DRM_ERROR("dpu ifbc payload error\n");
+	}
+
+	/* dpu ifbc header error isr */
+	if (reg_val & BIT_DPU_INT_FBC_HDR_ERR) {
+		int_mask |= BIT_DPU_INT_FBC_HDR_ERR;
+		DRM_ERROR("dpu ifbc header error\n");
+	}
+
+	int_mask |= check_mmu_isr(ctx, reg_val);
+
+	DPU_REG_WR(ctx->base + REG_DPU_INT_CLR, reg_val);
+	DPU_REG_CLR(ctx->base + REG_DPU_INT_EN, int_mask);
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
+	if (ctx->if_type == SPRD_DPU_IF_DPI)
+		DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_STOP);
+
+	dpu_wait_stop_done(ctx);
+}
+
+static void dpu_run(struct dpu_context *ctx)
+{
+	DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_RUN);
+
+	ctx->stopped = false;
+}
+
+static void dpu_init(struct dpu_context *ctx)
+{
+	u32 reg_val, size;
+
+	DPU_REG_WR(ctx->base + REG_BG_COLOR, 0x00);
+
+	size = (ctx->vm.vactive << 16) | ctx->vm.hactive;
+
+	DPU_REG_WR(ctx->base + REG_PANEL_SIZE, size);
+	DPU_REG_WR(ctx->base + REG_BLEND_SIZE, size);
+
+	reg_val = BIT_DPU_COEF_NARROW_RANGE | BIT_DPU_Y2R_COEF_ITU709_STANDARD;
+	DPU_REG_WR(ctx->base + REG_DPU_CFG0, reg_val);
+	DPU_REG_WR(ctx->base + REG_DPU_CFG1, 0x004466da);
+	DPU_REG_WR(ctx->base + REG_DPU_CFG2, 0x00);
+
+	if (ctx->stopped)
+		dpu_clean_all(ctx);
+
+	DPU_REG_WR(ctx->base + REG_MMU_EN, 0x00);
+	DPU_REG_WR(ctx->base + REG_MMU_PPN1, 0x00);
+	DPU_REG_WR(ctx->base + REG_MMU_RANGE1, 0xffff);
+	DPU_REG_WR(ctx->base + REG_MMU_PPN2, 0x00);
+	DPU_REG_WR(ctx->base + REG_MMU_RANGE2, 0xffff);
+	DPU_REG_WR(ctx->base + REG_MMU_VPN_RANGE, 0x1ffff);
+
+	DPU_REG_WR(ctx->base + REG_DPU_INT_CLR, 0xffff);
+}
+
+static void dpu_fini(struct dpu_context *ctx)
+{
+	DPU_REG_WR(ctx->base + REG_DPU_INT_EN, 0x00);
+	DPU_REG_WR(ctx->base + REG_DPU_INT_CLR, 0xff);
+}
+
+static void dpu_layer(struct dpu_context *ctx,
+		    struct dpu_layer *hwlayer)
+{
+	const struct drm_format_info *info;
+	u32 size, offset, ctrl, pitch;
+	int i;
+
+	offset = (hwlayer->dst_x & 0xffff) | ((hwlayer->dst_y) << 16);
+
+	if (hwlayer->src_w && hwlayer->src_h)
+		size = (hwlayer->src_w & 0xffff) | ((hwlayer->src_h) << 16);
+	else
+		size = (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) << 16);
+
+	for (i = 0; i < hwlayer->planes; i++)
+		DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_BASE_ADDR0,
+				hwlayer->index), hwlayer->addr[i]);
+
+	DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_POS,
+			hwlayer->index), offset);
+	DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_SIZE,
+			hwlayer->index), size);
+	DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CROP_START,
+			hwlayer->index), hwlayer->src_y << 16 | hwlayer->src_x);
+	DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_ALPHA,
+			hwlayer->index), hwlayer->alpha);
+
+	info = drm_format_info(hwlayer->format);
+	if (hwlayer->planes == 3) {
+		/* UV pitch is 1/2 of Y pitch*/
+		pitch = (hwlayer->pitch[0] / info->cpp[0]) |
+				(hwlayer->pitch[0] / info->cpp[0] << 15);
+		DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_PITCH,
+				hwlayer->index), pitch);
+	} else {
+		pitch = hwlayer->pitch[0] / info->cpp[0];
+		DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_PITCH,
+				hwlayer->index), pitch);
+	}
+
+	ctrl = hwlayer->format |
+		hwlayer->blending |
+		(hwlayer->rotation & 0x7) << 20;
+
+	DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CTRL,
+			hwlayer->index), ctrl);
+	DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CTRL,
+			hwlayer->index), BIT_DPU_LAY_EN);
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
+	int i;
+	u32 reg_val;
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
+	DPU_REG_WR(ctx->base + REG_BG_COLOR, 0x00);
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
+			DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_REG_UPDATE);
+			dpu_wait_update_done(ctx);
+		}
+
+		DPU_REG_SET(ctx->base + REG_DPU_INT_EN, BIT_DPU_INT_ERR);
+	} else if (ctx->if_type == SPRD_DPU_IF_EDPI) {
+		DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_RUN);
+
+		ctx->stopped = false;
+	}
+
+	/*
+	 * If the following interrupt was disabled in isr,
+	 * re-enable it.
+	 */
+	reg_val = BIT_DPU_INT_FBC_PLD_ERR |
+		  BIT_DPU_INT_FBC_HDR_ERR |
+		  BIT_DPU_INT_MMU_VAOR_RD |
+		  BIT_DPU_INT_MMU_VAOR_WR |
+		  BIT_DPU_INT_MMU_INV_RD |
+		  BIT_DPU_INT_MMU_INV_WR;
+	DPU_REG_SET(ctx->base + REG_DPU_INT_EN, reg_val);
+
+}
+
+static void dpu_dpi_init(struct dpu_context *ctx)
+{
+	u32 int_mask = 0;
+	u32 reg_val;
+
+	if (ctx->if_type == SPRD_DPU_IF_DPI) {
+		/* use dpi as interface */
+		DPU_REG_CLR(ctx->base + REG_DPU_CFG0, BIT_DPU_IF_EDPI);
+
+		/* disable Halt function for SPRD DSI */
+		DPU_REG_CLR(ctx->base + REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
+
+		/* select te from external pad */
+		DPU_REG_SET(ctx->base + REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
+
+		/* set dpi timing */
+		reg_val = ctx->vm.hsync_len << 0 |
+			  ctx->vm.hback_porch << 8 |
+			  ctx->vm.hfront_porch << 20;
+		DPU_REG_WR(ctx->base + REG_DPI_H_TIMING, reg_val);
+
+		reg_val = ctx->vm.vsync_len << 0 |
+			  ctx->vm.vback_porch << 8 |
+			  ctx->vm.vfront_porch << 20;
+		DPU_REG_WR(ctx->base + REG_DPI_V_TIMING, reg_val);
+
+		if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
+			DRM_WARN("Warning: (vsync + vbp) < 32, "
+				"underflow risk!\n");
+
+		/* enable dpu update done INT */
+		int_mask |= BIT_DPU_INT_UPDATE_DONE;
+		/* enable dpu DONE  INT */
+		int_mask |= BIT_DPU_INT_DONE;
+		/* enable dpu dpi vsync */
+		int_mask |= BIT_DPU_INT_VSYNC;
+		/* enable dpu TE INT */
+		int_mask |= BIT_DPU_INT_TE;
+		/* enable underflow err INT */
+		int_mask |= BIT_DPU_INT_ERR;
+	} else if (ctx->if_type == SPRD_DPU_IF_EDPI) {
+		/* use edpi as interface */
+		DPU_REG_SET(ctx->base + REG_DPU_CFG0, BIT_DPU_IF_EDPI);
+
+		/* use external te */
+		DPU_REG_SET(ctx->base + REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
+
+		/* enable te */
+		DPU_REG_SET(ctx->base + REG_DPI_CTRL, BIT_DPU_EDPI_TE_EN);
+
+		/* enable stop DONE INT */
+		int_mask |= BIT_DPU_INT_DONE;
+		/* enable TE INT */
+		int_mask |= BIT_DPU_INT_TE;
+	}
+
+	/* enable ifbc payload error INT */
+	int_mask |= BIT_DPU_INT_FBC_PLD_ERR;
+	/* enable ifbc header error INT */
+	int_mask |= BIT_DPU_INT_FBC_HDR_ERR;
+	/* enable iommu va out of range read error INT */
+	int_mask |= BIT_DPU_INT_MMU_VAOR_RD;
+	/* enable iommu va out of range write error INT */
+	int_mask |= BIT_DPU_INT_MMU_VAOR_WR;
+	/* enable iommu invalid read error INT */
+	int_mask |= BIT_DPU_INT_MMU_INV_RD;
+	/* enable iommu invalid write error INT */
+	int_mask |= BIT_DPU_INT_MMU_INV_WR;
+
+	DPU_REG_WR(ctx->base + REG_DPU_INT_EN, int_mask);
+}
+
+static void enable_vsync(struct dpu_context *ctx)
+{
+	DPU_REG_SET(ctx->base + REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
+}
+
+static void disable_vsync(struct dpu_context *ctx)
+{
+	DPU_REG_CLR(ctx->base + REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
+}
+
+static const u32 primary_fmts[] = {
+	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBX8888, DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565, DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21, DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61, DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
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
+const struct dpu_core_ops dpu_r2p0_core_ops = {
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
index 0000000..5ec8e7c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -0,0 +1,646 @@
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
+	u32 addr[4];
+	u32 pitch[4];
+	u32 format;
+	u32 rotation;
+	u32 blend_mode;
+};
+
+static void sprd_dpu_init(struct sprd_dpu *dpu);
+static void sprd_dpu_fini(struct sprd_dpu *dpu);
+
+static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct sprd_plane, plane);
+}
+
+static int sprd_plane_format_convert(u32 fourcc, u32 *format)
+{
+	switch (fourcc) {
+	case DRM_FORMAT_BGRA8888:
+		/* BGRA8888 -> ARGB8888 */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
+		*format |= BIT_DPU_LAY_FORMAT_ARGB8888;
+		break;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+		/* RGBA8888 -> ABGR8888 */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
+		/* FALLTHRU */
+	case DRM_FORMAT_ABGR8888:
+		/* RB switch */
+		*format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		/* FALLTHRU */
+	case DRM_FORMAT_ARGB8888:
+		*format |= BIT_DPU_LAY_FORMAT_ARGB8888;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		/* RB switch */
+		*format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		/* FALLTHRU */
+	case DRM_FORMAT_XRGB8888:
+		*format |= BIT_DPU_LAY_FORMAT_ARGB8888;
+		break;
+	case DRM_FORMAT_BGR565:
+		/* RB switch */
+		*format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		/* FALLTHRU */
+	case DRM_FORMAT_RGB565:
+		*format |= BIT_DPU_LAY_FORMAT_RGB565;
+		break;
+	case DRM_FORMAT_NV12:
+		/* 2-Lane: Yuv420 */
+		*format |= BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
+		/* Y endian */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		*format |= BIT_DPU_LAY_NO_SWITCH;
+		break;
+	case DRM_FORMAT_NV21:
+		/* 2-Lane: Yuv420 */
+		*format |= BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
+		/* Y endian */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		*format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		break;
+	case DRM_FORMAT_NV16:
+		/* 2-Lane: Yuv422 */
+		*format |= BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
+		/* Y endian */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
+		/* UV endian */
+		*format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		break;
+	case DRM_FORMAT_NV61:
+		/* 2-Lane: Yuv422 */
+		*format |= BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
+		/* Y endian */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		*format |= BIT_DPU_LAY_NO_SWITCH;
+		break;
+	case DRM_FORMAT_YUV420:
+		*format |= BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
+		/* Y endian */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		*format |= BIT_DPU_LAY_NO_SWITCH;
+		break;
+	case DRM_FORMAT_YVU420:
+		*format |= BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
+		/* Y endian */
+		*format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		*format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sprd_plane_rotation_convert(u32 angle, u32 *rotation)
+{
+	switch (angle) {
+	case DRM_MODE_ROTATE_0:
+		*rotation = DPU_LAYER_ROTATION_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		*rotation = DPU_LAYER_ROTATION_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		*rotation = DPU_LAYER_ROTATION_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		*rotation = DPU_LAYER_ROTATION_270;
+		break;
+	case DRM_MODE_REFLECT_Y:
+		*rotation = DPU_LAYER_ROTATION_180_M;
+		break;
+	case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
+		*rotation = DPU_LAYER_ROTATION_90_M;
+		break;
+	case DRM_MODE_REFLECT_X:
+		*rotation = DPU_LAYER_ROTATION_0_M;
+		break;
+	case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
+		*rotation = DPU_LAYER_ROTATION_270_M;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sprd_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_plane_state *state)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_cma_object *cma_obj;
+	int i, ret;
+	u32 addr;
+
+	if (!state->fb || !state->crtc)
+		return 0;
+
+	ret = sprd_plane_format_convert(fb->format->format,
+					&p->format);
+	if (ret < 0) {
+		DRM_ERROR("Invalid plane format\n");
+		return ret;
+	}
+
+	ret = sprd_plane_rotation_convert(state->rotation,
+					&p->rotation);
+	if (ret < 0) {
+		DRM_ERROR("Invalid plane rotation\n");
+		return ret;
+	}
+
+	switch (state->pixel_blend_mode) {
+	case DRM_MODE_BLEND_COVERAGE:
+		/* alpha mode select - combo alpha */
+		p->blend_mode |= BIT_DPU_LAY_COMBO_ALPHA;
+		/* Normal mode */
+		p->blend_mode |= BIT_DPU_LAY_MODE_BLEND_NORMAL;
+		break;
+	case DRM_MODE_BLEND_PREMULTI:
+		/* alpha mode select - combo alpha */
+		p->blend_mode |= BIT_DPU_LAY_COMBO_ALPHA;
+		/* Pre-mult mode */
+		p->blend_mode |= BIT_DPU_LAY_MODE_BLEND_PREMULT;
+		break;
+	case DRM_MODE_BLEND_PIXEL_NONE:
+	default:
+		/* don't do blending, maybe RGBX */
+		/* alpha mode select - layer alpha */
+		p->blend_mode |= BIT_DPU_LAY_LAYER_ALPHA;
+		break;
+	}
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(fb, i);
+		addr = cma_obj->paddr + fb->offsets[i];
+		if (addr % 16) {
+			DRM_ERROR("layer addr[%d] is not 16 bytes align, it's 0x%08x\n",
+				i, addr);
+			return -EFAULT;
+		}
+
+		p->addr[i] = addr;
+		p->pitch[i] = fb->pitches[i];
+	}
+
+	return 0;
+}
+
+static void sprd_plane_atomic_update(struct drm_plane *plane,
+				    struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_framebuffer *fb = plane->state->fb;
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_dpu *dpu = crtc_to_dpu(plane->state->crtc);
+	struct dpu_layer *layer = &dpu->layers[p->index];
+	int i;
+
+	if (!state->crtc || !state->fb)
+		return;
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
+	layer->format = p->format;
+	layer->blending = p->blend_mode;
+	layer->rotation = p->rotation;
+	layer->planes = fb->format->num_planes;
+
+	for (i = 0; i < layer->planes; i++) {
+		layer->addr[i] = p->addr[i];
+		layer->pitch[i] = p->pitch[i];
+	}
+
+	dpu->pending_planes++;
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
+	dpu->core->enable_vsync(&dpu->ctx);
+
+	return 0;
+}
+
+static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	dpu->core->disable_vsync(&dpu->ctx);
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
+static void sprd_dpu_init(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	dpu->core->init(ctx);
+	dpu->core->ifconfig(ctx);
+}
+
+static void sprd_dpu_fini(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	dpu->core->fini(ctx);
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
+	if (int_mask & BIT_DPU_INT_ERR)
+		DRM_WARN("Warning: dpu underflow!\n");
+
+	if (int_mask & BIT_DPU_INT_VSYNC)
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
+	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!ctx->base) {
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
+	.core = &dpu_r2p0_core_ops,
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
index 0000000..7d3c5e4
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.h
@@ -0,0 +1,187 @@
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
+#define BIT_DPU_INT_DONE_		BIT(0)
+#define BIT_DPU_INT_TE			BIT(1)
+#define BIT_DPU_INT_ERR			BIT(2)
+#define BIT_DPU_INT_EDPI_TE		BIT(3)
+#define BIT_DPU_INT_UPDATE_DONE		BIT(4)
+#define BIT_DPU_INT_VSYNC		BIT(5)
+#define BIT_DPU_INT_WB_DONE		BIT(6)
+#define BIT_DPU_INT_WB_ERR		BIT(7)
+
+#define BIT_DPU_LAY_LAYER_ALPHA			(0x01 << 2)
+#define BIT_DPU_LAY_COMBO_ALPHA			(0x02 << 2)
+#define BIT_DPU_LAY_FORMAT_YUV422_2PLANE		(0x00 << 4)
+#define BIT_DPU_LAY_FORMAT_YUV420_2PLANE		(0x01 << 4)
+#define BIT_DPU_LAY_FORMAT_YUV420_3PLANE		(0x02 << 4)
+#define BIT_DPU_LAY_FORMAT_ARGB8888			(0x03 << 4)
+#define BIT_DPU_LAY_FORMAT_RGB565			(0x04 << 4)
+#define BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3		(0x00 << 8)
+#define BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0		(0x01 << 8)
+#define BIT_DPU_LAY_NO_SWITCH			(0x00 << 10)
+#define BIT_DPU_LAY_RB_OR_UV_SWITCH		(0x01 << 10)
+#define BIT_DPU_LAY_MODE_BLEND_NORMAL		(0x00 << 16)
+#define BIT_DPU_LAY_MODE_BLEND_PREMULT		(0x01 << 16)
+
+enum {
+	SPRD_DPU_IF_DBI = 0,
+	SPRD_DPU_IF_DPI,
+	SPRD_DPU_IF_EDPI,
+	SPRD_DPU_IF_LIMIT
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
+	void __iomem *base;
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
+extern const struct dpu_core_ops dpu_r2p0_core_ops;
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
