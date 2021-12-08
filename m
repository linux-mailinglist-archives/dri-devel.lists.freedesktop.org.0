Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E910346D480
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 14:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8511735F1;
	Wed,  8 Dec 2021 13:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA38735F1;
 Wed,  8 Dec 2021 13:34:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="298622378"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="298622378"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 05:34:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="503050871"
Received: from heissax-mobl.amr.corp.intel.com (HELO [10.252.51.58])
 ([10.252.51.58])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 05:34:38 -0800
Message-ID: <a697ee76-400a-1cee-8687-db905fbdbd11@linux.intel.com>
Date: Wed, 8 Dec 2021 14:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v2 10/16] drm/i915: Make i915_gem_evict_vm
 work correctly for already locked objects
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-11-maarten.lankhorst@linux.intel.com>
 <CAM0jSHPrBmKN+o27ZYvYxHj9BvM3y3tF4ZVh2HCH_AZtPboPbg@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHPrBmKN+o27ZYvYxHj9BvM3y3tF4ZVh2HCH_AZtPboPbg@mail.gmail.com>
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

On 08-12-2021 13:07, Matthew Auld wrote:
> On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> i915_gem_execbuf will call i915_gem_evict_vm() after failing to pin
>> all objects in the first round. We are about to remove those short-term
>> pins, but even without those the objects are still locked. Add a special
>> case to allow i915_gem_evict_vm to evict locked objects as well.
>>
>> This might also allow multiple objects sharing the same resv to be evicted.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> Do we need similar treatment for stuff like evict_for_node etc?

Unfortunately not, we would risk evicting newly bound objects when we completely drop short term pinning

evict_vm is the exception, because you expect it to clean up the entire vm as much as possible, and is called explictly, not as a part of pinning. :)

>> ---
>>  drivers/gpu/drm/i915/i915_gem_evict.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index 24f5e3345e43..f502a617b35c 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -410,21 +410,42 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>>         do {
>>                 struct i915_vma *vma, *vn;
>>                 LIST_HEAD(eviction_list);
>> +               LIST_HEAD(locked_eviction_list);
>>
>>                 list_for_each_entry(vma, &vm->bound_list, vm_link) {
>>                         if (i915_vma_is_pinned(vma))
>>                                 continue;
>>
>> +                       /*
>> +                        * If we already own the lock, trylock fails. In case the resv
>> +                        * is shared among multiple objects, we still need the object ref.
>> +                        */
>> +                       if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
>> +                               __i915_vma_pin(vma);
>> +                               list_add(&vma->evict_link, &locked_eviction_list);
>> +                               continue;
>> +                       }
>> +
>>                         if (!i915_gem_object_trylock(vma->obj, ww))
>>                                 continue;
>>
>>                         __i915_vma_pin(vma);
>>                         list_add(&vma->evict_link, &eviction_list);
>>                 }
>> -               if (list_empty(&eviction_list))
>> +               if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
>>                         break;
>>
>>                 ret = 0;
>> +               /* Unbind locked objects first, before unlocking the eviction_list */
>> +               list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
>> +                       __i915_vma_unpin(vma);
>> +
>> +                       if (ret == 0)
>> +                               ret = __i915_vma_unbind(vma);
>> +                       if (ret != -EINTR) /* "Get me out of here!" */
>> +                               ret = 0;
>> +               }
>> +
>>                 list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
>>                         __i915_vma_unpin(vma);
>>                         if (ret == 0)
>> --
>> 2.34.0
>>

