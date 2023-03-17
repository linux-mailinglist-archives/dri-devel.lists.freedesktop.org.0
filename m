Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959A6BE4A2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC8510EE9D;
	Fri, 17 Mar 2023 08:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E617510EE9D;
 Fri, 17 Mar 2023 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679043575; x=1710579575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fi7lIybevqL/Cvt8mEOE1f0Ps25IkUstiyDFvi4Ei94=;
 b=JWC/0aBW0ZLkK/U95otd/yZLjtfgqBq/DP3NNSiQ8zYPVj/Djap3QbIC
 OD755624TnU3yAw5RR7egGt0SntGRr4uxRivYFYBd2MG3hm2Z6gB8/lgP
 PllN5LZFQqJWUpdZmuP8AUSTCuEME5AcKB3FGubeaE+E3vV5pPOhLlCBF
 VQyb6D8MR0/t3LX2iA4uGFbrM6Z0XqUT2VHyvNxvLPuHPhXkpk2d5esWY
 aNfADvAkPkdsakhPyu6kSOuAvc9KD8zRVWxQDP7Eniug78eX+HxYooKu8
 l4rjozFkZuwe65oErUpcQi1qzhQ1K/RzvFoWoZZS4G7XL6YiUqiW9n7yC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317870626"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="317870626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 01:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="926066043"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="926066043"
Received: from fcostelx-mobl2.ger.corp.intel.com (HELO [10.213.223.216])
 ([10.213.223.216])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 01:59:32 -0700
Message-ID: <59f57a56-2557-175b-d545-b1cd5f45a203@linux.intel.com>
Date: Fri, 17 Mar 2023 08:59:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915: Simplify vcs/bsc engine selection
Content-Language: en-US
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230316142728.1335239-1-tvrtko.ursulin@linux.intel.com>
 <b94f1474-60ad-518b-dff4-9518746d4213@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b94f1474-60ad-518b-dff4-9518746d4213@linux.intel.com>
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/03/2023 15:48, Das, Nirmoy wrote:
> 
> On 3/16/2023 3:27 PM, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> No need to look at the mask of present engines when we already have a
>> count stored ever since e2d0ff3525b9 ("drm/i915: Count engine instances
>> per uabi class").
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> 
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Pushed, thanks for the review!

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 9dce2957b4e5..3aeede6aee4d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -2449,11 +2449,6 @@ static int eb_submit(struct i915_execbuffer *eb)
>>       return err;
>>   }
>> -static int num_vcs_engines(struct drm_i915_private *i915)
>> -{
>> -    return hweight_long(VDBOX_MASK(to_gt(i915)));
>> -}
>> -
>>   /*
>>    * Find one BSD ring to dispatch the corresponding BSD command.
>>    * The engine index is returned.
>> @@ -2467,7 +2462,7 @@ gen8_dispatch_bsd_engine(struct drm_i915_private 
>> *dev_priv,
>>       /* Check whether the file_priv has already selected one ring. */
>>       if ((int)file_priv->bsd_engine < 0)
>>           file_priv->bsd_engine =
>> -            get_random_u32_below(num_vcs_engines(dev_priv));
>> +            
>> get_random_u32_below(dev_priv->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO]);
>>       return file_priv->bsd_engine;
>>   }
>> @@ -2655,7 +2650,8 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
>>           return -1;
>>       }
>> -    if (user_ring_id == I915_EXEC_BSD && num_vcs_engines(i915) > 1) {
>> +    if (user_ring_id == I915_EXEC_BSD &&
>> +        i915->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO] > 1) {
>>           unsigned int bsd_idx = args->flags & I915_EXEC_BSD_MASK;
>>           if (bsd_idx == I915_EXEC_BSD_DEFAULT) {
