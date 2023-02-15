Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A3697BC0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 13:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A4510E11D;
	Wed, 15 Feb 2023 12:30:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602210E0B9;
 Wed, 15 Feb 2023 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676464222; x=1708000222;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=20t+hjDeumVKYIA26f5ntiUb7MxZW/ZHR6agrgPdo7A=;
 b=JtmQoxvlFbTDyjyoBqreQzVMH/EYE+WSxJq8ejEtkbwyibx5W9Epirlq
 h1pEIx0VcKr1VX+h3roEcmE51TYajBoHoXP4D8V0zHyf350I330Zl63zm
 CeiMk1BS6AgYzfcfrSK07oFdaAIdTsZrrLxg50NAMAF/Lqd/JN5Rsa9UR
 HLsltfKriS+PO2I/+i/9d3LfE0Qc7l5FTBcMeecvovF/fxDKH9eBqXAtO
 SvoqJ7LbTjJBXJ6wkKvrKAkZXoVtFU5Nspe46WbwbkWDf7wi/xUXC9EBP
 Hb+Kz7P+3Iiz1KL8WJIMVQj0C2LGzAWD0jdVjCkKcWdNNH4MBTGHVL2Cl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="315070395"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="315070395"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 04:30:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="915132770"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="915132770"
Received: from odaniele-mobl2.ger.corp.intel.com (HELO [10.213.228.205])
 ([10.213.228.205])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 04:30:20 -0800
Message-ID: <f7eb5124-7db2-cbe1-0023-196885e8353b@linux.intel.com>
Date: Wed, 15 Feb 2023 12:30:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't use stolen memory for ring
 buffers
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230214234856.744573-1-John.C.Harrison@Intel.com>
 <e07ec6ca-dbd7-2f17-a99f-7b91a530d359@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e07ec6ca-dbd7-2f17-a99f-7b91a530d359@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/02/2023 01:56, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 2/14/2023 3:48 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Direction from hardware is that stolen memory should never be used for
>> ring buffer allocations. There are too many caching pitfalls due to the
>> way stolen memory accesses are routed. So it is safest to just not use
>> it.
> 
> I'm wondering if this applies to machines in ringbuffer mode as well, as 
> some of the caching stuff that according to the HW team may not work 
> properly with stolen mem accesses from the CS (mocs, ppat) came with 
> gen8/gen9.
> Maybe limit this change to gen8+, to avoid changing the behavior for 
> very old platforms?

If Gen8+ can have bugs due this then:

Fixes: c58b735fc762 ("drm/i915: Allocate rings from stolen")
Cc: <stable@vger.kernel.org> # v4.9+

Or even before:

Fixes: ebc052e0c65f ("drm/i915: Allocate ringbuffers from stolen memory")
Cc: <stable@vger.kernel.org> # v3.9+

Hm lets see when BDW when out of force probe:

Fixes: babb1903511f ("drm/i915/bdw: remove preliminary_hw_support flag from BDW")
Cc: <stable@vger.kernel.org> # v3.14+

Depends also how the problem statement interacts with LLC. If !LLC platforms are okay then the first one from the above list is enough.

Because

Regards,

Tvrtko

>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_ring.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c 
>> b/drivers/gpu/drm/i915/gt/intel_ring.c
>> index 15ec64d881c44..d1a47e1ae6452 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
>> @@ -116,8 +116,6 @@ static struct i915_vma *create_ring_vma(struct 
>> i915_ggtt *ggtt, int size)
>>       obj = i915_gem_object_create_lmem(i915, size, 
>> I915_BO_ALLOC_VOLATILE |
>>                         I915_BO_ALLOC_PM_VOLATILE);
>> -    if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt))
>> -        obj = i915_gem_object_create_stolen(i915, size);
> 
> There is code in ring_pin/unpin() that only applies to rings in stolen 
> memory, so you need to remove that as well if you drop stolen for rings 
> on all platforms.
> 
> Daniele
> 
>>       if (IS_ERR(obj))
>>           obj = i915_gem_object_create_internal(i915, size);
>>       if (IS_ERR(obj))
> 
