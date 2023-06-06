Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B99723E0E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 11:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FEE10E334;
	Tue,  6 Jun 2023 09:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE9F10E327;
 Tue,  6 Jun 2023 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686044724; x=1717580724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sUKN7tyxrJH3vsqeq3Bl+B1Au0rz1W/aaAamLU/PTe0=;
 b=bZxhUHP6YGrC6Id7TLHRWiGlY+1Woxmypw3TeZ8nbTVPCMDyHvYBkRPO
 WEwqU3BXNExtqTTFKBBHTK+8ympqvEpkOv6fFVicPzXXZamoacn0wQyr+
 fSwGV91WXfx656cGEeCtVdez281IWDyLD+hf5mglyt2xREsLwMx8klX/4
 vSfrI6smf28DhLVgRHBf2kh4f/lNct4YGLP4fe0APa7ug2OC9unnpJ9Vb
 exy3ZCClKrTLWRlV+CjKl58sgUJFhaGlH6BY9yp6CnQa9h3DGqGZeVQPi
 iYuGIw9NSDuqLOpBY5u+5vm0bv+5NZqvu3YwKkEF1YJI9yhJ462GoCUe9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355472317"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="355472317"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 02:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="742080595"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="742080595"
Received: from wacarey-mobl1.ger.corp.intel.com (HELO [10.213.192.12])
 ([10.213.192.12])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 02:44:52 -0700
Message-ID: <e2f3a990-0fb9-74a2-3b1c-7a30fefda84b@linux.intel.com>
Date: Tue, 6 Jun 2023 10:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915/selftests: Add some missing error propagation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
 <ZH3ncqduEdlMRh98@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZH3ncqduEdlMRh98@ashyti-mobl2.lan>
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
Cc: Intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/06/2023 14:47, Andi Shyti wrote:
> Hi Tvrtko,
> 
>> Add some missing error propagation in live_parallel_switch.
>>
>> To avoid needlessly burdening the various backport processes, note I am
>> not marking it as a fix against any patches and not copying stable since
>> it is debug/selftests only code.
> 
> which I did :/
> 
> But I guess you are right and it's not necessary.
> 
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> index ad6a3b2fb387..7021b6e9b219 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> @@ -348,8 +348,10 @@ static int live_parallel_switch(void *arg)
>>   				continue;
>>   
>>   			ce = intel_context_create(data[m].ce[0]->engine);
>> -			if (IS_ERR(ce))
>> +			if (IS_ERR(ce)) {
>> +				err = PTR_ERR(ce);
>>   				goto out;
>> +			}
>>   
>>   			err = intel_context_pin(ce);
>>   			if (err) {
>> @@ -369,8 +371,10 @@ static int live_parallel_switch(void *arg)
>>   
>>   		worker = kthread_create_worker(0, "igt/parallel:%s",
>>   					       data[n].ce[0]->engine->name);
>> -		if (IS_ERR(worker))
>> +		if (IS_ERR(worker)) {
>> +			err = PTR_ERR(worker);
>>   			goto out;
>> +		}
>>   
>>   		data[n].worker = worker;
>>   	}
>> @@ -399,8 +403,10 @@ static int live_parallel_switch(void *arg)
>>   			}
>>   		}
>>   
>> -		if (igt_live_test_end(&t))
>> -			err = -EIO;
>> +		if (igt_live_test_end(&t)) {
>> +			err = err ?: -EIO;
> 
> Nice catch!
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Thanks, pushed! (with Fixes tags added)

Regards,

Tvrtko

