Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95E42A9D4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 18:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302F89CDF;
	Tue, 12 Oct 2021 16:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA75B89CDD;
 Tue, 12 Oct 2021 16:43:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="214355397"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="214355397"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 09:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="591835608"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga004.jf.intel.com with ESMTP; 12 Oct 2021 09:43:43 -0700
Received: from [10.252.61.52] (mwajdecz-MOBL.ger.corp.intel.com [10.252.61.52])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 19CGhfqs018221; Tue, 12 Oct 2021 17:43:41 +0100
Message-ID: <3ec1e43b-8697-4eb6-fe31-dc75c325c79f@intel.com>
Date: Tue, 12 Oct 2021 18:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/huc: Use i915_probe_error to
 report early CTB failures
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
 <20211011152106.3424810-2-thanneeru.srinivasulu@intel.com>
 <20211011181056.GA6310@jons-linux-dev-box> <874k9mz0a6.fsf@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <874k9mz0a6.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 12.10.2021 18:16, Jani Nikula wrote:
> On Mon, 11 Oct 2021, Matthew Brost <matthew.brost@intel.com> wrote:
>> On Mon, Oct 11, 2021 at 08:51:03PM +0530, Thanneeru Srinivasulu wrote:
>>> Replace DRM_ERROR with CT_PROBE_ERROR to report early CTB failures.
>>>
>>> Signed-off-by: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
>>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>> ---
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> index 0a3504bc0b61..83764db0fd6d 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> @@ -191,8 +191,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
>>>  	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
>>>  					    desc_addr, buff_addr, size);
>>>  	if (unlikely(err))
>>> -		CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
>>> -			 guc_ct_buffer_type_to_str(type), ERR_PTR(err));
>>> +		CT_PROBE_ERROR(ct, "Failed to register %s buffer (%pe)\n",
>>> +			       guc_ct_buffer_type_to_str(type), ERR_PTR(err));
> 
> Please tell me why we are adding not just i915-specific logging helpers,
> but file specific ones?
> 
> To be honest I'd like to see all of the CT_ERROR, CT_DEBUG,
> CT_PROBE_ERROR macros just gone.

the reason for CT_DEBUG is that it can be quite noisy so we must have an
easy option to compile it out on non-debug configs, can't just replace
that helper with drm_dbg or i915_dbg (that we don't have) as it will be
available likely on I915_DEBUG config, while we want more fine control.

use of file (or component) level helpers allows us to simplify the code
(no need to repeat long i915->drm lookup from component pointer) and we
may provide common prefix and/or classification of the messages.

extra bonus, especially useful after introduction of multi-gt support,
will be possibility of augmenting message to include gt identifier,
without the need to update all existing places if they were using i915-
or drm- level functions directly.

for this last feature, likely "gt" specific intel_gt_err|probe_err|dbg
helpers will do the job as well, so if someone introduce them, I'm happy
to convert CT_ERROR calls to these new helpers if really really needed.

-Michal

> 
> 
> BR,
> Jani.
> 
> 
>>>  	return err;
>>>  }
>>>  
>>> -- 
>>> 2.25.1
>>>
> 
