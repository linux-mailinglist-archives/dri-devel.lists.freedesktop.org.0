Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6E61EF1F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3601310E248;
	Mon,  7 Nov 2022 09:34:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8594910E248;
 Mon,  7 Nov 2022 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667813639; x=1699349639;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qWhIsUxYx7T6ytResqbo02bHEQsqU57XKNFCtJiRGac=;
 b=J9/ltDaZ/cbIlCPzUJssD1tJidi23G636hxLyZySHyWe/vtiEbp8+bRI
 3Y077EvkBNt30+BYYxfBz+/gsuroc+1WEohw3H32294szZrgf0dDWRUgz
 HTzHsXJT3XERvTPVeu7xQxqsjTAiZ1wi3/VEjo23gOhP2INSq5ymq8652
 sdVoTXx4gSe/5CNZ5yLPeZDLPuboUvyHH8FOB0a2vqlLLLFg86pHm+lRN
 mjA7OzHdQN811pef8F30ARNATLJvS3ZdnYvtxwXnsB+JCz5uvw1pIlbAF
 nt7KV3s1DxtolAZ4MHsqK0p2+kut5lTLpnphsBl78wZIKHW1djeMSoP5z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="311503990"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="311503990"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 01:33:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="778421889"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="778421889"
Received: from aalbarra-mobl.ger.corp.intel.com (HELO [10.213.226.227])
 ([10.213.226.227])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 01:33:57 -0800
Message-ID: <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
Date: Mon, 7 Nov 2022 09:33:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When trying to analyse bug reports from CI, customers, etc. it can be
>> difficult to work out exactly what is happening on which GT in a
>> multi-GT system. So add GT oriented debug/error message wrappers. If
>> used instead of the drm_ equivalents, you get the same output but with
>> a GT# prefix on it.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> The only downside to this is that we'll print "GT0: " even on single-GT 
> devices. We could introduce a gt->info.name and print that, so we could 
> have it different per-platform, but IMO it's not worth the effort.
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> I think it might be worth getting an ack from one of the maintainers to 
> make sure we're all aligned on transitioning to these new logging macro 
> for gt code.

Idea is I think a very good one. First I would suggest standardising to lowercase GT in logs because:

$ grep "GT%" i915/ -r
$ grep "gt%" i915/ -r
i915/gt/intel_gt_sysfs.c:                                gt->i915->sysfs_gt, "gt%d", gt->info.id))
i915/gt/intel_gt_sysfs.c:                "failed to initialize gt%d sysfs root\n", gt->info.id);
i915/gt/intel_gt_sysfs_pm.c:                     "failed to create gt%u RC6 sysfs files (%pe)\n",
i915/gt/intel_gt_sysfs_pm.c:                             "failed to create gt%u RC6p sysfs files (%pe)\n",
i915/gt/intel_gt_sysfs_pm.c:                     "failed to create gt%u RPS sysfs files (%pe)",
i915/gt/intel_gt_sysfs_pm.c:                     "failed to create gt%u punit_req_freq_mhz sysfs (%pe)",
i915/gt/intel_gt_sysfs_pm.c:                             "failed to create gt%u throttle sysfs files (%pe)",
i915/gt/intel_gt_sysfs_pm.c:                             "failed to create gt%u media_perf_power_attrs sysfs (%pe)\n",
i915/gt/intel_gt_sysfs_pm.c:                     "failed to add gt%u rps defaults (%pe)\n",
i915/i915_driver.c:                     drm_err(&gt->i915->drm, "gt%d: intel_pcode_init failed %d\n", id, ret);
i915/i915_hwmon.c:              snprintf(ddat_gt->name, sizeof(ddat_gt->name), "i915_gt%u", i);

Then there is a question of naming. Are we okay with GT_XXX or, do we want intel_gt_, or something completely different. I don't have a strong opinion at the moment so I'll add some more folks to Cc.

What I'd would like to see tried is to converting all of i915/gt within one kernel release so we don't have a mish-mash of log formats.

Regards,

Tvrtko
  
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.h | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h 
>> b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index e0365d5562484..1e016fb0117a4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -13,6 +13,21 @@
>>   struct drm_i915_private;
>>   struct drm_printer;
>> +#define GT_ERR(_gt, _fmt, ...) \
>> +    drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>> ##__VA_ARGS__)
>> +
>> +#define GT_WARN(_gt, _fmt, ...) \
>> +    drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>> ##__VA_ARGS__)
>> +
>> +#define GT_NOTICE(_gt, _fmt, ...) \
>> +    drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>> ##__VA_ARGS__)
>> +
>> +#define GT_INFO(_gt, _fmt, ...) \
>> +    drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>> ##__VA_ARGS__)
>> +
>> +#define GT_DBG(_gt, _fmt, ...) \
>> +    drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>> ##__VA_ARGS__)
>> +
>>   #define GT_TRACE(gt, fmt, ...) do {                    \
>>       const struct intel_gt *gt__ __maybe_unused = (gt);        \
>>       GEM_TRACE("%s " fmt, dev_name(gt__->i915->drm.dev),        \
> 
