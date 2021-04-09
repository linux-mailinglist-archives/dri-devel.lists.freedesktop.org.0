Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B269A359DBD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 13:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1179B6E499;
	Fri,  9 Apr 2021 11:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2028B6E497;
 Fri,  9 Apr 2021 11:46:23 +0000 (UTC)
IronPort-SDR: dmmVIBMEXG1i7+ZmHIBFoBXNSgXH5eOwEDzOuMxLMYYRma5afUwKPwHwtxYwtcvWy3qahlYQOf
 U05x7nZ8xJDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="257727536"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="257727536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 04:46:21 -0700
IronPort-SDR: Rno9XHDqeQX5uQ+9YPkP6mkeTkQWLcz2MUr0s6YKuVvpkBAbethuyGuF03Lm7pf+A3wSAaKOpe
 luDR1ysg30OA==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="520258621"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.233.163])
 ([10.213.233.163])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 04:46:19 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Do not report 100% RC6 if not
 supported
To: Andi Shyti <andi.shyti@intel.com>
References: <20210330150637.2547762-1-tvrtko.ursulin@linux.intel.com>
 <YGxD3HZEZ1hoV7gj@intel.intel>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <941d263a-9c3f-5169-6925-f0915288d9f1@linux.intel.com>
Date: Fri, 9 Apr 2021 12:46:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGxD3HZEZ1hoV7gj@intel.intel>
Content-Language: en-US
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
Cc: Intel-gfx@lists.freedesktop.org,
 Eero T Tamminen <eero.t.tamminen@intel.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/04/2021 12:19, Andi Shyti wrote:
> Hi Tvrtko,
> 
>> We use GT parked status to estimate RC6 while not in use, however if RC6
>> is not supported to start with that does not work very well and produces a
>> false 100% RC6 readout.
>>
>> Fix by not advancing the estimated RC6 counter when feature is not
>> supported.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 1fe699e30113 ("drm/i915/pmu: Fix sleep under atomic in RC6 readout")
>> Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_pmu.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index 41651ac255fa..02fe0d22c470 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -191,7 +191,10 @@ static u64 get_rc6(struct intel_gt *gt)
>>   		 * on top of the last known real value, as the approximated RC6
>>   		 * counter value.
>>   		 */
>> -		val = ktime_since_raw(pmu->sleep_last);
>> +		if (gt->rc6.supported)
>> +			val = ktime_since_raw(pmu->sleep_last);
>> +		else
>> +			val = 0;
> 
> if rc6 is not supported, why are we here?

There is another flavour of this patch which indeed prevents us from 
getting here if rc6 is not enabled. (By not exposing the counter if not 
supported.)

> 
> Did you mean rc6.enabled ?

Yeah, I did not see that one initially at all! But it doesn't matter 
since this patch is not going in anyway.

Regards,

Tvrtko

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
