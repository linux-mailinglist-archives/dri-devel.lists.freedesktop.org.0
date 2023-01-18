Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E93672B42
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 23:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313610E203;
	Wed, 18 Jan 2023 22:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263C310E03C;
 Wed, 18 Jan 2023 22:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id 1D12D604E2;
 Wed, 18 Jan 2023 23:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1674080830; bh=TCtw5W/otp9Lmo8VLF38/XRhIJ4N0Ocld000epm7IyU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SgyCxLyr1t1FpZtoumaHW44P60jGMHILtLfMFOkA0bia6B5aAulX3s5v7/uZuxYlN
 ngiTBA5U/46/LA/sgL/QLkfrtwmilPnORF6ycpQPYCIa5kSnlOIpOFlRacWQs9sPfI
 XLh3EsxYlx1au72duWzFlwcQHfCaAY4KR02pV9koiIkYkbkTLC1kahlRzrBN+qoOi1
 92pbUaN9VfHJxHgwuS7eLnkoem5bxSudkUn+FigTHpyT01D21HAYhqWEwJunagMP8i
 +qKtZYb7w0oNnqN3XgRKmhUF4tLC4gwZlHBCh/RK9FXhB8l9yELbDqwgK1j4dj11b5
 skr+zTKip9vcw==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwj7WqEPtmn2; Wed, 18 Jan 2023 23:27:06 +0100 (CET)
Received: from [192.168.0.12] (unknown [188.252.199.103])
 by domac.alu.hr (Postfix) with ESMTPSA id 76FF2604E0;
 Wed, 18 Jan 2023 23:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1674080826; bh=TCtw5W/otp9Lmo8VLF38/XRhIJ4N0Ocld000epm7IyU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uXLWQP+/HQcc5S/qqBStbHdW6YxMoph76Rbv1eXTscfDWFZKFdz62kgRgEAFMToGg
 Ah8yJctZaYhYHI9GpH+v54tnPIIlNmDeLzwrtCEiA0MYtUPBY7Xc6E5zIunkspyDfB
 5eCPLMmadEBcabDEf2HaDQYUxcTYBV3AVJunjprYW9EaQODdwpfrHjp2sTnNkvGvQb
 yGdDOanEH/KGf8LPttykXvwuEuV9tuZvssywUyyqbcb1qIZeTeoFEoxA3qLTI+gKt7
 1+NwADoXPhmoCLrJj5+8Gk7uy9HG1Fj9txn+qRdc3nI39BT2y2Htri9q6jDx/8YQ+u
 uUt59KsN9fRrQ==
Message-ID: <1d0d994f-6f51-6a25-e850-0cf9740078c0@alu.unizg.hr>
Date: Wed, 18 Jan 2023 23:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Fix a memory leak with reused
 mmap_offset
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <20230117175236.22317-2-nirmoy.das@intel.com>
 <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
 <c7986b6f-f5f2-52a8-c109-6fb25762a30b@alu.unizg.hr>
 <48974dd7-1449-3f9f-24c1-5071e73dd807@linux.intel.com>
Content-Language: en-US, hr
From: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <48974dd7-1449-3f9f-24c1-5071e73dd807@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 18. 01. 2023. 11:39, Das, Nirmoy wrote:
>>>
>>> Copying Mirsad who reported the issue in case he is still happy to give it a quick test. Mirsad, I don't know if you are subscribed to one of the two mailing lists where series was posted. In case not, you can grab both patches from https://patchwork.freedesktop.org/series/112952/.
>>>
>>> Nirmoy - we also have an IGT written by Chuansheng - https://patchwork.freedesktop.org/patch/515720/?series=101035&rev=4. A more generic one could be placed in gem_mmap_offset test but this one works too in my testing and is IMO better than nothing.
>>>
>>> Finally, let me add some tags below:
>>>
>>> On 17/01/2023 17:52, Nirmoy Das wrote:
>>>> drm_vma_node_allow() and drm_vma_node_revoke() should be called in
>>>> balanced pairs. We call drm_vma_node_allow() once per-file everytime a
>>>> user calls mmap_offset, but only call drm_vma_node_revoke once per-file
>>>> on each mmap_offset. As the mmap_offset is reused by the client, the
>>>> per-file vm_count may remain non-zero and the rbtree leaked.
>>>>
>>>> Call drm_vma_node_allow_once() instead to prevent that memory leak.
>>>>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>
>>> Fixes: 786555987207 ("drm/i915/gem: Store mmap_offsets in an rbtree rather than a plain list")
>>> Reported-by: Chuansheng Liu <chuansheng.liu@intel.com>
>>> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
>>> Cc: <stable@vger.kernel.org> # v5.7+
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> index 4f69bff63068..2aac6bf78740 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> @@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>>>       GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>>>>   out:
>>>>       if (file)
>>>> -        drm_vma_node_allow(&mmo->vma_node, file);
>>>> +        drm_vma_node_allow_once(&mmo->vma_node, file);
>>>>       return mmo;
>>>>   err:
>>
>> The drm/i915 patch seems OK and there are currently no memory leaks as of
>> reported by /sys/kernel/debug/kmemleak under the same Chrome load that triggered
>> the initial bug ...
> 
> 
> Thanks, Mirsad for quickly checking this!

P.S.

Dear Nirmoy,

To let me explain, as I work on the Academy of Fine Arts and the Faculty of Graphic Arts,
video and multimedia drivers are of my special interest, so I kinda enjoyed this one.

No need to thank. ;-)

In case of more bugs discovered, I will be glad to test on my available platforms,
considering it a part of my research. I can justify time spent on graphic and multimedia
drivers, so it is not a big deal.

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
The European Union

