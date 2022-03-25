Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD54E6F92
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 09:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6163210E247;
	Fri, 25 Mar 2022 08:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94D310E247;
 Fri, 25 Mar 2022 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648198039; x=1679734039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9CwTtiXaoVgYBa5LU2nnCfP7OxZ1TbYNsJbLV0tf9ao=;
 b=gYomem7lid/XzgqrPE+nUs8zDxHTV/7NfjNRL4ij+SpNzh7JVSvOXn3n
 f9EEeVWlOi1WnyNNGhyqUjQsLmXzKCIADywBRvE9gEs2B4/JW7F82bzCQ
 Z5sievESQPAT/jFZYVjOH5KrB/NgfPLG1ceHd0jl6hhkfZMfeW7VIZBbw
 EwkNt6Pj25657AI//BhNUrPGwx7ZhKjm/yKpxbMJvf/8LJ31X5XPwIY0Q
 aU9H7MOHltgyk/bIjmIn/vonsqYLBKg+FJmMdUqNBl7wjiu2Z4fcwrXO1
 Of6dP7QxlRfHrZHPQm+e10YzmS5U7+6lSHbLdPBMxgDh8Rm4sDf0yGmnn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258782831"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258782831"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 01:47:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="561754417"
Received: from cfmcclea-mobl.ger.corp.intel.com (HELO [10.213.232.142])
 ([10.213.232.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 01:47:17 -0700
Message-ID: <a08030e9-d352-1599-68ca-36605cadac1b@linux.intel.com>
Date: Fri, 25 Mar 2022 08:47:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC] drm/i915: Split out intel_vtd_active and run_as_guest to
 own header
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org
References: <20220322164446.2124983-1-tvrtko.ursulin@linux.intel.com>
 <878rszitmi.fsf@intel.com>
 <0078dd11-c958-7a60-19d1-e32446f0d9da@linux.intel.com>
 <87r16rh8b2.fsf@intel.com>
 <2a91ffe1-71a2-98a0-daa3-23aee0b1c29d@linux.intel.com>
 <87o81vgouz.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87o81vgouz.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/03/2022 18:57, Jani Nikula wrote:
> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> On 24/03/2022 11:57, Jani Nikula wrote:
>>> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 24/03/2022 09:31, Jani Nikula wrote:
>>>>> On Tue, 22 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>
>>>>>> ...
>>>>>>
>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> ---
>>>>>> Typed up how I see it - bash away.
>>>>>
>>>>> So is intel_vtd_active() so performance critical that it needs to be
>>>>> inline?
>>>>>
>>>>> We're passing struct drm_i915_private * everywhere we can, and it just
>>>>> feels silly to use struct drm_device * to avoid the include.
>>>>>
>>>>> Static inlines considered harmful. :p
>>>>
>>>> Same as it is ;), and gee, who was it that he said he was just trying to
>>>> declutter i915_drv.h.. ;p
>>>
>>> Not at the cost of clarity elsewhere!
>>
>> To be clear now you oppose intel_vtd_active taking struct device? I
>> thought you expressed general agreement when I presented the idea in the
>> previous thread.
>>
>> I don't mind hugely to go either way, but I also don't see how taking
>> struct device makes anything unclear. (I only think
>> intel_vtd_run_as_guest is really wrong in this story but that's old news.)
>>
>> And if I make it take i915 then I would want to name it i915_vtd_active
>> as well. But then you wouldn't like that.
>>
>> Should we just stuff all this into i915_utils for now, as I think Lucas
>> suggested? Static inline or not, I don't care.
> 
> Just general grumpiness.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

No worries. Ack is for this version or with i915_ prefixes in 
i915_utils.h/c?

Regards,

Tvrtko
