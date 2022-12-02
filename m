Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12126406F2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363F710E188;
	Fri,  2 Dec 2022 12:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744A10E6E3;
 Fri,  2 Dec 2022 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669984716; x=1701520716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9YP/9ZcHz3tEC4PSjp6JBrVKRvDaVTB1z5m2auiLJlM=;
 b=M4Qw3XO32hlp2S1ebZt15uCdcuSUvyizNziJGtcrKlLUjldGYNshqZdO
 BVNAMG13GFn1vfPQJ3mF+4OljsR5gkY1a5A00zzxtoXEfwikG84jYX/y8
 AGCpd/8Q2kJ5wuP7QVop/Nkv8YJ+XsBA7Y/pMayyOo3EY4l3s5enw2Pmf
 ujXF62FdlgobRVrtPbkftXdlLVO33VqsB3y8AHXroqUF/4zRutSxTTAnU
 bSY5NxIeBHU0vanqEcNFqvXz9j0vVT4oqlF2oE3C3dirNQNcYwf713uMC
 lH807N9rz84UeyMz3J86rPp3NW86N0FSYh5hXy7Ju9Gci0rtj+PtKmnKL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="296299292"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="296299292"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 04:38:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="647155619"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="647155619"
Received: from macematx-mobl1.ger.corp.intel.com (HELO [10.213.211.34])
 ([10.213.211.34])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 04:38:34 -0800
Message-ID: <170ec9a0-10e2-9413-31de-7694854e903f@linux.intel.com>
Date: Fri, 2 Dec 2022 12:38:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v6 3/5] drm/i915: Introduce guard pages to
 i915_vma
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20221201144446.333776-1-andi.shyti@linux.intel.com>
 <20221201203912.346110-1-andi.shyti@linux.intel.com>
 <8a8152b6-a7f9-7ecb-4e5b-2b961f8e3ee2@linux.intel.com>
 <Y4ndYv5C6K39C8PP@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y4ndYv5C6K39C8PP@ashyti-mobl2.lan>
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


On 02/12/2022 11:11, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Fri, Dec 02, 2022 at 10:20:11AM +0000, Tvrtko Ursulin wrote:
>>
>> On 01/12/2022 20:39, Andi Shyti wrote:
>>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>>
>>> Introduce the concept of padding the i915_vma with guard pages before
>>> and after. The major consequence is that all ordinary uses of i915_vma
>>> must use i915_vma_offset/i915_vma_size and not i915_vma.node.start/size
>>> directly, as the drm_mm_node will include the guard pages that surround
>>> our object.
>>>
>>> The biggest connundrum is how exactly to mix requesting a fixed address
>>> with guard pages, particularly through the existing uABI. The user does
>>> not know about guard pages, so such must be transparent to the user, and
>>> so the execobj.offset must be that of the object itself excluding the
>>> guard. So a PIN_OFFSET_FIXED must then be exclusive of the guard pages.
>>> The caveat is that some placements will be impossible with guard pages,
>>> as wrap arounds need to be avoided, and the vma itself will require a
>>> larger node. We must not report EINVAL but ENOSPC as these are unavailable
>>> locations within the GTT rather than conflicting user requirements.
>>>
>>> In the next patch, we start using guard pages for scanout objects. While
>>> these are limited to GGTT vma, on a few platforms these vma (or at least
>>> an alias of the vma) is shared with userspace, so we may leak the
>>> existence of such guards if we are not careful to ensure that the
>>> execobj.offset is transparent and excludes the guards. (On such platforms
>>> like ivb, without full-ppgtt, userspace has to use relocations so the
>>> presence of more untouchable regions within its GTT such be of no further
>>> issue.)
>>>
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>> Hi Tvrtko,
>>>
>>> I removed your r-b in this version because I restored the original value
>>> of the guard being aligned with the vma size alignment. Turns out that
>>> CI failed with the latest version because the guard was becoming too big
>>> (we would have hit the GEM_BUG_ON)[*].
>>>
>>> The reason why now the guard is aligned with the vma alignment is that
>>> the area is already aligned and if we use as a starting address start +
>>> guard, guard needs to be aligned, otherwise we screw up all the memory
>>> alignment.
>>>
>>> Let me know if it makes sense to you.
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Conditional to promise of a prioritised follow up improvement, if it turns
>> out GGTT wastage due a bit over zealous guard size comes to bite.
> 
> Sure! I'll be alert!
> 
> There are some unrelated failures from CI, just to be sure I sent
> last night a trybot run.

Trybot looked okay, and I just pressed re-test for the intel-gfx series 
so lets see that too.

Regards,

Tvrtko
