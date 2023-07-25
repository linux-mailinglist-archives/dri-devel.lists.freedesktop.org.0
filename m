Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A275761318
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 13:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7B310E3CA;
	Tue, 25 Jul 2023 11:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3510E3DD;
 Tue, 25 Jul 2023 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690283272; x=1721819272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MbwrlzR2nBAf8yW26gKmeIuSipCpJV13OLbSoeJjYVg=;
 b=L39l/wDm2ekjbkdGXnuZZd4LW2yO5cpxq4aIzk4vx2M5pdzc3KU08gkB
 ZjL07d1vMd44s1A8zRRCHTSYo+reLU6kiyZoZ4RbfRWSkpinbpfNuwtlS
 zg6Z3ZhF/OiyBTwKgJrfo+c5nedK6+H5Cl0QW3cznFKH9jwNz53HJStB0
 zinxXlJEMhGUKToORRqnJS0V3JFFfZ0Fx5JKFofog8uAZjmqOmYHM/cat
 k5qRIVTrpbq2nLsHmbD+yYEQirpwM5RQJ37vJdtUDHisRtVEKaJAjlDkz
 g/syq38E62kU4wI5bsJBT9vm8IM9RGaEJXoj+Q6iVRrGHzTR2RTZaYssH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="454070328"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="454070328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755706703"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="755706703"
Received: from grdarcy-mobl1.ger.corp.intel.com (HELO [10.213.228.4])
 ([10.213.228.4])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:07:48 -0700
Message-ID: <6bc73c01-a7fc-9a7f-5d26-0dd25ebc4a76@linux.intel.com>
Date: Tue, 25 Jul 2023 12:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT paths of
 i915_vma_pin_iomap
Content-Language: en-US
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
 <DM4PR11MB5971B9E535C39E2C7F7314BC8702A@DM4PR11MB5971.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <DM4PR11MB5971B9E535C39E2C7F7314BC8702A@DM4PR11MB5971.namprd11.prod.outlook.com>
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/07/2023 00:38, Sripada, Radhakrishna wrote:
> Hi Tvrtko,
> 
> The changes makes sense and based on the description looks good.
> I am bit skeptical about the exec buffer failure reported by ci hence,
> withholding the r-b for now. If you believe the CI failure is unrelated
> please feel free to add my r-b.

This failure:
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_121236v1/shard-snb7/igt@gem_ppgtt@blt-vs-render-ctxn.html

Test or machine is not entirely stable looking at it's history, but with 
a couple different failure signatures:

https://intel-gfx-ci.01.org/tree/drm-tip/igt@gem_ppgtt@blt-vs-render-ctxn.html

But agreed that we need to be careful. I requested a re-run for a start.

> On a side note on platforms with non-coherent ggtt do we really
> need to use the barriers twice under intel_gt_flush_ggtt_writes?

You mean:

intel_gt_flush_ggtt_writes()
{
	...
	wmb();
	...
	intel_gt_chipset_flush();
		wmb();

?

I'd guess it is not needed twice on the intel_gt_flush_ggtt_writes() 
path, but happens to be like that for direct callers of 
intel_gt_chipset_flush().

Maybe there is scope to tidy this all, for instance the first direct 
caller I opened does this:

rpcs_query_batch()
{
...
	__i915_gem_object_flush_map(rpcs, 0, 64);
	i915_gem_object_unpin_map(rpcs);

	intel_gt_chipset_flush(vma->vm->gt);

Where I think __i915_gem_object_flush_map() could actually do the right 
thing and issue a flush appropriate for the mapping that was used. But 
it is work and double flush does not really harm. I don't think it does 
at least.

Regards,

Tvrtko

> 
> --Radhakrishna(RK) Sripada
> 
>> -----Original Message-----
>> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Sent: Monday, July 24, 2023 5:57 AM
>> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; Sripada, Radhakrishna
>> <radhakrishna.sripada@intel.com>; stable@vger.kernel.org
>> Subject: [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT paths of
>> i915_vma_pin_iomap
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is
>> available")
>> added a code path which does not map via GGTT, but was still setting the
>> ggtt write bit, and so triggering the GGTT flushing.
>>
>> Fix it by not setting that bit unless the GGTT mapping path was used, and
>> replace the flush with wmb() in i915_vma_flush_writes().
>>
>> This also works for the i915_gem_object_pin_map path added in
>> d976521a995a ("drm/i915: extend i915_vma_pin_iomap()").
>>
>> It is hard to say if the fix has any observable effect, given that the
>> write-combine buffer gets flushed from intel_gt_flush_ggtt_writes too, but
>> apart from code clarity, skipping the needless GGTT flushing could be
>> beneficial on platforms with non-coherent GGTT. (See the code flow in
>> intel_gt_flush_ggtt_writes().)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is
>> available")
>> References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Cc: <stable@vger.kernel.org> # v5.14+
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index ffb425ba591c..f2b626cd2755 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -602,7 +602,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma
>> *vma)
>>   	if (err)
>>   		goto err_unpin;
>>
>> -	i915_vma_set_ggtt_write(vma);
>> +	if (!i915_gem_object_is_lmem(vma->obj) &&
>> +	    i915_vma_is_map_and_fenceable(vma))
>> +		i915_vma_set_ggtt_write(vma);
>>
>>   	/* NB Access through the GTT requires the device to be awake. */
>>   	return page_mask_bits(ptr);
>> @@ -617,6 +619,8 @@ void i915_vma_flush_writes(struct i915_vma *vma)
>>   {
>>   	if (i915_vma_unset_ggtt_write(vma))
>>   		intel_gt_flush_ggtt_writes(vma->vm->gt);
>> +	else
>> +		wmb(); /* Just flush the write-combine buffer. */
>>   }
>>
>>   void i915_vma_unpin_iomap(struct i915_vma *vma)
>> --
>> 2.39.2
> 
