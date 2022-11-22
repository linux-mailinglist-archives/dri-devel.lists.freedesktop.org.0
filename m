Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB7633A4B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 11:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C776110E1CC;
	Tue, 22 Nov 2022 10:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92D10E1CC;
 Tue, 22 Nov 2022 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669113694; x=1700649694;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FGFdo2d2+4Ebiod7yHK3cpOgh2U4mpz4AjUfCMGoBg8=;
 b=Iq2yNPbUlC7VoLr2rCZf8GscC2VF6C7bp/KBSmfnMDJ9BsHI4Hs/zWVr
 5ByXxckwIjjeLlegKUqCoAmmw477avzJN3hnby7COaWde7O5QdBZ8I7+h
 /FbxR/Oj2PJ/rYOWFelCS9KHWkg4npLHWRmd2QIeuIpgdp0XxVd5RMC89
 bqDTQB4TB+2e9iE7LejgjztIGYo3TkuF0MZqKYa66bLhj2lhTp6xOO4A8
 aUlXoqUS7Rq9arLXRRvUVkroJdxYk+2YOTCkgmLkAJYI0IoA8S0ipFg/9
 RhTrG6m+dOY36j9KrGGuxmi4Vb1pKA+AIn4ozwuerKSPCagjP1vp3pNAp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314935743"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="314935743"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 02:41:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="704921002"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="704921002"
Received: from camorino-mobl.ger.corp.intel.com (HELO [10.213.209.233])
 ([10.213.209.233])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 02:41:31 -0800
Message-ID: <d05b3556-19c7-6b50-8f23-0d17428dc741@linux.intel.com>
Date: Tue, 22 Nov 2022 10:41:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Fix negative value passed as
 remaining time
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <20221121145655.75141-2-janusz.krzysztofik@linux.intel.com>
 <37493d84-441b-76fa-d42b-ae1764a361bb@intel.com>
 <8188363.NyiUUSuA9g@jkrzyszt-mobl1.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8188363.NyiUUSuA9g@jkrzyszt-mobl1.ger.corp.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/11/2022 23:19, Janusz Krzysztofik wrote:
> Hi Andrzej,
> 
> Thanks for providing your R-b.
> 
> On Monday, 21 November 2022 18:40:51 CET Andrzej Hajda wrote:
>> On 21.11.2022 15:56, Janusz Krzysztofik wrote:
>>> Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
>>> with GuC") extended the API of intel_gt_retire_requests_timeout() with an
>>> extra argument 'remaining_timeout', intended for passing back unconsumed
>>> portion of requested timeout when 0 (success) is returned.  However, when
>>> request retirement happens to succeed despite an error returned by a call
>>> to dma_fence_wait_timeout(), that error code (a negative value) is passed
>>> back instead of remaining time.  If we then pass that negative value
>>> forward as requested timeout to intel_uc_wait_for_idle(), an explicit BUG
>>> will be triggered.

Right, AFAICT a GEM_BUG_ON in debug builds, but in production builds 
negative timeout will get passed along all the way to schedule_timeout 
where error and call trace will be dumped. So fix appears warranted indeed.

>>> If request retirement succeeds but an error code is passed back via
>>> remaininig_timeout, we may have no clue on how much of the initial timeout
>>> might have been left for spending it on waiting for GuC to become idle.
>>> OTOH, since all pending requests have been successfully retired, that
>>> error code has been already ignored by intel_gt_retire_requests_timeout(),
>>> then we shouldn't fail.
>>>
>>> Assume no more time has been left on error and pass 0 timeout value to
>>> intel_uc_wait_for_idle() to give it a chance to return success if GuC is
>>> already idle.
>>>
>>> v3: Don't fail on any error passed back via remaining_timeout.
>>>
>>> v2: Fix the issue on the caller side, not the provider.
>>>
>>> Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
> with GuC")
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>> Cc: stable@vger.kernel.org # v5.15+
>>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> While still open for comments from others, I'm now looking for potential
> committer.

Both patches are considered good to go?

Regards,

Tvrtko

> 
> Thanks,
> Janusz
> 
> 
>>
>> Regards
>> Andrzej
>>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_gt.c | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/
> intel_gt.c
>>> index b5ad9caa55372..7ef0edb2e37cd 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -677,8 +677,13 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long
> timeout)
>>>    			return -EINTR;
>>>    	}
>>>    
>>> -	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
>>> -							
> remaining_timeout);
>>> +	if (timeout)
>>> +		return timeout;
>>> +
>>> +	if (remaining_timeout < 0)
>>> +		remaining_timeout = 0;
>>> +
>>> +	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
>>>    }
>>>    
>>>    int intel_gt_init(struct intel_gt *gt)
>>
>>
> 
> 
> 
> 
