Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4094CFB23
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 11:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8754110F37D;
	Mon,  7 Mar 2022 10:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B649510F37D;
 Mon,  7 Mar 2022 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646649159; x=1678185159;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=madTlTD3EaHL4FiSZYAPU7ws9xLb4mftuls5lT0bPaw=;
 b=lGqFuhxq0EgsKzc88+J8kBVZyYPkd/OnQCNzupuUfvk6sm0jOjGefL4P
 NSg6A62mvVhcONJ+/gmTlr7gJpup906jdIzsV1/c3Vy90uXWU7J+dqfVq
 mAnWlkXfRtjkUJBRssfVdVY7hq9S0EjPj8yRFyfa9/hq+LRc48xVs3mOy
 n8ycqEiTpnlTTtfk4dcb9YjaMhRpmGRUEH6iEU96Im7XSmBmi51Ri659x
 eURphFY3701eAGme2lZAtcE14GvIh885XeMhR/gSngVhQEYksC5lLlvJ7
 gsQLGiQ0jxC2Ul+OW/CLPK8ZVrS9clSjpHy2q/5BiZMfImq19msWLDg+p Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="340791172"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="340791172"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 02:32:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="780279719"
Received: from aaronmux-mobl.ger.corp.intel.com (HELO [10.252.2.25])
 ([10.252.2.25])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 02:32:38 -0800
Message-ID: <ebfc9db8-e7b3-bb01-e96e-0b37f047bcd2@intel.com>
Date: Mon, 7 Mar 2022 10:32:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/8] drm/i915: fixup the initial fb base on DG1
Content-Language: en-GB
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
 <20220304172333.991778-8-matthew.auld@intel.com> <YiJpkwFRUHIAoh0F@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <YiJpkwFRUHIAoh0F@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2022 19:33, Ville Syrjälä wrote:
> On Fri, Mar 04, 2022 at 05:23:32PM +0000, Matthew Auld wrote:
>> The offset we get looks to be the exact start of DSM, but the
>> inital_plane_vma expects the address to be relative.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   .../drm/i915/display/intel_plane_initial.c    | 22 +++++++++++++++----
>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>> index f797fcef18fc..b39d3a8dfe45 100644
>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>> @@ -56,10 +56,24 @@ initial_plane_vma(struct drm_i915_private *i915,
>>   	if (!mem || plane_config->size == 0)
>>   		return NULL;
>>   
>> -	base = round_down(plane_config->base,
>> -			  I915_GTT_MIN_ALIGNMENT);
>> -	size = round_up(plane_config->base + plane_config->size,
>> -			mem->min_page_size);
>> +	base = plane_config->base;
>> +	if (IS_DGFX(i915)) {
>> +		/*
>> +		 * On discrete the base address should be somewhere in LMEM, but
>> +		 * depending on the size of LMEM the base address might
>> +		 * intersect with the start of DSM, like on DG1, in which case
>> +		 * we need the relative address. In such cases we might also
>> +		 * need to choose between inital fb vs fbc, if space is limited.
>> +		 *
>> +		 * On future discrete HW, like DG2, we should be able to just
>> +		 * allocate directly from LMEM, due to larger LMEM size.
>> +		 */
>> +		if (base >= i915->dsm.start)
>> +			base -= i915->dsm.start;
> 
> Subsequent code expects the object to actually be inside stolen.
> If that is not the case we should just give up.

Thanks for taking a look at this. Is that subsequent code outside 
initial_plane_vma()? In the next patch this is now using LMEM directly 
for dg2. Would that blow up somewhere else?

> 
> The fact that we fail to confirm any of that on integrated
> parts has always bugged me, but not enough to actually do
> anything about it. Such a check would be somewhat more involved
> since we'd have to look at the PTEs. But on discrete sounds like
> we can get away with a trivial check.

Which PTEs? Is this for the below GGTT bind? I would have assumed that 
the create_at/for_preallocated would simply refuse to allocate the pages 
if the requested range is outside the regions usable range? Or maybe 
there is more going on behind the scenes here?

> 
>> +	}
>> +
>> +	size = roundup(base + plane_config->size, mem->min_page_size);
>> +	base = round_down(base, I915_GTT_MIN_ALIGNMENT);
>>   	size -= base;
>>   
>>   	/*
>> -- 
>> 2.34.1
> 
