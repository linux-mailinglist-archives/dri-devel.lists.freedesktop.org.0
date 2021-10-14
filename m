Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7778D42DB5E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 16:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101AF6E2ED;
	Thu, 14 Oct 2021 14:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25646E2ED;
 Thu, 14 Oct 2021 14:21:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="208488425"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="208488425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 07:21:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="481275921"
Received: from gprashan-mobl4.ger.corp.intel.com (HELO [10.252.26.144])
 ([10.252.26.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 07:21:16 -0700
Subject: Re: [PATCH 03/14] drm/i915/xehpsdv: enforce min GTT alignment
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-4-ramalingam.c@intel.com>
 <YWbhYrNaT0TS1D3a@phenom.ffwll.local>
 <50362606-46a1-0a41-8063-5dca5ac99b98@intel.com>
 <YWgxqGYS8Ps3JtqD@phenom.ffwll.local>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ff05dba2-9626-4afe-93f2-eb0151fec363@intel.com>
Date: Thu, 14 Oct 2021 15:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YWgxqGYS8Ps3JtqD@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 14/10/2021 14:33, Daniel Vetter wrote:
> On Wed, Oct 13, 2021 at 03:13:33PM +0100, Matthew Auld wrote:
>> On 13/10/2021 14:38, Daniel Vetter wrote:
>>> On Mon, Oct 11, 2021 at 09:41:44PM +0530, Ramalingam C wrote:
>>>> From: Matthew Auld <matthew.auld@intel.com>
>>>>
>>>> For local-memory objects we need to align the GTT addresses to 64K, both
>>>> for the ppgtt and ggtt.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>> Do we still need this with relocations removed? Userspace is picking all
>>> the addresses for us, so all we have to check is whether userspace got it
>>> right.
>>
>> Yeah, for OFFSET_FIXED this just validates that the provided address is
>> correctly aligned to 64K, while for the in-kernel insertion stuff we still
>> need to allocate an address that is aligned to 64K. Setting the alignment
>> here handles both cases.
> 
> Can't we just teach any in-kernel allocators to align to 2M and call it a
> day? Ofc the code can still validate we don't have bugs (always good to
> check your work). Ofc if the benefits is "no code can be removed anyway
> since we still need to check" then ofc no point :-)

Yeah, if we want to make it 2M, then we still need to add that here, 
like with 64K.

> 
> Just want to make sure we're not carrying complexity around for nothing,
> since this predates the relocation removal.

If we were to just make everything 2M then we can in theory ditch all 
the colouring stuff. Assuming userspace is happy with 2M or nothing, 
then it just means potentially terrible utilisation of the ppGTT for the 
kernel, but maybe that doesn't matter much really? For userspace maybe 
they will have some kind of sub-allocation scheme?

Well actually I guess it would be 2M alignment + 2M vma padding for 
anything that can be placed in I915_MEMORY_CLASS_DEVICE, including mixed 
objects. And then the usual 4K alignment for I915_MEMORY_CLASS_SYSTEM 
only objects.


> -Daniel
> 
>>
>>> -Daniel
>>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/i915/i915_vma.c | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>>> index 4b7fc4647e46..1ea1fa08efdf 100644
>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>> @@ -670,8 +670,13 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>>>>    	}
>>>>    	color = 0;
>>>> -	if (vma->obj && i915_vm_has_cache_coloring(vma->vm))
>>>> -		color = vma->obj->cache_level;
>>>> +	if (vma->obj) {
>>>> +		if (HAS_64K_PAGES(vma->vm->i915) && i915_gem_object_is_lmem(vma->obj))
>>>> +			alignment = max(alignment, I915_GTT_PAGE_SIZE_64K);
>>>> +
>>>> +		if (i915_vm_has_cache_coloring(vma->vm))
>>>> +			color = vma->obj->cache_level;
>>>> +	}
>>>>    	if (flags & PIN_OFFSET_FIXED) {
>>>>    		u64 offset = flags & PIN_OFFSET_MASK;
>>>> -- 
>>>> 2.20.1
>>>>
>>>
> 
