Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60E413598
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE9489F2A;
	Tue, 21 Sep 2021 14:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C6E89EEB;
 Tue, 21 Sep 2021 14:49:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284396061"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="284396061"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 07:49:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556968600"
Received: from ekyne-mobl.ger.corp.intel.com (HELO [10.213.200.64])
 ([10.213.200.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 07:49:55 -0700
Subject: Re: [Intel-gfx] [PATCH 19/27] drm/i915: Fix bug in user proto-context
 creation that leaked contexts
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-20-matthew.brost@intel.com>
 <008b1b3f-9aa8-fe64-a967-091f7170ded1@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <cf77f6d3-a941-a58a-9662-e3d132bcedde@linux.intel.com>
Date: Tue, 21 Sep 2021 15:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <008b1b3f-9aa8-fe64-a967-091f7170ded1@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/09/2021 23:57, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
>> Set number of engines before attempting to create contexts so the
>> function free_engines can clean up properly.
>>
>> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle 
>> create parameters (v5)")
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index dbaeb924a437..bcaaf514876b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -944,6 +944,7 @@ static struct i915_gem_engines 
>> *user_engines(struct i915_gem_context *ctx,
>>       unsigned int n;
>>       e = alloc_engines(num_engines);
> This can return null when out of memory. There needs to be an early exit 
> check before dereferencing a null pointer. Not sure if that is a worse 
> bug or not than leaking memory! Either way, it would be good to fix that 
> too.

Pull out from the series and send a fix standalone ASAP? Also suggest 
adding author and reviewer to cc for typically quicker turnaround time.

Regards,

Tvrtko


> John.
> 
>> +    e->num_engines = num_engines;
>>       for (n = 0; n < num_engines; n++) {
>>           struct intel_context *ce;
>>           int ret;
>> @@ -977,7 +978,6 @@ static struct i915_gem_engines 
>> *user_engines(struct i915_gem_context *ctx,
>>               goto free_engines;
>>           }
>>       }
>> -    e->num_engines = num_engines;
>>       return e;
> 
