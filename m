Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF940DCD3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9356EE0A;
	Thu, 16 Sep 2021 14:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922B46EE07
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJdFG9sMOSaGH8Ycs7Mr3zlh8NBxtLFtGUMD/WPJXNE=; b=oMKhm4XsZJC52ze+W1piapHShI
 oVwSykl+Hf8+mxoIgZisS3kEkBSeCQOMTOujipr02tdkPDw53qzXibcEZW8acg7uvXM+7DuLdKX+D
 8eVHuO5V3lm1rDcpSqVbUfdp3N3QHtR46llXU//65Eg2/ouz+rF5L5fde6MXZjqgYapV0MzstoXF6
 rrlIcM5T8CVP5/nptr4E4Lxs9qNfx+M3NV3CasPSpIh62EvMcc+heeys9DLOTm2sn6NIVU+oQSO4C
 dyg1IzrJ17E81hYy3oRLJMoKKSPt/ESH5eBLcBwBMm7WlvmIf+YISxJS7YhGPevWDGaFhk2J7Wyuh
 75Xg6b1Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mQsRv-0005Xx-Tx; Thu, 16 Sep 2021 17:33:15 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 2/8] gpu: host1x: Add context device management code
Date: Thu, 16 Sep 2021 17:32:56 +0300
Message-Id: <20210916143302.2024933-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916143302.2024933-1-mperttunen@nvidia.com>
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

Add code to register context devices from device tree, allocate them
out and manage their refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Directly set DMA mask instead of inheriting from Host1x.
* Use iommu-map instead of custom DT property.
---
 drivers/gpu/host1x/Makefile  |   1 +
 drivers/gpu/host1x/context.c | 174 +++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/context.h |  27 ++++++
 drivers/gpu/host1x/dev.c     |  12 ++-
 drivers/gpu/host1x/dev.h     |   2 +
 include/linux/host1x.h       |  17 ++++
 6 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index c891a3e33844..8a65e13d113a 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -10,6 +10,7 @@ host1x-y = \
 	debug.o \
 	mipi.o \
 	fence.o \
+	context.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
new file mode 100644
index 000000000000..987c08a1e2f2
--- /dev/null
+++ b/drivers/gpu/host1x/context.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, NVIDIA Corporation.
+ */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pid.h>
+#include <linux/slab.h>
+
+#include "context.h"
+#include "dev.h"
+
+/*
+ * Due to an issue with T194 NVENC, only 38 bits can be used.
+ * Anyway, 256GiB of IOVA ought to be enough for anyone.
+ */
+static dma_addr_t context_device_dma_mask = DMA_BIT_MASK(38);
+
+int host1x_context_list_init(struct host1x *host1x)
+{
+	struct host1x_context_list *cdl = &host1x->context_list;
+	struct host1x_context *ctx;
+	struct device_node *node;
+	int index;
+	int err;
+
+	node = of_get_child_by_name(host1x->dev->of_node, "memory-contexts");
+	if (!node)
+		return 0;
+
+	cdl->devs = NULL;
+	cdl->len = 0;
+	mutex_init(&cdl->lock);
+
+	err = of_property_count_u32_elems(node, "iommu-map");
+	if (err < 0) {
+		err = 0;
+		goto put_node;
+	}
+
+	cdl->devs = kcalloc(err, sizeof(*cdl->devs), GFP_KERNEL);
+	if (!cdl->devs) {
+		err = -ENOMEM;
+		goto put_node;
+	}
+	cdl->len = err / 4;
+
+	for (index = 0; index < cdl->len; index++) {
+		struct iommu_fwspec *fwspec;
+
+		ctx = &cdl->devs[index];
+
+		ctx->host = host1x;
+
+		device_initialize(&ctx->dev);
+
+		ctx->dev.dma_mask = &context_device_dma_mask;
+		ctx->dev.coherent_dma_mask = context_device_dma_mask;
+		dev_set_name(&ctx->dev, "host1x-ctx.%d", index);
+		ctx->dev.bus = &host1x_context_device_bus_type;
+		ctx->dev.parent = host1x->dev;
+
+		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
+
+		err = device_add(&ctx->dev);
+		if (err) {
+			dev_err(host1x->dev, "could not add context device %d: %d\n", index, err);
+			goto del_devices;
+		}
+
+		err = of_dma_configure_id(&ctx->dev, node, true, &index);
+		if (err) {
+			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
+				index, err);
+			device_del(&ctx->dev);
+			goto del_devices;
+		}
+
+		fwspec = dev_iommu_fwspec_get(&ctx->dev);
+		if (!fwspec) {
+			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", index);
+			device_del(&ctx->dev);
+			goto del_devices;
+		}
+
+		ctx->stream_id = fwspec->ids[0] & 0xffff;
+	}
+
+	of_node_put(node);
+
+	return 0;
+
+del_devices:
+	while (--index >= 0)
+		device_del(&cdl->devs[index].dev);
+
+	kfree(cdl->devs);
+	cdl->len = 0;
+
+put_node:
+	of_node_put(node);
+
+	return err;
+}
+
+void host1x_context_list_free(struct host1x_context_list *cdl)
+{
+	int i;
+
+	for (i = 0; i < cdl->len; i++)
+		device_del(&cdl->devs[i].dev);
+
+	kfree(cdl->devs);
+	cdl->len = 0;
+}
+
+struct host1x_context *host1x_context_alloc(struct host1x *host1x,
+					    struct pid *pid)
+{
+	struct host1x_context_list *cdl = &host1x->context_list;
+	struct host1x_context *free = NULL;
+	int i;
+
+	if (!cdl->len)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mutex_lock(&cdl->lock);
+
+	for (i = 0; i < cdl->len; i++) {
+		struct host1x_context *cd = &cdl->devs[i];
+
+		if (cd->owner == pid) {
+			refcount_inc(&cd->ref);
+			mutex_unlock(&cdl->lock);
+			return cd;
+		} else if (!cd->owner && !free) {
+			free = cd;
+		}
+	}
+
+	if (!free) {
+		mutex_unlock(&cdl->lock);
+		return ERR_PTR(-EBUSY);
+	}
+
+	refcount_set(&free->ref, 1);
+	free->owner = get_pid(pid);
+
+	mutex_unlock(&cdl->lock);
+
+	return free;
+}
+EXPORT_SYMBOL(host1x_context_alloc);
+
+void host1x_context_get(struct host1x_context *cd)
+{
+	refcount_inc(&cd->ref);
+}
+EXPORT_SYMBOL(host1x_context_get);
+
+void host1x_context_put(struct host1x_context *cd)
+{
+	struct host1x_context_list *cdl = &cd->host->context_list;
+
+	if (refcount_dec_and_mutex_lock(&cd->ref, &cdl->lock)) {
+		put_pid(cd->owner);
+		cd->owner = NULL;
+		mutex_unlock(&cdl->lock);
+	}
+}
+EXPORT_SYMBOL(host1x_context_put);
diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
new file mode 100644
index 000000000000..268ecdf6b1bb
--- /dev/null
+++ b/drivers/gpu/host1x/context.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Host1x context devices
+ *
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#ifndef __HOST1X_CONTEXT_H
+#define __HOST1X_CONTEXT_H
+
+#include <linux/mutex.h>
+#include <linux/refcount.h>
+
+struct host1x;
+
+extern struct bus_type host1x_context_device_bus_type;
+
+struct host1x_context_list {
+	struct mutex lock;
+	struct host1x_context *devs;
+	unsigned int len;
+};
+
+int host1x_context_list_init(struct host1x *host1x);
+void host1x_context_list_free(struct host1x_context_list *cdl);
+
+#endif
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index e2ddf3fcaa9a..736cd2b4a149 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -20,6 +20,7 @@
 
 #include "bus.h"
 #include "channel.h"
