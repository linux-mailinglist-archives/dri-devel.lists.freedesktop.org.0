Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B665D8D35EB
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 14:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E8F10E344;
	Wed, 29 May 2024 12:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kj4tVaPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225DF10E797
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716984161; x=1748520161;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S6PR7hASefAykUiQJ98a2gkLPejgKFckIybEKFG05rw=;
 b=Kj4tVaPA5xH2UwIsll3f9VOLh+mYSHKRgPv/TxAh93nrkrWcQhL6AxmX
 y+BXAEvfJQOluo/GEH3VpxCS8uJzscwA1Cuc1Ta+M8Ex30uiRmUH52NFc
 /UzlKLDaiBm61mYZUAh5rd3wdkesh+0ic6dyTLqWh7DlU/55G0oDcVOyR
 y8tyHNGVGtO6/+cg2S161WUxr8oLF5RVN9hFMFDSYdYHI6LfX30/r1uSo
 3wTuoRn+mMFnNEYhYONQP/noR5oADiPf/EDCdJrDdltzZgwvW+n6+HQCA
 VZKwpI+gVMlQiUhXMEzzwpGGPJc2f2GBbJV1IV2mIZJ/Ye2sOr5seKYBu w==;
X-CSE-ConnectionGUID: sqzj4m+3QOaERb4y8hnHLA==
X-CSE-MsgGUID: ZDAwCLBAQ1CKMDFvM4w/Dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13509628"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13509628"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:02:20 -0700
X-CSE-ConnectionGUID: bmIch7XpSyGgCPOKiEIJ7g==
X-CSE-MsgGUID: g95b3E+NTC2z4V13RCkw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40262520"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.237.100])
 ([10.124.237.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:02:15 -0700
Message-ID: <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
Date: Wed, 29 May 2024 20:02:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
To: Yi Liu <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2024/5/29 17:03, Yi Liu wrote:
> On 2024/5/29 13:32, Lu Baolu wrote:
>> The IOMMU subsystem has undergone some changes, including the removal
>> of iommu_ops from the bus structure. Consequently, the existing domain
>> allocation interface, which relies on a bus type argument, is no longer
>> relevant:
>>
>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>
>> This series is designed to refactor the use of this interface. It
>> proposes two new interfaces to replace iommu_domain_alloc():
>>
>> - iommu_user_domain_alloc(): This interface is intended for allocating
>>    iommu domains managed by userspace for device passthrough scenarios,
>>    such as those used by iommufd, vfio, and vdpa. It clearly indicates
>>    that the domain is for user-managed device DMA.
> 
> user paging domain? It looks to me user domain includes the nested domains
> as well.

Yes, nested domain is a user domain. The iommu driver should implement
iommu_ops->domain_alloc_user for nested domain allocation.

> 
>>    If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
>>    this interface will rollback to the generic paging domain allocation.
>>
>> - iommu_paging_domain_alloc(): This interface is for allocating iommu
>>    domains managed by kernel drivers for kernel DMA purposes. It takes a
>>    device pointer as a parameter, which better reflects the current
>>    design of the IOMMU subsystem.
>>
>> The majority of device drivers currently using iommu_domain_alloc() do
>> so to allocate a domain for a specific device and then attach that
>> domain to the device. These cases can be straightforwardly migrated to
>> the new interfaces.
>>
>> However, there are some drivers with more complex use cases that do
>> not fit neatly into this new scheme. For example:
>>
>> $ git grep "= iommu_domain_alloc"
>> arch/arm/mm/dma-mapping.c:      mapping->domain = 
>> iommu_domain_alloc(bus);
>> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = 
>> iommu_domain_alloc(private->iommu_dev->bus);
>> drivers/gpu/drm/tegra/drm.c:            tegra->domain = 
>> iommu_domain_alloc(&platform_bus_type);
>> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain = 
>> iommu_domain_alloc(dev->bus);
>>
>> This series leave those cases unchanged and keep iommu_domain_alloc()
>> for their usage. But new drivers should not use it anymore.
> 
> does it mean there is still domains allocated via iommu_domain_alloc()
> on VT-d platform?

I think the drivers mentioned above do not run on x86 platforms, or do
they?

Best regards,
baolu
