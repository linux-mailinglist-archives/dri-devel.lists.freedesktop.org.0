Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD79C8D5876
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 04:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAF210F52F;
	Fri, 31 May 2024 02:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPotFBUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5250B10E5F7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717120810; x=1748656810;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2fUiLAe0vLP2hoMqQ1N3E6uckKGVMNj5dHoJ19Y+sN0=;
 b=ZPotFBUdzP7nC5MFApOnOaWLDTB4SeKCmeM0R+CF0ZV3qOL9+LPKMnGZ
 OgJOuS+BY/hazJny/8/PJw88EM8jxR3Yxpg10b7Qk6wQjHCoRYwmPmdNi
 2DXpKizh2oW8E2O79IUDNVHwMYrBLfaGZDMs1wb83weYP2x3djtMK8K+N
 jHW9Mu5wR1v8wN5vOXhbL4WSVHoIjKoQpjgBOFgGszudUsYM/hiSjwVBZ
 UCaRI4wy4hWVUC4BTMxe17Wo7FxOzYx1IKtvriXKNFe25DBfLpDqQ8/44
 26K5A08FXJ6irC/rI9r5kqIGOmSphXSUpx/JSFkq2D64KFNPdzpCZwVtT A==;
X-CSE-ConnectionGUID: bwyucErOQXCuoAeuVUKsXg==
X-CSE-MsgGUID: uXEnBq0BRjihDrrv8TlmFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17479952"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="17479952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 19:00:08 -0700
X-CSE-ConnectionGUID: U2f5FXHqTNiG/j8alR7vOg==
X-CSE-MsgGUID: +b1UL6wJRJyLg9EzJxqHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40936569"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by orviesa005.jf.intel.com with ESMTP; 30 May 2024 19:00:02 -0700
Message-ID: <dda59cd5-b227-4f42-a7f2-b9fe03e1b020@linux.intel.com>
Date: Fri, 31 May 2024 09:57:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/20] drm/msm: Use iommu_paging_domain_alloc()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-7-baolu.lu@linux.intel.com>
 <jd7df7jshswukstxwbfoxuswyltyemdmkx272i5mpldlfsk4t7@ad36olyvmw27>
 <960bfc23-22b3-48d1-baa6-2707767875c5@linux.intel.com>
 <CAA8EJppZU5yy4g85oMWzV_O9Qo91-Cr6d+W9Rz+K+mS6tfU8kw@mail.gmail.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <CAA8EJppZU5yy4g85oMWzV_O9Qo91-Cr6d+W9Rz+K+mS6tfU8kw@mail.gmail.com>
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

On 5/30/24 3:58 PM, Dmitry Baryshkov wrote:
> On Thu, 30 May 2024 at 04:59, Baolu Lu<baolu.lu@linux.intel.com>  wrote:
>> On 5/29/24 4:21 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 29, 2024 at 01:32:36PM +0800, Lu Baolu wrote:
>>>> The domain allocated in msm_iommu_new() is for the @dev. Replace
>>>> iommu_domain_alloc() with iommu_paging_domain_alloc() to make it explicit.
>>>>
>>>> Update msm_iommu_new() to always return ERR_PTR in failure cases instead
>>>> of NULL.
>>> Please don't mix unrelated changes, because ...
>>>
>>>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/msm_iommu.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
>>>> index d5512037c38b..f7e28d4b5f62 100644
>>>> --- a/drivers/gpu/drm/msm/msm_iommu.c
>>>> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>>>> @@ -407,9 +407,9 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>>>>       struct msm_iommu *iommu;
>>>>       int ret;
>>>>
>>>> -    domain = iommu_domain_alloc(dev->bus);
>>>> -    if (!domain)
>>>> -            return NULL;
>>>> +    domain = iommu_paging_domain_alloc(dev);
>>>> +    if (IS_ERR(domain))
>>>> +            return ERR_CAST(domain);
>>>>
>>>>       iommu_set_pgtable_quirks(domain, quirks);
>>>>
>>>> @@ -441,7 +441,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
>>>>       struct msm_mmu *mmu;
>>>>
>>>>       mmu = msm_iommu_new(dev, quirks);
>>>> -    if (IS_ERR_OR_NULL(mmu))
>>>> +    if (IS_ERR(mmu))
>>>>               return mmu;
>>> NAK, not having an IOMMU is a poor but legit usecase for some of devices
>>> which don't have IOMMU support yet (for example because of the buggy
>>> implementation for which we were not able to get all the hooks in).
>>>
>>> Please don't break compatibility for existing platforms.
>> Sure. I will remove this line of change. Though I have no idea in which
>> case msm_iommu_new() could return NULL after this patch.
> So, even without this chunk you are going to break the no-IOMMU case.
> Please don't. This will result in a regression report and a revert.
> 
> Instead please provide a way for the existing drivers to continue
> working. For example, something like:
> 
> if (IS_ERR(mmu) && ERR_PTR(mmu) == -ENODEV))
>      return NULL;

Oh I see. msm_iommu_new() returning NULL indicates a no-IOMMU case,
right? So perhaps we can make it explicit like below?

         if (!device_iommu_mapped(dev))
                 return NULL;

         domain = iommu_paging_domain_alloc(dev);
         if (IS_ERR(domain))
                 return ERR_CAST(domain);

Best regards,
baolu
