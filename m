Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853A631E11
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514EB10E209;
	Mon, 21 Nov 2022 10:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153610E298;
 Mon, 21 Nov 2022 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669025869; x=1700561869;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8qjAp6EzaikmWOVOmXAst82VNpPJVtdHx82hPCwoOO0=;
 b=L2rKtivt3PYFjvGkL4IHYSXLpOkC1ASoAed4ehWqufwEuqiMVuVVry6x
 cooFop89b39TZ2034ebr4b9yKWSMnZ229DmrJ8Vx+Qoa7D5JTF6Rb2pij
 eUsdv52X8FZbqZFnBiwknseGb2wWRaSMIKtXmj8a7I+Zz/jmB9G0yBuMH
 EhQbcYt1H0APsXkwdkGotQe1JmJ7bUHOLn/RUULGH6i+ZNS9nazrWPUKD
 HyZA16V01rDkwMXC6jI5PTb1W7QqG3QXiWvDP7tEe3d1oSc+RAIOZl7Sz
 QcGk6/ucCoal3ER7lk3cbAETetz1Mo4uBbC6C3FoS98DnaGEd6k/TzgH5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="399812397"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="399812397"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:17:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="640971105"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="640971105"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.16])
 ([10.213.14.16])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:17:45 -0800
Message-ID: <4f75fe15-96b0-ac79-62f3-2ec6f41f5c1e@intel.com>
Date: Mon, 21 Nov 2022 11:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] drm/i915: Never return 0 if not all requests
 retired
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Das, Nirmoy" <nirmoy.das@linux.intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
 <20221118104222.57328-3-janusz.krzysztofik@linux.intel.com>
 <b7b01eef-3550-9f9f-11d0-8698fa322f66@linux.intel.com>
 <3200694.aeNJFYEL58@jkrzyszt-mobl1.ger.corp.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3200694.aeNJFYEL58@jkrzyszt-mobl1.ger.corp.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.11.2022 09:30, Janusz Krzysztofik wrote:
> Hi Nimroy,
>
> Thanks for looking at this.
>
> On Friday, 18 November 2022 20:56:50 CET Das, Nirmoy wrote:
>> On 11/18/2022 11:42 AM, Janusz Krzysztofik wrote:
>>> Users of intel_gt_retire_requests_timeout() expect 0 return value on
>>> success.  However, we have no protection from passing back 0 potentially
>>> returned by a call to dma_fence_wait_timeout() when it succedes right
>>> after its timeout has expired.
>>>
>>> Replace 0 with -ETIME before potentially using the timeout value as return
>>> code, so -ETIME is returned if there are still some requests not retired
>>> after timeout, 0 otherwise.
>>>
>>> v2: Move the added lines down so flush_submission() is not affected.
>>>
>>> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with
> retire_request")
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>> Cc: stable@vger.kernel.org # v5.5+
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/
> drm/i915/gt/intel_gt_requests.c
>>> index edb881d756309..3ac4603eeb4ee 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> @@ -199,6 +199,9 @@ out_active:	spin_lock(&timelines->lock);
>>>    	if (remaining_timeout)
>>>    		*remaining_timeout = timeout;
>>>    
>>> +	if (!timeout)
>>> +		timeout = -ETIME;
>> This will return error, -ETIME when 0 timeout is passed,
>> intel_gt_retire_requests().
> Yes, but only when active_count is not 0 after we loop through
> timelines->active_list calling retire_requests() on each and counting up
> failures in active_count.

Moving this line just after the call to dma_fence_wait_timeout should 
solve the controversy.

Regards
Andrzej

>
>> We don't want that.
> When 0 timeout is passed to intel_gt_retire_requests(), do we really want it
> to return 0 unconditionally, or are we rather interested if those calls to
> retire_requests() succeeded?
>
>> I think you can use a separate variable to store
>> return val from the dma_fence_wait_timeout()
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>> +
>>>    	return active_count ? timeout : 0;
> If active count is 0, we return 0 regardless of timeout value, and that's OK.
> However, if active_count is not 0, we shouldn't return 0, I believe, we should
> return either remaining time if some left, or error (-ETIME) if not.  If you
> think I'm wrong, please explain why.
>
> Thanks,
> Janusz
>
>>>    }
>>>    
>
>
>

