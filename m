Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB844F9079
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3B89C9C;
	Fri,  8 Apr 2022 08:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7D10EFA1;
 Fri,  8 Apr 2022 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649405594; x=1680941594;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oI/LDnXxFQTsHaE8GxDNgLxFUN8kR1r6ELN1nlmOiek=;
 b=QTR9fttDT3JCNkMpMjJ07fadYpxjzzR+OeM8VBc48n2jMVbCT7JXccPe
 4ifkRiF8ITqDJ+TfpR2vDCXj7i7LW/sN67GyfRMNetw49Q1+bgRXmg2Uj
 YVHfK5QpdOnTos6BySc/7YJuQt20jduHNa2F9RWOP9O+JeA+Hqc/T96Iq
 Nj1xGx/uOO0rROXR95LlJHKkjpYUG0zdITqxS/anY48ogbX2psghnwLVk
 9DoSGR2/e04sYx/Nw50XzZTYdwGw033RfJA4qa1RvCn9fNphHLXDzjkht
 gLa68yuh7u0/mD/bdCx6BEvfHRt0twFq/7Sq11Qmp+oP7LyZN7NtSQ7tJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="243674369"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="243674369"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:13:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="723308378"
Received: from ajomalle-mobl.ger.corp.intel.com (HELO [10.252.1.141])
 ([10.252.1.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:13:11 -0700
Message-ID: <2d860759-81d2-df81-54c9-16fb89a96fe9@intel.com>
Date: Fri, 8 Apr 2022 09:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <20220407164532.1242578-2-matthew.auld@intel.com>
 <20220408050044.7wd54sjbzzkzpqzr@ldmartin-desk2>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220408050044.7wd54sjbzzkzpqzr@ldmartin-desk2>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 06:00, Lucas De Marchi wrote:
> On Thu, Apr 07, 2022 at 05:45:32PM +0100, Matthew Auld wrote:
>> All of CI is just failing with the following, which prevents loading of
>> the module:
>>
>>    i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>>
>> Best guess is that this comes from the pin_map() for the scratch page,
>> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
>> like this now calls into dma_resv_wait_timeout() which can return the
>> remaining timeout, leading to the caller thinking this is an error.
>>
>> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>> drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 +++++++--
>> 1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 2998d895a6b3..1c88d4121658 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -772,9 +772,14 @@ int i915_gem_object_get_moving_fence(struct 
>> drm_i915_gem_object *obj,
>> int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>                       bool intr)
>> {
>> +    long ret;
>> +
>>     assert_object_held(obj);
>> -    return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>> -                     intr, MAX_SCHEDULE_TIMEOUT);
>> +
>> +    ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>> +                    intr, MAX_SCHEDULE_TIMEOUT);
>> +
>> +    return ret < 0 ? ret : 0;
> 
> shouldn't == 0 also be an error since it would be a timeout?

Hmm, I guess so...

> 
> Lucas De Marchi
