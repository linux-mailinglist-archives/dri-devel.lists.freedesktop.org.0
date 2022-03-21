Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93274E2501
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D175110E2D2;
	Mon, 21 Mar 2022 11:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796C510E291;
 Mon, 21 Mar 2022 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647860849; x=1679396849;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=asaezxPFoM6hbPV8et9bt4QZjyTkzaWp6xf0nVB9PHo=;
 b=bW6FKoDfojsO34WajeHATtiJilb4FcOSYrgYsY+h2HfhMwidIFz9afwm
 wY5UfEE2+aeDlEp04Biv5hnwiFG16D/UWPGQ5cItDcaj/C8jjchUsP1/N
 2R7j2h46hbTFmFxIGfFG//pD6fMItWt0/Z6iXFGcFWssU3vuSvnpkPyge
 5n3vREp7T54xS8Z+hjyg0YgGkYomhgXDE3Nd7x12JR2UVSQAmyJh/8TAp
 OAGHsgJsoN3hVz2tKF9sP5tUFoeEZbXY9zCa7kWKJ+2hENqI9HzKVJLN7
 oPWtSXp0HZjXbDDiJCtg7DdB/A7zauBeda4e0IDNexh8+aZFpN6f172h8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257472916"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257472916"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 04:07:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="824357016"
Received: from evinintel.ger.corp.intel.com (HELO [10.249.254.209])
 ([10.249.254.209])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 04:07:25 -0700
Message-ID: <b986f2a7-c0d3-b145-dd45-54d25e10a8be@linux.intel.com>
Date: Mon, 21 Mar 2022 12:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/21/22 11:30, Tvrtko Ursulin wrote:
>
> On 19/03/2022 19:42, Michael Cheng wrote:
>> Previous concern with using drm_clflush_sg was that we don't know 
>> what the
>> sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>> everything at once to avoid paranoia.
>
> And now we know, or we know it is not a concern?
>
>> To make i915 more architecture-neutral and be less paranoid, lets 
>> attempt to
>
> "Lets attempt" as we don't know if this will work and/or what can/will 
> break?
>
>> use drm_clflush_sg to flush the pages for when the GPU wants to read
>> from main memory.
>>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index f5062d0c6333..b0a5baaebc43 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/highmem.h>
>>   #include <linux/dma-resv.h>
>>   #include <linux/module.h>
>> +#include <drm/drm_cache.h>
>>     #include <asm/smp.h>
>>   @@ -250,16 +251,10 @@ static int 
>> i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>>        * DG1 is special here since it still snoops transactions even 
>> with
>>        * CACHE_NONE. This is not the case with other HAS_SNOOP 
>> platforms. We
>>        * might need to revisit this as we add new discrete platforms.
>> -     *
>> -     * XXX: Consider doing a vmap flush or something, where possible.
>> -     * Currently we just do a heavy handed wbinvd_on_all_cpus() here 
>> since
>> -     * the underlying sg_table might not even point to struct pages, 
>> so we
>> -     * can't just call drm_clflush_sg or similar, like we do 
>> elsewhere in
>> -     * the driver.
>>        */
>>       if (i915_gem_object_can_bypass_llc(obj) ||
>>           (!HAS_LLC(i915) && !IS_DG1(i915)))
>> -        wbinvd_on_all_cpus();
>> +        drm_clflush_sg(pages);
>
> And as noticed before, drm_clfush_sg still can call wbinvd_on_all_cpus 
> so are you just punting the issue somewhere else? How will it be 
> solved there?

I think in this case, drm_clflush_sg() can't be immediately used, 
because pages may not contain actual page pointers; might be just the 
dma address. It needs to be preceded with a dmabuf vmap.

But otherwise this change, I figure, falls into the "prefer range-aware 
apis" category; If the CPU supports it, flush the range only, otherwise 
fall back to wbinvd().

/Thomas



>
> Regards,
>
> Tvrtko
>
>>         sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
>>       __i915_gem_object_set_pages(obj, pages, sg_page_sizes);
