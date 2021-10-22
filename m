Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EBB4375D9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 13:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1546ED1A;
	Fri, 22 Oct 2021 11:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201E66ED15;
 Fri, 22 Oct 2021 11:05:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="228049753"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="228049753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 04:05:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="484642515"
Received: from dkarner-mobl.ger.corp.intel.com (HELO [10.252.48.154])
 ([10.252.48.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 04:05:00 -0700
Subject: Re: [Intel-gfx] [PATCH 10/28] drm/i915: Change shrink ordering to use
 locking around unbinding.
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-10-maarten.lankhorst@linux.intel.com>
 <CAM0jSHO+A=Ocop-xirPeWxjaYvQ8w-K76jkCWvwOwXPgAkVuYA@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5fde1d14-4e06-b49a-6075-b514e201c75d@linux.intel.com>
Date: Fri, 22 Oct 2021 13:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHO+A=Ocop-xirPeWxjaYvQ8w-K76jkCWvwOwXPgAkVuYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Op 21-10-2021 om 18:12 schreef Matthew Auld:
> On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Call drop_pages with the gem object lock held, instead of the other
>> way around. This will allow us to drop the vma bindings with the
>> gem object lock held.
>>
>> We plan to require the object lock for unpinning in the future,
>> and this is an easy target.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 42 ++++++++++----------
>>  1 file changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> index af3eb7fd951d..d3f29a66cb36 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> @@ -36,8 +36,8 @@ static bool can_release_pages(struct drm_i915_gem_object *obj)
>>         return swap_available() || obj->mm.madv == I915_MADV_DONTNEED;
>>  }
>>
>> -static bool unsafe_drop_pages(struct drm_i915_gem_object *obj,
>> -                             unsigned long shrink, bool trylock_vm)
>> +static int drop_pages(struct drm_i915_gem_object *obj,
>> +                      unsigned long shrink, bool trylock_vm)
>>  {
>>         unsigned long flags;
>>
>> @@ -208,26 +208,28 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>>
>>                         spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
>>
>> -                       err = 0;
>> -                       if (unsafe_drop_pages(obj, shrink, trylock_vm)) {
>> -                               /* May arrive from get_pages on another bo */
>> -                               if (!ww) {
>> -                                       if (!i915_gem_object_trylock(obj))
>> -                                               goto skip;
>> -                               } else {
>> -                                       err = i915_gem_object_lock(obj, ww);
>> -                                       if (err)
>> -                                               goto skip;
>> -                               }
>> -
>> -                               if (!__i915_gem_object_put_pages(obj)) {
>> -                                       try_to_writeback(obj, shrink);
>> -                                       count += obj->base.size >> PAGE_SHIFT;
>> -                               }
>> -                               if (!ww)
>> -                                       i915_gem_object_unlock(obj);
>> +                       /* May arrive from get_pages on another bo */
>> +                       if (!ww) {
>> +                               if (!i915_gem_object_trylock(obj))
>> +                                       goto skip;
>> +                       } else {
>> +                               err = i915_gem_object_lock(obj, ww);
>> +                               if (err)
>> +                                       goto skip;
>>                         }
>>
>> +                       if (drop_pages(obj, shrink, trylock_vm) &&
>> +                           !__i915_gem_object_put_pages(obj)) {
>> +                               try_to_writeback(obj, shrink);
>> +                               count += obj->base.size >> PAGE_SHIFT;
>> +                       }
>> +
>> +                       if (dma_resv_test_signaled(obj->base.resv, true))
>> +                               dma_resv_add_excl_fence(obj->base.resv, NULL);
> I assume we want to rip out resv_prune here in the series, or
> something? Instead of randomly adding this back here.
Oh yeah, this hunk can be removed safely. It's stale and shouldn't be here. :)
>> +
>> +                       if (!ww)
>> +                               i915_gem_object_unlock(obj);
>> +
>>                         scanned += obj->base.size >> PAGE_SHIFT;
>>  skip:
>>                         i915_gem_object_put(obj);
>> --
>> 2.33.0
>>

