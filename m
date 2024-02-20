Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807085B6FD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7DE10E26A;
	Tue, 20 Feb 2024 09:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5VYr81o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204CD10E26A;
 Tue, 20 Feb 2024 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708420611; x=1739956611;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4zps8Ls/EQDz1Or3EX3yYsS2Kx9OQYzJ7lWfwPdUfEM=;
 b=S5VYr81o1lrxY4oOXoU9xJvsIUrivwR9alCiDQthPOtXnnxYAOq8FzC2
 ggZcMu6YiV3x0OmQNm88wGytGWfQ40gEIFIE4JWBzpJn4BB8kwKRMQ0hs
 pZurWIvmbEQCjBDxh9ZYlIE0Ye5ovEFC5Sz63Amg3zJtifT9FfPb+iZuz
 UEwZxPeSYVpgNRH1lpPob9QBIJaPTlw58deElv5oSB5chhh0I0Isji4F/
 tieB93y4Cjmd6iCsMRz1dErl0K6t3rD5RYAIwDaHxRIPL+MbDVfyCqO5p
 /o9QsiunBesWkHL0rD3pyDl/dBeQgVL2V+m2AbpwWRtQv+sZkyxXEtqx6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13629533"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13629533"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 01:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936424675"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="936424675"
Received: from dunnejor-mobl2.ger.corp.intel.com (HELO [10.213.231.185])
 ([10.213.231.185])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 01:16:47 -0800
Message-ID: <f8455cd2-bed6-4026-bf6e-f6dfea2f86c5@linux.intel.com>
Date: Tue, 20 Feb 2024 09:16:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Fix possible null pointer dereference after
 drm_dbg_printer conversion
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jani Nikula
 <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
 <ZdOz78jQu-GvJuDJ@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZdOz78jQu-GvJuDJ@intel.com>
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


On 19/02/2024 20:02, Rodrigo Vivi wrote:
> On Mon, Feb 19, 2024 at 01:14:23PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Request can be NULL if no guilty request was identified so simply use
>> engine->i915 instead.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: d50892a9554c ("drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()")
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Luca Coelho <luciano.coelho@intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks Rodrigo!

Given how d50892a9554c landed via drm-misc-next, Maxime or Thomas - 
could you take this via drm-misc-next-fixes or if there will be another 
drm-misc-next pull request?

Regards,

Tvrtko

> 
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> index 5f8d86e25993..8d4bb95f8424 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> @@ -96,8 +96,8 @@ static void heartbeat_commit(struct i915_request *rq,
>>   static void show_heartbeat(const struct i915_request *rq,
>>   			   struct intel_engine_cs *engine)
>>   {
>> -	struct drm_printer p = drm_dbg_printer(&rq->i915->drm, DRM_UT_DRIVER,
>> -					       "heartbeat");
>> +	struct drm_printer p =
>> +		drm_dbg_printer(&engine->i915->drm, DRM_UT_DRIVER, "heartbeat");
>>   
>>   	if (!rq) {
>>   		intel_engine_dump(engine, &p,
>> -- 
>> 2.40.1
>>
