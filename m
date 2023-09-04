Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0E791396
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 10:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94F510E109;
	Mon,  4 Sep 2023 08:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2D10E0B5;
 Mon,  4 Sep 2023 08:36:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C7295660727F;
 Mon,  4 Sep 2023 09:36:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693816596;
 bh=SW4UyKASRes34dFYstoQvepCjdo8dXyyAQmx/si9FhA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=igTW5fpEPxJdHm54MT3fU8oqPsfT0AZDCEyZxFD/0yaUh/gEJ49Ht23LoUJdR0P2B
 0uPbP7TFDhZUV3d8UIi4cXyhD5xf/sPtXlRMRiV8HFE57ok3p0psXMEuKdhEfiMqjm
 IGIM6YXJ0Ak9h0WGN1aUEp9PVGfyc2QY/cYaviGex1JDyVzcP7Pfmbuy/KvUF0g+EL
 0Oysn2zm9KGHtdWcSWVDwfyMm4sAXPC7aaR54RKtBVVNJVbOxaWAWQnYebwNySNxfm
 Nsn6ItS2ge/Vas9HjNKIOLW2DBG5jzqG7q1PKxpCe8lu56pCAWgLI01A/B9ATJxQ8m
 IkaceYfGrTFGA==
Date: Mon, 4 Sep 2023 10:36:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 17/23] drm/shmem-helper: Add and use
 drm_gem_shmem_resv_assert_held() helper
Message-ID: <20230904103632.1f88ad89@collabora.com>
In-Reply-To: <73dd54d3-cb36-cb21-6bbb-ff1dd89429a3@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-18-dmitry.osipenko@collabora.com>
 <20230828121239.78a180e6@collabora.com>
 <01930e66-cba2-5d81-7f46-d46907bdd300@collabora.com>
 <20230829092950.3a9c40c1@collabora.com>
 <73dd54d3-cb36-cb21-6bbb-ff1dd89429a3@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Sep 2023 22:43:02 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 8/29/23 10:29, Boris Brezillon wrote:
> > On Tue, 29 Aug 2023 05:34:23 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> On 8/28/23 13:12, Boris Brezillon wrote:  
> >>> On Sun, 27 Aug 2023 20:54:43 +0300
> >>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >>>     
> >>>> In a preparation of adding drm-shmem memory shrinker, move all reservation
> >>>> locking lockdep checks to use new drm_gem_shmem_resv_assert_held() that
> >>>> will resolve spurious lockdep warning about wrong locking order vs
> >>>> fs_reclam code paths during freeing of shmem GEM, where lockdep isn't
> >>>> aware that it's impossible to have locking contention with the fs_reclam
> >>>> at this special time.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>> ---
> >>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 37 +++++++++++++++++---------
> >>>>  1 file changed, 25 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>>> index d96fee3d6166..ca5da976aafa 100644
> >>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>>> @@ -128,6 +128,23 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> >>>>  
> >>>> +static void drm_gem_shmem_resv_assert_held(struct drm_gem_shmem_object *shmem)
> >>>> +{
> >>>> +	/*
> >>>> +	 * Destroying the object is a special case.. drm_gem_shmem_free()
> >>>> +	 * calls many things that WARN_ON if the obj lock is not held.  But
> >>>> +	 * acquiring the obj lock in drm_gem_shmem_free() can cause a locking
> >>>> +	 * order inversion between reservation_ww_class_mutex and fs_reclaim.
> >>>> +	 *
> >>>> +	 * This deadlock is not actually possible, because no one should
> >>>> +	 * be already holding the lock when drm_gem_shmem_free() is called.
> >>>> +	 * Unfortunately lockdep is not aware of this detail.  So when the
> >>>> +	 * refcount drops to zero, we pretend it is already locked.
> >>>> +	 */
> >>>> +	if (kref_read(&shmem->base.refcount))
> >>>> +		drm_gem_shmem_resv_assert_held(shmem);
> >>>> +}
> >>>> +
> >>>>  /**
> >>>>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
> >>>>   * @shmem: shmem GEM object to free
> >>>> @@ -142,8 +159,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>>>  	if (obj->import_attach) {
> >>>>  		drm_prime_gem_destroy(obj, shmem->sgt);
> >>>>  	} else if (!shmem->imported_sgt) {
> >>>> -		dma_resv_lock(shmem->base.resv, NULL);
> >>>> -
> >>>>  		drm_WARN_ON(obj->dev, kref_read(&shmem->vmap_use_count));
> >>>>  
> >>>>  		if (shmem->sgt) {
> >>>> @@ -156,8 +171,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>>>  			drm_gem_shmem_put_pages_locked(shmem);    
> >>>
> >>> AFAICT, drm_gem_shmem_put_pages_locked() is the only function that's
> >>> called in the free path and would complain about resv-lock not being
> >>> held. I think I'd feel more comfortable if we were adding a
> >>> drm_gem_shmem_free_pages() function that did everything
> >>> drm_gem_shmem_put_pages_locked() does except for the lock_held() check
> >>> and the refcount dec, and have it called here (and in
> >>> drm_gem_shmem_put_pages_locked()). This way we can keep using
> >>> dma_resv_assert_held() instead of having our own variant.    
> >>
> >> It's not only drm_gem_shmem_free_pages(), but any drm-shmem function
> >> that drivers may use in the GEM's freeing callback.
> >>
> >> For example, panfrost_gem_free_object() may unpin shmem BO and then do
> >> drm_gem_shmem_free().  
> > 
> > Is this really a valid use case? If the GEM refcount dropped to zero,
> > we should certainly not have pages_pin_count > 0 (thinking of vmap-ed
> > buffers that might disappear while kernel still has a pointer to the
> > CPU-mapped area). The only reason we have this
> > drm_gem_shmem_put_pages_locked() in drm_gem_shmem_free() is because of
> > this implicit ref hold by the sgt, and IMHO, we should be stricter and
> > check that pages_use_count == 1 when sgt != NULL and pages_use_count ==
> > 0 otherwise.
> > 
> > I actually think it's a good thing to try and catch any attempt to call
> > functions trying lock the resv in a path they're not supposed to. At
> > least we can decide whether these actions are valid or not in this
> > context, and provide dedicated helpers for the free path if they are.  
> 
> To me it's a valid use-case. I was going to do it for the virtio-gpu
> driver for a specific BO type that should be permanently pinned in
> memory. So I made the BO pinned in the virto_gpu's bo_create() and
> unpinned it from the virtio-gpu's gem->free(), this is a perfectly valid
> case to me. Though, in the end I switched to another approach that
> doesn't require to do the pinning in the virtio-gpu driver.

Not saying driver-specific gem_create() methods can't own an
implicit ref on pages, but not checking that pages_{use,ref}_count <=
max_implicit_refs means you leave an opportunity for pages ref leaks to
go unnoticed. If your driver has a pin_on_creation flag, it should get a
ref in the creation path, and release this ref in the gem_free() path,
before calling drm_gem_shmem_free(), so the shmem layer can still make
sure there's at most one implicit ref left (the one taken by the sgt
creation logic) in drm_gem_shmem_free().
