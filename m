Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15129689858
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83BF10E778;
	Fri,  3 Feb 2023 12:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3170C10E778;
 Fri,  3 Feb 2023 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675426376; x=1706962376;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DcPBEZDJLfCOM850kFlrZ3Xh9L60maLY9vxckHHKxs0=;
 b=LVblMFdKgfw2B7ozUuSiLQZaW/nUftehyiWP32KLZ7InBUlYBO0RhzZB
 Ipcato0l/7p9IzayzT71DSEzHX1sVf1iXcZeDiA6chberosXTdxqS6Ylq
 kkEMoYKzr7cd+i0HGacmTVRF8voRF9WqG0+3jwCT/HgLu5Gaqbb5AobL+
 puNaUgHfn7n9M69Nvs4JWNE+GxEIIBV9rBSYI6YC+Wf7CT3azslZGIstt
 2ePjI/P8S6FJXMpeND9Q8eJfR2xz1TQQunQQ5q9eypSER0WjIZaNqmh+w
 XRNSr+7vk1x4NMMHr0BY6ITf5iAbVtYcWTtr/B2fCofaRT0r23JvrgoXf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="309068034"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="309068034"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:12:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754473466"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="754473466"
Received: from oowomilo-mobl2.ger.corp.intel.com (HELO [10.252.3.13])
 ([10.252.3.13])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:12:54 -0800
Message-ID: <3ec9d7ba-889f-ac1b-fa00-57dac3840529@intel.com>
Date: Fri, 3 Feb 2023 12:12:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [Intel-gfx] [PATCH] Initialize the obj flags for shmem objects
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
 <30fec9fc-8d67-519e-b2e8-25af7187b3df@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <30fec9fc-8d67-519e-b2e8-25af7187b3df@linux.intel.com>
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

On 03/02/2023 12:10, Tvrtko Ursulin wrote:
> 
> 
> On 03/02/2023 11:57, Aravind Iddamsetty wrote:
>> Obj flags for shmem objects is not being set correctly.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Could even be:
> 
> Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on 
> acquire")
> Cc: <stable@vger.kernel.org> # v5.15+

Yup, that's what I also got.

> 
> ?
> 
> Regards,
> 
> Tvrtko
> 
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 114443096841..37d1efcd3ca6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -596,7 +596,7 @@ static int shmem_object_init(struct 
>> intel_memory_region *mem,
>>       mapping_set_gfp_mask(mapping, mask);
>>       GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>> -    i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
>> +    i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
>>       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>       obj->write_domain = I915_GEM_DOMAIN_CPU;
>>       obj->read_domains = I915_GEM_DOMAIN_CPU;
