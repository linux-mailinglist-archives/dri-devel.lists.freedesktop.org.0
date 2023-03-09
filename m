Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E16B20CB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF4810E7D4;
	Thu,  9 Mar 2023 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF6A10E0CE;
 Thu,  9 Mar 2023 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678355969; x=1709891969;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R166YUdWDPBYqEpmrup6ecgAZyUoAIe8RzWijm+Uj/U=;
 b=WEuPHSTRCTcoMmTIHOlxk934mviaQhDOQqUsXp3YhmVgsvS+u3lpC1D3
 +o7e6V6ftRRtfUsTscNcjbhs88Hr0t/2nbSlW7xV7GKKk5PTm7Y4CgDP2
 rhpKMcOW7OYtnFFT5J0jeIUEVxQy4ZiT8j1AhABdg+qsGKv1RkpeGReio
 3Q6WAst+naNdVlYtCj0sUc9GvuSBLf8KM67veiPVSAWH1gHm+U+aeK5t8
 9E0dlbIGA83j9n5rn3jfq+gHaAg8RCimhL40BmsVYQu5oAjyTEfe8sEGl
 wQv7nJssRPPRE5jbnzSTovSdJJIwBby/cYR7P3X4ZN+vTzaIj4tYZ37Ra w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338743000"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="338743000"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 01:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679691409"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="679691409"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.176])
 ([10.213.18.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 01:59:25 -0800
Message-ID: <21879b92-35d7-6a80-7c27-b681860906ec@intel.com>
Date: Thu, 9 Mar 2023 10:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/4] drm/i915: add guard page to ggtt->error_capture
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
 <20230308-guard_error_capture-v5-4-6d1410d13540@intel.com>
 <93cbaa9f-6ec3-5843-7527-8e81b3ee091d@linux.intel.com>
 <1372db7c-7d65-cd28-43fc-1b04f57bef11@intel.com>
 <b90e8e31-1729-175c-2fdb-85fb51db4fdc@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b90e8e31-1729-175c-2fdb-85fb51db4fdc@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09.03.2023 10:43, Tvrtko Ursulin wrote:
>
> On 09/03/2023 09:34, Andrzej Hajda wrote:
>>
>>
>> On 09.03.2023 10:08, Tvrtko Ursulin wrote:
>>>
>>> On 08/03/2023 15:39, Andrzej Hajda wrote:
>>>> Write-combining memory allows speculative reads by CPU.
>>>> ggtt->error_capture is WC mapped to CPU, so CPU/MMU can try
>>>> to prefetch memory beyond the error_capture, ie it tries
>>>> to read memory pointed by next PTE in GGTT.
>>>> If this PTE points to invalid address DMAR errors will occur.
>>>> This behaviour was observed on ADL and RPL platforms.
>>>> To avoid it, guard scratch page should be added after error_capture.
>>>> The patch fixes the most annoying issue with error capture but
>>>> since WC reads are used also in other places there is a risk similar
>>>> problem can affect them as well.
>>>>
>>>> v2:
>>>>    - modified commit message (I hope the diagnosis is correct),
>>>>    - added bug checks to ensure scratch is initialized on gen3 
>>>> platforms.
>>>>      CI produces strange stacktrace for it suggesting scratch[0] is 
>>>> NULL,
>>>>      to be removed after resolving the issue with gen3 platforms.
>>>> v3:
>>>>    - removed bug checks, replaced with gen check.
>>>> v4:
>>>>    - change code for scratch page insertion to support all platforms,
>>>>    - add info in commit message there could be more similar issues
>>>> v5:
>>>>    - check for nop_clear_range instead of gen8 (Tvrtko),
>>>>    - re-insert scratch pages on resume (Tvrtko)
>>>>
>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_ggtt.c | 35 
>>>> +++++++++++++++++++++++++++++++----
>>>>   1 file changed, 31 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> index b925da42c7cfc4..8fb700fde85c8f 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> @@ -502,6 +502,21 @@ static void cleanup_init_ggtt(struct i915_ggtt 
>>>> *ggtt)
>>>>       mutex_destroy(&ggtt->error_mutex);
>>>>   }
>>>>   +static void
>>>> +ggtt_insert_scratch_pages(struct i915_ggtt *ggtt, u64 offset, u64 
>>>> length)
>>>> +{
>>>> +    struct i915_address_space *vm = &ggtt->vm;
>>>> +
>>>> +    if (vm->clear_range != nop_clear_range)
>>>
>>> Hm I thought usually we would add a prefix for exported stuff, like 
>>> in this case i915_vm_nop_clear_range, however I see intel_gtt.h 
>>> exports a bunch of stuff with no prefixes already so I guess you 
>>> could continue like that by inertia. The conundrum also could have 
>>> been avoided if you left it static (leaving out dpt and mock_gtt 
>>> patches) but no strong opinion from me.
>>>
>>>> +        return vm->clear_range(vm, offset, length);
>>>> +
>>>> +    while (length > 0) {
>>>> +        vm->insert_page(vm, px_dma(vm->scratch[0]), offset, 
>>>> I915_CACHE_NONE, 0);
>>>> +        offset += I915_GTT_PAGE_SIZE;
>>>> +        length -= I915_GTT_PAGE_SIZE;
>>>> +    }
>>>> +}
>>>> +
>>>>   static int init_ggtt(struct i915_ggtt *ggtt)
>>>>   {
>>>>       /*
>>>> @@ -550,8 +565,12 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>>>            * paths, and we trust that 0 will remain reserved. However,
>>>>            * the only likely reason for failure to insert is a driver
>>>>            * bug, which we expect to cause other failures...
>>>> +         *
>>>> +         * Since CPU can perform speculative reads on error capture
>>>> +         * (write-combining allows it) add scratch page after error
>>>> +         * capture to avoid DMAR errors.
>>>>            */
>>>> -        ggtt->error_capture.size = I915_GTT_PAGE_SIZE;
>>>> +        ggtt->error_capture.size = 2 * I915_GTT_PAGE_SIZE;
>>>>           ggtt->error_capture.color = I915_COLOR_UNEVICTABLE;
>>>>           if (drm_mm_reserve_node(&ggtt->vm.mm, &ggtt->error_capture))
>>>> drm_mm_insert_node_in_range(&ggtt->vm.mm,
>>>> @@ -561,11 +580,15 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>>>                               0, ggtt->mappable_end,
>>>>                               DRM_MM_INSERT_LOW);
>>>>       }
>>>> -    if (drm_mm_node_allocated(&ggtt->error_capture))
>>>> +    if (drm_mm_node_allocated(&ggtt->error_capture)) {
>>>> +        u64 start = ggtt->error_capture.start;
>>>> +        u64 size = ggtt->error_capture.size;
>>>> +
>>>> +        ggtt_insert_scratch_pages(ggtt, start, size);
>>>>           drm_dbg(&ggtt->vm.i915->drm,
>>>>               "Reserved GGTT:[%llx, %llx] for use by error capture\n",
>>>> -            ggtt->error_capture.start,
>>>> -            ggtt->error_capture.start + ggtt->error_capture.size);
>>>> +            start, start + size);
>>>> +    }
>>>>         /*
>>>>        * The upper portion of the GuC address space has a sizeable 
>>>> hole
>>>> @@ -1256,6 +1279,10 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>>>         flush = i915_ggtt_resume_vm(&ggtt->vm);
>>>>   +    if (drm_mm_node_allocated(&ggtt->error_capture))
>>>> +        ggtt_insert_scratch_pages(ggtt, ggtt->error_capture.start,
>>>> +                      ggtt->error_capture.size);
>>>
>>> Maybe it belongs in i915_ggtt_resume_vm since that one deals with 
>>> PTEs? Looks like it to me, but ack either way.
>>
>> i915_ggtt_resume_vm is called for ggtt and dpt. Of course I could add 
>> conditionals there checking if it is ggtt, but in such situation 
>> i915_ggtt_resume seems more natural candidate.
>
> "if (drm_mm_node_allocated(&ggtt->error_capture))" check would handle 
> that automatically, no? i915_ggtt_resume has nothing about PTEs at the 
> moment..

Yes but since i915_ggtt_resume_vm  has vm as an argument (ie it operates 
on generic vm), there will be needed downcasting somewhere:
if (vm->is_ggtt) {
     struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
     if (drm_mm_node_allocated(&ggtt->error_capture))
         ...
}

In i915_ggtt_resume we have it for free, but moreover 
i915_ggtt_resume_vm (despite its name) seems to handle common stuff of 
ggtt and dpt, and i915_ggtt_resume looks as specific for ggtt, similarly 
intel_dpt_resume is specific for dpt.
If it does not convince you, I will update patch with above code.

Regards
Andrzej

>
> Regards,
>
> Tvrtko

