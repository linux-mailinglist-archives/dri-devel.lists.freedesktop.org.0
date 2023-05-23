Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3670D871
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 11:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9267710E410;
	Tue, 23 May 2023 09:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ABC10E403;
 Tue, 23 May 2023 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684832856; x=1716368856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q2XdwoMNEcAz8l0uxh+Zp+irSHa5iHZUlQC4vL26z0g=;
 b=A3LoGCqgtu/07xrnVXkUN35Ht2LbDPhLqEpQMAIXMVFcG35JMQMKhS/P
 EdSVu8UnEm6V3zzpBihrOJXX5pVKTpGITAP9oyuBvPS+Z4EWBUtZPScS9
 Vp/GrfCg/wu4zb/0Okd3Le/AAxW9y/Pnav/6+Pk+x2ejJNOzwFmDM5mH2
 dBRoEYhGDzPjaT8ScB9ZoFgiUrYVUj7P2/U5+TBT62xsUI0E0bvqJywRU
 m4CRNK23iRGBZh1B054W4cPgL7WhjjYhFWQf3eQtRViIfuF9zszDrT2fN
 DYeHo1HBWXba2IS9Hri3GxyZQwKYmgjy3rZUIhU9zPZE6b9w5kRq6hXwi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="350691403"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="350691403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="848189577"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="848189577"
Received: from cboylan-mobl.ger.corp.intel.com (HELO [10.213.203.203])
 ([10.213.203.203])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:07:33 -0700
Message-ID: <f3402477-2880-a312-c6cc-bef79d7c2f57@linux.intel.com>
Date: Tue, 23 May 2023 10:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Add helpers for managing rps
 thresholds
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
 <20230522115928.588793-3-tvrtko.ursulin@linux.intel.com>
 <ZGv2J0t5XtMnYaXt@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZGv2J0t5XtMnYaXt@ashyti-mobl2.lan>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/05/2023 00:09, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Mon, May 22, 2023 at 12:59:27PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> In preparation for exposing via sysfs add helpers for managing rps
>> thresholds.
>>
>> v2:
>>   * Force sw and hw re-programming on threshold change.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c | 54 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h |  4 +++
>>   2 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 333abc8f7ecb..afde601a6111 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -16,7 +16,9 @@
>>   #include "intel_gt.h"
>>   #include "intel_gt_clock_utils.h"
>>   #include "intel_gt_irq.h"
>> +#include "intel_gt_pm.h"
>>   #include "intel_gt_pm_irq.h"
>> +#include "intel_gt_print.h"
>>   #include "intel_gt_regs.h"
>>   #include "intel_mchbar_regs.h"
>>   #include "intel_pcode.h"
>> @@ -2574,6 +2576,58 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
>>   		return set_min_freq(rps, val);
>>   }
>>   
>> +u8 intel_rps_get_up_threshold(struct intel_rps *rps)
>> +{
>> +	return rps->power.up_threshold;
>> +}
>> +
>> +static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
>> +{
>> +	int ret;
>> +
>> +	if (val > 100)
>> +		return -EINVAL;
>> +
>> +	ret = mutex_lock_interruptible(&rps->lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (*threshold == val)
>> +		goto out_unlock;
>> +
>> +	*threshold = val;
>> +
>> +	/* Force reset. */
>> +	rps->last_freq = -1;
>> +	mutex_lock(&rps->power.mutex);
>> +	rps->power.mode = -1;
>> +	mutex_unlock(&rps->power.mutex);
>> +
>> +	intel_rps_set(rps, clamp(rps->cur_freq,
>> +				 rps->min_freq_softlimit,
>> +				 rps->max_freq_softlimit));
> 
> why are you resetting here?

I want to ensure the next calls to rps_set go past the "if (val == 
rps->last_freq)" and "if (new_power == rps->power.mode)" checks (second 
one via gen6_rps_set_thresholds->rps_set_power" so new values are 
immediately programmed into the hardware and sw state reset and 
re-calculated.

Regards,

Tvrtko
