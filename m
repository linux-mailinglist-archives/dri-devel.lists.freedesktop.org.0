Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC29E67191B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9552C10E628;
	Wed, 18 Jan 2023 10:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4310E628;
 Wed, 18 Jan 2023 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674038401; x=1705574401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+UHlhWBgAnUOYe7rChfAI6zr+d9ugvyTlid9Tq11pNk=;
 b=M0yjlasbjoVws9BiolnmlXPxNkCeKOCC8ENKRkZ1NO+IID/Cdd6gMq61
 u5h4L+36v5sxjnRKrwU+RxFN8KUReEbUlMwEHx7FTltEbTPdAKSoQ75L/
 OxmZMT2OIVyoYEg1wQw+9YnxSvhpVHdcg/i+M1oy6KxXlVAarkvwEusYi
 CbJz5INty2SezWwGAlVfqyKpbCtNVWxx5NQufdGo8wXiWZeiS6gBo9ank
 Z/z0/3ks7vj05xO3sDsw5l2oO7wv8jjRzkq8+NEgsox32YMsT4mz/ner3
 OoV78NMXaG9fo44HJNCZlZT2kVMb086CSW+X5ReUbwMJJNG6NRMeYSAJc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326223491"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326223491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 02:40:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833516651"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833516651"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.41.107])
 ([10.252.41.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 02:39:59 -0800
Message-ID: <48974dd7-1449-3f9f-24c1-5071e73dd807@linux.intel.com>
Date: Wed, 18 Jan 2023 11:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Fix a memory leak with reused
 mmap_offset
Content-Language: en-US
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <20230117175236.22317-2-nirmoy.das@intel.com>
 <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
 <c7986b6f-f5f2-52a8-c109-6fb25762a30b@alu.unizg.hr>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <c7986b6f-f5f2-52a8-c109-6fb25762a30b@alu.unizg.hr>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/18/2023 11:26 AM, Mirsad Todorovac wrote:
> Hi,
>
> On 1/18/23 10:19, Tvrtko Ursulin wrote:
>
>> Thanks for working on this, it looks good to me and it aligns with 
>> how i915 uses the facility.
>>
>> Copying Mirsad who reported the issue in case he is still happy to 
>> give it a quick test. Mirsad, I don't know if you are subscribed to 
>> one of the two mailing lists where series was posted. In case not, 
>> you can grab both patches from 
>> https://patchwork.freedesktop.org/series/112952/.
>>
>> Nirmoy - we also have an IGT written by Chuansheng - 
>> https://patchwork.freedesktop.org/patch/515720/?series=101035&rev=4. 
>> A more generic one could be placed in gem_mmap_offset test but this 
>> one works too in my testing and is IMO better than nothing.
>>
>> Finally, let me add some tags below:
>>
>> On 17/01/2023 17:52, Nirmoy Das wrote:
>>> drm_vma_node_allow() and drm_vma_node_revoke() should be called in
>>> balanced pairs. We call drm_vma_node_allow() once per-file everytime a
>>> user calls mmap_offset, but only call drm_vma_node_revoke once per-file
>>> on each mmap_offset. As the mmap_offset is reused by the client, the
>>> per-file vm_count may remain non-zero and the rbtree leaked.
>>>
>>> Call drm_vma_node_allow_once() instead to prevent that memory leak.
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> Fixes: 786555987207 ("drm/i915/gem: Store mmap_offsets in an rbtree 
>> rather than a plain list")
>> Reported-by: Chuansheng Liu <chuansheng.liu@intel.com>
>> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
>> Cc: <stable@vger.kernel.org> # v5.7+
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> index 4f69bff63068..2aac6bf78740 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> @@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>>       GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>>>   out:
>>>       if (file)
>>> -        drm_vma_node_allow(&mmo->vma_node, file);
>>> +        drm_vma_node_allow_once(&mmo->vma_node, file);
>>>       return mmo;
>>>   err:
>
> The drm/i915 patch seems OK and there are currently no memory leaks as of
> reported by /sys/kernel/debug/kmemleak under the same Chrome load that 
> triggered
> the initial bug ...


Thanks, Mirsad for quickly checking this!


Nirmoy

>
> Will post you if there are any changes.
>
> Regards,
> Mirsad
>
