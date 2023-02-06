Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B968BA42
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC90B10E368;
	Mon,  6 Feb 2023 10:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EF510E366;
 Mon,  6 Feb 2023 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675679600; x=1707215600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QuGXFzog/2TLYOIOh3hII8O6V1snANioCocHfYn8yws=;
 b=bQyWyulOhyYCetzlkgjc+bj83lYq5tGaRlNINcNQK0eTlNj5wyOzsFGM
 Hl/DcrC57xT00a02lCkpFs0rUBXdbs8gdTqGetIhs2oNh7THCkfwOmh6I
 MwaJody7AHe953tZlI48cpYW+SbqTuLD1BFLpPrdM1uNtMBALP7wYw9WD
 c5dyFa7gASVsAq1B9lSpWcZcy+4by7svXkaDAA+w5cKCU2rKi4S1TJ2+U
 Wfw4AnimuWogxHvwjJI7UJygtt7cu8MGRTAbVT8hKvTyh/KtNP6cAm8MZ
 z3KkThyKNcPzP3Ku6EggWLr2BT/4pfWHRF+ubRms0+FIoAeF6ntDVpm5c Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308818086"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="308818086"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 02:33:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790393723"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="790393723"
Received: from abotsiev-mobl.ger.corp.intel.com (HELO [10.252.3.115])
 ([10.252.3.115])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 02:33:16 -0800
Message-ID: <aa8af778-2a40-7fe0-eb14-234469c74523@intel.com>
Date: Mon, 6 Feb 2023 10:33:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/i915/gt: Avoid redundant pointer validity check
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Deepak R Varma <drv@mailo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
References: <Y91g081OauhQNxMe@ubun2204.myguest.virtualbox.org>
 <d58fff32-edad-4a7f-7409-7e57593df3ed@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d58fff32-edad-4a7f-7409-7e57593df3ed@linux.intel.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 09:45, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> Adding Matt & Thomas as potential candidates to review.
> 
> Regards,
> 
> Tvrtko
> 
> On 03/02/2023 19:30, Deepak R Varma wrote:
>> The macro definition of gen6_for_all_pdes() expands to a for loop such
>> that it breaks when the page table is null. Hence there is no need to
>> again test validity of the page table entry pointers in the pde list.
>> This change is identified using itnull.cocci semantic patch.
>>
>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>> ---
>> Please note: Proposed change is compile tested only.
>>
>>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c 
>> b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> index 5aaacc53fa4c..787b9e6d9f59 100644
>> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> @@ -258,8 +258,7 @@ static void gen6_ppgtt_free_pd(struct gen6_ppgtt 
>> *ppgtt)
>>       u32 pde;
>>       gen6_for_all_pdes(pt, pd, pde)
>> -        if (pt)
>> -            free_pt(&ppgtt->base.vm, pt);
>> +        free_pt(&ppgtt->base.vm, pt);
>>   }
>>   static void gen6_ppgtt_cleanup(struct i915_address_space *vm)
>> @@ -304,7 +303,7 @@ static void pd_vma_unbind(struct 
>> i915_address_space *vm,
>>       /* Free all no longer used page tables */
>>       gen6_for_all_pdes(pt, ppgtt->base.pd, pde) {
>> -        if (!pt || atomic_read(&pt->used))
>> +        if (atomic_read(&pt->used))

Wow, I was really confused trying to remember how this all works.

The gen6_for_all_pdes() does:

(pt = i915_pt_entry(pd, iter), true)

So NULL pt is expected, and does not 'break' here, since 'true' is 
always the value that decides whether to terminate the loop. So this 
patch would lead to NULL ptr deref, AFAICT.



>>               continue;
>>           free_pt(&ppgtt->base.vm, pt);
