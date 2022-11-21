Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7866631BC3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 09:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7AC10E16A;
	Mon, 21 Nov 2022 08:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A988510E174;
 Mon, 21 Nov 2022 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669020315; x=1700556315;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p1EdzjN8DWHa8P0dGAsb6sZDx1SBPZSFx7G0cAewAYk=;
 b=VtCHqYeX/ndCWZJcMvVDwVfljWaA7gxPHTYfH+CR2Tr8doEFset+TJSW
 jfD7cxx+Wiii9s8EWJ3YsQGu1m0UJA8aH88RKvDN9EZpOfjxcmF5pQ77G
 b42Va68U7EooR2FZ0ZdByAKGhLx0uM9zWIy7is7Y+zYFd0qmboFA1X41j
 Qto4oxOd+OTjlnePiKh966Jn8SIce9XPWno3ZTHccmD1Rp7680UBEoFgT
 QzNCXlUd3GM5fVPZ1LeaFzIsBv1WsGD89kzEty2VtIYhRvAiXf1MYHCnO
 SVVrqVVFNh/IWKtF1r6034tDyzzhEjTqClgEov18X5Ey1E2QN64U/n1em A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293216386"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="293216386"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 00:45:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="765886508"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="765886508"
Received: from slarkin-mobl.ger.corp.intel.com (HELO [10.213.201.194])
 ([10.213.201.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 00:45:13 -0800
Message-ID: <04397db7-0fe2-f04c-74e4-4ff2214e1e19@linux.intel.com>
Date: Mon, 21 Nov 2022 08:45:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix workarounds on Gen2-3
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221118115249.2683946-1-tvrtko.ursulin@linux.intel.com>
 <Y3e9j8enFhq7//Bn@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y3e9j8enFhq7//Bn@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/11/2022 17:14, Matt Roper wrote:
> On Fri, Nov 18, 2022 at 11:52:49AM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> In 3653727560d0 ("drm/i915: Simplify internal helper function signature")
>> I broke the old platforms by not noticing engine workaround init does not
>> initialize the list on old platforms. Fix it by always initializing which
>> already does the right thing by mostly not doing anything if there aren't
>> any workarounds on the list.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 3653727560d0 ("drm/i915: Simplify internal helper function signature")
>> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 213160f29ec3..4d7a01b45e09 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -2991,7 +2991,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>>   static void
>>   engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>>   {
>> -	if (I915_SELFTEST_ONLY(GRAPHICS_VER(engine->i915) < 4))
>> +	if (GRAPHICS_VER(engine->i915) < 4)
>>   		return;
> 
> Do we even need this early return at all?  As far as I can see, letting
> this function run its course doesn't wind up having any effect or cause
> any problems (you still wind up with an empty list).

True, it looks to me like that as well, now that you are pointing it 
out. Btw originally I was most perplexed by the "selftests only" 
annotation, but did not find time to go digging through history to 
figure out why was that even needed.

I left the return as is for now and pushed it to fix the breakage. Will 
try to revisit this at some point. Thanks for the review!

Regards,

Tvrtko

> 
> Regardless,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
>>   
>>   	engine_fake_wa_init(engine, wal);
>> @@ -3016,9 +3016,6 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>>   {
>>   	struct i915_wa_list *wal = &engine->wa_list;
>>   
>> -	if (GRAPHICS_VER(engine->i915) < 4)
>> -		return;
>> -
>>   	wa_init_start(wal, engine->gt, "engine", engine->name);
>>   	engine_init_workarounds(engine, wal);
>>   	wa_init_finish(wal);
>> -- 
>> 2.34.1
>>
> 
