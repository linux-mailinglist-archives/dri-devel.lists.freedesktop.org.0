Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62525197DE
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC0410E71A;
	Wed,  4 May 2022 07:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8210E71A;
 Wed,  4 May 2022 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651648072; x=1683184072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lXtzPQtbnL1lPn3k+PUBEqddYAgqxyFThNG5DHKhY2s=;
 b=f8sB4br6dmCo3w/ibGVP5xaFblkeeKAn0JGGVyNgAroy1CBOPK1btITe
 d9h+o6TTTaIqEUsntPWDs0Hlz4qJmrLmY7DOOsNuBQszvjUD+L80cT7Uo
 NYnbdsdWkBFneA3FPHM3EhA3sOnsz2r7u9UK4l62sHgs1p1IT0WTCJa2+
 YcCvgbLkhoHihelt3jw8l9vlKE2NryuPRjae3WdYgTze8dgKUzIT/l1mB
 44fI0hL1/iZaLYdLnvwJ8s+1M5wl7lZr0akUs5hHxe6jL8dP1OF7bdain
 QRPDdwi9TKHWM1fkpt3LoT1EKzyrHkhG+XTmO3D8oR+KUDDDyb3c975yp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267841264"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267841264"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 00:07:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="664353966"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO [10.213.236.183])
 ([10.213.236.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 00:07:46 -0700
Message-ID: <b4d5189c-68c6-0622-188d-728b90873363@linux.intel.com>
Date: Wed, 4 May 2022 08:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Support programming the EU
 priority in the GuC descriptor
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220504004446.2000540-1-daniele.ceraolospurio@intel.com>
 <9cccaf77-4711-d42c-8c7a-2cae79637dca@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <9cccaf77-4711-d42c-8c7a-2cae79637dca@intel.com>
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


On 04/05/2022 02:06, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 5/3/2022 5:44 PM, Daniele Ceraolo Spurio wrote:
>> From: Matthew Brost <matthew.brost@intel.com>
>>
>> The EU priority register must be updated by the GuC rather than the
>> driver as it is context specific and only the GuC knows which context
>> is currently executing.
>>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 75291e9846c50..8f3ed60ff07d9 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2420,6 +2420,8 @@ static void 
>> prepare_context_registration_info(struct intel_context *ce,
>>        */
>>       info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
>>       info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
>> +    if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
>> +        info->hwlrca_lo |= lrc_desc_priority(ce->guc_state.prio);
> 
> Just realized that I forgot to squash in a change when I moved branch 
> (guc_state.prio is the GuC-side value while lrc_desc_priority expects 
> the i915 one). Ignore this, will fix up and re-send later.

Is there any Fixes: or stable needed to tie it together with something?

Regards,

Tvrtko

> 
> Daniele
> 
>>       info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>       /*
> 
