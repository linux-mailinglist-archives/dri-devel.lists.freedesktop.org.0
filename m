Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3BA0509E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B640D10E0EA;
	Wed,  8 Jan 2025 02:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbFiYDo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819EE10E0EA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303306; x=1767839306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ay7CEjqJqMuReuELrej+UP2nTbpuB1cB4m2GMizgYL8=;
 b=PbFiYDo3rsRdlmzNM6pCQCFWW2Op3NB7i0vx5UxZCSwDQmi67k1Pr/s0
 nhBdOuos/5du4HR2BMTSSov4dpf/AlLRVFQqinUta/1Gg5DG0U/gX2Bwy
 1EjPMrsA5iwQzXoV3/I2aq4Maw/an6JqNulJ6ODw4z3NdxDfDC99DMHdm
 qWl5zr85X+xskmu0jnOW1WSpjPAiBVOjYefjLdibn35k7r1QTiMpd3mp7
 dBmnV0qfIHAKmyuup7Ofzn3JYk3jEcmHCz+ANKRmm02MZkDHSy9skYHR5
 QjMNrfxt+CC+VFHN06cyy+RiE8IvFvI9ieROMFHSdsAOyNOzuEkljB2SY Q==;
X-CSE-ConnectionGUID: BJD7+gPsRNueGzPXjXTs6w==
X-CSE-MsgGUID: yiIW1GW1T6GNrZ7PQAUM/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010432"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010432"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:28:25 -0800
X-CSE-ConnectionGUID: IjX2KD4DRvWn2y2lDgL/lg==
X-CSE-MsgGUID: ns1dDh5TRwO03YmXd3mg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793527"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:28:20 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com
Cc: yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Date: Tue,  7 Jan 2025 22:27:07 +0800
Message-Id: <20250107142719.179636-1-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

This series is based on an earlier kvm-coco-queue version (v6.12-rc2)
which includes all basic TDX patches.

The series is to start the early stage discussion of the private MMIO
handling for Coco-VM, which is part of the Private Device
Assignment (aka TEE-IO, TIO) enabling. There are already some
disscusion about the context of TIO:

https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/
https://lore.kernel.org/all/20240823132137.336874-1-aik@amd.com/

Private MMIOs are resources owned by Private assigned devices. Like
private memory, they are also not intended to be accessed by host, only
accessible by Coco-VM via some secondary MMUs (e.g. Secure EPT). This
series is for KVM to map these MMIO resources without firstly mapping
into the host. For this purpose, This series uses the FD based MMIO
resources for secure mapping, and the dma-buf is chosen as the FD based
backend, just like guest_memfd for private memory. Patch 6 in this
series has more detailed description.


Patch 1 changes dma-buf core, expose a new kAPI for importers to get
dma-buf's PFN without DMA mapping. KVM could use this kAPI to build
GPA -> HPA mapping in KVM MMU.

Patch 2-4 are from Jason & Vivek, allow vfio-pci to export MMIO
resources as dma-buf. The original series are for native P2P DMA and
focus on p2p DMA mapping opens. I removed these p2p DMA mapping code
just to focus the early stage discussion of private MMIO. The original
series:

https://lore.kernel.org/all/0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
https://lore.kernel.org/kvm/20240624065552.1572580-1-vivek.kasireddy@intel.com/

Patch 5 is the implementation of get_pfn() callback for vfio dma-buf
exporter.

Patch 6-7 is about KVM supports the private MMIO memory slot backed by
vfio dma-buf.

Patch 8-10 is about how KVM verifies the user provided dma-buf fd
eligible for private MMIO slot.

Patch 11-12 is the example of how KVM TDX setup the Secure EPT for
private MMIO.


TODOs:

- Follow up the evolving of original VFIO dma-buf series.
- Follow up the evolving of basic TDX patches.


Vivek Kasireddy (3):
  vfio: Export vfio device get and put registration helpers
  vfio/pci: Share the core device pointer while invoking feature
    functions
  vfio/pci: Allow MMIO regions to be exported through dma-buf

Xu Yilun (9):
  dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
  vfio/pci: Support get_pfn() callback for dma-buf
  KVM: Support vfio_dmabuf backed MMIO region
  KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
  vfio/pci: Create host unaccessible dma-buf for private device
  vfio/pci: Export vfio dma-buf specific info for importers
  KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
  KVM: x86/mmu: Export kvm_is_mmio_pfn()
  KVM: TDX: Implement TDX specific private MMIO map/unmap for SEPT

 Documentation/virt/kvm/api.rst     |   7 +
 arch/x86/include/asm/tdx.h         |   3 +
 arch/x86/kvm/mmu.h                 |   1 +
 arch/x86/kvm/mmu/mmu.c             |  25 ++-
 arch/x86/kvm/mmu/spte.c            |   3 +-
 arch/x86/kvm/vmx/tdx.c             |  57 +++++-
 arch/x86/virt/vmx/tdx/tdx.c        |  52 ++++++
 arch/x86/virt/vmx/tdx/tdx.h        |   3 +
 drivers/dma-buf/dma-buf.c          |  90 ++++++++--
 drivers/vfio/device_cdev.c         |   9 +-
 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/dma_buf.c         | 273 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_config.c |  22 ++-
 drivers/vfio/pci/vfio_pci_core.c   |  64 +++++--
 drivers/vfio/pci/vfio_pci_priv.h   |  27 +++
 drivers/vfio/pci/vfio_pci_rdwr.c   |   3 +
 drivers/vfio/vfio_main.c           |   2 +
 include/linux/dma-buf.h            |  13 ++
 include/linux/kvm_host.h           |  25 ++-
 include/linux/vfio.h               |  22 +++
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/kvm.h           |   1 +
 include/uapi/linux/vfio.h          |  34 +++-
 virt/kvm/Kconfig                   |   6 +
 virt/kvm/Makefile.kvm              |   1 +
 virt/kvm/kvm_main.c                |  32 +++-
 virt/kvm/kvm_mm.h                  |  19 ++
 virt/kvm/vfio_dmabuf.c             | 151 ++++++++++++++++
 28 files changed, 896 insertions(+), 51 deletions(-)
 create mode 100644 drivers/vfio/pci/dma_buf.c
 create mode 100644 virt/kvm/vfio_dmabuf.c

-- 
2.25.1

