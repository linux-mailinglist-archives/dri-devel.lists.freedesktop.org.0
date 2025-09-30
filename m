Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C53BAB789
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C0610E4CC;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Qe5plXuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD2510E276
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035553epoutp030dfa33f4c676dbb8cf011518ca7290a4~p8ziCwNRP3045830458epoutp03u
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035553epoutp030dfa33f4c676dbb8cf011518ca7290a4~p8ziCwNRP3045830458epoutp03u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204553;
 bh=pD71bFh5A20eGx+67CxEL8hTCmGXdoSx521MaAxw2CQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qe5plXuNV07ketMeAggjAzy/W6U7I0eYLzhNNlIsFL4Kjf8Qhh7ZbjWtsGZYIZjfi
 PIy7n0oHgDdniRzLfcxkcFdHvyQuYGO2DdYJWT+UtR4/7coCmWtSZckoM8IjLFUwD1
 gKhiVC59/GSvpNKRj+FLgYbofPI2g8GtkzTm2gqs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20250930035553epcas5p2321074b61e2ef9126cd7ada7993abe13~p8zhmncjh2437424374epcas5p2T;
 Tue, 30 Sep 2025 03:55:53 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPNl6qSbz6B9mD; Tue, 30 Sep
 2025 03:55:51 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9~p8zf9QgRe2781827818epcas5p4s;
 Tue, 30 Sep 2025 03:55:51 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035547epsmtip18704e0a45bb73bbc1d5fc52bc9dab4a6~p8zcn17e62931929319epsmtip1M;
 Tue, 30 Sep 2025 03:55:47 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 08/29] =?UTF-8?q?media:=20mfc:=20Add=20Exynos=E2=80=91MFC?=
 =?UTF-8?q?=20driver=20probe=20support?=
Date: Tue, 30 Sep 2025 09:33:27 +0530
Message-Id: <20250930040348.3702923-9-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
Exynos MFC driver that supports firmware version 13 and later.
Extend the top‑level Samsung platform Kconfig to disable the legacy
S5P‑MFC driver when its firmware version is > v12 and to select the
new Exynos‑MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not enabled.

Add exynos-mfc Kconfig and Makefile for probe functionality and creation
of decoder and encoder device files by registering the driver object
exynos_mfc.o and other relevant source files.

Provide header files mfc_core_ops.h and mfc_rm.h containing core
  operation prototypes, resource‑manager helpers,
  and core‑selection utilities.

Add a configurable option MFC_USE_COREDUMP to enable core‑dump
support for debugging MFC errors.

These changes bring support for newer Exynos‑based MFC hardware,
cleanly separate it from the legacy S5P‑MFC driver, and lay the
groundwork for future feature development and debugging.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 drivers/media/platform/samsung/Kconfig        |   7 +
 drivers/media/platform/samsung/Makefile       |   1 +
 .../media/platform/samsung/exynos-mfc/Kconfig |  34 +
 .../platform/samsung/exynos-mfc/Makefile      |  24 +
 .../media/platform/samsung/exynos-mfc/mfc.c   | 725 ++++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_core.c    | 530 +++++++++++++
 .../samsung/exynos-mfc/mfc_core_ops.c         | 289 +++++++
 .../samsung/exynos-mfc/mfc_core_ops.h         |  16 +
 .../samsung/exynos-mfc/mfc_core_sched_prio.c  | 100 +++
 .../platform/samsung/exynos-mfc/mfc_rm.c      | 142 ++++
 .../platform/samsung/exynos-mfc/mfc_rm.h      |  56 ++
 11 files changed, 1924 insertions(+)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/Kconfig
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/Makefile
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_rm.h

diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 0e34c5fc1dfc..13790b004f14 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -7,4 +7,11 @@ source "drivers/media/platform/samsung/exynos4-is/Kconfig"
 source "drivers/media/platform/samsung/s3c-camif/Kconfig"
 source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
 source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
+
+comment "Disable S5P-MFC (FW <= v12) to select Exynos-MFC (FW >= v13)"
+
 source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
+
+if !VIDEO_SAMSUNG_S5P_MFC && !(VIDEO_SAMSUNG_S5P_MFC = m)
+source "drivers/media/platform/samsung/exynos-mfc/Kconfig"
+endif
diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
index 21fea3330e4b..afda9713d966 100644
--- a/drivers/media/platform/samsung/Makefile
+++ b/drivers/media/platform/samsung/Makefile
@@ -5,3 +5,4 @@ obj-y += s3c-camif/
 obj-y += s5p-g2d/
 obj-y += s5p-jpeg/
 obj-y += s5p-mfc/
