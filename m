Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6F4EA1ED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A121210E174;
	Mon, 28 Mar 2022 20:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED910E174;
 Mon, 28 Mar 2022 20:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648500514; x=1680036514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qCJgaTlyrt3M+xKRLGpGWa4AyTdCdNO9uSOPspAIs9Q=;
 b=AuSiBj7wLWTxrMcX3vWeOUnOweqjB79pjPVOtQ4uAKzCUS6xdNUjQ2fd
 ugLAi2NTOiwVzLB9txdkTB6hMcrhPQYVAbZwdYX2SfjOvyj4UOxhHYq4G
 5Md4Q41dtQJYqa2KeHTQFjfkO9m0v3pfoUA6aBIqf/KehKkDG6LIMJP0w
 yfhzqXCvXyNuY3q/A+Gy7IEMkal4Fbs+Z/pmKdF9gTFxqb320jPehAEgU
 LPCjObZrjZ4+SuW7onsvBc041021LUoutT6L2PkFzPT+GYs0iqKSF935e
 xC9U6plC8nOXSpeJTS4/eWsy9he6nXaIdpGIWneOC2WaMjwHjk3dvJE/r g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="319800542"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="319800542"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 13:48:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="502652598"
Received: from vrgangil-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.58.226])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 13:48:33 -0700
Date: Mon, 28 Mar 2022 13:48:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC] drm/i915: Split out intel_vtd_active and run_as_guest to
 own header
Message-ID: <20220328204833.k5dug4wus62rdxdo@ldmartin-desk2>
References: <20220322164446.2124983-1-tvrtko.ursulin@linux.intel.com>
 <878rszitmi.fsf@intel.com>
 <0078dd11-c958-7a60-19d1-e32446f0d9da@linux.intel.com>
 <87r16rh8b2.fsf@intel.com>
 <2a91ffe1-71a2-98a0-daa3-23aee0b1c29d@linux.intel.com>
 <87o81vgouz.fsf@intel.com>
 <a08030e9-d352-1599-68ca-36605cadac1b@linux.intel.com>
 <87fsn6grnm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87fsn6grnm.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 02:09:33PM +0200, Jani Nikula wrote:
>On Fri, 25 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> On 24/03/2022 18:57, Jani Nikula wrote:
>>> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 24/03/2022 11:57, Jani Nikula wrote:
>>>>> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>> On 24/03/2022 09:31, Jani Nikula wrote:
>>>>>>> On Tue, 22 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>
>>>>>>>> ...
>>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>> ---
>>>>>>>> Typed up how I see it - bash away.
>>>>>>>
>>>>>>> So is intel_vtd_active() so performance critical that it needs to be
>>>>>>> inline?
>>>>>>>
>>>>>>> We're passing struct drm_i915_private * everywhere we can, and it just
>>>>>>> feels silly to use struct drm_device * to avoid the include.
>>>>>>>
>>>>>>> Static inlines considered harmful. :p
>>>>>>
>>>>>> Same as it is ;), and gee, who was it that he said he was just trying to
>>>>>> declutter i915_drv.h.. ;p
>>>>>
>>>>> Not at the cost of clarity elsewhere!
>>>>
>>>> To be clear now you oppose intel_vtd_active taking struct device? I
>>>> thought you expressed general agreement when I presented the idea in the
>>>> previous thread.
>>>>
>>>> I don't mind hugely to go either way, but I also don't see how taking
>>>> struct device makes anything unclear. (I only think
>>>> intel_vtd_run_as_guest is really wrong in this story but that's old news.)
>>>>
>>>> And if I make it take i915 then I would want to name it i915_vtd_active
>>>> as well. But then you wouldn't like that.
>>>>
>>>> Should we just stuff all this into i915_utils for now, as I think Lucas
>>>> suggested? Static inline or not, I don't care.
>>>
>>> Just general grumpiness.
>>>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>
>> No worries. Ack is for this version or with i915_ prefixes in
>> i915_utils.h/c?
>
>Both. Either. ;)

great, let's go with the one adding it to i915_util.h/c then.

thanks
Lucas De Marchi

>
>>
>> Regards,
>>
>> Tvrtko
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
