Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB9AC77ED
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C1510E6F5;
	Thu, 29 May 2025 05:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwlUme9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023A810E6F5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497448; x=1780033448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fX5qqs3UQZaEe4IJmzBqdZFhYNfZDQ/NDnIIGo01peQ=;
 b=cwlUme9Kb8JYPIPRHzQgDcFGoHQ4aRogCUE7j/pKAu0n7YEp0Vudal2Z
 hXW/xCrEwUfNnPLLOyNag7X/y0LnfUP9A10HUlFtnTbxTDGtYVmev3bFT
 5hTHjLVTFAyG22EIMdlgS0FC9Jbk/Up09ZXDYNTxo4JrppbFJwopepH4G
 FnYr7m3UjEZ7IDigf9GKictIKsFwc+hRS6AXEijFc6WJckG6WYNxezC6E
 HW4vgiCdn1K6OiFgo1Yml8B0VuUOdAXOUDOFirAZ5rvFNT4EsVUVd/w8D
 2NaH9Y04chHXtSGqv8JBx6AlRX6iu3vkTpTno6PPb8Zp8j+s1hRjF8mYi w==;
X-CSE-ConnectionGUID: a7veHXcDRSyFPPyikjsRHg==
X-CSE-MsgGUID: NSJHXJBqTm2wqx4yaMt2oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963348"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963348"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:08 -0700
X-CSE-ConnectionGUID: 1F/EBU3yRRas2DxnaeDH7Q==
X-CSE-MsgGUID: 2AH8AJopSJGE4iXmfSrbjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443612"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:01 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 23/30] coco/tdx_tsm: Introduce a "tdx" subsystem and "tsm"
 device
Date: Thu, 29 May 2025 13:35:06 +0800
Message-Id: <20250529053513.1592088-24-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Dan Williams <dan.j.williams@intel.com>

TDX depends on a platform firmware module that is invoked via
instructions similar to vmenter (i.e. enter into a new privileged
"root-mode" context to manage private memory and private device
mechanisms). It is a software construct that depends on the CPU vmxon
state to enable invocation of TDX-module ABIs. Unlike other
Trusted Execution Environment (TEE) platform implementations that employ
a firmware module running on a PCI device with an MMIO mailbox for
communication, TDX has no hardware device to point to as the "TSM".

The "/sys/devices/virtual" hierarchy is intended for "software
constructs which need sysfs interface", which aligns with what TDX
needs.

The new tdx_subsys will export global attributes populated by the
TDX-module "sysinfo". A tdx_tsm device is published on this bus to
enable a typical driver model for the low level "TEE Security Manager"
(TSM) flows that talk TDISP to capable PCIe devices.
For now, this is only the base tdx_subsys and tdx_tsm device
registration with attribute definition and TSM driver to follow later.

Recall that TDX guest would also use TSM to authenticate assigned
devices and it surely needs a virtual software construct to enable guest
side TSM flow. A tdx_guest_tsm device would be published on tdx_subsys
to indicate the guest is capable of communicate to firmware for TIO via
TDVMCALLs.

Create some common helpers for TDX host/guest to create software devices
on tdx_subsys.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 arch/x86/Kconfig                     |  1 +
 drivers/virt/coco/host/Kconfig       |  3 ++
 drivers/virt/coco/host/Makefile      |  2 +
 drivers/virt/coco/host/tdx_tsm_bus.c | 70 ++++++++++++++++++++++++++++
 include/linux/tdx_tsm_bus.h          | 17 +++++++
 5 files changed, 93 insertions(+)
 create mode 100644 drivers/virt/coco/host/tdx_tsm_bus.c
 create mode 100644 include/linux/tdx_tsm_bus.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6..fb6cc23b02e3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1925,6 +1925,7 @@ config INTEL_TDX_HOST
 	depends on CONTIG_ALLOC
 	depends on !KEXEC_CORE
 	depends on X86_MCE
+	select TDX_TSM_BUS
 	help
 	  Intel Trust Domain Extensions (TDX) protects guest VMs from malicious
 	  host and certain physical attacks.  This option enables necessary TDX
