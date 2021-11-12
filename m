Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E841944E83E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F406E483;
	Fri, 12 Nov 2021 14:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955EA6E334;
 Fri, 12 Nov 2021 14:10:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="213861956"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="213861956"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:10:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="670661333"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO [10.213.200.24])
 ([10.213.200.24])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:10:44 -0800
Subject: Re: [PATCH] drm/i915: Use per device iommu check
To: Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
 Intel-gfx@lists.freedesktop.org
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <6e8c55a7-45b6-57ab-35f7-d522401efccb@linux.intel.com>
 <4d1a0ab9-e0d8-2ed9-1fc4-9ffaf2f19bef@linux.intel.com>
 <7b2e1427-69cf-8f5d-0c15-73c4e602953d@linux.intel.com>
 <2a1ae709-19f8-7983-b171-98ec2f3f010a@linux.intel.com>
 <4c5ab72f-aaff-8b92-7471-44dd907cf2f6@linux.intel.com>
 <215fa7de-4ed7-1da5-724e-006e36286c08@linux.intel.com>
 <9463fda7-d215-6c14-3ca7-a2ff94349c3e@arm.com>
 <bc873275-eb22-0cbd-7ee4-094f210f7ffe@linux.intel.com>
 <8d88c76e-5ca8-5675-a2fb-306b972ad4f5@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9458a40b-ef51-08ee-541f-99679dc47a23@linux.intel.com>
