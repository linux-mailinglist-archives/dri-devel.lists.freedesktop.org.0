Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4917666C4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF2810E693;
	Fri, 28 Jul 2023 08:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C510E691;
 Fri, 28 Jul 2023 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690532320; x=1722068320;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NTEHuhkjMfjLOAOi4RCf/EhydHy9KKKCjF5GbC2yk/c=;
 b=Q0NzPDOEim8C5/vjq/7k0n1N6ZcQI4rsgiWy28KlbXlggEEJdGDW7Lt9
 uRHhIpR9Vyl9qk/2z1fYsWEj/VzSWCeP46B8RcTFMKhgIRevl1Wtr8Jpg
 4T0DKbMyy4ziJNRwd9C5e4pGQ9bRfO0sCOFCdY/RY6EMIbuFpB+8bNIdU
 1CfllKQjhXpVbOQWIg/TI4mlPRjmOJkhx4pRfedDpS6ERkmAlAtJz5wjC
 ss3M+mZuuVn3X8S4E3EdlthvCa9Jn0tPnBCaRPwLdAPoXWCiXhdm1gJ4M
 4ILaoQxNKgc0TM64cShxsz8rYW2w9ORaIC2qQP3VRUnCzqm4AkdWqscxB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353444961"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="353444961"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 01:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973968383"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="973968383"
Received: from atoomey-mobl.amr.corp.intel.com (HELO [10.213.197.30])
 ([10.213.197.30])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 01:18:38 -0700
Message-ID: <fcca49f6-158d-1504-bc33-263095690e95@linux.intel.com>
Date: Fri, 28 Jul 2023 09:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [RFC 2/8] drm/i915: Split PTE encode between Gen12
 and Meteorlake
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-3-tvrtko.ursulin@linux.intel.com>
 <20230727222544.GB138014@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230727222544.GB138014@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/07/2023 23:25, Matt Roper wrote:
> On Thu, Jul 27, 2023 at 03:54:58PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> No need to run extra instructions which will never trigger on platforms
>> before Meteorlake.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> index c8568e5d1147..862ac1d2de25 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -63,6 +63,30 @@ static u64 gen12_pte_encode(dma_addr_t addr,
>>   {
>>   	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>>   
>> +	if (unlikely(flags & PTE_READ_ONLY))
>> +		pte &= ~GEN8_PAGE_RW;
>> +
>> +	if (flags & PTE_LM)
>> +		pte |= GEN12_PPGTT_PTE_LM;
>> +
>> +	if (pat_index & BIT(0))
>> +		pte |= GEN12_PPGTT_PTE_PAT0;
>> +
>> +	if (pat_index & BIT(1))
>> +		pte |= GEN12_PPGTT_PTE_PAT1;
>> +
>> +	if (pat_index & BIT(2))
>> +		pte |= GEN12_PPGTT_PTE_PAT2;
>> +
>> +	return pte;
>> +}
>> +
>> +static u64 mtl_pte_encode(dma_addr_t addr,
>> +			  unsigned int pat_index,
>> +			  u32 flags)
>> +{
>> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>> +
> 
> Would it be more readable to start with
> 
>          gen8_pte_t pte = gen12_pte_encode(addr, pat_index, flags);
> 
> and then |-in only the MTL-specific bit(s) as appropriate?
> 
>>   	if (unlikely(flags & PTE_READ_ONLY))
>>   		pte &= ~GEN8_PAGE_RW;
>>   
>> @@ -995,6 +1019,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>>   	 */
>>   	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
>>   
>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>> +		ppgtt->vm.pte_encode = mtl_pte_encode;
>>   	if (GRAPHICS_VER(gt->i915) >= 12)
>>   		ppgtt->vm.pte_encode = gen12_pte_encode;
> 
> I think you wanted 'else if' here.  Otherwise you clobber the MTL
> function pointer.

Doh this was a strong fail.. Yes and yes.. I even had it like you 
suggest in that patch I mentioned to you earlier.. 
https://patchwork.freedesktop.org/patch/546013/?series=120341&rev=2.

Do you have an opinion on that one perhaps?

Thanks,

Tvrtko
