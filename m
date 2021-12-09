Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5A46EF9C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5946910E2C1;
	Thu,  9 Dec 2021 16:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A336C10E11E;
 Thu,  9 Dec 2021 13:45:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="238039603"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="238039603"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:45:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503493541"
Received: from shrehore-mobl2.ger.corp.intel.com (HELO [10.252.51.183])
 ([10.252.51.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:45:56 -0800
Message-ID: <1188bcc7-9415-adbb-1ec2-7016392d2923@linux.intel.com>
Date: Thu, 9 Dec 2021 14:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v2 12/16] drm/i915: Add i915_vma_unbind_unlocked, and take
 obj lock for i915_vma_unbind
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-13-maarten.lankhorst@linux.intel.com>
 <CAM0jSHM1P0-UqYC01vpjvogW_5ECwonnnmtmiKi3go4Di4+NKQ@mail.gmail.com>
 <f7bb808e-65c6-5e81-e129-58858a94db79@linux.intel.com>
 <CAM0jSHOZv54mLng+CHCajFq2eberkaRX8RdKWsSDwOQPG2rdGQ@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHOZv54mLng+CHCajFq2eberkaRX8RdKWsSDwOQPG2rdGQ@mail.gmail.com>
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

On 09-12-2021 14:40, Matthew Auld wrote:
> On Thu, 9 Dec 2021 at 13:25, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> On 09-12-2021 14:05, Matthew Auld wrote:
>>> On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
>>> <maarten.lankhorst@linux.intel.com> wrote:
>>>> We want to remove more members of i915_vma, which requires the locking to be
>>>> held more often.
>>>>
>>>> Start requiring gem object lock for i915_vma_unbind, as it's one of the
>>>> callers that may unpin pages.
>>>>
>>>> Some special care is needed when evicting, because the last reference to the
>>>> object may be held by the VMA, so after __i915_vma_unbind, vma may be garbage,
>>>> and we need to cache vma->obj before unlocking.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>> <snip>
>>>
>>>> @@ -129,22 +129,47 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>>>>
>>>>         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
>>>>
>>>> +retry:
>>>> +       i915_gem_drain_freed_objects(vm->i915);
>>>> +
>>>>         mutex_lock(&vm->mutex);
>>>>
>>>>         /* Skip rewriting PTE on VMA unbind. */
>>>>         open = atomic_xchg(&vm->open, 0);
>>>>
>>>>         list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
>>>> +               struct drm_i915_gem_object *obj = vma->obj;
>>>> +
>>>>                 GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
>>>> +
>>>>                 i915_vma_wait_for_bind(vma);
>>>>
>>>> -               if (i915_vma_is_pinned(vma))
>>>> +               if (i915_vma_is_pinned(vma) || !i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
>>>>                         continue;
>>>>
>>>> -               if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND)) {
>>>> -                       __i915_vma_evict(vma);
>>>> -                       drm_mm_remove_node(&vma->node);
>>>> +               /* unlikely to race when GPU is idle, so no worry about slowpath.. */
>>>> +               if (!i915_gem_object_trylock(obj, NULL)) {
>>>> +                       atomic_set(&vm->open, open);
>>> Does this need a comment about barriers?
>> Not sure, it's guarded by vm->mutex.
>>>> +
>>>> +                       i915_gem_object_get(obj);
>>> Should this not be kref_get_unless_zero? Assuming the vm->mutex is the
>>> only thing keeping the object alive here, won't this lead to potential
>>> uaf/double-free or something? Also should we not plonk this before the
>>> trylock? Or maybe I'm missing something here?
>> Normally you're correct, this is normally the case, but we drain freed objects and this path should only be run during s/r, at which point userspace should be dead, GPU idle, and we just drained all freed objects above.
>>
>> It would be a bug if we still found a dead object, as nothing should be running.
> Hmm, Ok. So why do we expect the trylock to ever fail here? Who else
> can grab it at this stage?
It probably shouldn't, should probably be a WARN if it happens.
>>>> +                       mutex_unlock(&vm->mutex);
>>>> +
>>>> +                       i915_gem_object_lock(obj, NULL);
>>>> +                       open = i915_vma_unbind(vma);
>>>> +                       i915_gem_object_unlock(obj);
>>>> +
>>>> +                       GEM_WARN_ON(open);
>>>> +
>>>> +                       i915_gem_object_put(obj);
>>>> +                       goto retry;
>>>>                 }
>>>> +
>>>> +               i915_vma_wait_for_bind(vma);
>>> We also call wait_for_bind above, is that intentional?
>> Should be harmless, but first one should probably be removed. :)
>>

