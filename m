Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B5AC77F4
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3167810E6F9;
	Thu, 29 May 2025 05:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9z7fR3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614E10E6FA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497474; x=1780033474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cPetbcObK2zQM71pDawhMP63WT3poHVOOSqqFGJk3PI=;
 b=H9z7fR3g/3AZe/Wi1Czgxs6jJVmrZndIl+Xq7pB8CzOAKWmImIpCdWjG
 uwIgOOJgY3O8JL3ldKvjgF4BLwIv+MfVbcQYZV18/5Xs6UcmNtqi4qmpB
 iCTSZCZWmiuBcMlCN+4A5LHbs/vlDYUdMIGA6jPLbak/HDc8lkfKFZOyo
 FO+Ox7VuZDpMU7/wbiUDR9n64ySL8nCWoLVL6yNA3A83MB5RzXqC1eH6B
 DJyRHp2iJau36YwoirR1bbjFgVcPDCjZ1cAVBn5AvdEY4tcGpwtmJDOj7
 bFqbcLG6C7/gwAGTuDtgwlRVWO2u5qsamAbgwTLodUGviblJsrSw0Ee4I Q==;
X-CSE-ConnectionGUID: TX/oUobwTnGaMyBOuTXSmA==
X-CSE-MsgGUID: EM5INdS6TWmVSqd4rVnwKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963448"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:34 -0700
X-CSE-ConnectionGUID: k5KQxk77QCufk/x1v32kzg==
X-CSE-MsgGUID: d4qoKWHwSSek1z6G/x67rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443639"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:27 -0700
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
Subject: [RFC PATCH 27/30] PCI/TSM: Add PCI driver callbacks to handle TSM
 requirements
Date: Thu, 29 May 2025 13:35:10 +0800
Message-Id: <20250529053513.1592088-28-yilun.xu@linux.intel.com>
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

Add optional PCI driver callbacks to notify TSM events. For now, these
handlers may be called during pci_tsm_unbind(). By calling these
handlers, TSM driver askes for external collaboration to finish entire
TSM unbind flow.

If platform TSM driver could finish TSM bind/unbind all by itself, don't
call these handlers.

Host may need to configure various system components according to
platform trusted firmware's requirements. E.g. for Intel TDX Connect,
host should do private MMIO mapping in S-EPT, trusted DMA setup, device
ownership claiming and device TDISP state transition. Some operations are
out of control of PCI TSM, so need collaboration by external components
like IOMMU driver, KVM.

Further more, trusted firmware may enforce executing these operations
in a fixed sequence. E.g. Intel TDX Connect enforces the following
sequences for TSM unbind:

  1. STOP TDI via TDISP message STOP_INTERFACE
  2. Private MMIO unmap from Secure EPT
  3. Trusted Device Context Table cleanup for the TDI
  4. TDI ownership reclaim and metadata free

PCI TSM could do Step 1 and 4, but need KVM for Step 2 and IOMMU driver
for Step 3. While it is possible TSM provides finer grained APIs like
tdi_stop() & tdi_free(), and the caller ensures the sequence, it is
better these specific enforcement could be managed in platform TSM
driver. By introducing TSM handlers, platform TSM driver controls the
operation sequence and notify other components to do the real work.

Currently add 3 callbacks for TDX Connect. disable_mmio() is for
VFIO to invalidate MMIO so that KVM could unmap them from S-EPT.
recover_mmio() is to re-validate MMIO so that KVM could map them
again for shared assigned device. disable_trusted_dma() is to cleanup
trusted IOMMU setup.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 include/linux/pci-tsm.h | 7 +++++++
 include/linux/pci.h     | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 737767f8a9c5..ed549724eb5b 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -157,6 +157,13 @@ struct pci_tsm_ops {
 	int (*accept)(struct pci_dev *pdev);
 };
 
+/* pci drivers callbacks for TSM */
+struct pci_tsm_handlers {
+	void (*disable_mmio)(struct pci_dev *dev);
+	void (*recover_mmio)(struct pci_dev *dev);
+	void (*disable_trusted_dma)(struct pci_dev *dev);
+};
+
 enum pci_doe_proto {
 	PCI_DOE_PROTO_CMA = 1,
 	PCI_DOE_PROTO_SSESSION = 2,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 5f37957da18f..4f768b4658e8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -545,6 +545,7 @@ struct pci_dev {
 #endif
 #ifdef CONFIG_PCI_TSM
 	struct pci_tsm *tsm;		/* TSM operation state */
+	void *trusted_dma_owner;
 #endif
 	u16		acs_cap;	/* ACS Capability offset */
 	u8		supported_speeds; /* Supported Link Speeds Vector */
@@ -957,6 +958,7 @@ struct module;
  * @sriov_get_vf_total_msix: PF driver callback to get the total number of
  *              MSI-X vectors available for distribution to the VFs.
  * @err_handler: See Documentation/PCI/pci-error-recovery.rst
+ * @tsm_handler: Optional driver callbacks to handle TSM requirements.
  * @groups:	Sysfs attribute groups.
  * @dev_groups: Attributes attached to the device that will be
  *              created once it is bound to the driver.
@@ -982,6 +984,7 @@ struct pci_driver {
 	int  (*sriov_set_msix_vec_count)(struct pci_dev *vf, int msix_vec_count); /* On PF */
 	u32  (*sriov_get_vf_total_msix)(struct pci_dev *pf);
 	const struct pci_error_handlers *err_handler;
+	struct pci_tsm_handlers *tsm_handler;
 	const struct attribute_group **groups;
 	const struct attribute_group **dev_groups;
 	struct device_driver	driver;
-- 
2.25.1

