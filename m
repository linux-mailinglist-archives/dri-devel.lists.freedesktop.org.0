Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135261228F4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066976E989;
	Tue, 17 Dec 2019 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87FA6E505
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:41:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id b9so3516579pgk.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C7I6a6XyaplhlXqdORj2No39wU9zaST8z3bZ2yMo83Y=;
 b=O3PdClcIFj6E5ewQhxudh59tPJl/Db4DSooGn5VSTqEFUqmRO+QaFqujtJpYXv0m1O
 zzXIoV7bHFetvCFur6kz7XdRawP4i35S+clc7IIjYuptm904XNK+ewFxY05N0ovV6SMM
 30J94mApl+ruRsmTAuuKFdPdYxi76by1u4anOxGeB+CMGhurv/IJMqvw06dYezP/1WBQ
 uVbbTCYwXoxmK9qfekd2aFzks68+CIKC0h916rcEimqljvhbVXoNBPAD9vTlNwfSTqOM
 9Rnv9v8eqsnJa1a6ip8QjOVKg4H0snuITWCwEO6rzbdtulaeOOl2Rz4+XeITu/gPfLNh
 bk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C7I6a6XyaplhlXqdORj2No39wU9zaST8z3bZ2yMo83Y=;
 b=MmnaiSpjt2YFquOKBwzK7OMSCiRmlF7z3ChkCMR0+A5S+cCEg85xm9p+LzU6A1AONL
 X/aAQUN5L+4j9eES7mSxBoPdo7ZkiiXs9UvM0/yFt4ivwJBJZUwFDRdzqXlsqulm+8q8
 LJUVMsKorLRfI+NsKi5e3QBm+Yffv0VT+I+luo1oi4Dip75EWhM9sxg2KFOrFMX+cRfN
 jEtWw4X0a/bjVXDhJeZflUi0npJCPmH76ru0v/wmS3A7B/QXUZu8MQj/Sf6dCh2SA4xv
 48mKyyxlaJAH9H35a3HjwdYzYOgL3cO9izSONOUhJSIZRO7nXxOZtI6dqwkuCHBVhkce
 saLA==
X-Gm-Message-State: APjAAAWnO0nwkH8v2SRT7k3jmQZOqqEbs5DsM2C5zIgZ0g0evjMaye4X
 JQBl84tFkQu4P8IHYKNxbJU=
X-Google-Smtp-Source: APXvYqzpdJzgI53q7LVjH6//RqVmk9/zbQuFvYQj4W8i0ZmOjypFTSMohoOZYeWoDlQ0Gy/X/U5lSg==
X-Received: by 2002:aa7:9306:: with SMTP id 6mr15034398pfj.159.1576496480157; 
 Mon, 16 Dec 2019 03:41:20 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id p124sm22432269pfb.52.2019.12.16.03.41.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 16 Dec 2019 03:41:19 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v1 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Date: Mon, 16 Dec 2019 19:40:17 +0800
Message-Id: <1576496419-12409-5-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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

From: Kevin Tang <kevin.tang@unisoc.com>

Adds DPU(Display Processor Unit) support for the Unisoc's display subsystem.
It's support multi planes, scaler, rotation, PQ(Picture Quality) and more.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/sprd/Makefile       |   6 +-
 drivers/gpu/drm/sprd/disp_lib.c     |  93 +++++
 drivers/gpu/drm/sprd/disp_lib.h     |  34 ++
 drivers/gpu/drm/sprd/dpu/Makefile   |   8 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 798 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.c     | 671 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h     | 138 +++++++
 drivers/gpu/drm/sprd/sprd_drm.c     |   2 +-
 drivers/gpu/drm/sprd/sprd_drm.h     |   2 +
 9 files changed, 1750 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h

diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
index df0b316..3f188ab 100644
--- a/drivers/gpu/drm/sprd/Makefile
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -5,4 +5,8 @@ ccflags-y += -Iinclude/drm
 subdir-ccflags-y += -I$(src)
 
 obj-y := sprd_drm.o \
