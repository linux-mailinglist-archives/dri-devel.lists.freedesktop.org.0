Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C936E4E2F10
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5896889FF9;
	Mon, 21 Mar 2022 17:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166410E38E;
 Mon, 21 Mar 2022 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647883754; x=1679419754;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4omy2zLjp56BSzPaHL20plTTQCZtBt5X/9EB2seiPmM=;
 b=mI/jRbIv+ubXtvKnTTPN6v391oZDGJIcQ1RnzhfgO3v1oVQwpVC5BW5f
 0i6ocO9fW/eq6qTPPBphRNzPhTgVouB6qvPOI/7hNal1Yv91DiPCZLNIU
 4fK73/X4oYfO0lqkqFiAbtNOXbtBQTI7VGeW/fukM8MZnaYhXNaaI3kHA
 bkeIvfIBvRbj80AgCfBMOxpvSCcf6ZFJeudU4IJDGPjeGsovy9UsS+pPl
 jCAwLIa5TGuV9vXD1eAcUrp2YAvFmD3cpTJXhQ5KPEV8wXK/HBuoB9L64
 37WJJ2Xxu3jhHjMnjUB2WQ1NalfVZYRNr3Py67UJOGjLLw9tQWo0ETfCB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237550869"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="237550869"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:28:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="559966598"
Received: from atnordon-mobl1.ger.corp.intel.com (HELO [10.213.230.67])
 ([10.213.230.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:28:50 -0700
Message-ID: <9ee954d2-4a5e-ff11-0061-b518e00e952a@linux.intel.com>
Date: Mon, 21 Mar 2022 17:28:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
 <05e56e59-81ed-0b99-6c3d-7f9f413ecd4a@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <05e56e59-81ed-0b99-6c3d-7f9f413ecd4a@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, wayne.boyer@intel.com,
 daniel.vetter@ffwll.ch, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/03/2022 16:31, Michael Cheng wrote:
> On 2022-03-21 3:30 a.m., Tvrtko Ursulin wrote:
> 
>>
>> On 19/03/2022 19:42, Michael Cheng wrote:
>>> Previous concern with using drm_clflush_sg was that we don't know 
>>> what the
>>> sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>>> everything at once to avoid paranoia.
>>
>> And now we know, or we know it is not a concern?
>>
>>> To make i915 more architecture-neutral and be less paranoid, lets 
>>> attempt to
>>
>> "Lets attempt" as we don't know if this will work and/or what can/will 
>> break?
> 
> Yes, but it seems like there's no regression with IGT .
> 
> If there's a big hit in performance, or if this solution gets accepted 
> and the bug reports come flying in, we can explore other solutions. But 
> speaking to Dan Vetter, ideal solution would be to avoid any calls 
> directly to wbinvd, and use drm helpers in place.
> 
> +Daniel for any extra input.
> 
>>> use drm_clflush_sg to flush the pages for when the GPU wants to read
>>> from main memory.
>>>
>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
>>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> index f5062d0c6333..b0a5baaebc43 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> @@ -8,6 +8,7 @@
>>>   #include <linux/highmem.h>
>>>   #include <linux/dma-resv.h>
>>>   #include <linux/module.h>
>>> +#include <drm/drm_cache.h>
>>>     #include <asm/smp.h>
>>>   @@ -250,16 +251,10 @@ static int 
>>> i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>>>        * DG1 is special here since it still snoops transactions even 
>>> with
>>>        * CACHE_NONE. This is not the case with other HAS_SNOOP 
>>> platforms. We
>>>        * might need to revisit this as we add new discrete platforms.
>>> -     *
>>> -     * XXX: Consider doing a vmap flush or something, where possible.
>>> -     * Currently we just do a heavy handed wbinvd_on_all_cpus() here 
>>> since
>>> -     * the underlying sg_table might not even point to struct pages, 
>>> so we
>>> -     * can't just call drm_clflush_sg or similar, like we do 
>>> elsewhere in
>>> -     * the driver.
>>>        */
>>>       if (i915_gem_object_can_bypass_llc(obj) ||
>>>           (!HAS_LLC(i915) && !IS_DG1(i915)))
>>> -        wbinvd_on_all_cpus();
>>> +        drm_clflush_sg(pages);
>>
>> And as noticed before, drm_clfush_sg still can call wbinvd_on_all_cpus 
>> so are you just punting the issue somewhere else? How will it be 
>> solved there?
>>
> Instead of calling an x86 asm directly, we are using what's available to 
> use to make the driver more architecture neutral. Agreeing with Thomas, 
> this solution falls within the "prefer range-aware clflush apis", and 
> since some other generation platform doesn't support clflushopt, it will 
> fall back to using wbinvd.

Right, I was trying to get the information on what will drm_clflush_sg 
do on Arm. Is it range based or global there, or if the latter exists.

Regards,

Tvrtko
