Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0082EBB57
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFF489D4B;
	Wed,  6 Jan 2021 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA69889A72
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 13:46:42 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id e2so21317523pgi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 05:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j6s2OpVTF+Hbe3zmtK4TMCd0rqu6ttUZKBQwkA9ecWs=;
 b=JHqluDUn+ZlW85ZPuHj20Z6ocDL7QlrrZm+ZwGZmeE69YkFj3Y4QiOy8g7pJVUYh+q
 rrFa2bKS/b9C7+KWQLRHNO0UdY1ybUZVcq0eQnm+M5zceaIH0kbywfReitdbC1Jws/oJ
 PVuyH0J7y2/AncelhydPbEItfp0iAwNibGB2gik63VZYQwUZsvgCuc48bEU9vEYAP+At
 g8U5oZJKyo2AvcGRYLi9PfxpbQVh+YnrqvMeFkPy2D7mof19ZQB6tuzKExDPdA8UKMS1
 ingjJPd6+K6S4pARBwp0yii8MBF8S8kDlrfAm0GUw+N3K6vMsp1vaqtKebd1S6Vnntp1
 ampw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j6s2OpVTF+Hbe3zmtK4TMCd0rqu6ttUZKBQwkA9ecWs=;
 b=ZIQpYuG8uIxg4ISPj4mjH7Mk4L8BENeXeYwNPu6ggwJnMkaYinzeDfYPK9KsNGeJoo
 4jt6cjAXdY6IqL6Jo7qpvK3iZCuMmhlEF5N3ZHNbOHakjTlfB6bjncDI+1QyuaGIb1yp
 waYV7wEQBTIQ2YBQYaHwsykKIRHVVdp50sgY4veyDWPeaMAMCfVlLKfBwpyGXhfWbcZn
 ujIvWuaH1Qam5jl4OUUev0oxJmZxB5I5bgEnsxtZKHZNNY7FXQL9K5cA7A340zV0lJ68
 aJrioIGCCvUko/Lgp2zCqUEeTNAC5IzfyWagtb07C8nDlRzDOd8qrH5jBvgkdcUivChI
 +kMw==
X-Gm-Message-State: AOAM530lMYTDbF8Ts+AiQnqkF3Kl6ECxF3q/0H+0AeDC87nGJdWwWfMq
 bq1TYkZ1F5mGBY4ELNhYSso=
X-Google-Smtp-Source: ABdhPJxosWbvgnZqt1tdqDJdk8vSgiU7Rp8GMl8GWR+5UqSc0HGdUD4lwpcvzhohPeQxre+NNjlwYQ==
X-Received: by 2002:a05:6a00:228a:b029:18b:212a:1af7 with SMTP id
 f10-20020a056a00228ab029018b212a1af7mr69291158pfe.55.1609854402294; 
 Tue, 05 Jan 2021 05:46:42 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id w63sm57582284pfc.20.2021.01.05.05.46.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:46:41 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v3 4/6] drm/sprd: add Unisoc's drm display controller driver
Date: Tue,  5 Jan 2021 21:46:05 +0800
Message-Id: <1609854367-2720-5-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds DPU(Display Processor Unit) support for the Unisoc's display subsystem.
It's support multi planes, scaler, rotation, PQ(Picture Quality) and more.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>

v2:
  - Use drm_xxx to replace all DRM_XXX.
  - Use kzalloc to replace devm_kzalloc for sprd_dpu structure init.

v3:
  - Remove dpu_layer stuff layer and commit layers by aotmic_update
---
 drivers/gpu/drm/sprd/Kconfig    |   1 +
 drivers/gpu/drm/sprd/Makefile   |   4 +-
 drivers/gpu/drm/sprd/sprd_dpu.c | 985 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h | 120 +++++
 drivers/gpu/drm/sprd/sprd_drm.c |   1 +
 drivers/gpu/drm/sprd/sprd_drm.h |   2 +
 6 files changed, 1111 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h

diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
index 6e80cc9..9b4ef9a 100644
--- a/drivers/gpu/drm/sprd/Kconfig
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -3,6 +3,7 @@ config DRM_SPRD
 	depends on ARCH_SPRD || COMPILE_TEST
 	depends on DRM && OF
 	select DRM_KMS_HELPER
+	select VIDEOMODE_HELPERS
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
index 86d95d9..6c25bfa 100644
--- a/drivers/gpu/drm/sprd/Makefile
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-subdir-ccflags-y += -I$(srctree)/$(src)
+obj-y := sprd_drm.o \
+	sprd_dpu.o
 
-obj-y := sprd_drm.o
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
new file mode 100644
index 0000000..d562d44
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -0,0 +1,985 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
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
+/* Global control registers */
+#define REG_DPU_CTRL	0x04
+#define REG_DPU_CFG0	0x08
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
+
+/* Layer control bits */
+#define BIT_DPU_LAY_EN				BIT(0)
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
+/* Interrupt control & status bits */
+#define BIT_DPU_INT_DONE		BIT(0)
+#define BIT_DPU_INT_TE			BIT(1)
+#define BIT_DPU_INT_ERR			BIT(2)
+#define BIT_DPU_INT_UPDATE_DONE		BIT(4)
+#define BIT_DPU_INT_VSYNC		BIT(5)
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
+static const u32 primary_fmts[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
+struct sprd_plane {
+	struct drm_plane plane;
+	u32 index;
+};
+
+static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct sprd_plane, plane);
+}
+
+static u32 check_mmu_isr(struct sprd_dpu *dpu, u32 reg_val)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+	u32 mmu_mask = BIT_DPU_INT_MMU_VAOR_RD |
+			BIT_DPU_INT_MMU_VAOR_WR |
+			BIT_DPU_INT_MMU_INV_RD |
+			BIT_DPU_INT_MMU_INV_WR;
+	u32 val = reg_val & mmu_mask;
+	int i;
+
+	if (val) {
+		drm_err(dpu->drm, "--- iommu interrupt err: 0x%04x ---\n", val);
+
+		if (val & BIT_DPU_INT_MMU_INV_RD)
+			drm_err(dpu->drm, "iommu invalid read error, addr: 0x%08x\n",
+				readl(ctx->base + REG_MMU_INV_ADDR_RD));
+		if (val & BIT_DPU_INT_MMU_INV_WR)
+			drm_err(dpu->drm, "iommu invalid write error, addr: 0x%08x\n",
+				readl(ctx->base + REG_MMU_INV_ADDR_WR));
+		if (val & BIT_DPU_INT_MMU_VAOR_RD)
+			drm_err(dpu->drm, "iommu va out of range read error, addr: 0x%08x\n",
+				readl(ctx->base + REG_MMU_VAOR_ADDR_RD));
+		if (val & BIT_DPU_INT_MMU_VAOR_WR)
+			drm_err(dpu->drm, "iommu va out of range write error, addr: 0x%08x\n",
+				readl(ctx->base + REG_MMU_VAOR_ADDR_WR));
+
+		for (i = 0; i < 8; i++) {
+			reg_val = layer_reg_rd(ctx, REG_LAY_CTRL, i);
+			if (reg_val & 0x1)
+				drm_info(dpu->drm, "layer%d: 0x%08x 0x%08x 0x%08x ctrl: 0x%08x\n", i,
+					layer_reg_rd(ctx, REG_LAY_BASE_ADDR0, i),
+					layer_reg_rd(ctx, REG_LAY_BASE_ADDR1, i),
+					layer_reg_rd(ctx, REG_LAY_BASE_ADDR2, i),
+					layer_reg_rd(ctx, REG_LAY_CTRL, i));
+		}
+	}
+
+	return val;
+}
+
+static int dpu_wait_stop_done(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
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
+		drm_err(dpu->drm, "dpu wait for stop done time out!\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int dpu_wait_update_done(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+	int rc;
+
+	ctx->evt_update = false;
+
+	rc = wait_event_interruptible_timeout(ctx->wait_queue, ctx->evt_update,
+					       msecs_to_jiffies(500));
+
+	if (!rc) {
+		drm_err(dpu->drm, "dpu wait for reg update done time out!\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static u32 drm_format_to_dpu(struct drm_framebuffer *fb)
+{
+	u32 format = 0;
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_BGRA8888:
+		/* BGRA8888 -> ARGB8888 */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
+		format |= BIT_DPU_LAY_FORMAT_ARGB8888;
+		break;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+		/* RGBA8888 -> ABGR8888 */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
+		/* fallthrough */
+	case DRM_FORMAT_ABGR8888:
+		/* RB switch */
+		format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		/* fallthrough */
+	case DRM_FORMAT_ARGB8888:
+		format |= BIT_DPU_LAY_FORMAT_ARGB8888;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		/* RB switch */
+		format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		/* fallthrough */
+	case DRM_FORMAT_XRGB8888:
+		format |= BIT_DPU_LAY_FORMAT_ARGB8888;
+		break;
+	case DRM_FORMAT_BGR565:
+		/* RB switch */
+		format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		/* fallthrough */
+	case DRM_FORMAT_RGB565:
+		format |= BIT_DPU_LAY_FORMAT_RGB565;
+		break;
+	case DRM_FORMAT_NV12:
+		/* 2-Lane: Yuv420 */
+		format |= BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
+		/* Y endian */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		format |= BIT_DPU_LAY_NO_SWITCH;
+		break;
+	case DRM_FORMAT_NV21:
+		/* 2-Lane: Yuv420 */
+		format |= BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
+		/* Y endian */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		break;
+	case DRM_FORMAT_NV16:
+		/* 2-Lane: Yuv422 */
+		format |= BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
+		/* Y endian */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
+		/* UV endian */
+		format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		break;
+	case DRM_FORMAT_NV61:
+		/* 2-Lane: Yuv422 */
+		format |= BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
+		/* Y endian */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		format |= BIT_DPU_LAY_NO_SWITCH;
+		break;
+	case DRM_FORMAT_YUV420:
+		format |= BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
+		/* Y endian */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		format |= BIT_DPU_LAY_NO_SWITCH;
+		break;
+	case DRM_FORMAT_YVU420:
+		format |= BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
+		/* Y endian */
+		format |= BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
+		/* UV endian */
+		format |= BIT_DPU_LAY_RB_OR_UV_SWITCH;
+		break;
+	default:
+		break;
+	}
+
+	return format;
+}
+
+static u32 drm_rotation_to_dpu(struct drm_plane_state *state)
+{
+	u32 rotation;
+
+	switch (state->rotation) {
+	default:
+	case DRM_MODE_ROTATE_0:
+		rotation = DPU_LAYER_ROTATION_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		rotation = DPU_LAYER_ROTATION_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		rotation = DPU_LAYER_ROTATION_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		rotation = DPU_LAYER_ROTATION_270;
+		break;
+	case DRM_MODE_REFLECT_Y:
+		rotation = DPU_LAYER_ROTATION_180_M;
+		break;
+	case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
+		rotation = DPU_LAYER_ROTATION_90_M;
+		break;
+	case DRM_MODE_REFLECT_X:
+		rotation = DPU_LAYER_ROTATION_0_M;
+		break;
+	case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
+		rotation = DPU_LAYER_ROTATION_270_M;
+		break;
+	}
+
+	return rotation;
+}
+
+static u32 drm_blend_to_dpu(struct drm_plane_state *state)
+{
+	u32 blend = 0;
+
+	switch (state->pixel_blend_mode) {
+	case DRM_MODE_BLEND_COVERAGE:
+		/* alpha mode select - combo alpha */
+		blend |= BIT_DPU_LAY_COMBO_ALPHA;
+		/* Normal mode */
+		blend |= BIT_DPU_LAY_MODE_BLEND_NORMAL;
+		break;
+	case DRM_MODE_BLEND_PREMULTI:
+		/* alpha mode select - combo alpha */
+		blend |= BIT_DPU_LAY_COMBO_ALPHA;
+		/* Pre-mult mode */
+		blend |= BIT_DPU_LAY_MODE_BLEND_PREMULT;
+		break;
+	case DRM_MODE_BLEND_PIXEL_NONE:
+	default:
+		/* don't do blending, maybe RGBX */
+		/* alpha mode select - layer alpha */
+		blend |= BIT_DPU_LAY_LAYER_ALPHA;
+		break;
+	}
+
+	return blend;
+}
+
+static void sprd_dpu_layer(struct sprd_dpu *dpu, struct sprd_plane *plane,
+			struct drm_plane_state *state)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+	struct drm_gem_cma_object *cma_obj;
+	const struct drm_format_info *info;
+	struct drm_framebuffer *fb = state->fb;
+	u32 addr, size, offset, pitch, blend, format, rotation;
+	u32 src_x = state->src_x >> 16;
+	u32 src_y = state->src_y >> 16;
+	u32 src_w = state->src_w >> 16;
+	u32 src_h = state->src_h >> 16;
+	u32 dst_x = state->crtc_x;
+	u32 dst_y = state->crtc_y;
+	u32 alpha = state->alpha;
+	int i;
+
+	offset = (dst_x & 0xffff) | (dst_y << 16);
+	size = (src_w & 0xffff) | (src_h << 16);
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(fb, i);
+		addr = cma_obj->paddr + fb->offsets[i];
+
+		if (i == 0)
+			layer_reg_wr(ctx, REG_LAY_BASE_ADDR0, addr, plane->index);
+		else if (i == 1)
+			layer_reg_wr(ctx, REG_LAY_BASE_ADDR1, addr, plane->index);
+		else
+			layer_reg_wr(ctx, REG_LAY_BASE_ADDR2, addr, plane->index);
+	}
+
+	info = drm_format_info(fb->format->format);
+	if (fb->format->num_planes == 3) {
+		/* UV pitch is 1/2 of Y pitch */
+		pitch = (fb->pitches[0] / info->cpp[0]) |
+				(fb->pitches[0] / info->cpp[0] << 15);
+	} else {
+		pitch = fb->pitches[0] / info->cpp[0];
+	}
+
+	layer_reg_wr(ctx, REG_LAY_POS, offset, plane->index);
+	layer_reg_wr(ctx, REG_LAY_SIZE, size, plane->index);
+	layer_reg_wr(ctx, REG_LAY_CROP_START,
+			src_y << 16 | src_x, plane->index);
+	layer_reg_wr(ctx, REG_LAY_ALPHA, alpha, plane->index);
+	layer_reg_wr(ctx, REG_LAY_PITCH, pitch, plane->index);
+
+	format = drm_format_to_dpu(fb);
+	blend = drm_blend_to_dpu(state);
+	rotation = drm_rotation_to_dpu(state);
+
+	layer_reg_wr(ctx, REG_LAY_CTRL, BIT_DPU_LAY_EN |
+				format |
+				blend |
+				rotation << 20,
+				plane->index);
+}
+
+static void sprd_dpu_flip(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+	u32 reg_val;
+
+	/*
+	 * Make sure the dpu is in stop status. DPU has no shadow
+	 * registers in EDPI mode. So the config registers can only be
+	 * updated in the rising edge of DPU_RUN bit.
+	 */
+	if (ctx->if_type == SPRD_DPU_IF_EDPI)
+		dpu_wait_stop_done(dpu);
+
+	/* update trigger and wait */
+	if (ctx->if_type == SPRD_DPU_IF_DPI) {
+		if (!ctx->stopped) {
+			dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_REG_UPDATE);
+			dpu_wait_update_done(dpu);
+		}
+
+		dpu_reg_set(ctx, REG_DPU_INT_EN, BIT_DPU_INT_ERR);
+	} else if (ctx->if_type == SPRD_DPU_IF_EDPI) {
+		dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_RUN);
+
+		ctx->stopped = false;
+	}
+
+	/*
+	 * If the following interrupt was disabled in isr,
+	 * re-enable it.
+	 */
+	reg_val = BIT_DPU_INT_MMU_VAOR_RD |
+		  BIT_DPU_INT_MMU_VAOR_WR |
+		  BIT_DPU_INT_MMU_INV_RD |
+		  BIT_DPU_INT_MMU_INV_WR;
+	dpu_reg_set(ctx, REG_DPU_INT_EN, reg_val);
+}
+
+static void sprd_dpu_init(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+	u32 reg_val, size;
+
+	writel(0x00, ctx->base + REG_BG_COLOR);
+
+	size = (ctx->vm.vactive << 16) | ctx->vm.hactive;
+	writel(size, ctx->base + REG_PANEL_SIZE);
+	writel(size, ctx->base + REG_BLEND_SIZE);
+
+	writel(0x00, ctx->base + REG_MMU_EN);
+	writel(0x00, ctx->base + REG_MMU_PPN1);
+	writel(0xffff, ctx->base + REG_MMU_RANGE1);
+	writel(0x00, ctx->base + REG_MMU_PPN2);
+	writel(0xffff, ctx->base + REG_MMU_RANGE2);
+	writel(0x1ffff, ctx->base + REG_MMU_VPN_RANGE);
+}
+
+static void sprd_dpu_fini(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	writel(0x00, ctx->base + REG_DPU_INT_EN);
+	writel(0xff, ctx->base + REG_DPU_INT_CLR);
+}
+
+static void sprd_dpi_init(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+	u32 int_mask = 0;
+	u32 reg_val;
+
+	if (ctx->if_type == SPRD_DPU_IF_DPI) {
+		/* use dpi as interface */
+		dpu_reg_clr(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
+		/* disable Halt function for SPRD DSI */
+		dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
+		/* select te from external pad */
+		dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
+
+		/* set dpi timing */
+		reg_val = ctx->vm.hsync_len << 0 |
+			  ctx->vm.hback_porch << 8 |
+			  ctx->vm.hfront_porch << 20;
+		writel(reg_val, ctx->base + REG_DPI_H_TIMING);
+
+		reg_val = ctx->vm.vsync_len << 0 |
+			  ctx->vm.vback_porch << 8 |
+			  ctx->vm.vfront_porch << 20;
+		writel(reg_val, ctx->base + REG_DPI_V_TIMING);
+
+		if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
+			drm_warn(dpu->drm, "Warning: (vsync + vbp) < 32, "
+				"underflow risk!\n");
+
+		/* enable dpu update done INT */
+		int_mask |= BIT_DPU_INT_UPDATE_DONE;
+		/* enable dpu done INT */
+		int_mask |= BIT_DPU_INT_DONE;
+		/* enable dpu dpi vsync */
+		int_mask |= BIT_DPU_INT_VSYNC;
+		/* enable dpu TE INT */
+		int_mask |= BIT_DPU_INT_TE;
+		/* enable underflow err INT */
+		int_mask |= BIT_DPU_INT_ERR;
+	} else if (ctx->if_type == SPRD_DPU_IF_EDPI) {
+		/* use edpi as interface */
+		dpu_reg_set(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
+		/* use external te */
+		dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
+		/* enable te */
+		dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_TE_EN);
+
+		/* enable stop done INT */
+		int_mask |= BIT_DPU_INT_DONE;
+		/* enable TE INT */
+		int_mask |= BIT_DPU_INT_TE;
+	}
+
+	/* enable iommu va out of range read error INT */
+	int_mask |= BIT_DPU_INT_MMU_VAOR_RD;
+	/* enable iommu va out of range write error INT */
+	int_mask |= BIT_DPU_INT_MMU_VAOR_WR;
+	/* enable iommu invalid read error INT */
+	int_mask |= BIT_DPU_INT_MMU_INV_RD;
+	/* enable iommu invalid write error INT */
+	int_mask |= BIT_DPU_INT_MMU_INV_WR;
+
+	writel(int_mask, ctx->base + REG_DPU_INT_EN);
+}
+
+void sprd_dpu_run(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_RUN);
+
+	ctx->stopped = false;
+}
+
+void sprd_dpu_stop(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	if (ctx->if_type == SPRD_DPU_IF_DPI)
+		dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_STOP);
+
+	dpu_wait_stop_done(dpu);
+}
+
+static int sprd_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc_state *crtc_state;
+	u32 fmt;
+
+	if (!fb || !state->crtc)
+		return 0;
+
+	fmt = drm_format_to_dpu(fb);
+	if (!fmt)
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	return drm_atomic_helper_check_plane_state(state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true, true);
+}
+
+static void sprd_plane_atomic_update(struct drm_plane *plane,
+				    struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = plane->state;
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_dpu *dpu = to_sprd_crtc(state->crtc);
+
+	/* start configure dpu layers */
+	sprd_dpu_layer(dpu, p, state);
+}
+
+static void sprd_plane_atomic_disable(struct drm_plane *plane,
+				     struct drm_plane_state *old_state)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_dpu *dpu = to_sprd_crtc(old_state->crtc);
+
+	layer_reg_wr(&dpu->ctx, REG_LAY_CTRL, 0x00, p->index);
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
+	int ret, i;
+
+	for (i = 0; i < 6; i++) {
+		p = devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return ERR_PTR(-ENOMEM);
+
+		ret = drm_universal_plane_init(drm, &p->plane, 1,
+					       &sprd_plane_funcs, primary_fmts,
+					       ARRAY_SIZE(primary_fmts), NULL,
+					       DRM_PLANE_TYPE_PRIMARY, NULL);
+		if (ret) {
+			drm_err(drm, "fail to init primary plane\n");
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
+	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
+
+	drm_dbg(dpu->drm, "%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode));
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
+	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
+
+	sprd_dpu_init(dpu);
+
+	sprd_dpi_init(dpu);
+
+	enable_irq(dpu->ctx.irq);
+
+	drm_crtc_vblank_on(&dpu->crtc);
+}
+
+static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_crtc_state *old_state)
+{
+	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
+	struct drm_device *drm = dpu->crtc.dev;
+
+	drm_crtc_vblank_off(&dpu->crtc);
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
+	drm_dbg(crtc->dev, "%s()\n", __func__);
+
+	return 0;
+}
+
+static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_crtc_state *old_state)
+
+{
+	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
+	struct drm_device *drm = dpu->crtc.dev;
+
+	sprd_dpu_flip(dpu);
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
+	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
+
+	dpu_reg_set(&dpu->ctx, REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
+
+	return 0;
+}
+
+static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
+
+	dpu_reg_clr(&dpu->ctx, REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
+}
+
+static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs = {
+	.mode_valid	= sprd_crtc_mode_valid,
+	.atomic_check	= sprd_crtc_atomic_check,
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
+		drm_err(drm, "find 'ports' phandle of %s failed\n",
+			  drm->dev->of_node->full_name);
+		return -EINVAL;
+	}
+	of_node_put(port);
+	crtc->port = port;
+
+	ret = drm_crtc_init_with_planes(drm, crtc, primary, NULL,
+					&sprd_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(drm, "failed to init crtc.\n");
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
+
+	return 0;
+}
+
+static irqreturn_t sprd_dpu_isr(int irq, void *data)
+{
+	struct sprd_dpu *dpu = data;
+	struct dpu_context *ctx = &dpu->ctx;
+	u32 reg_val, int_mask = 0;
+
+	reg_val = readl(ctx->base + REG_DPU_INT_STS);
+
+	/* disable err interrupt */
+	if (reg_val & BIT_DPU_INT_ERR) {
+		int_mask |= BIT_DPU_INT_ERR;
+		drm_warn(dpu->drm, "Warning: dpu underflow!\n");
+	}
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
+	if (reg_val & BIT_DPU_INT_VSYNC)
+		drm_crtc_handle_vblank(&dpu->crtc);
+
+	int_mask |= check_mmu_isr(dpu, reg_val);
+
+	writel(reg_val, ctx->base + REG_DPU_INT_CLR);
+	dpu_reg_clr(ctx, REG_DPU_INT_EN, int_mask);
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
+	dpu->drm = drm;
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
+		dev_err(dev, "failed to map dpu registers\n");
+		return -EFAULT;
+	}
+
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq < 0) {
+		dev_err(dev, "failed to get dpu irq\n");
+		return ctx->irq;
+	}
+
+	irq_set_status_flags(ctx->irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(dev, ctx->irq, sprd_dpu_isr,
+					0, "DPU", dpu);
+	if (ret) {
+		dev_err(dev, "failed to register dpu irq handler\n");
+		return ret;
+	}
+
+	init_waitqueue_head(&ctx->wait_queue);
+
+	return 0;
+}
+
+static const struct of_device_id dpu_match_table[] = {
+	{ .compatible = "sprd,sharkl3-dpu" },
+	{ /* sentinel */ },
+};
+
+static int sprd_dpu_probe(struct platform_device *pdev)
+{
+	struct sprd_dpu *dpu;
+	int ret;
+
+	dpu = kzalloc(sizeof(*dpu), GFP_KERNEL);
+	if (!dpu)
+		return -ENOMEM;
+
+	ret = sprd_dpu_context_init(dpu, &pdev->dev);
+	if (ret) {
+		kfree(dpu);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, dpu);
+
+	return component_add(&pdev->dev, &dpu_component_ops);
+}
+
+static int sprd_dpu_remove(struct platform_device *pdev)
+{
+	struct sprd_dpu *dpu = platform_get_drvdata(pdev);
+
+	component_del(&pdev->dev, &dpu_component_ops);
+
+	kfree(dpu);
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
index 0000000..a937ba1
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.h
@@ -0,0 +1,120 @@
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
+/* DPU Layer registers offset */
+#define DPU_LAY_REG_OFFSET	0x30
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
+ */
+struct sprd_dpu {
+	struct drm_crtc crtc;
+	struct drm_device *drm;
+	struct dpu_context ctx;
+};
+
+static inline struct sprd_dpu *to_sprd_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct sprd_dpu, crtc);
+}
+
+static inline void
+dpu_reg_set(struct dpu_context *ctx, u32 offset, u32 set_bits)
+{
+	u32 bits = readl_relaxed(ctx->base + offset);
+
+	writel(bits | set_bits, ctx->base + offset);
+}
+
+static inline void
+dpu_reg_clr(struct dpu_context *ctx, u32 offset, u32 clr_bits)
+{
+	u32 bits = readl_relaxed(ctx->base + offset);
+
+	writel(bits & ~clr_bits, ctx->base + offset);
+}
+
+static inline u32
+layer_reg_rd(struct dpu_context *ctx, u32 offset, int index)
+{
+	u32 layer_offset = offset + index * DPU_LAY_REG_OFFSET;
+
+	return readl(ctx->base + layer_offset);
+}
+
+static inline void
+layer_reg_wr(struct dpu_context *ctx, u32 offset, u32 cfg_bits, int index)
+{
+	u32 layer_offset =  offset + index * DPU_LAY_REG_OFFSET;
+
+	writel(cfg_bits, ctx->base + layer_offset);
+}
+
+void sprd_dpu_run(struct sprd_dpu *dpu);
+void sprd_dpu_stop(struct sprd_dpu *dpu);
+
+#endif
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index ec101de..ca93be2 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -196,6 +196,7 @@ static struct platform_driver sprd_drm_driver = {
 
 static struct platform_driver *sprd_drm_drivers[]  = {
 	&sprd_drm_driver,
+	&sprd_dpu_driver,
 };
 
 static int __init sprd_drm_init(void)
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
index 9781fd5..85d4a8b 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.h
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -13,4 +13,6 @@ struct sprd_drm {
 	struct drm_device drm;
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
