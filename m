Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548082523E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A33510E5AA;
	Fri,  5 Jan 2024 10:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC1F10E5AA;
 Fri,  5 Jan 2024 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704451176; x=1735987176;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zuVaMetkOUHbMOEscEOXu6xsKFLodA5fpJtyTmGtHKw=;
 b=FeIiR1CCFZ9P/VLutrqiKwQmmvoMuJiQlV37TDeV9zOBEIPxOKUBq+63
 BsVHPIVFzMe3WFlQYbpMAZ3riZvX1MG+cvhtjig2SFMkBC98sd3Yg0xfk
 +RvvDiarE2EKgqMULOkoD9BZVHTDxPCs5m6bDDJo/kka3JFGBmOLb6+va
 G9mxAlFTufcAPWt2jpU0Zo/3wjAZ1ZxnLIeztk5Svcs5UykDkt3m5NTLa
 tJOtkfP0uc0m8rJn5zGT8rMGWzkuKYUv1OMTqTGXUsjty/WhySxBg5udA
 OfMzSD6uX9MTuYXHUKKEJIs5lqBYa95oCopMIXly7fhKXrlJjNTXFn+0f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="461785419"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="461785419"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="1027728033"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="1027728033"
Received: from cmacnam1-mobl3.ger.corp.intel.com (HELO [10.213.193.225])
 ([10.213.193.225])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:39:35 -0800
Message-ID: <73f0a8e9-3fd6-45a9-a084-b5308900ca8f@linux.intel.com>
Date: Fri, 5 Jan 2024 10:39:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/i915/gt: Support fixed CCS mode
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
 <20240104143558.193694-2-andi.shyti@linux.intel.com>
 <98e56d3e-ebf0-42b9-928b-0dcc4303658c@linux.intel.com>
 <ZZchsRQ5Kc-x9dlk@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZZchsRQ5Kc-x9dlk@ashyti-mobl2.lan>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/01/2024 21:23, Andi Shyti wrote:
> Hi Tvrtko,
> 
> [1]
> 
>>> +	/*
>>> +	 * Loop over all available slices and assign each a user engine.
>>> +	 *
>>> +	 * With 1 engine (ccs0):
>>> +	 *   slice 0, 1, 2, 3: ccs0
>>> +	 *
>>> +	 * With 2 engines (ccs0, ccs1):
>>> +	 *   slice 0, 2: ccs0
>>> +	 *   slice 1, 3: ccs1
>>> +	 *
>>> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>>> +	 *   slice 0: ccs0
>>> +	 *   slice 1: ccs1
>>> +	 *   slice 2: ccs2
>>> +	 *   slice 3: ccs3
>>> +	 *
>>> +	 * Since the number of slices and the number of engines is
>>> +	 * known, and we ensure that there is an exact multiple of
>>> +	 * engines for slices, the double loop becomes a loop over each
>>> +	 * slice.
>>> +	 */
>>> +	for (i = num_slices / num_engines; i < num_slices; i++) {
>>> +		struct intel_engine_cs *engine;
>>> +		intel_engine_mask_t tmp;
>>> +
>>> +		for_each_engine_masked(engine, gt, ALL_CCS(gt), tmp) {
>>> +			/* If a slice is fused off, leave disabled */
>>> +			while (!(CCS_MASK(gt) & BIT(slice)))
>>> +				slice++;
>>> +
>>> +			mode &= ~XEHP_CCS_MODE_CSLICE(slice, XEHP_CCS_MODE_CSLICE_MASK);
>>> +			mode |= XEHP_CCS_MODE_CSLICE(slice, engine->instance);
>>> +
>>> +			/* assign the next slice */
>>> +			slice++;
>>> +		}
>>> +	}
>>> +
>>> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
>>> +}
>>> +
>>> +void intel_gt_apply_ccs_mode(struct intel_gt *gt)
>>> +{
>>> +	mutex_lock(&gt->ccs.mutex);
>>> +	__intel_gt_apply_ccs_mode(gt);
>>> +	mutex_unlock(&gt->ccs.mutex);
>>> +}
>>> +
>>> +void intel_gt_init_ccs_mode(struct intel_gt *gt)
>>> +{
>>> +	mutex_init(&gt->ccs.mutex);
>>> +	gt->ccs.mode = 1;
>>
>> What is '1'? And this question carries over to the sysfs interface in the
>> following patch - who will use it and where it is documented how to use it?
> 
> The value '1' is explained in the comment above[1] and in the

Do you mean this is mode '1':

  * With 1 engine (ccs0):
  *   slice 0, 1, 2, 3: ccs0

?

But I don't see where it says what do different modes mean on different 
SKU configurations.

It also does not say what should the num_slices sysfs file be used for.

Does "mode N" mean "assign each command streamer N compute slices"? Or 
"assign each compute slice N command streamers"?

I wonder if we should add something user friendly into 
Documentation/ABI/*/sysfs-... Joonas your thoughts?

> comment below[2]. Maybe we should give it an enum meaning? But
> that would be something like CCS_MODE_1/2/4, I thinks
> ccs.mode = 1/2/4 is more understandable.
> 
>> Also, should this setting somehow be gated by an applicable platform? Or if
>> not on setting then when acting on it in __intel_gt_apply_ccs_mode?
>>
>> Creation of sysfs files as well should be gated by platform too in the
>> following patch?
> 
> The idea of this series is to disable the CCS load balancing
> (which automatically chooses between mode 1/2/4) and used the
> a fixed scheme chosen by the user.
> 
> (I'm preparing v3 as Chris was so kind to recommend some changes
> offline)

Okay lets wait for v2 and I will then see if I will this that will make 
it clearer to casual observers.

Regards,

Tvrtko


> Thanks,
> Andi
> 
> [2]
> 
>>> +	/*
>>> +	 * Track fixed mapping between CCS engines and compute slices.
>>> +	 *
>>> +	 * In order to w/a HW that has the inability to dynamically load
>>> +	 * balance between CCS engines and EU in the compute slices, we have to
>>> +	 * reconfigure a static mapping on the fly. We track the current CCS
>>> +	 * configuration (set by thr user through a sysfs interface) and compare
>>> +	 * it against the current CCS_MODE (which maps CCS engines to compute
>>> +	 * slices). If there is only a single engine selected, we can map it to
>>> +	 * all available compute slices for maximal single task performance
>>> +	 * (fast/narrow). If there are more then one engine selected, we have to
>>> +	 * reduce the number of slices allocated to each engine (wide/slow),
>>> +	 * fairly distributing the EU between the equivalent engines.
>>> +	 */
>>> +	struct {
>>> +		struct mutex mutex;
>>> +		u32 mode;
>>> +	} ccs;
