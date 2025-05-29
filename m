Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3469EAC77EE
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4C410E6F8;
	Thu, 29 May 2025 05:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeM/MeuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988D10E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497455; x=1780033455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGnM1wTm2CDlqkz04ggD8fGVlHhqahSjdQmqrS9B/ac=;
 b=jeM/MeuO50jSGCUlxK5Bn/D5pk9l1bBQn8Bw3uRyJimoFxmInOlKbv8L
 YeyP5RUHb8bXIHIovaEAGPmqW0+WcsvEtygLtCWOrRU183NNhQfs1Whrn
 qZXBr3aLYf7i/0Tu3XRPemyEaWFtKDQM6ATogs8ToAhS5CEHT1/+SKdVq
 cK0FKBI77RNYWHTannjdthzOVQJso35Sk5iAducfEIwMRwdq/RCAbKJFo
 qYBUBAm8W+9yeOeAQA6jrdYN1pxvGGG370+cMKHZvKIVz1YHTHYZgEOik
 yEApxaoelwMrWFnkHqABiK71AHxX1nY9/n45c79MiUZZNkjj0P/74v4eq A==;
X-CSE-ConnectionGUID: go7MhNmoSQCFGriyCjlFzg==
X-CSE-MsgGUID: IAUOKx3dRSiny/NGQcM8Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963369"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963369"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:14 -0700
X-CSE-ConnectionGUID: 806Y5ep0R6GEoE6kOIU/IA==
X-CSE-MsgGUID: gjCt7esHTueK5oh0lHvLXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443616"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:07 -0700
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
Subject: [RFC PATCH 24/30] coco/tdx_tsm: TEE Security Manager driver for TDX
Date: Thu, 29 May 2025 13:35:07 +0800
Message-Id: <20250529053513.1592088-25-yilun.xu@linux.intel.com>
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

Recall that a TEE Security Manager (TSM) is a platform agent that speaks
the TEE Device Interface Security Protocol (TDISP) to PCIe devices and
manages private memory resources for the platform. The tdx_tsm driver
loads against a device of the same name registered at TDX Module
initialization time. The device lives on the "tdx" bus which is a
virtual subsystem that hosts the TDX module sysfs ABI.

It allows for device-security enumeration and initialization flows to be
deferred from TDX Module init time. Crucially, when / if TDX Module
init moves earlier in x86 initialization flow this driver is still
guaranteed to run after IOMMU and PCI init (i.e. subsys_initcall() vs
device_initcall()).

The ability to unload the module, or unbind the driver is also useful
for debug and coarse grained transitioning between PCI TSM operation and
PCI CMA operation (native kernel PCI device authentication).

For now this is the basic boilerplate with sysfs attributes and
operation flows to be added later.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/virt/coco/host/Kconfig   |   7 ++
 drivers/virt/coco/host/Makefile  |   1 +
 drivers/virt/coco/host/tdx_tsm.c | 189 +++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 drivers/virt/coco/host/tdx_tsm.c

diff --git a/drivers/virt/coco/host/Kconfig b/drivers/virt/coco/host/Kconfig
index c04b0446cd5f..f2b05b15a24e 100644
--- a/drivers/virt/coco/host/Kconfig
+++ b/drivers/virt/coco/host/Kconfig
@@ -7,3 +7,10 @@ config TSM
 
 config TDX_TSM_BUS
 	bool
+
+config TDX_TSM
+	depends on INTEL_TDX_HOST
+	select TDX_TSM_BUS
+	select PCI_TSM
+	select TSM
+	tristate "TDX TEE Security Manager Driver"
diff --git a/drivers/virt/coco/host/Makefile b/drivers/virt/coco/host/Makefile
index ce1ab15ac8d3..38ee9c96b921 100644
--- a/drivers/virt/coco/host/Makefile
+++ b/drivers/virt/coco/host/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_TSM) += tsm.o
 tsm-y := tsm-core.o
 
 obj-$(CONFIG_TDX_TSM_BUS) += tdx_tsm_bus.o
