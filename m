Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A379513B6B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52A10E9DF;
	Thu, 28 Apr 2022 18:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39810E478
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 18:20:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 21F8B1F45B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651170020;
 bh=dQwqT26Cz8SjSLrANJ5mEEUmfD4HisbV1Ro/MQLnyIM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fScBctzKB7/Kl5DYF2e35HMLkxfMlK1ZOQ3scPV0s9NTqTEzpB+VrowbLZWsIi5Ov
 O8+nWhclYQIjLIKoe21xSSb/j99KWN5+5CdWJgia+K2YseQBf4GK4vttgy4oYlZdOV
 uva7fRxMehZ5JXR2naVXYqhQjj6MJ91Ya5Laf956WMA6E0CSQKRpNC75NLfPUv3XuW
 ESwJJS2hwZT1sZu0RO053Lc7RfJ9gpez5yxThiXEgvC6J3J6I7Fct3mDaqCZMXvgOl
 h6ScQJhzFIpDBeBJkjGnp0/ubQqoyD247mbrEi21oMTaHIMmeJsWlkR3S/j4TY2VxD
 EfMNEcUYXOssA==
Message-ID: <d0970dbd-e6e7-afa0-fdfd-b755008e371f@collabora.com>
Date: Thu, 28 Apr 2022 21:20:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <ebe3dfdb-04ac-9ab1-64ff-9d54f96afe57@suse.de>
 <7f497f99-f4c1-33d6-46cf-95bd90188fe3@collabora.com>
 <YmlbXoeaVds/bjYn@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YmlbXoeaVds/bjYn@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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

