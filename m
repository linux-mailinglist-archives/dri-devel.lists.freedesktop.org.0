Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3761671B9F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966410E1C5;
	Wed, 18 Jan 2023 12:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Wed, 18 Jan 2023 10:36:13 UTC
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82CD10E628
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id D1625604E2;
 Wed, 18 Jan 2023 11:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1674037574; bh=/CQkuTXCMe5ZYD4cmyeepHJ0SWGRm6Tbss1F4Sz9Tpc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LlygKNrEOuxM6EiUi88QSSgvrZuS6ZaqSTZ4/Lm9bOZMeuZLgv2osmSyZeGAbReif
 CqM81zQWjqWxhdav1BZcdhVw6WTc1ymHZemiDJTL08PiQUAlJQy3Gal0nFZ6erqbIj
 /cCV4N4VRc0PCipONMQMx90gBu7gSg+gqfxdfGvIKd3mxYDCPFSckk6Fpx2ldgXmS/
 mQq6RNlQbvE9bJC9Y9bJaZVrdXXs+b28elqpFgjCpGuY+F7q7BRByhiiZR8o2jdkuU
 tsSWkhs2rm7pM2ID2H4LcPXiIanos6e6U09S6ETzDu7VK0tMBEMq8p/5ZbQ9MAosSd
 S6bbYdRC1wppg==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9eHXlAMt0bbg; Wed, 18 Jan 2023 11:26:12 +0100 (CET)
Received: from [193.198.186.200] (pc-mtodorov.slava.alu.hr [193.198.186.200])
 by domac.alu.hr (Postfix) with ESMTPSA id 09F99604E0;
 Wed, 18 Jan 2023 11:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1674037572; bh=/CQkuTXCMe5ZYD4cmyeepHJ0SWGRm6Tbss1F4Sz9Tpc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZWlefJgViKdFQCz5gv6BD0o4hnHXLW1D7WBDzjj0iyjQ8zpjP3OuEvuZGOnQIUIfn
 CwKvhG3BP6udkEc2ihaBPuU3/GXvW+Z6OM1FgpYrwfvIusX1kd0iPma+vusP6MfFbi
 P5vYXcL7S0icTPT77FUYcizOuoAaNP+xLXH6LAxHdEEMMTeixJjS3d5m3XKJBxRo+t
 hZ1SlIBVeqH/xmGs2C87/edRmxyDwsBQWnACYUjTG83zotFaCIFj2cf/vEPujXEFp4
 HhHZjJBuvRA6FJxIfNu9JGgYGTzDXAFa8cSIfEtnU7qU7k7WGPZ+i92I9NApOzhyRU
 CwQ5VelC7SOkw==
Message-ID: <c7986b6f-f5f2-52a8-c109-6fb25762a30b@alu.unizg.hr>
Date: Wed, 18 Jan 2023 11:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/i915: Fix a memory leak with reused mmap_offset
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <20230117175236.22317-2-nirmoy.das@intel.com>
 <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
Content-Language: en-US, hr
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 12:12:42 +0000
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/18/23 10:19, Tvrtko Ursulin wrote:

> Thanks for working on this, it looks good to me and it aligns with how i915 uses the facility.
> 
> Copying Mirsad who reported the issue in case he is still happy to give it a quick test. Mirsad, I don't know if you are subscribed 
> to one of the two mailing lists where series was posted. In case not, you can grab both patches from 
> https://patchwork.freedesktop.org/series/112952/.
> 
> Nirmoy - we also have an IGT written by Chuansheng - https://patchwork.freedesktop.org/patch/515720/?series=101035&rev=4. A more 
> generic one could be placed in gem_mmap_offset test but this one works too in my testing and is IMO better than nothing.
> 
> Finally, let me add some tags below:
> 
> On 17/01/2023 17:52, Nirmoy Das wrote:
>> drm_vma_node_allow() and drm_vma_node_revoke() should be called in
>> balanced pairs. We call drm_vma_node_allow() once per-file everytime a
>> user calls mmap_offset, but only call drm_vma_node_revoke once per-file
>> on each mmap_offset. As the mmap_offset is reused by the client, the
>> per-file vm_count may remain non-zero and the rbtree leaked.
>>
>> Call drm_vma_node_allow_once() instead to prevent that memory leak.
>>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Fixes: 786555987207 ("drm/i915/gem: Store mmap_offsets in an rbtree rather than a plain list")
> Reported-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
> Cc: <stable@vger.kernel.org> # v5.7+
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Regards,
> 
> Tvrtko
> 
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 4f69bff63068..2aac6bf78740 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>       GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>>   out:
>>       if (file)
>> -        drm_vma_node_allow(&mmo->vma_node, file);
>> +        drm_vma_node_allow_once(&mmo->vma_node, file);
>>       return mmo;
>>   err:

The drm/i915 patch seems OK and there are currently no memory leaks as of
reported by /sys/kernel/debug/kmemleak under the same Chrome load that triggered
the initial bug ...

Will post you if there are any changes.

Regards,
Mirsad

-- 
Mirsad Goran Todorovac
Sistem inženjer
Grafički fakultet | Akademija likovnih umjetnosti
Sveučilište u Zagrebu

System engineer
Faculty of Graphic Arts | Academy of Fine Arts
University of Zagreb, Republic of Croatia
