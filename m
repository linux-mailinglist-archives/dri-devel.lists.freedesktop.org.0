Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B08AE28C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 12:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A446C10FBA5;
	Tue, 23 Apr 2024 10:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3BZ1Q9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7E410FBA5;
 Tue, 23 Apr 2024 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869129; x=1745405129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=znhdUUo9napM87NqUfnFFOwii5LGIBtJAChAphYHpGM=;
 b=d3BZ1Q9NWTt89OFOCZOIe0oXbto5lwAI7FKDzEcd+4m7jAp3UvM3YwRg
 ER+4CqsNNxPD9qMgQp/GbD7ipb2vDcGKwG1V8lpDR+8MXvsjRGW9/2gxX
 XauWNDdB8ffDZtrSJDzyQnizrlg0dEUa6yfKinCmJ2GWaOYmpiRTuShgZ
 a+9sdaH8UbsjBo9QbF7Jh/VlK0/swz2x1e3qq97Yc22nN6LondGp3VNnb
 z8lkn/q4LMyBr2JyUlaDBj8nmj/JAIx+eJ48lPlmk/niTiZD7bLCyuwWS
 E7xt7diFtyPY50Pex4TBwgmj0IB5Rs0qs/GJ/5KwqYFh02edXWohUGmBy w==;
X-CSE-ConnectionGUID: 4Nv1Pe5zQBqyPNCfQyXf+w==
X-CSE-MsgGUID: 9m5vxDcqTqKGWGE4qag6zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26903189"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="26903189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:45:28 -0700
X-CSE-ConnectionGUID: kxTxz9haRquJET3qYb84qg==
X-CSE-MsgGUID: z5c+cNk2SgOW0XBWcvYbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28781456"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.3])
 ([10.94.248.3])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:45:27 -0700
Message-ID: <0df81d37-3cc6-4f60-9111-1f579e51ff18@linux.intel.com>
Date: Tue, 23 Apr 2024 12:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/i915: Fix gt reset with GuC submission is
 disabled
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John.C.Harrison@intel.com
References: <20240422201951.633-1-nirmoy.das@intel.com>
 <20240422201951.633-2-nirmoy.das@intel.com>
 <ZieAEGnCE88TY0GM@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZieAEGnCE88TY0GM@ashyti-mobl2.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 4/23/2024 11:32 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Mon, Apr 22, 2024 at 10:19:51PM +0200, Nirmoy Das wrote:
>> Currently intel_gt_reset() kills the GuC and then resets requested
>> engines. This is problematic because there is a dedicated CSB FIFO
>> which only GuC can access and if that FIFO fills up, the hardware
>> will block on the next context switch until there is space that means
>> the system is effectively hung. If an engine is reset whilst actively
>> executing a context, a CSB entry will be sent to say that the context
>> has gone idle. Thus if reset happens on a very busy system then
>> killing GuC before killing the engines will lead to deadlock because
>> of filled up CSB FIFO.
> is this a fix?

I went quite far back in the commit logs, and it appears to me that 
we've always been using the current reset flow.

I believe we don't perform a GT reset immediately after sending a number 
of requests, which is what the current failed test is doing.

So, I don't think there will be any visible impact on the user with the 
current flow.

>
>> To address this issue, the GuC should be killed only after resetting
>> the requested engines and before calling intel_gt_init_hw().
>>
>> v2: Improve commit message(John)
>>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index b1393863ca9b..6161f7a3ff70 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -879,8 +879,17 @@ static intel_engine_mask_t reset_prepare(struct intel_gt *gt)
>>   	intel_engine_mask_t awake = 0;
>>   	enum intel_engine_id id;
>>   
>> -	/* For GuC mode, ensure submission is disabled before stopping ring */
>> -	intel_uc_reset_prepare(&gt->uc);
>> +	/**
>> +	 * For GuC mode with submission enabled, ensure submission
>> +	 * is disabled before stopping ring.
> nit: "stopping *the* ring"
Will fix it while merging if I don't have to resend this again.
>
>> +	 *
>> +	 * For GuC mode with submission disabled, ensure that GuC is not
>> +	 * sanitized, do that after engine reset. reset_prepare()
>> +	 * is followed by engine reset which in this mode requires GuC to
>> +	 * process any CSB FIFO entries generated by the resets.
>> +	 */
>> +	if (intel_uc_uses_guc_submission(&gt->uc))
>> +		intel_uc_reset_prepare(&gt->uc);
>>   
>>   	for_each_engine(engine, gt, id) {
>>   		if (intel_engine_pm_get_if_awake(engine))
>> @@ -1227,6 +1236,9 @@ void intel_gt_reset(struct intel_gt *gt,
>>   
>>   	intel_overlay_reset(gt->i915);
>>   
>> +	/* sanitize uC after engine reset */
>> +	if (!intel_uc_uses_guc_submission(&gt->uc))
>> +		intel_uc_reset_prepare(&gt->uc);
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,

Nirmoy

> Thanks,
> Andi