-	sprd_gem.o
\ No newline at end of file
+	sprd_gem.o \
+	sprd_dpu.o
+
+obj-y += disp_lib.o
+obj-y += dpu/
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/disp_lib.c b/drivers/gpu/drm/sprd/disp_lib.c
new file mode 100644
index 0000000..6f78052
--- /dev/null
+++ b/drivers/gpu/drm/sprd/disp_lib.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#define pr_fmt(__fmt) "[drm][%20s] "__fmt, __func__
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+#include "disp_lib.h"
+
+void *disp_ops_attach(const char *str, struct list_head *head)
+{
+	struct ops_list *list;
+	const char *ver;
+
+	list_for_each_entry(list, head, head) {
+		ver = list->entry->ver;
+		if (!strcmp(str, ver))
+			return list->entry->ops;
+	}
+
+	DRM_ERROR("attach disp ops %s failed\n", str);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(disp_ops_attach);
+
+int disp_ops_register(struct ops_entry *entry, struct list_head *head)
+{
+	struct ops_list *list;
+
+	list = kzalloc(sizeof(struct ops_list), GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	list->entry = entry;
+	list_add(&list->head, head);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(disp_ops_register);
+
+struct device *sprd_disp_pipe_get_by_port(struct device *dev, int port)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *endpoint;
+	struct device_node *remote_node;
+	struct platform_device *remote_pdev;
+
+	endpoint = of_graph_get_endpoint_by_regs(np, port, 0);
+	if (!endpoint) {
+		DRM_ERROR("%s/port%d/endpoint0 was not found\n",
+			  np->full_name, port);
+		return NULL;
+	}
+
+	remote_node = of_graph_get_remote_port_parent(endpoint);
+	if (!remote_node) {
+		DRM_ERROR("device node was not found by endpoint0\n");
+		return NULL;
+	}
+
+	remote_pdev = of_find_device_by_node(remote_node);
+	if (remote_pdev == NULL) {
+		DRM_ERROR("find %s platform device failed\n",
+			  remote_node->full_name);
+		return NULL;
+	}
+
+	return &remote_pdev->dev;
+}
+EXPORT_SYMBOL_GPL(sprd_disp_pipe_get_by_port);
+
+struct device *sprd_disp_pipe_get_input(struct device *dev)
+{
+	return sprd_disp_pipe_get_by_port(dev, 1);
+}
+EXPORT_SYMBOL_GPL(sprd_disp_pipe_get_input);
+
+struct device *sprd_disp_pipe_get_output(struct device *dev)
+{
+	return sprd_disp_pipe_get_by_port(dev, 0);
+}
+EXPORT_SYMBOL_GPL(sprd_disp_pipe_get_output);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc display common API library");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sprd/disp_lib.h b/drivers/gpu/drm/sprd/disp_lib.h
new file mode 100644
index 0000000..d694302
--- /dev/null
+++ b/drivers/gpu/drm/sprd/disp_lib.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _DISP_LIB_H_
+#define _DISP_LIB_H_
+
+#include <linux/list.h>
+#include <drm/drm_print.h>
+
+#ifdef pr_fmt
+#undef pr_fmt
+#define pr_fmt(__fmt) "[drm][%20s] "__fmt, __func__
+#endif
+
+struct ops_entry {
+	const char *ver;
+	void *ops;
+};
+
+struct ops_list {
+	struct list_head head;
+	struct ops_entry *entry;
+};
+
+void *disp_ops_attach(const char *str, struct list_head *head);
+int disp_ops_register(struct ops_entry *entry, struct list_head *head);
+
+struct device *sprd_disp_pipe_get_by_port(struct device *dev, int port);
+struct device *sprd_disp_pipe_get_input(struct device *dev);
+struct device *sprd_disp_pipe_get_output(struct device *dev);
+
+#endif
diff --git a/drivers/gpu/drm/sprd/dpu/Makefile b/drivers/gpu/drm/sprd/dpu/Makefile
new file mode 100644
index 0000000..d960107
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dpu/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifdef CONFIG_ARM64
+KBUILD_CFLAGS += -mstrict-align
+endif
+
+obj-y += dpu_r2p0.o
+
diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
new file mode 100644
index 0000000..2b17e04
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
@@ -0,0 +1,798 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include "sprd_dpu.h"
+
+#define DISPC_INT_FBC_PLD_ERR_MASK	BIT(8)
+#define DISPC_INT_FBC_HDR_ERR_MASK	BIT(9)
+
+#define DISPC_INT_MMU_INV_WR_MASK	BIT(19)
+#define DISPC_INT_MMU_INV_RD_MASK	BIT(18)
+#define DISPC_INT_MMU_VAOR_WR_MASK	BIT(17)
+#define DISPC_INT_MMU_VAOR_RD_MASK	BIT(16)
+
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
+struct wb_region_reg {
+	u32 pos;
+	u32 size;
+};
+
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
+static DECLARE_WAIT_QUEUE_HEAD(wait_queue);
+static bool panel_ready = true;
+static bool evt_update;
+static bool evt_stop;
+
+static u32 dpu_get_version(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	return reg->dpu_version;
+}
+
+static void dpu_dump(struct dpu_context *ctx)
+{
+	u32 *reg = (u32 *)ctx->base;
+	int i;
+
+	pr_info("      0          4          8          C\n");
+	for (i = 0; i < 256; i += 4) {
+		pr_info("%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i + 3]);
+	}
+}
+
+static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	u32 mmu_mask = DISPC_INT_MMU_VAOR_RD_MASK |
+			DISPC_INT_MMU_VAOR_WR_MASK |
+			DISPC_INT_MMU_INV_RD_MASK |
+			DISPC_INT_MMU_INV_WR_MASK;
+	u32 val = reg_val & mmu_mask;
+
+	if (val) {
+		pr_err("--- iommu interrupt err: 0x%04x ---\n", val);
+
+		pr_err("iommu invalid read error, addr: 0x%08x\n",
+			reg->mmu_inv_addr_rd);
+		pr_err("iommu invalid write error, addr: 0x%08x\n",
+			reg->mmu_inv_addr_wr);
+		pr_err("iommu va out of range read error, addr: 0x%08x\n",
+			reg->mmu_vaor_addr_rd);
+		pr_err("iommu va out of range write error, addr: 0x%08x\n",
+			reg->mmu_vaor_addr_wr);
+		pr_err("BUG: iommu failure at %s:%d/%s()!\n",
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
+	int i;
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	for (i = 0; i < 8; i++)
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
+	if (reg_val & DISPC_INT_ERR_MASK)
+		int_mask |= DISPC_INT_ERR_MASK;
+
+	/* dpu update done isr */
+	if (reg_val & DISPC_INT_UPDATE_DONE_MASK) {
+		evt_update = true;
+		wake_up_interruptible_all(&wait_queue);
+	}
+
+	/* dpu stop done isr */
+	if (reg_val & DISPC_INT_DONE_MASK) {
+		evt_stop = true;
+		wake_up_interruptible_all(&wait_queue);
+	}
+
+	/* dpu ifbc payload error isr */
+	if (reg_val & DISPC_INT_FBC_PLD_ERR_MASK) {
+		int_mask |= DISPC_INT_FBC_PLD_ERR_MASK;
+		pr_err("dpu ifbc payload error\n");
+	}
+
+	/* dpu ifbc header error isr */
+	if (reg_val & DISPC_INT_FBC_HDR_ERR_MASK) {
+		int_mask |= DISPC_INT_FBC_HDR_ERR_MASK;
+		pr_err("dpu ifbc header error\n");
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
+	if (ctx->is_stopped)
+		return 0;
+
+	rc = wait_event_interruptible_timeout(wait_queue, evt_stop,
+					       msecs_to_jiffies(500));
+	evt_stop = false;
+
+	ctx->is_stopped = true;
+
+	if (!rc) {
+		pr_err("dpu wait for stop done time out!\n");
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
+	evt_update = false;
+
+	rc = wait_event_interruptible_timeout(wait_queue, evt_update,
+					       msecs_to_jiffies(500));
+
+	if (!rc) {
+		pr_err("dpu wait for reg update done time out!\n");
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
+	if (ctx->if_type == SPRD_DISPC_IF_DPI)
+		reg->dpu_ctrl |= BIT(1);
+
+	dpu_wait_stop_done(ctx);
+	pr_info("dpu stop\n");
+}
+
+static void dpu_run(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_ctrl |= BIT(0);
+
+	ctx->is_stopped = false;
+
+	pr_info("dpu run\n");
+
+	if (ctx->if_type == SPRD_DISPC_IF_EDPI) {
+		/*
+		 * If the panel read GRAM speed faster than
+		 * DSI write GRAM speed, it will display some
+		 * mass on screen when backlight on. So wait
+		 * a TE period after flush the GRAM.
+		 */
+		if (!panel_ready) {
+			dpu_wait_stop_done(ctx);
+			/* wait for TE again */
+			mdelay(20);
+			panel_ready = true;
+		}
+	}
+}
+
+static int dpu_init(struct dpu_context *ctx)
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
+	if (ctx->is_stopped)
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
+
+	return 0;
+}
+
+static void dpu_uninit(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_int_en = 0;
+	reg->dpu_int_clr = 0xff;
+
+	panel_ready = false;
+}
+
+enum {
+	DPU_LAYER_FORMAT_YUV422_2PLANE,
+	DPU_LAYER_FORMAT_YUV420_2PLANE,
+	DPU_LAYER_FORMAT_YUV420_3PLANE,
+	DPU_LAYER_FORMAT_ARGB8888,
+	DPU_LAYER_FORMAT_RGB565,
+	DPU_LAYER_FORMAT_XFBC_ARGB8888 = 8,
+	DPU_LAYER_FORMAT_XFBC_RGB565,
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
+	case 0:
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
+		pr_err("rotation convert unsupport angle (drm)= 0x%x\n", angle);
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
+	case DRM_FORMAT_ABGR8888:
+		/* rb switch */
+		reg_val |= BIT(10);
+	case DRM_FORMAT_ARGB8888:
+		reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
+		break;
+	case DRM_FORMAT_XBGR8888:
+		/* rb switch */
+		reg_val |= BIT(10);
+	case DRM_FORMAT_XRGB8888:
+		reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
+		break;
+	case DRM_FORMAT_BGR565:
+		/* rb switch */
+		reg_val |= BIT(10);
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
+		pr_err("error: invalid format %c%c%c%c\n", format,
+						format >> 8,
+						format >> 16,
+						format >> 24);
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
+		/*Normal mode*/
+		reg_val &= (~BIT(16));
+		break;
+	case DRM_MODE_BLEND_PREMULTI:
+		/* alpha mode select - combo alpha */
+		reg_val |= BIT(3);
+		/*Pre-mult mode*/
+		reg_val |= BIT(16);
+		break;
+	default:
+		/* alpha mode select - layer alpha */
+		reg_val |= BIT(2);
+		break;
+	}
+
+	rotation = to_dpu_rotation(rotation);
+	reg_val |= (rotation & 0x7) << 20;
+
+	return reg_val;
+}
+
+static void dpu_bgcolor(struct dpu_context *ctx, u32 color)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	if (ctx->if_type == SPRD_DISPC_IF_EDPI)
+		dpu_wait_stop_done(ctx);
+
+	reg->bg_color = color;
+
+	dpu_clean_all(ctx);
+
+	if ((ctx->if_type == SPRD_DISPC_IF_DPI) && !ctx->is_stopped) {
+		reg->dpu_ctrl |= BIT(2);
+		dpu_wait_update_done(ctx);
+	} else if (ctx->if_type == SPRD_DISPC_IF_EDPI) {
+		reg->dpu_ctrl |= BIT(0);
+		ctx->is_stopped = false;
+	}
+}
+
+static void dpu_layer(struct dpu_context *ctx,
+		    struct sprd_dpu_layer *hwlayer)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	const struct drm_format_info *info;
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
+			pr_err("layer addr[%d] is not 16 bytes align, it's 0x%08x\n",
+				i, addr);
+		layer->addr[i] = addr;
+	}
+
+	layer->pos = offset;
+	layer->size = size;
+	layer->crop_start = (hwlayer->src_y << 16) | hwlayer->src_x;
+	layer->alpha = hwlayer->alpha;
+
+	info = drm_format_info(hwlayer->format);
+	if (info->cpp[0] == 0) {
+		pr_err("layer[%d] bytes per pixel is invalid\n", hwlayer->index);
+		return;
+	}
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
+	pr_debug("dst_x = %d, dst_y = %d, dst_w = %d, dst_h = %d\n",
+				hwlayer->dst_x, hwlayer->dst_y,
+				hwlayer->dst_w, hwlayer->dst_h);
+	pr_debug("start_x = %d, start_y = %d, start_w = %d, start_h = %d\n",
+				hwlayer->src_x, hwlayer->src_y,
+				hwlayer->src_w, hwlayer->src_h);
+}
+
+static void dpu_flip(struct dpu_context *ctx,
+		     struct sprd_dpu_layer layers[], u8 count)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	int i;
+
+	/*
+	 * Make sure the dpu is in stop status. DPU_R2P0 has no shadow
+	 * registers in EDPI mode. So the config registers can only be
+	 * updated in the rising edge of DPU_RUN bit.
+	 */
+	if (ctx->if_type == SPRD_DISPC_IF_EDPI)
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
+	if (ctx->if_type == SPRD_DISPC_IF_DPI) {
+		if (!ctx->is_stopped) {
+			reg->dpu_ctrl |= BIT(2);
+			dpu_wait_update_done(ctx);
+		}
+
+		reg->dpu_int_en |= DISPC_INT_ERR_MASK;
+
+	} else if (ctx->if_type == SPRD_DISPC_IF_EDPI) {
+		reg->dpu_ctrl |= BIT(0);
+
+		ctx->is_stopped = false;
+	}
+
+	/*
+	 * If the following interrupt was disabled in isr,
+	 * re-enable it.
+	 */
+	reg->dpu_int_en |= DISPC_INT_FBC_PLD_ERR_MASK |
+			   DISPC_INT_FBC_HDR_ERR_MASK |
+			   DISPC_INT_MMU_VAOR_RD_MASK |
+			   DISPC_INT_MMU_VAOR_WR_MASK |
+			   DISPC_INT_MMU_INV_RD_MASK |
+			   DISPC_INT_MMU_INV_WR_MASK;
+}
+
+static void dpu_dpi_init(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+	u32 int_mask = 0;
+
+	if (ctx->if_type == SPRD_DISPC_IF_DPI) {
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
+			pr_warn("Warning: (vsync + vbp) < 32, "
+				"underflow risk!\n");
+
+		/* enable dpu update done INT */
+		int_mask |= DISPC_INT_UPDATE_DONE_MASK;
+		/* enable dpu DONE  INT */
+		int_mask |= DISPC_INT_DONE_MASK;
+		/* enable dpu dpi vsync */
+		int_mask |= DISPC_INT_DPI_VSYNC_MASK;
+		/* enable dpu TE INT */
+		int_mask |= DISPC_INT_TE_MASK;
+		/* enable underflow err INT */
+		int_mask |= DISPC_INT_ERR_MASK;
+		/* enable write back done INT */
+		int_mask |= DISPC_INT_WB_DONE_MASK;
+		/* enable write back fail INT */
+		int_mask |= DISPC_INT_WB_FAIL_MASK;
+
+	} else if (ctx->if_type == SPRD_DISPC_IF_EDPI) {
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
+		int_mask |= DISPC_INT_DONE_MASK;
+		/* enable TE INT */
+		int_mask |= DISPC_INT_TE_MASK;
+	}
+
+	/* enable ifbc payload error INT */
+	int_mask |= DISPC_INT_FBC_PLD_ERR_MASK;
+	/* enable ifbc header error INT */
+	int_mask |= DISPC_INT_FBC_HDR_ERR_MASK;
+	/* enable iommu va out of range read error INT */
+	int_mask |= DISPC_INT_MMU_VAOR_RD_MASK;
+	/* enable iommu va out of range write error INT */
+	int_mask |= DISPC_INT_MMU_VAOR_WR_MASK;
+	/* enable iommu invalid read error INT */
+	int_mask |= DISPC_INT_MMU_INV_RD_MASK;
+	/* enable iommu invalid write error INT */
+	int_mask |= DISPC_INT_MMU_INV_WR_MASK;
+
+	reg->dpu_int_en = int_mask;
+}
+
+static void enable_vsync(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_int_en |= DISPC_INT_DPI_VSYNC_MASK;
+}
+
+static void disable_vsync(struct dpu_context *ctx)
+{
+	struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
+
+	reg->dpu_int_en &= ~DISPC_INT_DPI_VSYNC_MASK;
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
+static int dpu_capability(struct dpu_context *ctx,
+			struct dpu_capability *cap)
+{
+	if (!cap)
+		return -EINVAL;
+
+	cap->max_layers = 6;
+	cap->fmts_ptr = primary_fmts;
+	cap->fmts_cnt = ARRAY_SIZE(primary_fmts);
+
+	return 0;
+}
+
+static struct dpu_core_ops dpu_r2p0_ops = {
+	.version = dpu_get_version,
+	.init = dpu_init,
+	.uninit = dpu_uninit,
+	.run = dpu_run,
+	.stop = dpu_stop,
+	.isr = dpu_isr,
+	.ifconfig = dpu_dpi_init,
+	.capability = dpu_capability,
+	.flip = dpu_flip,
+	.bg_color = dpu_bgcolor,
+	.enable_vsync = enable_vsync,
+	.disable_vsync = disable_vsync,
+};
+
+static struct ops_entry entry = {
+	.ver = "dpu-r2p0",
+	.ops = &dpu_r2p0_ops,
+};
+
+static int __init dpu_core_register(void)
+{
+	return dpu_core_ops_register(&entry);
+}
+
+subsys_initcall(dpu_core_register);
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
new file mode 100644
index 0000000..8d8b95a
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -0,0 +1,671 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/dma-buf.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "sprd_drm.h"
+#include "sprd_dpu.h"
+#include "sprd_gem.h"
+
+struct sprd_plane {
+	struct drm_plane plane;
+	u32 index;
+};
+
+LIST_HEAD(dpu_core_head);
+
+static int sprd_dpu_init(struct sprd_dpu *dpu);
+static int sprd_dpu_uninit(struct sprd_dpu *dpu);
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
+	struct drm_gem_object *obj;
+	struct sprd_gem_obj *sprd_gem;
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_dpu *dpu = crtc_to_dpu(plane->state->crtc);
+	struct sprd_dpu_layer *layer = &dpu->layers[p->index];
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
+		obj = drm_gem_fb_get_obj(fb, i);
+		sprd_gem = to_sprd_gem_obj(obj);
+		layer->addr[i] = sprd_gem->dma_addr + fb->offsets[i];
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
+static int sprd_plane_create_properties(struct sprd_plane *p, int index)
+{
+	/* create rotation property */
+	drm_plane_create_rotation_property(&p->plane,
+					   DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_MASK |
+					   DRM_MODE_REFLECT_MASK);
+
+	/* create alpha property */
+	drm_plane_create_alpha_property(&p->plane);
+
+	/* create zpos property */
+	drm_plane_create_zpos_immutable_property(&p->plane, index);
+
+	return 0;
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
+	int err, i;
+
+	if (dpu->core && dpu->core->capability)
+		dpu->core->capability(&dpu->ctx, &cap);
+
+	dpu->layers = devm_kcalloc(drm->dev, cap.max_layers,
+				  sizeof(struct sprd_dpu_layer), GFP_KERNEL);
+	if (!dpu->layers)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < cap.max_layers; i++) {
+
+		p = devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return ERR_PTR(-ENOMEM);
+
+		err = drm_universal_plane_init(drm, &p->plane, 1,
+					       &sprd_plane_funcs, cap.fmts_ptr,
+					       cap.fmts_cnt, NULL,
+					       DRM_PLANE_TYPE_PRIMARY, NULL);
+		if (err) {
+			DRM_ERROR("fail to init primary plane\n");
+			return ERR_PTR(err);
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
+	if (p)
+		DRM_INFO("dpu plane init ok\n");
+
+	return primary;
+}
+
+static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	if ((dpu->mode->hdisplay == dpu->mode->htotal) ||
+	    (dpu->mode->vdisplay == dpu->mode->vtotal))
+		dpu->ctx.if_type = SPRD_DISPC_IF_EDPI;
+	else
+		dpu->ctx.if_type = SPRD_DISPC_IF_DPI;
+}
+
+static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc,
+					const struct drm_display_mode *mode)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	DRM_INFO("%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode));
+
+	if (mode->type & DRM_MODE_TYPE_DEFAULT)
+		dpu->mode = (struct drm_display_mode *)mode;
+
+	if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+		dpu->mode = (struct drm_display_mode *)mode;
+		drm_display_mode_to_videomode(dpu->mode, &dpu->ctx.vm);
+	}
+
+	return MODE_OK;
+}
+
+static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_state)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+	static bool is_enabled = true;
+
+	DRM_INFO("%s()\n", __func__);
+
+	if (is_enabled)
+		is_enabled = false;
+	else
+		pm_runtime_get_sync(dpu->dev.parent);
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
+	DRM_INFO("%s()\n", __func__);
+
+	disable_irq(dpu->ctx.irq);
+
+	sprd_dpu_uninit(dpu);
+
+	pm_runtime_put(dpu->dev.parent);
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
+	DRM_DEBUG("%s()\n", __func__);
+
+	down(&dpu->ctx.refresh_lock);
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
+	DRM_DEBUG("%s()\n", __func__);
+
+	if (dpu->core && dpu->core->flip && dpu->pending_planes)
+		dpu->core->flip(&dpu->ctx, dpu->layers, dpu->pending_planes);
+
+	up(&dpu->ctx.refresh_lock);
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
+	DRM_DEBUG("%s()\n", __func__);
+
+	if (dpu->core && dpu->core->enable_vsync)
+		dpu->core->enable_vsync(&dpu->ctx);
+
+	return 0;
+}
+
+static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+
+	DRM_DEBUG("%s()\n", __func__);
+
+	if (dpu->core && dpu->core->disable_vsync)
+		dpu->core->disable_vsync(&dpu->ctx);
+}
+
+static int sprd_crtc_create_properties(struct drm_crtc *crtc)
+{
+	struct sprd_dpu *dpu = crtc_to_dpu(crtc);
+	struct drm_device *drm = dpu->crtc.dev;
+	struct drm_property *prop;
+	struct drm_property_blob *blob;
+	size_t blob_size;
+
+	blob_size = strlen(dpu->ctx.version) + 1;
+
+	blob = drm_property_create_blob(dpu->crtc.dev, blob_size,
+			dpu->ctx.version);
+	if (IS_ERR(blob)) {
+		DRM_ERROR("drm_property_create_blob dpu version failed\n");
+		return PTR_ERR(blob);
+	}
+
+	/* create dpu version property */
+	prop = drm_property_create(drm,
+		DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+		"dpu version", 0);
+	if (!prop) {
+		DRM_ERROR("drm_property_create dpu version failed\n");
+		return -ENOMEM;
+	}
+	drm_object_attach_property(&crtc->base, prop, blob->base.id);
+
+	return 0;
+}
+
+static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs = {
+	.mode_set_nofb	= sprd_crtc_mode_set_nofb,
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
+	int err;
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
+	err = drm_crtc_init_with_planes(drm, crtc, primary, NULL,
+					&sprd_crtc_funcs, NULL);
+	if (err) {
+		DRM_ERROR("failed to init crtc.\n");
+		return err;
+	}
+
+	drm_mode_crtc_set_gamma_size(crtc, 256);
+
+	drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
+
+	sprd_crtc_create_properties(crtc);
+
+	DRM_INFO("%s() ok\n", __func__);
+	return 0;
+}
+
+int sprd_dpu_run(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	down(&ctx->refresh_lock);
+
+	if (!ctx->is_inited) {
+		DRM_ERROR("dpu is not initialized\n");
+		up(&ctx->refresh_lock);
+		return -EINVAL;
+	}
+
+	if (!ctx->is_stopped) {
+		up(&ctx->refresh_lock);
+		return 0;
+	}
+
+	if (dpu->core && dpu->core->run)
+		dpu->core->run(ctx);
+
+	up(&ctx->refresh_lock);
+
+	drm_crtc_vblank_on(&dpu->crtc);
+
+	return 0;
+}
+
+int sprd_dpu_stop(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	down(&ctx->refresh_lock);
+
+	if (!ctx->is_inited) {
+		DRM_ERROR("dpu is not initialized\n");
+		up(&ctx->refresh_lock);
+		return -EINVAL;
+	}
+
+	if (ctx->is_stopped) {
+		up(&ctx->refresh_lock);
+		return 0;
+	}
+
+	if (dpu->core && dpu->core->stop)
+		dpu->core->stop(ctx);
+
+	up(&ctx->refresh_lock);
+
+	drm_crtc_handle_vblank(&dpu->crtc);
+	drm_crtc_vblank_off(&dpu->crtc);
+
+	return 0;
+}
+
+static int sprd_dpu_init(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	down(&ctx->refresh_lock);
+
+	if (dpu->ctx.is_inited) {
+		up(&ctx->refresh_lock);
+		return 0;
+	}
+
+	if (dpu->core && dpu->core->init)
+		dpu->core->init(ctx);
+	if (dpu->core && dpu->core->ifconfig)
+		dpu->core->ifconfig(ctx);
+
+	ctx->is_inited = true;
+
+	up(&ctx->refresh_lock);
+
+	return 0;
+}
+
+static int sprd_dpu_uninit(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	down(&ctx->refresh_lock);
+
+	if (!dpu->ctx.is_inited) {
+		up(&ctx->refresh_lock);
+		return 0;
+	}
+
+	if (dpu->core && dpu->core->uninit)
+		dpu->core->uninit(ctx);
+
+	ctx->is_inited = false;
+
+	up(&ctx->refresh_lock);
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
+	if (dpu->core && dpu->core->isr)
+		int_mask = dpu->core->isr(ctx);
+
+	if (int_mask & DISPC_INT_TE_MASK) {
+		if (ctx->te_check_en) {
+			ctx->evt_te = true;
+			wake_up_interruptible_all(&ctx->te_wq);
+		}
+	}
+
+	if (int_mask & DISPC_INT_ERR_MASK)
+		DRM_WARN("Warning: dpu underflow!\n");
+
+	if ((int_mask & DISPC_INT_DPI_VSYNC_MASK) && ctx->is_inited)
+		drm_crtc_handle_vblank(&dpu->crtc);
+
+	return IRQ_HANDLED;
+}
+
+static int sprd_dpu_irq_request(struct sprd_dpu *dpu)
+{
+	int err;
+	int irq_num;
+
+	irq_num = irq_of_parse_and_map(dpu->dev.of_node, 0);
+	if (!irq_num) {
+		DRM_ERROR("error: dpu parse irq num failed\n");
+		return -EINVAL;
+	}
+	DRM_INFO("dpu irq_num = %d\n", irq_num);
+
+	irq_set_status_flags(irq_num, IRQ_NOAUTOEN);
+	err = devm_request_irq(&dpu->dev, irq_num, sprd_dpu_isr,
+					0, "DISPC", dpu);
+	if (err) {
+		DRM_ERROR("error: dpu request irq failed\n");
+		return -EINVAL;
+	}
+	dpu->ctx.irq = irq_num;
+	dpu->ctx.dpu_isr = sprd_dpu_isr;
+
+	return 0;
+}
+
+static int sprd_dpu_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct sprd_drm *sprd = drm->dev_private;
+	struct sprd_dpu *dpu = dev_get_drvdata(dev);
+	struct drm_plane *plane;
+	int err;
+
+	DRM_INFO("%s()\n", __func__);
+
+	plane = sprd_plane_init(drm, dpu);
+	if (IS_ERR_OR_NULL(plane)) {
+		err = PTR_ERR(plane);
+		return err;
+	}
+
+	err = sprd_crtc_init(drm, &dpu->crtc, plane);
+	if (err)
+		return err;
+
+	sprd_dpu_irq_request(dpu);
+
+	sprd->dpu_dev = dev;
+
+	return 0;
+}
+
+static void sprd_dpu_unbind(struct device *dev, struct device *master,
+	void *data)
+{
+	struct sprd_dpu *dpu = dev_get_drvdata(dev);
+
+	DRM_INFO("%s()\n", __func__);
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
+				struct device_node *np)
+{
+	u32 temp;
+	struct resource r;
+	struct dpu_context *ctx = &dpu->ctx;
+
+	if (!of_property_read_u32(np, "sprd,dev-id", &temp))
+		ctx->id = temp;
+
+	if (of_address_to_resource(np, 0, &r)) {
+		DRM_ERROR("parse dt base address failed\n");
+		return -ENODEV;
+	}
+	ctx->base = (unsigned long)ioremap_nocache(r.start,
+					resource_size(&r));
+	if (ctx->base == 0) {
+		DRM_ERROR("ioremap base address failed\n");
+		return -EFAULT;
+	}
+
+	sema_init(&ctx->refresh_lock, 1);
+
+	return 0;
+}
+
+static int sprd_dpu_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct sprd_dpu *dpu;
+	int ret;
+
+	dpu = devm_kzalloc(&pdev->dev, sizeof(*dpu), GFP_KERNEL);
+	if (!dpu)
+		return -ENOMEM;
+
+	ret = sprd_dpu_context_init(dpu, np);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, dpu);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
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
+static const struct of_device_id dpu_match_table[] = {
+	{ .compatible = "sprd,display-processor",},
+	{},
+};
+
+static struct platform_driver sprd_dpu_driver = {
+	.probe = sprd_dpu_probe,
+	.remove = sprd_dpu_remove,
+	.driver = {
+		.name = "sprd-dpu-drv",
+		.of_match_table = dpu_match_table,
+	},
+};
+module_platform_driver(sprd_dpu_driver);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc Display Controller Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sprd_dpu.h
new file mode 100644
index 0000000..229151c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dpu.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
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
+#include "disp_lib.h"
+
+#define DISPC_INT_DONE_MASK		BIT(0)
+#define DISPC_INT_TE_MASK		BIT(1)
+#define DISPC_INT_ERR_MASK		BIT(2)
+#define DISPC_INT_EDPI_TE_MASK		BIT(3)
+#define DISPC_INT_UPDATE_DONE_MASK	BIT(4)
+#define DISPC_INT_DPI_VSYNC_MASK	BIT(5)
+#define DISPC_INT_WB_DONE_MASK		BIT(6)
+#define DISPC_INT_WB_FAIL_MASK		BIT(7)
+
+/* NOTE: this mask is not a realy dpu interrupt mask */
+#define DISPC_INT_FENCE_SIGNAL_REQUEST	BIT(31)
+
+enum {
+	SPRD_DISPC_IF_DBI = 0,
+	SPRD_DISPC_IF_DPI,
+	SPRD_DISPC_IF_EDPI,
+	SPRD_DISPC_IF_LIMIT
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
+struct sprd_dpu_layer {
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
+struct dpu_capability {
+	u32 max_layers;
+	const u32 *fmts_ptr;
+	u32 fmts_cnt;
+};
+
+struct dpu_context;
+
+struct dpu_core_ops {
+	u32 (*version)(struct dpu_context *ctx);
+	int (*init)(struct dpu_context *ctx);
+	void (*uninit)(struct dpu_context *ctx);
+	void (*run)(struct dpu_context *ctx);
+	void (*stop)(struct dpu_context *ctx);
+	void (*disable_vsync)(struct dpu_context *ctx);
+	void (*enable_vsync)(struct dpu_context *ctx);
+	u32 (*isr)(struct dpu_context *ctx);
+	void (*ifconfig)(struct dpu_context *ctx);
+	void (*flip)(struct dpu_context *ctx,
+		     struct sprd_dpu_layer layers[], u8 count);
+	int (*capability)(struct dpu_context *ctx,
+			struct dpu_capability *cap);
+	void (*bg_color)(struct dpu_context *ctx, u32 color);
+};
+
+struct dpu_context {
+	unsigned long base;
+	u32 base_offset[2];
+	const char *version;
+	int irq;
+	u8 if_type;
+	u8 id;
+	bool is_inited;
+	bool is_stopped;
+	struct videomode vm;
+	struct semaphore refresh_lock;
+	irqreturn_t (*dpu_isr)(int irq, void *data);
+	wait_queue_head_t te_wq;
+	bool te_check_en;
+	bool evt_te;
+};
+
+struct sprd_dpu {
+	struct device dev;
+	struct drm_crtc crtc;
+	struct dpu_context ctx;
+	struct dpu_core_ops *core;
+	struct drm_display_mode *mode;
+	struct sprd_dpu_layer *layers;
+	u8 pending_planes;
+};
+
+extern struct list_head dpu_core_head;
+
+static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)
+{
+	return crtc ? container_of(crtc, struct sprd_dpu, crtc) : NULL;
+}
+
+#define dpu_core_ops_register(entry) \
+	disp_ops_register(entry, &dpu_core_head)
+
+#define dpu_core_ops_attach(str) \
+	disp_ops_attach(str, &dpu_core_head)
+
+int sprd_dpu_run(struct sprd_dpu *dpu);
+int sprd_dpu_stop(struct sprd_dpu *dpu);
+
+#endif
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index 4aee25fa4..212324e 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -64,7 +64,7 @@ static const struct file_operations sprd_drm_fops = {
 };
 
 static struct drm_driver sprd_drm_drv = {
-	.driver_features	= DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &sprd_drm_fops,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 	.gem_free_object_unlocked	= sprd_gem_free_object,
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
index 137cb27..1c021a8 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.h
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -11,6 +11,8 @@
 
 struct sprd_drm {
 	struct drm_device *drm;
+	struct device *dpu_dev;
+
 };
 
 #endif /* _SPRD_DRM_H_ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
