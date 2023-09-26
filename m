Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E47AF403
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC02910E15B;
	Tue, 26 Sep 2023 19:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5988310E42B;
 Tue, 26 Sep 2023 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695755862; x=1727291862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SH17sUONlagBR+83EvFyQqMYrAZ5iCGrsYpICKtrjxU=;
 b=JMWr7LKCqgMpGSLqN6jG91+gXV/luZ6b2nhlPgR9HAi6lEmGmJ2+sJt8
 dB7PAgUG+oZ9zeA+rixMfEy5bx11skO3RLHvPt2NiJXdGAoNP80kHJUDp
 MTMr9slMYGyjfP4TOXmBRLgDn+mLdQk302DUe2TDwlgfjjCQZ/U1lAvCQ
 OmAYXWW/EW1sUQyX2cCvbSM3OCTDkoenNZfFld+VLhjo84aw6gqa/hvpc
 IlQVysG0BDT1OTn/9ucaf04s7+yu09jPMOr7KxootSZMtcB9Vq7bnbetO
 2swTpgEoIygXKHDsgvE5bWURumYaM4prz9lc39bo+z71km+c7dZBoubIW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378929536"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378929536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892319662"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="892319662"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.40.128])
 ([10.252.40.128])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:16:35 -0700
Message-ID: <b8efa738-42e3-65d7-dcb2-06ef9edec21c@linux.intel.com>
Date: Tue, 26 Sep 2023 21:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Skip MCR ops for ring fault
 register
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230926141842.8681-1-nirmoy.das@intel.com>
 <20230926143809.GG2706891@mdroper-desk1.amr.corp.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230926143809.GG2706891@mdroper-desk1.amr.corp.intel.com>
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

Hi Matt,

On 9/26/2023 4:38 PM, Matt Roper wrote:
> On Tue, Sep 26, 2023 at 04:18:42PM +0200, Nirmoy Das wrote:
>> On MTL GEN12_RING_FAULT_REG is not replicated so don't
>> do mcr based operation for this register.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c      | 14 +++++++++++++-
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>>   drivers/gpu/drm/i915/i915_gpu_error.c   | 11 ++++++++++-
>>   3 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 93062c35e072..d4de692e8be1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -262,10 +262,22 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>>   				   I915_MASTER_ERROR_INTERRUPT);
>>   	}
>>   
>> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>> +	/*
>> +	 * for media tile this ring fault register is not replicated
>> +	 * so skip doing mcr ops on it.
>> +	 */
>> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> This should be checking the media version rather than the graphics
> version.  I.e., "MEDIA_VER(i915) > 13" since it's possible future
> versions of the media IP may change the behavior (independently of the
> graphics IP versions).
Sounds good. I will replace this with

if (MEDIA_VER(i915) == 13 && engine->gt->type == GT_MEDIA)

to limit this this change on media IP 13


Thanks,

Nirmoy

>
>
> Matt
>
>> +	    gt->type == GT_MEDIA) {
>> +		intel_uncore_rmw(uncore, XELPMP_RING_FAULT_REG,
>> +				 RING_FAULT_VALID, 0);
>> +		intel_uncore_posting_read(uncore,
>> +					  XELPMP_RING_FAULT_REG);
>> +
>> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>>   		intel_gt_mcr_multicast_rmw(gt, XEHP_RING_FAULT_REG,
>>   					   RING_FAULT_VALID, 0);
>>   		intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
>> +
>>   	} else if (GRAPHICS_VER(i915) >= 12) {
>>   		intel_uncore_rmw(uncore, GEN12_RING_FAULT_REG, RING_FAULT_VALID, 0);
>>   		intel_uncore_posting_read(uncore, GEN12_RING_FAULT_REG);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index cca4bac8f8b0..eecd0a87a647 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -1084,6 +1084,7 @@
>>   
>>   #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
>>   #define XEHP_RING_FAULT_REG			MCR_REG(0xcec4)
>> +#define XELPMP_RING_FAULT_REG			_MMIO(0xcec4)
>>   #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>>   #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
>>   #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index f4ebcfb70289..83f1a729da8b 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1234,7 +1234,16 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
>>   	if (GRAPHICS_VER(i915) >= 6) {
>>   		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
>>   
>> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>> +		/*
>> +		 * for media tile this ring fault register is not replicated
>> +		 * so skip doing mcr ops on it.
>> +		 */
>> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
>> +		    engine->gt->type == GT_MEDIA)
>> +			ee->fault_reg = intel_uncore_read(engine->uncore,
>> +							  XELPMP_RING_FAULT_REG);
>> +
>> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>>   			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
>>   							      XEHP_RING_FAULT_REG);
>>   		else if (GRAPHICS_VER(i915) >= 12)
>> -- 
>> 2.41.0
>>
