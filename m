Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160016321A7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 13:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FC10E2BA;
	Mon, 21 Nov 2022 12:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45710E2B8;
 Mon, 21 Nov 2022 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669032725; x=1700568725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9zG2ROG0+huxinjH+Am3KeN9RUY+sGqiZRsvadbZfAs=;
 b=TGhc9h3nKrEuk5RVMl0ymbB5jTljTz4/ZAD1dZl6oKD/IN1vjooDIECY
 Ow2N2SVR3yhMvRgd4ByvbAXBFGg65hNNMJFbt6F9SEBNLSxMJSrU/3zQB
 K3yCR8Vt+cx+ufbtJJAHH0rFY/fxI27rPHfpj4c8UuS0lXWzYXsV2J5DC
 zhlzUJg49O8CPywJMUMb0OQ43mBXmTInVuAVCoSN3Alda9QFucJJy/ayk
 QCmwYdlCG4RJOisonrBKuqi9FlvCUKFuhRMV/7kSeScIQQjpv7WwFEcLS
 67cuRYodigRHHz9xRahgcrFbMoX5CUqFiIyd+xDG8Nea/nsZXvKzUDC2F Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="312245197"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="312245197"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 04:12:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="709786773"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="709786773"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.16])
 ([10.213.14.16])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 04:12:02 -0800
Message-ID: <f55479c0-ca32-c8ae-119d-d1c9dbb71ce5@intel.com>
Date: Mon, 21 Nov 2022 13:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915: Never return 0 if not all
 requests retired
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Das, Nirmoy" <nirmoy.das@linux.intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
 <4f75fe15-96b0-ac79-62f3-2ec6f41f5c1e@intel.com>
 <4758027.GXAFRqVoOG@jkrzyszt-mobl1.ger.corp.intel.com>
 <2856001.e9J7NaK4W3@jkrzyszt-mobl1.ger.corp.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2856001.e9J7NaK4W3@jkrzyszt-mobl1.ger.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.11.2022 11:59, Janusz Krzysztofik wrote:
> On Monday, 21 November 2022 11:51:15 CET Janusz Krzysztofik wrote:
>> Hi Andrzej,
>>
>> Thanks for your comment.
>>
>> On Monday, 21 November 2022 11:17:42 CET Andrzej Hajda wrote:
>>>
>>> On 21.11.2022 09:30, Janusz Krzysztofik wrote:
>>>> Hi Nimroy,
>>>>
>>>> Thanks for looking at this.
>>>>
>>>> On Friday, 18 November 2022 20:56:50 CET Das, Nirmoy wrote:
>>>>> On 11/18/2022 11:42 AM, Janusz Krzysztofik wrote:
>>>>>> Users of intel_gt_retire_requests_timeout() expect 0 return value on
>>>>>> success.  However, we have no protection from passing back 0 potentially
>>>>>> returned by a call to dma_fence_wait_timeout() when it succedes right
>>>>>> after its timeout has expired.
>>>>>>
>>>>>> Replace 0 with -ETIME before potentially using the timeout value as return
>>>>>> code, so -ETIME is returned if there are still some requests not retired
>>>>>> after timeout, 0 otherwise.
>>>>>>
>>>>>> v2: Move the added lines down so flush_submission() is not affected.
>>>>>>
>>>>>> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with
>>>> retire_request")
>>>>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>>>>> Cc: stable@vger.kernel.org # v5.5+
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/
>>>> drm/i915/gt/intel_gt_requests.c
>>>>>> index edb881d756309..3ac4603eeb4ee 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>>>>> @@ -199,6 +199,9 @@ out_active:	spin_lock(&timelines->lock);
>>>>>>     	if (remaining_timeout)
>>>>>>     		*remaining_timeout = timeout;
>>>>>>     
>>>>>> +	if (!timeout)
>>>>>> +		timeout = -ETIME;
>>>>> This will return error, -ETIME when 0 timeout is passed,
>>>>> intel_gt_retire_requests().
>>>> Yes, but only when active_count is not 0 after we loop through
>>>> timelines->active_list calling retire_requests() on each and counting up
>>>> failures in active_count.
>>>
>>> Moving this line just after the call to dma_fence_wait_timeout should
>>> solve the controversy.
>>
>> But that would break our need to pass 0, not -ETIME, to flush_submission() in
>> case the initial value of timeout was 0, as pointed out by Chris during our
>> discussion on v2.
>>
>> Maybe an inline comment above the added lines that explains why we are doing
>> this could help?
> 
> How about not adding those two lines but modifying the return line instead?
> 
> -	return active_count ? timeout : 0;
> +	return active_count ? timeout ?: -ETIME : 0;

Personally I would translate ret value from dma_fence* API ASAP, and 
call flush_submission conditionally - to limit coexistence of both APIs.
But this looks correct to me, as well.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> 
> Would that be self explanatory?
> 
> Thanks,
> Janusz
> 
>>
>> Thanks,
>> Janusz
>>
>>>
>>> Regards
>>> Andrzej
>>>
>>>>
>>>>> We don't want that.
>>>> When 0 timeout is passed to intel_gt_retire_requests(), do we really want it
>>>> to return 0 unconditionally, or are we rather interested if those calls to
>>>> retire_requests() succeeded?
>>>>
>>>>> I think you can use a separate variable to store
>>>>> return val from the dma_fence_wait_timeout()
>>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Nirmoy
>>>>>
>>>>>> +
>>>>>>     	return active_count ? timeout : 0;
>>>> If active count is 0, we return 0 regardless of timeout value, and that's OK.
>>>> However, if active_count is not 0, we shouldn't return 0, I believe, we should
>>>> return either remaining time if some left, or error (-ETIME) if not.  If you
>>>> think I'm wrong, please explain why.
>>>>
>>>> Thanks,
>>>> Janusz
>>>>
>>>>>>     }
>>>>>>     
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
> 
> 
> 
> 

