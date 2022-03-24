Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F64E68F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 19:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB6D10E5CE;
	Thu, 24 Mar 2022 18:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0C10E5CE;
 Thu, 24 Mar 2022 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648148265; x=1679684265;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KAuqPCtJbTMyj3jXLu6C4VXyJQsys0tHs49HFanXIxw=;
 b=mipa1V1k6B4vdgOlI5QTINiImdvXbgf9pEh/+HbnCvfl8mM1IcIBK5fg
 3Uda0WUoo7GlKKr265dmghvbBYx7hb5DO8gkfMqZMsRaTILN8Ct9mLiwA
 Nva+nsjxAjyi16ZeRX7u8Ajs93knjBHplS5T/qdKcbUnoc1xTmo/f4uBU
 i08F24WnA/nINcY363mjgmhEVB2PiHinZRwNpbf9lIP+Mi6bDk/sV8ZT5
 ujxKBfDRvfBgQacU6imk2+G4mYtshiBKI10DQ7l0APBfjWivIM/+1kju4
 LR1aCyZdYp12/7qb/0eDG2TvGlAvH9VYK2vdrUBGsO0qD7n+sICkog96T g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="245938716"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; d="scan'208";a="245938716"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 11:57:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; d="scan'208";a="561505920"
Received: from cnalawad-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.131])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 11:57:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [RFC] drm/i915: Split out intel_vtd_active and run_as_guest to
 own header
In-Reply-To: <2a91ffe1-71a2-98a0-daa3-23aee0b1c29d@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322164446.2124983-1-tvrtko.ursulin@linux.intel.com>
 <878rszitmi.fsf@intel.com>
 <0078dd11-c958-7a60-19d1-e32446f0d9da@linux.intel.com>
 <87r16rh8b2.fsf@intel.com>
 <2a91ffe1-71a2-98a0-daa3-23aee0b1c29d@linux.intel.com>
Date: Thu, 24 Mar 2022 20:57:40 +0200
Message-ID: <87o81vgouz.fsf@intel.com>
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

On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 24/03/2022 11:57, Jani Nikula wrote:
>> On Thu, 24 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>> On 24/03/2022 09:31, Jani Nikula wrote:
>>>> On Tue, 22 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> ...
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>> Typed up how I see it - bash away.
>>>>
>>>> So is intel_vtd_active() so performance critical that it needs to be
>>>> inline?
>>>>
>>>> We're passing struct drm_i915_private * everywhere we can, and it just
>>>> feels silly to use struct drm_device * to avoid the include.
>>>>
>>>> Static inlines considered harmful. :p
>>>
>>> Same as it is ;), and gee, who was it that he said he was just trying to
>>> declutter i915_drv.h.. ;p
>> 
>> Not at the cost of clarity elsewhere!
>
> To be clear now you oppose intel_vtd_active taking struct device? I 
> thought you expressed general agreement when I presented the idea in the 
> previous thread.
>
> I don't mind hugely to go either way, but I also don't see how taking 
> struct device makes anything unclear. (I only think 
> intel_vtd_run_as_guest is really wrong in this story but that's old news.)
>
> And if I make it take i915 then I would want to name it i915_vtd_active 
> as well. But then you wouldn't like that.
>
> Should we just stuff all this into i915_utils for now, as I think Lucas 
> suggested? Static inline or not, I don't care.

Just general grumpiness.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Regards,
>
> Tvrtko

-- 
Jani Nikula, Intel Open Source Graphics Center
