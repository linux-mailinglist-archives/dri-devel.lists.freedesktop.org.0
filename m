Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9FAC77BF
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A0710E6E2;
	Thu, 29 May 2025 05:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGt49dQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A3C10E6E3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497303; x=1780033303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3W0vPV+xt1laPx1GlvtRmUQDEr7o4pclP/jpfWpkmNo=;
 b=PGt49dQMd838COPPbUMgCmbpxNBzY79Q2csobPlbJBdQRRTDc5/43YFl
 vQ/KcY3u43QwNc5Lh+OBpDfXEPS2dqiJF2vaweaAThPa8pPie9abDBgBJ
 v9r4vHjE+V2GUBHwYmtVvLfOCEhDn1K/YPVlIRIuU7k9JJzHgM3O6AjjG
 hppnHEXB7Fw2Pm0eYF05R44ISmB4w8bmyAu0oTN0tbLgIhlOhQkYbxUds
 t7pPOswtUPj6nsR+19vpMx2VdlRO5+vjkmsqOCEEbGlF8icSUcdnFYGRk
 sbd9JaytMDs9FrMFu8GmCmEyH8v/dxG79o/Jf1d2SRnXVQv/+KBKV0zXI g==;
X-CSE-ConnectionGUID: cHjBmFY2QoWPp8dor0cziw==
X-CSE-MsgGUID: Ogqmz4cUQGy8WEbxoRwaeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67962864"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67962864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:41:38 -0700
X-CSE-ConnectionGUID: RvMnXIMXTeecNPbA3HQ1fA==
X-CSE-MsgGUID: k9XihmlSTX+401gEmTOQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443212"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:41:31 -0700
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
Subject: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
Date: Thu, 29 May 2025 13:34:43 +0800
Message-Id: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series is the generic host side (KVM/VFIO/IOMMUFD) support for the
whole life cycle of private device assignment. It follows the
previously discussed flow chart [1], aim to better illustrate the
overall flow of private device assignment, find out and narrow down the
gaps of different vendors, and reach some common directions.

This series is based on Dan's Core TSM infrastructure series [2].  To
give a clear overview of what components are needed, it also includes
some existing WIP patchsets in community.

This series has 3 sections:

Patch 1 - 11 deal with the private MMIO mapping in KVM MMU via DMABUF.
Leverage Jason & Vivek's latest VFIO dmabuf series [3], see Patch 2 - 4.
The concern for get_pfn() kAPI [4] is not addressed so are marked as
HACK, will investigate later.

Patch 12 - 22 is about TSM Bind/Unbind/Guest request management in VFIO
& IOMMUFD. Picks some of Shameer's patch in [5], see Patch 12 & 14.

Patch 23 - 30 is a solution to meet the TDX specific sequence
enforcement on various device Unbind cases, including converting device
back to shared, hot unplug, TD destroy. Start with a tdx_tsm driver
prototype and finally implement the Unbind enforcement inside the
driver. To be honest it is still awkward to me, but I need help.

This series don't include the VMEXIT handle for GHCI/GHCB calls for
Bind/Unbind/Guest request, cause it involves vendor specific code. The
general idea is KVM should just pass these calls to QEMU, QEMU parses
out the command and call the newly introduced VFIO/IOMMUFD IOCTLs.

With additional TDX Connect specific patches (not published), passed
engineering test for trusted DMA in TD.

[1]: https://lore.kernel.org/all/aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050/
[2]: https://lore.kernel.org/all/20250516054732.2055093-1-dan.j.williams@intel.com/
[3]: https://lore.kernel.org/kvm/20250307052248.405803-1-vivek.kasireddy@intel.com/
[4]: https://lore.kernel.org/all/20250107142719.179636-1-yilun.xu@linux.intel.com/
[5]: https://lore.kernel.org/all/20250319173202.78988-3-shameerali.kolothum.thodi@huawei.com/


Alexey Kardashevskiy (1):
  iommufd/vdevice: Add TSM Guest request uAPI

Dan Williams (2):
  coco/tdx_tsm: Introduce a "tdx" subsystem and "tsm" device
  coco/tdx_tsm: TEE Security Manager driver for TDX

Shameer Kolothum (2):
  iommufd/device: Associate a kvm pointer to iommufd_device
  iommu/arm-smmu-v3-iommufd: Pass in kvm pointer to viommu_alloc

Vivek Kasireddy (3):
  vfio: Export vfio device get and put registration helpers
  vfio/pci: Share the core device pointer while invoking feature
    functions
  vfio/pci: Allow MMIO regions to be exported through dma-buf

