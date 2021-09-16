Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869240DCC6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EAF6EE08;
	Thu, 16 Sep 2021 14:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E093C6EE04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t+oHArRUKruNtF6t61P+0fcL7ssYanvgJ9B45e9Pkj4=; b=0O8TbBVBtcDHchatTwlfnryVWX
 o8jromUvev4SAbdpKyDsmc+Qn8G1ZhhYWvjqYtBn0X4MB7ZvBKQ/e7zCZZ0CFgjtfT0ywB0rFdLlD
 V4sK5qCg4DEz7lP8HsrebVp3JIv5FS2YdZ+XAy9WvHERPBdPXqf+gT19OXYArq1XUbJ1yOcUr3Cfx
 +5uyfdDxivZ03ZB29i1q8B2ykNosEhaZPP/lGnAjOeNSyLg7ieKvJcIkXfWmp4BsVIc77rOuLWzFA
 P+65x7Nbhh/0RS6gLV6ZNoWSy6Mq8r8+XZ3eKClx9wKACeJ1kh1lZW81+kNB40Mloy8NV7GSL7lBD
 MjwE70Aw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mQsRv-0005Xx-QQ; Thu, 16 Sep 2021 17:33:15 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 1/8] gpu: host1x: Add context bus
Date: Thu, 16 Sep 2021 17:32:55 +0300
Message-Id: <20210916143302.2024933-2-mperttunen@nvidia.com>
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

The context bus is a "dummy" bus that contains struct devices that
correspond to IOMMU contexts assigned through Host1x to processes.

Even when host1x itself is built as a module, the bus is registered
in built-in code so that the built-in ARM SMMU driver is able to
reference it.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/Makefile               |  3 +--
 drivers/gpu/host1x/Kconfig         |  5 +++++
 drivers/gpu/host1x/Makefile        |  1 +
 drivers/gpu/host1x/context_bus.c   | 31 ++++++++++++++++++++++++++++++
 include/linux/host1x_context_bus.h | 15 +++++++++++++++
 5 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 835c88318cec..8997f0096545 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -2,7 +2,6 @@
 # drm/tegra depends on host1x, so if both drivers are built-in care must be
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
-obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
-obj-y			+= drm/ vga/
+obj-y			+= host1x/ drm/ vga/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 6dab94adf25e..8546dde3acc8 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -1,7 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+config TEGRA_HOST1X_CONTEXT_BUS
+	bool
+
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	select TEGRA_HOST1X_CONTEXT_BUS
 	select IOMMU_IOVA
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index d2b6f7de0498..c891a3e33844 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -18,3 +18,4 @@ host1x-y = \
 	hw/host1x07.o
 
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
+obj-$(CONFIG_TEGRA_HOST1X_CONTEXT_BUS) += context_bus.o
diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
new file mode 100644
index 000000000000..2625914f3c7d
--- /dev/null
+++ b/drivers/gpu/host1x/context_bus.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, NVIDIA Corporation.
+ */
+
+#include <linux/device.h>
+#include <linux/of.h>
+
+struct bus_type host1x_context_device_bus_type = {
+	.name = "host1x-context",
+};
+EXPORT_SYMBOL(host1x_context_device_bus_type);
+
+static int __init host1x_context_device_bus_init(void)
+{
+	int err;
+
+	if (!of_machine_is_compatible("nvidia,tegra186") &&
+	    !of_machine_is_compatible("nvidia,tegra194") &&
+	    !of_machine_is_compatible("nvidia,tegra234"))
+		return 0;
+
+	err = bus_register(&host1x_context_device_bus_type);
+	if (err < 0) {
+		pr_err("bus type registration failed: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+postcore_initcall(host1x_context_device_bus_init);
diff --git a/include/linux/host1x_context_bus.h b/include/linux/host1x_context_bus.h
new file mode 100644
index 000000000000..72462737a6db
--- /dev/null
+++ b/include/linux/host1x_context_bus.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021, NVIDIA Corporation. All rights reserved.
+ */
+
+#ifndef __LINUX_HOST1X_CONTEXT_BUS_H
+#define __LINUX_HOST1X_CONTEXT_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
+extern struct bus_type host1x_context_device_bus_type;
+#endif
+
+#endif
-- 
2.32.0

