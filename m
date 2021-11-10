Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E554044C12D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302246E12C;
	Wed, 10 Nov 2021 12:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985E6E03E;
 Wed, 10 Nov 2021 12:26:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="231380134"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="231380134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 04:26:15 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="503945017"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.217])
 ([10.254.212.217])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 04:26:13 -0800
Message-ID: <b1e19c1a-9847-930b-d248-40f1f440a5d0@linux.intel.com>
Date: Wed, 10 Nov 2021 20:26:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <20211109171926.vrb5juvp64mv65b4@ldmartin-desk2>
 <bcb8736d-a46a-a756-e6ca-7872a21b075c@linux.intel.com>
 <de8337fc-09c8-3c9c-1e30-34737afa50a8@linux.intel.com>
 <60635c85-8a0d-51b2-18d1-c4e2eb9e9536@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use per device iommu check
In-Reply-To: <60635c85-8a0d-51b2-18d1-c4e2eb9e9536@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/11/10 17:35, Tvrtko Ursulin wrote:
> 
> On 10/11/2021 07:25, Lu Baolu wrote:
>> On 2021/11/10 1:35, Tvrtko Ursulin wrote:
>>>
>>> On 09/11/2021 17:19, Lucas De Marchi wrote:
>>>> On Tue, Nov 09, 2021 at 12:17:59PM +0000, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> On igfx + dgfx setups, it appears that intel_iommu=igfx_off option 
>>>>> only
>>>>> disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
>>>>> and probe presence of iommu domain per device to accurately reflect 
>>>>> its
>>>>> status.
>>>>
>>>> nice, I was just starting to look into thus but for another reason: we
>>>> are adding support for other archs, like aarch64, and the global 
>>>> from here
>>>> was a problem
>>>
>>> Yes I realized the other iommu angle as well. To do this properly we 
>>> need to sort the intel_vtd_active call sites into at least two 
>>> buckets - which are truly about VT-d and which are just IOMMU.
>>>
>>> For instance the THP decision in i915_gemfs.co would be "are we 
>>> behind any iommu". Some other call sites are possibly only about the 
>>> bugs in the igfx iommu. Not sure if there is a third bucket for any 
>>> potential differences between igfx iommu and other Intel iommu in 
>>> case of dgfx.
>>>
>>> I'd like to hear from Baolu as well to confirm if intel_iommu driver 
>>> is handling igfx + dgfx correctly in respect to the two global 
>>> variables I mention in the commit message.
>>
>> I strongly agree that the drivers should call the IOMMU interface
>> directly for portability. For Intel graphic driver, we have two issues:
>>
>> #1) driver asks vt-d driver for identity map with intel_iommu=igfx_off.
>> #2) driver query the status with a global intel_iommu_gfx_mapped.
>>
>> We need to solve these two problems step by step. This patch is
>> definitely a good start point.
> 
> (I should have really consolidated the thread, but never mind now.)
> 
> You mean good starting point for the discussion or between your first 
> and second email you started thinking it may even work?
> 
> Because as I wrote in the other email, it appears to work. But I fully 
> accept it may be by accident and you may suggest a proper API to be 
> added to the IOMMU core, which I would then be happy to use.
> 
> If maybe not immediately, perhaps we could start with this patch and 
> going forward add something more detailed. Like for instance allowing us 
> to query the name/id of the iommu driver in case i915 needs to apply 
> different quirks across them? Not sure how feasible that would be, but 
> at the moment the need does sound plausible to me.

The whole story in my mind looks like below:

1. The graphic device driver has its own way to let the user specify
    iommu-bypass mode. For example, early_param()...

2. If the iommu-bypass mode is set, the graphic device will get below
    set:

	dev->dma_ops_bypass = true;

3. The iommu probe procedure will use identity domain (non-mapped mode)
    for the device because value of dev->dma_ops_bypass is true.

That's all. The device driver doesn't need to check iommu for the
mapping mode. And this framework will be generic and could be used by
other device drivers.

The difficulty in doing so is that step 2 must happen before or during
the device probe process. At present, I haven't figured out how to do
it yet. :-)

Best regards,
baolu
