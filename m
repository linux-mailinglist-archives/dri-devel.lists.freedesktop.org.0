Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A56EC86E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C7110E144;
	Mon, 24 Apr 2023 09:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F07010E144;
 Mon, 24 Apr 2023 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682327329; x=1713863329;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4Tk4ys2GJMF/DtgQSff29NO1cBe/bYOw5XR1LlYK5e4=;
 b=UzKof4+jxIsY2D5aRYu1DftW2010qjOswO05Ay8sKCLW+UeTm5fHeowo
 0BMBwkf1PA0jl3fu0OmjRTUmrLWXpnxLCWqNM7WbNul7iNOAAJPdAL+NO
 mfe+RItu68PFDF9PXkCxDn3YXQ8Qj3RO24ZtaKf4Rjc1qMVoH1gg9dE7W
 c5FUTn546vRGfG21HWr/UMtw9t73YdnOmtH8BGPBCRqpuFb0nT7jklPOG
 XQHAyJAPIIDEzJtmmOLKUjqtvWTtMeW1JbwXxg3VugG0kFhvYJ+MAkxbz
 EC2FS2uzKkXd59KrK5hSF03exLU2y0L+LCiejs9TkRxbYyrUXz8hmJKfi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326722146"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="326722146"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 02:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="782345966"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="782345966"
Received: from maisasax-mobl.ger.corp.intel.com (HELO [10.213.209.63])
 ([10.213.209.63])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 02:08:45 -0700
Message-ID: <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
Date: Mon, 24 Apr 2023 10:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Yang, Fei" <fei.yang@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <168232538771.392286.3227368099155268955@jljusten-skl>
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[fixed mailing lists addresses]

On 24/04/2023 09:36, Jordan Justen wrote:
> On 2023-04-23 00:05:06, Yang, Fei wrote:
>>> On 2023-04-20 09:11:18, Yang, Fei wrote:
>>>>> On 20/04/2023 12:39, Andi Shyti wrote:
>>>>>> Hi Fei,
>>>>>>
>>>>>> because this is an API change, we need some more information here.
>>>>>>
>>>>>> First of all you need to CC the userspace guys that have been
>>>>>> working on top of your series and get their ack's.
>>>>>
>>>>> Yes, and a link to a Mesa merge request which uses the uapi should
>>>>> be included.
>>>>
>>>> Working with Mesa team on this, stay tuned.
>>>>
>>>
>>> I would like to see the extension detection issue is handled
>>> before ack'ing this.
>>>
>>> How about a new DRM_I915_QUERY_GEM_CREATE_EXTENSIONS item, that returns
>>> a u64 array of usable extension names for DRM_IOCTL_I915_GEM_CREATE_EXT?
>>
>> I agree a query mechanism is necessary, but that should be generic for all
>> uAPI's, not just for GEM_CREATE.
>>
>>> A similar DRM_I915_QUERY_GEM_CONTEXT_CREATE_EXTENSIONS could also provide
>>> an alternative to Alan's "drm/i915/uapi/pxp: Add a GET_PARAM for PXP",
>>> and more easily allow advertising future new extensions for context/buffer
>>> creation.
>>
>> I think we should have a discussion and come up with a sustainable design for
>> the query uAPI, rather than just put in a quick hack for this.
> 
> I think you are being a bit too quick to dismiss my idea as a quick
> hack... Nevetheless, I would love to hear an alternate suggestion.
> Just as long as it's not, "let's figure this out later, because I need
> to add this feature now".
> 
> I don't think "just try to use it and if it fails, I guess it isn't
> supported" is reasonable. So, if we can't do better, at least add a
> GET_PARAM. Yeah, it's a quick hack, but it's better than nothing.

Being able to "list" supported extensions sounds like a reasonable principle, albeit a departure from the design direction to date. Which means there are probably no quick solutions. Also, AFAIU, only PXP context create is the problematic one, right? Everything else is pretty much instant or delayed allocation so super cheap to probe by attempting to use.

If I got that right and given this series is about drm_i915_gem_create_ext I don't think this side discussion should be blocking it.

Furthermore the PXP context create story is even more complicated, in a way that it is not just about querying whether the extension is supported, but the expensive check is something more complicated.

Going back to implementation details for this proposed new feature, one alternative to query could be something like:

   drm_i915_gem_create_ext.flags |= I915_GEM_CREATE_EXT_FLAG_PROBE_EXTENSIONS;

That would be somewhat more light weight to implement that the i915_query route. And it appears it would work for all ioctls which support extensions apart for i915_context_param_engines.

Regards,

Tvrtko