27.04.2022 18:03, Daniel Vetter wrote:
>> ...
>>>> @@ -172,6 +172,41 @@ struct drm_gem_object_funcs {
>>>>        * This is optional but necessary for mmap support.
>>>>        */
>>>>       const struct vm_operations_struct *vm_ops;
>>>> +
>>>> +    /**
>>>> +     * @purge:
>>>> +     *
>>>> +     * Releases the GEM object's allocated backing storage to the
>>>> system.
>>>> +     *
>>>> +     * Returns the number of pages that have been freed by purging
>>>> the GEM object.
>>>> +     *
>>>> +     * This callback is used by the GEM shrinker.
>>>> +     */
>>>> +    unsigned long (*purge)(struct drm_gem_object *obj);
> 
> Hm I feel like drivers shouldn't need to know the difference here?
> 
> Like shmem helpers can track what's purgeable, and for eviction/purging
> the driver callback should do the same?
> 
> The only difference is when we try to re-reserve the backing storage. When
> the object has been evicted that should suceed, but when the object is
> purged that will fail.
> 
> That's the difference between evict and purge for drivers?

When buffer is purged, we can permanently release the backing storage
and the reserved IOV space, re-using the freed space by new BOs.

When buffer is evicted, the BO's IOV should be kept reserved and the
re-reservation of the backing storage should succeed.

>>>> +
>>>> +    /**
>>>> +     * @evict:
>>>> +     *
>>>> +     * Unpins the GEM object's allocated backing storage, allowing
>>>> shmem pages
>>>> +     * to be swapped out.
>>>
>>> What's the difference to the existing unpin() callback?
>>
>> Drivers need to do more than just unpinning pages when GEMs are evicted.
>> Unpinning is only a part of the eviction process. I'll improve the
>> doc-comment in v5.
>>
>> For example, for VirtIO-GPU driver we need to to detach host from the
>> guest's memory before pages are evicted [1].
>>
>> [1]
>> https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/blob/932eb03198bce3a21353b09ab71e95f1c19b84c2/drivers/gpu/drm/virtio/virtgpu_object.c#L145
>>
>> In case of Panfrost driver, we will need to remove mappings before pages
>> are evicted.
> 
> It might be good to align this with ttm, otoh that all works quite a bit
> differently for ttm since ttm supports buffer moves and a lot more fancy
> stuff.
> 
> I'm bringing this up since I have this fancy idea that eventually we could
> glue shmem helpers into ttm in some cases for managing buffers when they
> sit in system memory (as opposed to vram).

I'll take a look at ttm for v6.

>>>> +     *
>>>> +     * Returns the number of pages that have been unpinned.
>>>> +     *
>>>> +     * This callback is used by the GEM shrinker.
>>>> +     */
>>>> +    unsigned long (*evict)(struct drm_gem_object *obj);
>>>> +
>>>> +    /**
>>>> +     * @swap_in:
>>>> +     *
>>>> +     * Pins GEM object's allocated backing storage if it was
>>>> previously evicted,
>>>> +     * moving swapped out pages back to memory.
>>>> +     *
>>>> +     * Returns 0 on success, or -errno on error.
>>>> +     *
>>>> +     * This callback is used by the GEM shrinker.
>>>> +     */
>>>> +    int (*swap_in)(struct drm_gem_object *obj);
>>>
>>> Why do you need swap_in()? This can be done on-demand as part of a pin
>>> or vmap operation.
>>
>> Similarly to the unpinning, the pining of pages is only a part of what
>> needs to be done for GPU drivers. Besides of returning pages back to
>> memory, we also need to make them accessible to GPU and this is a
>> driver-specific process. This why we need the additional callbacks.
> 
> This is a bit much midlayer. The way this works in ttm is you reserve all
> the objects you need (which makes sure they're physically available
> again), and then the driver goes through and makes sure the page tables
> are all set up again.
> 
> Once you get towards gpu vm that's really the only approach, since your
> swap_in has no idea for which vm it needs to restore pagetables (and
> restoring it for all is a bit meh).
> 
> If drivers want to optimize this they can adjust/set any tracking
> information from their evict callback as needed.

In practice, majority of BOs have only one mapping. Only shared BOs
usually have extra mappings and shared BOs aren't evictable.

When memory pages are gone, then all the GPU mappings also should be
gone. Perhaps it's indeed won't be a bad idea to move out the restoring
of h/w VMs from the swap_in() and make drivers to handle the restoring
by themselves, so swap_in() will be only about restoring the pages. I'll
try to improve it in v6.

>>>>   };
>>>>     /**
>>>> diff --git a/include/drm/drm_gem_shmem_helper.h
>>>> b/include/drm/drm_gem_shmem_helper.h
>>>> index 70889533962a..a65557b446e6 100644
>>>> --- a/include/drm/drm_gem_shmem_helper.h
>>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>>> @@ -6,6 +6,7 @@
>>>>   #include <linux/fs.h>
>>>>   #include <linux/mm.h>
>>>>   #include <linux/mutex.h>
>>>> +#include <linux/shrinker.h>
>>>>     #include <drm/drm_file.h>
>>>>   #include <drm/drm_gem.h>
>>>> @@ -15,8 +16,18 @@
>>>>   struct dma_buf_attachment;
>>>>   struct drm_mode_create_dumb;
>>>>   struct drm_printer;
>>>> +struct drm_device;
>>>>   struct sg_table;
>>>>   +enum drm_gem_shmem_pages_state {
>>>> +    DRM_GEM_SHMEM_PAGES_STATE_PURGED = -2,
>>>> +    DRM_GEM_SHMEM_PAGES_STATE_EVICTED = -1,
>>>> +    DRM_GEM_SHMEM_PAGES_STATE_UNPINNED = 0,
>>>> +    DRM_GEM_SHMEM_PAGES_STATE_PINNED = 1,
>>>> +    DRM_GEM_SHMEM_PAGES_STATE_EVICTABLE = 2,
>>>> +    DRM_GEM_SHMEM_PAGES_STATE_PURGEABLE = 3,
>>>> +};
>>>
>>> These states can be detected by looking at the vmap and pin refcounts.
>>> No need to store them explicitly.
>>
>> I'll try to revisit this, but I was finding that it's much more
>> difficult to follow and debug code without the explicit states.
> 
> purgeable/purged needs some state, but pinned shouldn't be duplicated, so
> I concur here a bit.
> 
>>> In your patch, they also come with a
>>> big zoo of trivial helpers. None of that seems necessary AFAICT.
>>
>> There are couple functions which could be squashed, although this may
>> hurt readability of the code a tad. I'll try to take another look at
>> this for v5.
>>
>>> What's the difference between purge and evict BTW?
>>
>> The evicted pages are moved out from memory to a SWAP partition or file.
>>
>> The purged pages are destroyed permanently.
>>
>>>> +
>>>>   /**
>>>>    * struct drm_gem_shmem_object - GEM object backed by shmem
>>>>    */
>>>> @@ -43,8 +54,8 @@ struct drm_gem_shmem_object {
>>>>        * @madv: State for madvise
>>>>        *
>>>>        * 0 is active/inuse.
>>>> +     * 1 is not-needed/can-be-purged
>>>>        * A negative value is the object is purged.
>>>> -     * Positive values are driver specific and not used by the helpers.
>>>>        */
>>>>       int madv;
>>>>   @@ -91,6 +102,40 @@ struct drm_gem_shmem_object {
>>>>        * @map_wc: map object write-combined (instead of using shmem
>>>> defaults).
>>>>        */
>>>>       bool map_wc;
>>>> +
>>>> +    /**
>>>> +     * @eviction_disable_count:
>>>> +     *
>>>> +     * The shmem pages are disallowed to be evicted by the memory
>>>> shrinker
>>>> +     * while count is non-zero. Used internally by memory shrinker.
>>>> +     */
>>>> +    unsigned int eviction_disable_count;
>>>> +
>>>> +    /**
>>>> +     * @purging_disable_count:
>>>> +     *
>>>> +     * The shmem pages are disallowed to be purged by the memory
>>>> shrinker
>>>> +     * while count is non-zero. Used internally by memory shrinker.
>>>> +     */
>>>> +    unsigned int purging_disable_count;
> 
> What are these disable counts for?

Some of BO types should stay pinned permanently, this applies to both
VirtIO and Panfrost drivers that make use of the generic shrinker in
this patchset. Hence I made objects unpurgeable and unevictable by default.

Initially the idea of these counts was to allow drivers to explicitly
disable purging and eviction, and do it multiple times. If driver
disables eviction in two different places in the code, then we need to
track the eviction-disable count.

In the v5 of this patchset drivers don't need to explicitly disable
shrinking anymore, they only need to enable it. The counts are also used
internally by DRM SHMEM core to track the vmappings and pinnings, but
perhaps pages_use_count could be used for that instead. I'll revisit it
for v6.

> The way purgeable works in other drivers is that userspace sets purgeable
> or not, and it's up to userspace to not make a mess of this.
> 
> There's also some interactions, and I guess a bunch of drivers get this
> wrong in funny ways. Not sure how to best clean this up.
> 
> - Once you have a shrinker/dynamic memory management you should _not_ pin
>   pages, except when it's truly permanent like for scanout. Instead
>   drivers should attach dma_fence to the dma_resv to denote in-flight
>   access.

By default pages are pinned when drm_gem_shmem_get_pages_sgt() is
invoked by drivers during of BO creation time.

We could declare that pages_use_count=1 means the pages are allowed to
be evicted and purged if shrinker is enabled. Then the further
drm_gem_shmem_pin/vmap() calls will bump the pages_use_count,
disallowing the eviction and purging, like you're suggesting, and we
won't need the explicit counts.

> - A pinned buffer object is not allowed to be put into purgeable state,
>   and a bo in purgeable state should not be allowed to be pinned.
> 
> - Drivers need to hold dma_resv_lock for long enough in their command
>   submission, i.e. from the point where the reserve the buffers and make
>   sure that mappings exists, to the point where the request is submitted
>   to hw or drm/sched and fences are installed.
> 
> But I think a lot of current shmem users just pin as part of execbuf, so
> this won't work quite so well right out of the box.

The current shmem users assume that BO is pinned permanently once it has
been created.

> Anyway with that design I don't think there should ever be a need to
> disable shrinking.

To me what you described mostly matches to what I did in the v5.

>>>> +
>>>> +    /**
>>>> +     * @pages_state: Current state of shmem pages. Used internally by
>>>> +     * memory shrinker.
>>>> +     */
>>>> +    enum drm_gem_shmem_pages_state pages_state;
>>>> +
>>>> +    /**
>>>> +     * @evicted: True if shmem pages were evicted by the memory
>>>> shrinker.
>>>> +     * Used internally by memory shrinker.
>>>> +     */
>>>> +    bool evicted;
>>>> +
>>>> +    /**
>>>> +     * @pages_shrinkable: True if shmem pages can be evicted or purged
>>>> +     * by the memory shrinker. Used internally by memory shrinker.
>>>> +     */
>>>> +    bool pages_shrinkable;
>>>
>>> As commented before, this state can be foundby looking at existing
>>> fields. No need to store it separately.
>>
>> When we're transitioning from "evictable" to a "purgeable" state, we
>> must not add pages twice to the "shrinkable_count" variable. Hence this
>> is not a state, but a variable which prevents the double accounting of
>> the pages. Please see drm_gem_shmem_add_pages_to_shrinker() in this patch.
>>
>> Perhaps something like "pages_accounted_by_shrinker" could be a better
>> name for the variable. I'll revisit this for v5.
> 
> Hm not sure we need to account this? Usually the shrinker just counts when
> it's asked to do so, not practively maintain that count. Once you start
> shrinking burning cpu time is generally not too terrible.

We could count pages on demand by walking up the "evictable" list, but
then the shrinker's lock needs to be taken by the
drm_gem_shmem_shrinker_count_objects() to protect the list.

Previously Rob Clark said that the profiling of freedreno's shrinker
showed that it's worthwhile to reduce the locks as much as possible,
including the case of counting shrinkable objects.
