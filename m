Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387478FDC82
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4910E82D;
	Thu,  6 Jun 2024 02:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcA5W7A8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB2610E82D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717639619; x=1749175619;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O1pxJnfGlDL+o5WOmDo3d+UFg4FCJmMKJsHIxcmUatg=;
 b=dcA5W7A8o4hBtZ8CaUXRUNXuPcPBibXJneb8sowSLchtDV0jBxWRbnBt
 6Et/GH2VEAm30ctZ+RdjyIo2Ax/HX1Dd5HoEMiGyesVy5lixP/kcanj3+
 YyK2d71v5tlCDGl7Hw4tupzbRwu+EANjuh7BbzYSYzG/wUE7IdaK7TBbO
 GwDifb5lBtU4ezcaivPLqvQHQ6/18FmmW6s4BwnURrR3Kt7ffQJt2RcVb
 FbyYKre9Euee2ARUyTZ8xTDWMhOkRcOAc7L01PnSSZ8/Koelp/zoKxP/j
 EIfxfrPO965ykB/h+ojyRmjO+hcsldYVONPYkqeJ2OyBtN/oMjMF5jDzg w==;
X-CSE-ConnectionGUID: QIzOXu0EQNKOVc8shByGuw==
X-CSE-MsgGUID: Aju2azlxSguushpGDc1zrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14241615"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14241615"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 19:06:59 -0700
X-CSE-ConnectionGUID: y0WgSW4NQBOS4MM9Agg9Iw==
X-CSE-MsgGUID: RA+mTl0pQRWQMmAwcw88gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37813441"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2024 19:06:54 -0700
Message-ID: <75d0e879-a807-420e-bbf6-2ba4238329cf@linux.intel.com>
Date: Thu, 6 Jun 2024 10:04:44 +0800
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
Subject: Re: [PATCH v2 01/22] iommu: Add iommu_user_domain_alloc() interface
To: Yi Liu <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-2-baolu.lu@linux.intel.com>
 <445fae9f-ea1e-4864-9f0e-f348c51146a1@intel.com>
 <91a42f46-060a-4430-a10a-7bfded67c4a9@linux.intel.com>
 <b205bcfb-9972-4e03-9994-62419117d76f@intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <b205bcfb-9972-4e03-9994-62419117d76f@intel.com>
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

On 6/5/24 2:23 PM, Yi Liu wrote:
> On 2024/6/5 10:00, Baolu Lu wrote:
>> On 6/4/24 4:03 PM, Yi Liu wrote:
>>> On 2024/6/4 09:51, Lu Baolu wrote:
>>>> Commit <909f4abd1097> ("iommu: Add new iommu op to create domains owned
>>>> by userspace") added a dedicated iommu op to allocate a user domain.
>>>> While IOMMUFD has already made use of this callback, other frameworks
>>>> like vfio/type1 and vDPA still use the paging domain allocation 
>>>> interface.
>>>>
>>>> Add a new interface named iommu_user_domain_alloc(), which indicates 
>>>> the
>>>> allocation of a domain for device DMA managed by user space driver. All
>>>> device passthrough frameworks could use this interface for their domain
>>>> allocation.
>>>>
>>>> Although it is expected that all iommu drivers could implement their 
>>>> own
>>>> domain_alloc_user ops, most drivers haven't implemented it yet. 
>>>> Rollback
>>>> to the paging domain allocation interface if the iommu driver hasn't
>>>> implemented this op yet.
>>>>
>>>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>>> ---
>>>>   include/linux/iommu.h |  6 ++++++
>>>>   drivers/iommu/iommu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 48 insertions(+)
>>>>
>>>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>>>> index 7bc8dff7cf6d..6648b2415474 100644
>>>> --- a/include/linux/iommu.h
>>>> +++ b/include/linux/iommu.h
>>>> @@ -780,6 +780,7 @@ extern bool iommu_present(const struct bus_type 
>>>> *bus);
>>>>   extern bool device_iommu_capable(struct device *dev, enum 
>>>> iommu_cap cap);
>>>>   extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
>>>>   extern struct iommu_domain *iommu_domain_alloc(const struct 
>>>> bus_type *bus);
>>>> +struct iommu_domain *iommu_user_domain_alloc(struct device *dev, 
>>>> u32 flags);
>>>>   extern void iommu_domain_free(struct iommu_domain *domain);
>>>>   extern int iommu_attach_device(struct iommu_domain *domain,
>>>>                      struct device *dev);
>>>> @@ -1086,6 +1087,11 @@ static inline struct iommu_domain 
>>>> *iommu_domain_alloc(const struct bus_type *bus
>>>>       return NULL;
>>>>   }
>>>> +static inline struct iommu_domain *iommu_user_domain_alloc(struct 
>>>> device *dev, u32 flags)
>>>> +{
>>>> +    return ERR_PTR(-ENODEV);
>>>> +}
>>>> +
>>>>   static inline void iommu_domain_free(struct iommu_domain *domain)
>>>>   {
>>>>   }
>>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>>> index 9df7cc75c1bc..f1416892ef8e 100644
>>>> --- a/drivers/iommu/iommu.c
>>>> +++ b/drivers/iommu/iommu.c
>>>> @@ -2032,6 +2032,48 @@ struct iommu_domain *iommu_domain_alloc(const 
>>>> struct bus_type *bus)
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>>>> +/**
>>>> + * iommu_user_domain_alloc() - Allocate a user domain
>>>> + * @dev: device for which the domain is allocated
>>>> + * @flags: iommufd_hwpt_alloc_flags defined in uapi/linux/iommufd.h
>>>> + *
>>>> + * Allocate a user domain which will be managed by a userspace 
>>>> driver. Return
>>>> + * allocated domain if successful, or a ERR pointer for failure.
>>>
>>> do you want to mention that this is for paging domain allocation?
>>
>> You are worrying about its confusion with nesting domain allocation,
>> right?
> 
> yes. As I replied in last version, user_domain is a bit confusing since
> nested domain is also a user_domain. That's why we introduced the
> alloc_domain_user op.

As I discussed with Jason in another reply, I will drop the
iommu_user_domain_alloc() interface as it is currently iommfd-specific
only and not generic for a common interface.

Best regards,
baolu
