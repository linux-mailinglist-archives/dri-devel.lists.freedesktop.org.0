Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E059DA7D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D79B2DE9;
	Tue, 23 Aug 2022 10:10:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00698B2DDD;
 Tue, 23 Aug 2022 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661249403; x=1692785403;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=b6Me5SkZwKclzzjgjY4XfOJsJLuLYxGNYUR4az52vBM=;
 b=myDHHpP9WSNX/q/HzxGeuQs7+NVL1yn9ps7k+kUtUhYqlVeC5m99WOzj
 XIqckEzVYJMRJ5WXXR3grG95MrdwfgnOA3ih8lauD854GGjC7D+8Onl/i
 uM9hKtPm8R8txjhgeEU2vkHyGlY31a515pQ0ug5WIYZZ4vCmRrV49OXr3
 JrV4Vvy1lfuMljR10UawR06kecpha1DfYHbCOR5QFHM64vbwKFI10eNp7
 4T6PNsoa9YreEi+9EjyGH4rDjfzDRWteIYnA2pHURTj6bKRI/CVeBTzpA
 pAFvUU1UwfvvJ9m+tKt69IccSULiAncsmAyXPtojcRdmICNoPCK93tQrV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294436245"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="294436245"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 03:10:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="585910375"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.51.100])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 03:10:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
In-Reply-To: <76993a22-6f37-2fab-7b86-ae56a3e9f7e5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-4-John.C.Harrison@Intel.com>
 <87a680o6jm.fsf@intel.com>
 <76993a22-6f37-2fab-7b86-ae56a3e9f7e5@intel.com>
Date: Tue, 23 Aug 2022 13:09:57 +0300
Message-ID: <87v8qjl18q.fsf@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022, John Harrison <john.c.harrison@intel.com> wrote:
> On 8/19/2022 03:45, Jani Nikula wrote:
>> On Wed, 27 Jul 2022, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> It is useful to be able to match GuC events to kernel events when
>>> looking at the GuC log. That requires being able to convert GuC
>>> timestamps to kernel time. So, when dumping error captures and/or GuC
>>> logs, include a stamp in both time zones plus the clock frequency.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  2 ++
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 19 +++++++++++++++++++
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h     |  2 ++
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  2 ++
>>>   drivers/gpu/drm/i915/i915_gpu_error.c      | 12 ++++++++++++
>>>   drivers/gpu/drm/i915/i915_gpu_error.h      |  3 +++
>>>   6 files changed, 40 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> index 60d6eb5f245b7..fc7979bd91db5 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> @@ -1007,6 +1007,8 @@
>>>   #define   GEN11_LSN_UNSLCVC_GAFS_HALF_CL2_MAXALLOC	(1 << 9)
>>>   #define   GEN11_LSN_UNSLCVC_GAFS_HALF_SF_MAXALLOC	(1 << 7)
>>>   
>>> +#define GUCPMTIMESTAMP				_MMIO(0xc3e8)
>>> +
>>>   #define __GEN9_RCS0_MOCS0			0xc800
>>>   #define GEN9_GFX_MOCS(i)			_MMIO(__GEN9_RCS0_MOCS0 + (i) * 4)
>>>   #define __GEN9_VCS0_MOCS0			0xc900
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> index 2706a8c650900..ab4aacc516aa4 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> @@ -389,6 +389,25 @@ void intel_guc_write_params(struct intel_guc *guc)
>>>   	intel_uncore_forcewake_put(uncore, FORCEWAKE_GT);
>>>   }
>>>   
>>> +void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
>>> +{
>>> +	struct intel_gt *gt = guc_to_gt(guc);
>>> +	intel_wakeref_t wakeref;
>>> +	u32 stamp = 0;
>>> +	u64 ktime;
>>> +
>>> +	intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
>> Why does this function print runtime info alone? Seems kind of random,
>> considering what intel_device_info_print_runtime() actually
>> prints. Should it print both device info and runtime info, or nothing at
>> all?
> Hmm. That was added specifically to print the rawclk value (and only for 
> the rawclk value) because that was the frequency that the GuC time stamp 
> register ticks at. I think we later worked out that the CS frequency was 
> more correct. Hence printing gt->clock_frequency lower down. I guess I 
> forgot to go back and remove the rawclk print, though.
>
> So yeah, it can be removed.

Could you r-b the patch [1] doing just that please?

BR,
Jani.

[1] https://patchwork.freedesktop.org/patch/msgid/b395ac4c909042f5daabf29959d8733993545aa2.1660910433.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