Date: Fri, 12 Nov 2021 14:10:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8d88c76e-5ca8-5675-a2fb-306b972ad4f5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/11/2021 00:58, Lu Baolu wrote:
> On 11/11/21 11:18 PM, Tvrtko Ursulin wrote:
>>
>> On 10/11/2021 14:37, Robin Murphy wrote:
>>> On 2021-11-10 14:11, Tvrtko Ursulin wrote:
>>>>
>>>> On 10/11/2021 12:35, Lu Baolu wrote:
>>>>> On 2021/11/10 20:08, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 10/11/2021 12:04, Lu Baolu wrote:
>>>>>>> On 2021/11/10 17:30, Tvrtko Ursulin wrote:
>>>>>>>>
>>>>>>>> On 10/11/2021 07:12, Lu Baolu wrote:
>>>>>>>>> Hi Tvrtko,
>>>>>>>>>
>>>>>>>>> On 2021/11/9 20:17, Tvrtko Ursulin wrote:
>>>>>>>>>> From: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>>>>>>>>>>
>>>>>>>>>> On igfx + dgfx setups, it appears that intel_iommu=igfx_off 
>>>>>>>>>> option only
>>>>>>>>>> disables the igfx iommu. Stop relying on global 
>>>>>>>>>> intel_iommu_gfx_mapped
>>>>>>>>>> and probe presence of iommu domain per device to accurately 
>>>>>>>>>> reflect its
>>>>>>>>>> status.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>>>>>>>>>> Cc: Lu Baolu<baolu.lu@linux.intel.com>
>>>>>>>>>> ---
>>>>>>>>>> Baolu, is my understanding here correct? Maybe I am confused 
>>>>>>>>>> by both
>>>>>>>>>> intel_iommu_gfx_mapped and dmar_map_gfx being globals in the 
>>>>>>>>>> intel_iommu
>>>>>>>>>> driver. But it certainly appears the setup can assign some 
>>>>>>>>>> iommu ops (and
>>>>>>>>>> assign the discrete i915 to iommu group) when those two are 
>>>>>>>>>> set to off.
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>>>>>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>> index e967cd08f23e..9fb38a54f1fe 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>> @@ -1763,26 +1763,27 @@ static inline bool run_as_guest(void)
>>>>>>>>>   #define HAS_D12_PLANE_MINIMIZATION(dev_priv) 
>>>>>>>>> (IS_ROCKETLAKE(dev_priv) || \
>>>>>>>>>                             IS_ALDERLAKE_S(dev_priv))
>>>>>>>>>
>>>>>>>>> -static inline bool intel_vtd_active(void)
>>>>>>>>> +static inline bool intel_vtd_active(struct drm_i915_private 
>>>>>>>>> *i915)
>>>>>>>>>   {
>>>>>>>>> -#ifdef CONFIG_INTEL_IOMMU
>>>>>>>>> -    if (intel_iommu_gfx_mapped)
>>>>>>>>> +    if (iommu_get_domain_for_dev(i915->drm.dev))
>>>>>>>>>           return true;
>>>>>>>>> -#endif
>>>>>>>>>
>>>>>>>>>       /* Running as a guest, we assume the host is enforcing 
>>>>>>>>> VT'd */
>>>>>>>>>       return run_as_guest();
>>>>>>>>>   }
>>>>>>>>>
>>>>>>>>> Have you verified this change? I am afraid that
>>>>>>>>> iommu_get_domain_for_dev() always gets a valid iommu domain even
>>>>>>>>> intel_iommu_gfx_mapped == 0.
>>>>>>>>
>>>>>>>> Yes it seems to work as is:
>>>>>>>>
>>>>>>>> default:
>>>>>>>>
>>>>>>>> # grep -i iommu /sys/kernel/debug/dri/*/i915_capabilities
>>>>>>>> /sys/kernel/debug/dri/0/i915_capabilities:iommu: enabled
>>>>>>>> /sys/kernel/debug/dri/1/i915_capabilities:iommu: enabled
>>>>>>>>
>>>>>>>> intel_iommu=igfx_off:
>>>>>>>>
>>>>>>>> # grep -i iommu /sys/kernel/debug/dri/*/i915_capabilities
>>>>>>>> /sys/kernel/debug/dri/0/i915_capabilities:iommu: disabled
>>>>>>>> /sys/kernel/debug/dri/1/i915_capabilities:iommu: enabled
>>>>>>>>
>>>>>>>> On my system dri device 0 is integrated graphics and 1 is discrete.
>>>>>>>
>>>>>>> The drm device 0 has a dedicated iommu. When the user request 
>>>>>>> igfx not
>>>>>>> mapped, the VT-d implementation will turn it off to save power. 
>>>>>>> But for
>>>>>>> shared iommu, you definitely will get it enabled.
>>>>>>
>>>>>> Sorry I am not following, what exactly do you mean? Is there a 
>>>>>> platform with integrated graphics without a dedicated iommu, in 
>>>>>> which case intel_iommu=igfx_off results in intel_iommu_gfx_mapped 
>>>>>> == 0 and iommu_get_domain_for_dev returning non-NULL?
>>>>>
>>>>> Your code always work for an igfx with a dedicated iommu. This 
>>>>> might be
>>>>> always true on today's platforms. But from driver's point of view, we
>>>>> should not make such assumption.
>>>>>
>>>>> For example, if the iommu implementation decides not to turn off the
>>>>> graphic iommu (perhaps due to some hw quirk or for graphic
>>>>> virtualization), your code will be broken.
>>>>
>>>> If I got it right, this would go back to your earlier recommendation 
>>>> to have the check look like this:
>>>>
>>>> static bool intel_vtd_active(struct drm_i915_private *i915)
>>>> {
>>>>          struct iommu_domain *domain;
>>>>
>>>>          domain = iommu_get_domain_for_dev(i915->drm.dev);
>>>>          if (domain && (domain->type & __IOMMU_DOMAIN_PAGING))
>>>>                  return true;
>>>>      ...
>>>>
>>>> This would be okay as a first step?
>>>>
>>>> Elsewhere in the thread Robin suggested looking at the dec->dma_ops 
>>>> and comparing against iommu_dma_ops. These two solution would be 
>>>> effectively the same?
>>>
>>> Effectively, yes. See iommu_setup_dma_ops() - the only way to end up 
>>> with iommu_dma_ops is if a managed translation domain is present; if 
>>> the IOMMU is present but the default domain type has been set to 
>>> passthrough (either globally or forced for the given device) it will 
>>> do nothing and leave you with dma-direct, while if the IOMMU has been 
>>> ignored entirely then it should never even be called. Thus it neatly 
>>> encapsulates what you're after here.
>>
>> One concern I have is whether the pass-through mode truly does nothing 
>> or addresses perhaps still go through the dmar hardware just with no 
>> translation?
> 
> Pass-through mode means the latter.
> 
>>
>> If latter then most like for like change is actually exactly what the 
>> first version of my patch did. That is replace intel_iommu_gfx_mapped 
>> with a plain non-NULL check on iommu_get_domain_for_dev.
> 
> Depends on what you want here,
> 
> #1) the graphic device works in iommu pass-through mode
>     - device have an iommu
>     - but iommu does no translation
>     - the dma transactions go through iommu with the same destination
>       memory address specified by the device;

Do you have any indications of the slowdown this adds?

> #2) the graphic device works without a system iommu
>     - the iommu is off
>     - there's no iommu on the path of DMA transaction.
> 
> My suggestion works for #1). Robin's suggestion (device_iommu_mapped())
> could work for #2).

On the question of what do I want here. It seems that to preserve 
like-for-like with the current and past i915 usage, ie. 
intel_iommu_gfx_mapped, the first version of my patch should be used.

In other words if I configure the boot with iommu=pt, then 
intel_iommu_gfx_mapped is true. So if I add the __IOMMU_DOMAIN_PAGING 
check, the new intel_vtd_active would return false, where the old 
version would return true.

So v1 of the patch feels like the safest route given I don't know which 
workarounds are due remapping slowdown, and which may be present even in 
the pass-through mode.

I would explain the situation in the comment inside intel_vtd_active for 
future reference.

Regards,

Tvrtko
