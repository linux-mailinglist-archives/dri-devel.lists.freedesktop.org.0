Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E5B42C289
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B28289C33;
	Wed, 13 Oct 2021 14:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57BE6E044;
 Wed, 13 Oct 2021 14:13:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="224878729"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="224878729"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:13:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="592192071"
Received: from shasnaak-mobl1.gar.corp.intel.com (HELO [10.213.158.244])
 ([10.213.158.244])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:13:42 -0700
Subject: Re: [PATCH 03/14] drm/i915/xehpsdv: enforce min GTT alignment
To: Daniel Vetter <daniel@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-4-ramalingam.c@intel.com>
 <YWbhYrNaT0TS1D3a@phenom.ffwll.local>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <50362606-46a1-0a41-8063-5dca5ac99b98@intel.com>
Date: Wed, 13 Oct 2021 15:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YWbhYrNaT0TS1D3a@phenom.ffwll.local>
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

On 13/10/2021 14:38, Daniel Vetter wrote:
> On Mon, Oct 11, 2021 at 09:41:44PM +0530, Ramalingam C wrote:
>> From: Matthew Auld <matthew.auld@intel.com>
>>
>> For local-memory objects we need to align the GTT addresses to 64K, both
>> for the ppgtt and ggtt.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Do we still need this with relocations removed? Userspace is picking all
> the addresses for us, so all we have to check is whether userspace got it
> right.

Yeah, for OFFSET_FIXED this just validates that the provided address is 
correctly aligned to 64K, while for the in-kernel insertion stuff we 
still need to allocate an address that is aligned to 64K. Setting the 
alignment here handles both cases.

> -Daniel
> 
> 
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 4b7fc4647e46..1ea1fa08efdf 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -670,8 +670,13 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>>   	}
>>   
>>   	color = 0;
>> -	if (vma->obj && i915_vm_has_cache_coloring(vma->vm))
>> -		color = vma->obj->cache_level;
>> +	if (vma->obj) {
>> +		if (HAS_64K_PAGES(vma->vm->i915) && i915_gem_object_is_lmem(vma->obj))
>> +			alignment = max(alignment, I915_GTT_PAGE_SIZE_64K);
>> +
>> +		if (i915_vm_has_cache_coloring(vma->vm))
>> +			color = vma->obj->cache_level;
>> +	}
>>   
>>   	if (flags & PIN_OFFSET_FIXED) {
>>   		u64 offset = flags & PIN_OFFSET_MASK;
>> -- 
>> 2.20.1
>>
> 
