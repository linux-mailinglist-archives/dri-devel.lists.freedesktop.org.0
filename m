Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32984E90EA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2610610E645;
	Mon, 28 Mar 2022 09:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F302110E63D;
 Mon, 28 Mar 2022 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648458970; x=1679994970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0Kp8rkJwWfBo0ytt8aQ9O5lNwLIvMn4N97i/tXou/Ak=;
 b=Y0DAo0Q8i3C3lavx9QxpgxviOPDlwnvfATMTMrbYwsS2Hjaykrk8jjN4
 9cxVazoOQbEEdoKotDHNNqVT388G10VXuHu5CEJx7mlU2WmpyXMXyb503
 y7fQH+3hTFgVSAPqOGo14+ZG3VO34HdaXMvWZD9OoHL4VyTCGLyl7UFgF
 0erFTWBjocc6w9WKbqqSrMlpE0F4WXDmCprHzNSoqbfvFIDtFSFIESIsO
 f3lS/PmcjnFABnG2zNnTIsrmd6ioMZddj42m4tstcTwzcBeKQmO8lULcE
 Klyc4fWNSbzKuhVGB04X4zMut5VNRbWp7J3u/OqCCru0K4ydc5DECcNOJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="241106448"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="241106448"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:16:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="545888435"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.36.120])
 ([10.252.36.120])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:16:08 -0700
Message-ID: <91e01ccc-6c06-269e-78f9-011148f097b2@linux.intel.com>
Date: Mon, 28 Mar 2022 11:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix remaining_timeout in
 intel_gt_retire_requests_timeout
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
 <71bbc214-b3a0-d3ca-c3bc-fe6d0b8d162c@linux.intel.com>
 <eeeedf74-4793-8b83-dd81-cb2cc3c22ea1@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <eeeedf74-4793-8b83-dd81-cb2cc3c22ea1@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/25/2022 9:33 PM, Ceraolo Spurio, Daniele wrote:
>
>
> On 3/25/2022 11:37 AM, Das, Nirmoy wrote:
>>
>> On 3/25/2022 6:58 PM, Daniele Ceraolo Spurio wrote:
>>> In intel_gt_wait_for_idle, we use the remaining timeout returned from
>>> intel_gt_retire_requests_timeout to wait on the GuC being idle. 
>>> However,
>>> the returned variable can have a negative value if something goes wrong
>>> during the wait, leading to us hitting a GEM_BUG_ON in the GuC wait
>>> function.
>>> To fix this, make sure to only return the timeout if it is positive.
>>>
>>> Fixes: b97060a99b01b ("drm/i915/guc: Update intel_gt_wait_for_idle 
>>> to work with GuC")
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> index edb881d756309..ef70c209976d8 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> @@ -197,7 +197,7 @@ out_active: spin_lock(&timelines->lock);
>>>           active_count++;
>>>         if (remaining_timeout)
>>> -        *remaining_timeout = timeout;
>>> +        *remaining_timeout = timeout > 0 ? timeout : 0;
>>
>>
>> Should the last flush_submission() be  "if ( timeout > 0 
>> &&flush_submission(gt, timeout))" ?
>
> I considered it, but flush_submission only checks for timeout != 0 so 
> it won't accidentally make use of a negative value thinking it's 
> positive. I don't know if the flush is purposely done even if timeout 
> is negative or if that's a mistake, but that code has been there long 
> before we modified the function to return the remaining timeout and 
> never seems to have caused issues, so I decided not to change it.


Yes, we need clarify if we really need the final flush if the timeout is 
negative.

But this patch  is Acked-by: Nirmoy Das <nirmoy.das@intel.com>

Nirmoy

>
> Daniele
>
>>
>>
>> Nirmoy
>>
>>>         return active_count ? timeout : 0;
>>>   }
>
