Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD79351270
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 11:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FF16EC80;
	Thu,  1 Apr 2021 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DBA6E3AA;
 Thu,  1 Apr 2021 09:38:16 +0000 (UTC)
IronPort-SDR: wGzHSJIMOgg8LlBWzRTrBHmmp8I7Oqp9/S1FVwmg7v7W/YzPe0kWLTqWnwv7uXoW9lm7QFyEGR
 1L9R+mAV3oTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="179332981"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="179332981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:38:15 -0700
IronPort-SDR: i8EIVK+pGVfjOEYCXWq+Ae/pmykZxzdwRpw8pgDlr4PwJ2oaZB+1g/KGHYWynfsPg0wfmnabPO
 xMgmTOYVC/aw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="455907619"
Received: from shaneken-mobl.ger.corp.intel.com (HELO [10.213.202.146])
 ([10.213.202.146])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:38:13 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
 <YGWQB+8gWgmZ/6Mg@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2c813fb2-6836-1888-f606-25ef1321a366@linux.intel.com>
Date: Thu, 1 Apr 2021 10:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGWQB+8gWgmZ/6Mg@intel.com>
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


On 01/04/2021 10:19, Rodrigo Vivi wrote:
> On Wed, Mar 31, 2021 at 11:18:50AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> RC6 support cannot be simply established by looking at the static device
>> HAS_RC6() flag. There are cases which disable RC6 at driver load time so
>> use the status of those check when deciding whether to enumerate the rc6
>> counter.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_pmu.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index 41651ac255fa..a75cd1db320b 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -476,6 +476,8 @@ engine_event_status(struct intel_engine_cs *engine,
>>   static int
>>   config_status(struct drm_i915_private *i915, u64 config)
>>   {
>> +	struct intel_gt *gt = &i915->gt;
>> +
>>   	switch (config) {
>>   	case I915_PMU_ACTUAL_FREQUENCY:
>>   		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>> @@ -489,7 +491,7 @@ config_status(struct drm_i915_private *i915, u64 config)
>>   	case I915_PMU_INTERRUPTS:
>>   		break;
>>   	case I915_PMU_RC6_RESIDENCY:
>> -		if (!HAS_RC6(i915))
>> +		if (!gt->rc6.supported)
> 
> Is this really going to remove any confusion?
> Right now it is there but with residency 0, but after this change the event is
> not there anymore so I wonder if we are not just changing to a different kind
> of confusion on users.

I think it is possible to argue both ways.

1)
HAS_RC6 means hardware has RC6 so if we view PMU as very low level we 
can say always export it.

If i915 had to turn it off (rc6->supported == false) due firmware or 
GVT-g, then we could say reporting zero RC6 is accurate in that sense. 
Only the reason "why it is zero" is missing for PMU users.

2)
Or if we go with this patch we could say that presence of the PMU metric 
means RC6 is active and enabled, while absence means it is either not 
supported due platform (or firmware) or how the platform is getting used 
(GVT-g).

So I think patch is a bit better. I don't see it is adding more confusion.

> 
>>   			return -ENODEV;
> 
> would a different return help somehow?

Like distinguishing between not theoretically possible to support on 
this GPU, versus not active? Perhaps.. suggest an errno? :)

Regards,

Tvrtko

> 
>>   		break;
>>   	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
