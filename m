Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79D92AE10
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 04:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916C10E1C1;
	Tue,  9 Jul 2024 02:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QW6bfgDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A257D10E31E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720491224; x=1752027224;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qmfe73rj7uPFO7PgvLZEQThh1iERDsTRnG6XRTqML+c=;
 b=QW6bfgDJ9zu1GSu/Vhjq8NDRjN2OmjJTqgHF3lknRZAGaCwVvXxln4ND
 4a1BtjTK9O9s4809LzuunswiY6fF+ckgPsjZaReGwL7ypVBoR4+LWnf7z
 SgJ/7Ttmi5l5Nbg8tSTBvfuEDWwe0dpJjoeyfQRlD2LT7E+H7m/LQnjv8
 pOlfBiyjIPEacnP3Hyyi2GmkQ8PMByb+ZUYOO6jxegKRgAc/m7Vbp2ukg
 ecNP/bFHm7Qc9qz729wLJrvbpfzQ6DWtFK569T5NRQYrCFjZIQtmeoe6U
 wqX7KIa5fDhUn+WH4gtK0132vKSItklb1JtAN5mbqA6TMhwzPVsU/Q0d3 w==;
X-CSE-ConnectionGUID: ZfRcniVsTEmFxjNPVT1V7A==
X-CSE-MsgGUID: 1DXIWjqJQkayZvYCFS++kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17824230"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17824230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 19:13:42 -0700
X-CSE-ConnectionGUID: d5zKqABkTUWp4MS7DXpD4g==
X-CSE-MsgGUID: AnVNl0FXQyWJ4eCG+5lDGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52100309"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2024 19:13:33 -0700
Message-ID: <56911ed6-d819-4882-9c7e-bfe4ba5826c2@linux.intel.com>
Date: Tue, 9 Jul 2024 10:10:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>,
 catalin.marinas@arm.com, kernel-team@android.com, Yi Liu
 <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
To: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
 <20240708163407.GC14050@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240708163407.GC14050@ziepe.ca>
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

On 7/9/24 12:34 AM, Jason Gunthorpe wrote:
> On Thu, Jul 04, 2024 at 03:18:56PM +0100, Will Deacon wrote:
>> On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
>>> The IOMMU subsystem has undergone some changes, including the removal
>>> of iommu_ops from the bus structure. Consequently, the existing domain
>>> allocation interface, which relies on a bus type argument, is no longer
>>> relevant:
>>>
>>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>>
>>> [...]
>> Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!
>>
>> [01/21] iommu: Add iommu_paging_domain_alloc() interface
>>          https://git.kernel.org/iommu/c/a27bf2743cb8
>> [02/21] iommufd: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/26a581606fab
>> [03/21] vfio/type1: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/60ffc4501722
>> [04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/9c159f6de1ae
>> [05/21] drm/msm: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/45acf35af200
>>
>> [10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/d5b7485588df
>> [11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/ef50d41fbf1c
>>
>> [14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/3b10f25704be
>> [15/21] iommu/vt-d: Add helper to allocate paging domain
>>          https://git.kernel.org/iommu/c/9e9ba576c259
> Great, Lu can you please split the remaining by subsystem and try to
> get them to go through subsystem trees? Joerg can take the leftovers
> at rc6/7 or something like that so we can finish this.

Yes, sure. I guess I need to wait until 6.11-rc1 is out. It's a bit late
in the cycle for the subsystem trees to accept brand new changes.

> I think this is enough that Intel and AMD could now assert that dev is
> non-null?

Yes.

Thanks,
baolu
