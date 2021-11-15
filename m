Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91E4504AE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DCE6EC73;
	Mon, 15 Nov 2021 12:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38FF6EC69;
 Mon, 15 Nov 2021 12:44:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="214154360"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="214154360"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:44:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="454012443"
Received: from ldyrga-mobl1.ger.corp.intel.com (HELO [10.249.254.10])
 ([10.249.254.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:44:47 -0800
Message-ID: <df4eb5b5-d49f-c30a-1143-0c447caa2948@linux.intel.com>
Date: Mon, 15 Nov 2021 13:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/6] drm/i915: Add functions to set/get moving fence
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
 <20211114111218.623138-2-thomas.hellstrom@linux.intel.com>
 <bc238bbf-a4df-7b97-ba18-d6c5cc93827e@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <bc238bbf-a4df-7b97-ba18-d6c5cc93827e@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/15/21 13:39, Matthew Auld wrote:
> On 14/11/2021 11:12, Thomas Hellström wrote:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> We want to get rid of i915_vma tracking to simplify the code and
>> lifetimes. Add a way to set/put the moving fence, in preparation for
>> removing the tracking.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 37 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  9 ++++++
>>   2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 591ee3cb7275..ec4313836597 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -33,6 +33,7 @@
>>   #include "i915_gem_object.h"
>>   #include "i915_memcpy.h"
>>   #include "i915_trace.h"
>> +#include "i915_gem_ttm.h"
>>     static struct kmem_cache *slab_objects;
>>   @@ -726,6 +727,42 @@ static const struct drm_gem_object_funcs 
>> i915_gem_object_funcs = {
>>       .export = i915_gem_prime_export,
>>   };
>>   +struct dma_fence *
>> +i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
>> +{
>> +    return dma_fence_get(i915_gem_to_ttm(obj)->moving);
>> +}
>> +
>> +void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>> +                      struct dma_fence *fence)
>> +{
>> +    dma_fence_put(i915_gem_to_ttm(obj)->moving);
>> +
>> +    i915_gem_to_ttm(obj)->moving = dma_fence_get(fence);
>> +}
>
> Are these also assert_object_held()? Should we maybe squash this patch 
> with the first user?

Yes these are also assert_object_held(). We could probably squash these, 
yes.


