Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EF4C670F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AB010E2AF;
	Mon, 28 Feb 2022 10:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9FE89B48;
 Mon, 28 Feb 2022 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646043834; x=1677579834;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xKMrYd2kH3B44pFOlzPuym2egwUv3TtgzTfNog47IPY=;
 b=PAv7FSr+FoIKClOlyryb/5iQV68/chXOqT1xqT+8eF2Ms4a81hLv9W8c
 dGUWfsniwcA+Ecy94xUUxzBrRVnp1+EGd2I1ZLg5NulZEYilpVrf3wsYH
 QZ7vG/q0Aqz5dePeLO05avZb/HepEf2DohrP00GHorWVXWt1xlXbiTLjf
 JVda9KH/RhHpav+spPJQbz2uNn2YmiA/6hIpRk4smjzh6l8gqB0zb9W1e
 oVSumoCTlm9B/njv7LB2P9y9K+fndKhb9bLGOA/a1bvA4Ti6XIAo0m1Sw
 1siwBSSWVp825sfE3VXYNVCOnR5IbtD90DPkhEjl7xPW3iaLShKtN4xI2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="313570441"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="313570441"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 02:23:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="708597694"
Received: from jpdecker-mobl3.ger.corp.intel.com (HELO [10.213.235.138])
 ([10.213.235.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 02:23:52 -0800
Message-ID: <01c10e6d-ca38-9683-9188-a6adfcffb193@linux.intel.com>
Date: Mon, 28 Feb 2022 10:23:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/i915: Fix assert in i915_ggtt_pin
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220225174118.1320237-1-tvrtko.ursulin@linux.intel.com>
 <YhkY2dxBDnUG6tQV@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YhkY2dxBDnUG6tQV@intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/02/2022 17:58, Ville Syrjälä wrote:
> On Fri, Feb 25, 2022 at 05:41:17PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Use lockdep_assert_not_held to simplify and correct the code. Otherwise
>> false positive are hit if lock state is uknown like after a previous
>> taint.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 3558b16a929c..4469b7f52853 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1552,9 +1552,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>   	if (ww)
>>   		return __i915_ggtt_pin(vma, ww, align, flags);
>>   
>> -#ifdef CONFIG_LOCKDEP
>> -	WARN_ON(dma_resv_held(vma->obj->base.resv));
>> -#endif
>> +	lockdep_assert_not_held(&vma->obj->base.resv->lock.base);
> 
> Should there be a dma_resv wrapper for that? Shrug.

Probably.. it is really ugly being this verbose.

> Makes sense to me:
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I'll leave the other one to someone how knows how it's actually used.

Yeah I think that one is likely wrong. If lockdep is compiled in but not 
enabled it would make some asserts fire since state will be 'unknown' 
then and so it would always say "not locked" to the callers.

Regards,

Tvrtko

> 
>>   
>>   	for_i915_gem_ww(&_ww, err, true) {
>>   		err = i915_gem_object_lock(vma->obj, &_ww);
>> -- 
>> 2.32.0
> 
