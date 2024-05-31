Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F58D5A22
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 08:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9610E07C;
	Fri, 31 May 2024 06:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yzp6GSIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80710E259
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 06:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717135368; x=1748671368;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ybwUS6RtWP/25t4kttVVL9hVeT6Fp8bPYKJR9Xwq21Y=;
 b=Yzp6GSIHtBtJCByAn/q603xTx9521rxJ1J5jPnAUkF2P/BzEgMxSQrnM
 uA62wfVilmRy3TzDR04L4qLzt1aZArKBtZkc8AY45puPzw2Tv7C4yeA3e
 kAimg22aH9usD9xmKPuP7a6+rJs1zyXnGiRufApJKUPpC1z4ndbeakKHF
 f5BCdLpE3TZXeFh5V+srNZJz4tC2joVwEUpHixxrZlsr0gPWNMgJ14DkS
 aYaNMMP5F2lYzbhsq4OzzNZbtKWlwpOchbD1/aRNuGJ4NgNTFN72zrLYf
 czRptdT41fXiAdXpK/FsNuce2w6FHNfiLfNOQZjrctUuM3zxPc88Nbo93 w==;
X-CSE-ConnectionGUID: y2JRSwdJQrymQghsuM5MvA==
X-CSE-MsgGUID: RTl8GBPcQm2PkwBZAJC2Rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13509425"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13509425"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:02:47 -0700
X-CSE-ConnectionGUID: fMZJ/pUwTXqKV30ojXQ/RA==
X-CSE-MsgGUID: CO2gmYVVR3yFgXq5Fsh8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="41127729"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by orviesa004.jf.intel.com with ESMTP; 30 May 2024 23:02:41 -0700
Message-ID: <34d23852-ea68-414e-92ce-61dcfe6a0368@linux.intel.com>
Date: Fri, 31 May 2024 14:00:34 +0800
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
 <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
 <7af4fee2-1b37-4eb8-9d03-8b1a402ec00b@intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7af4fee2-1b37-4eb8-9d03-8b1a402ec00b@intel.com>
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

On 5/31/24 11:16 AM, Yi Liu wrote:
> On 2024/5/29 20:02, Baolu Lu wrote:
>> On 2024/5/29 17:03, Yi Liu wrote:
>>> On 2024/5/29 13:32, Lu Baolu wrote:
>>>> The IOMMU subsystem has undergone some changes, including the removal
>>>> of iommu_ops from the bus structure. Consequently, the existing domain
>>>> allocation interface, which relies on a bus type argument, is no longer
>>>> relevant:
>>>>
>>>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>>>
>>>> This series is designed to refactor the use of this interface. It
>>>> proposes two new interfaces to replace iommu_domain_alloc():
>>>>
>>>> - iommu_user_domain_alloc(): This interface is intended for allocating
>>>>    iommu domains managed by userspace for device passthrough scenarios,
>>>>    such as those used by iommufd, vfio, and vdpa. It clearly indicates
>>>>    that the domain is for user-managed device DMA.
>>>
>>> user paging domain? It looks to me user domain includes the nested 
>>> domains
>>> as well.
>>
>> Yes, nested domain is a user domain. The iommu driver should implement
>> iommu_ops->domain_alloc_user for nested domain allocation.
> 
> will it be more clear to name iommu_user_domain_alloc() be
> iommu_user_paging_domain_alloc() as it is mainly for paging domain
> allocation?

That might be better; let's wait and see if there's another option.

> 
>>>
>>>>    If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
>>>>    this interface will rollback to the generic paging domain 
>>>> allocation.
>>>>
>>>> - iommu_paging_domain_alloc(): This interface is for allocating iommu
>>>>    domains managed by kernel drivers for kernel DMA purposes. It 
>>>> takes a
>>>>    device pointer as a parameter, which better reflects the current
>>>>    design of the IOMMU subsystem.
>>>>
>>>> The majority of device drivers currently using iommu_domain_alloc() do
>>>> so to allocate a domain for a specific device and then attach that
>>>> domain to the device. These cases can be straightforwardly migrated to
>>>> the new interfaces.
>>>>
>>>> However, there are some drivers with more complex use cases that do
>>>> not fit neatly into this new scheme. For example:
>>>>
>>>> $ git grep "= iommu_domain_alloc"
>>>> arch/arm/mm/dma-mapping.c:      mapping->domain = 
>>>> iommu_domain_alloc(bus);
>>>> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = 
>>>> iommu_domain_alloc(private->iommu_dev->bus);
>>>> drivers/gpu/drm/tegra/drm.c:            tegra->domain = 
>>>> iommu_domain_alloc(&platform_bus_type);
>>>> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain 
>>>> = iommu_domain_alloc(dev->bus);
>>>>
>>>> This series leave those cases unchanged and keep iommu_domain_alloc()
>>>> for their usage. But new drivers should not use it anymore.
>>>
>>> does it mean there is still domains allocated via iommu_domain_alloc()
>>> on VT-d platform?
>>
>> I think the drivers mentioned above do not run on x86 platforms, or do
>> they?
> 
> cool. BTW. I know out-of-tree drivers are not counted in upstream review.
> Just out of curious, is there a formal way to let such drivers know it is
> no longer allowed to use iommu_domain_alloc() on VT-d?

As Robin suggested, we should try to remove iommu_domain_alloc() from
the tree in this series.

Best regards,
baolu
