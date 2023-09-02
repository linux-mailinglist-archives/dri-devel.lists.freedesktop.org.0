Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD3790963
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 21:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4117F10E09E;
	Sat,  2 Sep 2023 19:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A8E10E091;
 Sat,  2 Sep 2023 19:43:08 +0000 (UTC)
Received: from [192.168.2.205] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 12AB46607285;
 Sat,  2 Sep 2023 20:43:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693683786;
 bh=jdxG2Yk0vUZNyoRBsEOYF91svxBT3sbchZ6QIhYutfw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZU/Jnz1jpqYrjYeKrIjkHM5aFa51/mk+Ua2WjxxeIFUY5veGvo0869p8VAq6vi+SM
 WE/YSOiavu5e7B7CfYdU95kYgKsltmO87s3pyQgt4HT7QaiGiRS7QQCj263HHylL5F
 2cudFrVU2WdPhBHQVM+x2f2AsALe573bNoBwnJFxX9Fl7aocWI2uc/TZhD/xyzaQEA
 7OQYUWHuWU8tl95CrMLtvoc1GnWwepaZqRW5eyH/UkjdKCOtCjyZvq/xFItd4/dUoZ
 MAG1SF3v9Bj4o2m13ioysVIcrIoiB+x4BXadvPQoAJ50TZbmwrSG+3vTZhdusRZhjr
 0NSO+YDBXsgEg==
Message-ID: <73dd54d3-cb36-cb21-6bbb-ff1dd89429a3@collabora.com>
Date: Sat, 2 Sep 2023 22:43:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 17/23] drm/shmem-helper: Add and use
 drm_gem_shmem_resv_assert_held() helper
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-18-dmitry.osipenko@collabora.com>
 <20230828121239.78a180e6@collabora.com>
 <01930e66-cba2-5d81-7f46-d46907bdd300@collabora.com>
 <20230829092950.3a9c40c1@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230829092950.3a9c40c1@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/23 10:29, Boris Brezillon wrote:
> On Tue, 29 Aug 2023 05:34:23 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 8/28/23 13:12, Boris Brezillon wrote:
>>> On Sun, 27 Aug 2023 20:54:43 +0300
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>   
>>>> In a preparation of adding drm-shmem memory shrinker, move all reservation
>>>> locking lockdep checks to use new drm_gem_shmem_resv_assert_held() that
>>>> will resolve spurious lockdep warning about wrong locking order vs
>>>> fs_reclam code paths during freeing of shmem GEM, where lockdep isn't
>>>> aware that it's impossible to have locking contention with the fs_reclam
>>>> at this special time.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 37 +++++++++++++++++---------
>>>>  1 file changed, 25 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> index d96fee3d6166..ca5da976aafa 100644
>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> @@ -128,6 +128,23 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>>>>  
>>>> +static void drm_gem_shmem_resv_assert_held(struct drm_gem_shmem_object *shmem)
>>>> +{
>>>> +	/*
>>>> +	 * Destroying the object is a special case.. drm_gem_shmem_free()
>>>> +	 * calls many things that WARN_ON if the obj lock is not held.  But
>>>> +	 * acquiring the obj lock in drm_gem_shmem_free() can cause a locking
>>>> +	 * order inversion between reservation_ww_class_mutex and fs_reclaim.
>>>> +	 *
>>>> +	 * This deadlock is not actually possible, because no one should
>>>> +	 * be already holding the lock when drm_gem_shmem_free() is called.
>>>> +	 * Unfortunately lockdep is not aware of this detail.  So when the
>>>> +	 * refcount drops to zero, we pretend it is already locked.
>>>> +	 */
>>>> +	if (kref_read(&shmem->base.refcount))
>>>> +		drm_gem_shmem_resv_assert_held(shmem);
>>>> +}
>>>> +
>>>>  /**
>>>>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>>>>   * @shmem: shmem GEM object to free
>>>> @@ -142,8 +159,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>>>  	if (obj->import_attach) {
>>>>  		drm_prime_gem_destroy(obj, shmem->sgt);
>>>>  	} else if (!shmem->imported_sgt) {
>>>> -		dma_resv_lock(shmem->base.resv, NULL);
>>>> -
>>>>  		drm_WARN_ON(obj->dev, kref_read(&shmem->vmap_use_count));
>>>>  
>>>>  		if (shmem->sgt) {
>>>> @@ -156,8 +171,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>>>  			drm_gem_shmem_put_pages_locked(shmem);  
>>>
>>> AFAICT, drm_gem_shmem_put_pages_locked() is the only function that's
>>> called in the free path and would complain about resv-lock not being
>>> held. I think I'd feel more comfortable if we were adding a
>>> drm_gem_shmem_free_pages() function that did everything
>>> drm_gem_shmem_put_pages_locked() does except for the lock_held() check
>>> and the refcount dec, and have it called here (and in
>>> drm_gem_shmem_put_pages_locked()). This way we can keep using
>>> dma_resv_assert_held() instead of having our own variant.  
>>
>> It's not only drm_gem_shmem_free_pages(), but any drm-shmem function
>> that drivers may use in the GEM's freeing callback.
>>
>> For example, panfrost_gem_free_object() may unpin shmem BO and then do
>> drm_gem_shmem_free().
> 
> Is this really a valid use case? If the GEM refcount dropped to zero,
> we should certainly not have pages_pin_count > 0 (thinking of vmap-ed
> buffers that might disappear while kernel still has a pointer to the
> CPU-mapped area). The only reason we have this
> drm_gem_shmem_put_pages_locked() in drm_gem_shmem_free() is because of
> this implicit ref hold by the sgt, and IMHO, we should be stricter and
> check that pages_use_count == 1 when sgt != NULL and pages_use_count ==
> 0 otherwise.
> 
> I actually think it's a good thing to try and catch any attempt to call
> functions trying lock the resv in a path they're not supposed to. At
> least we can decide whether these actions are valid or not in this
> context, and provide dedicated helpers for the free path if they are.

To me it's a valid use-case. I was going to do it for the virtio-gpu
driver for a specific BO type that should be permanently pinned in
memory. So I made the BO pinned in the virto_gpu's bo_create() and
unpinned it from the virtio-gpu's gem->free(), this is a perfectly valid
case to me. Though, in the end I switched to another approach that
doesn't require to do the pinning in the virtio-gpu driver.

For now we can do it as you suggested, to use custom put_pages() in the
shmem_free() since neither of drivers need that. Let's try that.

-- 
Best regards,
Dmitry

