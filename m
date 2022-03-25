Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175654E72C0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4792F10E1E0;
	Fri, 25 Mar 2022 12:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F87410E1E0;
 Fri, 25 Mar 2022 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648210184; x=1679746184;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BhL288zfjqp8EvdHKisOhxAOVUzU8yUz8fuM6Je0E1Q=;
 b=Wlu5WwhEO3oHgTMIR4r8eSpchD9TPJKkXa8TB6ZuT7tUUJ6UksP4V5lr
 60I5zYenjTCqCZnVGYN7qhrzyniBpZqCN6JPi38cQrVZlIQIBm38ozofE
 l36vmFZAZcr7lj5YTABJ8MCnPKAunqq3V2BUz4sxjopEUyHIxrvzU7TDM
 3aY65f7BEdDx/wmDJ1TvvPqSrZgo6GkU1SKPBLlZlVnf8eKSl0VrG80m1
 hYr/F2MegqQVEDxykoHer8UfBWF/PNFwQpsOVmNq3RkEXhB3RSnbR+EhI
 V3LUFAAKMBsFHMuOgaXuRKLhVYXPeUYX76LgbsZe3cX//lK1RJacmRWnn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="319327678"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="319327678"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:09:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="561813522"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:09:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [RFC] drm/i915: Split out intel_vtd_active and run_as_guest to
 own header
In-Reply-To: <a08030e9-d352-1599-68ca-36605cadac1b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322164446.2124983-1-tvrtko.ursulin@linux.intel.com>
 <878rszitmi.fsf@intel.com>
 <0078dd11-c958-7a60-19d1-e32446f0d9da@linux.intel.com>
 <87r16rh8b2.fsf@intel.com>
 <2a91ffe1-71a2-98a0-daa3-23aee0b1c29d@linux.intel.com>
 <87o81vgouz.fsf@intel.com>
 <a08030e9-d352-1599-68ca-36605cadac1b@linux.intel.com>
Date: Fri, 25 Mar 2022 14:09:33 +0200
Message-ID: <87fsn6grnm.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 24/03/2022 18:57, Jani Nikula wrote:
>> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>> On 24/03/2022 11:57, Jani Nikula wrote:
>>>> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>> On 24/03/2022 09:31, Jani Nikula wrote:
>>>>>> On Tue, 22 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>> ---
>>>>>>> Typed up how I see it - bash away.
>>>>>>
>>>>>> So is intel_vtd_active() so performance critical that it needs to be
>>>>>> inline?
>>>>>>
>>>>>> We're passing struct drm_i915_private * everywhere we can, and it just
>>>>>> feels silly to use struct drm_device * to avoid the include.
>>>>>>
>>>>>> Static inlines considered harmful. :p
>>>>>
>>>>> Same as it is ;), and gee, who was it that he said he was just trying to
>>>>> declutter i915_drv.h.. ;p
>>>>
>>>> Not at the cost of clarity elsewhere!
>>>
>>> To be clear now you oppose intel_vtd_active taking struct device? I
>>> thought you expressed general agreement when I presented the idea in the
>>> previous thread.
>>>
>>> I don't mind hugely to go either way, but I also don't see how taking
>>> struct device makes anything unclear. (I only think
>>> intel_vtd_run_as_guest is really wrong in this story but that's old news.)
>>>
>>> And if I make it take i915 then I would want to name it i915_vtd_active
>>> as well. But then you wouldn't like that.
>>>
>>> Should we just stuff all this into i915_utils for now, as I think Lucas
>>> suggested? Static inline or not, I don't care.
>> 
>> Just general grumpiness.
>> 
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>
> No worries. Ack is for this version or with i915_ prefixes in 
> i915_utils.h/c?

Both. Either. ;)

>
> Regards,
>
> Tvrtko

-- 
Jani Nikula, Intel Open Source Graphics Center