diff --git a/drivers/virt/coco/host/Kconfig b/drivers/virt/coco/host/Kconfig
index 4fbc6ef34f12..c04b0446cd5f 100644
--- a/drivers/virt/coco/host/Kconfig
+++ b/drivers/virt/coco/host/Kconfig
@@ -4,3 +4,6 @@
 #
 config TSM
 	tristate
+
+config TDX_TSM_BUS
+	bool
diff --git a/drivers/virt/coco/host/Makefile b/drivers/virt/coco/host/Makefile
index be0aba6007cd..ce1ab15ac8d3 100644
--- a/drivers/virt/coco/host/Makefile
+++ b/drivers/virt/coco/host/Makefile
@@ -4,3 +4,5 @@
 
 obj-$(CONFIG_TSM) += tsm.o
 tsm-y := tsm-core.o
+
+obj-$(CONFIG_TDX_TSM_BUS) += tdx_tsm_bus.o
diff --git a/drivers/virt/coco/host/tdx_tsm_bus.c b/drivers/virt/coco/host/tdx_tsm_bus.c
new file mode 100644
index 000000000000..9f4875ebf032
--- /dev/null
+++ b/drivers/virt/coco/host/tdx_tsm_bus.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024 Intel Corporation. All rights reserved. */
+
+#include <linux/device.h>
+#include <linux/tdx_tsm_bus.h>
+
+static struct tdx_tsm_dev *alloc_tdx_tsm_dev(void)
+{
+	struct tdx_tsm_dev *tsm = kzalloc(sizeof(*tsm), GFP_KERNEL);
+	struct device *dev;
+
+	if (!tsm)
+		return ERR_PTR(-ENOMEM);
+
+	dev = &tsm->dev;
+	dev->bus = &tdx_subsys;
+	device_initialize(dev);
+
+	return tsm;
+}
+
+DEFINE_FREE(tdx_tsm_dev_put, struct tdx_tsm_dev *,
+	if (!IS_ERR_OR_NULL(_T)) put_device(&_T->dev))
+struct tdx_tsm_dev *init_tdx_tsm_dev(const char *name)
+{
+	struct device *dev;
+	int ret;
+
+	struct tdx_tsm_dev *tsm __free(tdx_tsm_dev_put) = alloc_tdx_tsm_dev();
+	if (IS_ERR(tsm))
+		return tsm;
+
+	dev = &tsm->dev;
+	ret = dev_set_name(dev, name);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = device_add(dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return no_free_ptr(tsm);
+}
+EXPORT_SYMBOL_GPL(init_tdx_tsm_dev);
+
+static int tdx_match(struct device *dev, const struct device_driver *drv)
+{
+	if (!strcmp(dev_name(dev), drv->name))
+		return 1;
+
+	return 0;
+}
+
+static int tdx_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	return add_uevent_var(env, "MODALIAS=%s", dev_name(dev));
+}
+
+const struct bus_type tdx_subsys = {
+	.name = "tdx",
+	.match = tdx_match,
+	.uevent = tdx_uevent,
+};
+EXPORT_SYMBOL_GPL(tdx_subsys);
+
+static int tdx_tsm_dev_init(void)
+{
+	return subsys_virtual_register(&tdx_subsys, NULL);
+}
+arch_initcall(tdx_tsm_dev_init);
diff --git a/include/linux/tdx_tsm_bus.h b/include/linux/tdx_tsm_bus.h
new file mode 100644
index 000000000000..ef7af97ba230
--- /dev/null
+++ b/include/linux/tdx_tsm_bus.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright(c) 2024 Intel Corporation. */
+
+#ifndef __TDX_TSM_BUS_H
+#define __TDX_TSM_BUS_H
+
+#include <linux/device.h>
+
+struct tdx_tsm_dev {
+	struct device dev;
+};
+
+extern const struct bus_type tdx_subsys;
+
+struct tdx_tsm_dev *init_tdx_tsm_dev(const char *name);
+
+#endif
-- 
2.25.1

