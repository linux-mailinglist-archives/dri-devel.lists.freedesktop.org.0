Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA77B2E05
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2277510E6DC;
	Fri, 29 Sep 2023 08:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EAC10E6DC;
 Fri, 29 Sep 2023 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695976817; x=1727512817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EbLaPvxJrAyVGiU2du4lKUNw/vacEQgskxs2ohyuvb4=;
 b=c2Tbxxn57DNp9y4mzeUv6PcmuARumAnP0o6MecnQML3HXyyA41B1jPNf
 1WkNLNpKQN/F+FCUx6KoFkFtWBdWOZ+Etnu9aaKpVunt3Ggu5qTyaD5JX
 t3+eEqeWO1EtYKXtjygx9eK1uOXvcHIjmboAqCoF15lNYblQIrh92Alge
 sOy3ao5Wkks4rOXLAV8DnHtPP15TFVyWxKc+P8hFLkpxI8k7u4nzEhe9p
 Y9Tx8onFV/5NmLsWE6UA6jgzvLfSWbTatVmtKySFvXWxQx4CQ9HEx5nXI
 FmzLnq2HI9umGfp8OBiLuSMZVN3F1uyWeLmlkFrJ9q39IR7ZNLbZI5MkK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372611822"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="372611822"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 01:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699575884"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="699575884"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.39.203])
 ([10.252.39.203])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 01:40:15 -0700
Message-ID: <04e38c7b-3acc-1f5c-7b7a-aba0ef701b84@linux.intel.com>
Date: Fri, 29 Sep 2023 10:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v7 1/4] drm/i915: Introduce
 intel_gt_mcr_lock_sanitize()
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230928130015.6758-1-nirmoy.das@intel.com>
 <d8f739f9-a40d-1a69-e223-95441b249c98@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <d8f739f9-a40d-1a69-e223-95441b249c98@intel.com>
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
Cc: matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/28/2023 11:42 PM, Andrzej Hajda wrote:
> On 28.09.2023 15:00, Nirmoy Das wrote:
>> Implement intel_gt_mcr_lock_sanitize() to provide a mechanism
>> for cleaning the steer semaphore when absolutely necessary.
>>
>> v2: remove unnecessary lock(Andi, Matt)
>>      improve the kernel doc(Matt)
>>      s/intel_gt_mcr_lock_clear/intel_gt_mcr_lock_sanitize
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> index bf4a933de03a..326c2ed1d99b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> @@ -419,6 +419,28 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, 
>> unsigned long flags)
>>           intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>>   }
>>   +/**
>> + * intel_gt_mcr_lock_sanitize - Sanitize MCR steering lock
>> + * @gt: GT structure
>> + *
>> + * This will be used to sanitize the initial status of the hardware 
>> lock
>> + * during driver load and resume since there won't be any concurrent 
>> access
>> + * from other agents at those times, but it's possible that boot 
>> firmware
>> + * may have left the lock in a bad state.
>> + *
>> + */
>> +void intel_gt_mcr_lock_sanitize(struct intel_gt *gt)
>> +{
>> +    /*
>> +     * This gets called at load/resume time, so we shouldn't be
>> +     * racing with other driver threads grabbing the mcr lock.
>> +     */
>> +    lockdep_assert_not_held(&gt->mcr_lock);
>> +
>> +    if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>> +        intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>
> I wonder if it wouldn't be useful to check and report if it is locked 
> before unconditional release, no strong feelings.
Not so useful for user but may be as debug log if we need.
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Thanks,

Nirmoy

>
> Regards
> Andrzej
>
>
>> +}
>> +
>>   /**
>>    * intel_gt_mcr_read - read a specific instance of an MCR register
>>    * @gt: GT structure
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h 
>> b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>> index 41684495b7da..01ac565a56a4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>> @@ -11,6 +11,7 @@
>>   void intel_gt_mcr_init(struct intel_gt *gt);
>>   void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
>>   void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
>> +void intel_gt_mcr_lock_sanitize(struct intel_gt *gt);
>>     u32 intel_gt_mcr_read(struct intel_gt *gt,
>>                 i915_mcr_reg_t reg,
>
