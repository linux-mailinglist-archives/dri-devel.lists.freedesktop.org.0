Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9693C4C4C31
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12E810E234;
	Fri, 25 Feb 2022 17:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29810E233;
 Fri, 25 Feb 2022 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645810394; x=1677346394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/1j55f8ICizY4KebmP11A2FKb4smHT5YtuC4rCmbrog=;
 b=kIAAgBEjvcU86lX1wNdM3CYj8qu8wN92+cLPOD8oEfn9lUHvNbB57ZcA
 /cHjzck9VVoDSxZyZnBTUsjy4Vh5HATLYo13e834PRYkBLmtMqdZIbLSy
 LJAERl3i9Kk/5Ytme9XdwGTmSMqChms64mqNkP6BCy85oSRJKHU8Hc2T6
 BAlH6l1+ezHDblGJmRXgvwNzGdLRxzjXvnNzoeD8lRkk1P0oGxVl6KCZI
 tgwkmk0I9gPyOlgaoCCAQbsMnX1Yxb+8o9cEMVFI6LR/RWBO924hGjfU2
 Vs1vWEXdXjwAimbc80opFswkHsu1BqTuvb8l03Y4FQWsMRT3jJeJibgpR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252739037"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252739037"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:33:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549346274"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO [10.213.234.117])
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:33:11 -0800
Message-ID: <0b9dd25f-63ea-9121-6326-14087f5f8e63@linux.intel.com>
Date: Fri, 25 Feb 2022 17:33:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <011a236d-7ed4-0d48-e8a6-c9bd98740d5b@linux.intel.com>
 <718c6339-4a19-0de0-2666-a32be7c56dd7@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <718c6339-4a19-0de0-2666-a32be7c56dd7@intel.com>
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/02/2022 16:52, Michael Cheng wrote:
> Hi Tvrtko,
> 
> It seems without cacheflush.h being included, when I build for arm64 or 
> x86, it stills pulls in cacheflush.h:
> 
> ./.drm_cache.o.cmd:838: include/linux/cacheflush.h \
> ./.drm_cache.o.cmd:839: arch/x86/include/asm/cacheflush.h \
> ./.drm_cache.o.cmd:920: include/asm-generic/cacheflush.h \
> ./.drm_cache.o.cmd:830: include/linux/cacheflush.h \
> ./.drm_cache.o.cmd:831: arch/arm64/include/asm/cacheflush.h \
> ./.drm_cache.o.cmd:1085: include/asm-generic/cacheflush.h \
> So it seems without including it, cacheflush.h stills get pulled in,
> I think its because its a required kernel source to build the kernel
> per specific architecture, but please correct if I am wrong,as I am still
> trying to understand how things works!

Probably:

drm_cache.c:

#include <linux/highmem.h>

linux/highmem.h:

#include <linux/cacheflush.h>

But it is more correct to explicitly include what you use. So if 
drm_cache.c uses stuff declared in cacheflush.h, it should include it.

Regards,

Tvrtko

> Michael Cheng
> On 2022-02-25 8:28 a.m., Tvrtko Ursulin wrote:
>>
>> On 25/02/2022 03:24, Michael Cheng wrote:
>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>>> performs a flush by first performing a clean, follow by an invalidation
>>> operation.
>>>
>>> v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
>>>             dcache. Thanks Tvrtko for the suggestion.
>>>
>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>>
>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
>>>             symbol that could be use by other modules, thus use
>>>             caches_clean_inval_pou instead. Also this version
>>>                 removes include for cacheflush, since its already
>>>             included base on architecture type.
>>
>> What does it mean that it is included based on architecture type? Some 
>> of the other header already pulls it in?
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>>> index c3e6e615bf09..81c28714f930 100644
>>> --- a/drivers/gpu/drm/drm_cache.c
>>> +++ b/drivers/gpu/drm/drm_cache.c
>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned long 
>>> length)
>>>         if (wbinvd_on_all_cpus())
>>>           pr_err("Timed out waiting for cache flush\n");
>>> +
>>> +#elif defined(CONFIG_ARM64)
>>> +    void *end = addr + length;
>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
>>> +
>>>   #else
>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>   #endif
