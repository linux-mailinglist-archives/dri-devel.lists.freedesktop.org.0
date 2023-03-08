Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F96B04BE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DDD10E0E2;
	Wed,  8 Mar 2023 10:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D2410E0E2;
 Wed,  8 Mar 2023 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678272019; x=1709808019;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+qOge1LfEnhfM8TnH9jyEMF9TfY8UXpoI9DmR/PF7Iw=;
 b=nc8mXfJXrbav/LVFOQHRa+lTiU9VUNAd6gzZHlxcBZxGt9hGwUVy92kn
 08F3ylZ0qrEDLoV6X/z6owoezIGtPW7/+1T+N/rbOL5V+h6qJgnM3xG1j
 8GGtJ7BmeHhoEnLlepUBbCphbm195ESIQAtXzG0wftRztRmZyWrb2ArYn
 FLXIrJrTxj0pA/0kIryjTg+MMRwjd1IjxD1vPv9WYM5fgdxttQuTNVyal
 2inRQ9fSTuyXPsg+xc5UkgnMoNolEwx8lX84josdYYOMZKnmqVLqyCgFq
 Kq/93IhQ/IjJ3j6vEhRLdiMrd+YSPVo3OBcUGiR7qGffb9CgMlVBt+Tff Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338448840"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338448840"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670266622"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670266622"
Received: from dodonogh-mobl.ger.corp.intel.com (HELO [10.213.219.205])
 ([10.213.219.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:40:16 -0800
Message-ID: <04b5f3e6-ebda-df99-e251-f2aed99ab0e6@linux.intel.com>
Date: Wed, 8 Mar 2023 10:40:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/i915/pmu: Use only freq bits for falling back to
 requested freq
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230304012705.70003-1-ashutosh.dixit@intel.com>
 <20230304012705.70003-2-ashutosh.dixit@intel.com>
 <6abc2ea5-4d60-765b-a830-ee0225c63871@linux.intel.com>
 <87jzzrn6t6.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87jzzrn6t6.wl-ashutosh.dixit@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/03/2023 05:36, Dixit, Ashutosh wrote:
> On Mon, 06 Mar 2023 03:04:40 -0800, Tvrtko Ursulin wrote:
>>
> 
> Hi Tvrtko,
> 
>> On 04/03/2023 01:27, Ashutosh Dixit wrote:
>>> On newer generations, the GEN12_RPSTAT1 register contains more than freq
>>> information, e.g. see GEN12_VOLTAGE_MASK. Therefore use only the freq bits
>>> to decide whether to fall back to requested freq.
>>
> 
>> CI is not catching the problem?
> 
> This is because as we know PMU freq sampling happens only when gt is
> unparked (actively processing requests) so it is highly unlikely that gt
> will be in rc6 when it might have to fall back to requested freq (I checked
> this and it seems it is only at the end of the workload that we see it
> entering the fallback code path). Deleting the fallback path completely
> will not make much difference to the output and is an option too. Anyway I
> have retained it for now.

Ah got it now, it is about false positive and not the garbage bits fed 
in as I initially misunderstood.

>> Could you find an appropriate Fixes: tag please? If it can affects a
>> platform out of force probe then cc: stable to.
> 
> Cc stable is anyway not needed because affected platforms (DG1 onwards) are
> under force probe. Also because the issue does not affect real metrics (as
> mentioned above) as well as because it is a really a missing patch rather
> than a broken previous patch I am skipping the Fixes tag.

"DG1 onwards" - DG2? Should have at least Fixes: if so.

>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_pmu.c | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>> index 52531ab28c5f..f0a1e36915b8 100644
>>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>>> @@ -393,10 +393,8 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>>> 		 * case we assume the system is running at the intended
>>> 		 * frequency. Fortunately, the read should rarely fail!
>>> 		 */
>>> -		val = intel_rps_read_rpstat_fw(rps);
>>> -		if (val)
>>> -			val = intel_rps_get_cagf(rps, val);
>>> -		else
>>> +		val = intel_rps_get_cagf(rps, intel_rps_read_rpstat_fw(rps));
>>
>> Will this work with gen5_invert_freq as called by intel_rps_get_cagf?
> 
> PMU has ever only supported Gen6+. See intel_rps_read_rpstat_fw (Gen5 does
> not have a GEN6_RPSTAT1 register) as well as 01b8c2e60e96.

PMU _frequency_ not before Gen6, okay, I forgot about that.

Regards,

Tvrtko

> More importantly PMU was missing support for MTL. It is to avoid these
> kinds of issues I have submitted a new series with a different approach
> which should now take care of both MTL+ as well as Gen5-:
> 
> https://patchwork.freedesktop.org/series/114814/
> 
>>> +		if (!val)
>>> 			val = rps->cur_freq;
>>> 			add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
> 
> Thanks.
> --
> Ashutosh
