Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEF42A946
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 18:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237006E15F;
	Tue, 12 Oct 2021 16:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDB66E15F;
 Tue, 12 Oct 2021 16:20:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="224625669"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="224625669"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 09:19:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="480418106"
Received: from annahenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.214])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 09:19:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 michal.wajdeczko@intel.com, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/huc: Use i915_probe_error to
 report early CTB failures
In-Reply-To: <874k9mz0a6.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
 <20211011152106.3424810-2-thanneeru.srinivasulu@intel.com>
 <20211011181056.GA6310@jons-linux-dev-box> <874k9mz0a6.fsf@intel.com>
Date: Tue, 12 Oct 2021 19:19:01 +0300
Message-ID: <871r4qz05m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 12 Oct 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
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

For that matter, why has GEM_BUG_ON spread like a disease to display and
intel_uncore.c too?

BR,
Jani.


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

-- 
Jani Nikula, Intel Open Source Graphics Center
