Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D348E8050B3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569F110E4DC;
	Tue,  5 Dec 2023 10:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3DF10E4DF;
 Tue,  5 Dec 2023 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701772784; x=1733308784;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R4ahHPkP3rfNSBS6mc+iwcw+6Bw8iNvxBiWNTPXlFYE=;
 b=Zp3GpqTVyw9y4549Mzc3qzMxkzrYm9GuxrcR1s/nS8KhPwEVWYaykltt
 3mUd4+bJy2mVL+ezeVjrqPnfKkm4gJR7TnWXxqGvPM05idZC5Wx+WqvXF
 vAHXwYeqxlEcj5hzKCDM1DeoTwBKvd6yLxz1Q/6FU6vf6SiIgbb4G3P+/
 B/hzAO7MxezjICt/dTrFFL5DuwX3uZTgtHyr5K5ZHv8u8FeIuRxDIhHfY
 m0ChW2rXI1xpqitT9q6uRJ4V6oKTBD3yYCVVNXpzLWeNvdmHlV+TY6RKW
 UejY915ujlFVWA/2u4vo1PMSR78f01qNOgJGywfdw7cmOrSiglkg80H4C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="391037314"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="391037314"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764283551"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="764283551"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.33.155])
 ([10.249.33.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:39:41 -0800
Message-ID: <69036ebc-561f-4c9b-b68b-04f7e1c77e27@linux.intel.com>
Date: Tue, 5 Dec 2023 11:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/gt: Convert reset prepare failure log to trace
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231205085248.2577-1-nirmoy.das@intel.com>
 <40875e9a-3729-4153-8de2-69d0ce586442@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <40875e9a-3729-4153-8de2-69d0ce586442@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On 12/5/2023 10:10 AM, John Harrison wrote:
> On 12/5/2023 00:52, Nirmoy Das wrote:
>> gen8_engine_reset_prepare() can fail when HW fails to set
>> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
>> error as driver will retry.
>>
>> Convert the log to a trace log for debugging without triggering
>> unnecessary concerns in CI or for end-users during non-fatal scenarios.
> I strongly disagree with this change. The hardware spec for the 
> RESET_CTL and GDRST registers are that they will self clear within a 
> matter of microseconds. If something is so badly wrong with the 
> hardware that it can't even manage to reset


This message is for reset readiness  poll timeout not that the reset is 
failed which doesn't sound so serious if the subsequent attempt managed 
reset the engine.

I couldn't get enough details when this can happen that HW takes very 
long time to set the readiness bit.


> then that is something that very much warrants more than a completely 
> silent trace event. It most certainly should be flagged as a failure 
> in CI.
>
> Just because the driver will retry does not mean that this is not a 
> serious error. And if the first attempt failed, why would a subsequent 
> attempt succeed?

The patch is not ignoring the failure. If the subsequent attempt fails 
then driver load will fail or it will be wedged if that happens after 
driver load.


> Escalating to FLR may have more success, but that is not something 
> that i915 currently does.

Do we still need to do FLR if a subsequent engine reset failure ?


Regards,

Nirmoy

>
> John.
>
>
>>
>> v2: Improve commit message(Tvrtko)
>>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index d5ed904f355d..e6fbc6202c80 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct 
>> intel_engine_cs *engine)
>>       ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>>                          700, 0, NULL);
>>       if (ret)
>> -        gt_err(engine->gt,
>> -               "%s reset request timed out: {request: %08x, 
>> RESET_CTL: %08x}\n",
>> -               engine->name, request,
>> -               intel_uncore_read_fw(uncore, reg));
>> +        GT_TRACE(engine->gt,
>> +             "%s reset request timed out: {request: %08x, RESET_CTL: 
>> %08x}\n",
>> +             engine->name, request,
>> +             intel_uncore_read_fw(uncore, reg));
>>         return ret;
>>   }
>
