Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D597E5F409C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 12:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABAE10E4F7;
	Tue,  4 Oct 2022 10:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC0C10E4F7;
 Tue,  4 Oct 2022 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664878430; x=1696414430;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s4UegEoDAXkRzgFbHFAsV3A4w9IMCHJgHVb/PynqJQw=;
 b=gaGvr6YvAQ+Sur9BZ3S6oByiNsAwzHo4LU0MU4trPDN/scpym8DPvt+e
 7WNqhiT5w4fID8yXT841plhb56J+ILl559blYLRLmud6p1bYJcsgbPmGG
 s3nbydEirq8KZEvz7DpM+phTh8/uOvMiGW3ejOQWmZyyPasFsyBzRG/Cn
 DfW9bmt+Xh92pfMyrcRUMasrYBeEWJoTZJ7J5q/BxV0NMbU3ouIy6Majk
 WyJMTQn1PVNpN9zD+a96WMKKqZHNdcDne6eDt1jEuL2rXLQAE31cJG0Fq
 SP1NEPIjQTAqT86ZG6av11NSoPmjXiMkuSJSsGR3UGXna9+s9ufCwSezC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="286064517"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="286064517"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 03:13:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="601568515"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="601568515"
Received: from tomfin1x-mobl1.ger.corp.intel.com (HELO [10.213.229.10])
 ([10.213.229.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 03:13:48 -0700
Message-ID: <6ed29166-f97b-ce15-725d-4453af968707@linux.intel.com>
Date: Tue, 4 Oct 2022 11:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v2 14/14] drm/i915/mtl: Add multicast steering
 for media GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-15-matthew.d.roper@intel.com>
 <406ebfa6-b00c-b2ba-fd27-04e46de7ffc1@linux.intel.com>
 <Yzs44t6dUNd8LjZw@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yzs44t6dUNd8LjZw@mdroper-desk1.amr.corp.intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/10/2022 20:32, Matt Roper wrote:
> On Mon, Oct 03, 2022 at 09:56:18AM +0100, Tvrtko Ursulin wrote:
>>
>> Hi Matt,
>>
>> On 01/10/2022 01:45, Matt Roper wrote:
>>> MTL's media GT only has a single type of steering ("OAADDRM") which
>>> selects between media slice 0 and media slice 1.  We'll always steer to
>>> media slice 0 unless it is fused off (which is the case when VD0, VE0,
>>> and SFC0 are all reported as unavailable).
>>>
>>> Bspec: 67789
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 19 +++++++++++++++++--
>>>    drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
>>>    drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 +++++++++++++++++-
>>>    3 files changed, 35 insertions(+), 3 deletions(-)
>>
>> [snip]
>>
>>> +static void
>>> +mtl_media_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>>> +{
>>> +	/*
>>> +	 * Unlike older platforms, we no longer setup implicit steering here;
>>> +	 * all MCR accesses are explicitly steered.
>>> +	 */
>>> +	if (drm_debug_enabled(DRM_UT_DRIVER)) {
>>> +		struct drm_printer p = drm_debug_printer("MCR Steering:");
>>> +
>>> +		intel_gt_mcr_report_steering(&p, gt, false);
>>> +	}
>>> +}
>>> +
>>>    static void
>>>    gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>>>    {
>>>    	struct drm_i915_private *i915 = gt->i915;
>>> -	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
>>> +	if (IS_METEORLAKE(i915) && gt->type == GT_MEDIA)
>>> +		mtl_media_gt_workarounds_init(gt, wal);
>>> +	else if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
>>>    		mtl_3d_gt_workarounds_init(gt, wal);
>>>    	else if (IS_PONTEVECCHIO(i915))
>>>    		pvc_gt_workarounds_init(gt, wal);
>>
>> Casually reading only - wouldn't it be nicer if the if-ladder in here
>> (gt_init_workarounds) would have a single case per platform, and then you'd
>> fork further (3d vs media) in MTL specific function?
> 
> Actually, that reminds me that we probably need to change this in a
> different direction --- starting with MTL, we should stop tying
> workarounds to the platform (IS_METEORLAKE) but rather tie them to the
> IP version (i.e., GRAPHICS_VER or MEDIA_VER) since in the future the
> same chiplets can potentially be re-used on multiple platforms.
> Conversely, you could also potentially have variants of the same
> "platform" (e.g., MTL) that incorporate chiplets with different IP
> versions (and thus need distinct lists of workarounds and such).
> 
> At the moment MTL is the only platform we have with the standalone media
> design so there's no potential for mix-and-match of chiplets yet, and
> IS_METEORLAKE works fine in the short term, but we do need to start
> planning ahead and moving off of platform checks in areas of the driver
> like this.
> 
>>
>> Also, series ends up with mtl_media_gt_workarounds_init and
>> mtl_3d_gt_workarounds_init apparently 100% identical. You will need two
>> copies in the future?
> 
> Yes, the two GTs are expected to end up with completely different sets
> of workarounds once the platform is enabled.  We've just been delaying
> on actually sending the new MTL workarounds upstream to give the
> workaround database a bit more time to settle.

Ah yes, I misread the banner printed from those two "as no workaround 
will be programmed from here" and thought why you'd need two copies of a 
nearly empty function and two identical comments. My bad.

You will end up with three instances of "if debug report steering" so 
could in theory add a helper for that. For some minimal value of 
consolidation.. up to you.

Regards,

Tvrtko
