Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FEA8D5193
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 19:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EFA10E2BE;
	Thu, 30 May 2024 17:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FA2710E2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 17:59:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15C161424;
 Thu, 30 May 2024 10:59:45 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75BA43F641;
 Thu, 30 May 2024 10:59:18 -0700 (PDT)
Message-ID: <ac5d8f21-5fb7-4193-9a0b-cdaff39e8493@arm.com>
Date: Thu, 30 May 2024 18:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240529053250.91284-1-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29/05/2024 6:32 am, Lu Baolu wrote:
> The IOMMU subsystem has undergone some changes, including the removal
> of iommu_ops from the bus structure. Consequently, the existing domain
> allocation interface, which relies on a bus type argument, is no longer
> relevant:
> 
>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
> 
> This series is designed to refactor the use of this interface. It
> proposes two new interfaces to replace iommu_domain_alloc():
> 
> - iommu_user_domain_alloc(): This interface is intended for allocating
>    iommu domains managed by userspace for device passthrough scenarios,
>    such as those used by iommufd, vfio, and vdpa. It clearly indicates
>    that the domain is for user-managed device DMA.
> 
>    If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
>    this interface will rollback to the generic paging domain allocation.
> 
> - iommu_paging_domain_alloc(): This interface is for allocating iommu
>    domains managed by kernel drivers for kernel DMA purposes. It takes a
>    device pointer as a parameter, which better reflects the current
>    design of the IOMMU subsystem.
> 
> The majority of device drivers currently using iommu_domain_alloc() do
> so to allocate a domain for a specific device and then attach that
> domain to the device. These cases can be straightforwardly migrated to
> the new interfaces.

Ooh, nice! This was rising back up my to-do list as well, but I concur 
it's rather more straightforward than my version that did devious things 
to keep the iommu_domain_alloc() name...

> However, there are some drivers with more complex use cases that do
> not fit neatly into this new scheme. For example:
> 
> $ git grep "= iommu_domain_alloc"
> arch/arm/mm/dma-mapping.c:      mapping->domain = iommu_domain_alloc(bus);

This one's simple enough, the refactor just needs to go one step deeper. 
I've just rebased and pushed my old patch for that, if you'd like it [1].

> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = iommu_domain_alloc(private->iommu_dev->bus);

Both this one and usnic_uiom_alloc_pd() should be OK - back when I did 
all the figuring out to clean up iommu_present(), I specifically 
reworked them into "dev->bus" style as a reminder that it *is* supposed 
to be the right device for doing this with, even if the attach is a bit 
more distant.

> drivers/gpu/drm/tegra/drm.c:            tegra->domain = iommu_domain_alloc(&platform_bus_type);

This is the tricky one, where the device to hand may *not* be the right 
device for IOMMU API use [2]. FWIW my plan was to pull the "walk the 
platform bus to find any IOMMU-mapped device" trick into this code and 
use it both to remove the final iommu_present() and for a device-based 
domain allocation.

> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain = iommu_domain_alloc(dev->bus);
> 
> This series leave those cases unchanged and keep iommu_domain_alloc()
> for their usage. But new drivers should not use it anymore.

I'd certainly be keen for it to be gone ASAP, since I'm seeing 
increasing demand for supporting multiple IOMMU drivers, and this is the 
last bus-based thing standing in the way of that.

Thanks,
Robin.

[1] 
https://gitlab.arm.com/linux-arm/linux-rm/-/commit/f048cc6a323d8641898025ca96071df7cbe8bd52
[2] 
https://lore.kernel.org/linux-iommu/add31812-50d5-6cb0-3908-143c523abd37@collabora.com/

> The whole series is also available on GitHub:
> https://github.com/LuBaolu/intel-iommu/commits/iommu-domain-allocation-refactor-v1
> 
> Lu Baolu (20):
>    iommu: Add iommu_user_domain_alloc() interface
>    iommufd: Use iommu_user_domain_alloc()
>    vfio/type1: Use iommu_paging_domain_alloc()
>    vhost-vdpa: Use iommu_user_domain_alloc()
>    iommu: Add iommu_paging_domain_alloc() interface
>    drm/msm: Use iommu_paging_domain_alloc()
>    drm/nouveau/tegra: Use iommu_paging_domain_alloc()
>    gpu: host1x: Use iommu_paging_domain_alloc()
>    media: nvidia: tegra: Use iommu_paging_domain_alloc()
>    media: venus: firmware: Use iommu_paging_domain_alloc()
>    ath10k: Use iommu_paging_domain_alloc()
>    wifi: ath11k: Use iommu_paging_domain_alloc()
>    remoteproc: Use iommu_paging_domain_alloc()
>    soc/fsl/qbman: Use iommu_paging_domain_alloc()
>    iommu/vt-d: Add helper to allocate paging domain
>    iommu/vt-d: Add domain_alloc_paging support
>    iommu/vt-d: Simplify compatibility check for identity domain
>    iommu/vt-d: Enhance compatibility check for paging domain attach
>    iommu/vt-d: Remove domain_update_iommu_cap()
>    iommu/vt-d: Remove domain_update_iommu_superpage()
> 
>   include/linux/iommu.h                         |  12 +
>   drivers/gpu/drm/msm/msm_iommu.c               |   8 +-
>   .../drm/nouveau/nvkm/engine/device/tegra.c    |   4 +-
>   drivers/gpu/host1x/dev.c                      |   6 +-
>   drivers/iommu/intel/iommu.c                   | 319 ++++++++----------
>   drivers/iommu/intel/pasid.c                   |  28 +-
>   drivers/iommu/iommu.c                         |  62 ++++
>   drivers/iommu/iommufd/hw_pagetable.c          |  20 +-
>   .../media/platform/nvidia/tegra-vde/iommu.c   |   6 +-
>   drivers/media/platform/qcom/venus/firmware.c  |   6 +-
>   drivers/net/wireless/ath/ath10k/snoc.c        |   6 +-
>   drivers/net/wireless/ath/ath11k/ahb.c         |   6 +-
>   drivers/remoteproc/remoteproc_core.c          |   6 +-
>   drivers/soc/fsl/qbman/qman_portal.c           |   4 +-
>   drivers/vfio/vfio_iommu_type1.c               |   7 +-
>   drivers/vhost/vdpa.c                          |  11 +-
>   16 files changed, 253 insertions(+), 258 deletions(-)
> 
