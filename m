Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B216C6066BC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 19:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1318D10E8C0;
	Thu, 20 Oct 2022 17:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07810E8C0;
 Thu, 20 Oct 2022 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666285673; x=1697821673;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dfdl6kCx7qDna+YyeP4To5OjhT1xiDMde/2id2wlzRg=;
 b=RBaJ6gqA5y2roHtiQIZLTEJtddtzGlV/DK9+CorFT6jInx2JU0FHujIe
 tCOP7RMIBlMHYK6wBYg+1J8/pDX1VOz4RFnw7zyQf0VniM0UhLFatImiT
 ldzLZH06xqQkulixayxO2VZNPNvYlY2RDFYd8LDNStq0zqKM86oW23QFj
 t0CRXgWjD3hXWlhjq9W2UmFws1ToKBoo6QzJ4uEKVAHPN4hWAOUzwaRis
 ++vT+8MtsxiT0DQu46zKTkl42Xbu4VWHw0lpDgTVQtSPSvPHuwgBPWgt1
 EiEAv5BBrRQmdIVqxuYWa5LoQPXHMXryHi0nGkMZXqyyyA5p8IuCmkZCc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="290081550"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="290081550"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:06:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755263648"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="755263648"
Received: from tcarvalx-mobl.ger.corp.intel.com (HELO [10.252.12.144])
 ([10.252.12.144])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:06:18 -0700
Message-ID: <5704a345-61a6-faa7-2542-9a6cadde3e01@intel.com>
Date: Thu, 20 Oct 2022 18:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 13/17] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-14-niranjana.vishwanathapura@intel.com>
 <33e7d512-c78d-dfff-0bcd-0cdf94af384a@intel.com>
 <Y1BB5vMCMCKgi2Ar@nvishwa1-DESK>
 <f4c92d7f-8ac8-72df-85bb-a1b00f29cf92@intel.com>
 <Y1F8jk5AlssGrl7U@nvishwa1-DESK>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y1F8jk5AlssGrl7U@nvishwa1-DESK>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/10/2022 17:51, Niranjana Vishwanathapura wrote:
> On Thu, Oct 20, 2022 at 10:16:06AM +0100, Matthew Auld wrote:
>> On 19/10/2022 19:28, Niranjana Vishwanathapura wrote:
>>> On Wed, Oct 19, 2022 at 05:07:31PM +0100, Matthew Auld wrote:
>>>> On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>>>> Ensure i915_vma_verify_bind_complete() handles case where bind
>>>>> is not initiated. Also make it non static, add documentation
>>>>> and move it out of CONFIG_DRM_I915_DEBUG_GEM.
>>>>>
>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>> <niranjana.vishwanathapura@intel.com>
>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/i915/i915_vma.c | 16 +++++++++++-----
>>>>>  drivers/gpu/drm/i915/i915_vma.h |  1 +
>>>>>  2 files changed, 12 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>> b/drivers/gpu/drm/i915/i915_vma.c
>>>>> index eaa13e9ba966..4975fc662c86 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>> @@ -439,12 +439,21 @@ int i915_vma_sync(struct i915_vma *vma)
>>>>>      return i915_vm_sync(vma->vm);
>>>>>  }
>>>>> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>>>> -static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>>>> +/**
>>>>> + * i915_vma_verify_bind_complete() - Check for the bind completion 
>>>>> of the vma
>>>>> + * @vma: vma to check for bind completion
>>>>
>>>> Maybe mention the locking since this is now more than just DEBUG_GEM 
>>>> stuff. I assume we need the object lock or otherwise some guarantee 
>>>> that the vma is pinned?
>>>>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>
>>>
>>> I think they are not needed. The fence reference is obtained under rcu
>>> lock anyhow (will add this to documentation). Only thing required is
>>> that vma is not released, but that caller must ensure for all i915_vma
>>> apis anyhow.
>>
>> I was thinking more about how this potentially behaves with concurrent 
>> bind/unbind, and what it might return in such cases. I'm assuming most 
>> normal users will want to have an active pin and/or be holding the 
>> object lock when calling this.
>>
> 
> Unbind will anyway wait behind this fence. As it is just returning the
> exclusive fence status, I think it should be fine even for concurrent
> cases. Any specific sequence you are concerned with?
> For vm_bind use case, we do have the object lock while calling it, but
> I am not certain about the i915_vma_pin_iomap() use case. The permerge
> CI result is clean though.

Yeah, all current users are either holding the lock and/or have an 
active vma pin which they want to check (like in pin_iomap()). I figure 
that's what most users probably want and does seem quite sensible, so 
adding that to the kernel-doc might be useful. But it doesn't really 
matter that much I guess.

> 
>>>
>>> Thanks,
>>> Niranjana
>>>
>>>>> + *
>>>>> + * Returns: 0 if the vma bind is completed. Error code otherwise.
>>>>> + */
>>>>> +int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>>>>  {
>>>>>      struct dma_fence *fence = 
>>>>> i915_active_fence_get(&vma->active.excl);
>>>>>      int err;
>>>>> +    /* Ensure vma bind is initiated */
>>>>> +    if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
>>
>> Just realised that this leaks the fence. I guess we have yet to hit 
>> this in testing.
> 
> Ah...will move i915_active_fence_get() below.
> 
> Thanks,
> Niranjana
> 
>>
>>>>> +        return -EINVAL;
>>>>> +
>>>>>      if (!fence)
>>>>>          return 0;
>>>>> @@ -457,9 +466,6 @@ static int i915_vma_verify_bind_complete(struct 
>>>>> i915_vma *vma)
>>>>>      return err;
>>>>>  }
>>>>> -#else
>>>>> -#define i915_vma_verify_bind_complete(_vma) 0
>>>>> -#endif
>>>>>  I915_SELFTEST_EXPORT void
>>>>>  i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
>>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>> b/drivers/gpu/drm/i915/i915_vma.h
>>>>> index 1cadbf8fdedf..04770f8ba815 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_vma.h
>>>>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>> @@ -440,6 +440,7 @@ void i915_vma_make_purgeable(struct i915_vma 
>>>>> *vma);
>>>>>  int i915_vma_wait_for_bind(struct i915_vma *vma);
>>>>>  int i915_vma_sync(struct i915_vma *vma);
>>>>> +int i915_vma_verify_bind_complete(struct i915_vma *vma);
>>>>>  /**
>>>>>   * i915_vma_get_current_resource - Get the current resource of the 
>>>>> vma
