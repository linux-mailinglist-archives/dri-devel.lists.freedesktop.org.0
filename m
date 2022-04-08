Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555624F9362
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242E610F026;
	Fri,  8 Apr 2022 10:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6231010F00B;
 Fri,  8 Apr 2022 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649415432; x=1680951432;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Wh4xhNSrs9SN6yQgchGEEUO9o9HS+tpvYB6hKEMDrxw=;
 b=L2dIlNEvNeJEmDRXzQOGQKSKdOEggZuffwencw53VfGWrLJy4It/6NUt
 Db19WOq1Oov4FkAdiun9mDceHWyq+Ch14nLDCdb40BeZDelVK++El+RTw
 VH46GOSSlVyk6VMq/amGu/sLFNmhYqYljDGkA7qpKMY2Sa4MIcldEZMqw
 atXIiCj+N0KhV6//vV25/Pc/a7FSWZMyKUh6PVLHvFNdpRN3y81DQpb6M
 hbd/78E4aj/QCdcv2QgWzR8Ukb2aVtSr4Rgx1yhz5n/8UVLedl+y5eAcG
 ABVpF9PxZcXkoW7a1FTxQUBplzwbtDKTDDRM/n7uxO2vvvpjADCLQf5Vy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="286556376"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="286556376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:57:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="723350400"
Received: from ajomalle-mobl.ger.corp.intel.com (HELO [10.252.1.141])
 ([10.252.1.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:57:10 -0700
Message-ID: <bf7a42a7-1291-0d0d-c6e3-d75f26bd19dc@intel.com>
Date: Fri, 8 Apr 2022 11:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/i915: fix i915_gem_object_wait_moving_fence
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
References: <20220408084205.1353427-1-matthew.auld@intel.com>
 <c2827f30-989a-4d25-4cf5-e252a9ba32ea@amd.com>
 <b9a31872-5f23-965f-784d-9ebb6c192e47@intel.com>
In-Reply-To: <b9a31872-5f23-965f-784d-9ebb6c192e47@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 10:48, Matthew Auld wrote:
> On 08/04/2022 09:59, Christian König wrote:
>> Am 08.04.22 um 10:42 schrieb Matthew Auld:
>>> All of CI is just failing with the following, which prevents loading of
>>> the module:
>>>
>>>      i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>>>
>>> Best guess is that this comes from the pin_map() for the scratch page,
>>> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
>>> like this now calls into dma_resv_wait_timeout() which can return the
>>> remaining timeout, leading to the caller thinking this is an error.
>>>
>>> v2(Lucas): handle ret == 0
>>>
>>> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Reviewed-by: Christian König <christian.koenig@amd.com> #v1
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Should I push it to drm-misc-next?
> 
> I guess we need to wait for at least BAT result to come back. I will 
> ping here, assuming that comes back green. Thanks.

Ok, please go ahead with merging.

> 
>>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> index 2998d895a6b3..747ac65e060f 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -772,9 +772,16 @@ int i915_gem_object_get_moving_fence(struct 
>>> drm_i915_gem_object *obj,
>>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>                         bool intr)
>>>   {
>>> +    long ret;
>>> +
>>>       assert_object_held(obj);
>>> -    return dma_resv_wait_timeout(obj->base. resv, 
>>> DMA_RESV_USAGE_KERNEL,
>>> -                     intr, MAX_SCHEDULE_TIMEOUT);
>>> +
>>> +    ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>>> +                    intr, MAX_SCHEDULE_TIMEOUT);
>>> +    if (!ret)
>>> +        ret = -ETIME;
>>> +
>>> +    return ret < 0 ? ret : 0;
>>>   }
>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>
