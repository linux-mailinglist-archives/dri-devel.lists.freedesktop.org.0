Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E270BCCD
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887110E2F4;
	Mon, 22 May 2023 12:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E0F10E2F2;
 Mon, 22 May 2023 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684756855; x=1716292855;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BFBZe+bf6LaS06IRR5rci4UH4Ur8p9CaWev8dhvyFrE=;
 b=WYKh/oachqiOLZPx+SslnT3jZNqdJR5FGYZHQWwmI/OtGvJ+s1zXctXM
 MDCNVQhmmIRS0+lwOxV6aXBnjMOo4BTvCbAnH5iWBEGdwk/YIgfyC43Ju
 gFEss0lsAZVKVbTbzmhLV+tPyHK87DcNDgBfpN1q5i+YXuZ9AWOIUjqxJ
 a1i4E5MmkQLU+fxlf2oc3GNyM25J8gNodY/QgMEJHvRhWDT5netZkUo6y
 qG6Zz5HaNz2/eP//O1LmegXcp/hiW4EK9CagrjqmpfMILWve9pQjSqVAQ
 dCko8E8tc8ayAcwG+EZdAXtQdHOX2yGUsPWqn7ow+SZxK4sTHwNcFNtjE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="351750053"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="351750053"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 05:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="793262326"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="793262326"
Received: from tjepsen-mobl.amr.corp.intel.com (HELO [10.252.45.96])
 ([10.252.45.96])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 05:00:37 -0700
Message-ID: <19f46d49-81f0-db31-b55e-2ae13135e3ce@linux.intel.com>
Date: Mon, 22 May 2023 13:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [RFC 3/4] drm/i915: Add helpers for managing rps
 thresholds
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
 <20230428081457.857009-4-tvrtko.ursulin@linux.intel.com>
 <ZGfijE0jawJnUg1s@rdvivi-mobl4>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZGfijE0jawJnUg1s@rdvivi-mobl4>
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
> On Fri, Apr 28, 2023 at 09:14:56AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> In preparation for exposing via sysfs add helpers for managing rps
>> thresholds.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c | 36 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h |  4 ++++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index a39eee444849..a5a7315f5ace 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2573,6 +2573,42 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
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
>> +	*threshold = val;
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold)
>> +{
>> +	return rps_set_threshold(rps, &rps->power.up_threshold, threshold);
>> +}
>> +
>> +u8 intel_rps_get_down_threshold(struct intel_rps *rps)
>> +{
>> +	return rps->power.down_threshold;
>> +}
>> +
>> +int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold)
>> +{
>> +	return rps_set_threshold(rps, &rps->power.down_threshold, threshold);
>> +}
>> +
> 
> Isn't this breaking compilation with the unused functions?

I checked and no - guess because they are exported. Would you prefer me 
to squash 3&4 so that there isn't a patch which adds unused helpers?

Regards,

Tvrtko

> 
>>   static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
>>   {
>>   	struct intel_uncore *uncore = rps_to_uncore(rps);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index a3fa987aa91f..92fb01f5a452 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -37,6 +37,10 @@ void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
>>   
>>   int intel_gpu_freq(struct intel_rps *rps, int val);
>>   int intel_freq_opcode(struct intel_rps *rps, int val);
>> +u8 intel_rps_get_up_threshold(struct intel_rps *rps);
>> +int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold);
>> +u8 intel_rps_get_down_threshold(struct intel_rps *rps);
>> +int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold);
>>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
>>   u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
>>   u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
>> -- 
>> 2.37.2
>>
