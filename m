Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61970BCDA
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E5710E2D5;
	Mon, 22 May 2023 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B6410E2D5;
 Mon, 22 May 2023 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684757033; x=1716293033;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Bc8PzkqylcdnvZnk/5uAYYZ9JsPIVFoT0RDiNxJMQyM=;
 b=jChO2mVORTXOrmDkLPsO4kO14uqUb1w4/ORJB0Q9E4rGjLKcbpgUjfIn
 cJPMIKIzm5sCdkH5hHLAggOIQyZLjVVCMjIXiDqOPJSfdQqbhWNrUVBIR
 BHGKkpYO1R0mOmJx7qDaYwM5jwYg41hYoFhch74QWj5+uAkmHkdfFOsna
 uoBMH++zAWQkJvU0VFqw6FPiEFjWml9roErvRpvOoe68dnmsOBE0emzOp
 lHJZt+HF3qiUSki7JeDPJMGFwASZzyI5hcvFPjgWVAknnIOff9OiBdyNS
 u/pGUmPLNnbdec7fPVrwt3UxgfWanIKzrR5sK+eLawZW1fGGbeNexEjyA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="416362746"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="416362746"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 05:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="680919005"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="680919005"
Received: from tjepsen-mobl.amr.corp.intel.com (HELO [10.252.45.96])
 ([10.252.45.96])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 05:03:50 -0700
Message-ID: <ab7760d5-af5d-2dd7-83c3-9972e0b68c7a@linux.intel.com>
Date: Mon, 22 May 2023 13:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [RFC 4/4] drm/i915: Expose RPS thresholds in sysfs
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
 <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
 <3b2a7f29-6490-00d0-8f29-f8bd5cea0d11@linux.intel.com>
 <ZGfiYracxton0/S5@rdvivi-mobl4>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZGfiYracxton0/S5@rdvivi-mobl4>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/05/2023 21:56, Rodrigo Vivi wrote:
> On Fri, Apr 28, 2023 at 09:44:53AM +0100, Tvrtko Ursulin wrote:
>>
>> On 28/04/2023 09:14, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> User feedback indicates significant performance gains are possible in
>>> specific games with non default RPS up/down thresholds.
>>>
>>> Expose these tunables via sysfs which will allow users to achieve best
>>> performance when running games and best power efficiency elsewhere.
>>>
>>> Note this patch supports non GuC based platforms only.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389
>>
>> [snip]
>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> index a5a7315f5ace..f790e81546ff 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> @@ -2588,7 +2588,12 @@ static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
>>>    	ret = mutex_lock_interruptible(&rps->lock);
>>>    	if (ret)
>>>    		return ret;
>>> -	*threshold = val;
>>> +	if (*threshold != val) {
>>> +		*threshold = val;
>>> +		intel_rps_set(rps, clamp(rps->cur_freq,
>>> +					 rps->min_freq_softlimit,
>>> +					 rps->max_freq_softlimit));
>>> +	}
>>>    	mutex_unlock(&rps->lock);
>>>    	return 0;
>>
>> This hunk belongs to a previous patch - moved locally.
> 
> I probably missed something then becuase I didn't miss this in any
> of the previous patches. To the point that this looked like a new
> separated patch.

Depends how you look at it. 3/4 adds a helper which changes the 
threshold, but it was only updating the sw state and so when those 
values would actually get written into registers (derived) would depend 
on the workload. So I thought it was important to move the call to 
intel_rps_set, which actually will trigger hw reprogramming, into the 
patch which claims to be adding the helper.

Note v2 of the helper (just sent) which actually fixes this further by 
forcing this re-programming to happen.

Regards,

Tvrtko
