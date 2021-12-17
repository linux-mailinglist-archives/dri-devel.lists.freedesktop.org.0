Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE9478FA3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934A510F05C;
	Fri, 17 Dec 2021 15:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD9C10F044;
 Fri, 17 Dec 2021 15:29:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="219787155"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="219787155"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 07:29:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="519783306"
Received: from gladkina-mobl.ger.corp.intel.com (HELO [10.252.56.116])
 ([10.252.56.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 07:29:36 -0800
Message-ID: <35307def-2373-eaa5-1d2c-94cf89ff7dee@linux.intel.com>
Date: Fri, 17 Dec 2021 16:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v3 08/17] drm/i915: Call i915_gem_evict_vm in vm_fault_gtt
 to prevent new ENOSPC errors
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-9-maarten.lankhorst@linux.intel.com>
 <CAM0jSHOL-dxs7v314p=iKDkRLDfR3Q=6bFoejydxTMd7Tbw=vQ@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHOL-dxs7v314p=iKDkRLDfR3Q=6bFoejydxTMd7Tbw=vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-12-2021 12:58, Matthew Auld wrote:
> On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Now that we cannot unbind kill the currently locked object directly
> "unbind kill"
>
>> because we're removing short term pinning, we may have to unbind the
>> object from gtt manually, using a i915_gem_evict_vm() call.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Maybe mention that this only in preparation for some future patches,
> once the actual eviction is trylock and evict_for_vm can also handle
> shared dma-resv? At this point in the series we shouldn't expect to
> hit -ENOSPC, right?
>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index af81d6c3332a..00cd9642669a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -358,8 +358,22 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>>                         vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
>>                 }
>>
>> -               /* The entire mappable GGTT is pinned? Unexpected! */
>> -               GEM_BUG_ON(vma == ERR_PTR(-ENOSPC));
>> +               /*
>> +                * The entire mappable GGTT is pinned? Unexpected!
>> +                * Try to evict the object we locked too, as normally we skip it
>> +                * due to lack of short term pinning inside execbuf.
>> +                */
>> +               if (vma == ERR_PTR(-ENOSPC)) {
>> +                       ret = mutex_lock_interruptible(&ggtt->vm.mutex);
>> +                       if (!ret) {
>> +                               ret = i915_gem_evict_vm(&ggtt->vm);
>> +                               mutex_unlock(&ggtt->vm.mutex);
>> +                       }
>> +                       if (ret)
>> +                               goto err_reset;
>> +                       vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
>> +               }
>> +               GEM_WARN_ON(vma == ERR_PTR(-ENOSPC));
> Looks like this is being triggered in CI, I assume because the trylock
> could easily fail, due to contention? Is this expected for now? Do we
> keep the WARN and track it as a known issue?

I think it makes sense. I can probably fix i915_gem_evict_vm to attempt to take all objects in a blocking way.

I had some primitives that could lock for eviction, and keep a refcount on the object. i915_gem_evict_vm could probably be changed to use it.

>>         }
>>         if (IS_ERR(vma)) {
>>                 ret = PTR_ERR(vma);
>> --
>> 2.34.1
>>

