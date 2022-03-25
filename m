Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154DC4E706A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 11:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FFF10EAA8;
	Fri, 25 Mar 2022 10:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29A910EAA4;
 Fri, 25 Mar 2022 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648202599; x=1679738599;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dpbzpa/19L0naiUTj2BYpxeEtTouXD3sUZAldnLmHgg=;
 b=F5HpQEA2O3Y4i8LQ0dvnOVIhvSbQ9bLb9VIFs+h7RTJAB7sRYm27So36
 CWlT5+gEM8IJGdB9I93C6Ro4AlGA40CEp5itwTUylKO8z6iwPUHGWQuHa
 xIJWnCjRktuukIJCzNMwBvlVygTHT4SGJpH++/3UGoGSY+zeWPK84MxtJ
 dH1YznbOqFc0uh7KQr4E5nnKtUUIKU/r3v6yIhC/OWrlyiqd3y2KOJxWv
 cYdPZfI1b2DpBNYSw4nwxKr7VGg3SQnGURYyOgTwe+m1xiw7vDn/gX+VI
 qRZiLkmTDW3qW8uV75N3V6pMsynBJJqOdeJmoZOrIw1Vc9gEw8nn5YFz6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258567249"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258567249"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 03:03:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="561774228"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.61.27])
 ([10.252.61.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 03:03:18 -0700
Message-ID: <57b94aee-49c9-9847-cf5f-75c5fdfa45be@linux.intel.com>
Date: Fri, 25 Mar 2022 11:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/i915/ttm: limit where we apply
 TTM_PL_FLAG_CONTIGUOUS
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220324172143.377104-1-matthew.auld@intel.com>
 <84deb237-3d0b-0c0e-21c8-25df59b9fc71@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <84deb237-3d0b-0c0e-21c8-25df59b9fc71@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/25/2022 8:16 AM, Thomas Hellström wrote:
>
> On 3/24/22 18:21, Matthew Auld wrote:
>> We only need this when allocating device local-memory, where this
>> influences the drm_buddy. Currently there is some funny behaviour where
>> an "in limbo" system memory object is lacking the relevant placement
>> flags etc. before we first allocate the ttm_tt, leading to ttm
>> performing a move when not needed, since the current placement is seen
>> as not compatible.
>>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Fixes: 2ed38cec5606 ("drm/i915: opportunistically apply 
>> ALLOC_CONTIGIOUS")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index e4a06fcf741a..97e648fa76bd 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -133,6 +133,9 @@ i915_ttm_place_from_region(const struct 
>> intel_memory_region *mr,
>>       memset(place, 0, sizeof(*place));
>>       place->mem_type = intel_region_to_ttm_type(mr);
>>   +    if (mr->type == INTEL_MEMORY_SYSTEM)
>> +        return;
>> +
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Nirmoy Das <nirmoy.das@amd.com>


>
>>       if (flags & I915_BO_ALLOC_CONTIGUOUS)
>>           place->flags |= TTM_PL_FLAG_CONTIGUOUS;
>>       if (offset != I915_BO_INVALID_OFFSET) {
