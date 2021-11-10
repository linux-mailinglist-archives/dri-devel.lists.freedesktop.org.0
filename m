Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9944C115
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED196E0F2;
	Wed, 10 Nov 2021 12:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F6196E10B;
 Wed, 10 Nov 2021 12:16:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F810101E;
 Wed, 10 Nov 2021 04:16:33 -0800 (PST)
Received: from [10.57.81.233] (unknown [10.57.81.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3913F718;
 Wed, 10 Nov 2021 04:16:32 -0800 (PST)
Message-ID: <11f46995-6884-a909-b4fa-d0302e25c9bc@arm.com>
Date: Wed, 10 Nov 2021 12:16:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use per device iommu check
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <20211109171926.vrb5juvp64mv65b4@ldmartin-desk2>
 <bcb8736d-a46a-a756-e6ca-7872a21b075c@linux.intel.com>
 <de8337fc-09c8-3c9c-1e30-34737afa50a8@linux.intel.com>
 <60635c85-8a0d-51b2-18d1-c4e2eb9e9536@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-10 09:35, Tvrtko Ursulin wrote:
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

The "proper" API at the moment is device_iommu_mapped(), but indeed that 
only answers the "is this device connected to an IOMMU at all?" 
question, it doesn't tell you whether that IOMMU is translating or just 
bypassing.

If translation only really matters in terms of DMA API usage - i.e. 
you're not interested in using the IOMMU API directly - then I reckon it 
would be fairly reasonable to use dma_get_ops() to look at whether 
you've got dma-direct or iommu_dma_ops. At the moment that's sufficient 
to tell you whether your DMA is translated or not. If a more formal 
interface is wanted in future, I'm inclined to think that it would still 
belong at the DMA API level, since the public IOMMU API is really all 
about explicit translation, whereas what we care about here is reflected 
more in its internal interaction with the DMA APIs.

> If maybe not immediately, perhaps we could start with this patch and 
> going forward add something more detailed. Like for instance allowing us 
> to query the name/id of the iommu driver in case i915 needs to apply 
> different quirks across them? Not sure how feasible that would be, but 
> at the moment the need does sound plausible to me.

FWIW I'd be wary of trying to get that clever - with iGFX it's easy to 
make fine-grained decisions because you've got a known and fixed 
integration with a particular IOMMU, but once you get out into the wider 
world you'll run into not only multiple different IOMMU implementations 
behind the same driver, but even the exact same IOMMU IP having 
different characteristics in different SoCs. Even something as 
seemingly-innocuous as an "is it worth using 2MB large pages?" quirk 
list could effectively become the cross product of various kernel config 
options and all PCIe-capable SoCs in existence.

Cheers,
Robin.
