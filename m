Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3155BA6C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC54112956;
	Mon, 27 Jun 2022 14:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D46D10E864
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QVKVrjwnukQ5lQnhbQukvjMnPiKrXBsMGzKK7f6HmtQ=; b=XDbrrwqQFS62z5V9uPtlrxzmPs
 8WsphxZ1YT8MNIfdbeSCXrYysMr0DVEx3SlhBQjVO3xuoIBJZIbGxyZBfYksOltk0M0cBOcFMoq/3
 RIKgfE6j7BABi+zfLlIgF2I8ID/QiYOEr+DvA24AxFg+F90xJ+7vqr9sQ0ECDLxK69XfYCkeI6tSU
 Nbr2mc1wcukhKiox9ioSDrk304XyL515MpRNPcpkeaGl3vCzqJJZmd4HQy8WWTq9wXJf2lsi4eRBK
 AN38/f8g3mIHqMnL4aNVkI+jwOQrKczvApLyOciWhNcpp5nNIpqiFb5kOu+obqoCRnJQCyX0sfchh
 HXRtESCw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o5pbK-003N2J-Rz; Mon, 27 Jun 2022 17:20:29 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7/v3 02/22] gpu: host1x: Add context device management code
Date: Mon, 27 Jun 2022 17:19:48 +0300
Message-Id: <20220627142008.2072474-3-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
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
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add code to register context devices from device tree, allocate them
out and manage their refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Directly set DMA mask instead of inheriting from Host1x.
* Use iommu-map instead of custom DT property.
v4:
* Use u64 instead of dma_addr_t for DMA mask
* Use unsigned ints for indexes and adjust error handling flow
* Parse iommu-map property at top level host1x DT node
* Use separate DMA mask per device
* Export symbols as GPL
v5:
* Rename host1x_context to host1x_memory_context
v6:
* Use device_iommu_mapped to check if the context device got
  mapped to an IOMMU.
* Fix build with CONFIG_IOMMU_API disabled.
---
 drivers/gpu/host1x/Makefile  |   3 +
 drivers/gpu/host1x/context.c | 160 +++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/context.h |  38 +++++++++
 drivers/gpu/host1x/dev.c     |  12 ++-
 drivers/gpu/host1x/dev.h     |   2 +
 include/linux/host1x.h       |  34 ++++++++
 6 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index c891a3e33844..28f7aaedce0f 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -17,5 +17,8 @@ host1x-y = \
 	hw/host1x06.o \
 	hw/host1x07.o
 
+host1x-$(CONFIG_IOMMU_API) += \
+	context.o
+
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
 obj-$(CONFIG_TEGRA_HOST1X_CONTEXT_BUS) += context_bus.o
diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
new file mode 100644
index 000000000000..b08cf11f9a66
--- /dev/null
+++ b/drivers/gpu/host1x/context.c
@@ -0,0 +1,160 @@
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
+int host1x_memory_context_list_init(struct host1x *host1x)
+{
+	struct host1x_memory_context_list *cdl = &host1x->context_list;
+	struct device_node *node = host1x->dev->of_node;
+	struct host1x_memory_context *ctx;
+	unsigned int i;
+	int err;
+
+	cdl->devs = NULL;
+	cdl->len = 0;
+	mutex_init(&cdl->lock);
+
+	err = of_property_count_u32_elems(node, "iommu-map");
+	if (err < 0)
+		return 0;
+
+	cdl->devs = kcalloc(err, sizeof(*cdl->devs), GFP_KERNEL);
+	if (!cdl->devs)
+		return -ENOMEM;
+	cdl->len = err / 4;
+
+	for (i = 0; i < cdl->len; i++) {
+		struct iommu_fwspec *fwspec;
+
+		ctx = &cdl->devs[i];
+
+		ctx->host = host1x;
+
+		device_initialize(&ctx->dev);
+
+		/*
+		 * Due to an issue with T194 NVENC, only 38 bits can be used.
+		 * Anyway, 256GiB of IOVA ought to be enough for anyone.
+		 */
+		ctx->dma_mask = DMA_BIT_MASK(38);
+		ctx->dev.dma_mask = &ctx->dma_mask;
+		ctx->dev.coherent_dma_mask = ctx->dma_mask;
+		dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
+		ctx->dev.bus = &host1x_context_device_bus_type;
+		ctx->dev.parent = host1x->dev;
+
+		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
+
+		err = device_add(&ctx->dev);
+		if (err) {
+			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
+			goto del_devices;
+		}
+
+		err = of_dma_configure_id(&ctx->dev, node, true, &i);
+		if (err) {
+			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
+				i, err);
+			device_del(&ctx->dev);
+			goto del_devices;
+		}
+
+		fwspec = dev_iommu_fwspec_get(&ctx->dev);
+		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
+			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
+			device_del(&ctx->dev);
+			goto del_devices;
+		}
+
+		ctx->stream_id = fwspec->ids[0] & 0xffff;
+	}
+
+	return 0;
+
+del_devices:
+	while (i--)
+		device_del(&cdl->devs[i].dev);
+
+	kfree(cdl->devs);
+	cdl->len = 0;
+
+	return err;
+}
+
+void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
+{
+	unsigned int i;
+
+	for (i = 0; i < cdl->len; i++)
+		device_del(&cdl->devs[i].dev);
+
+	kfree(cdl->devs);
+	cdl->len = 0;
+}
+
+struct host1x_memory_context *host1x_memory_context_alloc(struct host1x *host1x,
+							  struct pid *pid)
+{
+	struct host1x_memory_context_list *cdl = &host1x->context_list;
+	struct host1x_memory_context *free = NULL;
+	int i;
+
+	if (!cdl->len)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mutex_lock(&cdl->lock);
+
+	for (i = 0; i < cdl->len; i++) {
+		struct host1x_memory_context *cd = &cdl->devs[i];
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
+EXPORT_SYMBOL_GPL(host1x_memory_context_alloc);
+
+void host1x_memory_context_get(struct host1x_memory_context *cd)
+{
+	refcount_inc(&cd->ref);
+}
+EXPORT_SYMBOL_GPL(host1x_memory_context_get);
+
+void host1x_memory_context_put(struct host1x_memory_context *cd)
+{
+	struct host1x_memory_context_list *cdl = &cd->host->context_list;
+
+	if (refcount_dec_and_mutex_lock(&cd->ref, &cdl->lock)) {
+		put_pid(cd->owner);
+		cd->owner = NULL;
+		mutex_unlock(&cdl->lock);
+	}
+}
+EXPORT_SYMBOL_GPL(host1x_memory_context_put);
diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
new file mode 100644
index 000000000000..3e03bc1d3bac
--- /dev/null
+++ b/drivers/gpu/host1x/context.h
@@ -0,0 +1,38 @@
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
+struct host1x_memory_context_list {
+	struct mutex lock;
+	struct host1x_memory_context *devs;
+	unsigned int len;
+};
+
+#ifdef CONFIG_IOMMU_API
+int host1x_memory_context_list_init(struct host1x *host1x);
+void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl);
+#else
+static inline int host1x_memory_context_list_init(struct host1x *host1x)
+{
+	return 0;
+}
+
+static inline void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 80c685ab3e30..89cc79a48eab 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -28,6 +28,7 @@
 
 #include "bus.h"
 #include "channel.h"
+#include "context.h"
 #include "debug.h"
 #include "dev.h"
 #include "intr.h"
@@ -503,10 +504,16 @@ static int host1x_probe(struct platform_device *pdev)
 		goto iommu_exit;
 	}
 
+	err = host1x_memory_context_list_init(host);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize context list\n");
+		goto free_channels;
+	}
+
 	err = host1x_syncpt_init(host);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize syncpts\n");
-		goto free_channels;
+		goto free_contexts;
 	}
 
 	err = host1x_intr_init(host, syncpt_irq);
@@ -550,6 +557,8 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_intr_deinit(host);
 deinit_syncpt:
 	host1x_syncpt_deinit(host);
+free_contexts:
+	host1x_memory_context_list_free(&host->context_list);
 free_channels:
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
@@ -571,6 +580,7 @@ static int host1x_remove(struct platform_device *pdev)
 
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
+	host1x_memory_context_list_free(&host->context_list);
 	host1x_channel_list_free(&host->channel_list);
 	host1x_iommu_exit(host);
 	host1x_bo_cache_destroy(&host->cache);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index ca4b082f0cd4..7552a4554534 100644
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
+	struct host1x_memory_context_list context_list;
 
 	struct dentry *debugfs;
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index c0bf4e581fe9..32a82da13fed 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -446,4 +446,38 @@ int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
 int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
 
+/* host1x memory contexts */
+
+struct host1x_memory_context {
+	struct host1x *host;
+
+	refcount_t ref;
+	struct pid *owner;
+
+	struct device dev;
+	u64 dma_mask;
+	u32 stream_id;
+};
+
+#ifdef CONFIG_IOMMU_API
+struct host1x_memory_context *host1x_memory_context_alloc(struct host1x *host1x,
+							  struct pid *pid);
+void host1x_memory_context_get(struct host1x_memory_context *cd);
+void host1x_memory_context_put(struct host1x_memory_context *cd);
+#else
+static inline struct host1x_memory_context *host1x_memory_context_alloc(struct host1x *host1x,
+									struct pid *pid)
+{
+	return NULL;
+}
+
+static inline void host1x_memory_context_get(struct host1x_memory_context *cd)
+{
+}
+
+static inline void host1x_memory_context_put(struct host1x_memory_context *cd)
+{
+}
+#endif
+
 #endif
-- 
2.36.1

