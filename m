Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4FA63EE6C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566B610E5B1;
	Thu,  1 Dec 2022 10:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112B910E11B;
 Thu,  1 Dec 2022 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669891864; x=1701427864;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xLbECqXIZ+mK3qqQGPpbzqUZUZSeqFLDnc1BZ3HNlOk=;
 b=KR+Amw3zZnczkksWD/qteUEl8RtuEy86+TpYJ66nFpLIknmzI0ZoxF6K
 YOeWx3yeNrJnvqbERc+1yfQLRi7tq6gpIxX881CIfb6G/Y8OYK/1QJzux
 Dh10q6TyWuC/kYytmK9xy76Zw8/DZbZEYmBSWFTKYfZpzqhi09j2/sn58
 /U4C1N9xugWjul+pel4e1ftpWh/ts0EJCJZf72gEFmDPV07xqvmsTrLbq
 hPTLxjke9lEffDhqrrTlCjrA4HIK4+ngh8A5Dm2HKA+GlhkrmN9dwgSlD
 nHjkQejWNejx4T0NN59Was3zksgC6+lkEQqwc/uy+Pr5Z4MW96s0Yz/uX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314349664"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="314349664"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 02:51:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="973475886"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="973475886"
Received: from aguefor-mobl.ger.corp.intel.com (HELO [10.213.229.22])
 ([10.213.229.22])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 02:51:00 -0800
Message-ID: <15153e25-c104-003c-0bdc-47581a162c93@linux.intel.com>
Date: Thu, 1 Dec 2022 10:50:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v4 3/5] drm/i915: Introduce guard pages to
 i915_vma
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20221130235805.221010-1-andi.shyti@linux.intel.com>
 <20221130235805.221010-4-andi.shyti@linux.intel.com>
 <4f73fed7-9333-6450-e389-fd2b64a8f0e7@linux.intel.com>
 <Y4iFuizKSmS2YURK@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y4iFuizKSmS2YURK@ashyti-mobl2.lan>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/12/2022 10:45, Andi Shyti wrote:
> Hi Tvrtko,
> 
> [...]
> 
>>> @@ -768,8 +773,17 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>    	GEM_BUG_ON(!IS_ALIGNED(alignment, I915_GTT_MIN_ALIGNMENT));
>>>    	GEM_BUG_ON(!is_power_of_2(alignment));
>>> +	guard = vma->guard; /* retain guard across rebinds */
>>> +	if (flags & PIN_OFFSET_GUARD) {
>>> +		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));
>>> +		guard = max_t(u32, guard, flags & PIN_OFFSET_MASK);
>>> +	}
>>> +	roundup(guard, BIT(vma->vm->scratch_order + PAGE_SHIFT));
>>
>> roundup = ?
> 
> ehehe... yes, please ignore, that's some copy/paste error during
> the rebase...
> 
>> Lets have a comment here as well.
>>
>> /*
>>   * Be efficient with PTE use by using the native size for the guard.
>>   */
>>
>> Would that be accurate?
> 
> and I also forgot the update of my previous comment... yours is
> quite accurate.
> 
>>> +
>>>    	start = flags & PIN_OFFSET_BIAS ? flags & PIN_OFFSET_MASK : 0;
>>>    	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE));
>>> +	/* We need to be sure we do not ecceed the va area */
>>> +	GEM_BUG_ON(2 * guard > end);
>>
>> "exceed" but haven't we said this is not needed?
> 
> I wrote it in the cover letter. I had an offline chat with Chris
> and he was keen to have this check not only for overflow
> protection but also for a documentation purpose so that the
> reader knows better about the size and usage of the guard.
> 
> Does it make sense?

Not to me really, I have no idea how could anyone ever end up with guard 
size of half+ of GGTT. And the total 2 * guard + size is checked and 
rejected already. So I have no idea what it is supposed to be 
documenting. GEM_BUG_ON suggests really bad things would happen if that 
was passed in, like something would be incorrectly calculated. If that 
is not the case and things would just safely fail then it is just 
confusing to have it.

Regards,

Tvrtko