+obj-$(CONFIG_TDX_TSM) += tdx_tsm.o
diff --git a/drivers/virt/coco/host/tdx_tsm.c b/drivers/virt/coco/host/tdx_tsm.c
new file mode 100644
index 000000000000..72f3705fe7bb
--- /dev/null
+++ b/drivers/virt/coco/host/tdx_tsm.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024 Intel Corporation. All rights reserved. */
+#include <linux/bitfield.h>
+#include <linux/pci.h>
+#include <linux/pci-tsm.h>
+#include <linux/tdx_tsm_bus.h>
+#include <linux/tsm.h>
+#include <asm/tdx.h>
+
+#define TDISP_FUNC_ID		GENMASK(15, 0)
+#define TDISP_FUNC_ID_SEGMENT		GENMASK(23, 16)
+#define TDISP_FUNC_ID_SEG_VALID		BIT(24)
+
+static inline u32 tdisp_func_id(struct pci_dev *pdev)
+{
+	u32 func_id;
+
+	func_id = FIELD_PREP(TDISP_FUNC_ID_SEGMENT, pci_domain_nr(pdev->bus));
+	if (func_id)
+		func_id |= TDISP_FUNC_ID_SEG_VALID;
+	func_id |= FIELD_PREP(TDISP_FUNC_ID,
+			      PCI_DEVID(pdev->bus->number, pdev->devfn));
+
+	return func_id;
+}
+
+struct tdx_tsm {
+	struct pci_tsm_pf0 pci;
+	u32 func_id;
+};
+
+static struct tdx_tsm *to_tdx_tsm(struct pci_tsm *tsm)
+{
+	return container_of(tsm, struct tdx_tsm, pci.tsm);
+}
+
+struct tdx_tdi {
+	struct pci_tdi tdi;
+	u32 func_id;
+};
+
+static struct tdx_tdi *to_tdx_tdi(struct pci_tdi *tdi)
+{
+	return container_of(tdi, struct tdx_tdi, tdi);
+}
+
+static struct pci_tdi *tdx_tsm_bind(struct pci_dev *pdev,
+				    struct pci_dev *dsm_dev,
+				    struct kvm *kvm, u64 tdi_id)
+{
+	struct tdx_tdi *ttdi __free(kfree) =
+		kzalloc(sizeof(*ttdi), GFP_KERNEL);
+	if (!ttdi)
+		return NULL;
+
+	ttdi->func_id = tdisp_func_id(pdev);
+	ttdi->tdi.pdev = pdev;
+	ttdi->tdi.dsm_dev = pci_dev_get(dsm_dev);
+	ttdi->tdi.kvm = kvm;
+
+	/*TODO: TDX Module required operations */
+
+	return &no_free_ptr(ttdi)->tdi;
+}
+
+static void tdx_tsm_unbind(struct pci_tdi *tdi)
+{
+	struct tdx_tdi *ttdi = to_tdx_tdi(tdi);
+
+	/*TODO: TDX Module required operations */
+
+	pci_dev_put(ttdi->tdi.dsm_dev);
+	kfree(ttdi);
+}
+
+static int tdx_tsm_guest_req(struct pci_dev *pdev,
+			     struct pci_tsm_guest_req_info *info)
+{
+	return -ENXIO;
+}
+
+static int tdx_tsm_connect(struct pci_dev *pdev)
+{
+	return -ENXIO;
+}
+
+static void tdx_tsm_disconnect(struct pci_dev *pdev)
+{
+}
+
+static struct pci_tsm *tdx_tsm_pci_probe(struct pci_dev *pdev)
+{
+	if (is_pci_tsm_pf0(pdev)) {
+		int rc;
+
+		struct tdx_tsm *ttsm __free(kfree) =
+			kzalloc(sizeof(*ttsm), GFP_KERNEL);
+		if (!ttsm)
+			return NULL;
+
+		rc = pci_tsm_pf0_initialize(pdev, &ttsm->pci);
+		if (rc)
+			return NULL;
+
+		ttsm->func_id = tdisp_func_id(pdev);
+
+		pci_info(pdev, "PF tsm enabled\n");
+		return &no_free_ptr(ttsm)->pci.tsm;
+	}
+
+	/* for VF and MFD */
+	struct pci_tsm *pci_tsm __free(kfree) =
+		kzalloc(sizeof(*pci_tsm), GFP_KERNEL);
+	if (!pci_tsm)
+		return NULL;
+
+	pci_tsm_initialize(pdev, pci_tsm);
+
+	pci_info(pdev, "VF/MFD tsm enabled\n");
+	return no_free_ptr(pci_tsm);
+}
+
+static void tdx_tsm_pci_remove(struct pci_tsm *tsm)
+{
+	if (is_pci_tsm_pf0(tsm->pdev)) {
+		struct tdx_tsm *ttsm = to_tdx_tsm(tsm);
+
+		pci_info(tsm->pdev, "PF tsm disabled\n");
+		kfree(ttsm);
+
+		return;
+	}
+
+	/* for VF and MFD */
+	kfree(tsm);
+}
+
+static const struct pci_tsm_ops tdx_pci_tsm_ops = {
+	.probe = tdx_tsm_pci_probe,
+	.remove = tdx_tsm_pci_remove,
+	.connect = tdx_tsm_connect,
+	.disconnect = tdx_tsm_disconnect,
+	.bind = tdx_tsm_bind,
+	.unbind = tdx_tsm_unbind,
+	.guest_req = tdx_tsm_guest_req,
+};
+
+static void unregister_tsm(void *tsm_core)
+{
+	tsm_unregister(tsm_core);
+}
+
+static int tdx_tsm_probe(struct device *dev)
+{
+	struct tsm_core_dev *tsm_core;
+
+	tsm_core = tsm_register(dev, NULL, &tdx_pci_tsm_ops);
+	if (IS_ERR(tsm_core)) {
+		dev_err(dev, "failed to register TSM: (%pe)\n", tsm_core);
+		return PTR_ERR(tsm_core);
+	}
+
+	return devm_add_action_or_reset(dev, unregister_tsm, tsm_core);
+}
+
+static struct device_driver tdx_tsm_driver = {
+	.probe = tdx_tsm_probe,
+	.bus = &tdx_subsys,
+	.owner = THIS_MODULE,
+	.name = KBUILD_MODNAME,
+	.mod_name = KBUILD_MODNAME,
+};
+
+static int __init tdx_tsm_init(void)
+{
+	return driver_register(&tdx_tsm_driver);
+}
+module_init(tdx_tsm_init);
+
+static void __exit tdx_tsm_exit(void)
+{
+	driver_unregister(&tdx_tsm_driver);
+}
+module_exit(tdx_tsm_exit);
+
+MODULE_IMPORT_NS("TDX");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("tdx_tsm");
+MODULE_DESCRIPTION("TDX TEE Security Manager");
-- 
2.25.1

