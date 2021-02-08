Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFD3139C8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267EE6E951;
	Mon,  8 Feb 2021 16:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A016E949
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bsWc7c4dIP4yDHF0koFkC7dnWmKUXfKGZepq5TdSPiQ=; b=gZo0l9ksaAG/py3fgt5BTc4TGf
 DiwYLZVcgko3HrUvkvEtLc9UFGpHgTBazR9fdNUuwRDh06Nm/mxGF4IQ0+kPEKywVCXlb0+5J/qCx
 aNc1yLZErJCh9KqGwQfM6BSQrnE6sqdvexujAYzT3FFJcYNBuBoFDhA+0WF5NfsE3xb7EKEahy3oH
 MMyfp2cxGXZV4hMcKIApHU6hA0DI5YsBg34EJ7hC2c37ei5vbI4HNHZv8WZmf9MHhkN3Z9k66c2H6
 8bqe3nrEil1r7JkFlPi8qEDFlh5FkMMI7OI0KuUmMRJD/5HqZCZ27i5kGGWdl/GJDKjsDcljkr89/
 zm41ir+w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99as-0000Cr-Pn; Mon, 08 Feb 2021 18:40:58 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 3/8] gpu: host1x: Add context device management code
Date: Mon,  8 Feb 2021 18:38:43 +0200
Message-Id: <20210208163848.2504291-4-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208163848.2504291-1-mperttunen@nvidia.com>
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add code to register context devices from device tree, allocate them
out and manage their refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/Makefile  |   1 +
 drivers/gpu/host1x/context.c | 161 +++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/context.h |  27 ++++++
 drivers/gpu/host1x/dev.c     |  12 ++-
 drivers/gpu/host1x/dev.h     |   2 +
 include/linux/host1x.h       |  17 ++++
 6 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index d9fea2885658..9f6797e39057 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -11,6 +11,7 @@ host1x-y = \
 	mipi.o \
 	uapi.o \
 	fence.o \
+	context.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
new file mode 100644
index 000000000000..c3bbdb5484c3
--- /dev/null
+++ b/drivers/gpu/host1x/context.c
@@ -0,0 +1,161 @@
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
+int host1x_context_list_init(struct host1x *host1x)
+{
+	struct host1x_context_list *cdl = &host1x->context_list;
+	struct host1x_context *ctx;
+	struct of_phandle_args iommu_spec;
+	int index;
+	int err;
+
+	cdl->devs = NULL;
+	cdl->len = 0;
+	mutex_init(&cdl->lock);
+
+	err = of_count_phandle_with_args(host1x->dev->of_node,
+					 "nvidia,context-iommus",
+					 "#iommu-cells");
+	if (err < 0)
+		return 0;
+
+	cdl->devs = kcalloc(err, sizeof(*cdl->devs), GFP_KERNEL);
+	if (!cdl->devs)
+		return -ENOMEM;
+	cdl->len = err;
+
+	for (index = 0; index < cdl->len; index++) {
+		err = of_parse_phandle_with_args(host1x->dev->of_node,
+						 "nvidia,context-iommus",
+						 "#iommu-cells", index,
+						 &iommu_spec);
+		if (err) {
+			dev_err(host1x->dev, "could not parse context device %d from device tree: %d\n",
+				index, err);
+			goto del_devices;
+		}
+
+		ctx = &cdl->devs[index];
+
+		ctx->host = host1x;
+
+		device_initialize(&ctx->dev);
+
+		ctx->dev.coherent_dma_mask = host1x->dev->coherent_dma_mask;
+		ctx->dev.dma_mask = &ctx->dev.coherent_dma_mask;
+		dev_set_name(&ctx->dev, "host1x-ctx.%d", index);
+		ctx->dev.bus = &host1x_context_device_bus_type;
+		ctx->dev.parent = host1x->dev;
+
+		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
+
+		err = device_add(&ctx->dev);
+		if (err) {
+			dev_err(host1x->dev, "could not add context device %d: %d\n", index, err);
+			of_node_put(iommu_spec.np);
+			goto del_devices;
+		}
+
+		err = of_dma_configure_iommu_spec(
+			&ctx->dev, host1x->dev->of_node, false, &iommu_spec);
+		of_node_put(iommu_spec.np);
+		if (err) {
+			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
+				index, err);
+			device_del(&ctx->dev);
+			goto del_devices;
+		}
+
+		ctx->stream_id = iommu_spec.args[0] & 0xffff;
+	}
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
index 8b50fbb22846..300592b5e9a2 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -20,6 +20,7 @@
 
 #include "bus.h"
 #include "channel.h"
+#include "context.h"
 #include "debug.h"
 #include "dev.h"
 #include "intr.h"
@@ -443,10 +444,16 @@ static int host1x_probe(struct platform_device *pdev)
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
@@ -501,6 +508,8 @@ static int host1x_probe(struct platform_device *pdev)
 	reset_control_assert(host->rst);
 unprepare_disable:
 	clk_disable_unprepare(host->clk);
+free_contexts:
+	host1x_context_list_free(&host->context_list);
 free_channels:
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
@@ -520,6 +529,7 @@ static int host1x_remove(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
 	clk_disable_unprepare(host->clk);
+	host1x_context_list_free(&host->context_list);
 	host1x_iommu_exit(host);
 
 	return 0;
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index e360bc4a25f6..50cbd6ad28e9 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -14,6 +14,7 @@
 
 #include "cdma.h"
 #include "channel.h"
+#include "context.h"
 #include "intr.h"
 #include "job.h"
 #include "syncpt.h"
@@ -141,6 +142,7 @@ struct host1x {
 	struct mutex syncpt_mutex;
 
 	struct host1x_channel_list channel_list;
+	struct host1x_context_list context_list;
 
 	struct dentry *debugfs;
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 5890f91dd286..3cf3c6a0b225 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -371,4 +371,21 @@ int tegra_mipi_disable(struct tegra_mipi_device *device);
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