Wu Hao (1):
  coco/tdx_tsm: Add connect()/disconnect() handlers prototype

Xu Yilun (21):
  HACK: dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
  fixup! vfio/pci: fix dma-buf revoke typo on reset
  HACK: vfio/pci: Support get_pfn() callback for dma-buf
  KVM: Support vfio_dmabuf backed MMIO region
  KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
  KVM: x86/mmu: Handle page fault for private MMIO
  vfio/pci: Export vfio dma-buf specific info for importers
  KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
  fixup! iommufd/selftest: Sync iommufd_device_bind() change to selftest
  fixup: iommu/selftest: Sync .viommu_alloc() change to selftest
  iommufd/viommu: track the kvm pointer & its refcount in viommu core
  iommufd/device: Add TSM Bind/Unbind for TIO support
  iommufd/viommu: Add trusted IOMMU configuration handlers for vdev
  vfio/pci: Add TSM TDI bind/unbind IOCTLs for TEE-IO support
  vfio/pci: Do TSM Unbind before zapping bars
  fixup! PCI/TSM: Change the guest request type definition
  coco/tdx_tsm: Add bind()/unbind()/guest_req() handlers prototype
  PCI/TSM: Add PCI driver callbacks to handle TSM requirements
  vfio/pci: Implement TSM handlers for MMIO
  iommufd/vdevice: Implement TSM handlers for trusted DMA
  coco/tdx_tsm: Manage TDX Module enforced operation sequences for
    Unbind

 Documentation/virt/kvm/api.rst                |   7 +
 arch/x86/Kconfig                              |   1 +
 arch/x86/kvm/mmu/mmu.c                        |  25 +-
 drivers/dma-buf/dma-buf.c                     |  87 +++-
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   1 +
 drivers/iommu/iommufd/device.c                |  89 +++-
 drivers/iommu/iommufd/iommufd_private.h       |  10 +
 drivers/iommu/iommufd/main.c                  |   3 +
 drivers/iommu/iommufd/selftest.c              |   3 +-
 drivers/iommu/iommufd/viommu.c                | 202 ++++++++-
 drivers/vfio/iommufd.c                        |  24 +-
 drivers/vfio/pci/Makefile                     |   1 +
 drivers/vfio/pci/vfio_pci.c                   |   1 +
 drivers/vfio/pci/vfio_pci_config.c            |  26 +-
 drivers/vfio/pci/vfio_pci_core.c              | 161 ++++++-
 drivers/vfio/pci/vfio_pci_dmabuf.c            | 411 ++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h              |  26 ++
 drivers/vfio/vfio_main.c                      |   2 +
 drivers/virt/coco/host/Kconfig                |  10 +
 drivers/virt/coco/host/Makefile               |   3 +
 drivers/virt/coco/host/tdx_tsm.c              | 328 ++++++++++++++
 drivers/virt/coco/host/tdx_tsm_bus.c          |  70 +++
 include/linux/dma-buf.h                       |  13 +
 include/linux/iommu.h                         |   4 +-
 include/linux/iommufd.h                       |  12 +-
 include/linux/kvm_host.h                      |  25 +-
 include/linux/pci-tsm.h                       |  19 +-
 include/linux/pci.h                           |   3 +
 include/linux/tdx_tsm_bus.h                   |  17 +
 include/linux/vfio.h                          |  27 ++
 include/linux/vfio_pci_core.h                 |   3 +
 include/uapi/linux/iommufd.h                  |  36 ++
 include/uapi/linux/kvm.h                      |   1 +
 include/uapi/linux/vfio.h                     |  67 +++
 virt/kvm/Kconfig                              |   6 +
 virt/kvm/Makefile.kvm                         |   1 +
 virt/kvm/kvm_main.c                           |  32 +-
 virt/kvm/kvm_mm.h                             |  19 +
 virt/kvm/vfio_dmabuf.c                        | 151 +++++++
 40 files changed, 1868 insertions(+), 60 deletions(-)
 create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c
 create mode 100644 drivers/virt/coco/host/tdx_tsm.c
 create mode 100644 drivers/virt/coco/host/tdx_tsm_bus.c
 create mode 100644 include/linux/tdx_tsm_bus.h
 create mode 100644 virt/kvm/vfio_dmabuf.c


base-commit: 88c473f04098a0f5ac6fbaceaad2daa842006b6a
-- 
2.25.1

