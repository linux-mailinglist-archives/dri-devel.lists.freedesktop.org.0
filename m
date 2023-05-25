Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B187106D2
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6710E794;
	Thu, 25 May 2023 08:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566D510E7E1;
 Thu, 25 May 2023 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685001633; x=1716537633;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c/06LK4FK2pK4T9xbdwQSvVt/jx+MVhVzxwW8eu02Z0=;
 b=PvVrtqnJ9A6Sjdsu+3xmDxRs/wn4n8HxeEj0xsudDRGPHn5ojBguH8B0
 KdM1QrIBjS8YNraza8xQ2SgqipiG8Wb55I0TePHgbXCJVMstNxdo10dXi
 GeQuHo7+djYU6Manhmvl6nJyYWFX+1IyLeWwR1NeKYYqlR4WdtW/ewvoc
 CDzIfiad6QkNDIG3PDTh1WbcjViL9trCYA3/BgPi6xa7kII0uHVAWohTZ
 kGN0Rd6QtkOIGDRGizIR77lV9hnZIZLl8qqZHxx4bFOpxVwr5qFX1Fv29
 cWtQqlW1QQ73655t/MQjlyaazhcospoJ9rihbb5TcgzTQyD4MZvtqCTzZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440178003"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="440178003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="849096231"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="849096231"
Received: from moiraric-mobl.ger.corp.intel.com (HELO [10.213.234.103])
 ([10.213.234.103])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:00:31 -0700
Message-ID: <88d4aac7-52da-a969-8358-3ddd2f241b91@linux.intel.com>
Date: Thu, 25 May 2023 09:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/pmu: Turn off the timer to
 sample frequencies when GT is parked
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230523151918.4170499-1-ashutosh.dixit@intel.com>
 <20230523151918.4170499-2-ashutosh.dixit@intel.com>
 <86c706cc-9d98-3b28-d713-853938cabf74@intel.com>
 <87zg5tmmhv.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87zg5tmmhv.wl-ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2023 22:46, Dixit, Ashutosh wrote:
> On Wed, 24 May 2023 02:12:31 -0700, Andrzej Hajda wrote:
>>
> 
> Hi Andrzej,
> 
>> On 23.05.2023 17:19, Ashutosh Dixit wrote:
>>> pmu_needs_timer() keeps the timer running even when GT is parked,
>>> ostensibly to sample requested/actual frequencies. However
>>> frequency_sample() has the following:
>>>
>>> 	/* Report 0/0 (actual/requested) frequency while parked. */
>>> 	if (!intel_gt_pm_get_if_awake(gt))
>>> 		return;
>>>
>>> The above code prevents frequencies to be sampled while the GT is
>>> parked. So we might as well turn off the sampling timer itself in this
>>> case and save CPU cycles/power.
>>>
>>> v2: Instead of turning freq bits off, return false, since no counters will
>>>       run after this change when GT is parked (Tvrtko)
>>>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_pmu.c | 12 +++++-------
>>>    1 file changed, 5 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>> index a814583e19fd7..b47d890d4ada1 100644
>>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>>> @@ -144,6 +144,10 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
>>> 	struct drm_i915_private *i915 = container_of(pmu, typeof(*i915), pmu);
>>> 	u32 enable;
>>>    +	/* When GPU is idle, at present no counters need to run */
>>> +	if (!gpu_active)
>>> +		return false;
>>> +
>>
>> What is then purpose of calling pmu_needs_timer with 2nd arg false?
>> Why not just replace all occurrences of pmu_needs_timer(.., false) with
>> false? And remove the 2nd argument.
> 
> OK, this didn't seem unreasonable so I went ahead and made this change in
> Patch v3. Copying Tvrtko too in case he prefers v2 for any reason. Please
> review.

It is all fine by me (the latest version and all)!

Regards,

Tvrtko