+obj-y += exynos-mfc/
diff --git a/drivers/media/platform/samsung/exynos-mfc/Kconfig b/drivers/media/platform/samsung/exynos-mfc/Kconfig
new file mode 100644
index 000000000000..8b0212100994
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/Kconfig
@@ -0,0 +1,34 @@
+config VIDEO_EXYNOS_MFC
+	tristate "Samsung Exynos MFC Driver (FW v13+)"
+	default n
+	depends on !VIDEO_SAMSUNG_S5P_MFC
+	select DMABUF_HEAPS
+	select DMABUF_HEAPS_SYSTEM
+	select DMABUF_HEAPS_CMA if !EXYNOS_IOMMU
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_DMA_SG
+	help
+		Enables the Exynos Multi‑Format Codec (MFC) driver for the V4L2
+		subsystem, providing hardware‑accelerated video decoding and
+		encoding on Samsung Exynos SoCs that ship with firmware version 13
+		or newer.  The driver offloads video processing from the CPU,
+		improving performance and reducing power consumption for a wide
+		range of codecs and picture formats.  It integrates with the
+		DMABUF‑HEAPS and videobuf2 frameworks for efficient buffer management
+		and should be selected only when the legacy VIDEO_SAMSUNG_S5P_MFC
+		driver is not present.  Disable this option on platforms lacking
+		the required firmware version or when you prefer the older driver.
+
+config MFC_USE_COREDUMP
+	bool "MFC COREDUMP support"
+	default n
+	depends on VIDEO_EXYNOS_MFC
+	help
+		Enables generation of a core dump when the Exynos MFC driver
+		encounters a fatal error or hardware fault.  The dump captures
+		internal driver state, register contents, and relevant buffer
+		information, providing valuable context for post‑mortem analysis.
+		This aids developers and integrators in diagnosing codec crashes
+		and improving driver stability without requiring a full system
+		reboot.  Use this option only when debugging is needed, as it
+		may increase memory usage and expose sensitive data.
diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
new file mode 100644
index 000000000000..bee95b16ac7c
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -0,0 +1,24 @@
+obj-$(CONFIG_VIDEO_EXYNOS_MFC) := exynos_mfc.o
+#Header include
+ccflags-y += -I$(srctree)/$(src)
+
+#Dev interface layer
+exynos_mfc-y += mfc.o
+#Dev control layer
+exynos_mfc-y += mfc_rm.o mfc_debugfs.o
+#Core interface layer
+exynos_mfc-y += mfc_core.o mfc_core_ops.o mfc_core_isr.o
+#Core control layer
+exynos_mfc-y += mfc_core_hwlock.o mfc_core_intlock.o mfc_core_run.o
+exynos_mfc-y += mfc_core_pm.o
+exynos_mfc-y += mfc_core_sync.o mfc_core_sched_prio.o
+#Core HW access layer
+exynos_mfc-y += mfc_core_cmd.o
+exynos_mfc-y += mfc_core_hw_reg_api.o mfc_core_reg_api.o
+#Plugin interface layer
+#Plugin control layer
+#Plugin HW access layer
+#Common base layer
+exynos_mfc-y += base/mfc_buf.o base/mfc_mem.o
+#Tracing
+# exynos_mfc-y += trace/mfc_trace_points.o
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc.c b/drivers/media/platform/samsung/exynos-mfc/mfc.c
new file mode 100644
index 000000000000..b5b66083cc8b
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc.c
@@ -0,0 +1,725 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/poll.h>
+#include <linux/iommu.h>
+
+#include "mfc_rm.h"
+#include "mfc_debugfs.h"
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_run.h"
+
+#include "mfc_core_hw_reg_api.h"
+
+#include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+
+#define MFC_NAME			"exynos-mfc"
+#define MFC_DEC_NAME			"exynos-mfc-dec"
+#define MFC_ENC_NAME			"exynos-mfc-enc"
+
+struct _mfc_trace g_mfc_trace[MFC_TRACE_COUNT_MAX];
+struct _mfc_trace g_mfc_trace_rm[MFC_TRACE_COUNT_MAX];
+struct _mfc_trace g_mfc_trace_longterm[MFC_TRACE_COUNT_MAX];
+
+/* Open an MFC node */
+static int mfc_open(struct file *file)
+{
+	struct mfc_ctx *ctx = NULL;
+	struct mfc_dev *dev = video_drvdata(file);
+	int i, ret = 0;
+	enum mfc_node_type node;
+	struct video_device *vdev = NULL;
+
+	if (!dev) {
+		mfc_pr_err("no mfc device to run\n");
+		goto err_no_device;
+	}
+
+	mfc_dev_debug(2, "mfc driver open called\n");
+
+	if (mutex_lock_interruptible(&dev->mfc_mutex))
+		return -ERESTARTSYS;
+
+	node = mfc_get_node_type(file);
+	if (node == MFCNODE_INVALID) {
+		mfc_dev_err("cannot specify node type\n");
+		ret = -ENOENT;
+		goto err_node_type;
+	}
+
+	dev->num_inst++;	/* It is guarded by mfc_mutex in vfd */
+
+	/* Allocate memory for context */
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		ret = -ENOMEM;
+		goto err_ctx_alloc;
+	}
+
+	switch (node) {
+	case MFCNODE_DECODER:
+		vdev = dev->vfd_dec;
+		break;
+	case MFCNODE_ENCODER:
+		vdev = dev->vfd_enc;
+		break;
+	default:
+		mfc_dev_err("Invalid node(%d)\n", node);
+		break;
+	}
+
+	if (!vdev)
+		goto err_vdev;
+
+	v4l2_fh_init(&ctx->fh, vdev);
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh, file);
+
+	ctx->dev = dev;
+
+	/* Get context number */
+	ctx->num = 0;
+	while (dev->ctx[ctx->num]) {
+		ctx->num++;
+		if (ctx->num >= MFC_NUM_CONTEXTS) {
+			mfc_ctx_err("Too many open contexts\n");
+			mfc_ctx_err("Print information to check if there was an error or not\n");
+			ret = -EBUSY;
+			goto err_ctx_num;
+		}
+	}
+
+	spin_lock_init(&ctx->corelock.lock);
+	mutex_init(&ctx->intlock.core_mutex);
+	mutex_init(&ctx->op_mode_mutex);
+	init_waitqueue_head(&ctx->corelock.wq);
+
+	mfc_ctx_change_idle_mode(ctx, MFC_IDLE_MODE_NONE);
+
+	if (mfc_is_decoder_node(node)) {
+		ctx->type = MFCINST_DECODER;
+		dev->num_dec_inst++;
+	} else {
+		ctx->type = MFCINST_ENCODER;
+		dev->num_enc_inst++;
+	}
+
+	if (dev->num_inst == 1) {
+		/* all of the ctx list */
+		INIT_LIST_HEAD(&dev->ctx_list);
+		spin_lock_init(&dev->ctx_list_lock);
+		/* idle mode */
+		spin_lock_init(&dev->idle_bits_lock);
+	}
+
+	mfc_ctx_info
+		("NORMAL %s instance is opened [%d]\n",
+		ctx->type == MFCINST_DECODER ? "Decoder" : "Encoder",
+		dev->num_inst);
+
+	/* Mark context as idle */
+	dev->ctx[ctx->num] = ctx;
+	for (i = 0; i < MFC_NUM_CORE; i++)
+		ctx->op_core_num[i] = MFC_CORE_INVALID;
+
+	ret = mfc_rm_instance_init(dev, ctx);
+	if (ret) {
+		mfc_ctx_err("rm_instance_init failed\n");
+		goto err_inst_init;
+	}
+
+	mfc_ctx_info
+		("MFC open completed [%d] version = %d\n",
+		dev->num_inst, MFC_DRIVER_INFO);
+	MFC_TRACE_CTX_LT
+		("[INFO] %s opened (ctx:%d, total:%d)\n",
+		mfc_is_decoder_node(node) ? "DEC" : "ENC", ctx->num, dev->num_inst);
+
+	mutex_unlock(&dev->mfc_mutex);
+	return ret;
+
+	/* Deinit when failure occurred */
+err_inst_init:
+	if (mfc_is_decoder_node(node))
+		dev->num_dec_inst--;
+	else
+		dev->num_enc_inst--;
+	dev->ctx[ctx->num] = 0;
+
+err_ctx_num:
+	v4l2_fh_del(&ctx->fh, file);
+	v4l2_fh_exit(&ctx->fh);
+
+err_vdev:
+	kfree(ctx);
+
+err_ctx_alloc:
+	dev->num_inst--;
+
+err_node_type:
+	mfc_dev_err
+		("MFC driver open is failed [%d]\n",
+		dev->num_inst);
+	mutex_unlock(&dev->mfc_mutex);
+
+err_no_device:
+
+	return ret;
+}
+
+/* Release MFC context */
+static int mfc_release(struct file *file)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	int ret = 0;
+	unsigned long flags;
+
+	mutex_lock(&dev->mfc_mutex);
+
+	mfc_ctx_info
+		("%s instance release is called [%d]\n",
+		ctx->type == MFCINST_DECODER ? "Decoder" : "Encoder",
+		dev->num_inst);
+
+	MFC_TRACE_CTX_LT("[INFO] release is called (ctx:%d, total:%d)\n", ctx->num, dev->num_inst);
+
+	/* Free resources */
+	v4l2_fh_del(&ctx->fh, file);
+	v4l2_fh_exit(&ctx->fh);
+
+	/*
+	 * mfc_release() can be called without a streamoff
+	 * when the application is forcibly terminated.
+	 * At that time, stop_streaming() is called by vb2_queue_release.
+	 * So, we need to performed stop_streaming
+	 * before instance de-init(CLOSE_INSTANCE).
+	 */
+
+	ret = mfc_rm_instance_deinit(dev, ctx);
+	if (ret) {
+		mfc_dev_err("failed to rm_instance_deinit\n");
+		goto end_release;
+	}
+
+	dev->num_inst--;
+
+	if (ctx->type == MFCINST_DECODER)
+		dev->num_dec_inst--;
+	else if (ctx->type == MFCINST_ENCODER)
+		dev->num_enc_inst--;
+
+	MFC_TRACE_CTX_LT("[INFO] Release finished (ctx:%d, total:%d)\n", ctx->num, dev->num_inst);
+
+	spin_lock_irqsave(&dev->ctx_list_lock, flags);
+	dev->ctx[ctx->num] = NULL;
+	kfree(ctx);
+	spin_unlock_irqrestore(&dev->ctx_list_lock, flags);
+
+	mfc_dev_info("mfc driver release finished [%d]\n", dev->num_inst);
+
+end_release:
+	mutex_unlock(&dev->mfc_mutex);
+	return ret;
+}
+
+/* v4l2 ops */
+static const struct v4l2_file_operations mfc_fops = {
+	.owner = THIS_MODULE,
+	.open = mfc_open,
+	.release = mfc_release,
+	.poll = NULL,
+	.unlocked_ioctl = video_ioctl2,
+};
+
+static void __mfc_parse_dt_resource(struct mfc_dev *dev, struct device_node *np)
+{
+	struct device_node *np_resource;
+	struct device_node *np_tmp;
+	int idx = 0;
+	struct mfc_resource *resource;
+	unsigned int codec_mode;
+
+	/* Initialization */
+	for (idx = 0; idx < MFC_MAX_CODEC_TYPE; idx++) {
+		resource = &dev->pdata->mfc_resource[idx];
+		resource->op_core_type = MFC_OP_CORE_NOT_FIXED;
+	}
+
+	np_resource = of_get_child_by_name(np, "mfc_resource");
+	if (!np_resource) {
+		dev_err(dev->device, "there is no mfc_resource\n");
+		return;
+	}
+
+	/* Parse resource information */
+	for_each_child_of_node(np_resource, np_tmp) {
+		idx = 0;
+		of_property_read_u32_index(np_tmp, "info", idx++, &codec_mode);
+		resource = &dev->pdata->mfc_resource[codec_mode];
+		of_property_read_u32_index(np_tmp, "info", idx++, (u32 *)&resource->op_core_type);
+	}
+}
+
+static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
+{
+	struct mfc_platdata *pdata = mfc->pdata;
+
+	if (!np) {
+		dev_err(mfc->device, "there is no device node\n");
+		return -EINVAL;
+	}
+
+	/* MFC FW memory size */
+	of_property_read_u32(np, "fw_mem_size", &pdata->fw_mem_size);
+
+	/* MFC DVA reservation start address and DMA bit mask */
+	of_property_read_u32(np, "reserved_start", &pdata->reserved_start);
+	of_property_read_u32(np, "dma_bit_mask", &pdata->dma_bit_mask);
+
+	/* MFC version */
+	of_property_read_u32(np, "ip_ver", &pdata->ip_ver);
+
+	/* MFC firmware name */
+	of_property_read_string(np, "fw_name", &pdata->fw_name);
+
+	/* Debug mode */
+	of_property_read_u32(np, "debug_mode", &pdata->debug_mode);
+
+	/* Resource of standard */
+	__mfc_parse_dt_resource(mfc, np);
+
+	of_property_read_u32_array
+		(np, "mem_clear",
+		&pdata->mem_clear.support, 2);
+	of_property_read_u32_array
+		(np, "wait_fw_status",
+		&pdata->wait_fw_status.support, 2);
+
+	/* Scheduler */
+	of_property_read_u32(np, "scheduler", &pdata->scheduler);
+	of_property_read_u32(np, "pbs_num_prio", &pdata->pbs_num_prio);
+
+	return 0;
+}
+
+static void *__mfc_get_drv_data(struct platform_device *pdev);
+
+static struct video_device *__mfc_video_device_register
+	(struct mfc_dev *dev, char *name, int node_num)
+{
+	struct video_device *vfd;
+	int ret = 0;
+
+	vfd = video_device_alloc();
+	if (!vfd) {
+		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
+		return NULL;
+	}
+	strscpy_pad(vfd->name, name, sizeof(vfd->name));
+	vfd->fops = &mfc_fops;
+	vfd->minor = -1;
+	vfd->release = video_device_release;
+
+	vfd->lock = &dev->mfc_mutex;
+	vfd->v4l2_dev = &dev->v4l2_dev;
+	vfd->vfl_dir = VFL_DIR_M2M;
+	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE
+			| V4L2_CAP_VIDEO_OUTPUT
+			| V4L2_CAP_VIDEO_CAPTURE_MPLANE
+			| V4L2_CAP_VIDEO_OUTPUT_MPLANE
+			| V4L2_CAP_STREAMING;
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, node_num);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "Failed to register video device /dev/video%d\n",
+			 node_num);
+		video_device_release(vfd);
+		return NULL;
+	}
+	v4l2_info
+		(&dev->v4l2_dev, "video device registered as /dev/video%d\n",
+		 vfd->num);
+	video_set_drvdata(vfd, dev);
+
+	return vfd;
+}
+
+/* MFC probe function */
+static int mfc_probe(struct platform_device *pdev)
+{
+	struct device *device = &pdev->dev;
+	struct device_node *np = device->of_node;
+	struct mfc_dev *dev;
+	int ret = -ENOENT;
+
+	dev_info(&pdev->dev, "%s is called\n", __func__);
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(struct mfc_dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	/* empty device for CPU cache flush with dma_sync_* API */
+	dev->cache_op_dev = devm_kzalloc(&pdev->dev, sizeof(struct device), GFP_KERNEL);
+	device_initialize(dev->cache_op_dev);
+	dma_coerce_mask_and_coherent(dev->cache_op_dev, DMA_BIT_MASK(36));
+
+	dev->device = &pdev->dev;
+	dev->variant = __mfc_get_drv_data(pdev);
+	platform_set_drvdata(pdev, dev);
+
+	dev->pdata = devm_kzalloc(&pdev->dev, sizeof(struct mfc_platdata), GFP_KERNEL);
+	if (!dev->pdata) {
+		ret = -ENOMEM;
+		goto err_res_mem;
+	}
+
+	ret = __mfc_parse_dt(dev->device->of_node, dev);
+	if (ret)
+		goto err_res_mem;
+
+	mfc_init_debugfs(dev);
+
+	atomic_set(&dev->trace_ref, 0);
+	atomic_set(&dev->trace_ref_longterm, 0);
+	dev->mfc_trace = g_mfc_trace;
+	dev->mfc_trace_rm = g_mfc_trace_rm;
+	dev->mfc_trace_longterm = g_mfc_trace_longterm;
+
+	if (dev->pdata->dma_bit_mask < MFC_MIN_BITMASK)
+		dev->pdata->dma_bit_mask = MFC_MIN_BITMASK;
+	dma_set_mask(&pdev->dev, DMA_BIT_MASK(dev->pdata->dma_bit_mask));
+
+	mutex_init(&dev->mfc_mutex);
+
+	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret)
+		goto err_v4l2_dev;
+
+	/* decoder */
+	dev->vfd_dec = __mfc_video_device_register
+			(dev, MFC_DEC_NAME,
+			EXYNOS_VIDEONODE_MFC_DEC);
+	if (!dev->vfd_dec) {
+		ret = -ENOMEM;
+		goto alloc_vdev_dec;
+	}
+
+	/* encoder */
+	dev->vfd_enc = __mfc_video_device_register
+			(dev, MFC_ENC_NAME,
+			EXYNOS_VIDEONODE_MFC_ENC);
+	if (!dev->vfd_enc) {
+		ret = -ENOMEM;
+		goto alloc_vdev_enc;
+	}
+	/* end of node setting*/
+
+	/* for DVA reservation */
+	if (dev->pdata->reserved_start) {
+		dev->domain = iommu_get_domain_for_dev(dev->device);
+		ret = mfc_iova_pool_init(dev);
+		if (ret) {
+			mfc_dev_err("Failed to reserve memory (%d)\n", ret);
+			goto err_iova_reserve;
+		}
+	}
+
+	ret = mfc_configure_dma_memory(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to configure DMA memory\n");
+		goto err_iova_reserve;
+	}
+	__platform_driver_register(&mfc_core_driver, THIS_MODULE);
+	of_platform_populate(np, NULL, NULL, device);
+
+	dev_info(&pdev->dev, "%s is completed\n", __func__);
+
+	return 0;
+
+/* Deinit MFC if probe had failed */
+err_iova_reserve:
+	video_unregister_device(dev->vfd_enc);
+alloc_vdev_enc:
+	video_unregister_device(dev->vfd_dec);
+alloc_vdev_dec:
+	v4l2_device_unregister(&dev->v4l2_dev);
+err_v4l2_dev:
+	mutex_destroy(&dev->mfc_mutex);
+err_res_mem:
+	return ret;
+}
+
+/* Remove the driver */
+static void mfc_remove(struct platform_device *pdev)
+{
+	struct mfc_dev *dev = platform_get_drvdata(pdev);
+
+	mfc_dev_info("++MFC remove\n");
+
+	platform_driver_unregister(&mfc_core_driver);
+	mfc_unconfigure_dma_memory(dev);
+	of_reserved_mem_device_release(dev->device);
+
+	mfc_deinit_debugfs(dev);
+	video_unregister_device(dev->vfd_enc);
+	video_unregister_device(dev->vfd_dec);
+	v4l2_device_unregister(&dev->v4l2_dev);
+
+	mfc_dev_info("--MFC remove\n");
+}
+
+static void mfc_shutdown(struct platform_device *pdev)
+{
+	struct platform_driver *pcoredrv = &mfc_core_driver;
+	struct mfc_dev *dev = platform_get_drvdata(pdev);
+	struct mfc_core *core;
+	int i;
+
+	for (i = 0; i < dev->num_core; i++) {
+		core = dev->core[i];
+		if (!core) {
+			mfc_dev_debug(2, "There is no core[%d]\n", i);
+			continue;
+		}
+
+		if (!core->shutdown) {
+			mfc_core_info("%s core shutdown was not performed\n", core->name);
+			pcoredrv->shutdown(to_platform_device(core->device));
+		}
+	}
+
+	mfc_dev_info("MFC shutdown is completed\n");
+}
+
+#if IS_ENABLED(CONFIG_PM_SLEEP)
+static int mfc_suspend(struct device *device)
+{
+	struct mfc_dev *dev = platform_get_drvdata(to_platform_device(device));
+	struct mfc_core *core[MFC_NUM_CORE];
+	int i, ret;
+
+	if (!dev) {
+		dev_err(device, "no mfc device to run\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < dev->num_core; i++) {
+		core[i] = dev->core[i];
+		if (!core[i]) {
+			dev_err(device, "no mfc core%d device to run\n", i);
+			return -EINVAL;
+		}
+
+		if (core[i]->state == MFCCORE_ERROR) {
+			dev_info(device, "[MSR] Couldn't sleep. It's Error state\n");
+			return 0;
+		}
+	}
+
+	/*
+	 * Multi core mode instance can send sleep command
+	 * when there are no H/W operation both two core.
+	 */
+	for (i = 0; i < dev->num_core; i++) {
+		core[i] = dev->core[i];
+		if (!core[i]) {
+			dev_err(device, "no mfc core%d device to run\n", i);
+			return -EINVAL;
+		}
+
+		if (core[i]->num_inst == 0) {
+			core[i] = NULL;
+			continue;
+		}
+
+		mfc_dev_info("MFC%d will suspend\n", i);
+
+		ret = mfc_core_get_hwlock_dev(core[i]);
+		if (ret < 0) {
+			mfc_dev_err("Failed to get hwlock for MFC%d\n", i);
+			mfc_dev_err
+				("dev:0x%lx, bits:0x%lx, owned:%d, wl:%d, trans:%d\n",
+				core[i]->hwlock.dev, core[i]->hwlock.bits,
+				core[i]->hwlock.owned_by_irq,
+				core[i]->hwlock.wl_count,
+				core[i]->hwlock.transfer_owner);
+			return -EBUSY;
+		}
+
+		if (!mfc_core_get_pwr_ref_cnt(core[i])) {
+			mfc_dev_info("MFC%d power has not been turned on yet\n", i);
+			mfc_core_release_hwlock_dev(core[i]);
+			core[i] = NULL;
+			continue;
+		}
+	}
+
+	for (i = 0; i < dev->num_core; i++) {
+		if (core[i]) {
+			ret = mfc_core_run_sleep(core[i]);
+			if (ret) {
+				mfc_dev_err("Failed core_run_sleep for MFC%d\n", i);
+				return -EFAULT;
+			}
+
+			mfc_core_release_hwlock_dev(core[i]);
+
+			mfc_dev_info("MFC%d suspend is completed\n", i);
+		}
+	}
+
+	return 0;
+}
+
+static int mfc_resume(struct device *device)
+{
+	struct mfc_dev *dev = platform_get_drvdata(to_platform_device(device));
+	struct mfc_core *core;
+	int i, ret;
+
+	if (!dev) {
+		dev_err(device, "no mfc device to run\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < dev->num_core; i++) {
+		core = dev->core[i];
+		if (!core) {
+			dev_err(device, "no mfc core%d device to run\n", i);
+			return -EINVAL;
+		}
+
+		if (core->state == MFCCORE_ERROR) {
+			mfc_core_info("[MSR] Couldn't wakeup. It's Error state\n");
+			return 0;
+		}
+	}
+
+	for (i = 0; i < dev->num_core; i++) {
+		core = dev->core[i];
+		if (!core) {
+			dev_err(device, "no mfc core%d device to run\n", i);
+			return -EINVAL;
+		}
+
+		if (core->num_inst == 0)
+			continue;
+
+		mfc_dev_info("MFC%d will resume\n", i);
+
+		ret = mfc_core_get_hwlock_dev(core);
+		if (ret < 0) {
+			mfc_dev_err("Failed to get hwlock for MFC%d\n", i);
+			mfc_dev_err
+				("dev:0x%lx, bits:0x%lx, owned:%d, wl:%d, trans:%d\n",
+				core->hwlock.dev,
+				core->hwlock.bits,
+				core->hwlock.owned_by_irq,
+				core->hwlock.wl_count,
+				core->hwlock.transfer_owner);
+			return -EBUSY;
+		}
+
+		ret = mfc_core_run_wakeup(core);
+		if (ret) {
+			mfc_dev_err("Failed core_run_wakeup for MFC%d\n", i);
+			return -EFAULT;
+		}
+
+		mfc_core_release_hwlock_dev(core);
+
+		mfc_dev_info("MFC%d resume is completed\n", i);
+	}
+
+	return 0;
+}
+#endif
+
+/* Power management */
+static const struct dev_pm_ops mfc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mfc_suspend, mfc_resume)
+};
+
+struct mfc_ctx_buf_size mfc_ctx_buf_size = {
+	.dev_ctx	= PAGE_ALIGN(0x7800),	/*  30KB */
+	.dbg_info_buf	= PAGE_ALIGN(0x1000),	/* 4KB for DEBUG INFO */
+};
+
+struct mfc_buf_size mfc_buf_size = {
+	.firmware_code	= PAGE_ALIGN(SZ_1M),	/* 1MB */
+	.ctx_buf	= &mfc_ctx_buf_size,
+};
+
+static struct mfc_variant mfc_drvdata = {
+	.buf_size = &mfc_buf_size,
+	.num_entities = 2,
+};
+
+static const struct of_device_id exynos_mfc_match[] = {
+	{
+		.compatible = "samsung,exynos-mfc",
+		.data = &mfc_drvdata,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_mfc_match);
+
+static void *__mfc_get_drv_data(struct platform_device *pdev)
+{
+	struct mfc_variant *driver_data = NULL;
+
+	if (pdev->dev.of_node) {
+		const struct of_device_id *match;
+
+		match = of_match_node
+			(of_match_ptr(exynos_mfc_match),
+			pdev->dev.of_node);
+		if (match)
+			driver_data = (struct mfc_variant *)match->data;
+	} else {
+		driver_data = (struct mfc_variant *)
+				platform_get_device_id(pdev)->driver_data;
+	}
+	return driver_data;
+}
+
+static struct platform_driver mfc_driver = {
+	.probe		= mfc_probe,
+	.remove		= mfc_remove,
+	.shutdown	= mfc_shutdown,
+	.driver	= {
+		.name	= MFC_NAME,
+		.owner	= THIS_MODULE,
+		.pm	= &mfc_pm_ops,
+		.of_match_table = exynos_mfc_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(mfc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kamil Debski <k.debski@samsung.com>");
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
new file mode 100644
index 000000000000..4f5cf459c36f
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
@@ -0,0 +1,530 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/proc_fs.h>
+#include <linux/of.h>
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/poll.h>
+#include <linux/vmalloc.h>
+#include <linux/version.h>
+#include <linux/iommu.h>
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+#include <linux/samsung/samsung-iommu.h>
+#endif
+
+#include "mfc_core_ops.h"
+#include "mfc_core_isr.h"
+#include "mfc_debugfs.h"
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_run.h"
+
+#include "mfc_core_pm.h"
+
+#include "mfc_core_hw_reg_api.h"
+
+#include "base/mfc_sched.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+
+#define MFC_CORE_NAME			"mfc-core"
+
+struct _mfc_trace_logging g_mfc_core_trace_logging[MFC_TRACE_LOG_COUNT_MAX];
+
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+static int mfc_core_sysmmu_fault_handler(struct iommu_domain *domain,
+					 struct device *dev, unsigned long iova,
+					 int data, void *param)
+{
+	struct mfc_core *core = (struct mfc_core *)param;
+	struct mfc_core_platdata *pdata = core->core_pdata;
+	unsigned int fault_status, fault_info1, fault_info2 = 0;
+
+	if (mfc_core_get_pwr_ref_cnt(core) == 0) {
+		mfc_core_info("This is not a MFC issue(not executed)\n");
+		return 0;
+	}
+
+	/* MMU Fault Status: If no page fault has occurred, it has a value of 0 */
+	if (pdata->fault_status)
+		fault_status = pdata->fault_status + (data * 0x1000);
+	else
+		fault_status = MFC_MMU_INTERRUPT_STATUS;
+	/* MMU_FAULT_INFO1_VM[31:0]: It has AXID value. */
+	if (pdata->fault_info1)
+		fault_info1 = pdata->fault_info1 + (data * 0x1000);
+	else
+		fault_info1 = MFC_MMU_FAULT_TRANS_INFO;
+	/* MMU_FAULT_INFO2_VM[31:0]: It has PMMU ID[31:24], MASTER ID[11:7], STREAM ID[6:0] */
+	if (pdata->fault_info2)
+		fault_info2 = pdata->fault_info2 + (data * 0x1000);
+
+	if (core->has_2sysmmu) {
+		if ((!MFC_MMU0_READL(fault_status)) &&
+		    (!MFC_MMU1_READL(fault_status))) {
+			mfc_core_info
+			    ("This is not a MFC issue(fault status is zero)\n");
+			return 0;
+		}
+	} else {
+		if (MFC_MMU0_READL(fault_status) == 0) {
+			mfc_core_info
+			    ("This is not a MFC issue(fault status is zero)\n");
+			return 0;
+		}
+	}
+
+	/* If sysmmu is used with other IPs, it should be checked whether it's an MFC fault */
+	if (pdata->share_sysmmu) {
+		if (mfc_get_mmu0_value(fault_info1, 0, pdata->axid_mask) !=
+		    pdata->mfc_axid) {
+			mfc_core_err("This is not a MFC page fault\n");
+			return 0;
+		}
+	}
+
+	if (MFC_MMU0_READL(fault_status)) {
+		/*
+		 * Since it has become complicated to distinguish
+		 * read or write of page fault in IP driver,
+		 * the cause of page fault in logging data is unified into
+		 * the page fault.
+		 */
+		core->logging_data->cause |= BIT(MFC_CAUSE_0PAGE_FAULT);
+		core->logging_data->fault_status = MFC_MMU0_READL(fault_status);
+		core->logging_data->fault_trans_info =
+		    MFC_MMU0_READL(fault_info1);
+	}
+
+	if (core->has_2sysmmu) {
+		if (MFC_MMU1_READL(fault_status)) {
+			core->logging_data->cause |=
+			    BIT(MFC_CAUSE_1PAGE_FAULT);
+			core->logging_data->fault_status =
+			    MFC_MMU1_READL(fault_status);
+			core->logging_data->fault_trans_info =
+			    MFC_MMU1_READL(fault_info1);
+		}
+	}
+	core->logging_data->fault_addr = iova;
+
+	mfc_core_err
+	    ("MFC-%d SysMMU PAGE FAULT at %#lx, AxID: %#x, fault_status: %#x\n",
+	     core->id, iova, core->logging_data->fault_trans_info,
+	     core->logging_data->fault_status);
+	MFC_TRACE_CORE("MFC-%d SysMMU PAGE FAULT at %#lx (AxID: %#x)\n",
+		       core->id, iova, core->logging_data->fault_trans_info);
+
+	/*
+	 * if return 0, sysmmu occurs kernel panic for debugging
+	 * if -EAGAIN, sysmmu doesn't occur kernel panic (but need async-fault in dt).
+	 */
+	return 0;
+}
+#endif
+
+static int __mfc_core_parse_dt(struct device_node *np, struct mfc_core *core)
+{
+	struct mfc_core_platdata *pdata = core->core_pdata;
+
+	if (!np) {
+		mfc_pr_err("there is no device node\n");
+		return -EINVAL;
+	}
+
+	/* MFC version */
+	of_property_read_u32(np, "ip_ver", &pdata->ip_ver);
+
+	/* Sysmmu check */
+	of_property_read_u32(np, "share_sysmmu", &pdata->share_sysmmu);
+	of_property_read_u32(np, "fault_status", &pdata->fault_status);
+	of_property_read_u32(np, "fault_info1", &pdata->fault_info1);
+	of_property_read_u32(np, "axid_mask", &pdata->axid_mask);
+	of_property_read_u32(np, "mfc_axid", &pdata->mfc_axid);
+	of_property_read_u32(np, "tsmux_axid", &pdata->tsmux_axid);
+	of_property_read_u32(np, "fault_info2", &pdata->fault_info2);
+	of_property_read_u32(np, "pmmuid_shift", &pdata->pmmuid_shift);
+	of_property_read_u32(np, "pmmuid_mask", &pdata->pmmuid_mask);
+	of_property_read_u32(np, "tsmux_pmmuid", &pdata->tsmux_pmmuid);
+	of_property_read_u32(np, "masterid_shift", &pdata->masterid_shift);
+	of_property_read_u32(np, "masterid_mask", &pdata->masterid_mask);
+	of_property_read_u32(np, "tsmux_masterid", &pdata->tsmux_masterid);
+
+	return 0;
+}
+
+static int __mfc_core_register_resource(struct platform_device *pdev,
+					struct mfc_core *core)
+{
+	struct device_node *np = core->device->of_node;
+	struct device_node *iommu;
+	struct device_node *pmu;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get memory region resource\n");
+		return -ENOENT;
+	}
+	core->mfc_mem =
+	    request_mem_region(res->start, resource_size(res), pdev->name);
+	if (!core->mfc_mem) {
+		dev_err(&pdev->dev, "failed to get memory region\n");
+		return -ENOENT;
+	}
+	core->regs_base =
+	    ioremap(core->mfc_mem->start, resource_size(core->mfc_mem));
+	if (!core->regs_base) {
+		dev_err(&pdev->dev, "failed to ioremap address region\n");
+		goto err_ioremap;
+	}
+
+	iommu = of_get_child_by_name(np, "iommu");
+	if (!iommu) {
+		dev_err(&pdev->dev, "failed to get iommu node\n");
+		goto err_ioremap_mmu0;
+	}
+
+	core->sysmmu0_base = of_iomap(iommu, 0);
+	if (!core->sysmmu0_base) {
+		dev_err(&pdev->dev,
+			"failed to ioremap sysmmu0 address region\n");
+		goto err_ioremap_mmu0;
+	}
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	// sysmmu bypass settings for sysmmu0_base
+	writel(0x00, core->sysmmu0_base + 0x00);
+#endif
+
+	core->sysmmu1_base = of_iomap(iommu, 1);
+	if (!core->sysmmu1_base) {
+		dev_dbg(&pdev->dev, "there is only one MFC sysmmu\n");
+	} else {
+		core->has_2sysmmu = 1;
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+		// sysmmu bypass settings for sysmmu1_base
+		writel(0x00, core->sysmmu1_base + 0x00);
+#endif
+	}
+
+	pmu = of_get_child_by_name(np, "pmu");
+	if (pmu) {
+		core->pmu_base = of_iomap(pmu, 0);
+		if (!core->pmu_base) {
+			core->has_pmu = 0;
+			dev_err(&pdev->dev,
+				"failed to iomap pmu address region\n");
+			goto err_ioremap_pmu;
+		}
+		core->has_pmu = 1;
+	}
+
+	core->irq = platform_get_irq(pdev, 0);
+	if (core->irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq\n");
+		goto err_res_irq;
+	}
+
+	ret =
+	    devm_request_threaded_irq(&pdev->dev, core->irq,
+				      mfc_core_top_half_irq, mfc_core_irq,
+				      IRQF_ONESHOT, pdev->name, core);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to install irq (%d)\n", ret);
+		goto err_res_irq;
+	}
+
+	return 0;
+
+ err_res_irq:
+	if (core->has_pmu)
+		iounmap(core->pmu_base);
+ err_ioremap_pmu:
+	if (core->has_2sysmmu) {
+		if (core->sysmmu1_base)
+			iounmap(core->sysmmu1_base);
+	}
+	if (core->sysmmu0_base)
+		iounmap(core->sysmmu0_base);
+ err_ioremap_mmu0:
+	iounmap(core->regs_base);
+ err_ioremap:
+	release_mem_region(core->mfc_mem->start, resource_size(core->mfc_mem));
+	return -ENOENT;
+}
+
+/* MFC probe function */
+static int mfc_core_probe(struct platform_device *pdev)
+{
+	struct mfc_core *core;
+	struct mfc_dev *dev;
+	int ret = -ENOENT;
+
+	dev_info(&pdev->dev, "%s is called\n", __func__);
+
+	core = devm_kzalloc(&pdev->dev, sizeof(struct mfc_core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	core->device = &pdev->dev;
+
+	/* set core id */
+	of_property_read_u32(core->device->of_node, "id", &core->id);
+	snprintf(core->name, sizeof(core->name), "MFC%d", core->id);
+
+	/* register core to dev */
+	dev = dev_get_drvdata(pdev->dev.parent);
+	dev->core[core->id] = core;
+	dev->num_core++;
+	dev->num_subsystem++;
+	core->dev = dev;
+	core->core_ops = mfc_get_core_ops();
+
+	core->core_pdata = devm_kzalloc(&pdev->dev,
+					sizeof(struct mfc_core_platdata),
+					GFP_KERNEL);
+	if (!core->core_pdata) {
+		ret = -ENOMEM;
+		goto err_pm;
+	}
+
+	ret = __mfc_core_parse_dt(core->device->of_node, core);
+	if (ret)
+		goto err_pm;
+
+	atomic_set(&core->trace_ref_log, 0);
+	core->mfc_trace_logging = g_mfc_core_trace_logging;
+
+	mfc_core_pm_init(core);
+	ret = __mfc_core_register_resource(pdev, core);
+	if (ret)
+		goto err_res_mem;
+	init_waitqueue_head(&core->cmd_wq);
+	mfc_core_init_listable_wq_dev(core);
+
+	platform_set_drvdata(pdev, core);
+
+	mfc_core_init_hwlock(core);
+
+	mfc_sched_init_core(core);
+
+	spin_lock_init(&core->batch_lock);
+
+#if IS_ENABLED(CONFIG_SAMSUNG_IOMMU)
+	ret = samsung_iommu_register_fault_handler(core->device,
+						   mfc_core_sysmmu_fault_handler,
+						   core);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"failed to register sysmmu fault handler %d\n", ret);
+		ret = -EPROBE_DEFER;
+		goto err_sysmmu_fault_handler;
+	}
+#endif
+	/* set async suspend/resume */
+	device_enable_async_suspend(core->device);
+
+	mfc_alloc_firmware(core);
+
+	core->logging_data = devm_kzalloc(&pdev->dev, sizeof(struct mfc_debug),
+					  GFP_KERNEL);
+	if (!core->logging_data) {
+		ret = -ENOMEM;
+		goto err_alloc_debug;
+	}
+#if IS_ENABLED(CONFIG_MFC_USE_COREDUMP)
+	core->dbg_info.size = MFC_DUMP_BUF_SIZE;
+	core->dbg_info.addr = vmalloc(core->dbg_info.size);
+	if (!core->dbg_info.addr)
+		dev_err(&pdev->dev, "failed to alloc for debug buffer\n");
+#endif
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	samsung_sysmmu_activate(core->device);
+#endif
+	mfc_core_info("%s is completed\n", core->name);
+
+	return 0;
+
+ err_alloc_debug:
+#if IS_ENABLED(CONFIG_SAMSUNG_IOMMU)
+	samsung_iommu_unregister_fault_handler(&pdev->dev);
+ err_sysmmu_fault_handler:
+#endif
+	if (core->has_2sysmmu)
+		iounmap(core->sysmmu1_base);
+	iounmap(core->sysmmu0_base);
+	iounmap(core->regs_base);
+	release_mem_region(core->mfc_mem->start, resource_size(core->mfc_mem));
+ err_res_mem:
+	mfc_core_pm_final(core);
+ err_pm:
+	return ret;
+}
+
+/* Remove the driver */
+static void mfc_core_remove(struct platform_device *pdev)
+{
+	struct mfc_core *core = platform_get_drvdata(pdev);
+
+	mfc_core_info("++%s remove\n", core->name);
+
+	if (core->dbg_info.addr)
+		vfree(core->dbg_info.addr);
+#if IS_ENABLED(CONFIG_SAMSUNG_IOMMU)
+	samsung_iommu_unregister_fault_handler(&pdev->dev);
+#endif
+	mfc_core_destroy_listable_wq_core(core);
+
+	mfc_release_common_context(core);
+	mfc_release_firmware(core);
+	core->fw.status = 0;
+
+	if (core->has_2sysmmu)
+		if (core->sysmmu1_base)
+			iounmap(core->sysmmu1_base);
+	if (core->sysmmu0_base)
+		iounmap(core->sysmmu0_base);
+	iounmap(core->regs_base);
+	release_mem_region(core->mfc_mem->start, resource_size(core->mfc_mem));
+	mfc_core_pm_final(core);
+
+	mfc_core_info("--%s remove\n", core->name);
+}
+
+static void mfc_core_shutdown(struct platform_device *pdev)
+{
+	struct mfc_core *core = platform_get_drvdata(pdev);
+	struct mfc_dev *dev = core->dev;
+	int ret;
+
+	mfc_core_info("%s core shutdown is called\n", core->name);
+	if (core->shutdown) {
+		mfc_core_info("%s core shutdown was already performed\n",
+			      core->name);
+		return;
+	}
+
+	mutex_lock(&dev->mfc_mutex);
+	if (!mfc_core_get_pwr_ref_cnt(core)) {
+		core->shutdown = 1;
+		mfc_core_info("MFC is not running\n");
+		mutex_unlock(&dev->mfc_mutex);
+		return;
+	}
+
+	ret = mfc_core_get_hwlock_dev(core);
+	if (ret < 0)
+		mfc_core_err("Failed to get hwlock\n");
+
+	mfc_core_risc_off(core);
+	core->sched->clear_all_work(core);
+	mfc_core_release_hwlock_dev(core);
+
+	core->shutdown = 1;
+	mutex_unlock(&dev->mfc_mutex);
+
+	mfc_core_info("%s core shutdown completed\n", core->name);
+}
+
+#if IS_ENABLED(CONFIG_PM_SLEEP)
+static int mfc_core_suspend(struct device *device)
+{
+	struct mfc_core *core =
+	    platform_get_drvdata(to_platform_device(device));
+
+	if (!core) {
+		dev_err(device, "no mfc device to run\n");
+		return -EINVAL;
+	}
+
+	mfc_core_debug(2, "MFC suspend will be handled by main driver\n");
+
+	return 0;
+}
+
+static int mfc_core_resume(struct device *device)
+{
+	struct mfc_core *core =
+	    platform_get_drvdata(to_platform_device(device));
+
+	if (!core) {
+		dev_err(device, "no mfc core to run\n");
+		return -EINVAL;
+	}
+
+	mfc_core_debug(2, "MFC resume will be handled by main driver\n");
+
+	return 0;
+}
+#endif
+
+#if IS_ENABLED(CONFIG_PM)
+static int mfc_core_runtime_suspend(struct device *device)
+{
+	struct mfc_core *core =
+	    platform_get_drvdata(to_platform_device(device));
+
+	mfc_core_debug(3, "mfc runtime suspend\n");
+
+	return 0;
+}
+
+static int mfc_core_runtime_idle(struct device *dev)
+{
+	return 0;
+}
+
+static int mfc_core_runtime_resume(struct device *device)
+{
+	struct mfc_core *core =
+	    platform_get_drvdata(to_platform_device(device));
+
+	mfc_core_debug(3, "mfc runtime resume\n");
+
+	return 0;
+}
+#endif
+
+/* Power management */
+static const struct dev_pm_ops mfc_core_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mfc_core_suspend, mfc_core_resume)
+	    SET_RUNTIME_PM_OPS(mfc_core_runtime_suspend,
+			       mfc_core_runtime_resume,
+			       mfc_core_runtime_idle)
+};
+
+static const struct of_device_id exynos_mfc_core_match[] = {
+	{
+	 .compatible = "samsung,exynos-mfc-core",
+	 },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, exynos_mfc_core_match);
+
+struct platform_driver mfc_core_driver = {
+	.probe = mfc_core_probe,
+	.remove = mfc_core_remove,
+	.shutdown = mfc_core_shutdown,
+	.driver = {
+		   .name = MFC_CORE_NAME,
+		   .owner = THIS_MODULE,
+		   .pm = &mfc_core_pm_ops,
+		   .of_match_table = of_match_ptr(exynos_mfc_core_match),
+		   },
+};
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
new file mode 100644
index 000000000000..d9200bba1bb5
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_ops.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_ops.h"
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_run.h"
+#include "mfc_core_pm.h"
+#include "mfc_core_sync.h"
+
+#include "mfc_core_hw_reg_api.h"
+
+#include "base/mfc_sched.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_utils.h"
+#include "base/mfc_mem.h"
+
+static void __mfc_core_init(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = core->dev;
+
+	/* set MFC idle timer */
+	atomic_set(&core->hw_run_bits, 0);
+	mfc_core_change_idle_mode(core, MFC_IDLE_MODE_NONE);
+
+	if (!dev->fw_date)
+		dev->fw_date = core->fw.date;
+	else if (dev->fw_date > core->fw.date)
+		dev->fw_date = core->fw.date;
+}
+
+static int __mfc_wait_close_inst(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret = 0;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_info("[MSR] Couldn't close inst. It's Error state\n");
+		return 0;
+	}
+
+	if (core_ctx->state <= MFCINST_INIT) {
+		mfc_debug(2, "mfc instance didn't opend or already closed\n");
+		return 0;
+	}
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	mfc_change_state(core_ctx, MFCINST_RETURN_INST);
+	core->sched->set_work(core, core_ctx);
+
+	/* To issue the command 'CLOSE_INSTANCE' */
+	if (mfc_core_just_run(core, ctx->num)) {
+		mfc_err("failed to run MFC, state: %d\n", core_ctx->state);
+		MFC_TRACE_CTX_LT("[ERR][Release] failed to run MFC, state: %d\n", core_ctx->state);
+		return -EIO;
+	}
+
+	/* Wait until instance is returned or timeout occurred */
+	ret = mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_CLOSE_INSTANCE_RET);
+	if (ret == 1) {
+		mfc_err("failed to wait CLOSE_INSTANCE(timeout)\n");
+
+		if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_CLOSE_INSTANCE_RET)) {
+			mfc_err("waited once more but failed to wait CLOSE_INSTANCE\n");
+			core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_CLOSE_INST);
+		}
+	} else if (ret == -1) {
+		mfc_err("failed to wait CLOSE_INSTANCE(err)\n");
+	}
+
+	return 0;
+}
+
+static int __mfc_core_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret = 0;
+
+	core->sched->clear_work(core, core_ctx);
+
+	ret = __mfc_wait_close_inst(core, ctx);
+	if (ret) {
+		mfc_err("Failed to close instance\n");
+		return ret;
+	}
+
+	core->num_inst--;
+
+	/* Last normal instance */
+	if (core->num_inst == 0) {
+		core->curr_core_ctx = ctx->num;
+		mfc_core_pm_clock_on(core, 0);
+		mfc_core_run_cache_flush(core, MFC_CACHEFLUSH, 0);
+		mfc_core_pm_clock_off(core, 0);
+
+		mfc_core_change_fw_state(core, MFC_FW_INITIALIZED, 0);
+
+		mfc_core_change_fw_state(core, MFC_FW_LOADED, 0);
+	}
+
+	if (core->num_inst == 0) {
+		mfc_core_run_deinit_hw(core);
+
+		mfc_debug(2, "power off\n");
+		mfc_core_pm_power_off(core);
+
+		if (core->dev->debugfs.dbg_enable)
+			mfc_release_dbg_info_buffer(core);
+
+		if (core->state == MFCCORE_ERROR) {
+			mfc_core_change_state(core, MFCCORE_INIT);
+			mfc_info("[MSR] MFC-%d will be reset\n", core->id);
+		}
+	}
+
+	return 0;
+}
+
+static int __mfc_core_instance_init(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = NULL;
+	int ret = 0;
+	enum mfc_fw_status fw_status;
+	struct mfc_special_buf *fw_buf;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_ctx_err("MFC-%d is ERROR state\n", core->id);
+		return -EBUSY;
+	}
+
+	core->num_inst++;
+
+	/* Allocate memory for core context */
+	core_ctx = kzalloc(sizeof(*core_ctx), GFP_KERNEL);
+	if (!core_ctx) {
+		ret = -ENOMEM;
+		goto err_init_inst;
+	}
+
+	core_ctx->core = core;
+	core_ctx->ctx = ctx;
+	core_ctx->num = ctx->num;
+	core_ctx->inst_no = MFC_NO_INSTANCE_SET;
+	core->core_ctx[core_ctx->num] = core_ctx;
+
+	init_waitqueue_head(&core_ctx->cmd_wq);
+	mfc_core_init_listable_wq_ctx(core_ctx);
+	core->sched->clear_work(core, core_ctx);
+
+	if (core->num_inst == 1) {
+		mfc_debug(2, "it is first instance in to core-%d\n", core->id);
+
+		mfc_debug(2, "power on\n");
+		ret = mfc_core_pm_power_on(core);
+		if (ret) {
+			mfc_err("Failed block power on, ret=%d\n", ret);
+			goto err_power_on;
+		}
+
+		if (core->dev->debugfs.dbg_enable)
+			mfc_alloc_dbg_info_buffer(core);
+	}
+
+	/* Load and verify the FW */
+
+	fw_buf = &core->fw_buf;
+	fw_status = core->fw.status;
+
+	if (!(fw_status & MFC_FW_LOADED)) {
+		ret = mfc_request_load_firmware(core, fw_buf);
+		if (ret)
+			goto err_fw_load;
+	}
+
+	if (!(fw_status & MFC_FW_INITIALIZED)) {
+		core->curr_core_ctx = ctx->num;
+		core->preempt_core_ctx = MFC_NO_INSTANCE_SET;
+
+		ret = mfc_core_run_init_hw(core);
+		if (ret)
+			goto err_init_hw;
+	}
+
+	if (core->num_inst == 1)
+		__mfc_core_init(core, ctx);
+
+	return 0;
+
+err_init_hw:
+	mfc_core_change_fw_state(core, MFC_FW_LOADED, 0);
+
+err_fw_load:
+	if (core->dev->debugfs.dbg_enable)
+		mfc_release_dbg_info_buffer(core);
+	if (core->num_inst == 1) {
+		if (mfc_core_get_pwr_ref_cnt(core))
+			mfc_core_pm_power_off(core);
+	}
+err_power_on:
+	core->core_ctx[ctx->num] = 0;
+	kfree(core->core_ctx[ctx->num]);
+
+err_init_inst:
+	core->num_inst--;
+
+	return ret;
+}
+
+static int mfc_core_instance_init(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	int ret = 0;
+
+	mfc_core_debug_enter();
+
+	ret = mfc_core_get_hwlock_dev(core);
+	if (ret < 0) {
+		mfc_core_err("Failed to get hwlock\n");
+		mfc_core_err("dev.hwlock.dev = 0x%lx, bits = 0x%lx, owned_by_irq = %d, wl_count = %d, transfer_owner = %d\n",
+			     core->hwlock.dev, core->hwlock.bits, core->hwlock.owned_by_irq,
+			     core->hwlock.wl_count, core->hwlock.transfer_owner);
+		return ret;
+	}
+
+	ret = __mfc_core_instance_init(core, ctx);
+	if (ret)
+		mfc_core_err("Failed to core instance init\n");
+
+	mfc_core_release_hwlock_dev(core);
+
+	mfc_core_debug_leave();
+
+	return ret;
+}
+
+static int mfc_core_instance_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret = 0;
+
+	if (!core_ctx) {
+		mfc_core_err("There is no instance\n");
+		return -EINVAL;
+	}
+
+	core->sched->clear_work(core, core_ctx);
+
+	ret = mfc_core_get_hwlock_ctx(core_ctx);
+	if (ret < 0) {
+		mfc_err("Failed to get hwlock\n");
+		MFC_TRACE_CTX_LT("[ERR][Release] failed to get hwlock (shutdown: %d)\n",
+				 core->shutdown);
+		return -EBUSY;
+	}
+
+	/* If instance was initialised then return instance and free reosurces */
+	ret = __mfc_core_deinit(core, ctx);
+	if (ret)
+		goto err_release_try;
+
+	mfc_core_release_hwlock_ctx(core_ctx);
+	mfc_core_destroy_listable_wq_ctx(core_ctx);
+
+	core->core_ctx[core_ctx->num] = 0;
+	kfree(core_ctx);
+
+	return 0;
+
+err_release_try:
+	mfc_core_release_hwlock_ctx(core_ctx);
+	return ret;
+}
+
+static const struct mfc_core_ops mfc_core_ops = {
+	.instance_init = mfc_core_instance_init,
+	.instance_deinit = mfc_core_instance_deinit,
+};
+
+const struct mfc_core_ops *mfc_get_core_ops(void)
+{
+	return &mfc_core_ops;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.h
new file mode 100644
index 000000000000..80647b3b165a
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_ops.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+#ifndef __MFC_CORE_OPS_H
+#define __MFC_CORE_OPS_H __FILE__
+
+#include "base/mfc_common.h"
+
+const struct mfc_core_ops *mfc_get_core_ops(void);
+#endif /* __MFC_CORE_OPS_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
new file mode 100644
index 000000000000..a2f69a064d3d
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_sched_prio.c File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_sync.h"
+
+#include "base/mfc_sched.h"
+#include "base/mfc_utils.h"
+
+static inline void __mfc_print_workbits(struct mfc_core *core, int prio, int num)
+{
+	int i;
+
+	mfc_core_debug(4, "[PRIO][c:%d] prio %d\n", num, prio);
+	for (i = 0; i < core->total_num_prio; i++)
+		mfc_core_debug(4, "[PRIO] MFC-%d P[%d] bits %08lx\n",
+			       core->id, i, core->prio_work_bits[i]);
+}
+
+static inline void __mfc_clear_all_prio_bits(struct mfc_core *core)
+{
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+	for (i = 0; i < core->total_num_prio; i++)
+		core->prio_work_bits[i] = 0;
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+}
+
+static void mfc_create_work_prio(struct mfc_core *core)
+{
+	int num_prio = core->dev->pdata->pbs_num_prio;
+
+	spin_lock_init(&core->prio_work_lock);
+
+	core->sched_type = MFC_SCHED_PRIO;
+	core->num_prio = num_prio ? num_prio : 1;
+	core->total_num_prio = core->num_prio * 2 + 2;
+
+	__mfc_clear_all_prio_bits(core);
+}
+
+static void mfc_init_work_prio(struct mfc_core *core)
+{
+	core->sched_type = MFC_SCHED_PRIO;
+	__mfc_clear_all_prio_bits(core);
+	mfc_core_debug(2, "[SCHED][PRIO] Scheduler type is PBS\n");
+}
+
+static void mfc_clear_all_work_prio(struct mfc_core *core)
+{
+	__mfc_clear_all_prio_bits(core);
+}
+
+static void mfc_set_work_prio(struct mfc_core *core, struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long flags;
+	int p;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	p = mfc_get_prio(core, ctx->rt, ctx->prio);
+	__set_bit(core_ctx->num, &core->prio_work_bits[p]);
+	__mfc_print_workbits(core, p, core_ctx->num);
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+}
+
+static void mfc_clear_work_prio(struct mfc_core *core, struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long flags;
+	int p;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	p = mfc_get_prio(core, ctx->rt, ctx->prio);
+	__clear_bit(core_ctx->num, &core->prio_work_bits[p]);
+	__mfc_print_workbits(core, p, core_ctx->num);
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+}
+
+struct mfc_sched_class mfc_sched_prio = {
+	.create_work		= mfc_create_work_prio,
+	.init_work		= mfc_init_work_prio,
+	.clear_all_work		= mfc_clear_all_work_prio,
+	.set_work		= mfc_set_work_prio,
+	.clear_work		= mfc_clear_work_prio,
+};
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
new file mode 100644
index 000000000000..a25a05642cf2
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_rm.c File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_rm.h"
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_intlock.h"
+#include "mfc_core_hw_reg_api.h"
+#include "mfc_core_pm.h"
+
+#include "base/mfc_buf.h"
+#include "base/mfc_utils.h"
+#include "base/mfc_mem.h"
+
+int mfc_rm_instance_init(struct mfc_dev *dev, struct mfc_ctx *ctx)
+{
+	struct mfc_core *core;
+	int i, ret;
+
+	mfc_ctx_debug_enter();
+
+	mfc_get_corelock_ctx(ctx);
+
+	/*
+	 * The FW memory for all cores is allocated in advance.
+	 * (Only once at first time)
+	 * Because FW base address should be the lowest address
+	 * than all DVA that FW approaches.
+	 */
+	for (i = 0; i < dev->num_core; i++) {
+		core = dev->core[i];
+		if (!core) {
+			mfc_ctx_err("[RM] There is no MFC-%d\n", i);
+			continue;
+		}
+
+		if (!(core->fw.status & MFC_FW_ALLOC)) {
+			ret = mfc_alloc_firmware(core);
+			if (ret)
+				goto err_inst_init;
+		}
+
+		if (!(core->fw.status & MFC_CTX_ALLOC)) {
+			ret = mfc_alloc_common_context(core);
+			if (ret)
+				goto err_inst_init;
+		}
+	}
+
+	mfc_change_op_mode(ctx, MFC_OP_SINGLE);
+	ctx->op_core_type = MFC_OP_CORE_NOT_FIXED;
+	if (ctx->type == MFCINST_DECODER)
+		ctx->op_core_num[MFC_CORE_MAIN] = MFC_DEC_DEFAULT_CORE;
+	else
+		ctx->op_core_num[MFC_CORE_MAIN] = MFC_ENC_DEFAULT_CORE;
+
+	core = mfc_get_main_core(dev, ctx);
+	if (!core) {
+		mfc_ctx_err("[RM] There is no main core\n");
+		ret = -EINVAL;
+		goto err_inst_init;
+	}
+
+	mfc_ctx_debug(2, "[RM] init instance core-%d\n",
+		      ctx->op_core_num[MFC_CORE_MAIN]);
+	ret = core->core_ops->instance_init(core, ctx);
+	if (ret) {
+		ctx->op_core_num[MFC_CORE_MAIN] = MFC_CORE_INVALID;
+		mfc_ctx_err("[RM] Failed to init\n");
+	}
+
+err_inst_init:
+	mfc_release_corelock_ctx(ctx);
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+int mfc_rm_instance_deinit(struct mfc_dev *dev, struct mfc_ctx *ctx)
+{
+	struct mfc_core *core = NULL, *subcore;
+	int i, ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	mfc_get_corelock_ctx(ctx);
+
+	/* reset original stream mode */
+	mutex_lock(&ctx->op_mode_mutex);
+	if (IS_SWITCH_SINGLE_MODE(ctx)) {
+		mfc_rm_set_core_num(ctx, MFC_DEC_DEFAULT_CORE);
+		mfc_change_op_mode(ctx, ctx->stream_op_mode);
+	}
+	mutex_unlock(&ctx->op_mode_mutex);
+
+	if (IS_TWO_MODE1(ctx)) {
+		subcore = mfc_get_sub_core(dev, ctx);
+		if (!subcore)
+			mfc_ctx_err("[RM] There is no sub core for clock off\n");
+		else
+			mfc_core_pm_clock_off(subcore, 0);
+	}
+
+	for (i = (MFC_CORE_TYPE_NUM - 1); i >= 0; i--) {
+		if (ctx->op_core_num[i] == MFC_CORE_INVALID)
+			continue;
+
+		core = dev->core[ctx->op_core_num[i]];
+		if (!core) {
+			mfc_ctx_err("[RM] There is no core[%d]\n",
+				    ctx->op_core_num[i]);
+			ret = -EINVAL;
+			goto err_inst_deinit;
+		}
+
+		mfc_core_debug(2, "[RM] core%d will be deinit, ctx[%d]\n",
+			       i, ctx->num);
+		ret = core->core_ops->instance_deinit(core, ctx);
+		if (ret)
+			mfc_core_err("[RM] Failed to deinit\n");
+	}
+
+	clear_bit(ctx->num, &dev->multi_core_inst_bits);
+	mfc_change_op_mode(ctx, MFC_OP_SINGLE);
+	ctx->op_core_type = MFC_OP_CORE_NOT_FIXED;
+
+err_inst_deinit:
+	mfc_release_corelock_ctx(ctx);
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h
new file mode 100644
index 000000000000..8f9e7494057e
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_rm.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_RM_H
+#define __MFC_RM_H __FILE__
+
+#include "mfc_core_sync.h"
+
+#define MFC_RM_LOAD_DELETE		0
+#define MFC_RM_LOAD_ADD			1
+#define MFC_RM_LOAD_DELETE_UPDATE	2
+
+static inline struct mfc_core *mfc_get_main_core(struct mfc_dev *dev,
+						 struct mfc_ctx *ctx)
+{
+	if (ctx->op_core_num[MFC_CORE_MAIN] == MFC_CORE_INVALID)
+		return NULL;
+
+	return dev->core[ctx->op_core_num[MFC_CORE_MAIN]];
+}
+
+static inline struct mfc_core *mfc_get_sub_core(struct mfc_dev *dev,
+						struct mfc_ctx *ctx)
+{
+	if (ctx->op_core_num[MFC_CORE_SUB] == MFC_CORE_INVALID)
+		return NULL;
+
+	return dev->core[ctx->op_core_num[MFC_CORE_SUB]];
+}
+
+static inline void mfc_rm_set_core_num(struct mfc_ctx *ctx, int main_core_num)
+{
+	ctx->op_core_num[MFC_CORE_MAIN] = main_core_num;
+
+	if (main_core_num == MFC_DEC_DEFAULT_CORE)
+		ctx->op_core_num[MFC_CORE_SUB] = MFC_SURPLUS_CORE;
+	else
+		ctx->op_core_num[MFC_CORE_SUB] = MFC_DEC_DEFAULT_CORE;
+
+	mfc_ctx_debug(2, "[RM] main core %d, sub core %d\n",
+		      ctx->op_core_num[MFC_CORE_MAIN],
+		      ctx->op_core_num[MFC_CORE_SUB]);
+}
+
+/* core ops */
+int mfc_rm_instance_init(struct mfc_dev *dev, struct mfc_ctx *ctx);
+int mfc_rm_instance_deinit(struct mfc_dev *dev, struct mfc_ctx *ctx);
+#endif /* __MFC_RM_H */
-- 
2.34.1

