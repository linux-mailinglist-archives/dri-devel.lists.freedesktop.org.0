Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADAD7B8174
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 15:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3184D10E0FE;
	Wed,  4 Oct 2023 13:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAA110E385;
 Wed,  4 Oct 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696427713; x=1727963713;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/ngSlRl23RibXbdUlZxNL/HFtSZs2NwscdQ3PdsjnDM=;
 b=mEF5qt84fh36euLBDEdXZ8ekFIta6E/S4uXAI62KjKU3V3RfrDzu49oU
 IAvvpzxo04yAjqHhw95rznW+ySchoMisshPni370zHeP4uriDn6GHNvuH
 NoW76Xnb+lztgk7O4yNN/o9X5T7t6vk3B+fhELkbmYmMZ2GCak7cWPHaZ
 ug5VcS73+ort+FVejwJYajWE5Kmz3w81+P81xxKKGcOxGsYCwxAQ0+pC6
 O7GDSsFBmqxOG7E7rEH95f+hUhEPLr+n6BqLRx9aoShes9Pq9xeWgnAiy
 sPNUgQ/RrmMHsfYzkQcMEYG1rICmCTN/8Pi2FuVkb+wC8wCZWXG0GeeAh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362531140"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="362531140"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875112901"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="875112901"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.56.120])
 ([10.252.56.120])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:55:00 -0700
Message-ID: <e01e301b-80a8-bf5c-b14c-695ab086d571@linux.intel.com>
Date: Wed, 4 Oct 2023 15:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] drm/i915: Reduce MCR lock surface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20231004120407.12251-1-nirmoy.das@intel.com>
 <ZR1eOHqOFK57OURn@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZR1eOHqOFK57OURn@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 10/4/2023 2:44 PM, Rodrigo Vivi wrote:
> On Wed, Oct 04, 2023 at 02:04:07PM +0200, Nirmoy Das wrote:
>> Take the mcr lock only when driver needs to write into a mcr based
>> tlb based registers.
>>
>> To prevent GT reset interference, employ gt->reset.mutex instead, since
>> intel_gt_mcr_multicast_write relies on gt->uncore->lock not being held.
> This looks a lot like protecting code and not protecting data [1]
>
> But to be really honest I'm afraid we were already doing this before
> this patch but with 2 other locks instead.

I haven't thought about that but yes, the issue was there already.


>
> [1] - https://blog.ffwll.ch/2022/07/locking-engineering.html
>
>> v2: remove unused var, flags.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_tlb.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
>> index 139608c30d97..0ad905df4a98 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_tlb.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
>> @@ -52,15 +52,13 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>   	struct intel_engine_cs *engine;
>>   	intel_engine_mask_t awake, tmp;
>>   	enum intel_engine_id id;
>> -	unsigned long flags;
>>   
>>   	if (GRAPHICS_VER(i915) < 8)
>>   		return;
>>   
>>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>   
>> -	intel_gt_mcr_lock(gt, &flags);
>> -	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
>> +	mutex_lock(&gt->reset.mutex);/* serialise invalidate with GT reset */
> I'm still looking at this and the commit message above and trying to understand
> why we are doing this and changing the previous 2 by this other one. why?


We need the MCR lock only for intel_gt_mcr_multicast_*() so I am not 
replacing the two locks here but moving the mcr lock down

where we were doing intel_gt_mcr_multicast_write_fw()


why s/spin_lock(&uncore->lock)/mutex_lock(&gt->reset.mutex):

intel_gt_mcr_multicast_*() expects gt->uncore->lock to be not held and 
to achieve this, I could do something like:

if (engine->tlb_inv.mcr) {

      spin_unlock(&uncore->lock);

      intel_gt_mcr_lock(gt, &flags);

      intel_gt_mcr_multicast_write_fw

      intel_gt_mcr_unlock(gt, flags);

     spin_lock(&uncore->lock);

}

Or take gt->reset.mutex instead which should block any concurrent gt reset.

If this is not acceptable then I can pick the above 1st option but I am 
not sure how safe is it do release uncore->lock and then take it back again.

>
>>   
>>   	awake = 0;
>>   	for_each_engine(engine, gt, id) {
>> @@ -68,9 +66,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>   			continue;
>>   
>>   		if (engine->tlb_inv.mcr)
>> -			intel_gt_mcr_multicast_write_fw(gt,
>> -							engine->tlb_inv.reg.mcr_reg,
>> -							engine->tlb_inv.request);
>> +			intel_gt_mcr_multicast_write(gt,
>> +						     engine->tlb_inv.reg.mcr_reg,
>> +						     engine->tlb_inv.request);
> you are already taking the forcewake_all domain above, so you wouldn't
> need to convert this to the variant that grabs the forcewake underneath.
>
> Also this is not mentioned in the commit message above.

intel_gt_mcr_multicast_write() takes the mcr lock for us, helps replacing multiple lines into one.
Will there be any side-effects for that ?

I should've added that the commit message.

Regards,
Nirmoy


>
>>   		else
>>   			intel_uncore_write_fw(uncore,
>>   					      engine->tlb_inv.reg.reg,
>> @@ -90,8 +88,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>   	     IS_ALDERLAKE_P(i915)))
>>   		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>>   
>> -	spin_unlock(&uncore->lock);
>> -	intel_gt_mcr_unlock(gt, flags);
>> +	mutex_unlock(&gt->reset.mutex);
>>   
>>   	for_each_engine_masked(engine, gt, awake, tmp) {
>>   		if (wait_for_invalidate(engine))
>> -- 
>> 2.41.0
>>
