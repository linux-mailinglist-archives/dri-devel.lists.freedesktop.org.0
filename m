Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C7582733
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 14:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1BFC5839;
	Wed, 27 Jul 2022 12:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06E18B659;
 Wed, 27 Jul 2022 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658926618; x=1690462618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZZz/K3MC/VTWwgoscj+ukc/J2fLhkf7sdFzroIufZjI=;
 b=SbJZFL+w5iFnrOj0DM9q+fpl67fh4vDrObbOrOCDT8otJ3CdBxfAXAgf
 exDXkYhgKuFfN2NDKcwOv6F+aVR6YM95mC9RtIWZ4WWH8Y0YOJQDhxA4f
 2Qrvl7ChsIPfldVa9CyH+5FTOl7YPHma1AhQ7MlFZzbMomz6E4IRR87eG
 jszbQBUZlNhgiQsEFJWvnChDwmYUW+GKlM9pE3cvu/B/0wOHSX4B70T4p
 A9GkmuLe9oR6S9X0P9hCiVj34CTR+DHVHp5guRB9JbYDNYwECIwAtB7S+
 xUpShT6IK17L8G5/jrkfkE9Qrn5iDtN9G4IkuLPs63avOAT1vdmyAd/+3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="352219783"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="352219783"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 05:56:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="927778582"
Received: from ncouniha-mobl.ger.corp.intel.com (HELO [10.213.217.229])
 ([10.213.217.229])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 05:56:52 -0700
Message-ID: <d2337b73-ae34-3dd3-afa3-85c77dc2135e@linux.intel.com>
Date: Wed, 27 Jul 2022 13:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v2 06/21] drm/i915/gt: Batch TLB invalidations
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <9f535a97f32320a213a619a30c961ba44b595453.1657800199.git.mchehab@kernel.org>
 <567823d5-57ba-30db-dd64-de609df4d8c5@linux.intel.com>
 <20220727134836.7f7b5fab@maurocar-mobl2>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220727134836.7f7b5fab@maurocar-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: stable@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 linux-media@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/07/2022 12:48, Mauro Carvalho Chehab wrote:
> On Wed, 20 Jul 2022 11:49:59 +0100
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> 
>> On 20/07/2022 08:13, Mauro Carvalho Chehab wrote:
>>> On Mon, 18 Jul 2022 14:52:05 +0100
>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>    
>>>>
>>>> On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
>>>>> From: Chris Wilson <chris.p.wilson@intel.com>
>>>>>
>>>>> Invalidate TLB in patch, in order to reduce performance regressions.
>>>>
>>>> "in batches"?
>>>
>>> Yeah. Will fix it.
> 
>>> +void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb)
>>> +{
>>> +	/*
>>> +	 * Before we release the pages that were bound by this vma, we
>>> +	 * must invalidate all the TLBs that may still have a reference
>>> +	 * back to our physical address. It only needs to be done once,
>>> +	 * so after updating the PTE to point away from the pages, record
>>> +	 * the most recent TLB invalidation seqno, and if we have not yet
>>> +	 * flushed the TLBs upon release, perform a full invalidation.
>>> +	 */
>>> +	WRITE_ONCE(tlb, intel_gt_next_invalidate_tlb_full(vm->gt));
>>
>> Shouldn't tlb be a pointer for this to make sense?
> 
> Oh, my mistake! Will fix at the next version.
> 
>>>    
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>>>>> index d8b94d638559..2da6c82a8bd2 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>>>>> @@ -206,8 +206,12 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
>>>>>     void ppgtt_unbind_vma(struct i915_address_space *vm,
>>>>>     		      struct i915_vma_resource *vma_res)
>>>>>     {
>>>>> -	if (vma_res->allocated)
>>>>> -		vm->clear_range(vm, vma_res->start, vma_res->vma_size);
>>>>> +	if (!vma_res->allocated)
>>>>> +		return;
>>>>> +
>>>>> +	vm->clear_range(vm, vma_res->start, vma_res->vma_size);
>>>>> +	if (vma_res->tlb)
>>>>> +		vma_invalidate_tlb(vm, *vma_res->tlb);
>>>>
>>>> The patch is about more than batching? If there is a security hole in
>>>> this area (unbind) with the current code?
>>>
>>> No, I don't think there's a security hole. The rationale for this is
>>> not due to it.
>>
>> In this case obvious question is why are these changes in the patch
>> which declares itself to be about batching invalidations? Because...
> 
> Because vma_invalidate_tlb() basically stores a TLB seqno, but the
> actual invalidation is deferred to when the pages are unset, at
> __i915_gem_object_unset_pages().
> 
> So, what happens is:
> 
> - on VMA sync mode, the need to invalidate TLB is marked at
>    __vma_put_pages(), before VMA unbind;
> - on async, this is deferred to happen at ppgtt_unbind_vma(), where
>    it marks the need to invalidate TLBs.
> 
> On both cases, __i915_gem_object_unset_pages() is called later,
> when the driver is ready to unmap the page.

Sorry still not clear to me why is the patch moving marking of the need 
to invalidate (regardless if it a bit like today, or a seqno like in 
this patch) from bind to unbind?

What if the seqno was stored in i915_vma_bind, where the bit is set 
today, and all the hunks which touch the unbind and evict would 
disappear from the patch. What wouldn't work in that case, if anything?

Regards,

Tvrtko

> 
>> I am explaining why it looks to me that the patch is doing two things.
>> Implementing batching _and_ adding invalidation points at VMA unbind
>> sites, while so far we had it at backing store release only. Maybe I am
>> wrong and perhaps I am too slow to pick up on the explanation here.
>>
>> So if the patch is doing two things please split it up.
>>
>> I am further confused by the invalidation call site in evict and in
>> unbind - why there can't be one logical site since the logical sequence
>> is evict -> unbind.
> 
> The invalidation happens only on one place: __i915_gem_object_unset_pages().
> 
> Despite its name, vma_invalidate_tlb() just marks the need of doing TLB
> invalidation.
> 
> Regards,
> Mauro
