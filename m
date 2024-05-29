Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF28D2C80
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9576113108;
	Wed, 29 May 2024 05:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFUfN7yV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46964112324
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960971; x=1748496971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jeXpPTPjJIlOE9JrMGFrdmPdU1WHNyP76S68yxLZIYk=;
 b=TFUfN7yVG1bwnqYmHQKOxKfxEqRMRg5egyF7l6KfmtPRHs55CclNZ5s+
 SrccswOAUMcYZ0UjhmtfjMoTGM1R04TPdGlzzl+TLUdWwiptPY1UUDlf5
 bfymRIMG48LDcr5NElJhi03g129yUbqliq5nZpJoNJxNEtsqwD1+Z2QgV
 ech6+tNu7cHlHM4ITIujmhsUiP+2yGfK34ArLTcATVs4sPAHU4Swbsisi
 OKxzo0nQWmvWmL2dWmi9HfP+OXgY3aS1rMfbHYUgHUqzMJpZJpU+4OHve
 eFs33WN4ArkNCZUqq3YY8/fK2JHYqYsuq1okPpJYnulvDQmK5xufwlEBi Q==;
X-CSE-ConnectionGUID: ua24I69kSLmccf9msL8+MQ==
X-CSE-MsgGUID: xo69wXciQY+Ggl/3owv0Mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13568737"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13568737"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:35:02 -0700
X-CSE-ConnectionGUID: COa8Vg/1TJ+DOYohn2WZPQ==
X-CSE-MsgGUID: kjXbaTeoRi+UtA/joP+AHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257413"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:34:56 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 00/20] iommu: Refactoring domain allocation interface
Date: Wed, 29 May 2024 13:32:30 +0800
Message-Id: <20240529053250.91284-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

The IOMMU subsystem has undergone some changes, including the removal
of iommu_ops from the bus structure. Consequently, the existing domain
allocation interface, which relies on a bus type argument, is no longer
relevant:

    struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)

This series is designed to refactor the use of this interface. It
proposes two new interfaces to replace iommu_domain_alloc():

- iommu_user_domain_alloc(): This interface is intended for allocating
  iommu domains managed by userspace for device passthrough scenarios,
  such as those used by iommufd, vfio, and vdpa. It clearly indicates
  that the domain is for user-managed device DMA.

  If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
  this interface will rollback to the generic paging domain allocation.

- iommu_paging_domain_alloc(): This interface is for allocating iommu
  domains managed by kernel drivers for kernel DMA purposes. It takes a
  device pointer as a parameter, which better reflects the current
  design of the IOMMU subsystem.

The majority of device drivers currently using iommu_domain_alloc() do
so to allocate a domain for a specific device and then attach that
domain to the device. These cases can be straightforwardly migrated to
the new interfaces.

However, there are some drivers with more complex use cases that do
not fit neatly into this new scheme. For example:

$ git grep "= iommu_domain_alloc"
arch/arm/mm/dma-mapping.c:      mapping->domain = iommu_domain_alloc(bus);
drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = iommu_domain_alloc(private->iommu_dev->bus);
drivers/gpu/drm/tegra/drm.c:            tegra->domain = iommu_domain_alloc(&platform_bus_type);
drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain = iommu_domain_alloc(dev->bus);

This series leave those cases unchanged and keep iommu_domain_alloc()
for their usage. But new drivers should not use it anymore.

The whole series is also available on GitHub:
https://github.com/LuBaolu/intel-iommu/commits/iommu-domain-allocation-refactor-v1

Lu Baolu (20):
  iommu: Add iommu_user_domain_alloc() interface
  iommufd: Use iommu_user_domain_alloc()
  vfio/type1: Use iommu_paging_domain_alloc()
  vhost-vdpa: Use iommu_user_domain_alloc()
  iommu: Add iommu_paging_domain_alloc() interface
  drm/msm: Use iommu_paging_domain_alloc()
  drm/nouveau/tegra: Use iommu_paging_domain_alloc()
  gpu: host1x: Use iommu_paging_domain_alloc()
  media: nvidia: tegra: Use iommu_paging_domain_alloc()
  media: venus: firmware: Use iommu_paging_domain_alloc()
  ath10k: Use iommu_paging_domain_alloc()
  wifi: ath11k: Use iommu_paging_domain_alloc()
  remoteproc: Use iommu_paging_domain_alloc()
  soc/fsl/qbman: Use iommu_paging_domain_alloc()
  iommu/vt-d: Add helper to allocate paging domain
  iommu/vt-d: Add domain_alloc_paging support
  iommu/vt-d: Simplify compatibility check for identity domain
  iommu/vt-d: Enhance compatibility check for paging domain attach
  iommu/vt-d: Remove domain_update_iommu_cap()
  iommu/vt-d: Remove domain_update_iommu_superpage()

 include/linux/iommu.h                         |  12 +
 drivers/gpu/drm/msm/msm_iommu.c               |   8 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    |   4 +-
 drivers/gpu/host1x/dev.c                      |   6 +-
 drivers/iommu/intel/iommu.c                   | 319 ++++++++----------
 drivers/iommu/intel/pasid.c                   |  28 +-
 drivers/iommu/iommu.c                         |  62 ++++
 drivers/iommu/iommufd/hw_pagetable.c          |  20 +-
 .../media/platform/nvidia/tegra-vde/iommu.c   |   6 +-
 drivers/media/platform/qcom/venus/firmware.c  |   6 +-
 drivers/net/wireless/ath/ath10k/snoc.c        |   6 +-
 drivers/net/wireless/ath/ath11k/ahb.c         |   6 +-
 drivers/remoteproc/remoteproc_core.c          |   6 +-
 drivers/soc/fsl/qbman/qman_portal.c           |   4 +-
 drivers/vfio/vfio_iommu_type1.c               |   7 +-
 drivers/vhost/vdpa.c                          |  11 +-
 16 files changed, 253 insertions(+), 258 deletions(-)

-- 
2.34.1

