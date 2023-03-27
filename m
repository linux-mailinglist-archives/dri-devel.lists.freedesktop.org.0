Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48D6CAA2B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 18:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A84A10E3AE;
	Mon, 27 Mar 2023 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27A10E125;
 Mon, 27 Mar 2023 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679933728; x=1711469728;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4JIKZC+9NY/5FOeeP6iXzyllTtbXjzLxR/bFWeU3qv4=;
 b=Y/GSKdO/S2g/LnfAi1TzjsawpreQW9Vs3StF9rmseNdsJVowPcZyq2L6
 E2QcOCG4GPK6ByPOrEEgcm5cxs2m7FxJzcvbIhEDtkT1Ug26amtTdu3cF
 hegyxpgtkZs/PmiXZjmGaaMY6+qdtMfrTv8m2DL1/co5mOGwqBqxIxz/S
 nKgQ1BVnWRBLESI0lL+dRwe0oUYfm5v0t9u191fGxEQaI/qcBloQY4jMw
 Fxb1LHkKpqf+ZhTmhtXtm31MAeNtkMYsCvC1cg9v5K//V0LP+Lrrzf9UK
 Zw6okzTIyPO+hItGeKKvQUt+lkifAJVNpt8MNQHImM9sisD9qDMc0p02a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320712297"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="320712297"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 09:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="713893777"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="713893777"
Received: from ctuohy-mobl1.ger.corp.intel.com (HELO [10.213.213.244])
 ([10.213.213.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 09:15:25 -0700
Message-ID: <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
Date: Mon, 27 Mar 2023 17:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com> <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
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
Cc: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/03/2023 08:07, Lionel Landwerlin wrote:
> On 26/03/2023 14:18, Rodrigo Vivi wrote:
>> On Sat, Mar 25, 2023 at 02:19:21AM -0400, Teres Alexis, Alan Previn 
>> wrote:
>>> alan:snip
>>>
>>> @@ -353,8 +367,20 @@ int intel_pxp_start(struct intel_pxp *pxp)
>>> alan:snip
>>>>> +    if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
>>>>> +        /*
>>>>> +         * GSC-fw loading, GSC-proxy init (requiring an mei 
>>>>> component driver) and
>>>>> +         * HuC-fw loading must all occur first before we start 
>>>>> requesting for PXP
>>>>> +         * sessions. Checking HuC authentication (the last 
>>>>> dependency)  will suffice.
>>>>> +         * Let's use a much larger 8 second timeout considering 
>>>>> all the types of
>>>>> +         * dependencies prior to that.
>>>>> +         */
>>>>> +        if 
>>>>> (wait_for(intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc), 8000))
>>>> This big timeout needs an ack from userspace drivers, as 
>>>> intel_pxp_start
>>>> is called during context creation and the current way to query if the
>>>> feature is supported is to create a protected context. 
>>>> Unfortunately, we
>>>> do need to wait to confirm that PXP is available (although in most 
>>>> cases
>>>> it shouldn't take even close to 8 secs), because until everything is
>>>> setup we're not sure if things will work as expected. I see 2 potential
>>>> mitigations in case the timeout doesn't work as-is:
>>>>
>>>> 1) we return -EAGAIN (or another dedicated error code) to userspace if
>>>> the prerequisite steps aren't done yet. This would indicate that the
>>>> feature is there, but that we haven't completed the setup yet. The
>>>> caller can then decide if they want to retry immediately or later. Pro:
>>>> more flexibility for userspace; Cons: new interface return code.
>>>>
>>>> 2) we add a getparam to say if PXP is supported in HW and the 
>>>> support is
>>>> compiled in i915. Userspace can query this as a way to check the 
>>>> feature
>>>> support and only create the context if they actually need it for PXP
>>>> operations. Pro: simpler kernel implementation; Cons: new getparam, 
>>>> plus
>>>> even if the getparam returns true the pxp_start could later fail, so
>>>> userspace needs to handle that case.

These two:

e6177ec586d1 ("drm/i915/huc: stall media submission until HuC is loaded")
b76c14c8fb2a ("drm/i915/huc: better define HuC status getparam possible return values.")

They do not help here? It is not possible to use or extend the refined I915_PARAM_HUC_STATUS return values combined with huc load fence for this all to keep working?

Regards,

Tvrtko

>>> alan: I've cc'd Rodrigo, Joonas and Lionel. Folks - what are your 
>>> thoughts on above issue?
>>> Recap: On MTL, only when creating a GEM Protected (PXP) context for 
>>> the very first time after
>>> a driver load, it will be dependent on (1) loading the GSC firmware, 
>>> (2) GuC loading the HuC
>>> firmware and (3) GSC authenticating the HuC fw. But step 3 also 
>>> depends on additional
>>> GSC-proxy-init steps that depend on a new mei-gsc-proxy component 
>>> driver. I'd used the
>>> 8 second number based on offline conversations with Daniele but that 
>>> is a worse-case.
>>> Alternatively, should we change UAPI instead to return -EAGAIN as per 
>>> Daniele's proposal?
>>> I believe we've had the get-param conversation offline recently and 
>>> the direction was to
>>> stick with attempting to create the context as it is normal in 3D UMD 
>>> when it comes to
>>> testing capabilities for other features too.
>>>
>>> Thoughts?
>> I like the option 1 more. This extra return handling won't break 
>> compatibility.
> 
> 
> I like option 2 better because we have to report support as fast as we 
> can when enumerating devices on the system for example.
> 
> If I understand correctly, with the get param, most apps won't ever be 
> blocking on any PXP stuff if they don't use it.
> 
> Only the ones that require protected support might block.
> 
> 
> -Lionel
> 
> 
> 
