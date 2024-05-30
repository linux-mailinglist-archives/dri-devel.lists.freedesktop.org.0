Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4258D43FB
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 05:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FC510E18A;
	Thu, 30 May 2024 03:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqehyLWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511D910E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 03:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717038718; x=1748574718;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AtVs/mAUfq0zsyGVzKlFt9Vs7GAGvhJdHEZppaw/M7Y=;
 b=eqehyLWYkSNCKIvXf9qnxHdTVkkTCGjea7/EvYoNleVT7XF6m57fePhs
 373qoXsfg4p/2IFm1poesXEGURO2aw0g3hyv8a07VZa65VTAivbK1YYyS
 i6keupHxfA+5OVXA2xJj6vkYwatKscsDexkKxYv1rEUCjl3gGotZ3a+Fn
 eDmnXvXVDTelLqOv3ZIq1uE9KvSmsd92DqmhLmcA9Aw3fVJR20U1dqGRa
 RaPu4iP7Z7Kf8+IzgYM3YpuX8O4B/9kLLRG53V4u7LdB0GGOMOJ6Gdpfy
 +LRNtTLGw8TiUVavBhQPFxMraLl9VwkcHpJeOt6r9G2QCHYqGQnMKkZFX g==;
X-CSE-ConnectionGUID: CWwDLVbpR96GiBHyoYdr+g==
X-CSE-MsgGUID: nhg/4N5ZSvGdAE8n9owVYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13334707"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13334707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 20:11:57 -0700
X-CSE-ConnectionGUID: o/wZ19gZRkKu+qUIFx0MAQ==
X-CSE-MsgGUID: ASzVpoGHRkiecU00cNHKxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40093824"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by fmviesa005.fm.intel.com with ESMTP; 29 May 2024 20:11:51 -0700
Message-ID: <ad3d0781-08aa-4cab-8dc8-eaf753c6671a@linux.intel.com>
Date: Thu, 30 May 2024 11:09:45 +0800
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
Subject: Re: [PATCH 05/20] iommu: Add iommu_paging_domain_alloc() interface
To: Yi Liu <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-6-baolu.lu@linux.intel.com>
 <eedb1df0-e745-4b48-9261-faa0ff320ee9@intel.com>
 <dc9fa861-628f-4a96-ae37-e419b23c6ea0@linux.intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <dc9fa861-628f-4a96-ae37-e419b23c6ea0@linux.intel.com>
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

On 5/30/24 9:59 AM, Baolu Lu wrote:
> On 5/29/24 5:04 PM, Yi Liu wrote:
>> On 2024/5/29 13:32, Lu Baolu wrote:
>>> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
>>> bus. The iommu subsystem no longer relies on bus for operations. So the
>>> bus parameter in iommu_domain_alloc() is no longer relevant.
>>>
>>> Add a new interface named iommu_paging_domain_alloc(), which explicitly
>>> indicates the allocation of a paging domain for DMA managed by a kernel
>>> driver. The new interface takes a device pointer as its parameter, that
>>> better aligns with the current iommu subsystem.
>>
>> you may want to move this patch before patch 03/04.
> 
> Emm, why?

I see. The commit subject is misleading. It should be "vfio/type1: Use
iommu_user_domain_alloc()".

Best regards,
baolu
