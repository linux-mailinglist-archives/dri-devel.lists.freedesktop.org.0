Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AB507B1F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 22:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742410E027;
	Tue, 19 Apr 2022 20:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1C10E027
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 20:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id D242A1F41C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650400846;
 bh=Rc2i+BQoYrwpgocGYrZDfDAk0Kijzh0pLg1e7NKVmVI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HWIJdBjow/SXHOolXdJUHNUdWrSbBTMZWYg6juNNYdzqVAcRpPeW6uZXhUnT3Mt1y
 6ivYvweLm03x4RUZEL4dUbYr38Rc9fuf5ROtKN8C5AytTyG0djV+xh+5bybD86qAfs
 8WtiX5MN4GFpniCX4l0VtMNjAhb7GE3MU+5y8weSRuBFxMYZfA5GId02ipX1byUNNT
 u+1UTLtgE6m+DospAWqBX0dvEPAbU3kLRPYH2tG+EcnYAaAM6KSr1RjIHwcgVQ9Rh/
 Kc0UK9vLx5LdPCYJEk1jfgWUJwaY5oerNA/m1NwIDOYcZai8xYxTpEZGkNeGON/VZb
 LmdQINCw9St5Q==
Message-ID: <7f497f99-f4c1-33d6-46cf-95bd90188fe3@collabora.com>
Date: Tue, 19 Apr 2022 23:40:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <ebe3dfdb-04ac-9ab1-64ff-9d54f96afe57@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ebe3dfdb-04ac-9ab1-64ff-9d54f96afe57@suse.de>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/19/22 10:22, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.04.22 um 00:37 schrieb Dmitry Osipenko:
>> Introduce a common DRM SHMEM shrinker. It allows to reduce code
>> duplication among DRM drivers that implement theirs own shrinkers.
>> This is initial version of the shrinker that covers basic needs of
>> GPU drivers, both purging and eviction of shmem objects are supported.
>>
>> This patch is based on a couple ideas borrowed from Rob's Clark MSM
>> shrinker and Thomas' Zimmermann variant of SHMEM shrinker.
>>
>> In order to start using DRM SHMEM shrinker drivers should:
>>
>> 1. Implement new purge(), evict() + swap_in() GEM callbacks.
>> 2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device).
>> 3. Use drm_gem_shmem_set_purgeable_and_evictable(shmem) and alike API
>>     functions to activate shrinking of GEMs.
>>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 765 ++++++++++++++++++++++++-
>>   include/drm/drm_device.h               |   4 +
>>   include/drm/drm_gem.h                  |  35 ++
>>   include/drm/drm_gem_shmem_helper.h     | 105 +++-
>>   4 files changed, 877 insertions(+), 32 deletions(-)
...
>> @@ -172,6 +172,41 @@ struct drm_gem_object_funcs {
>>        * This is optional but necessary for mmap support.
>>        */
>>       const struct vm_operations_struct *vm_ops;
>> +
>> +    /**
>> +     * @purge:
>> +     *
>> +     * Releases the GEM object's allocated backing storage to the
>> system.
>> +     *
>> +     * Returns the number of pages that have been freed by purging
>> the GEM object.
>> +     *
>> +     * This callback is used by the GEM shrinker.
>> +     */
>> +    unsigned long (*purge)(struct drm_gem_object *obj);
>> +
>> +    /**
>> +     * @evict:
>> +     *
>> +     * Unpins the GEM object's allocated backing storage, allowing
>> shmem pages
>> +     * to be swapped out.
> 
> What's the difference to the existing unpin() callback?

Drivers need to do more than just unpinning pages when GEMs are evicted.
Unpinning is only a part of the eviction process. I'll improve the
doc-comment in v5.

For example, for VirtIO-GPU driver we need to to detach host from the
guest's memory before pages are evicted [1].

[1]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/blob/932eb03198bce3a21353b09ab71e95f1c19b84c2/drivers/gpu/drm/virtio/virtgpu_object.c#L145

In case of Panfrost driver, we will need to remove mappings before pages
are evicted.

>> +     *
>> +     * Returns the number of pages that have been unpinned.
>> +     *
>> +     * This callback is used by the GEM shrinker.
>> +     */
>> +    unsigned long (*evict)(struct drm_gem_object *obj);
>> +
>> +    /**
>> +     * @swap_in:
>> +     *
>> +     * Pins GEM object's allocated backing storage if it was
>> previously evicted,
>> +     * moving swapped out pages back to memory.
>> +     *
>> +     * Returns 0 on success, or -errno on error.
>> +     *
>> +     * This callback is used by the GEM shrinker.
>> +     */
>> +    int (*swap_in)(struct drm_gem_object *obj);
> 
> Why do you need swap_in()? This can be done on-demand as part of a pin
> or vmap operation.

Similarly to the unpinning, the pining of pages is only a part of what
needs to be done for GPU drivers. Besides of returning pages back to
memory, we also need to make them accessible to GPU and this is a
driver-specific process. This why we need the additional callbacks.

>>   };
>>     /**
>> diff --git a/include/drm/drm_gem_shmem_helper.h
>> b/include/drm/drm_gem_shmem_helper.h
>> index 70889533962a..a65557b446e6 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -6,6 +6,7 @@
>>   #include <linux/fs.h>
>>   #include <linux/mm.h>
>>   #include <linux/mutex.h>
>> +#include <linux/shrinker.h>
>>     #include <drm/drm_file.h>
>>   #include <drm/drm_gem.h>
>> @@ -15,8 +16,18 @@
>>   struct dma_buf_attachment;
>>   struct drm_mode_create_dumb;
>>   struct drm_printer;
>> +struct drm_device;
>>   struct sg_table;
>>   +enum drm_gem_shmem_pages_state {
>> +    DRM_GEM_SHMEM_PAGES_STATE_PURGED = -2,
>> +    DRM_GEM_SHMEM_PAGES_STATE_EVICTED = -1,
>> +    DRM_GEM_SHMEM_PAGES_STATE_UNPINNED = 0,
>> +    DRM_GEM_SHMEM_PAGES_STATE_PINNED = 1,
>> +    DRM_GEM_SHMEM_PAGES_STATE_EVICTABLE = 2,
>> +    DRM_GEM_SHMEM_PAGES_STATE_PURGEABLE = 3,
>> +};
> 
> These states can be detected by looking at the vmap and pin refcounts.
> No need to store them explicitly.

I'll try to revisit this, but I was finding that it's much more
difficult to follow and debug code without the explicit states.

> In your patch, they also come with a
> big zoo of trivial helpers. None of that seems necessary AFAICT.

There are couple functions which could be squashed, although this may
hurt readability of the code a tad. I'll try to take another look at
this for v5.

> What's the difference between purge and evict BTW?

The evicted pages are moved out from memory to a SWAP partition or file.

The purged pages are destroyed permanently.

>> +
>>   /**
>>    * struct drm_gem_shmem_object - GEM object backed by shmem
>>    */
>> @@ -43,8 +54,8 @@ struct drm_gem_shmem_object {
>>        * @madv: State for madvise
>>        *
>>        * 0 is active/inuse.
>> +     * 1 is not-needed/can-be-purged
>>        * A negative value is the object is purged.
>> -     * Positive values are driver specific and not used by the helpers.
>>        */
>>       int madv;
>>   @@ -91,6 +102,40 @@ struct drm_gem_shmem_object {
>>        * @map_wc: map object write-combined (instead of using shmem
>> defaults).
>>        */
>>       bool map_wc;
>> +
>> +    /**
>> +     * @eviction_disable_count:
>> +     *
>> +     * The shmem pages are disallowed to be evicted by the memory
>> shrinker
>> +     * while count is non-zero. Used internally by memory shrinker.
>> +     */
>> +    unsigned int eviction_disable_count;
>> +
>> +    /**
>> +     * @purging_disable_count:
>> +     *
>> +     * The shmem pages are disallowed to be purged by the memory
>> shrinker
>> +     * while count is non-zero. Used internally by memory shrinker.
>> +     */
>> +    unsigned int purging_disable_count;
>> +
>> +    /**
>> +     * @pages_state: Current state of shmem pages. Used internally by
>> +     * memory shrinker.
>> +     */
>> +    enum drm_gem_shmem_pages_state pages_state;
>> +
>> +    /**
>> +     * @evicted: True if shmem pages were evicted by the memory
>> shrinker.
>> +     * Used internally by memory shrinker.
>> +     */
>> +    bool evicted;
>> +
>> +    /**
>> +     * @pages_shrinkable: True if shmem pages can be evicted or purged
>> +     * by the memory shrinker. Used internally by memory shrinker.
>> +     */
>> +    bool pages_shrinkable;
> 
> As commented before, this state can be foundby looking at existing
> fields. No need to store it separately.

When we're transitioning from "evictable" to a "purgeable" state, we
must not add pages twice to the "shrinkable_count" variable. Hence this
is not a state, but a variable which prevents the double accounting of
the pages. Please see drm_gem_shmem_add_pages_to_shrinker() in this patch.

Perhaps something like "pages_accounted_by_shrinker" could be a better
name for the variable. I'll revisit this for v5.