+#include "context.h"
 #include "debug.h"
 #include "dev.h"
 #include "intr.h"
@@ -461,10 +462,16 @@ static int host1x_probe(struct platform_device *pdev)
 		goto iommu_exit;
 	}
 
+	err = host1x_context_list_init(host);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize context list\n");
+		goto free_channels;
+	}
+
 	err = clk_prepare_enable(host->clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto free_channels;
+		goto free_contexts;
 	}
 
 	err = reset_control_deassert(host->rst);
@@ -511,6 +518,8 @@ static int host1x_probe(struct platform_device *pdev)
 	reset_control_assert(host->rst);
 unprepare_disable:
 	clk_disable_unprepare(host->clk);
+free_contexts:
+	host1x_context_list_free(&host->context_list);
 free_channels:
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
@@ -529,6 +538,7 @@ static int host1x_remove(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
 	clk_disable_unprepare(host->clk);
+	host1x_context_list_free(&host->context_list);
 	host1x_iommu_exit(host);
 
 	return 0;
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index fa6d4bc46e98..cfc42de78fa9 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -14,6 +14,7 @@
 
 #include "cdma.h"
 #include "channel.h"
+#include "context.h"
 #include "intr.h"
 #include "job.h"
 #include "syncpt.h"
@@ -140,6 +141,7 @@ struct host1x {
 	struct mutex syncpt_mutex;
 
 	struct host1x_channel_list channel_list;
+	struct host1x_context_list context_list;
 
 	struct dentry *debugfs;
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 2a1b53ebee77..f3073738564a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -396,4 +396,21 @@ int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
 int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
 
+/* host1x context devices */
+
+struct host1x_context {
+	struct host1x *host;
+
+	refcount_t ref;
+	struct pid *owner;
+
+	struct device dev;
+	u32 stream_id;
+};
+
+struct host1x_context *host1x_context_alloc(struct host1x *host1x,
+					    struct pid *pid);
+void host1x_context_get(struct host1x_context *cd);
+void host1x_context_put(struct host1x_context *cd);
+
 #endif
-- 
2.32.0

