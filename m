Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467046EF2A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEB910E4C4;
	Thu,  9 Dec 2021 16:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ED189FFD;
 Thu,  9 Dec 2021 12:59:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="225357206"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="225357206"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 04:59:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503478142"
Received: from shrehore-mobl2.ger.corp.intel.com (HELO [10.252.51.183])
 ([10.252.51.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 04:59:40 -0800
Message-ID: <07294418-d383-a607-59e9-58bdd2ffbb59@linux.intel.com>
Date: Thu, 9 Dec 2021 13:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v2 11/16] drm/i915: Call i915_gem_evict_vm in
 vm_fault_gtt to prevent new ENOSPC errors
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-12-maarten.lankhorst@linux.intel.com>
 <CAM0jSHOH4JACquBQc0rTBbNTuo7x6FznZ6FEaEJfr9DDDF1crQ@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHOH4JACquBQc0rTBbNTuo7x6FznZ6FEaEJfr9DDDF1crQ@mail.gmail.com>
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

On 09-12-2021 13:17, Matthew Auld wrote:
> On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Now that we cannot unbind kill the currently locked object directly
> Can this be reworded slightly? Not sure what is meant by "unbind kill" here.
Oops, the word 'kill' doesn't belong here.
>> because we're removing short term pinning, we may have to unbind the
>> object from gtt manually, using a i915_gem_evict_vm() call.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 65fc6ff5f59d..6d557bb9926f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -357,8 +357,22 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
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
>> +                               ret = i915_gem_evict_vm(&ggtt->vm, &ww);
> Would it make sense to pass an extra flag for the above ggtt_pin(maybe
> PIN_EVICT_SHARED)? Such that evict_for_something can handle the
> already locked object and then also any vma sharing the same dma-resv
> object here? Or at least trying to nuke the entire vm, just for the
> mappable portion seems maybe overkill? Or perhaps we never expect to
> hit this in the real world?
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Yeah, effect would be the same though. When fully reworking eviction and vm locks, it might be better to do so though.

>
>> +                               mutex_unlock(&ggtt->vm.mutex);
>> +                       }
>> +                       if (ret)
>> +                               goto err_reset;
>> +                       vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
>> +               }
>> +               GEM_WARN_ON(vma == ERR_PTR(-ENOSPC));
>>         }
>>         if (IS_ERR(vma)) {
>>                 ret = PTR_ERR(vma);
>> --
>> 2.34.0
>>

