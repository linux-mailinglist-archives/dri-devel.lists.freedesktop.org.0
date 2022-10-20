Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DE605ADC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F19710E617;
	Thu, 20 Oct 2022 09:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8B10E617;
 Thu, 20 Oct 2022 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666257372; x=1697793372;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ifEooFtq9t430GKJrRsIYA+SdZVDk/uO6e2XoYUEky0=;
 b=H671+1dE6p5bZIVB1YVn2YvBh84BKzH5UTccPnlvbr2wyxgFlOOHf7Sz
 jLccJMbjiIUEapXudvWQWR3XORAgkMO1tPprrYwwW/qOqfhQJ13c0Uymc
 1kXsWS10HvV6xwwdfyZQ6bmHP6uiq9e3c2hdMyYrHstgh1HiC6pKe9NwR
 SvhHV2obhx3i11aqBXIAeYwstmoxYA0rdsbxUaSpV1578z8WI5lWkXpPe
 HPyHCqsZlcT3VkwOQPVjqegqlB/gYWJD5SgMfn1Mm3PINUECkEbNvAwuE
 aI0uhU9wlMZO53uYXRr57avI5crp1Xm7Ae3Xpm9/bh8HGDQkRqvqgFgJo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="287057678"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="287057678"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 02:16:11 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698543188"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="698543188"
Received: from tcarvalx-mobl.ger.corp.intel.com (HELO [10.252.12.144])
 ([10.252.12.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 02:16:08 -0700
Message-ID: <f4c92d7f-8ac8-72df-85bb-a1b00f29cf92@intel.com>
Date: Thu, 20 Oct 2022 10:16:06 +0100
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
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y1BB5vMCMCKgi2Ar@nvishwa1-DESK>
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

On 19/10/2022 19:28, Niranjana Vishwanathapura wrote:
> On Wed, Oct 19, 2022 at 05:07:31PM +0100, Matthew Auld wrote:
>> On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>> Ensure i915_vma_verify_bind_complete() handles case where bind
>>> is not initiated. Also make it non static, add documentation
>>> and move it out of CONFIG_DRM_I915_DEBUG_GEM.
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/i915_vma.c | 16 +++++++++++-----
>>>  drivers/gpu/drm/i915/i915_vma.h |  1 +
>>>  2 files changed, 12 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>> b/drivers/gpu/drm/i915/i915_vma.c
>>> index eaa13e9ba966..4975fc662c86 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>> @@ -439,12 +439,21 @@ int i915_vma_sync(struct i915_vma *vma)
>>>      return i915_vm_sync(vma->vm);
>>>  }
>>> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>> -static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>> +/**
>>> + * i915_vma_verify_bind_complete() - Check for the bind completion 
>>> of the vma
>>> + * @vma: vma to check for bind completion
>>
>> Maybe mention the locking since this is now more than just DEBUG_GEM 
>> stuff. I assume we need the object lock or otherwise some guarantee 
>> that the vma is pinned?
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
> 
> I think they are not needed. The fence reference is obtained under rcu
> lock anyhow (will add this to documentation). Only thing required is
> that vma is not released, but that caller must ensure for all i915_vma
> apis anyhow.

I was thinking more about how this potentially behaves with concurrent 
bind/unbind, and what it might return in such cases. I'm assuming most 
normal users will want to have an active pin and/or be holding the 
object lock when calling this.

> 
> Thanks,
> Niranjana
> 
>>> + *
>>> + * Returns: 0 if the vma bind is completed. Error code otherwise.
>>> + */
>>> +int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>>  {
>>>      struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
>>>      int err;
>>> +    /* Ensure vma bind is initiated */
>>> +    if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))

Just realised that this leaks the fence. I guess we have yet to hit this 
in testing.

>>> +        return -EINVAL;
>>> +
>>>      if (!fence)
>>>          return 0;
>>> @@ -457,9 +466,6 @@ static int i915_vma_verify_bind_complete(struct 
>>> i915_vma *vma)
>>>      return err;
>>>  }
>>> -#else
>>> -#define i915_vma_verify_bind_complete(_vma) 0
>>> -#endif
>>>  I915_SELFTEST_EXPORT void
>>>  i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>> b/drivers/gpu/drm/i915/i915_vma.h
>>> index 1cadbf8fdedf..04770f8ba815 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.h
>>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>>> @@ -440,6 +440,7 @@ void i915_vma_make_purgeable(struct i915_vma *vma);
>>>  int i915_vma_wait_for_bind(struct i915_vma *vma);
>>>  int i915_vma_sync(struct i915_vma *vma);
>>> +int i915_vma_verify_bind_complete(struct i915_vma *vma);
>>>  /**
>>>   * i915_vma_get_current_resource - Get the current resource of the vma
